Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CBF2C521A
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 11:34:55 +0100 (CET)
Received: from localhost ([::1]:36574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiEc2-0006X1-Ss
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 05:34:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>)
 id 1kiEZy-0005uc-Ck; Thu, 26 Nov 2020 05:32:46 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:44907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>)
 id 1kiEZw-0002cj-Qh; Thu, 26 Nov 2020 05:32:46 -0500
Received: by mail-oi1-x243.google.com with SMTP id y74so1749687oia.11;
 Thu, 26 Nov 2020 02:32:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3+Mxlv6Nd/uo7icmu0ecISLar6ooaj/Ded6ha4ra8hs=;
 b=LM7PixAS3BMNtoSBcFzzPrXOLEhBqtOQFRc8D+78mkIKFsyc/fIU414ndmhjlIztPW
 GohtLmjNJ/sFIVi709/aTff91O4hQ288GInbSDhCMoYAf17/f3z9u6f8Zzo2BtNLB82p
 I9UTwtMHl1ik8NWVO1OVhhkGVCj45B74W+qHbL/+JQgdor0oih5tP5s/EXeCm1hs8PGe
 5QcLvAWNYL29fODhaa9DagGmkcWbh/f1nEQmSR/tjsGMvU9fAcnWfpnZm7iuT856EDzg
 6b2ySDgGk0olX6vQLEB3pLi1Xtv1054jYeZG8MSsOxgAciBvNSuVAHYo2AbbXdXKuKhA
 pXYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3+Mxlv6Nd/uo7icmu0ecISLar6ooaj/Ded6ha4ra8hs=;
 b=cwcTTL9nxt06s5HReIwJl/ar/RjRlU7Ww3p7xIO73tXXJIoRWgkx6Am9P6nUQF2TGt
 mFmgOhhstHZETwwyUVeQM5WQyeYS9rRU7fEjI0mwe3QLGvu8gSTGSLercMWU/VpOSXpg
 7mGDOiGY04BsMwDg+zT6fckNGI8V3Q9yoglHNYJ45Z/EXk1IIqtJyWtXDn/U5qe6yf+H
 gObeMJ/98knidZAuOyY0P3F695UF4IvAM5pp6vdEFk0zchRwPkhIGdHgctMqihDfadBS
 SrD+FkNBIFlMnEq2VGy51kEAtjUqBtHoNmMr9yvR44QeIXka3bmm7TcyqcF+UzVgbQc2
 swuQ==
X-Gm-Message-State: AOAM531HGAC165mb5ayBq+fjfCQ3iQ+yaOPyHqSAW1xiRucQGM41fv2p
 d9+bV18gZazXwMlswe6xy13mJnbsUhjStHgOYgk=
X-Google-Smtp-Source: ABdhPJxdslI7RNqNMR5vKF93Xj15nz+N7byTxxk1EZ1Q0Uc16w8oPJE8a+HVZUPSVCA9LvKEkd2eMB1pTc1dLzgbOPY=
X-Received: by 2002:aca:cd17:: with SMTP id d23mr1688099oig.56.1606386763110; 
 Thu, 26 Nov 2020 02:32:43 -0800 (PST)
MIME-Version: 1.0
References: <20201126065702.35095-1-alex.chen@huawei.com>
In-Reply-To: <20201126065702.35095-1-alex.chen@huawei.com>
From: Li Qiang <liq3ea@gmail.com>
Date: Thu, 26 Nov 2020 18:32:07 +0800
Message-ID: <CAKXe6SKKqHAwbOHQzy3ZviQKrotFWKJ3h2Gtm0Aw1nk++3+eWw@mail.gmail.com>
Subject: Re: [PATCH] vnc: Fix a memleak in vnc_display_connect()
To: Alex Chen <alex.chen@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::243;
 envelope-from=liq3ea@gmail.com; helo=mail-oi1-x243.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: qemu-trivial@nongnu.org, zhanghailiang <zhang.zhanghailiang@huawei.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Qemu Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Alex Chen <alex.chen@huawei.com> =E4=BA=8E2020=E5=B9=B411=E6=9C=8826=E6=97=
=A5=E5=91=A8=E5=9B=9B =E4=B8=8B=E5=8D=883:10=E5=86=99=E9=81=93=EF=BC=9A
>
> Free the 'sioc' when the qio_channel_socket_connect_sync() fails.
>
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Alex Chen <alex.chen@huawei.com>

Reviewed-by: Li Qiang <liq3ea@gmail.com>

> ---
>  ui/vnc.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/ui/vnc.c b/ui/vnc.c
> index 49235056f7..dae56e9493 100644
> --- a/ui/vnc.c
> +++ b/ui/vnc.c
> @@ -3743,6 +3743,7 @@ static int vnc_display_connect(VncDisplay *vd,
>      sioc =3D qio_channel_socket_new();
>      qio_channel_set_name(QIO_CHANNEL(sioc), "vnc-reverse");
>      if (qio_channel_socket_connect_sync(sioc, saddr[0], errp) < 0) {
> +        object_unref(OBJECT(sioc));
>          return -1;
>      }
>      vnc_connect(vd, sioc, false, false);
> --
> 2.19.1
>
>

