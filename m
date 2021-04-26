Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8127036B861
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 19:53:31 +0200 (CEST)
Received: from localhost ([::1]:36450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lb5QI-0002Oe-JV
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 13:53:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lb5OX-0001Up-6f
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 13:51:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lb5OV-00018x-9m
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 13:51:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619459498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S5Bx115t+ORJfqZPWwsjv0Vo89sFelXh+BTYMlkW6cQ=;
 b=IEJIaTeKUwyjXQydRgkhS9jCOe/wTYA29bkspOxkPe4EyvYPMb/SlmtfwrusiclciUCbOP
 eYwAa83e5MGFgfbQlNA/43bzTDc+rxKU+omfjaMc1Dx4JvkVNbS2qLl7vsu6VD7kTQL2qD
 iaLDRssVS6pKW6wpTAPhpaVc+3PEKPs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153-bqZN4yISO8ifSMW3auAygA-1; Mon, 26 Apr 2021 13:51:36 -0400
X-MC-Unique: bqZN4yISO8ifSMW3auAygA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 519F187A83E;
 Mon, 26 Apr 2021 17:51:35 +0000 (UTC)
Received: from [10.10.120.13] (ovpn-120-13.rdu2.redhat.com [10.10.120.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CC31B10016FC;
 Mon, 26 Apr 2021 17:51:34 +0000 (UTC)
Subject: Re: [PATCH 10/22] qapi/parser: Fix typing of token membership tests
To: Markus Armbruster <armbru@redhat.com>
References: <20210422030720.3685766-1-jsnow@redhat.com>
 <20210422030720.3685766-11-jsnow@redhat.com>
 <87v98a7q23.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <78cf87ce-ce02-d9d6-0922-84a328b6b9da@redhat.com>
Date: Mon, 26 Apr 2021 13:51:34 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87v98a7q23.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
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

On 4/25/21 3:59 AM, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 
>> When the token can be None, we can't use 'x in "abc"' style membership
>> tests to group types of tokens together, because 'None in "abc"' is a
>> TypeError.
>>
>> Easy enough to fix, if not a little ugly.
>>
>> Signed-off-by: John Snow <jsnow@redhat.com>
>> ---
>>   scripts/qapi/parser.py | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
>> index 7f3c009f64b..16fd36f8391 100644
>> --- a/scripts/qapi/parser.py
>> +++ b/scripts/qapi/parser.py
>> @@ -272,7 +272,7 @@ def get_values(self):
>>           if self.tok == ']':
>>               self.accept()
>>               return expr
>> -        if self.tok not in "{['tf":
>> +        if self.tok is None or self.tok not in "{['tf":
>>               raise QAPIParseError(
>>                   self, "expected '{', '[', ']', string, or boolean")
>>           while True:
>> @@ -294,7 +294,8 @@ def get_expr(self, nested):
>>           elif self.tok == '[':
>>               self.accept()
>>               expr = self.get_values()
>> -        elif self.tok in "'tf":
>> +        elif self.tok and self.tok in "'tf":
>> +            assert isinstance(self.val, (str, bool))
>>               expr = self.val
>>               self.accept()
>>           else:
> 
> How can self.tok be None?
> 
> I suspect this is an artifact of PATCH 04.  Before, self.tok is
> initialized to the first token, then set to subsequent tokens (all str)
> in turn.  After, it's initialized to None, then set to tokens in turn.
> 

Actually, it's set to None to represent EOF. See here:

             elif self.tok == '\n':
	        if self.cursor == len(self.src):
                     self.tok = None
                     return

A more pythonic idiom would be to create a lexer class that behaves as 
an iterator, yielding Token class objects, and eventually, raising 
StopIteration.

(Not suggesting I do that now. I have thought about it though, yes.)

--js


