Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E14A8F2F23
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Nov 2019 14:24:04 +0100 (CET)
Received: from localhost ([::1]:42378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iShlb-0006Wa-T1
	for lists+qemu-devel@lfdr.de; Thu, 07 Nov 2019 08:24:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37482)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@gmail.com>) id 1iShkn-0005xz-My
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 08:23:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@gmail.com>) id 1iShkm-0000o2-Lm
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 08:23:13 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:43077)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <stefanha@gmail.com>) id 1iShkm-0000mK-D7
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 08:23:12 -0500
Received: by mail-wr1-x443.google.com with SMTP id n1so2971015wra.10
 for <qemu-devel@nongnu.org>; Thu, 07 Nov 2019 05:23:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=k+Fy0N48NABP7BgoQpKM62TPFUQoOWi0h+RBYbZ+M2c=;
 b=O4So0ABld4U2mGz6tTEFceo0pww3mclrCUYWrbjrFAJN+D40ruPP/uqMVH1OtOBA6V
 86psRmrrvhEvVTP7Y7bUjchWJlEY76ei7lh1oqZA05LNH88ImF90kGuUVCOLlVJJJtH6
 GAiCWWc1virp+xiepFP2AS3YXYzh5JFimJETRv7HsAM6jopeQrYKHkoTG3RmA6eili9u
 Zwi94419QDZcboHlkptFduPn4v/8z04m1WHaNzWFcUo5ORwYD+UTAphBUG/QiYjEyzAK
 TKl5WD0PXqb0b764Ya51YDnCtbm7X+sGuIBDLocDXfM2lKcdcPWSVAS4vOD/AY2X6EBO
 a9Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=k+Fy0N48NABP7BgoQpKM62TPFUQoOWi0h+RBYbZ+M2c=;
 b=M8h8upHmXmKwtXcZm/TYhwycjkHmg+dajNnQKGp8JR8grh+YELGzamWZxpDK2/NKeY
 jajDWnYXB3H0I35l67TMHHfquSM6Jl5RVDbDWdJOy282Koh0DiE4gW7YMC3W/VFowlRg
 VvuwZZHDuo19JrW1bilK6Tl1ebmbf1fRuIg6Hy77Kv+7b8HP+bRTnQVeCTXiqVbyMMAf
 XHaDuoPIGFX0H3U3EKu/7AQftVaxz1mMb9Kw49s6PS+CLOP87q+5yadnFK0Fo7THunla
 yBYtGEawmELnE53Iq3SQfuDZTsBYy7wA4jHDXipvmg1sC3OB215xeZ6ZooY6oBxWMd2d
 5Uow==
X-Gm-Message-State: APjAAAXsWKjnfa8y8wfESLVU7mKOGTHKm5atZWXSITgHMM8yQudovjaV
 0EphebXX+ix4+JVHMbfRkR4=
X-Google-Smtp-Source: APXvYqzvIb9lcdLW6LxZcAM/pPxkGo0hRdTMadFYbg34CI/Ir7qiE3UM0k1Odrwbz24zRrHvqmK3sg==
X-Received: by 2002:a5d:4645:: with SMTP id j5mr3047546wrs.329.1573132991295; 
 Thu, 07 Nov 2019 05:23:11 -0800 (PST)
Received: from localhost (77.119.131.75.wireless.dyn.drei.com. [77.119.131.75])
 by smtp.gmail.com with ESMTPSA id d11sm2119341wrn.28.2019.11.07.05.23.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Nov 2019 05:23:10 -0800 (PST)
Date: Thu, 7 Nov 2019 14:22:59 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: "Oleinik, Alexander" <alxndr@bu.edu>
Subject: Re: [PATCH v4 17/20] fuzz: add support for qos-assisted fuzz targets
Message-ID: <20191107132259.GC365089@stefanha-x1.localdomain>
References: <20191030144926.11873-1-alxndr@bu.edu>
 <20191030144926.11873-18-alxndr@bu.edu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="0lnxQi9hkpPO77W3"
Content-Disposition: inline
In-Reply-To: <20191030144926.11873-18-alxndr@bu.edu>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--0lnxQi9hkpPO77W3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 30, 2019 at 02:50:02PM +0000, Oleinik, Alexander wrote:
> +static char *qos_build_main_args()

Please use func(void) in C.  In C () functions have unspecified and
unchecked arguments whereas in C++ () means (void).  We want the
compiler to complain if arguments are passed to this function, so it
needs to be (void).

> +{
> +    char **path = fuzz_path_vec;
> +    QOSGraphNode *test_node;
> +    GString *cmd_line = g_string_new(path[0]);
> +    void *test_arg;
> +
> +    /* Before test */
> +    current_path = path;
> +    test_node = qos_graph_get_node(path[(g_strv_length(path) - 1)]);
> +    test_arg = test_node->u.test.arg;
> +    if (test_node->u.test.before) {
> +        test_arg = test_node->u.test.before(cmd_line, test_arg);
> +    }
> +    /* Prepend the arguments that we need */
> +    g_string_prepend(cmd_line,
> +            "qemu-system-i386 -display none -machine accel=qtest -m 64 ");

Does i386 need to be hardcoded?  An earlier patch declared a fuzz_arch
or similar variable (from TARGET_NAME).

--0lnxQi9hkpPO77W3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl3EGrMACgkQnKSrs4Gr
c8i8cQgAq4vmN/UBIxHirvzgJ7L9eDN5tS9CEt6NpSGfj1CPUmq+J1IfpCOWYwf4
dUPquMWRxuyQ3QS2AlCA0YdStpnkzqo/K8lEuHBRggiX5uGo4onsYTXM7L9m2zrR
JAZCsKid1lngB1HN/neGm+VR2x+T05PCXosNR+Sa97bsO/Q2mMe+u1Ln+edgmKmC
7jEGYZY+0Svtn/uPzLcsO3/KqzFSk457YvVGtBQRUrWDnbnDE86J6QhymCmmCcp9
Uyxct2EvMUpO7UlzL1cJBz7c3RvNPeKojyCACOtchGVhpaLMFDQzJCbSdMWAJhVJ
ZmcB9b8J3o+aUm8gGik3Dfi6W2lE6g==
=g6hQ
-----END PGP SIGNATURE-----

--0lnxQi9hkpPO77W3--

