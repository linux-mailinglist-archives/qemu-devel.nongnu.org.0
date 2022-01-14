Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F6E48EAFF
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 14:44:34 +0100 (CET)
Received: from localhost ([::1]:56680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8Msb-0006Lc-QP
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 08:44:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n8MeB-0005FS-Fi
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 08:29:39 -0500
Received: from [2a00:1450:4864:20::429] (port=42770
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n8Me8-0003tQ-Ut
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 08:29:38 -0500
Received: by mail-wr1-x429.google.com with SMTP id k30so15596718wrd.9
 for <qemu-devel@nongnu.org>; Fri, 14 Jan 2022 05:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=45BU1TyXYIU6ZQpMIAT9y5TJvkLsSr1DANDKdz7roec=;
 b=IhdxRGB3RbL2k0xDyoGci81KDz4jR6KpmBcFWA9dbMeQu2KsYJWKRuqqLzcP65BV6g
 s1UPf87xuCACs1HqB1nn1tSQmTMthT8lmGYBtib84Z99L294rPueGJaEaApC9uptT/iD
 R7kFN1HIcHkazO3pJNAij9Rly44+Nsd0J9AV6cM4LfU6B/+XhxrdpHNqE+rwP+A8sV9J
 Zwo8WlDaGCVYv8o1PMKP39N5L/5bG0ApBrJB9BUvIOnwwC4nZzaHG6xpeFJiBfymQhRv
 z2F4i7mI2N9IxYaNgO0r1A4CviNOwOJs4k3tp5mH+piuCiHyOgBy9ztVLFUTIx0FooO4
 bSnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=45BU1TyXYIU6ZQpMIAT9y5TJvkLsSr1DANDKdz7roec=;
 b=kzayFpvWqBlP/UnhsUOwzwXEKgwPioe2kpWXx4f9U5X0dz3zxcyVVYROuIGRGOyfVK
 jdz1da1C+LWT+RA9xCEQw+GESz4K2sUcLRNd0oFdum0YOuh13KsD4gbzaAeh4JzEFwv4
 MpMUQaoBCDlkz686HqXc6ybTG/Cs6RhiRkNW/fu2XwmvT9naZ/vFrmUwY/ClA6Y1J7Mh
 PcQfOR7T143fBqXeBjeaHP+DOvieLz0PWovLVkwYcvYLZ2FwXUTta0EW/t4COv+AUL61
 sTqfAZ5XBbrVfvxIPsEnZ4DMLlWzGczf0X0yeYpJIdl1n3JZenRFnpobQ2URAzFyCvj6
 5E5Q==
X-Gm-Message-State: AOAM5330TK0qzm8EMHCYBSLpd7TEBhyRAcTSzsX5yQMtofi4ugLVZ0JW
 ab/drzGjWqv0aQY7M5fBOxci5EjSdk+zQ6kIkh305w==
X-Google-Smtp-Source: ABdhPJxFUJPfXwpL5yvUgbzc750n/wwmZhQk9IeszcpY+WtoZUe9etAGUUCWJlhU+zuNIyEhWjv2DaSo0bP98OQHYmM=
X-Received: by 2002:a5d:6848:: with SMTP id o8mr8752373wrw.2.1642166972802;
 Fri, 14 Jan 2022 05:29:32 -0800 (PST)
MIME-Version: 1.0
References: <20220112213629.9126-1-shentey@gmail.com>
 <20220112213629.9126-3-shentey@gmail.com>
In-Reply-To: <20220112213629.9126-3-shentey@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 14 Jan 2022 13:29:22 +0000
Message-ID: <CAFEAcA9_raOgBRLCj9gkUqZc2jgL=aNgzu08FBWmT0vC8-mvag@mail.gmail.com>
Subject: Re: [PATCH 2/3] pci: Always pass own DeviceState to pci_map_irq_fn's
To: Bernhard Beschow <shentey@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 "open list:Versatile PB" <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 "open list:sam460ex" <qemu-ppc@nongnu.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 12 Jan 2022 at 21:36, Bernhard Beschow <shentey@gmail.com> wrote:
>
> Passing own DeviceState rather than just the IRQs allows for resolving
> global variables.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

