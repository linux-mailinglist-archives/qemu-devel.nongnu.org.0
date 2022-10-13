Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A07D5FE375
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 22:43:29 +0200 (CEST)
Received: from localhost ([::1]:33404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj53A-00016C-HP
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 16:43:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oj4vF-0003vL-VC
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 16:35:24 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:45774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oj4vE-0002RE-4T
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 16:35:17 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 o9-20020a17090a0a0900b0020ad4e758b3so2894742pjo.4
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 13:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JR6evI19xXKGI3mjU4yvYUQfbj0iWH0QgxekktTuz8Y=;
 b=BeGWYzyXjr0+62MCw98seEuoSL15aPqe9JmJ3ycIHbUG/pcUJ17ziCQ76JoPJencK1
 8tQacpbiLe3pgqQJS6sX57AnZM527AKsAcR8TK9RXPWQzzlDb0Rd1Om/4FKIKokYkUSa
 fNWz5uYvNboivFvwnhRnPcl47N1Oj3EqaUhnnxBEu+pqbUoKXyEYyx7WPHli2VJ/r2nX
 5zpBfZrVSKkOPHl3Hjzt9ItCRLCQpq5hJg6N0IY+hElX7Dk7RGd4QxGl24k8w0csAhIO
 J7YPdRxnPSGGPW6oB6/ZUYg3kWhJ5wrHwQqcW7YhaiYfDmYKoroZoSB25rlvHnkhh8jV
 sanw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JR6evI19xXKGI3mjU4yvYUQfbj0iWH0QgxekktTuz8Y=;
 b=l8PPOGO7WkbxyW3v7N8BPDBJSQe3X7AsbUmJk3j/r38P3OEsGW1947DQT5GeNnkQXV
 pQs0rFjOrzro/IbEtZe4xQwD9z8XHrtQepPtF+vmyRWP4H/NgEjdXzCF67i2VrCeWqfK
 R+R+t1DPQeaf+t2X7Ad+eVLbil2V9vE4AZE6KGDMpYDLJ4KSvLUWNChjVlFzcOVxPnVG
 ZEcn1nvDX29HCWog4xG2+2CakpozOQgA2/8NcB7rlkfqWfJIN6mOHOC6f27w49A9nKAz
 UhKfrB72J7eoTObIVsd9xkXVvDawbS6urrzHJlTYGKylUsYbSS4r9YwYWre9eaLo4dxr
 to5w==
X-Gm-Message-State: ACrzQf1onMOLsMuXwNLPqEvcf7dG25xYv29f+/Il2x4VGDzPEQNQoRcy
 who93GMoP8o35plFbr+sXXMIxQ==
X-Google-Smtp-Source: AMsMyM5/QGOTrKfd1Uyfmt+pDWoQ8maCvisFmZo3/8p6+Hhb4thHg2OtOH1oj/T176Oq/nwa16XhHw==
X-Received: by 2002:a17:902:f786:b0:180:6f9e:23b with SMTP id
 q6-20020a170902f78600b001806f9e023bmr1810210pln.37.1665693314465; 
 Thu, 13 Oct 2022 13:35:14 -0700 (PDT)
Received: from [10.1.28.222] (110-175-13-142.static.tpgi.com.au.
 [110.175.13.142]) by smtp.gmail.com with ESMTPSA id
 x2-20020a170902a38200b00177ff4019d9sm236094pla.274.2022.10.13.13.35.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Oct 2022 13:35:13 -0700 (PDT)
Message-ID: <cd7d0223-f539-982b-cc52-96b9c2f7b1ad@linaro.org>
Date: Fri, 14 Oct 2022 07:35:08 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 1/1] tcg: add perfmap and jitdump
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>
Cc: "Vanderson M . do Rosario" <vandersonmr2@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-devel@nongnu.org
References: <20221012051846.1432050-1-iii@linux.ibm.com>
 <20221012051846.1432050-2-iii@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221012051846.1432050-2-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.25,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/12/22 22:18, Ilya Leoshkevich wrote:
> Add ability to dump /tmp/perf-<pid>.map and jit-<pid>.dump.
> The first one allows the perf tool to map samples to each individual
> translation block. The second one adds the ability to resolve symbol
> names, line numbers and inspect JITed code.
> 
> Example of use:
> 
>      perf record qemu-x86_64 -perfmap ./a.out
>      perf report
> 
> or
> 
>      perf record -k 1 qemu-x86_64 -jitdump ./a.out
>      perf inject -j -i perf.data -o perf.data.jitted
>      perf report -i perf.data.jitted
> 
> Co-developed-by: Vanderson M. do Rosario <vandersonmr2@gmail.com>
> Co-developed-by: Alex Bennée <alex.bennee@linaro.org>
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>

I think I remember this, and the question that was never answered was:

> @@ -1492,6 +1493,8 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
>       }
>       tb->tc.size = gen_code_size;
>   
> +    perf_report_code(gen_code_buf, gen_code_size, tb->icount, tb->pc);

When do_tb_flush is called, everything that is recorded in perfmap is invalidated.
How do you tell perf about that?


r~


