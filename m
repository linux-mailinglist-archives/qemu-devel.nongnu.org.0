Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7DA440C29
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Oct 2021 00:34:17 +0200 (CEST)
Received: from localhost ([::1]:47924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgwvY-0007rt-R5
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 18:34:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgwuG-0006pO-Ix
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 18:32:56 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:38792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgwuD-000569-EN
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 18:32:55 -0400
Received: by mail-pl1-x634.google.com with SMTP id i5so9192280pla.5
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 15:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4Ugz59kjvpIXuV2NLogkjgQMBeVHhlYHy6uceQtTBj8=;
 b=PRXNrR4oAMkRadloPu2NAKD0o+4/hQ+GttOduCwr9u+NZAM2o8J8ri6xhHEEK5WDdd
 wuCrdhzvEwWhhCTz/KFk+XQPS0JE9ORGkfP+wkvwJ0iqqrjjRxNsiDy+XFEO0idl/aDz
 /LEqCyHzYD4wu2osB3AFMzIz+U3zXjTh+7XKPNHJVYnWQ8krYo1LD3LNCXR/thAzOgex
 OqDGorHw1BJKD9F2q6P59upJV6C/0NKGYO8v+je55XRW0tXTSUm1H5/zzu5yf4f2McTQ
 L/baNCNV7r5FZIqLloE71E8BMOQ1I9gtTIP85w+ssJhcznTn9atIuiMpUOlxjW/hqJZK
 BW0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4Ugz59kjvpIXuV2NLogkjgQMBeVHhlYHy6uceQtTBj8=;
 b=4eUUCGv7uwina+Pa39VozeReSPObkKSmdkbyDj9Q1xGpr5BcC7Fx124kUUXw+QGr7z
 yBAnsPkelxNlLfB5VDU7lg4dVP3DCxGdau/pzzBo3B47SZTbBxPb4HuDpgCw7zmzIDXd
 XzLeQtpj2hnfz59GcChBHweeynEFYm/GaQQx7+iHWRFYcCEoQq0S9uwnVjaG0gzdlFqr
 au9lyMNEp4a7+toGGkguNp2IQydKQBcnDXFJaPfLGRCc27OCtjcutOF/+BhYwoM8ad8t
 Fmv6Yk0skBRP5yo0usEgFqVxK3GahpfOGWCgBQ6kQ92N8Slt44om0Oc/d7xxyj7LBdpr
 V9og==
X-Gm-Message-State: AOAM531g3+PG2e4xTRz1MbUOmrXZvGkRA52ojnFRjoBVdvF9omW+EWU9
 A+h26XhcrYbs2XV2zWavjBOc5g==
X-Google-Smtp-Source: ABdhPJyXYV40asuExXZr2vdIzbs9FGsx6FiSC7AW2MptGiaUoXjxpHa3yHrL6flzkXkMfyxV2f06Vw==
X-Received: by 2002:a17:902:c7c4:b0:141:deb4:1b2f with SMTP id
 r4-20020a170902c7c400b00141deb41b2fmr175784pla.44.1635633171691; 
 Sat, 30 Oct 2021 15:32:51 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id p13sm11591005pfo.102.2021.10.30.15.32.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Oct 2021 15:32:51 -0700 (PDT)
Subject: Re: [PATCH v2 22/34] target/ppc: moved stxv and lxv from legacy to
 decodtree
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20211029202424.175401-1-matheus.ferst@eldorado.org.br>
 <20211029202424.175401-23-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ea99cfee-eba3-3195-1d4f-789a3a565388@linaro.org>
Date: Sat, 30 Oct 2021 15:32:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211029202424.175401-23-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.426,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 10/29/21 1:24 PM, matheus.ferst@eldorado.org.br wrote:
> From: "Lucas Mateus Castro (alqotel)"<lucas.castro@eldorado.org.br>
> 
> Moved stxv and lxv implementation from the legacy system to
> decodetree.
> 
> Signed-off-by: Luis Pires<luis.pires@eldorado.org.br>
> Signed-off-by: Lucas Mateus Castro (alqotel)<lucas.castro@eldorado.org.br>
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
> v2:
> - Do not access EA+8 first in LE.
> - do_lstxv receives TCGv displ
> ---
>   target/ppc/insn32.decode            |  8 +++++
>   target/ppc/translate.c              | 17 ++--------
>   target/ppc/translate/vsx-impl.c.inc | 51 +++++++++++++++++++++++++++--
>   3 files changed, 59 insertions(+), 17 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

