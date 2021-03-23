Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2EC4346117
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 15:12:32 +0100 (CET)
Received: from localhost ([::1]:57662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOhln-0005yv-KF
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 10:12:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1lOhjz-0004is-RK
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 10:10:39 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:33553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1lOhjx-00063p-W4
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 10:10:39 -0400
Received: by mail-ed1-x534.google.com with SMTP id w18so23656906edc.0
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 07:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=19M9jO5gmPBsA6tnqpTyXgulOCz7sZIkiue1Yf29A1I=;
 b=trxz9DMeBDG+ko5mvGES0Y2BgwxRFp5rnBXshspf6W5eCeKu8I5vqFLZ6ClDxJcplB
 Md/C2o1IuthexHtFwsCDEcH4i97KQF02giMzrP01ohDPGW7mAhXA4mjKIYTUt7MUKF24
 TFcgwGhU/I0rW9sFTx8hLVa4VxR10eLU02md5D46aQ4q/HhZbUah/KpyqrOYWpuOYSrk
 TyJZJPcY+/kViTVtGVaVu6eXb2o5CXV6DlHTz8ngRCsM7PrnmgygQarCDZCPj6KHE/Cn
 tSjMxxoL9vc+fy7JFcV1tRYy4VKdwZdAPsmYfJaAocaIVzpnDUqGCKaMs1ghNS5cQ3bE
 S3cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=19M9jO5gmPBsA6tnqpTyXgulOCz7sZIkiue1Yf29A1I=;
 b=PNDrHGqAuGo3gZlLxzkwnhpNT0mmEdTKUqezZMVbKYRhBVB6bIdgOWjqLiVuZBN3H5
 72fEzmWHCHhuqbIr3a1OHkVUCkAOjQdRFg4uG0FVovftl7PDcB4BkBSYR7d1JmGY3qbV
 SyA8zzu4b7uT18ELGpLqKYwVKTNdj5fEtVsJs1PxpqlhN1dsrB5oCnIva981xvIIt31I
 4yTPIuqlChvk8BRNhQwGsCPEqi0Puhg/ZQRNV56ISUC7w1cePaM7koRQV1lkuyW+k/H4
 ZethYb09cw69uTLyX5jqJWezwKi32MJ5/5X9KvD3CH8OpnoabvjNXK7KdDs2hUqqPncc
 Lk4A==
X-Gm-Message-State: AOAM531zBvKO91M6k8KKgAPbY7b5ovmZCIwgNjycz24DCPGvI/sAQpFp
 LsiCcNR3WHBQrcTRUlDIlkMcQlUJlE0=
X-Google-Smtp-Source: ABdhPJwgtSmDvdCTkCUufsNhy5jME2bA1l1acS2waQXeQWYaOUfXk9JXx0Ow73Gwq7+o7Zp5YVr02A==
X-Received: by 2002:a05:6402:408:: with SMTP id
 q8mr4634006edv.201.1616508636641; 
 Tue, 23 Mar 2021 07:10:36 -0700 (PDT)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id r19sm11102481ejr.55.2021.03.23.07.10.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 07:10:35 -0700 (PDT)
Date: Tue, 23 Mar 2021 14:10:34 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [PATCH 6/8] virtiofsd: Changed allocations of fv_VuDev & its
 internals to GLib functions
Message-ID: <YFn22u3Bx3SzCgMP@stefanha-x1.localdomain>
References: <20210319132527.3118-1-ma.mandourr@gmail.com>
 <20210319132527.3118-7-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="xZTWFV8PF+BhYk/P"
Content-Disposition: inline
In-Reply-To: <20210319132527.3118-7-ma.mandourr@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=stefanha@gmail.com; helo=mail-ed1-x534.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--xZTWFV8PF+BhYk/P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 19, 2021 at 03:25:25PM +0200, Mahmoud Mandour wrote:
> Changed the allocations of fv_VuDev structs, VuDev structs, and
> fv_QueueInfo strcuts from using calloc()/realloc() & free() to using
> the equivalent functions from GLib.
>=20
> In instances, removed the pair of allocation and assertion for
> non-NULL checking with a GLib function that aborts on error.
>=20
> Removed NULL-checking for fv_VuDev struct allocation and used
> a GLib function that crashes on error; namely, g_new0(). This
> is because allocating one struct should not be a problem on an
> healthy system. Also following the pattern of aborting-on-null
> behaviour that is taken with allocating VuDev structs and
> fv_QueueInfo structs.
>=20
> Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
> ---
>  tools/virtiofsd/fuse_virtio.c | 19 ++++++-------------
>  1 file changed, 6 insertions(+), 13 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--xZTWFV8PF+BhYk/P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBZ9toACgkQnKSrs4Gr
c8gi1ggAxuFP6lNKKZcawIgrsAuArZKQ1Kghf0/IMLFFwBXqHlaOST0r9JuvZow0
sz9P2PokXGTw7gMv3MoRMYFpcyVwukgI9b0Afu28t/EnEDpPpk3gJdvhDGYYYuqH
AsN638KbuJaRonEXMwPu1KbD/zs8G2WqdER0jfimoOj5rFtO82vYxzSBgh/1Dxru
yIPaOFZ8JnfNr6DtUJLZmFAE6sSyZlT0L5osS9gDte7g1M55Q6VVeqtUDrSfbjsv
mBT9mr9S5hWuLSG7M8G3VipSXeILUGwm3WQvdfUvyRAj984o2bo4K4xTIrqjWc00
OY6AOlQhYVlujJx9i99yNFR933WQOw==
=7WM7
-----END PGP SIGNATURE-----

--xZTWFV8PF+BhYk/P--

