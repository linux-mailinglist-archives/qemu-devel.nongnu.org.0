Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E427A69934D
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 12:39:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pScag-0006Y5-AF; Thu, 16 Feb 2023 06:38:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pScae-0006XX-5t
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 06:38:16 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pScac-0000Pb-IY
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 06:38:15 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 z14-20020a17090abd8e00b00233bb9d6bdcso1833400pjr.4
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 03:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VomnUL+3XuvtEbMt0DdUNmtDVYJfH8CorCP0gI0KR9w=;
 b=Shn4itiUDBalUjvxho935T53ZvPTELb+n105vHhLi8brf9Wn+b5w6x9IgkXpokryNI
 uGfiKcOeBEGzxaxN9JwpOgf9uEU/wO4ePHBoqX3TKx1fryK6gaE3+9UgoOvrtt/78cUq
 mdaTuV6xsMU+i5u6fxkeoiSVr+/L0LlDfKduNkaAlYfaqbesxDVWPkIEYaVS7Y0WkoYs
 yXuQI9uxmUb1QDMXYDg7YzuD7IFhUYjYtMOFwjHOF2MCaOuzhYH5ANhr5FtSQwsCTMRU
 wThNLnznFtM9DTXPHrT7eRsCYU+j4npa5LkFeX86jVCu8MFZRqxI/tJeJfA6L6kTL9HS
 6J+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VomnUL+3XuvtEbMt0DdUNmtDVYJfH8CorCP0gI0KR9w=;
 b=4AJiR5GwVCBHN1eyh/YB4FpfGeNXkt5s+Bw5seFRMzCwe9IunOqXICNNUSInvGjYry
 hcXcmi8Tpbr3OexevD7SgHZr4qjGPvzXyATkOUC4v1SZmAenuMTW2KLNP40WkSX1xJny
 i22kgJeveIALH2ZbNvY82s4U+DpHHD2FPUsHXv5QyGN9ShYVBN8HZG4UdrZQ7ueepSnO
 pHEuzf/3xYskGvIVTgoCYJWffcstlSVPWtg4ZlpwAc0ALDaaKXkySLOHfK/4fEGih/JO
 W/WOGp1ZxPYXYj9LtuAYL7zU/Y0WVbimONP3i+gednrVgdBiAi5hhXnUl0ueXDsij75v
 n3rw==
X-Gm-Message-State: AO0yUKWJnehluMUN1DQxPQshUOWxdmRaTbVdrZ+yZPlDYLf+qmESQvl+
 wKb5MtMF/i2QTUDfq/CyI4YhS5lm+D7A2uSJx2F0dQ==
X-Google-Smtp-Source: AK7set/I5kjMzyGwVAxyBWwfRYmgtFDh4dAtEjRI8MhuzhqBuAJGkKYUizMTdaq0xjINH2WqeCFQrp8P5GofPDxLyMM=
X-Received: by 2002:a17:90b:5109:b0:233:dcb5:ee15 with SMTP id
 sc9-20020a17090b510900b00233dcb5ee15mr520948pjb.92.1676547492921; Thu, 16 Feb
 2023 03:38:12 -0800 (PST)
MIME-Version: 1.0
References: <20230216092327.2203-1-philmd@linaro.org>
 <4175aa01-03fc-94b9-dd7d-3e0268a92b55@linaro.org>
In-Reply-To: <4175aa01-03fc-94b9-dd7d-3e0268a92b55@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Feb 2023 11:38:01 +0000
Message-ID: <CAFEAcA_sjZcKQc8V+TCZvrui2mby-vV-ZzxrPY_YL-cELxrdvw@mail.gmail.com>
Subject: Re: [PATCH] hw/arm: Add missing ZynqMP ZCU102 -> USB_DWC3 Kconfig
 dependency
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Francisco Iglesias <francisco.iglesias@amd.com>,
 qemu-arm@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, 16 Feb 2023 at 09:27, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Oops I meant this as subject:
> "hw/arm: Add missing XLNX_ZYNQMP_ARM -> USB_DWC3 Kconfig dependency"
>
> On 16/2/23 10:23, Philippe Mathieu-Daud=C3=A9 wrote:
> > Since commit acc0b8b05a when running the ZynqMP ZCU102 board with
> > a QEMU configured using --without-default-devices, we get:
> >
> >    $ qemu-system-aarch64 -M xlnx-zcu102
> >    qemu-system-aarch64: missing object type 'usb_dwc3'
> >    Abort trap: 6
> >
> > Fix by adding the missing Kconfig dependency.
> >
> > Fixes: acc0b8b05a ("hw/arm/xlnx-zynqmp: Connect ZynqMP's USB controller=
s")
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>



Applied to target-arm.next with the subject line fixed, thanks.

-- PMM

