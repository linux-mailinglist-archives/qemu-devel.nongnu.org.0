Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87EBF436FBD
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 04:07:13 +0200 (CEST)
Received: from localhost ([::1]:41814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdjxg-0001cQ-Lg
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 22:07:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdjwm-0000lt-T2
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 22:06:16 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:38498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdjwk-0006aP-UK
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 22:06:16 -0400
Received: by mail-pl1-x636.google.com with SMTP id i5so1679652pla.5
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 19:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2Gn+7TMGyxQ+ZyA0y3jYXPY1hRv7TOF4ncXZZMIhRCM=;
 b=ZX+fr91AjYFTDwu/DsgIh9wGeuFzfHYEi7jFKqNXXqBoOutDhU/fwxl+qilpLPVV9a
 gn+1rNQSAnUtuATxj6yZioldFxasoxEMtweGCHY4nvlQJ1Nkc32Y1FS3XMA4Rh0J9qGT
 i49E5wXeZ4C3TEJgu0HZ3zF7zb+q7ogKlgZlncMsI4ocMZVY5OSa06R7YHCrc3rACWyf
 74S3tA0qZqFfvfUyQrqrIvNHu0sqIVxiPMwOGXJfs5mjkPW54tjNXR2W0er0DBFbhbGy
 xNYBXugPiF9I7m/r5pQ6YdcJeT0K6fAlqkjUeayLtbpMj3pWBLOZmdS+FFo5s051J7yK
 Gl1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2Gn+7TMGyxQ+ZyA0y3jYXPY1hRv7TOF4ncXZZMIhRCM=;
 b=IRgLfhdjhvDLjNvzMRaSsudZxX+ZQx0aRsKhNa230UudGjKUeyo6AfkD3oNq5ogF5E
 PsN8iZFYsgZ1fFWnIbVVHrQsfXe28ubV/Lxe3ux67Jpyrkhzury5fal4D+7Oo0FJHUzh
 6xAdJBlM86wEm0R/FBP2bDPTa3xnv4nEnrgknVANJEgPLL3LYzCKZbAPtPCeMUAgRa9L
 qLIycQMoe/GvGQADAHI1yLH4dBhqRY4DNtPa6mm8K/Tqcgcu5jCoGDkThsoU4PYibeZG
 FNdkoq6+m2XCVySvtI3M8xHWsFSwmRTpdEomNLQwDR3dpqLaH7uAgvAQceq6cGObYoWK
 p/9w==
X-Gm-Message-State: AOAM531cvQzw8ChNZE2knumn0SPJcua+zNSerb3lsF9/7BLIkunqcBzo
 B6eUIe/ohtvLDggZwb4qiflGyK0pjAA8aw==
X-Google-Smtp-Source: ABdhPJwVICskM4IzXwPrlfU/bGrlOdk9AD3PJH6a1Z2R0ll1drjekzphZtxsflrKk6G/J3G7H/3Nlg==
X-Received: by 2002:a17:902:a613:b0:13d:d95c:c892 with SMTP id
 u19-20020a170902a61300b0013dd95cc892mr8711982plq.35.1634868372966; 
 Thu, 21 Oct 2021 19:06:12 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id x2sm504700pjd.50.2021.10.21.19.06.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Oct 2021 19:06:12 -0700 (PDT)
Subject: Re: [PATCH 00/33] PowerISA v3.1 instruction batch
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20211021194547.672988-1-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <61bdf46b-438a-cc6f-322b-6ed746267df6@linaro.org>
Date: Thu, 21 Oct 2021 19:06:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211021194547.672988-1-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.867,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: lucas.castro@eldorado.org.br, luis.pires@eldorado.org.br, groug@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/21/21 12:45 PM, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst<matheus.ferst@eldorado.org.br>
> 
> This patch series implements 56 new instructions for POWER10, moving 28
> "old" instructions to decodetree along the way. The series is divided by
> facility as follows:
> 
> - From patch 1 to 4: Floating-Point
> - From patch 5 to 10: Fixed-Point
> - From patch 11 to 19: Vector
> - From patch 20 to 33: Vector-Scalar Extensions
> 
> Based-on:<20210910112624.72748-1-luis.pires@eldorado.org.br>
> because of patch 10 ("target/ppc: Move REQUIRE_ALTIVEC/VECTOR to
> translate.c") and patch 11 ("target/ppc: Introduce REQUIRE_FPU").

The prereqs no longer apply cleanly.  Do you have a branch you can publish in the meantime?


r~

