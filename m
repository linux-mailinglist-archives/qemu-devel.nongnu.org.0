Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E105F46D5
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 17:40:21 +0200 (CEST)
Received: from localhost ([::1]:52564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofk1r-0000SX-J9
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 11:40:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ofjLR-000690-RX
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 10:56:31 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:41842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ofjLK-0004qy-FI
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 10:56:25 -0400
Received: by mail-pl1-x630.google.com with SMTP id d11so12885968pll.8
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 07:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=iZ0cofXLxuRRDTPqpx4FQqq4MZ/4+VlnHfKHprwzS7M=;
 b=DaKH/KfUUsHrVTZzzM9nhE77yW0VSSF9MqsYw65lv8sypnVcfTG4zmbCtI5FVIRxxG
 qOJHeez8ajOx2kGApo/hHbZGGFzE9GxOXgQFo9R6lJp0TQS+Vu7lyVsjoAXYRJ2UdN2V
 VBZ9+fJyC/lrstIBPYlZPSKh0YjZZJ86UELqMIO/wjjxPvsfpH0p4/Fypm8GscylhwWy
 QS3Qf3tkEdA7SmHnq30nF91gM9eGh+YVon7x2Eu8X3oWXsuzPOJxG/kATjaCPPDMeaVr
 tnkvVasdgfINlyLzmdWVxseJ9DyPtpthOgompozxvrP/C1BUbvLWs3CFSidQreYaiUJW
 qrNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=iZ0cofXLxuRRDTPqpx4FQqq4MZ/4+VlnHfKHprwzS7M=;
 b=5LlH++iAvrY5B2duzArJCSAB09eLF2xmOcXrmsMot8jMfMoZ64mb83f06tIgQjwZBr
 +egqZEMKX4ktVYSJPe0pQPn+veoy0TlUoXUDv9Q32dvyxM0tlMNdENO41Cd2D/x9eY5t
 AHSrU+/R2JqIbRiR1H0aGUn+wLkJqZvkEazO4W22jRSAFLUFzYwfsgGUzwag8v6Awbrk
 zY4sSx4SweObB4XGhwWdJzr4k+F+TM7TyGzynhXYXbhmuO+u0MZHBolzoN7TZJ12yQTc
 bzlrj2iBlov4+KC7CgDfUZZmYbstCepLNVCnqYtw57JPDIfpqVWOYdKdfS6pmK9WTU0D
 IGUg==
X-Gm-Message-State: ACrzQf2tTXZyxJU/WtKvbivXYqj7IQc7ihL/USfsJrhWz1YBqmR/XheO
 C3IgbG80URIIAvZqCfdEAHEb7Q==
X-Google-Smtp-Source: AMsMyM7fUdxRwZVfeK4gHgiE0CWi/aKNrGUthTCxiOERE40snX14G1Zf7oyZjT9glKyn+v/oA4XmOA==
X-Received: by 2002:a17:90a:1a49:b0:205:df65:e802 with SMTP id
 9-20020a17090a1a4900b00205df65e802mr135161pjl.59.1664895380831; 
 Tue, 04 Oct 2022 07:56:20 -0700 (PDT)
Received: from ?IPV6:2605:ef80:8015:12b0:403e:a15b:ff5e:d439?
 ([2605:ef80:8015:12b0:403e:a15b:ff5e:d439])
 by smtp.gmail.com with ESMTPSA id
 q18-20020a17090311d200b00174c0dd29f0sm9063632plh.144.2022.10.04.07.56.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Oct 2022 07:56:20 -0700 (PDT)
Message-ID: <ed34b9a4-5470-786d-9958-dfd1df398ef0@linaro.org>
Date: Tue, 4 Oct 2022 07:56:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] target/arm: allow setting SCR_EL3.EnTP2 when FEAT_SME is
 implemented
Content-Language: en-US
To: Jerome Forissier <jerome.forissier@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org
References: <20221004072354.27037-1-jerome.forissier@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221004072354.27037-1-jerome.forissier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.449,
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

On 10/4/22 00:23, Jerome Forissier wrote:
> Updates write_scr() to allow setting SCR_EL3.EnTP2 when FEAT_SME is
> implemented. SCR_EL3 being a 64-bit register, valid_mask is changed
> to uint64_t and the SCR_* constants in target/arm/cpu.h are extended
> to 64-bit so that masking and bitwise not (~) behave as expected.
> 
> This enables booting Linux with Trusted Firmware-A at EL3 with
> "-M virt,secure=on -cpu max".
> 
> Cc:qemu-stable@nongnu.org
> Fixes: 78cb9776662a ("target/arm: Enable SME for -cpu max")
> Signed-off-by: Jerome Forissier<jerome.forissier@linaro.org>
> ---
>   target/arm/cpu.h    | 54 ++++++++++++++++++++++-----------------------
>   target/arm/helper.c |  5 ++++-
>   2 files changed, 31 insertions(+), 28 deletions(-)

Whoops, sorry about that.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

