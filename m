Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFC92E317E
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Dec 2020 15:18:18 +0100 (CET)
Received: from localhost ([::1]:51904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktWsC-000683-Nw
	for lists+qemu-devel@lfdr.de; Sun, 27 Dec 2020 09:18:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ktWqD-0005h9-BN
 for qemu-devel@nongnu.org; Sun, 27 Dec 2020 09:16:13 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:51321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ktWqB-0004Mf-PK
 for qemu-devel@nongnu.org; Sun, 27 Dec 2020 09:16:13 -0500
Received: by mail-wm1-x335.google.com with SMTP id v14so7333208wml.1
 for <qemu-devel@nongnu.org>; Sun, 27 Dec 2020 06:16:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LCjjt6k08J9bywGLMddNQMUvBZj7LtIrbp0sRQbcRYo=;
 b=tT5OAuGSYf20ypE23Y3tlcXKXEdRJe4MwAWVOGGnTzwJ9ycpNva2m6XHSgR16wKKfP
 q/mx/eeWGFhKSv9Ppo+JyRI4pkiV5Lm1Jw5lqoNpNncqfXwQvDuiCRvBD9N45yYHadXz
 FirQaNDZZJ9phkW3EnhkhOloj0bS1eKUj1SOv1tUeh4vJunN69tXmkHr/bkoa06FNAU5
 9sSBTnOWi1uE2358A5RKyIl0zYz1jfR9I9uL956Oao/oDNccxOGpb8zfUPo24ZlLWde3
 XsS31lPr6rL2JpkoV/qyg59YhzDwdAzjwVHspl9jchV/n6Yj/2zmTcfQbHg5hYDXnttC
 /npA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LCjjt6k08J9bywGLMddNQMUvBZj7LtIrbp0sRQbcRYo=;
 b=t0NbDr8qr3cigvFgbpgUvXoUfJ8Sfv8C+J5BqO2NgNJe/cYST8VCWcJll/KXWRDD7W
 Q4tjbIR3SUj41kOen3+CmPJFD59GwiJs3K9PrTXRQXRZ5+jHzXdSIT00ormW+Zyffv7D
 vFL6YGYwzzVMNAPt53eEdlEDxWAVLzmnpQp7sRDB8FXxbaLDfN5a4CE+q+bVYSaYKy5q
 a/+nA3fcY0VG2bbs+fz6U14OfSGLy27YBwHUDNqlabpVZ+gWc4xi8cVMBgyG8N7u2LSq
 rkq9KdYptBaUMnjqJxe5/PIHOH8x9MIi0rT2Ur+r5USjD6/SIckBQjt0XdoZnmaPX8uB
 hG0g==
X-Gm-Message-State: AOAM530p+pgPop5sKAqWKjZFebkr67akz6v3OPWrnaTIfQQTObhQxpdM
 abVmM+AY1xTcxFPLFrpRuLA=
X-Google-Smtp-Source: ABdhPJyMrKAs71pl4iLURakfxdOPsiR0Jt4dlmsKRQK9LU2nb2Vj8I/+MEUmBCMSKyyUnjnJDvld4A==
X-Received: by 2002:a1c:b608:: with SMTP id g8mr16726992wmf.110.1609078569814; 
 Sun, 27 Dec 2020 06:16:09 -0800 (PST)
Received: from ?IPv6:2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b?
 ([2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b])
 by smtp.gmail.com with ESMTPSA id a13sm49018837wrt.96.2020.12.27.06.16.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Dec 2020 06:16:08 -0800 (PST)
Subject: Re: [PATCH 1/2] ide: Make room for flags in PCIIDEState and add one
 for legacy mode
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1608852217.git.balaton@eik.bme.hu>
 <47c59c404e979f6ad2eaf2be776f1a56cabe7671.1608852217.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <04e85d26-fdb4-07f0-1fac-afc4aa7dbc83@amsat.org>
Date: Sun, 27 Dec 2020 15:16:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <47c59c404e979f6ad2eaf2be776f1a56cabe7671.1608852217.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Huacai Chen <chenhuacai@kernel.org>, John Snow <jsnow@redhat.com>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/25/20 12:23 AM, BALATON Zoltan wrote:
> We'll need a flag for implementing some device specific behaviour in
> via-ide but we already have a currently CMD646 specific field that can
> be repurposed for this and leave room for furhter flags if needed in
> the future. This patch changes the "secondary" field to "flags" and
> change CMD646 and its users accordingly and define a new flag for
> forcing legacy mode that will be used by via-ide for now.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/ide/cmd646.c      | 4 ++--
>  hw/sparc64/sun4u.c   | 2 +-
>  include/hw/ide/pci.h | 7 ++++++-
>  3 files changed, 9 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

