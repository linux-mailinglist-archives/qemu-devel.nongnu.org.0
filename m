Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E4F6225A3
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 09:40:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osgdH-0002ku-TW; Wed, 09 Nov 2022 03:40:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1osgdF-0002jC-ES
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 03:40:25 -0500
Received: from wout1-smtp.messagingengine.com ([64.147.123.24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1osgdC-0006xD-BF
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 03:40:25 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id B46B232009F5;
 Wed,  9 Nov 2022 03:40:19 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 09 Nov 2022 03:40:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1667983219; x=1668069619; bh=DH
 z0FQLn6pNFuYbOvKpTjQ4Wok5wuUMuloyN3/qK4lI=; b=DGEY/rZyti3M+aJgpc
 IM0zLO6yvWyRGtcIXGgzACqaTclBssoa6mm0QyffLuZytMQczvRSAAzbjT9lf95S
 qChbjx1qaxg/kZRvTBnwY5UaMQyfKteNEzCsPamEh8bbdXg1t1XnerpTC5hibQvW
 ChMbHeqP4XnekUB5frZLrAjB1XYq6YZov4xX8KWqpDyli0NjOSf7LwPteQffLOd/
 kaRLfBpac73BlowC+qBTgCVdg48HcNwG8/Z10bshByrNbXXQRCFbwdXBygRBt29M
 05mJXeUSB24V+cmULr8JGzUETB09GUdo+9iXoc3ZGckH1lZ/oRksEKrcpk5lN080
 TR7Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1667983219; x=1668069619; bh=DHz0FQLn6pNFuYbOvKpTjQ4Wok5w
 uUMuloyN3/qK4lI=; b=K56LxNsmZSwS37FzoDFz8gh3tEoFZX0D6DGsDRz4J+I9
 G4ZC25TBIoAisXsjZIo8yCfLdwpbnB8pAfVjYOu3B92xGTSxc8TaFIVNtWpltKO5
 B9V/ND4zIGshAjJGc82eUDOTHPFssg4GtPBkKBEt/9lbNoiLj6DRDiyybQch75Wk
 2FvDjq5UVg9Z0rP0MmU6oL27yijtG1fPlzUXh+OntasuUvJ6I2d00A/JMNqNpW0f
 aMZz+pvnoD+YdAtAWRDAPun5zEgC3Cp5FiiirweJht/jTIMjpFV1+s1Mi++35xG/
 zNkZJd2Y5idB3hxNiI5frQcuhasAV1JpkMA948rO4w==
X-ME-Sender: <xms:cmdrY4TuwF_bTXgIl7F2yucnbybOCqqVx6CubU7sOQ3KWvMRb3e4Ng>
 <xme:cmdrY1xCFr1BIej-maHW3DiseuPLWhikm7YyOdfiY1HKBIKPLu_f-F9muRXB5maYE
 uSD69fGbEN1vGn4Y6c>
X-ME-Received: <xmr:cmdrY11BSW54olKUmPzEj3Qpt2X7-tDWZ9NF7l4TjNZeBwbXu76K_XaO0s9S1zfY45E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrfedugdduvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgjeefffdvuefhieefhffggfeuleehudekveejvedtuddugeeigeetffff
 jeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:cmdrY8DOifLTqIz3CSurS3aHbueb9M2pbtGLkXLG2YcgurYOT_jX6Q>
 <xmx:cmdrYxhMsWnU5eTRDJng3XDYsfslUYkqiCrtVYZhOXM1HJBf_obscA>
 <xmx:cmdrY4qS4cG3jWaZj6C4FONkAHd6JL2YiFTqg9T1Yh13eObHFKC1PA>
 <xmx:c2drY_YD9Jd5ZBYTeXO2ol_sqtJ-xC4jHMl1PdIqnkKfmoRFJ8lr3A>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Nov 2022 03:40:17 -0500 (EST)
Date: Wed, 9 Nov 2022 09:40:15 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: clay.mayers@kioxia.com
Cc: qemu-devel@nongnu.org, Keith Busch <kbusch@kernel.org>,
 Fam Zheng <fam@euphon.net>,
 Phlippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Dmitry Fomichev <dmitry.fomichev@wdc.com>
Subject: Re: [PATCH V2 0/4] hw/block/nvme: Implement ZNS finish-zone ZDC AEN
Message-ID: <Y2tnb2AIOX4nyykC@cormorant.local>
References: <20221021231038.1042659-1-clay.mayers@kioxia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="UaQH9o1a8/W4f5cu"
Content-Disposition: inline
In-Reply-To: <20221021231038.1042659-1-clay.mayers@kioxia.com>
Received-SPF: pass client-ip=64.147.123.24; envelope-from=its@irrelevant.dk;
 helo=wout1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--UaQH9o1a8/W4f5cu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Oct 21 16:10, clay.mayers@kioxia.com wrote:
> From: Clay Mayers <clay.mayers@kioxia.com>
>=20
> ZNS controllers have the option to limit the time a zone can remain in
> the active state.  It begins with a background process in the controller
> setting the finish-zone-recommended FZR attribute for a zone.  As part of
> setting this attribute, the zone's id is added to the namespace's
> zone-descriptor-changed (ZDC) log page. If enabled, items added to the
> ZDC log page generate a ZDC "asynchronous event notification" AEN. Option=
ally,
> the control can induce a "zone excursion" forcing the zone into the finis=
hed
> state that also generates a ZDC event.
>=20
> Zone enabled applications need to properly handle ZDC events. In a real d=
evice,
> the timeout is many hours making testing an application difficult.
> Implemented is the generation of FZR ZDC events to speed up O/S and appli=
cation
> testing.
>=20
> Added to the zoned NVMe command set is an optional, per-namespace timer
> (zoned.finish_time) to set the FZR attr for long-lived active zones; A per
> namespace ZDC log page; AEN results to including CQE.DW1 (the NSID of the=
 ZDC
> AEN) and generating a ZDC AEN if it's been enabled. Zone excursions are n=
ot
> modeled.
>=20
> See section 5.5 of the NVMe Zoned Namespace Command Set Specification v1.1
> for more details.
>=20
> Changes since v1
> - Fixed offset length checking in zdc log page
> - Moved zdc_event_queued to the patch 4
> - Unwatched zdc events in nvme_exit()
>=20
> Clay Mayers (4):
>   hw/block/nvme: add ZONE_FINISH_RECOMMENDED functionality
>   hw/block/nvme: add zone descriptor changed log page
>   hw/block/nvme: supply dw1 for aen result
>   hw/block/nvme: add zone descriptor changed AEN
>=20
>  docs/system/devices/nvme.rst |   5 +
>  hw/nvme/ctrl.c               | 174 +++++++++++++++++++++++++++++++++--
>  hw/nvme/ns.c                 |  15 +++
>  hw/nvme/nvme.h               |  37 +++++++-
>  hw/nvme/trace-events         |   3 +-
>  include/block/nvme.h         |  14 ++-
>  6 files changed, 233 insertions(+), 15 deletions(-)
>=20
> --=20
> 2.27.0
>=20

Nice work Clay!

Series looks good to me,

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>

--UaQH9o1a8/W4f5cu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmNrZ28ACgkQTeGvMW1P
DelVtQf+LTZcKm244p89BGXZMZUl9CucUg8YWd5yyA7NxSveQYC/CzLijhLoA10E
ihGjarRt2T4Dt7T3F41aQdWkcE0VE4gUHCnGcDHZ/NRvziBy2T8dZ8AuBBRTT7al
JZFxfMv4ThB8DDqcfSxWpzE+SOu5K8NuXvMJzaMmNpNVR9lRHMecSWD6obpneuJD
J68Zp36cxLnBdNX/3JvkfqGibtK6JzSy5VXTp8qLeKfMCogYuIL8TwPAlCsN40Uv
warOL3RvEZGFGFpAPXZUOtMqiEgYwl1z4/tJS7vyyttLYtdQQ2GCB04rZwI8Uw4a
RU3OmYm9a2lKULKxihons77cB9VYEQ==
=VUi+
-----END PGP SIGNATURE-----

--UaQH9o1a8/W4f5cu--

