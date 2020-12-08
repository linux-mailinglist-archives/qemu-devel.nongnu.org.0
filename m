Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9768E2D2D06
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 15:24:28 +0100 (CET)
Received: from localhost ([::1]:35116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmdul-0003vI-Le
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 09:24:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kmdsc-0002SD-TL
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 09:22:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kmdsY-0005CC-T4
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 09:22:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607437328;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=VqZpnBGKcneYeTB2GgFNsEj+XfCb0DjMl4lODjpkeqQ=;
 b=GIWMrxBFTVBhmowQ1mANJst3Zb+qyZQXvQuqMz/5Cm9w1MlQoDbCR9GVZEJzO1XLxNZ3lZ
 aUoK5M2m85xWQTMmV1KumQmo8mrDuKCNF8h6gbLEJJsehhzlgUx9chkGGPBiDhjYA9fZfY
 E1hR2pSnIkBhosjFBF9++7c1dEJIxK4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-5Zal-OkfPK-nPPkxwji5YQ-1; Tue, 08 Dec 2020 09:22:04 -0500
X-MC-Unique: 5Zal-OkfPK-nPPkxwji5YQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B35B8180A086;
 Tue,  8 Dec 2020 14:22:03 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.35.206.133])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 85CE05B4A1;
 Tue,  8 Dec 2020 14:22:01 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/2] qcow2: don't leave partially initialized file on image
 creation
Date: Tue,  8 Dec 2020 16:21:57 +0200
Message-Id: <20201208142159.492489-1-mlevitsk@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlevitsk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>,
 Alberto Garcia <berto@igalia.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the bdrv_co_delete_file interface to delete the underlying=0D
file if qcow2 initialization fails (e.g due to bad encryption secret)=0D
=0D
This makes the qcow2 driver behave the same way as the luks driver behaves.=
=0D
=0D
Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=3D1845353=0D
=0D
V3: addressed review feedback and reworked commit messages=0D
=0D
Best regards,=0D
=09Maxim Levitsky=0D
=0D
Maxim Levitsky (2):=0D
  crypto: luks: Fix tiny memory leak=0D
  block: qcow2: remove the created file on initialization error=0D
=0D
 block/crypto.c |  2 ++=0D
 block/qcow2.c  | 13 +++++++++++++=0D
 2 files changed, 15 insertions(+)=0D
=0D
--=20=0D
2.26.2=0D
=0D


