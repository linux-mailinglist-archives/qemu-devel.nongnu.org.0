Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F94332250
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 10:47:28 +0100 (CET)
Received: from localhost ([::1]:33620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJYxb-0008BV-ME
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 04:47:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lJYtG-0004QR-Qf
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 04:42:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lJYtE-0003zp-FO
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 04:42:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615282975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=O3/YHhtt0nFh9XJoyKgcgE06oocOksGsEu1/BLb3tac=;
 b=fhwo0Z7G0G/KDlF3B9b3dsn8NAx9nDbWI3BKUk5m7TIqby4ETcNlAP/Ilz+mpb2pCeotqx
 1IilheYUEDmdEKMiU2GOmXbONKnBSRvV+nann8mgqH/uacVwc6r7T456jGrEouNMayxnFf
 JWC27Ief6HOVdMrEa/HoRotKnTP+lFY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-iYTllbZ2NEWgn311pUZv2w-1; Tue, 09 Mar 2021 04:42:51 -0500
X-MC-Unique: iYTllbZ2NEWgn311pUZv2w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7A38E26860;
 Tue,  9 Mar 2021 09:42:49 +0000 (UTC)
Received: from localhost (ovpn-115-70.ams2.redhat.com [10.36.115.70])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1224B5D9DC;
 Tue,  9 Mar 2021 09:42:48 +0000 (UTC)
Date: Mon, 8 Mar 2021 10:52:58 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Keqian Zhu <zhukeqian1@huawei.com>
Subject: Re: [PATCH v2 1/2] ramlist: Make dirty bitmap blocks of ramlist
 resizable
Message-ID: <YEYCClbYd36JLRHt@stefanha-x1.localdomain>
References: <20201130131104.10600-1-zhukeqian1@huawei.com>
 <20201130131104.10600-2-zhukeqian1@huawei.com>
 <20201217100501.GE4338@stefanha-x1.localdomain>
 <7306ed10-871a-58ab-06d4-daa1efc5c9a7@huawei.com>
 <bbfc0b13-0917-6851-e10f-c7001ff9fd22@huawei.com>
MIME-Version: 1.0
In-Reply-To: <bbfc0b13-0917-6851-e10f-c7001ff9fd22@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="YE0cVbtlxVHLD1pB"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIMWL_WL_HIGH=-0.251, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 wanghaibin.wang@huawei.com, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, kuhn.chenqun@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--YE0cVbtlxVHLD1pB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 26, 2020 at 03:11:53PM +0800, Keqian Zhu wrote:
>=20
> [...]
>=20
> >>> -        for (j =3D old_num_blocks; j < new_num_blocks; j++) {
> >>> -            new_blocks->blocks[j] =3D bitmap_new(DIRTY_MEMORY_BLOCK_=
SIZE);
> >>> +        if (extend) {
> >>> +            for (j =3D cpy_num_blocks; j < new_num_blocks; j++) {
> >>> +                new_blocks->blocks[j] =3D bitmap_new(DIRTY_MEMORY_BL=
OCK_SIZE);
> >>> +            }
> >>> +        } else {
> >>> +            for (j =3D cpy_num_blocks; j < old_num_blocks; j++) {
> >>> +                /* We are safe to free it, for that it is out-of-use=
 */
> >>> +                g_free(old_blocks->blocks[j]);
> >>
> >> This looks unsafe because this code uses Read Copy Update (RCU):
> >>
> >>   old_blocks =3D qatomic_rcu_read(&ram_list.dirty_memory[i]);
> >>
> >> Other threads may still be accessing old_blocks so we cannot modify it
> >> immediately. Changes need to be deferred until the next RCU period.
> >> g_free_rcu() needs to be used to do this.
> >>
> > Hi Stefan,
> >=20
> > You are right. I was thinking about the VM life cycle before. We shrink=
 the dirty_memory
> > when we are removing unused ramblock. However we can not rely on this.
> >=20
> > I also notice that "Organization into blocks allows dirty memory to gro=
w (but not shrink)
> > under RCU". Why "but not shrink"? Any thoughts?
> Hi,
>=20
> After my analysis, it's both unsafe to grow or shrink under RCU.
>=20
> ram_list.blocks and ram_list.dirty_memory[X] are closely related and
> both protected by RCU. For the lockless RCU readers, we can't promise the=
y
> always see consistent version of the two structures.
>=20
> For grow, a reader may see un-growed @dirty_memory and growed @blocks, ca=
using out-of-bound access.

Growth is safe because other threads only access pre-existing ranges
(below the old maximum size). They will only start accessing the newly
added ranges after resize.

Did you find a code path where this constraint is violated?

Stefan

--YE0cVbtlxVHLD1pB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBGAgoACgkQnKSrs4Gr
c8iEeQf8CxiGgNJuAyHSHx5T7BvSzjpesLRJdzcDUlQ5SDNXYeW3gxLWmKbQBvcR
eLjAZw3eGu39bddhLgsFmIRUnkLELmhkdrnUCi53nhHqnZsd04kSmPh0b6aDLBj+
b1YMEqhgERTAQezBn9N7OuS+zkZzmNt9ub8oyEnsqedwAvGNXOCbGIhlC83MYSbb
qksH37bjitj+RK7WwJk2/SKHL12E1yyEPyu2tigSLnJHgydLjd+zxELYIlP6Vi9N
kbNkJ3xIMPqwvoHOsYsc2dElqJom+gSjT9Rkxxlx4li6aE3YpC0w6TXDYbXkHYdM
3YI+OrYFDvhqWSJNcBuc4sek32dWyw==
=AEYx
-----END PGP SIGNATURE-----

--YE0cVbtlxVHLD1pB--


