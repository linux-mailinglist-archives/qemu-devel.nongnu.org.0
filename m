Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E37442D4716
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 17:48:08 +0100 (CET)
Received: from localhost ([::1]:51062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn2dK-0003zC-E6
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 11:48:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kn2aE-0002jx-2X
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 11:44:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kn2a9-0003HS-VD
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 11:44:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607532288;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6dB/ieE9eZw9+0mSXz9s1qlRiOq1oCs2d4w6XZs/RZg=;
 b=fulDcUyp/jKeJvwBRvY6//4pElT/+CyXM1M4AwSW2go94VVoP9CzE79HAXJaRvbeDiUoOm
 ZWAs4q8+xyjpnl6e5ZgwR7Zha6fBEhHVkNnls5UGN8ACfGR3BZUN0+PrPjeu0198ogkEM8
 F5/8lcL+YaEJgn9ZHrCvPrUAV7JEMK4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-yLHu4VE7O6CvtZTDT8VPOg-1; Wed, 09 Dec 2020 11:44:46 -0500
X-MC-Unique: yLHu4VE7O6CvtZTDT8VPOg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B87771842140;
 Wed,  9 Dec 2020 16:44:44 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.35.206.133])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7950E6064B;
 Wed,  9 Dec 2020 16:44:42 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/4] qcow2: don't leave partially initialized file on image
 creation
Date: Wed,  9 Dec 2020 18:44:37 +0200
Message-Id: <20201209164441.867945-1-mlevitsk@redhat.com>
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
Best regards,=0D
=09Maxim Levitsky=0D
=0D
Maxim Levitsky (4):=0D
  crypto: luks: Fix tiny memory leak=0D
  block: add bdrv_co_delete_file_noerr=0D
  crypto: luks: use bdrv_co_delete_file_noerr=0D
  block: qcow2: remove the created file on initialization error=0D
=0D
 block.c               | 23 +++++++++++++++++++++++=0D
 block/crypto.c        | 13 ++-----------=0D
 block/qcow2.c         |  7 ++++---=0D
 include/block/block.h |  1 +=0D
 4 files changed, 30 insertions(+), 14 deletions(-)=0D
=0D
--=20=0D
2.26.2=0D
=0D


