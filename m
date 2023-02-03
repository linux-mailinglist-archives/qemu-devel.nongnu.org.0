Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F83968A4A6
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 22:30:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pO3cx-0008FL-Fo; Fri, 03 Feb 2023 16:29:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pO3cn-000852-FQ
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 16:29:40 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pO3cf-0000gy-UW
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 16:29:31 -0500
Received: by mail-pg1-x529.google.com with SMTP id e10so4517233pgc.9
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 13:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vDsxF3EMd0SWurlsQOrOfzaJHeUClqw3x60y4c9W5ec=;
 b=SWeorVxPYNlD7C9V7PAmSjNDTF04Dzxqi/O/GXNFSubu4CruHTceKcMkRV+2NFNR6E
 p30Q5auGVSHmK1+ueuGLKvPa3reOzgi5GIWFe8XQi4pSixnsq4AjUvLb18ZME9xuSSd/
 bEWU9FOZoWshYeOu3eM3PL3PNgevDurqAEXG2dhKAwyNHBz4/GmwTc40ZJt4r51p7wH9
 UPsgEnEBNNj67WmBYQ/luPTeUtCrnJFvRta71aPw7y48fCsiZ0qTDs7RTJjt7IT0Cy/S
 sv2HPSX/0rORw3XGwGdT2hCDiVhof+pdaachp9xvhyPd5FB9sNpO+dTnObOxUnZH1VqS
 Jw6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vDsxF3EMd0SWurlsQOrOfzaJHeUClqw3x60y4c9W5ec=;
 b=vQRnTe4UTi+2gNG+hGkJpLQgxVfqFVmWTx5BgGwzhWl3uzSp6IYqoaZ9q1mb5iGQS+
 0p+D+wVuewTrrFHMXymIoZAYwrhbjZYCSxl4oqG8egCmKbmMICd9jfHVpDnjiazBZvJD
 kJhnfLxGoNhx5GLGSN8BiFvWBHbnbG/xjiGh5U06jPCZkd7lor5eJfkecTuYjP8aHgxK
 xix7nSdxKmRxKEVe+/jPoj2qcPfYh8OBpQzrKIiVPBg5QkXv8Cfpn/przMvSzEzEMA/6
 jBqxjca+Pw7/yrbTYImNHv+CKCs6sLwTZbmqDbrBBpQ0tFMBW5QrpqZHg+861Aj03680
 UcVw==
X-Gm-Message-State: AO0yUKUDS57k4ppPm4n4oHaNaHxA26w7TRr/VQLvgq4wSnaFq38hrukt
 3uNaK/hpBs1cS9Zx57UI6Xi9NA==
X-Google-Smtp-Source: AK7set/eFvn0sSFzNyQIrIOE5i19JEHqmSnkwYFYbwY0YvyvQoWam/EH0wTwO4jiQSQQouZwOKxabQ==
X-Received: by 2002:a05:6a00:278c:b0:57f:c170:dc6 with SMTP id
 bd12-20020a056a00278c00b0057fc1700dc6mr10346956pfb.14.1675459768271; 
 Fri, 03 Feb 2023 13:29:28 -0800 (PST)
Received: from [192.168.50.177] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 c200-20020a621cd1000000b00587c11bc925sm2279499pfc.168.2023.02.03.13.29.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Feb 2023 13:29:27 -0800 (PST)
Message-ID: <cb3c233d-6d0a-35a4-cd90-4b1f738b043e@linaro.org>
Date: Fri, 3 Feb 2023 11:29:24 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] accel/tcg: test CPUJumpCache in tb_jmp_cache_clear_page()
Content-Language: en-US
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 peter.maydell@linaro.org, pbonzini@redhat.com, qemu-devel@nongnu.org
Cc: iii@linux.ibm.com
References: <20230203171510.2867451-1-eric.auger@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230203171510.2867451-1-eric.auger@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 2/3/23 07:15, Eric Auger wrote:
> After commit 4e4fa6c12d ("accel/tcg: Complete cpu initialization
> before registration"), it looks the CPUJumpCache handle can be NULL.
> This causes a SIGSEV when running debug-wp-migration kvm unit test.
> 
> At the first place it should be clarified why this TCG code is called
> with KVM acceleration. This may hide another bug.
> 
> Fixes: 4e4fa6c12d ("accel/tcg: Complete cpu initialization before registration")
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>   accel/tcg/cputlb.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
> index 4e040a1cb9..ac0245ee6c 100644
> --- a/accel/tcg/cputlb.c
> +++ b/accel/tcg/cputlb.c
> @@ -103,6 +103,10 @@ static void tb_jmp_cache_clear_page(CPUState *cpu, target_ulong page_addr)
>       int i, i0 = tb_jmp_cache_hash_page(page_addr);
>       CPUJumpCache *jc = cpu->tb_jmp_cache;
>   
> +    if (!jc) {
> +        return;
> +    }

While I think we shouldn't arrive here for KVM, it was previously not an error to do so. 
I'm going to go ahead and queue this while the correct cpregs change gets worked out.


r~


