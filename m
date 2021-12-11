Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 885E24714D8
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Dec 2021 18:07:17 +0100 (CET)
Received: from localhost ([::1]:45994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mw5q7-00080Q-VK
	for lists+qemu-devel@lfdr.de; Sat, 11 Dec 2021 12:07:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mw5lM-00045E-BM
 for qemu-devel@nongnu.org; Sat, 11 Dec 2021 12:02:20 -0500
Received: from [2607:f8b0:4864:20::42d] (port=33555
 helo=mail-pf1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mw5lJ-0004Rf-LH
 for qemu-devel@nongnu.org; Sat, 11 Dec 2021 12:02:20 -0500
Received: by mail-pf1-x42d.google.com with SMTP id x5so11296270pfr.0
 for <qemu-devel@nongnu.org>; Sat, 11 Dec 2021 09:02:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=biZv55IM8Ro6w+eD8TPZ3y/8ACotObnu00FP/rhxgmM=;
 b=NHix4IEPkeZ8IJzaj+movv3TtbTTA2aJZHbZorWZldW6RzE/KKAocDF2m+pz59C9b/
 HBdvjfk9K3tmKdWri9hK0+RAK5zRiCvrPd3NTgXeNEwSvD9023lCVGgQj3Ja3hybfqIH
 jlcJdS97X9hjmY+MXos9ESWc3ErqoO4o+rabTQDoYwuLsuv0+AP25K8iv/scRuPiELCi
 v4IrFHtkTe/wvz1Qp5XVCCYQ4+D1Xwuin5rJWHjDJ7hFHUuQSNz6ZHo3NkOV/btsU89d
 wTeZAVeooyUgbfyRaQ4zVPzy3+Z5R1UZbE6l/TcUefqD2yl0zf8723tgokGRzbkaJQyE
 pkog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=biZv55IM8Ro6w+eD8TPZ3y/8ACotObnu00FP/rhxgmM=;
 b=6lsGB86hMlwnemykOD6lIwzygWiRw9coQKd2EU3KKsPmrzHu/ZtWh2saHtSKasQnq1
 E+CVJ8vQ2TwGUUIiyswG3rZZAqQPnvXGOjCcCiW7eeGAN1bCY1rQAQ4cQ9VK9DnUS99C
 cIui9dswz7iFSkgduat0uu1ijPZ6x1t7o3QaKmvMqNUu2aq2ouUZGBnABCXi/jnEK8V7
 iMV/qdFVhcB4NqMlG/RCTtOVyVcEYVS7lcpUYWsDwWAOUnhDrOeYKc0RnVC99YVZLIDq
 iMi5DeuFAyEOd/+akh4DTtm1ngIV+iom71sgybk9bZFkCtBZxcf02/uhCVoBT5hksgDM
 sGkw==
X-Gm-Message-State: AOAM533otm69V1fDKev7SAVqwt6oTzhanXdHL3xvx6Qn1zY5LJoa1sl8
 gtEuhxA3a5dCd9w57NhM2gn83w==
X-Google-Smtp-Source: ABdhPJyDGVSk6y+OlyDXk8/uu6u1knHD/+iSib8k8UZtAPV8i61Dy/tw6eVRasFNlmHvZN10IuhI9A==
X-Received: by 2002:a63:e24:: with SMTP id d36mr34841070pgl.175.1639242135775; 
 Sat, 11 Dec 2021 09:02:15 -0800 (PST)
Received: from [172.20.1.20] (45-19-222-18.lightspeed.sntcca.sbcglobal.net.
 [45.19.222.18])
 by smtp.gmail.com with ESMTPSA id gc22sm2402748pjb.57.2021.12.11.09.02.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Dec 2021 09:02:15 -0800 (PST)
Subject: Re: [PATCH 1/4] target/ppc: Fix xs{max,min}[cj]dp to use VSX registers
To: Victor Colombo <victor.colombo@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20211210141347.38603-1-victor.colombo@eldorado.org.br>
 <20211210141347.38603-2-victor.colombo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <dbbb0877-7039-19d4-a03d-af78539174f4@linaro.org>
Date: Sat, 11 Dec 2021 09:02:12 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211210141347.38603-2-victor.colombo@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.317,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: danielhb413@gmail.com, matheus.ferst@eldorado.org.br, groug@kaod.org,
 david@gibson.dropbear.id.au, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/10/21 6:13 AM, Victor Colombo wrote:
> PPC instruction xsmaxcdp, xsmincdp, xsmaxjdp, and xsminjdp are using
> vector registers when they should be using VSX ones. This happens
> because the instructions are using GEN_VSX_HELPER_R3, which adds 32
> to the register numbers, effectively making them vector registers.
> 
> This patch fixes it by changing these instructions to use
> GEN_VSX_HELPER_X3.
> 
> Signed-off-by: Victor Colombo<victor.colombo@eldorado.org.br>
> ---
>   target/ppc/fpu_helper.c             | 4 ++--
>   target/ppc/helper.h                 | 8 ++++----
>   target/ppc/translate/vsx-impl.c.inc | 8 ++++----
>   3 files changed, 10 insertions(+), 10 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

