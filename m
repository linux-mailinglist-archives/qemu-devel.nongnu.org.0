Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B4436B84B
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 19:49:28 +0200 (CEST)
Received: from localhost ([::1]:54254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lb5MN-0006NX-Bi
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 13:49:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lb5Js-0005IU-Jf
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 13:46:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lb5Jq-0007Mb-Pj
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 13:46:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619459208;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=As58xyqBhmh7LWrEwhh8NwsboY2I5rJ4/W54I+HEl4c=;
 b=geIp+r+I0rP23cOYeE+a8TFECgZMjAkSWsKS/1GeIE3zyEJsSYnyKyITU0DtZ2T3vOg59b
 XCAay3cWOUgSMfjekJkDBDIlx+9sWBo4BXynHX5iiyCLM4BuP85wamW85Zh7b1TSododHq
 AygEYwujT22jtbSYHmWz0mR9wRQhpSQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-512-BD0f6IwsOHS2rwo37qzEeg-1; Mon, 26 Apr 2021 13:46:47 -0400
X-MC-Unique: BD0f6IwsOHS2rwo37qzEeg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 847D9801FCE;
 Mon, 26 Apr 2021 17:46:29 +0000 (UTC)
Received: from [10.10.120.13] (ovpn-120-13.rdu2.redhat.com [10.10.120.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 76E4910016FC;
 Mon, 26 Apr 2021 17:46:28 +0000 (UTC)
Subject: Re: [PATCH 07/22] qapi/parser: assert object keys are strings
To: Markus Armbruster <armbru@redhat.com>
References: <20210422030720.3685766-1-jsnow@redhat.com>
 <20210422030720.3685766-8-jsnow@redhat.com>
 <87eeey962x.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <822441ee-e877-d4dd-9078-d0a930d140d2@redhat.com>
Date: Mon, 26 Apr 2021 13:46:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87eeey962x.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
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
Cc: Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/25/21 3:27 AM, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 
>> The single quote token implies the value is a string. Assert this to be
>> the case.
>>
>> Signed-off-by: John Snow <jsnow@redhat.com>
>> ---
>>   scripts/qapi/parser.py | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
>> index 6b443b1247e..8d1fe0ddda5 100644
>> --- a/scripts/qapi/parser.py
>> +++ b/scripts/qapi/parser.py
>> @@ -246,6 +246,8 @@ def get_members(self):
>>               raise QAPIParseError(self, "expected string or '}'")
>>           while True:
>>               key = self.val
>> +            assert isinstance(key, str)  # Guaranteed by tok == "'"
>> +
>>               self.accept()
>>               if self.tok != ':':
>>                   raise QAPIParseError(self, "expected ':'")
> 
> The assertion is correct, but I wonder why mypy needs it.  Can you help?
> 

The lexer value can also be True/False (Maybe None? I forget) based on 
the Token returned. Here, since the token was the single quote, we know 
that value must be a string.

Mypy has no insight into the correlation between the Token itself and 
the token value, because that relationship is not expressed via the type 
system.

--js


