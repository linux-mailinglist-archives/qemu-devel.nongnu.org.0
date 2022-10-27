Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 071EB60F318
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 11:01:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onyjH-0003Lk-Hu; Thu, 27 Oct 2022 04:59:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1onyj6-0003EI-PZ
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 04:59:01 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1onyj4-0002NB-7c
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 04:59:00 -0400
Received: by mail-wr1-x42d.google.com with SMTP id z14so1029124wrn.7
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 01:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HlK9CJNg/9rsUzm71jPR98pXYeeVDstCpBqW8I8CNA4=;
 b=YlBXV8QXZlvjUNP3tQKPHYVepyIjaF5Ovz4hkGV6jofMtO534xsxbsnmq6f+9bBqyd
 3RjepHNx//neEJS3lSvYWkgnSl/ktz4y4m+m6LkbFuLEaYl5Qh/9+EonuCS4zxLcGNdc
 2c9mpfGEN1ETOTQyg4pjyKL7qbQjn0I5lQMVSolifACzLyERYo71Kp+6q3ZQZPvfdmFi
 jhska+a4iIZIo/WweOmG/+ryJ4B/VlslraCZ38sOBZ2GQgf9OXmBXUgluNA/O7ajMnjh
 OwH4dxDl1T1z9MOoJE89gqhlsJLL7SgpytBP+i8mmw4yar70tD/yMvLd6CceMozyvQqa
 LObA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=HlK9CJNg/9rsUzm71jPR98pXYeeVDstCpBqW8I8CNA4=;
 b=r6CHhysYkovXgJWuply7VCpUcmm4MUnIV3iYA+sW8wBkuuPQM0GEFQo2l2Lsu/SwrI
 d2S1wmgJOO0/gyw/r1ur2uFnM3f1ca8RanFhqp56Ewq52hMVAdKJDoybU/dq4+bN8vPN
 XXjxWUWX/oovay1Dv0IDh/3Xt/vE5G4nrvC8sztWf4l9ezkYcTXoFPtwnqlHX430HvZI
 VAKJp9WpCvRDF/7yyTEH1Ly7oU2jb5P0mR66XkJDacAXqczWH86go4jtcUswonwXLN2o
 TNeEYbpSGg/4WOlql5eDM3L2n8GjNJIic46/v1DKhuq8q1CfXiiZnmpIaEV2YijIZolM
 8Qvg==
X-Gm-Message-State: ACrzQf3gqLjrLGg6qNRwzLTk4DRuAL+KyNvm99/Q4bJBhDuHyQl10/Zd
 llyXwCGFgz1lY11CCUPsL/A9lQ==
X-Google-Smtp-Source: AMsMyM77tWKKcuvcrigafDwCzk9KcKoAesgG7RQROTl8z9x/JYo0weCt44sLmZ+v0mNPt8YKddDXpQ==
X-Received: by 2002:adf:d843:0:b0:236:6231:113b with SMTP id
 k3-20020adfd843000000b002366231113bmr17057263wrl.42.1666861135337; 
 Thu, 27 Oct 2022 01:58:55 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 l3-20020a05600c4f0300b003a5f3f5883dsm4481191wmq.17.2022.10.27.01.58.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 01:58:54 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5F8721FFB7;
 Thu, 27 Oct 2022 09:58:54 +0100 (BST)
References: <20221015050750.4185-1-vikram.garhwal@amd.com>
 <20221015050750.4185-9-vikram.garhwal@amd.com>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Vikram Garhwal <vikram.garhwal@amd.com>
Cc: qemu-devel@nongnu.org, stefano.stabellini@amd.com, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony Perard <anthony.perard@citrix.com>, Paul
 Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 08/12] hw/xen/xen-hvm-common: skip ioreq creation on
 ioreq registration failure
Date: Thu, 27 Oct 2022 09:46:47 +0100
In-reply-to: <20221015050750.4185-9-vikram.garhwal@amd.com>
Message-ID: <87bkpx3anl.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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

> From: Stefano Stabellini <stefano.stabellini@amd.com>
>
> On ARM it is possible to have a functioning xenpv machine with only the
> PV backends and no IOREQ server. If the IOREQ server creation fails conti=
nue
> to the PV backends initialization.
>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
>  hw/xen/xen-hvm-common.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
> index f848f9e625..7bccf595fc 100644
> --- a/hw/xen/xen-hvm-common.c
> +++ b/hw/xen/xen-hvm-common.c
> @@ -777,7 +777,11 @@ void xen_register_ioreq(XenIOState *state, unsigned =
int max_cpus,
>          goto err;
>      }
>=20=20
> -    xen_create_ioreq_server(xen_domid, &state->ioservid);
> +    rc =3D xen_create_ioreq_server(xen_domid, &state->ioservid);
> +    if (rc) {
> +        DPRINTF("xen: failed to create ioreq server\n");

This should be a warn_report to properly inform the user.

> +        goto no_ioreq;

Maybe pushing the rest of this function into a local subroutine would
reduce the amount of goto messing about. Other candidates for cleaning
up/modernising:

  - g_malloc to g_new0
  - perror -> error_setg_errno

> +    }
>=20=20
>      state->exit.notify =3D xen_exit_notifier;
>      qemu_add_exit_notifier(&state->exit);
> @@ -842,6 +846,7 @@ void xen_register_ioreq(XenIOState *state, unsigned i=
nt max_cpus,
>      QLIST_INIT(&state->dev_list);
>      device_listener_register(&state->device_listener);
>=20=20
> +no_ioreq:
>      xen_bus_init();
>=20=20
>      /* Initialize backend core & drivers */


--=20
Alex Benn=C3=A9e

