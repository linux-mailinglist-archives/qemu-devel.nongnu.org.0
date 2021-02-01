Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE3F30A7BC
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 13:37:06 +0100 (CET)
Received: from localhost ([::1]:50418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6YS1-00031s-Mm
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 07:37:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1l6YQq-00023A-K6
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 07:35:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52253)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1l6YQk-00069C-Me
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 07:35:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612182945;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bqjyJS0XijKgaX5b7CBr0c/gD850nfz297gfPSLEna4=;
 b=VniS3GfVq+WUPS3IV03b6vFOMSXCt9b++o6YljnlSg3OxaZWlmFLUeO4PCLJLS4ttJ/Zzm
 qV0Yp8Qn0yp9lHpTl0mK1wVydtlXv+iMp/vcH1k7Az2YGyl86EGXncDXTHw13a4BubumOT
 7P+TLPOfSy7sN2AXQrKWwIBx4oBeNBs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-328-wF9BoODqPKan9M900dwhfA-1; Mon, 01 Feb 2021 07:35:43 -0500
X-MC-Unique: wF9BoODqPKan9M900dwhfA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 415B210054FF;
 Mon,  1 Feb 2021 12:35:42 +0000 (UTC)
Received: from localhost (ovpn-113-25.rdu2.redhat.com [10.10.113.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D46FC1346F;
 Mon,  1 Feb 2021 12:35:41 +0000 (UTC)
Date: Mon, 1 Feb 2021 13:35:40 +0100
From: Sergio Lopez <slp@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v3 2/2] block: move blk_exp_close_all() to qemu_cleanup()
Message-ID: <20210201123540.joivoc2s4cq3iihi@mhamilton>
References: <20210121170700.59734-1-slp@redhat.com>
 <20210121170700.59734-3-slp@redhat.com>
 <20210201122030.GB13157@merkur.fritz.box>
MIME-Version: 1.0
In-Reply-To: <20210201122030.GB13157@merkur.fritz.box>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=slp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="5t5xohx4pfyqhj2l"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=slp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--5t5xohx4pfyqhj2l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 01, 2021 at 01:20:30PM +0100, Kevin Wolf wrote:
> Am 21.01.2021 um 18:07 hat Sergio Lopez geschrieben:
> > Move blk_exp_close_all() from bdrv_close() to qemu_cleanup(), before
> > bdrv_drain_all_begin().
> >=20
> > Export drivers may have coroutines yielding at some point in the block
> > layer, so we need to shut them down before draining the block layer,
> > as otherwise they may get stuck blk_wait_while_drained().
> >=20
> > RHBZ: https://bugzilla.redhat.com/show_bug.cgi?id=3D1900505
> > Signed-off-by: Sergio Lopez <slp@redhat.com>
>=20
> This patch loses the call in qemu-nbd and qemu-storage-daemon.

You're right, I'll prepare a v4 right away.

Thanks,
Sergio.

--5t5xohx4pfyqhj2l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEvtX891EthoCRQuii9GknjS8MAjUFAmAX9ZwACgkQ9GknjS8M
AjVOzw/+JQHl8nEkD83Gv2ZiEmpVY1wIigWRUPYtBAkcOsr4+3jbI6omDDV02/t+
9MSQmYhEbDNtITzESfLqzfTq3a/Db8qyDa1J0TYqZiS8AZBBPFmAMHYH/TLaIEHj
vgZ5PpYVeI5aBtjxhd83C8PaIDiSlE6cFAcgx23izrzpP07+SGinDlpj2jUGjpFf
a/oI1DdOee7uGqSHj2Mwty5lbLqsZ+fyTYP01l414oeYHXF4Ne/KLR2AOSPKNfQI
sIVzv5KaqPFjjex+YR9QQv7ZJ8hnIJdVokFUtmq3kQRmrSIif2Uf50tWTh/GhguE
WJbqJvyyqFLGU4WpdjaKxwWNeNX/Fl6dsoMBc/fmLHyi9j4VQcfkkPvPqoPaHozd
plruqOD8GJKY4hSNve1ebnZj3jOJ7IOnPiPp5GV0+XOulkyL2vvK6n8n8Mrbv48p
o/yLLGCRsqzlGZEVA9PdiH7mdAKE8Ov8gbxM0HrrMZXHMatovzed1UTdwXoc1aiH
JAewTVSiuBT8EmtUkGxnkHWrN7hw4CsxaCprxvtgcnB3ZhO52cjq05yxVO20A9E5
OHZZ5z/QLHTIyj2EF/FnBlXI4HvCOO/anfJH3+xamQSpjNvfCP4F0fYR721++mFP
+Q9L/SBQxDrEVWXrsmE2bGakZdlV+lg1BsIoAt0vcgkZGWijpYg=
=9N1n
-----END PGP SIGNATURE-----

--5t5xohx4pfyqhj2l--


