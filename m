Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A56EB39AA90
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 20:57:43 +0200 (CEST)
Received: from localhost ([::1]:54924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1losXG-0006Mh-LV
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 14:57:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1losVr-0004z2-7u
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 14:56:16 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:42804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1losVp-0005kG-Dq
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 14:56:15 -0400
Received: by mail-pl1-x634.google.com with SMTP id v13so3368749ple.9
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 11:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GVzmCQhcIKDolak0F4jGs4P4SEmiZUbXv7oOCo1SZME=;
 b=YWSKuoNuRER0E2SPwCzrVahlkBXL6Amn1tI/i0I6xSXepxAtQMtk4uLXHeg6C2O68h
 1yv8qD4/NBdaDJbzHaiZyKS5oi8EOnYDuiT8MUw2YH59DgHu03I9nvB/VDN5Wz67/vRq
 Ug1DBqGeEhUhI0EggVGW8DKz+YqRinAydsAsTTBNpXgf2ITSyQ2bWsvggx6PlFaE0iyv
 jmfrliQhKgO550A8/uYABLObyYMHY4p7rTmKjC6DUJA2MjhKPg9slJ72Boo5ApwLudO2
 jsB5N4fNIeSMwoBjwTFKmzHLRK2DLf09lnfxRiRDGFz0DPYKQ2BVM8U6vlnLVYp2mA8P
 PD7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GVzmCQhcIKDolak0F4jGs4P4SEmiZUbXv7oOCo1SZME=;
 b=ONbSwOJe7PLkYY3VJ1nhwByL/OQ2/PhoUOsLVpx6VdZy4VeF4V+jvf53T/omGlq/DY
 oPFQL0YqNfnU1oCL17VdKGHMlUDYhfQkjoa1a/jgU8t/eN3lEg5/X6SS1LFV0ASWWVF0
 toC6cVzKQBTVdgpNENlff5WzEg/lK1Us1hh5V4Gl+FXL2UUk+okenu8swlSd97UozVk6
 ZzEXfzi0R9qL9Z1t/GKgHS+G2ibGzoKGDpxVWjjoQhVh9+h+seZMF0bRU1s+ffyyG8AR
 oiYPo7xuxktgequGrIOEmU9Gz3p0LU2nPYg7qoD56SR4/i1MFZq2v7UNtpEGSGXo62LT
 yBiw==
X-Gm-Message-State: AOAM531873/v0OpJNxhV1IiySKEpiRevjsTxuCMHiWds00cmuBA8+S8V
 Ss3BVyIrw+6dvsIcLcvRD68R1Q==
X-Google-Smtp-Source: ABdhPJwKYZm9jqDPilr5PPeLFGypUIc8oJPQU7cf8f3wdSukl9+vRPTBVDzo3F9nZwj/5VWBCre2yA==
X-Received: by 2002:a17:903:31c8:b029:10e:d206:cdd3 with SMTP id
 v8-20020a17090331c8b029010ed206cdd3mr456719ple.85.1622746572094; 
 Thu, 03 Jun 2021 11:56:12 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 m14sm2973549pff.17.2021.06.03.11.56.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jun 2021 11:56:11 -0700 (PDT)
Subject: Re: [PATCH 3/3] target/arm: Use acpi_ghes_present() to see if we
 report ACPI memory errors
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210603171259.27962-1-peter.maydell@linaro.org>
 <20210603171259.27962-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d77a000b-17dd-8c24-360b-ef40a8bb6b9b@linaro.org>
Date: Thu, 3 Jun 2021 11:56:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210603171259.27962-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.603,
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
Cc: Igor Mammedov <imammedo@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 Swetha <swjoshi@microsoft.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/3/21 10:12 AM, Peter Maydell wrote:
> The virt_is_acpi_enabled() function is specific to the virt board, as
> is the check for its 'ras' property.  Use the new acpi_ghes_present()
> function to check whether we should report memory errors via
> acpi_ghes_record_errors().
> 
> This avoids a link error if QEMU was built without support for the
> virt board, and provides a mechanism that can be used by any future
> board models that want to add ACPI memory error reporting support
> (they only need to call acpi_ghes_add_fw_cfg()).
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/kvm64.c | 6 +-----
>   1 file changed, 1 insertion(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

