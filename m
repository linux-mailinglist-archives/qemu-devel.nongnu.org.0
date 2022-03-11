Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 960FE4D6932
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 20:46:59 +0100 (CET)
Received: from localhost ([::1]:46588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSlE2-0006Ni-OA
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 14:46:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSlBa-0004lB-Qv
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 14:44:26 -0500
Received: from [2607:f8b0:4864:20::62c] (port=38444
 helo=mail-pl1-x62c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSlBZ-0007xK-EU
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 14:44:26 -0500
Received: by mail-pl1-x62c.google.com with SMTP id n18so5818559plg.5
 for <qemu-devel@nongnu.org>; Fri, 11 Mar 2022 11:44:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=aEz7vATZEcbpbCje8x8I5COZ92MC+mkIR64bXy4VBU4=;
 b=BhNFnPE33ghIPVNoczDx6JoCuQotos+fM8LBZ4jpZSfRTUoA16JrQZy6iloK/b/e71
 KMgvQgQPA9CUoVP0BmkYFPGgVoP1d6JJKysJLBwsi+MInRMB0SZl/2nzp9bMnpL5KfhM
 g7RQTnUSLTSjNIZnitKjOJMLQs1X8eBWVXlcw6nHvv3ZgIglwwJ2b5vw3OOhXjKQmoW6
 wqe22RW6X0XFdphZ2bsJClkYPWsQP7m8pk1WAGpdJ2SqkfbzjtR+ojU1Yoif3oO/ZX1k
 Uwx1RRa7cAb8Hj6HE8EvW+xqg+awAAC533upeKYLmvyGTbSTD/Ctwv4ZWP3RK/QLYPGn
 f0KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=aEz7vATZEcbpbCje8x8I5COZ92MC+mkIR64bXy4VBU4=;
 b=nPTUWTZFMiAQzMs+jZ+Pc79gigqItBLfUMyA6+EMBRHR4542r+99Ch1aIoYYZKgeet
 PEAm0FGDzs30s+toUmHk84nVrfQ5q96cJuezvVoFcJ/dcd3NHrL5ldIhkdNR4BcJrAjE
 +uBgWCm2AlGxGGyHvAh4ba5IXEVnV6NP48Sw8ZhXRx3przTircRsVy384cQeotzfSMvV
 apBJyKvNAVFPTIMLOmshGLYWrXMM+sII6VGBqtNGyHZ2wzfR3W+NqnQQ3p1z+Drl3Mjy
 UDvEXEL0V1uGuybnvgRn6VDii69VIf4J+JMR/zn3A/dgCv26IrdXCv2BcdAMUks4Jmwu
 ffIA==
X-Gm-Message-State: AOAM533MFR09g5NpXQklvqCxQxGur+9a8ottMfP1l6yljHLoVH+psxTN
 Nhz0bIeI9fsBYlL4Vv/hfFGuGw==
X-Google-Smtp-Source: ABdhPJxujSEdHuCzDawYULLExUblmvUO+N0JGQP1hqf09mNqcUb9yrcbAwvAv30wPU6s0alEZ2cpAA==
X-Received: by 2002:a17:90b:3802:b0:1c1:b62b:c4ea with SMTP id
 mq2-20020a17090b380200b001c1b62bc4eamr9496455pjb.193.1647027863988; 
 Fri, 11 Mar 2022 11:44:23 -0800 (PST)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 z14-20020aa7888e000000b004f79f59827asm918060pfe.139.2022.03.11.11.44.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Mar 2022 11:44:23 -0800 (PST)
Message-ID: <0e7e36a9-3157-7ff6-e865-d942f848150e@linaro.org>
Date: Fri, 11 Mar 2022 11:44:21 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 5/9] dump: Add more offset variables
Content-Language: en-US
To: Janosch Frank <frankja@linux.ibm.com>, qemu-devel@nongnu.org
References: <20220310110854.2701-1-frankja@linux.ibm.com>
 <20220310110854.2701-6-frankja@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220310110854.2701-6-frankja@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/10/22 03:08, Janosch Frank wrote:
> Offset calculations are easy enough to get wrong. Let's add a few
> variables to make moving around elf headers and data sections easier.
> 
> Signed-off-by: Janosch Frank<frankja@linux.ibm.com>
> Reviewed-by: Marc-André Lureau<marcandre.lureau@redhat.com>
> ---
>   dump/dump.c           | 35 +++++++++++++++--------------------
>   include/sysemu/dump.h |  4 ++++
>   2 files changed, 19 insertions(+), 20 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

