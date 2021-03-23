Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4B934613B
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 15:18:12 +0100 (CET)
Received: from localhost ([::1]:43810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOhrH-0004M4-UD
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 10:18:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1lOhit-0003hQ-Pr
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 10:09:31 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:34751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1lOhii-0005T5-GY
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 10:09:31 -0400
Received: by mail-ej1-x635.google.com with SMTP id b7so27337417ejv.1
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 07:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=VVHfHaHIBR8Glu6tK/hEBT8OX8pO0nehfiq56Gv1A48=;
 b=sYbtj8Lp2dLErNZcE+huHA2YncyHtoQO6nNVvpuZo5ppn0rG+w7ExHA67pRMjddNDv
 WCjhEFs1rL9hnZ3hHZahnZHpFZu+ASODedt8mDjC7CzXyPOf2wiAA2+JgNkzBuc9+IIw
 rZcUP2jP7Vrw7Esx10bykxPv0qJwE+8vm8Pyjn4mAZWUR52tYeGmv/0/WJ8NppVpQ/QM
 WMOsL0DZuHWVgfwqFxldosRpfKWNk5VU2tVELsAnlLyHrSKX3KQDftBuB8Knsv2OdjVM
 Nega0mTaDomoXe5+nbYZECm1eZrD4FK/eJs2Z6zDKQTfBHzg9qQ3VEJ+Ttv4ANa4h8E3
 DUAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VVHfHaHIBR8Glu6tK/hEBT8OX8pO0nehfiq56Gv1A48=;
 b=nG6rla2NMwHREDD05KUoDuIJ/jKi/K0ZsB+9rRWKpOJQxuGlQU4WgJkrT3QxtMHrH6
 bLNCUJ/wli6JgYkmKpG285/19efn8a5r2TPDHuPdh/Of5IBFuJ6KCpg5sVQRm8gTj7eV
 HMc7V6RuY2rj/CetaMp63E7+Vl1BBViNKoT+h2ibG6o8uJ9vZlXgkkUQ4wbAuN8gNOIV
 JzRDNwRE63nnTrnjXYEIfNKt4ktOLWcAOjJVjK8HrDxMjn8hcYFwW82VVM0JkO965D+K
 hR0Bk5iu4rgcPE2LSAWyc7JkqACfkzPQPNkbROuOoBNybLN8FOA3y5GwunB1OxEhh7BC
 +Jzg==
X-Gm-Message-State: AOAM5323+UmP93xyKhPPRaXhiAYynZxzv2BJsdiYEoa4hkc9l2Cn8CcS
 dxMvA8/3uRXlaQskEfiOMhY=
X-Google-Smtp-Source: ABdhPJzmb6OU0D3YoZbIKkH4CW8Nt2ZZpQy/IYWE4tinBIQGcMjbUmI6EArf/hI1+mxB7GSc96GljA==
X-Received: by 2002:a17:906:e48:: with SMTP id q8mr5315222eji.84.1616508557386; 
 Tue, 23 Mar 2021 07:09:17 -0700 (PDT)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id ho11sm10702621ejc.112.2021.03.23.07.09.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 07:09:16 -0700 (PDT)
Date: Tue, 23 Mar 2021 14:09:15 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [PATCH 5/8] virtiofsd: Changed allocation of lo_map_elems to
 GLib's functions
Message-ID: <YFn2i0NbNV91gVgV@stefanha-x1.localdomain>
References: <20210319132527.3118-1-ma.mandourr@gmail.com>
 <20210319132527.3118-6-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="911Sb8tq/7GgZ6lF"
Content-Disposition: inline
In-Reply-To: <20210319132527.3118-6-ma.mandourr@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=stefanha@gmail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--911Sb8tq/7GgZ6lF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 19, 2021 at 03:25:24PM +0200, Mahmoud Mandour wrote:
> Replaced (re)allocation of lo_map_elem structs from realloc() to
> GLib's g_try_realloc_n() and replaced the respective free() call
> with a g_free().
>=20
> Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
> ---
>  tools/virtiofsd/passthrough_ll.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--911Sb8tq/7GgZ6lF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBZ9osACgkQnKSrs4Gr
c8jJ5wf/c4U3dpuklc7P5HeD119mNHUOBV2LJvFU2SoMVCZSLm7DYxJDbpDTSQrw
CECTSo6d4KILGax+xcut8g1Ins/+veowYBbJA6t9c2uYt6eM6781wFXNu8URIgbo
3cEJ/e4A3TMKb0WZdHYnHTxObDSTNb7wxMApFlQH/qV5a/gH0RUyjUh6ZFNbymRQ
E04xR5MG/krXPzIxW3alA+qffLseEQ6iIdFrx+kCA4AG9W4CGWXgC8Ul4Pn+eSVJ
CXBJQT0BFyA9kmfLpddwwZm9lgSPZgo9EDNCq5D7hCpEy37SVjaJvE6yIuul6MZl
togMhjmcg5Ow2/TO05km68lRmptpMw==
=jAqu
-----END PGP SIGNATURE-----

--911Sb8tq/7GgZ6lF--

