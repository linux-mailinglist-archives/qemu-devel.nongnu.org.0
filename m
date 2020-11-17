Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7962A2B695F
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 17:06:59 +0100 (CET)
Received: from localhost ([::1]:59904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf3VS-0004nK-E9
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 11:06:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kf3UG-0003Re-1N
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 11:05:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kf3UE-0007c0-74
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 11:05:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605629141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ed1LhVKjQj2PeSGWg14twvLm6/KTivQ3jK64P+HzZhQ=;
 b=ezfol46Sj4p1U0voYLXJk/vY49O+0vECAZkD+X7mregjeG86qxaxRNUdPNTWVWWzofHnYi
 cNIjtnehOPKNyU2zZGgGVQ0JNs8BiR8TiUnsixxEobPWQBevysATso8CPVvQ1KJsRfwCbN
 zs8thBTSdYnY80Py8WU6HRUBZcYLIE8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-BpNF29LAMia3uJ9rQX57TA-1; Tue, 17 Nov 2020 11:05:39 -0500
X-MC-Unique: BpNF29LAMia3uJ9rQX57TA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 31A8D11BD341;
 Tue, 17 Nov 2020 16:05:37 +0000 (UTC)
Received: from localhost (ovpn-115-113.ams2.redhat.com [10.36.115.113])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 75CDD1001E73;
 Tue, 17 Nov 2020 16:05:33 +0000 (UTC)
Date: Tue, 17 Nov 2020 16:05:32 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Mike Christie <michael.christie@oracle.com>
Subject: Re: [PATCH 07/10] vhost, vhost-scsi: flush IO vqs then send TMF rsp
Message-ID: <20201117160532.GP131917@stefanha-x1.localdomain>
References: <1605223150-10888-1-git-send-email-michael.christie@oracle.com>
 <1605223150-10888-9-git-send-email-michael.christie@oracle.com>
MIME-Version: 1.0
In-Reply-To: <1605223150-10888-9-git-send-email-michael.christie@oracle.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="+gHRqQ1BTyNna/y8"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 00:41:22
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, linux-scsi@vger.kernel.org, mst@redhat.com,
 jasowang@redhat.com, qemu-devel@nongnu.org,
 virtualization@lists.linux-foundation.org, target-devel@vger.kernel.org,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--+gHRqQ1BTyNna/y8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2020 at 05:19:07PM -0600, Mike Christie wrote:
> With one worker we will always send the scsi cmd responses then send the
> TMF rsp, because LIO will always complete the scsi cmds first which
> calls vhost_scsi_release_cmd to add them to the work queue.
>=20
> When the next patch adds multiple worker support, the worker threads
> could still be sending their responses when the tmf's work is run.
> So this patch has vhost-scsi flush the IO vqs on other worker threads
> before we send the tmf response.
>=20
> Signed-off-by: Mike Christie <michael.christie@oracle.com>
> ---
>  drivers/vhost/scsi.c  | 16 ++++++++++++++--
>  drivers/vhost/vhost.c |  6 ++++++
>  drivers/vhost/vhost.h |  1 +
>  3 files changed, 21 insertions(+), 2 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--+gHRqQ1BTyNna/y8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl+z9MwACgkQnKSrs4Gr
c8gaqgf/ezD3eMZkmyNkKq/TS6tnuCAH04YabhXKm+dLdSH9xZvaLGPKG/CnwF6o
/gS0CjOu5YrvXmP+VlZ+uwaOIqOHgxP79NAm57j5mPXi6VLcz3tK7ctF8jrGDqYH
wzSkCP2Wjr0Dvc3t2d5gAyggrabBtyPzuT9oUjolzEo6DXKQQXN3Ok3sVDDinQ2d
/jF39oufcFmWT3+EeUEBXr2MHtC7ccx3ZFCCASkNznT5s+CuwLrLeqVIS+2wC9FK
x4XdBOvZ0qy/rggn3UAmDQe2cfuaU28vwZhddyVjeBjSyimYbnoSQT1XheHB/45v
MyMI5NxDJBU3WStraKoA/MQRSYcB8A==
=IxzD
-----END PGP SIGNATURE-----

--+gHRqQ1BTyNna/y8--


