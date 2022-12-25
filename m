Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D67655D54
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Dec 2022 15:00:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p9RWp-0005AJ-Sf; Sun, 25 Dec 2022 08:59:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1p9RWk-0005AA-EF
 for qemu-devel@nongnu.org; Sun, 25 Dec 2022 08:58:58 -0500
Received: from kylie.crudebyte.com ([5.189.157.229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1p9RWi-0008PI-H0
 for qemu-devel@nongnu.org; Sun, 25 Dec 2022 08:58:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=a2L45WY8FcWTUkmc7hc8GTUV57pfuwisybODXsH6Cn8=; b=DQZ+OVkaUnLMcJ4DTlu/VGArRG
 JZLz37k3xi7plTrtlMFnmPNdaWyKZjmXWpZ2JUZv9bI0mSlw6S2DYkN5fUD51AEmUUu3AwG1moBE5
 laR5culQ0H+SzuhNYIBr+ULPpm5Yq4KUNu9t9kq7rvY/VmuqrgcKD+fp11fALHxh1la20akt4D+5I
 5J0vkPKPpMpETVjCQ4JYaAqpy+o+0YMX67MF0f4KXTski2mZDX406X5oLEJyDgtX3kGLFe37tpo3S
 MFLKLCboIBMy0sLoD5n/AR0xQlhf2ILKCYBmcdS2Bpu3Y3lSnpFVuoeU5/ewgO+/N4MyC6JpRMyPh
 H6dO/f3WNqmQQRl5uoiRsWpysQz34IX+AkFfUns6misq9//cIVJMJ3fQbPlMJaBI6pBfmVOklPRtd
 5uClpfNX43wFMte1V0rAyq1D4WyHs8bnHnYaD1bptVKTJlDvf6Pfrmi6EzopBEMltmB59cWWYio56
 9xNyJdzjUdPjJlYa6QPkzlxm2A62sJRukVtssB1obN5Y5IpkJKWAqSQBKNRQeIcM4EF3xN+Wbv7aq
 bcEidoY8qlNeGrlp8UUrhSyR+6gruZ46TvD8IOWU3rSwj3KZinDOFjcBA+C8Z+pO3ZPws/lHNGHik
 5KrbFMvyD8V1Uo4EdU7cu5/FaFs9yyvG1t0LxYOSc=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Volker =?ISO-8859-1?Q?R=FCmelin?= <vr_qemu@t-online.de>,
 Gerd Hoffmann <kraxel@redhat.com>, Qiang Liu <cyruscyliu@gmail.com>
Subject: Re: [PATCH] hw/audio/c97: fix abort in audio_calloc()
Date: Sun, 25 Dec 2022 14:58:51 +0100
Message-ID: <5669170.IcnYlorxoo@silver>
In-Reply-To: <20221225121357.498040-1-cyruscyliu@gmail.com>
References: <20221225121357.498040-1-cyruscyliu@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On Sunday, December 25, 2022 1:13:57 PM CET Qiang Liu wrote:
> Section 5.10.2 of the AC97 specification (https://hands.com/~lkcl/ac97_r2=
3.pdf)
> shows the feasibility to support for rates other than 48kHZ. Specifically,
> AC97_PCM_Front_DAC_Rate (reg 2Ch) should be from 8kHZ to 48kHZ.
>=20
> Before Volker R=FCmelin fixed it in 12f4abf6a245 and 0cbc8bd4694f, an adv=
ersary
> could leverage this to crash QEMU.
>=20
> Fixes: e5c9a13e2670 ("PCI AC97 emulation by malc.")
> Reported-by: Volker R=FCmelin <vr_qemu@t-online.de>
> Reported-by: Qiang Liu <cyruscyliu@gmail.com>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1393
> Signed-off-by: Qiang Liu <cyruscyliu@gmail.com>
> ---
>  hw/audio/ac97.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>=20
> diff --git a/hw/audio/ac97.c b/hw/audio/ac97.c
> index be2dd701a4..826411e462 100644
> --- a/hw/audio/ac97.c
> +++ b/hw/audio/ac97.c
> @@ -625,9 +625,14 @@ static void nam_writew(void *opaque, uint32_t addr, =
uint32_t val)
>          break;
>      case AC97_PCM_Front_DAC_Rate:
>          if (mixer_load(s, AC97_Extended_Audio_Ctrl_Stat) & EACS_VRA) {
> -            mixer_store(s, addr, val);
> -            dolog("Set front DAC rate to %d\n", val);
> -            open_voice(s, PO_INDEX, val);
> +            if (val >=3D 8000 && val <=3D 48000) {
> +                mixer_store(s, addr, val);
> +                dolog("Set front DAC rate to %d\n", val);
> +                open_voice(s, PO_INDEX, val);
> +            } else {
> +                dolog("Attempt to set front DAC rate to %d, but valid is"
> +                      "8-48kHZ\n", val);
> +            }

Missing space between "is" and "8-48kHz" and it is "Hz" (lower z). Except o=
f that:

Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>

>          } else {
>              dolog("Attempt to set front DAC rate to %d, but VRA is not s=
et\n",
>                    val);
>=20



