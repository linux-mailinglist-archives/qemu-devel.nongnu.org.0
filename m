Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AADEC3ADA8D
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 17:16:38 +0200 (CEST)
Received: from localhost ([::1]:42286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luci3-0005GL-Kk
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 11:16:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lucgt-0004bB-Pv
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 11:15:23 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:44727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lucgs-0007GY-5F
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 11:15:23 -0400
Received: by mail-wr1-x431.google.com with SMTP id f2so14222914wri.11
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 08:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7j66UxNCJZ+9u68aTfaCHkp46b4zgD33pJ4srwdFALA=;
 b=IDOHIppnXrA2N4x0QVwZo/evimdKQjE4iFC1qYO2mcUFoDE+9gblLpxQn+zAtJbA2O
 XWQhs9lg0WAyyuzTiJNbkqEXwrheQtAA5hkKXjiX8zIkyptxONFJlnJKp+snsi8cxPbf
 msrcd8RdUxqRK8rsAYcZ7Pi34e9yMbDJwr7bxVjLQL7j3+AaP3ZhT8n0gkMVo/alKGtE
 4UOrqk5RAo5j5QyY5gEdG/IbA8lUdrZTvR2O3KiO/WJjeXq7Mm8lWrp3q5yB/ihdt7kr
 8NXPsIBIPSsmv4Tcq7UT5QzNJqiwAEMG5cLd8t3T50imxIP+7Q6AX/rNl6EKmnYVeTUY
 Bkrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7j66UxNCJZ+9u68aTfaCHkp46b4zgD33pJ4srwdFALA=;
 b=VZZchkXTIRM7rVDjH8eQUQisxFyrjEQVGfPVg+CiQ6jMvJ17gw+oCESkpBhv+cv3W9
 QVU65i11/JfMckr3pYhUVsdqtHSMBvKzNytCBlDjIkdCM+hEy/X8ZqAYEaEc2H/373Nd
 +w8Fp51KOi9YAYDG7gK7vlzJ5hbJfZZY4H+4B3FR0MsZM8aO0gA6roiDcsEniiTvyh+I
 +eHS9Vsptip9bgbt3k/Xw2FlHCYjWK+EK1CCtoLvHrYVqdOY+6JHWUmVtIiOZWyuxuQd
 ZVlY1M6z1/OwsRBAuGLHs98skcKl9WfRy95318dqcTwpRytmUH7DQYIAukZlUoVn7t6l
 V/aQ==
X-Gm-Message-State: AOAM532wCfofBn2pCk85j5g9XwJw1HWdOC1Zew7FDNyMfWwjwzgNTlnk
 LLLk/itz7i0MDa5m74+8elg=
X-Google-Smtp-Source: ABdhPJy5lxEeoNzP2UYO1O9xb2G8AcBdPBmCS4JaX0v35C7iaWeV0IxQPmvG4GsXMopGT4E30W5H9g==
X-Received: by 2002:adf:f40c:: with SMTP id g12mr18182785wro.20.1624115720506; 
 Sat, 19 Jun 2021 08:15:20 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id w2sm9234213wrp.14.2021.06.19.08.15.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Jun 2021 08:15:19 -0700 (PDT)
Subject: Re: [PATCH 10/11] target/mips: Do not check MSACSR_FS_MASK in
 update_msacsr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210527041405.391567-1-richard.henderson@linaro.org>
 <20210527041405.391567-11-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <45c1670c-5893-0356-5cbf-fdcd79937af4@amsat.org>
Date: Sat, 19 Jun 2021 17:15:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210527041405.391567-11-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
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
Cc: mmorrell@tachyum.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/27/21 6:14 AM, Richard Henderson wrote:
> The FS_MASK has already been taken into account with
> restore_msa_fp_status.  The definition of iflush and
> oflush is that we *have* flushed to zero.
> 
> Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/mips/tcg/msa_helper.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

