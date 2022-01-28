Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD5049FB0A
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 14:48:25 +0100 (CET)
Received: from localhost ([::1]:51138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDRc0-0002QO-Pe
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 08:48:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDQr3-0007Tr-Q0
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 07:59:55 -0500
Received: from [2a00:1450:4864:20::436] (port=36412
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDQr1-0006Cz-Ph
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 07:59:53 -0500
Received: by mail-wr1-x436.google.com with SMTP id u15so10769034wrt.3
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 04:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9APF9WsYMRUoXentqqK+ACcPiDhIGbnT3x10+00ZaGo=;
 b=Jv3AucItn/ELxHZhhbIVWCb9Dhb52L3pDNZANypnHluMvOK1wtGsN1X18/zt/JLQnf
 Kq0ZF/jyqtlAOoUgdeji52CBoaSYq1vDn4zLgJVErCWsikS4BLq3h+LHZqry6Hn5+ny2
 PP0r+KNP3IWn2VIXuT8VVN8fRKir4kzfQ/RgDJsWDGEwvRNJriWVOpI9lL1A/bpDsVdc
 ZdVTC3f5FA9EQJue6sYFCkMKefUGVlcqTYjrc/HaJEHzZVXIqXHXCzOoiJts7/FR5y1P
 2p5jC907CCwUxrfABRKNuuexfWB4xfZZ3T6EZJUHAtkqJuzZcxN53vi7OPwqqcO3pJTE
 3rKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9APF9WsYMRUoXentqqK+ACcPiDhIGbnT3x10+00ZaGo=;
 b=WuV0BdfR8FXP5MV1i6baMaJWyavowT0V85IX5dQxy/C/xVssrK9hVIORlP7JNV1dik
 f64wAIaFV+gTf0ICUGxQlNN/gVZVkWO2HomQYbbNLAaInvuSfG8vXXppHRO2/18I7muw
 ybP7phI8s6B1huBW1LNw7yRVLxqh0GMMBbHv+m5+yjhM/n7FCXfgoeuSIZpJq4dIDuHR
 keeVxXJFBavQxfyYWF2V++JPibkGG+tC0yfYW5bID3TzWqq8qwzDCxiwtgqsZvPL8wH0
 urst8FRd0qO/rpyvkX04kWoZWACHGELsX0Px3DFpzBJ+ae9KqvrJ9xrrNHH/0xlT3syK
 co8g==
X-Gm-Message-State: AOAM531JF5qTC8ZivPw3o1DfUnsH3hx/iBv8ranhFIzsugcxnkcO2eNp
 Trnc5gRGjOG6e+oKZumnmksl5/oKjYOTXmBzE9msGQ==
X-Google-Smtp-Source: ABdhPJzx0xe2azNshO1437jDBub4t/n6tOVrhT/roFrS43aw33IFL3e2OAxg8km6OVXhxGXwKyfM3kLS0hgRWlBakpk=
X-Received: by 2002:a5d:4573:: with SMTP id a19mr7223464wrc.319.1643374790266; 
 Fri, 28 Jan 2022 04:59:50 -0800 (PST)
MIME-Version: 1.0
References: <20220126083520.4135713-1-clg@kaod.org>
In-Reply-To: <20220126083520.4135713-1-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 28 Jan 2022 12:59:39 +0000
Message-ID: <CAFEAcA-JmQDy+DdUbH1f_A6by1brdisnTui_=6O3eFNxPXuqmg@mail.gmail.com>
Subject: Re: [PATCH] hw/arm: ast2600: Fix address mapping of second SPI
 controller
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 Troy Lee <troy_lee@aspeedtech.com>, qemu-devel@nongnu.org,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 26 Jan 2022 at 08:35, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> Address should be 0x1E631000 and not 0x1E641000 as initially introduced.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/838
> Fixes: f25c0ae1079d ("aspeed/soc: Add AST2600 support")
> Suggested-by: Troy Lee <troy_lee@aspeedtech.com>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  hw/arm/aspeed_ast2600.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)



Applied to target-arm.next, thanks.

-- PMM

