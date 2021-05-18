Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6B7387C7D
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 17:33:54 +0200 (CEST)
Received: from localhost ([::1]:53528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj1jF-0004YX-H6
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 11:33:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lj1Vs-0004Ff-SJ
 for qemu-devel@nongnu.org; Tue, 18 May 2021 11:20:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lj1Vm-0005oS-Tc
 for qemu-devel@nongnu.org; Tue, 18 May 2021 11:20:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621351196;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l3j7Q607Vvi3tQg8Yo82gMyj/seKmWfPL8a4bKPZNcA=;
 b=XKSe2fWA4NNiiyPqgahZD2AsMiSCdbLyrOOinn0szk0hukyoy0i2+35JEY34YR/ZAiixvr
 oAP6QbBCWLhswEn05L6ikqsBQaSHcqYKuKLcwbjUQRPoILoIEZWerjD5M7dElX/OWvuDnZ
 aFbpxP/pto5cBY32O3VpTaInzcPEg3w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-241-aupUfMuvPTyk3KCvt5semQ-1; Tue, 18 May 2021 11:19:53 -0400
X-MC-Unique: aupUfMuvPTyk3KCvt5semQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 866FF9609B0;
 Tue, 18 May 2021 15:19:30 +0000 (UTC)
Received: from [10.10.117.64] (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 51A125C1CF;
 Tue, 18 May 2021 15:19:26 +0000 (UTC)
Subject: Re: [PATCH v2 05/21] qapi/parser: Assert lexer value is a string
To: Markus Armbruster <armbru@redhat.com>
References: <20210511220601.2110055-1-jsnow@redhat.com>
 <20210511220601.2110055-6-jsnow@redhat.com>
 <87lf8c5pid.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <504f3b32-67b8-4c20-bf82-f2d994ffe1b7@redhat.com>
Date: Tue, 18 May 2021 11:19:25 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87lf8c5pid.fsf@dusky.pond.sub.org>
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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

On 5/18/21 6:02 AM, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 
>> The type checker can't narrow the type of the token value to string,
>> because it's only loosely correlated with the return token.
>>
>> We know that a token of '#' should always have a "str" value.
>> Add an assertion.
>>
>> Signed-off-by: John Snow <jsnow@redhat.com>
>> ---
>>   scripts/qapi/parser.py | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
>> index d620706fffb..ba17f1357ad 100644
>> --- a/scripts/qapi/parser.py
>> +++ b/scripts/qapi/parser.py
>> @@ -304,6 +304,7 @@ def get_doc(self, info):
>>           cur_doc = QAPIDoc(self, info)
>>           self.accept(False)
>>           while self.tok == '#':
>> +            assert isinstance(self.val, str)  # comment token MUST have str val
> 
> What does the comment add to the assertion?  Isn't it all obvious?  Just
> wondering; if you genuinely think it isn't, I'm not going to argue.
> Except about the long line, which you could easily avoid:
> 

Yeah, I just suppose it's an artifact from when I was first reading this 
code. It wasn't necessarily obvious to me that comment tokens -- which 
are sometimes squelched -- must always have a str val that is non-None.

I felt like adding an assertion here required SOME kind of justification 
for WHY it was true. Since the val can be None *and* the lexer can omit 
comments, it seemed not expressly self-evident at the time.

Less obvious than, say, why 'tf' values will definitely be True/False. 
Maybe just my own brain bug.

I'm not as attached to it as other things at this point anymore, having 
spent more time in this file since I first wrote it.

Remove if you'd like. The commit message can perform the duty of 
explaining more deeply if people need.

>                 assert isinstance(self.val, str)  # comment value MUST be str
> 
>>               if self.val.startswith('##'):
>>                   # End of doc comment
>>                   if self.val != '##':




