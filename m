Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB49A4E92EA
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 12:58:55 +0200 (CEST)
Received: from localhost ([::1]:59038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYn5J-0003Qg-3g
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 06:58:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nYn45-0002WB-LP
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 06:57:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nYn43-0006Wp-Vt
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 06:57:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648465055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ghqeZEwi/n6kn/kYh/eh/XOrtc7gnJ3oZxOtRFslmCI=;
 b=NWJrgJFI7s5bvAb4HwN5zSHl+VP3oZsJR5bm2SCQQ6OtnPXak+aqAy9mhoNXhVrl18wPVI
 ir4V+kJ3iVRc2pC2uPYJgc3z15atcbKzrgYIiyc78lH6hlemvZg9F081apTD/DxaLN3NQT
 BPmN3gjtR58mtbbeGmqkGBNBnzbOVWA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-177-F6LKutgqPJCP9hPh62CYYA-1; Mon, 28 Mar 2022 06:57:25 -0400
X-MC-Unique: F6LKutgqPJCP9hPh62CYYA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DD555101A54C;
 Mon, 28 Mar 2022 10:57:24 +0000 (UTC)
Received: from [10.39.194.130] (unknown [10.39.194.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E7BAC40CF8E8;
 Mon, 28 Mar 2022 10:57:22 +0000 (UTC)
Message-ID: <afcbf95f-0313-20e5-b64e-a7affa2cd8f4@redhat.com>
Date: Mon, 28 Mar 2022 12:57:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 5/5] s390x/tcg: fix format-truncation warning
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20220328084717.367993-1-marcandre.lureau@redhat.com>
 <20220328084717.367993-6-marcandre.lureau@redhat.com>
 <ae138d83-d3b6-3fc0-4279-e804126b9ed4@redhat.com>
 <CAMxuvaxHgVy-JA+XzAKJ4cjGYefpxyE_fmMLRqzPQPjVQKV8yg@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAMxuvaxHgVy-JA+XzAKJ4cjGYefpxyE_fmMLRqzPQPjVQKV8yg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
 David Hildenbrand <david@redhat.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Beniamino Galvani <b.galvani@gmail.com>,
 "open list:S390 SCLP-backed..." <qemu-s390x@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Antony Pavlov <antonynpavlov@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/03/2022 12.22, Marc-André Lureau wrote:
> Hi
> 
> On Mon, Mar 28, 2022 at 12:59 PM Thomas Huth <thuth@redhat.com> wrote:
>>
>> On 28/03/2022 10.47, marcandre.lureau@redhat.com wrote:
>>> From: Marc-André Lureau <marcandre.lureau@redhat.com>
>>>
>>> ../target/s390x/tcg/translate.c: In function ‘s390x_translate_init’:
>>> ../target/s390x/tcg/translate.c:224:64: error: ‘%d’ directive output may be truncated writing between 1 and 11 bytes into a region of size 3 [-Werror=format-truncation=]
>>>     224 |         snprintf(cpu_reg_names[i], sizeof(cpu_reg_names[0]), "r%d", i);
>>>         |                                                                ^~
>>>
>>> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
>>> ---
>>>    target/s390x/tcg/translate.c | 4 ++--
>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
>>> index 5acfc0ff9b4e..a082342a0424 100644
>>> --- a/target/s390x/tcg/translate.c
>>> +++ b/target/s390x/tcg/translate.c
>>> @@ -199,7 +199,7 @@ static TCGv_i64 regs[16];
>>>
>>>    void s390x_translate_init(void)
>>>    {
>>> -    int i;
>>> +    size_t i;
>>>
>>>        psw_addr = tcg_global_mem_new_i64(cpu_env,
>>>                                          offsetof(CPUS390XState, psw.addr),
>>> @@ -221,7 +221,7 @@ void s390x_translate_init(void)
>>>                                       "cc_vr");
>>>
>>>        for (i = 0; i < 16; i++) {
>>> -        snprintf(cpu_reg_names[i], sizeof(cpu_reg_names[0]), "r%d", i);
>>> +        snprintf(cpu_reg_names[i], sizeof(cpu_reg_names[0]), "r%zu", i);
>>
>> The compiler is *really* too stupid to see that i is in the range between 0
>> and 16 here??? ... that rather sounds like a compiler bug to me than
>> something that we should work-around in the QEMU source code. Considering
>> that you're using a x.0 release of GCC, please file a bug against GCC
>> instead. If they refuse to fix it for GCC 12.1 or later, we can revisit this
>> patch, but currently, I really think this should be fixed in GCC instead.
>>
> 
> I opened: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=105080
> 
> Although I think the "workaround" is simple and would avoid users &
> distributions having to add --disable-werror, and possibly miss other
> issues.

But I really dislike adding such noise to the history (it spoils "git blame" 
for example) if it is not really necessary. In this case, it also rather 
helps to show distros that they are shipping a buggy compiler and they 
should fix their compiler instead before it hits their users. So I think it 
would be rather bad to fix this in QEMU now.

  Thomas


