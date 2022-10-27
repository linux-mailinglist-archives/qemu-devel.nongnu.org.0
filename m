Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0984F60F3A7
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 11:25:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onz7g-000332-Lm; Thu, 27 Oct 2022 05:24:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1onz7c-0002RT-Rg
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 05:24:20 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1onz7a-0006Yk-Hh
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 05:24:20 -0400
Received: by mail-wr1-x432.google.com with SMTP id bk15so1096780wrb.13
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 02:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jDTjrVScAlJawu8O4rOrl/s+z1ctwZBTr4dK/zNh2kk=;
 b=dbNT40tpHaizjJf90K0GLRgx8AmjLic8rHnbmqMrjgOlq8louULOewrNvFFSM7M+gT
 gTKv82My1kp9pHHyoX4vCyyoJcswugjNnJE2qecfdl0nwsN5wBHgc+wx//mUT2tuXP7B
 D304uZejigrgCcEwBike5XRZEFdRCpnQxgIzOpvsQcevPVm0NljDNWpJ0f47KyC9GVa5
 otETWhh6XPk8F4jgRTWVNBtZk33/iOltNy502agfrectvcogqiK9X4ZdMhTv0/SKoQg2
 Fe++HYepBuBZ1o5gYSS71EPctyq+G1zIM7jxgEiRAiAbPMfqt3vj2jqiLqHqCzrBVVQY
 3mqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=jDTjrVScAlJawu8O4rOrl/s+z1ctwZBTr4dK/zNh2kk=;
 b=vRU6CsFgr5wxIfJGvfY/IuoRABOBZ/r1S4IDDTIlfArIIm+nwDi7qQEuEIIXUS8BO5
 sy6EHKyYmWrcNKOHlvCzPN8dnNJse8LdU4LJzFSC872aeKTnWCOuOJYp9ZRT9DBtHfRa
 mnT00/DOhUKC/iW0jicVNBg+WJjTK9HVy53rFQeo2sfq/1DkIopBnam7xc5OXNBegOhp
 mOrqxQygIp5TENa/dGWmEx7F9+c9NwuDjqjqRjpuHvKKsPfpg5uyQzWZLEKyW/IgjrLX
 8ii560TuavLpqEFsRs0yPEV+sKTQojZDeHD/zaYstGiT6DbAoUOpHhyl6rplmFWYGSl+
 hPFA==
X-Gm-Message-State: ACrzQf3qj1nzUufnEXdlbATTvmwl82g9pQMXQ4A+nk2MMLaxECVYeh1z
 R0mae1YeEMWZXE2qTBZYbELx2Q==
X-Google-Smtp-Source: AMsMyM6N4jvLFy+y/t7rQnlbUN+Se1FB5PabUpFJR3tGTSgQmy2PSOfE7OmGVTDLLzGAeL4+arSrKQ==
X-Received: by 2002:adf:b646:0:b0:221:76eb:b3ba with SMTP id
 i6-20020adfb646000000b0022176ebb3bamr30840721wre.237.1666862656717; 
 Thu, 27 Oct 2022 02:24:16 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 y16-20020adfd090000000b0022ae401e9e0sm625789wrh.78.2022.10.27.02.24.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 02:24:16 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BF57E1FFB7;
 Thu, 27 Oct 2022 10:24:15 +0100 (BST)
References: <20221015050750.4185-1-vikram.garhwal@amd.com>
 <20221015050750.4185-10-vikram.garhwal@amd.com>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Vikram Garhwal <vikram.garhwal@amd.com>
Cc: qemu-devel@nongnu.org, stefano.stabellini@amd.com, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony Perard <anthony.perard@citrix.com>, Paul
 Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 09/12] accel/xen/xen-all: export
 xenstore_record_dm_state
Date: Thu, 27 Oct 2022 10:14:40 +0100
In-reply-to: <20221015050750.4185-10-vikram.garhwal@amd.com>
Message-ID: <87pmed1uww.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Vikram Garhwal <vikram.garhwal@amd.com> writes:

> xenstore_record_dm_state() will also be used in aarch64 xenpv machine.
>
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
>  accel/xen/xen-all.c  | 2 +-
>  include/hw/xen/xen.h | 2 ++
>  2 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/accel/xen/xen-all.c b/accel/xen/xen-all.c
> index 69aa7d018b..276625b78b 100644
> --- a/accel/xen/xen-all.c
> +++ b/accel/xen/xen-all.c
> @@ -100,7 +100,7 @@ void xenstore_store_pv_console_info(int i, Chardev *c=
hr)
>  }
>=20=20
>=20=20
> -static void xenstore_record_dm_state(struct xs_handle *xs, const char *s=
tate)
> +void xenstore_record_dm_state(struct xs_handle *xs, const char *state)
>  {
>      char path[50];
>=20=20
> diff --git a/include/hw/xen/xen.h b/include/hw/xen/xen.h
> index afdf9c436a..31e9538a5c 100644
> --- a/include/hw/xen/xen.h
> +++ b/include/hw/xen/xen.h
> @@ -9,6 +9,7 @@
>   */
>=20=20
>  #include "exec/cpu-common.h"
> +#include <xenstore.h>

This is breaking a bunch of the builds and generally we try and avoid
adding system includes in headers (apart from osdep.h) for this reason.
In fact there is a comment just above to that fact.

I think you can just add struct xs_handle to typedefs.h (or maybe just
xen.h) and directly include xenstore.h in xen-all.c following the usual
rules:

  https://qemu.readthedocs.io/en/latest/devel/style.html#include-directives

It might be worth doing an audit to see what else is including xen.h
needlessly or should be using sysemu/xen.h.=20

>=20=20
>  /* xen-machine.c */
>  enum xen_mode {
> @@ -31,5 +32,6 @@ qemu_irq *xen_interrupt_controller_init(void);
>  void xenstore_store_pv_console_info(int i, Chardev *chr);
>=20=20
>  void xen_register_framebuffer(struct MemoryRegion *mr);
> +void xenstore_record_dm_state(struct xs_handle *xs, const char *state);
>=20=20
>  #endif /* QEMU_HW_XEN_H */


--=20
Alex Benn=C3=A9e

