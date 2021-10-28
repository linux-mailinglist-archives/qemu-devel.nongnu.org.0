Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F335543D847
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 02:57:44 +0200 (CEST)
Received: from localhost ([::1]:51254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mftjj-0000La-SS
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 20:57:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mftf9-0007MO-2t
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 20:52:59 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:52113)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mftf6-0000hp-IH
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 20:52:58 -0400
Received: by mail-pj1-x102e.google.com with SMTP id in13so1030346pjb.1
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 17:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kugHhv8PvGINPHVMzz3e0yHXaPHsnGhBPaGrFobn4+k=;
 b=ano39KdclS75vRZqiKwxlEd7uLCSe0LFIg6KL9kAUw6d9KCgBPjvbiUtaLswzgf2sb
 iXOkubfEmP2bKzgLFswDgyfTv8XXTk7XZ0IEURk6EvOZNFjcqu03iHjc+mvAcHg6IqJB
 ri88lAm65/jxWdXYGboXBj2VQWqQ5HBbW/73WV7GqJG2e3zfXp9EqyLlO4XLNPNonGe2
 I2A9CNDHgD/vU3azP7CBPyj4HcGvb/74kUg11KdHCXtTzO3cu71Mph1jBrkcA1Wvlse9
 3aGemSX7U5ubuhLwOG0b0APBvg6oqOPrYLsJpsqXnDWN4/HutGanNDXyrhDNSgx5GdHe
 V2iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kugHhv8PvGINPHVMzz3e0yHXaPHsnGhBPaGrFobn4+k=;
 b=Wsl696PwEKNKcSAPJmASBMNdfhs35CXMUvKsA3VCI0JU2/H0tW3G2mK8gyLcDopIZr
 7jLIEwIQ+oEQkDIUIR2OJy/KaKnvaxQ6Zs5nPbD4tDPXa2ngfF0SmTABbg4FmlFAtMwE
 cEmhU8HUpOLl9y2BhZmMiR5m+3arud13i8XD/j/CxKtKUYWEtQXb+YUR3OK5Yix1zeF5
 SPWs1D5O/ugAR2q46lwToygSSyzkZXevO2C/rlqUjHfLm9IY9VJJ8R26arOxM2M6+99F
 c6h2kY8MRyDXBa1Dp1/oOvsnynoKHxP5XnZybwHPDz1x6tgKQklGrWEMr4m3QhCqYRtk
 mMhg==
X-Gm-Message-State: AOAM531B1dyLXM4zQgJSJ8RSl/VRtsJ+iQ7eRSckJbYd8EZzgN4yXVvU
 VaMdRM3uZD74WwtCO8itlGhZXg==
X-Google-Smtp-Source: ABdhPJx5n/EwLRzis0MjEy1F5PnmxuwozErOfIRhYamukj0SVKq8EZD54l3Cw901B/2kfId/3M2gIg==
X-Received: by 2002:a17:902:e154:b0:141:7a7e:2e30 with SMTP id
 d20-20020a170902e15400b001417a7e2e30mr1015123pla.53.1635382375267; 
 Wed, 27 Oct 2021 17:52:55 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id n19sm5292287pjq.40.2021.10.27.17.52.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 17:52:54 -0700 (PDT)
Subject: Re: [PATCH v3 12/18] hw/intc/sh_intc: Move sh_intc_register() closer
 to its only user
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1635371671.git.balaton@eik.bme.hu>
 <24142b6436e44591d9afc861c9d6c467ff9ececb.1635371671.git.balaton@eik.bme.hu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d3c3ee95-b487-08a4-4b36-86788a62270d@linaro.org>
Date: Wed, 27 Oct 2021 17:52:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <24142b6436e44591d9afc861c9d6c467ff9ececb.1635371671.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.847,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/27/21 2:54 PM, BALATON Zoltan wrote:
> The sh_intc_register() function is only used at one place. Move them
> together so it's easier to see what's going on.
> 
> Signed-off-by: BALATON Zoltan<balaton@eik.bme.hu>
> ---
>   hw/intc/sh_intc.c | 60 +++++++++++++++++++++++------------------------
>   1 file changed, 30 insertions(+), 30 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

