Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1847B67D726
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 22:02:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL9NX-0004R0-Nc; Thu, 26 Jan 2023 16:01:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pL9NR-0004Qg-MX
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 16:01:45 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pL9NP-0003iJ-RP
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 16:01:45 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 x2-20020a17090a46c200b002295ca9855aso6564081pjg.2
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 13:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=m577/QMwEEyrSKTqL+jOZTQgktLDeab6arwZkLtFU6k=;
 b=HiDy6lOaqOf+x7aG5ArAHKJZXU/dMUN0AJMCUhfK5j4hLVxUg7cTQfo9bOrzCqAsCV
 9CvzRG3kP9ml8B0UVjrvg2Q5JUXvTeRwYCPFcWOe153j3oeUW89udZnq5Ik4RVk2kID+
 QtpL17lPl7SxW0Hxu1/N3hOME9BcgA6DBM42kj+e6zTJ+lHSE1bVfgDch8NX8x6vUKAA
 ESWgpnC8WqBWLnoMmazBVAD9u/ewboEmAwqeD1LEfVOamW1fArdYWABcb1CU0kLreDf8
 K6Agqztcz/2O8h32n7xlXuuo1eN9tx0DNSq5x6PNaWpF/4k8Od5CmfL1bi6ZEvuF6kA0
 i8AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=m577/QMwEEyrSKTqL+jOZTQgktLDeab6arwZkLtFU6k=;
 b=t7O5WPclSUm9aYwa9lcAereJu64aOrXQQdzzBlLqEBq/7qzhPPPLPXVwZ7bczINQ37
 qVbElIfdYlwtm1M3ZjE1H4TGRIaHzPmTCwr/M4UUtKky7mM2QnzCaxCz54jBlDDJWwjU
 tddHueY7LZCZ6OPYUg71ZqcxpcyY14l44dombnyssXxH3jt0ghkCUexfDTMocyBn0XBY
 OJ+Myj+hBTl8gCRIacydfOK5eGXKu831iBzyjEdBKfOl/iGfpAZ/jycHpGSQZoW2uKS4
 ixZJ/4FdOMe0I0n+1s42EFlxB6eyLdG1+v6xaX6cpVotWIA4Pq6z/I7RTuJnt5KxVixO
 ABew==
X-Gm-Message-State: AO0yUKWi/jIJ5o82ktWKAS1RodaeJ6jsBq5gzBKUY4bEoZHJr5dWg0qO
 T8gBCz/fWt9mXRBfdaRvQRiaaw==
X-Google-Smtp-Source: AK7set+3UNf9E2Cxi/VhiZtGFe8RKziqiAkVsSCvjQqOvAPwxNiSTy/L0Y+jsgq1sLwN2+Ae1907tQ==
X-Received: by 2002:a17:902:e80d:b0:191:3098:8b with SMTP id
 u13-20020a170902e80d00b001913098008bmr3591386plg.58.1674766901745; 
 Thu, 26 Jan 2023 13:01:41 -0800 (PST)
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 k14-20020a170902ce0e00b0018c990ce7fesm1371263plg.239.2023.01.26.13.01.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jan 2023 13:01:41 -0800 (PST)
Message-ID: <49c17ab2-c179-724a-0f60-5ff43e9af54e@linaro.org>
Date: Thu, 26 Jan 2023 11:01:37 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v5 32/36] target/s390x: Use tcg_gen_atomic_cmpxchg_i128
 for CDSG
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, Ilya Leoshkevich <iii@linux.ibm.com>
References: <20230126043824.54819-1-richard.henderson@linaro.org>
 <20230126043824.54819-33-richard.henderson@linaro.org>
 <b3fcf846-1bc9-84e7-0adb-4a7eb1e9ec80@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <b3fcf846-1bc9-84e7-0adb-4a7eb1e9ec80@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.15,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 1/26/23 01:27, David Hildenbrand wrote:
>>   static DisasJumpType op_csst(DisasContext *s, DisasOps *o)
>> @@ -5419,6 +5410,14 @@ static void prep_r1_P(DisasContext *s, DisasOps *o)
>>   }
>>   #define SPEC_prep_r1_P SPEC_r1_even
>> +static void prep_r1_D64(DisasContext *s, DisasOps *o)
>> +{
>> +    int r1 = get_field(s, r1);
>> +    o->out_128 = tcg_temp_new_i128();
>> +    tcg_gen_concat_i64_i128(o->out_128, regs[r1 + 1], regs[r1]);
> 
> I really wonder if we should simply move the tcg_gen_concat_i64_i128() into the op and use 
> a generic "allocate out_128" instead.
> 
> At least that part here confused me heavily.

Just the prep_r1_D64 bit of it?

Better for you as


     C(0xeb3e, CDSG,    RSY_a, Z,   la2, r3_D64, 0, r1_D64, cdsg, 0)


  static DisasJumpType op_cdsg(DisasContext *s, DisasOps *o)
  {
      int r1 = get_field(s, r1);
+    o->out_128 = tcg_temp_new_i128();
+    tcg_gen_concat_i64_i128(o->out_128, regs[r1 + 1], regs[r1]);


The existing generic "allocate out_128" is named "new_x", which I thought was also 
confusing, since this isn't an "x" format operation.  Since there's only one use, I did it 
inline.


r~

