Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50CA03ADABF
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 17:52:31 +0200 (CEST)
Received: from localhost ([::1]:43726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ludGo-00024b-Bk
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 11:52:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ludEx-0008Hq-Ew
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 11:50:35 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:39815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ludEv-0003JJ-N6
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 11:50:35 -0400
Received: by mail-wr1-x429.google.com with SMTP id b3so4066959wrm.6
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 08:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DLQelwUO4U7jeK3XzSoprRECC2mJhbh3kZUSUu+mo6E=;
 b=pAjcs4nVXkouvX7DH5q9z0/Gc5bUOIYrElsm3J1eZ+gxbDkJyjxUl574w1qWGw3nxX
 WAt2RqYnCbFlA26lLIq3/LB0C1kvEQqca2e9csxjVmvB+aYf2NUFKPNVwzWEOCADrX/o
 K2BksUIVL/0u7ZNeQZpp7zvNY68iXu5q3jh4dv20pH/JPbIjPEcCJzXY7afhdmYlLcBn
 HXUwy9+9GF+vQ5iGOaeKwTjLS040BewToh9r5o/xGXBXfMuG2ldu/MX0jejrV5plZQOP
 wyFyaPw8JoI6XS/LtWSniuCkiaVZzXSbBQBPHMasYHt46/qDeDVmL+nPKKrODqpVXWPM
 H+ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DLQelwUO4U7jeK3XzSoprRECC2mJhbh3kZUSUu+mo6E=;
 b=ffxDMtP99P6C4EU6FYOkpNKEdhoyti5ERxdYhUUN7wLegTCbm6jp4S6pWahBhrT+jf
 /CoqcFAKQcf0ZwAWGUwKRf3mYeaSegSe4a4Z37VmtPCqA1/zeNAL4lSgPiUKmMxCnhjV
 goyjm0K2NheK+U1O0AkyV4yaOi2hJI+6Z7yk++bU34/dmV9h7Uw8+EnojlGsKc2HrqQi
 c+un5AvWU4RU/tqGoHnJdoks/w8P/7CYDc45iGfBNs3EymaSGOOwklEsONq+L8arhz83
 Y5Il9F9sUSzHGOkHQj2wNZegeqcOIQGRCvbGazWRoe2j4g1Df3vLuSH2HvHnzNcYEC3v
 kQow==
X-Gm-Message-State: AOAM531mhS8Dwrs5JWcUSb+zWGbEHjsOQvR6QToxYE9zBVljDvb3GT0U
 coGXGotU870swtCkicsG/5Tr6oVMIhyx2g==
X-Google-Smtp-Source: ABdhPJzJC+YsrcC5tF+VrQVUEnFBPyBzy3IBKLNDn/m0rg67hNh51GHl5sNuNnE+juMvtSxt8UAAFQ==
X-Received: by 2002:a05:6000:186c:: with SMTP id
 d12mr18379351wri.123.1624117832281; 
 Sat, 19 Jun 2021 08:50:32 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id z12sm11827711wmc.5.2021.06.19.08.50.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Jun 2021 08:50:31 -0700 (PDT)
Subject: Re: [PATCH v7 13/27] tcg/tci: Emit setcond before brcond
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210601150106.12761-1-richard.henderson@linaro.org>
 <20210601150106.12761-14-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <49a4b0a9-255e-9fb7-5368-d9b96c774ff1@amsat.org>
Date: Sat, 19 Jun 2021 17:50:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210601150106.12761-14-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.202,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/1/21 5:00 PM, Richard Henderson wrote:
> The encoding planned for tci does not have enough room for
> brcond2, with 4 registers and a condition as input as well
> as the label.  Resolve the condition into TCG_REG_TMP, and
> relax brcond to one register plus a label, considering the
> condition to always be reg != 0.
> 
> Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tci.c                | 68 ++++++++++------------------------------
>  tcg/tci/tcg-target.c.inc | 52 +++++++++++-------------------
>  2 files changed, 35 insertions(+), 85 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

