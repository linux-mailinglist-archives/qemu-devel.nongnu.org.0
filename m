Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E832D4C05
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 21:39:24 +0100 (CET)
Received: from localhost ([::1]:34668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn6F9-0004Zi-9C
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 15:39:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kn69Y-0007ii-DX
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 15:33:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kn69W-0005Vh-Dv
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 15:33:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607546013;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Gj9eWUsfC7N9KABHUOmbevibOnaxWqmHuFkbOTyLl7U=;
 b=boX9gPJg6ko289xYDBmndWZeRINLwj1tyJOSQqT9a5fRdaf0SP6lu3KN+IfIcAoH7YoM4+
 /SqC9Px+Ay3cEPORSvCTwDcMoAfaCVZX407ArV+sgWI9ME+pYGYhktGscLBNUM5dM63GhZ
 LGo1H0mK8yVVZtgwGeAuGaQJVO1H6vU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-_aeNcY2hNF-EiFHEK791Zw-1; Wed, 09 Dec 2020 15:33:31 -0500
X-MC-Unique: _aeNcY2hNF-EiFHEK791Zw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4CAF7190A7A1;
 Wed,  9 Dec 2020 20:33:30 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.35.206.133])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0CC0D19725;
 Wed,  9 Dec 2020 20:33:27 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 0/4] qcow2: don't leave partially initialized file on image
 creation
Date: Wed,  9 Dec 2020 22:33:22 +0200
Message-Id: <20201209203326.879381-1-mlevitsk@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
V4: got rid of code duplication by adding bdrv_co_delete_file_noerr=0D
and made the qcow2 driver use this function to delete=0D
both the main and the data file.=0D
=0D
V5: addresssed review feedback on reworked version.=0D
=0D
Best regards,=0D
=09Maxim Levitsky=0D
=0D
Maxim Levitsky (4):=0D
  crypto: luks: Fix tiny memory leak=0D
  block: add bdrv_co_delete_file_noerr=0D
  crypto: luks: use bdrv_co_delete_file_noerr=0D
  block: qcow2: remove the created file on initialization error=0D
=0D
 block.c               | 24 ++++++++++++++++++++++++=0D
 block/crypto.c        | 13 ++-----------=0D
 block/qcow2.c         |  6 ++++--=0D
 include/block/block.h |  1 +=0D
 4 files changed, 31 insertions(+), 13 deletions(-)=0D
=0D
--=20=0D
2.26.2=0D
=0D


