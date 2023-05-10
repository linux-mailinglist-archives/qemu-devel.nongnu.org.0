Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 339FF6FD882
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 09:48:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pweY3-0001N1-CT; Wed, 10 May 2023 03:47:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <olaf@aepfle.de>)
 id 1pweY1-0001Mo-Sp; Wed, 10 May 2023 03:47:41 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.53])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <olaf@aepfle.de>)
 id 1pweXz-0000bx-SR; Wed, 10 May 2023 03:47:41 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1683704854; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=c+CEDxctFw9MGyl+F0u5UkTweo5v0QOac6s+9XQ6Ohek4sU9Nb3NjkBNLbSQc3X29p
 2CdyvI911gHLpvKz5hoLu9JjuuFsgzR03VUCr3SZIXms9NAuW4Vy/4dkmPrw/6Bmb3VE
 UaKnuTGT9JE19bACRywlR5HYy5J9SP5i+dEpyT0WfPDm+I1nkuMMxICFkySkA8PBh//v
 zYzqBsOlfTKBjA5deCHf/cJKV82V3nAqC+1UXGM60F9mI92Y7GYFpBzciNLxVDzBA3FR
 xyNUlQNb3+DhS06zMkpwAnhugHKGDm9+gjh8CWGnwJ9h94hc8eWIx8zj2CkabD+uw4zd
 DTUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1683704854;
 s=strato-dkim-0002; d=strato.com;
 h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
 From:Subject:Sender;
 bh=fpMbxRbaAtliiEqD3yXPNT5MQEGuwjFCZILVH7eZVLE=;
 b=XkgGWnjmjh0LovQ0y1CUSjs5+WREcOsUOUk2zLuJUHTOca4+aEyZByxpsEApoFkNRP
 3vb/lhdYvmeiRPtqOpm+hO1CnErrXS3BbUw3z7UXTxAPf6IM6u/fYlRmL/f1ncMbd5Vd
 vc4PvG8GsrAWhNm9AWYo+sKFlMdH0Hxq7+tfiMdv+1UbkfeuqJ8o9sBaFNC3dvXfYQ+N
 K2RHk8N/icC5Qdh+7z6PT7Qfi2nSU6NZlRagbdQzoEUpOpF1fUI/D3C/cK+CJ4y26ogE
 OikicXS+faaliiYj5wACVqMsdvoINRbdK0p9qbyFkdc7RigZiHZqSIuBUk/WE3Gi70iT
 ei1Q==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1683704854;
 s=strato-dkim-0002; d=aepfle.de;
 h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
 From:Subject:Sender;
 bh=fpMbxRbaAtliiEqD3yXPNT5MQEGuwjFCZILVH7eZVLE=;
 b=VtAUsFP4F+JSerLh8MZ7ULl38l9Hj85X55W1atDN/NNfPVXUtGM+qCJwizusxv+wTa
 k1OQywRxHqXhEF3+6Tp3C0rZfJ0hnxu3t5FZPVAgSMlFNIiQrS/l2caM/mw8BlrSQ+bc
 I1o3q2aH4XKDsO5iMgxenQnNE1DsBRu47zqWRl4wMrLEtwXfffrG1DHxQn4SEg/rAcDK
 2xPb1GStX2e7yg6n1ZFTCf/sY+bfKs97VNWNNnBmaIX5Ji+bO9t9VZPxvKRa6rB2yuIN
 4v4Fkyoq3W4RFutJiRg+JvonSO8WuY1KmqSLnkXwsfRM4BxaiI4/ehGUgDCBfKozldBN
 2IiQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1683704854;
 s=strato-dkim-0003; d=aepfle.de;
 h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
 From:Subject:Sender;
 bh=fpMbxRbaAtliiEqD3yXPNT5MQEGuwjFCZILVH7eZVLE=;
 b=krAmvBX6oRNRFqJB0vvQOHessJgvwMw5kZBnFSJhW2UNLeDlEB/rHcpLzraKPVRrcM
 4iIe2hNTHbCfynLvd7Dg==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisR4ARWIYxzstZKeVom+bauo0LKSCjuo5iX5xLikmg=="
Received: from sender by smtp.strato.de (RZmta 49.4.0 AUTH)
 with ESMTPSA id x6987cz4A7lY8oh
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 10 May 2023 09:47:34 +0200 (CEST)
Date: Wed, 10 May 2023 09:47:19 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?=
 <f4bug@amsat.org>
Subject: Re: [PATCH v2] piix: fix regression during unplug in Xen HVM domUs
Message-ID: <20230510094719.26fb79e5.olaf@aepfle.de>
In-Reply-To: <20230509225818.GA16290@aepfle.de>
References: <20210317070046.17860-1-olaf@aepfle.de>
 <4441d32f-bd52-9408-cabc-146b59f0e4dc@redhat.com>
 <20210325121219.7b5daf76.olaf@aepfle.de>
 <dae251e1-f808-708e-902c-05cfcbbea9cf@redhat.com>
 <20230509225818.GA16290@aepfle.de>
X-Mailer: Claws Mail 20230504T161344.b05adb60 hat ein Softwareproblem,
 kann man nichts machen.
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/R/2sS42QIzwYzqn.D6NtiKf";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=85.215.255.53; envelope-from=olaf@aepfle.de;
 helo=mo4-p01-ob.smtp.rzone.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--Sig_/R/2sS42QIzwYzqn.D6NtiKf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Wed, 10 May 2023 00:58:27 +0200 Olaf Hering <olaf@aepfle.de>:

> In my debugging (with v8.0.0) it turned out the three pci_set_word
> causes the domU to hang. In fact, it is just the last one:
>=20
>    pci_set_byte(pci_conf + 0x20, 0x01);  /* BMIBA: 20-23h */
>=20
> It changes the value from 0xc121 to 0x1.

If I disable just "pci_set_word(pci_conf + PCI_COMMAND, 0x0000);" it works =
as well.
It changes the value from 0x5 to 0.

In general I feel it is wrong to fiddle with PCI from the host side.
This is most likely not the intention of the Xen unplug protocol.
I'm sure the guest does not expect such changes under the hood.
It happens to work by luck with pvops kernels because their PCI discovery
is done after the unplug.

So, what do we do here to get this off the table?


Olaf

--Sig_/R/2sS42QIzwYzqn.D6NtiKf
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmRbTAcACgkQ86SN7mm1
DoBRfg//cAC+i271H3HLPzevJR+ToZ3Ywxfz+e53Xk6RnVZfy79aWT9delbKNvoo
/sEmxurXHIjU2vHju5bE7C4s8J8oTjjY/vgJrnBp0IIoDNF7s2DNPdpWP31bdC32
AzWMm2kzCWYbTf2k0ByGQ2FlyxJi17fbXaIgwMsmhG6WhCbf2CTD+ZPoW5DLPlI6
nhJaFpge2Lw5PjebKkZh/eHB9GmQ7o/Z1fs2VnghfJeeyeBAtx7UuBwol3ZX6rTS
V76Ftd+PcXPvrw3UkUyj6VE38YJT95bIHpEf4oR9iiPlvE/Lv8wYq7fdCdbvkKQd
yIyJzrg8S2YAFWxBVpQVNOYXhFTbhgyQr331OslGBGMRaZ/F9vQkuBzK+d6pVAHv
bTJJhDYqY1kr+gJerGPW5+gWoaCegEIzMj7fjYNVWHCh51hG7eJw8cYkFEPWApIP
XhKyulCg+vaCRO1/TTsrq2mXQ8GDUp+Xm1iorJ69CC9i2qQ8fWM8EJ8lVZZddas2
3tSwjtdrt/MWvmetZK0yM4jZint6nj0w4iTOs/MR8Kya/3bLbKRNDZczsIrNd8p6
5UrR33AMreG41Nkob/IRltibnHEDhHPgK9GJfC2yWj49Tf4H8PYTlT6HxOIeyX4r
OXp83UJ40RKuyvu7GJIxNfOgFdLTeZZEQSxAkxW4lrTFxuTQgls=
=+t5t
-----END PGP SIGNATURE-----

--Sig_/R/2sS42QIzwYzqn.D6NtiKf--

