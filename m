Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FFD4E6116
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 10:28:55 +0100 (CET)
Received: from localhost ([::1]:57238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXJm2-0007Dn-Nh
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 05:28:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nXJkF-0006VG-Im
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 05:27:03 -0400
Received: from [2a00:1450:4864:20::435] (port=41770
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nXJkD-0003lu-Sk
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 05:27:03 -0400
Received: by mail-wr1-x435.google.com with SMTP id h23so5688582wrb.8
 for <qemu-devel@nongnu.org>; Thu, 24 Mar 2022 02:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=DbbKVfSG+W+UUvPvAfEPWBHgigTrCBH7QRFrDAx4YvM=;
 b=FWvzN4ZIzl8P+HNpIeB7yIJ7DR3ThCMmWSt1ZmUBjHGCLvicI3ImCADL9Sjx+aajcq
 KGIUvtZWtKJPt7mz41pVEXVX8GGvj7EZpG7YIHUWi9m/KK417h9ky0+PwQKrxMzuTrRF
 okO/ceBy8p3eIq37+c5szLhMLBuGawHBezcuy3U7GtP2kJPDmkPKf6YIJlJj5wawZjuT
 DxGhV9rKdZvfZyMSD/nE7ohPZnM9IpWdXbXgtXgBdlj+XX9GXfu8ubNcpm0Zmf4UZWaL
 uwR3yR2B6cPcDDZSWT9VzZx+vHycS6k2oLn8Mrg+m2bFWF8v3vUD+lVJpv+aLlxphBxH
 itxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DbbKVfSG+W+UUvPvAfEPWBHgigTrCBH7QRFrDAx4YvM=;
 b=nVprREgeyl56DeEPWrwN0X2Xq+g8N1Lr4GlRd1VRsEi6kZWkIHzy3rJhWnyD0NeZVC
 +VuytRbLjGKxBLl2iaree8+KDfV6KxvUyhB/gXNFAWzZqt8x47YT9ohLVowmRgJUEu1f
 UC/w3MAHYh+srN7GdtXqNVp6ZGTs1rh3DI1sy4UciLd3YAhf3QSez4qPGIvQfkpb2+c+
 WmI8/2hrTUClFAJbWN8F2nQo2lmNEKZTTMSJIzeY7wWeo/o+KReBfv8yD2UVqcAu75Ha
 /vunCTYRWsh1Jy22f2AOGEWnEfjsAEOPqntYR705/Yd7dD7L8+EBdfM8b3tjWGxtBizQ
 pUcw==
X-Gm-Message-State: AOAM532YVZkC7kNXFM4b7Crb24g+UzHGpgj9C60sGimHKTgQWF08feuV
 h6EmOirRhgkWrbGezQ8BXdQ=
X-Google-Smtp-Source: ABdhPJyE/H0mLTiagSEFajJZuJSAD/KoZJSCNPvT/ph493KQ+PwH8vozGIL+bI6frQdHD9Mh9cnAcA==
X-Received: by 2002:a05:6000:384:b0:203:ed51:8ab3 with SMTP id
 u4-20020a056000038400b00203ed518ab3mr3684557wrf.211.1648114020015; 
 Thu, 24 Mar 2022 02:27:00 -0700 (PDT)
Received: from localhost (109.9.90.146.dyn.plus.net. [146.90.9.109])
 by smtp.gmail.com with ESMTPSA id
 p125-20020a1c2983000000b00389cc36a3bfsm5957166wmp.6.2022.03.24.02.26.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Mar 2022 02:26:59 -0700 (PDT)
Date: Thu, 24 Mar 2022 09:26:58 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH 00/32] Misc cleanups
Message-ID: <Yjw5Yp+/4RHqZf8K@stefanha-x1.localdomain>
References: <20220323155743.1585078-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="MVbhhHfjRINAFom5"
Content-Disposition: inline
In-Reply-To: <20220323155743.1585078-1-marcandre.lureau@redhat.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=stefanha@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--MVbhhHfjRINAFom5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 23, 2022 at 07:57:11PM +0400, marcandre.lureau@redhat.com wrote:
> Various cleanup patches gleaned while working on different things. A good half
> of them are realted to cleaning up qemu-common.h.

I didn't review the patches in detail but have no concerns in the areas
that I maintain:

Acked-by: Stefan Hajnoczi <stefanha@redhat.com>

--MVbhhHfjRINAFom5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmI8OWIACgkQnKSrs4Gr
c8jwjgf+PwQHS6+EKp+lh0TiqVvTlLJQB9LZcCVRb2wXurZ1dplUMYAv3NxgW0Pz
Ehq6aq2zKmScEiu0JtVw8Wje34DnkveRJhTjvLHk/kNk9pGo8fPhpqnYiqNXIRXH
Df23xDkImWx5rilvDqx0enT56f/pF6vCVk1VCpHDJyaza4QHsdAVUfkmUSgyaHEV
furP5jAqSTcLZIOSL5csNR/em3kFSZHcoEzhjd+P18E5Oe1d4pHUgo0kE2EgYlvu
aZA95JtxCYaYftBv8IUr7s4AtJ+FBEV7pw0EOPpniEWUKvxVJEIUNmzr9x4hc1du
WX6E3fIJD7rovTDV6ZL5/vKWAfsb/Q==
=ffhV
-----END PGP SIGNATURE-----

--MVbhhHfjRINAFom5--

