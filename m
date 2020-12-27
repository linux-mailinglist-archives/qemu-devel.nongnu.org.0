Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B68E22E31A3
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Dec 2020 16:05:02 +0100 (CET)
Received: from localhost ([::1]:50244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktXbR-0003BX-96
	for lists+qemu-devel@lfdr.de; Sun, 27 Dec 2020 10:05:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ktXZs-0002l8-86
 for qemu-devel@nongnu.org; Sun, 27 Dec 2020 10:03:24 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:43100)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ktXZq-00036A-0P
 for qemu-devel@nongnu.org; Sun, 27 Dec 2020 10:03:23 -0500
Received: by mail-wr1-x433.google.com with SMTP id y17so8292093wrr.10
 for <qemu-devel@nongnu.org>; Sun, 27 Dec 2020 07:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=znBClWmq9NCz/mLorpv3HUBswchT6JcuEOIHIq8duQ8=;
 b=bNUoPBFNqMOINHAhNODpl31smO5cItL5axI83mWeWxRuiDd4+m84mpQjB5rYFvqnZ4
 jixPefbMhtSS9xy41nHD/KnTX/w56hsn8y+PxC9gU3y6p7pwVpYRle4G0BhPmd3gmkB0
 BAKO1NseWIIKvvZSfyUFl5Zw7glC1VQ1DMHk5uPa4rECsMCXBGiFWHAB78w/XFPjpVWS
 tsNyMvtQ8q1fQVOFWwgSKzEZEXSVg0C3sRcAhI0twgIXhqsvzV4TVXasr0Q7gSS9gFTh
 eMHXfhvEUWVS+8tuoS/eaXO4pvIaTLNTu4hmzrCKRvAEJeZAPncoFLB71XBSHfDtP9xh
 sBhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=znBClWmq9NCz/mLorpv3HUBswchT6JcuEOIHIq8duQ8=;
 b=qLJ8iFk2O1F1n1aWCaAEhTNYOLHC/UyEsnt1jSNtmGUS+rSMUn7TX9XjtS8n67XjUp
 Nuy+qxftjIYBQ+ElOLTJ+/RNyNqkOy6sJKI98vVrPjLMQZYgMLoRrBdI0R80XAEzAwjj
 +dsllM85D67lkb11FY4BdKamS9cz92qef9JCZBNTff0F25pg5Qvna4l2YVc7CDC2o5nA
 271LD3vLOpCUoPk/wqfXUdtrIxuJxLvzpf+Nhqb5z+g2Cf3cjgWqf+isGv6LZF1ZuAAD
 C/kO4hI2/Zf65n+8q746VHfG8cRX6cHdapb6vI/LgQTFmDrCvEJEJnFXp5sy7hIOIEeU
 jB9A==
X-Gm-Message-State: AOAM533uH81NMMKV+7/5AZS65IME7/40VhN1wQiJ9CWqdvWKC9nTFFd0
 k6YaV1LNzSBTu/Nb/5/GDKU=
X-Google-Smtp-Source: ABdhPJxHq46r33+itW+uHSE/THSnQFMbOGi9evg/H/QopIkKtldxrfuI5zGhEmsepgNRItqiAAeWVg==
X-Received: by 2002:a5d:60c1:: with SMTP id x1mr47129075wrt.271.1609081398970; 
 Sun, 27 Dec 2020 07:03:18 -0800 (PST)
Received: from ?IPv6:2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b?
 ([2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b])
 by smtp.gmail.com with ESMTPSA id n14sm15457218wmi.1.2020.12.27.07.03.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Dec 2020 07:03:18 -0800 (PST)
Subject: Re: [PATCH 05/12] vt82c686: Split off via-[am]c97 into separate file
 in hw/audio
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1609031406.git.balaton@eik.bme.hu>
 <85bafb5b5ba7a34df3c9da54ec4758ae5c8324e8.1609031406.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <3ca327c2-8c53-4dd9-6e73-3541b859d54d@amsat.org>
Date: Sun, 27 Dec 2020 16:03:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <85bafb5b5ba7a34df3c9da54ec4758ae5c8324e8.1609031406.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.829,
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
Cc: Huacai Chen <chenhuacai@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/27/20 2:10 AM, BALATON Zoltan via wrote:
> These supposed to implement audio part used in VIA south bridges so
> they are better placed under hw/audio.

"The via-[am]c97 code is supposed to implement the audio part of
VIA south bridge chipset so is better placed under hw/audio/.
Split it off into a separate file."

Good idea!

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/audio/meson.build |   1 +
>  hw/audio/via-ac97.c  | 106 +++++++++++++++++++++++++++++++++++++++++++
>  hw/isa/vt82c686.c    |  91 -------------------------------------
>  3 files changed, 107 insertions(+), 91 deletions(-)
>  create mode 100644 hw/audio/via-ac97.c

