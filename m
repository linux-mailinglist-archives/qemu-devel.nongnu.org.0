Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F31BCC2E2
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Oct 2019 20:46:06 +0200 (CEST)
Received: from localhost ([::1]:51088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iGSaZ-0003zD-Sp
	for lists+qemu-devel@lfdr.de; Fri, 04 Oct 2019 14:46:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35212)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lersek@redhat.com>) id 1iGSVh-0002QW-8C
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 14:41:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <lersek@redhat.com>) id 1iGSVf-0001hv-Rk
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 14:41:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55694)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <lersek@redhat.com>) id 1iGSVf-0001hb-Mn
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 14:40:59 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id F328B8125C;
 Fri,  4 Oct 2019 18:40:58 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-121-253.rdu2.redhat.com
 [10.10.121.253])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1ADED19C4F;
 Fri,  4 Oct 2019 18:40:48 +0000 (UTC)
Subject: Re: [PATCH 2/7] tests/libqos/fw_cfg: Document mm_fw_cfg_init to drop
 mm_fw_cfg_uninit
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20191003225437.16651-1-philmd@redhat.com>
 <20191003225437.16651-3-philmd@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <137fead7-0e93-7d86-dadd-68e0569cdb7b@redhat.com>
Date: Fri, 4 Oct 2019 20:40:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20191003225437.16651-3-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Fri, 04 Oct 2019 18:40:59 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/04/19 00:54, Philippe Mathieu-Daud=C3=A9 wrote:
> Document mm_fw_cfg_init() return value must be released
> with g_free(). mm_fw_cfg_uninit() was never used, remove it.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  tests/libqos/fw_cfg.c |  5 -----
>  tests/libqos/fw_cfg.h | 10 +++++++++-
>  2 files changed, 9 insertions(+), 6 deletions(-)
>=20
> diff --git a/tests/libqos/fw_cfg.c b/tests/libqos/fw_cfg.c
> index 37c3f2cf4d..ddeec821db 100644
> --- a/tests/libqos/fw_cfg.c
> +++ b/tests/libqos/fw_cfg.c
> @@ -126,11 +126,6 @@ QFWCFG *mm_fw_cfg_init(QTestState *qts, uint64_t b=
ase)
>      return fw_cfg;
>  }
> =20
> -void mm_fw_cfg_uninit(QFWCFG *fw_cfg)
> -{
> -    g_free(fw_cfg);
> -}
> -
>  static void io_fw_cfg_select(QFWCFG *fw_cfg, uint16_t key)
>  {
>      qtest_outw(fw_cfg->qts, fw_cfg->base, key);
> diff --git a/tests/libqos/fw_cfg.h b/tests/libqos/fw_cfg.h
> index 15604040bd..3247fd4000 100644
> --- a/tests/libqos/fw_cfg.h
> +++ b/tests/libqos/fw_cfg.h
> @@ -34,8 +34,16 @@ uint64_t qfw_cfg_get_u64(QFWCFG *fw_cfg, uint16_t ke=
y);
>  size_t qfw_cfg_get_file(QFWCFG *fw_cfg, const char *filename,
>                          void *data, size_t buflen);
> =20
> +/**
> + * mm_fw_cfg_init():
> + * @qts: The #QTestState that will be referred to by the QFWCFG object=
.
> + * @base: The MMIO base address of the fw_cfg device in the guest.
> + *
> + * Returns a newly allocated QFWCFG object which must be released
> + * with a call to g_free() when no longer required.
> + */
>  QFWCFG *mm_fw_cfg_init(QTestState *qts, uint64_t base);
> -void mm_fw_cfg_uninit(QFWCFG *fw_cfg);
> +
>  /**
>   * io_fw_cfg_init():
>   * @qts: The #QTestState that will be referred to by the QFWCFG object=
.
>=20

Sigh, we've never even called this function :/

Reviewed-by: Laszlo Ersek <lersek@redhat.com>

