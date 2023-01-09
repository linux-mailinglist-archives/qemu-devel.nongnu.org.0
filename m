Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7E6662C4C
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 18:10:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEver-0002Yr-6s; Mon, 09 Jan 2023 12:10:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEveo-0002UY-Pj
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 12:09:58 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEvem-0001eD-Pw
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 12:09:58 -0500
Received: by mail-pl1-x632.google.com with SMTP id p24so10182967plw.11
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 09:09:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=m7czFf6qTHWWqZ0ze//gwvBolGhLp8wZtdiv2g3i6ew=;
 b=kZZ++uLDT4EW/iuTJti461qeAW2uKmN67TDV2A1sbGyzvsfdZijWAvfVFLt/vr6XoT
 IFu/gQa/C40HLwMLFSLVlNI/ncC7G4UFKriq0wAs4pevjwFiKLkbeD4bxOdfIBdMZoZe
 z2wNFRACQberM54m94AfxNKMhikM6PlPZ8OvH/fsTUcXh3JhPiWv/ASLk9o7Enn2fxFK
 PfWgWKHycQKKK980R39G1SgIPEgsvCCma8ZuMsvfK5PTF9k9hOBaqCPmxIfpoV8SAeu4
 T8KZjQfWyWLNeV4jeifLC4XYg3i+XObg0RpEE+nytg/v0FkbWrC30Sx8dRh02IBXErBA
 PSUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=m7czFf6qTHWWqZ0ze//gwvBolGhLp8wZtdiv2g3i6ew=;
 b=k2N7AtoK1x8WHodjpkfMCSAqjsd98ZhlC+G8zkXHT+NXPHkHm4EmshmpLbI7WN1Zdc
 GuWDpG+0LGnJkLA/m1s4D2hf+aUURkypXPn7pt8cGYhjhHr9ZAuP0okaPxW6Zstu+eIu
 +3R2Ld2ShicbVqRGF9GqHqSqDPteDpmTMCATdS/fa2orYFRG7efGh8uZLU2BLvz735ec
 BsM2YT/CexRlQMC7wIjB/3A/L4fojn3Cz8LdN8G0mzItbpYcTxv78KbWi0qRFf+9nKrW
 n7qQa9P+SGbTZE0M7wNsIfnmFXc/KIrj78GLgCjuKRuTOK6cjLNVOTa4iAGsSS+RNVnD
 YwKA==
X-Gm-Message-State: AFqh2kr0jvMGJKKKqIPlUiVnLlgCyM+DbGBEyimkTaay7cfyl1+xozkm
 E7cRYVJ7+kanVSIzawHzDW85fg==
X-Google-Smtp-Source: AMrXdXsMigtH6DgS+qJzCbA6urEO+wNKqQhirDKomawTsMI1ksBBnQNI9xtjMM6upPFmwmVFX1sUVA==
X-Received: by 2002:a17:902:978f:b0:189:6f76:9b61 with SMTP id
 q15-20020a170902978f00b001896f769b61mr2460795plp.39.1673284195292; 
 Mon, 09 Jan 2023 09:09:55 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:a909:891c:953d:a6b0?
 ([2602:47:d48c:8101:a909:891c:953d:a6b0])
 by smtp.gmail.com with ESMTPSA id
 n14-20020a170902d2ce00b00189c26719cdsm6323957plc.272.2023.01.09.09.09.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 09:09:54 -0800 (PST)
Message-ID: <4aa2d9a7-f1fd-80a7-20df-606044405bd5@linaro.org>
Date: Mon, 9 Jan 2023 09:09:53 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 2/5] hw/i2c/versatile_i2c: Replace VersatileI2CState ->
 ArmSbconI2CState
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20230109091754.79499-1-philmd@linaro.org>
 <20230109091754.79499-3-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230109091754.79499-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 1/9/23 01:17, Philippe Mathieu-Daudé wrote:
> In order to rename TYPE_VERSATILE_I2C as TYPE_ARM_SBCON_I2C
> (the formal ARM naming), start renaming its state.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/i2c/versatile_i2c.c         | 10 +++++-----
>   include/hw/i2c/arm_sbcon_i2c.h |  3 +--
>   2 files changed, 6 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

