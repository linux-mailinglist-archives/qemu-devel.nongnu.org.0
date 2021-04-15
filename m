Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 609D0360F01
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 17:29:49 +0200 (CEST)
Received: from localhost ([::1]:47234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX3wC-0000iu-Hd
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 11:29:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lX3vA-00006I-NY
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 11:28:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lX3v8-0002PN-F1
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 11:28:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618500521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ylSQA9EkPa2i8acTMLEJ7IeA3v2ef/TIjU6kvAiY5js=;
 b=f/YPvcgeyg8Ut00f3qLI5j2JE2CL17nZ1IrAco3wnWNrIJ7chCAevPrwBwLAr/lwF+H+Be
 kSh5L++46pFd0a2k2qpPdlxdMsqkzaNw1UmRLr74v5YXUv8zkNgCUdePpEBc85FS+/8Qk7
 z2bulzb8zLRzk9IpN8w/Ifbv2nyP+rg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-279-WV-iiReUMuGweXQhzBSCEA-1; Thu, 15 Apr 2021 11:28:36 -0400
X-MC-Unique: WV-iiReUMuGweXQhzBSCEA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DC6268030D0;
 Thu, 15 Apr 2021 15:28:34 +0000 (UTC)
Received: from [10.10.117.61] (ovpn-117-61.rdu2.redhat.com [10.10.117.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E36D55C3E4;
 Thu, 15 Apr 2021 15:28:33 +0000 (UTC)
Subject: Re: [PATCH v2 1/8] qapi/error: Repurpose QAPIError as a generic
 exception base class
To: Markus Armbruster <armbru@redhat.com>
References: <20210330171844.1197918-1-jsnow@redhat.com>
 <20210330171844.1197918-2-jsnow@redhat.com>
 <87mtu0gi6u.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <662c4eae-f704-37b4-9d89-f3bbf9108ec2@redhat.com>
Date: Thu, 15 Apr 2021 11:28:33 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87mtu0gi6u.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-devel@nongnu.org,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/15/21 2:44 AM, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 
>> Rename QAPIError to QAPISourceError, and then create a new QAPIError
>> class that serves as the basis for all of our other custom exceptions.
> 
> Isn't the existing QAPIError such a base class already?  Peeking
> ahead...  aha, your new base class is abstract.  Can you explain why we
> that's useful?
> 

Sure. The existing QAPIError class assumes that it's an error that has a 
source location, but not all errors will. The idea is that an abstract 
error class can be used as the ancestor for all other errors in a 
type-safe way, such that:

try:
     qapi.something_or_other()
except QAPIError as err:
     err.some_sort_of_method()

(1) This is a type-safe construct, and
(2) This is sufficient to catch all errors that originate from within 
the library, regardless of their exact type.

Primarily, it's a ploy to get the SourceInfo stuff out of the 
common/root exception for type safety reasons.

(Later in the series, you'll see there's a few places where we try to 
fake SourceInfo stuff in order to use QAPIError, by shuffling this 
around, we allow ourselves to raise exceptions that don't need this 
hackery.)

>> Add docstrings to explain the intended function of each error class.
>>
>> Signed-off-by: John Snow <jsnow@redhat.com>
>> ---
>>   docs/sphinx/qapidoc.py |  3 ++-
>>   scripts/qapi/error.py  | 11 +++++++++--
>>   scripts/qapi/schema.py |  5 +++--
>>   3 files changed, 14 insertions(+), 5 deletions(-)
>>
>> diff --git a/docs/sphinx/qapidoc.py b/docs/sphinx/qapidoc.py
>> index b7b86b5dff..458b1f477e 100644
>> --- a/docs/sphinx/qapidoc.py
>> +++ b/docs/sphinx/qapidoc.py
>> @@ -34,7 +34,8 @@
>>   from sphinx.util.nodes import nested_parse_with_titles
>>   import sphinx
>>   from qapi.gen import QAPISchemaVisitor
>> -from qapi.schema import QAPIError, QAPISemError, QAPISchema
>> +from qapi.error import QAPIError, QAPISemError
>> +from qapi.schema import QAPISchema
>>   
>>   
>>   # Sphinx up to 1.6 uses AutodocReporter; 1.7 and later
>> diff --git a/scripts/qapi/error.py b/scripts/qapi/error.py
>> index ae60d9e2fe..126dda7c9b 100644
>> --- a/scripts/qapi/error.py
>> +++ b/scripts/qapi/error.py
>> @@ -13,6 +13,11 @@
>>   
>>   
>>   class QAPIError(Exception):
>> +    """Base class for all exceptions from the QAPI package."""
>> +
>> +
>> +class QAPISourceError(QAPIError):
>> +    """Error class for all exceptions identifying a source location."""
>>       def __init__(self, info, col, msg):
>>           Exception.__init__(self)
>>           self.info = info
>> @@ -27,7 +32,8 @@ def __str__(self):
>>           return loc + ': ' + self.msg
>>   
>>   
>> -class QAPIParseError(QAPIError):
>> +class QAPIParseError(QAPISourceError):
>> +    """Error class for all QAPI schema parsing errors."""
>>       def __init__(self, parser, msg):
>>           col = 1
>>           for ch in parser.src[parser.line_pos:parser.pos]:
>> @@ -38,6 +44,7 @@ def __init__(self, parser, msg):
>>           super().__init__(parser.info, col, msg)
>>   
>>   
>> -class QAPISemError(QAPIError):
>> +class QAPISemError(QAPISourceError):
>> +    """Error class for semantic QAPI errors."""
>>       def __init__(self, info, msg):
>>           super().__init__(info, None, msg)
>> diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
>> index 01cdd753cd..1849c3e45f 100644
>> --- a/scripts/qapi/schema.py
>> +++ b/scripts/qapi/schema.py
>> @@ -20,7 +20,7 @@
>>   from typing import Optional
>>   
>>   from .common import POINTER_SUFFIX, c_name
>> -from .error import QAPIError, QAPISemError
>> +from .error import QAPISemError, QAPISourceError
>>   from .expr import check_exprs
>>   from .parser import QAPISchemaParser
>>   
>> @@ -878,7 +878,8 @@ def _def_entity(self, ent):
>>           other_ent = self._entity_dict.get(ent.name)
>>           if other_ent:
>>               if other_ent.info:
>> -                where = QAPIError(other_ent.info, None, "previous definition")
>> +                where = QAPISourceError(other_ent.info, None,
>> +                                        "previous definition")
>>                   raise QAPISemError(
>>                       ent.info,
>>                       "'%s' is already defined\n%s" % (ent.name, where))


