Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0786932DB
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Feb 2023 18:32:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQthu-0001yv-7w; Sat, 11 Feb 2023 12:30:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pQthp-0001wv-CD
 for qemu-devel@nongnu.org; Sat, 11 Feb 2023 12:30:36 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pQthm-0000yt-NU
 for qemu-devel@nongnu.org; Sat, 11 Feb 2023 12:30:32 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 n20-20020a17090aab9400b00229ca6a4636so13260617pjq.0
 for <qemu-devel@nongnu.org>; Sat, 11 Feb 2023 09:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=s4OD76xz5qN40J7x02SaJIsm0BVkk78MuIXVE4T9teg=;
 b=mmISAzScaMozej3f3cGvw3EZi71o2XwU3AtpjMlY6mIyHYFW5v3S7Fp+QPCNNSl6Vp
 7J+nspgC4U0Z9hWz5kTXjwa30HQv3QVgQHCPfbA5foE0jIYiy9FrdF7BMQnLGzsSPO0u
 gnGSUotBRagiBN2KxEnAh+hwk5+HLY2vZ+ajQvCdhK6HLhDlcQR1TqdDn2rm7vG9itbx
 s8Jc8HcGjshKZM9L/j9TmaeDbfr+gwi4d9A1vN7mYXA6UWukmGjvmPGxl01Syg9I0dJI
 XZYdXVmLOgjWS2a6u5B07TgI7X4JWOZ/zjyoN8/mI2455JJmJW57aFHWaJ+pBbin3gl3
 zoXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=s4OD76xz5qN40J7x02SaJIsm0BVkk78MuIXVE4T9teg=;
 b=easSNAN0vSQV3gvvEgotOFnqV+j78o1wjX/4yNZ7yWcm7F8gWYc3xLZBQQOI97HVMK
 Db2KXpnPdhNSl/rw8thuHgv7ei04cf9QWyoErqeiRKhfJGXMdyQvmM61d/WnbmFFWBtp
 e3IIlcHPqKfdA4KKSAmdYqUyjTa4D7W9H+Gynb7VlGr1rK7oGFlVxmOfBEqyXvJsfPiC
 /oECKg/CaQabO5+VJLBcMoiL8YUKH12tFv6471J0VFSV0p05ZSsSMuRS0s8VGwpDYb1m
 M7xj6qQg45PMVBsj5dVb3fxx+tzvruPk5Yzy8knHBru2TX2i88M2m94rwoc9+qcKg0iF
 ZsxQ==
X-Gm-Message-State: AO0yUKWXJADDGWxnfkr7U/ssHLH2xVW5GluuiYmVMHJIS5gt6thOrwnB
 KwiSWOL+GNFAP+wCAEBwwB/VDg==
X-Google-Smtp-Source: AK7set/JLN+bQzwGHm+zY9GL7JdtYrIynbKdw+ZguXNw9EkuWnjF5auJSD2vmaRZis15TmXQL23VEA==
X-Received: by 2002:a17:902:e547:b0:195:f3e3:b923 with SMTP id
 n7-20020a170902e54700b00195f3e3b923mr21145355plf.8.1676136628813; 
 Sat, 11 Feb 2023 09:30:28 -0800 (PST)
Received: from [192.168.101.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 jl24-20020a170903135800b0019608291564sm5244043plb.134.2023.02.11.09.30.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Feb 2023 09:30:28 -0800 (PST)
Message-ID: <65d584a6-1b60-dbaa-ee5a-0de9ae602c1f@linaro.org>
Date: Sat, 11 Feb 2023 07:30:24 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 06/11] hw/sparc64/sun4u: Keep reference to ISA input IRQs
 in EbusState
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Sergio Lopez <slp@redhat.com>,
 qemu-ppc@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>
References: <20230210163744.32182-1-philmd@linaro.org>
 <20230210163744.32182-7-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230210163744.32182-7-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 2/10/23 06:37, Philippe Mathieu-Daudé wrote:
> Keep reference to ISA input IRQs in EbusState.
> 
> To emphasize input/output distinction, rename arrays
> as isa_irqs_in / isa_irqs_out.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/sparc64/sun4u.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

