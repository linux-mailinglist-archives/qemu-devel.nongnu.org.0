Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7260D36C7A5
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 16:18:47 +0200 (CEST)
Received: from localhost ([::1]:46938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbOY2-0000rQ-IP
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 10:18:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lbOUw-0000BD-QJ
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 10:15:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lbOUv-00047h-74
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 10:15:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619532932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rxk6ND6L+FBWvlRKWT1/Vi2mLmPMv5WBBgWaFfsXGJg=;
 b=QAGYrPKHVHBVUuE34UznhsVRkPaEVEFffbyhSDIBLcvHmVBmuk7AvhFASa5WOl5TACrGpc
 tc//FuItoBtVPV5moHut9Mn1t4tWHPNy6Oljc/dgjXYT2Sf6kjjpAobKX54/ocjRUPm3DX
 I9h5leI/wxTMTBNNCMoEQbmoZuWDFMg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-sG8SpQZtMpChXWCTAF1LvQ-1; Tue, 27 Apr 2021 10:15:30 -0400
X-MC-Unique: sG8SpQZtMpChXWCTAF1LvQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9F6B510054F6;
 Tue, 27 Apr 2021 14:15:29 +0000 (UTC)
Received: from [10.10.112.236] (ovpn-112-236.rdu2.redhat.com [10.10.112.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A6B8560FC2;
 Tue, 27 Apr 2021 14:15:27 +0000 (UTC)
Subject: Re: [PATCH 07/22] qapi/parser: assert object keys are strings
To: Markus Armbruster <armbru@redhat.com>
References: <20210422030720.3685766-1-jsnow@redhat.com>
 <20210422030720.3685766-8-jsnow@redhat.com>
 <87eeey962x.fsf@dusky.pond.sub.org>
 <822441ee-e877-d4dd-9078-d0a930d140d2@redhat.com>
 <87sg3c6yqg.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <b97a9eab-67c0-fb43-2406-5722ab9e1baf@redhat.com>
Date: Tue, 27 Apr 2021 10:15:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87sg3c6yqg.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.218,
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
Cc: Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/27/21 2:13 AM, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 
>> On 4/25/21 3:27 AM, Markus Armbruster wrote:
>>> John Snow <jsnow@redhat.com> writes:
>>>
>>>> The single quote token implies the value is a string. Assert this to be
>>>> the case.
>>>>
>>>> Signed-off-by: John Snow <jsnow@redhat.com>
>>>> ---
>>>>    scripts/qapi/parser.py | 2 ++
>>>>    1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
>>>> index 6b443b1247e..8d1fe0ddda5 100644
>>>> --- a/scripts/qapi/parser.py
>>>> +++ b/scripts/qapi/parser.py
>>>> @@ -246,6 +246,8 @@ def get_members(self):
>>>>                raise QAPIParseError(self, "expected string or '}'")
>>>>            while True:
>>>>                key = self.val
>>>> +            assert isinstance(key, str)  # Guaranteed by tok == "'"
>>>> +
>>>>                self.accept()
>>>>                if self.tok != ':':
>>>>                    raise QAPIParseError(self, "expected ':'")
>>>
>>> The assertion is correct, but I wonder why mypy needs it.  Can you help?
>>>
>>
>> The lexer value can also be True/False (Maybe None? I forget) based on
> 
> Yes, None for tokens like '{'.
> 
>> the Token returned. Here, since the token was the single quote, we know
>> that value must be a string.
>>
>> Mypy has no insight into the correlation between the Token itself and
>> the token value, because that relationship is not expressed via the type
>> system.
> 
> I understand that mypy can't prove implications like if self.tok == "'",
> then self.val is a str.
> 
> What I'm curious about is why key needs to be known to be str here.
> Hmm, is it so return expr type-checks once you add -> OrderedDict[str,
> object] to the function?
> 

Oh, yes.


