Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5666F52F0
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 10:15:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu7e1-00074C-Hk; Wed, 03 May 2023 04:15:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pu7dz-000742-9q
 for qemu-devel@nongnu.org; Wed, 03 May 2023 04:15:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pu7dv-0006tq-PS
 for qemu-devel@nongnu.org; Wed, 03 May 2023 04:15:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683101719;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=00LTx2tcZ8tjhCfjI6OjnegZulEIG4qo8oYnKJf61YA=;
 b=QIT1xAptdHo3IWgIgLI3/3YEOGuMMc1rMJWCLuEUswjtYqCfpOy398X4Q4zPzijBIz2I0A
 kuFEq+9sR7bxwJy+6W8e1NpwQNv6XecMkXmcinFeizkBLcHqRM9zx2aES3tQnyCiXtKaw4
 GtLqXtcP0Uv6paLssDi7QapSJSceUas=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-582-wwlaz6rEMb-aZlRKQAhNWg-1; Wed, 03 May 2023 04:15:17 -0400
X-MC-Unique: wwlaz6rEMb-aZlRKQAhNWg-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3f170a1fbe7so29250035e9.2
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 01:15:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683101716; x=1685693716;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=00LTx2tcZ8tjhCfjI6OjnegZulEIG4qo8oYnKJf61YA=;
 b=eBkB+kugBe/jvZT2heZc4v8Ww6RT70un6t0hHRkspdMHl4JY0cVDwqCU4w7IRJDhYR
 JgLK38r1KcWPWuSm3Z2+Q7QKIrZeXZN/GP1MBkX19mNgPm+I7FsT3gzbrXWb5+5BQliz
 0l0SH0LbDiDNG3PCMBU6g3mpHTdZyru65XBjUaOteAHDv/Za53qghhANPjaLFJca55wl
 l+8HqAW5f2s21vlsBq2fDXbHzn90tNmAay2DhYx39mM2lG7DylVAOlZn85EZ/0hbQiHZ
 V8K8510mRHDOtRsWHA0yyy7qcYiWDMgekc6W3uLFO1H0zptoH2Gu2igGnWRj4g3XnBEO
 R2/Q==
X-Gm-Message-State: AC+VfDzJEPlbvqQ4OSgYa9q2vdfh67WYboTVS3df0uiTvBEsSApfgWdy
 9zKgQEYd8oZy++sYiixYTpc3jHbOOnk+NOqrrj5ZdrDCLBD+Htz96AQ7i3LXni034JzmG1/T9HQ
 gzx8wpieQW62jwvM=
X-Received: by 2002:a05:600c:24cd:b0:3ef:561d:255d with SMTP id
 13-20020a05600c24cd00b003ef561d255dmr13944036wmu.41.1683101716690; 
 Wed, 03 May 2023 01:15:16 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5a/pYRgkbBLQtJnNt5mVWz5rb+eUzTkNsOn4Qg6AhD2XaCVmMljEo12FzeHKL484KYoR8IqQ==
X-Received: by 2002:a05:600c:24cd:b0:3ef:561d:255d with SMTP id
 13-20020a05600c24cd00b003ef561d255dmr13944023wmu.41.1683101716348; 
 Wed, 03 May 2023 01:15:16 -0700 (PDT)
Received: from ?IPV6:2003:cb:c711:6a00:9109:6424:1804:a441?
 (p200300cbc7116a00910964241804a441.dip0.t-ipconnect.de.
 [2003:cb:c711:6a00:9109:6424:1804:a441])
 by smtp.gmail.com with ESMTPSA id
 h5-20020a1ccc05000000b003ee5fa61f45sm1122959wmb.3.2023.05.03.01.15.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 May 2023 01:15:15 -0700 (PDT)
Message-ID: <57abe9ce-0d79-b25c-1de4-fff6d008ce2d@redhat.com>
Date: Wed, 3 May 2023 10:15:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 9/9] tcg: Remove compatability helpers for qemu ld/st
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "mrolnik@gmail.com" <mrolnik@gmail.com>,
 "edgar.iglesias@gmail.com" <edgar.iglesias@gmail.com>,
 "ale@rev.ng" <ale@rev.ng>, "anjo@rev.ng" <anjo@rev.ng>,
 "laurent@vivier.eu" <laurent@vivier.eu>,
 "philmd@linaro.org" <philmd@linaro.org>,
 "jiaxun.yang@flygoat.com" <jiaxun.yang@flygoat.com>,
 "iii@linux.ibm.com" <iii@linux.ibm.com>, "thuth@redhat.com"
 <thuth@redhat.com>,
 "mark.cave-ayland@ilande.co.uk" <mark.cave-ayland@ilande.co.uk>,
 "atar4qemu@gmail.com" <atar4qemu@gmail.com>,
 "jcmvbkbc@gmail.com" <jcmvbkbc@gmail.com>
References: <20230502135741.1158035-1-richard.henderson@linaro.org>
 <20230502135741.1158035-10-richard.henderson@linaro.org>
 <SN4PR0201MB8808285D0AD10FD1AF9BF21ADE6F9@SN4PR0201MB8808.namprd02.prod.outlook.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <SN4PR0201MB8808285D0AD10FD1AF9BF21ADE6F9@SN4PR0201MB8808.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.422, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 02.05.23 17:39, Taylor Simpson wrote:
> 
> 
>> -----Original Message-----
>> From: Richard Henderson <richard.henderson@linaro.org>
>> Sent: Tuesday, May 2, 2023 8:58 AM
>> To: qemu-devel@nongnu.org
>> Cc: mrolnik@gmail.com; edgar.iglesias@gmail.com; Taylor Simpson
>> <tsimpson@quicinc.com>; ale@rev.ng; anjo@rev.ng; laurent@vivier.eu;
>> philmd@linaro.org; jiaxun.yang@flygoat.com; david@redhat.com;
>> iii@linux.ibm.com; thuth@redhat.com; mark.cave-ayland@ilande.co.uk;
>> atar4qemu@gmail.com; jcmvbkbc@gmail.com
>> Subject: [PATCH 9/9] tcg: Remove compatability helpers for qemu ld/st
>>
>> Remove the old interfaces with the implicit MemOp argument.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   include/tcg/tcg-op.h | 55 --------------------------------------------
>>   1 file changed, 55 deletions(-)
>>
>> diff --git a/include/tcg/tcg-op.h b/include/tcg/tcg-op.h index
>> dff17c7072..4401fa493c 100644
>> --- a/include/tcg/tcg-op.h
>> +++ b/include/tcg/tcg-op.h
>> @@ -841,61 +841,6 @@ void tcg_gen_qemu_st_i64(TCGv_i64, TCGv,
>> TCGArg, MemOp);  void tcg_gen_qemu_ld_i128(TCGv_i128, TCGv, TCGArg,
>> MemOp);  void tcg_gen_qemu_st_i128(TCGv_i128, TCGv, TCGArg, MemOp);
>>
>> -static inline void tcg_gen_qemu_ld8u(TCGv ret, TCGv addr, int mem_index)
>> -{
>> -    tcg_gen_qemu_ld_tl(ret, addr, mem_index, MO_UB);
>> -}
>> -
>> -static inline void tcg_gen_qemu_ld8s(TCGv ret, TCGv addr, int mem_index)
>> -{
>> -    tcg_gen_qemu_ld_tl(ret, addr, mem_index, MO_SB);
>> -}
>> -
>> -static inline void tcg_gen_qemu_ld16u(TCGv ret, TCGv addr, int
>> mem_index) -{
>> -    tcg_gen_qemu_ld_tl(ret, addr, mem_index, MO_TEUW);
>> -}
>> -
>> -static inline void tcg_gen_qemu_ld16s(TCGv ret, TCGv addr, int mem_index)
>> -{
>> -    tcg_gen_qemu_ld_tl(ret, addr, mem_index, MO_TESW);
>> -}
>> -
>> -static inline void tcg_gen_qemu_ld32u(TCGv ret, TCGv addr, int
>> mem_index) -{
>> -    tcg_gen_qemu_ld_tl(ret, addr, mem_index, MO_TEUL);
>> -}
>> -
>> -static inline void tcg_gen_qemu_ld32s(TCGv ret, TCGv addr, int mem_index)
>> -{
>> -    tcg_gen_qemu_ld_tl(ret, addr, mem_index, MO_TESL);
>> -}
>> -
>> -static inline void tcg_gen_qemu_ld64(TCGv_i64 ret, TCGv addr, int
>> mem_index) -{
>> -    tcg_gen_qemu_ld_i64(ret, addr, mem_index, MO_TEUQ);
>> -}
>> -
>> -static inline void tcg_gen_qemu_st8(TCGv arg, TCGv addr, int mem_index) -
>> {
>> -    tcg_gen_qemu_st_tl(arg, addr, mem_index, MO_UB);
>> -}
>> -
>> -static inline void tcg_gen_qemu_st16(TCGv arg, TCGv addr, int mem_index)
>> -{
>> -    tcg_gen_qemu_st_tl(arg, addr, mem_index, MO_TEUW);
>> -}
>> -
>> -static inline void tcg_gen_qemu_st32(TCGv arg, TCGv addr, int mem_index)
>> -{
>> -    tcg_gen_qemu_st_tl(arg, addr, mem_index, MO_TEUL);
>> -}
>> -
>> -static inline void tcg_gen_qemu_st64(TCGv_i64 arg, TCGv addr, int
>> mem_index) -{
>> -    tcg_gen_qemu_st_i64(arg, addr, mem_index, MO_TEUQ);
>> -}
>> -
>>   void tcg_gen_atomic_cmpxchg_i32(TCGv_i32, TCGv, TCGv_i32, TCGv_i32,
>>                                   TCGArg, MemOp);  void
>> tcg_gen_atomic_cmpxchg_i64(TCGv_i64, TCGv, TCGv_i64, TCGv_i64,
> 
> 
> Is the intent that all loads use tcg_gen_qemu_ld_* and all stores use tcg_gen_qemu_st_*?
> 
> If so, there are other helpers to remove.  For example,
>      tcg_gen_ld32u_i64
>      tcg_gen_st8_i64

At least the patch description + cover letter talks about "helpers for 
qemu ld/st", so these two would not fall into the context of this patch 
(and series).

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


