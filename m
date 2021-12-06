Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4F74698E4
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 15:29:33 +0100 (CET)
Received: from localhost ([::1]:56494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muEzk-00031o-O8
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 09:29:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1muExX-000861-U4
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 09:27:15 -0500
Received: from [2a00:1450:4864:20::42b] (port=43992
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1muExV-00032U-3b
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 09:27:15 -0500
Received: by mail-wr1-x42b.google.com with SMTP id v11so22760759wrw.10
 for <qemu-devel@nongnu.org>; Mon, 06 Dec 2021 06:27:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=cY4S0jSiyaDrkbOrA2xKtjk8Eg4+GPUsMDWf2Uw0nS4=;
 b=ScyNZtEjpDqW+ihKouJXsXSNOstfVEL3/0NQnq5us8aqSWyzU2Dmk3Fqkc//BXYnXZ
 v0iKKBrfhIAkI7RbV6UEUmwqTpgojJJtE4vtzJfAa42DH7y6y3eRi6vs9Kaq1SKQHL4d
 Dw4QHO34xCxvFjbi3FoWwExK7OYnQJy0xmeGIPjBt1EMgcoV8mIt/9V07Rvwq3MkyyNH
 g3To7hifxJKaDVw9Mi0M/5S8Y+8UcFfPrTptm8GkYGVr3L6hud7MKJk8s++vPqVpzTGh
 UYWbJgOux2SP2M9PlMI2L+hoQJfn7miaQojXHSn4IcDgy9Inm0dZzcwPR0LCrOvCvPUa
 OXCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cY4S0jSiyaDrkbOrA2xKtjk8Eg4+GPUsMDWf2Uw0nS4=;
 b=P205DP7AAWZYLi75VB+A+zvpYXgd1mzef4620vwg68+TPCemVS0wxNeMUYj07FvjCZ
 v1j0ax5R7PYg6bfNM0eUt0l96jfLgG90q4GFQwY68uXZM2tLGJYUPPCvsWDm56bJicD5
 aeqgy+DwJ3UZXnMbbI9btlBkl3NXDqThL7xoTVFRj8DNN1nPGRAbMANsvOU5e6WWP8nh
 +qSYLkQO9MkFXyPtBvD4PtPkmYSW3clDqzMT/Z77AFk2HSM6p1RRtNjbFPyuwVqK+XyF
 kyWeioODtLaHkRiEeBuEfozec/XzemH5t9VsEuthz1+eFIJo0c6O9X5Z7fZu31Porqe8
 Bk0g==
X-Gm-Message-State: AOAM53177N/Y4w1hUp34L8I0vWQqZJDZgEnjwutvi0PJOiU2OaQd5HwV
 Eq954VRG/GAEuktUVnGMvsy94C0DIYo=
X-Google-Smtp-Source: ABdhPJxGYawni/GpcSXJlSYZiup2eV0fzpMl0ku/AIAjlizlFKjyMeaTI7QhGWaABDrHYYwm/WhKLw==
X-Received: by 2002:adf:f602:: with SMTP id t2mr44207230wrp.539.1638800502246; 
 Mon, 06 Dec 2021 06:21:42 -0800 (PST)
Received: from localhost (109.9.90.146.dyn.plus.net. [146.90.9.109])
 by smtp.gmail.com with ESMTPSA id bg34sm14491063wmb.47.2021.12.06.06.21.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Dec 2021 06:21:41 -0800 (PST)
Date: Mon, 6 Dec 2021 14:21:39 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Mark Mielke <mark.mielke@gmail.com>
Subject: Re: [PATCH] virtio-blk: Fix clean up of host notifiers for single MR
 transaction.
Message-ID: <Ya4cc/nBM0wyTaM7@stefanha-x1.localdomain>
References: <CALm7yL08qarOu0dnQkTN+pa=BSRC92g31YpQQNDeAiT4yLZWQQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="DfTzpr3ec5ICQ/zT"
Content-Disposition: inline
In-Reply-To: <CALm7yL08qarOu0dnQkTN+pa=BSRC92g31YpQQNDeAiT4yLZWQQ@mail.gmail.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=stefanha@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--DfTzpr3ec5ICQ/zT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 02, 2021 at 11:26:51AM -0500, Mark Mielke wrote:
> The code that introduced "virtio-blk: Configure all host notifiers in
> a single MR transaction" introduced a second loop variable to perform
> cleanup in second loop, but mistakenly still refers to the first
> loop variable within the second loop body.
>=20
> Fixes: d0267da61489 ("virtio-blk: Configure all host notifiers in a
> single MR transaction")
> Signed-off-by: Mark Mielke <mark.mielke@gmail.com>
> ---
>  hw/block/dataplane/virtio-blk.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks, applied to my block tree:
https://gitlab.com/stefanha/qemu/commits/block

Stefan

--DfTzpr3ec5ICQ/zT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmGuHHMACgkQnKSrs4Gr
c8j1ygf/e8AaRClYPCMyA9opdi7yWeYZ7xv+HUJooAaoqemSi/qJwFTkWhWfbe0R
OrY37Bktr2sdCp4CVTyvnWyfSMVzoGXWb/ffTWnkIJIduSDnCPRhc+W982qIBE6E
R3W+gbhqCh9dYXtZQltXUvKZcygWOqj9Id4b0m0AFO51cYBgRCkgl9FnraqvPiym
t2npFAkfJtmGQH+NF8i+5F+Z4kFyvYmxKQfF2oiQxzftfCtMXvdVskvJbUo19gPi
iKv3BJKR97+IiIoAuYaqbhE0QBOPkVl5+0B0hco1xBK1+HPKa6zwAIA2qRKXks9C
hVIUpTKR4j3i3CwSyCipy9eAZzkS1g==
=VLM/
-----END PGP SIGNATURE-----

--DfTzpr3ec5ICQ/zT--

