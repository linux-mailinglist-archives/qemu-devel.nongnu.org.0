Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7CE557F9F
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 18:19:36 +0200 (CEST)
Received: from localhost ([::1]:40632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4PYN-0006fL-U7
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 12:19:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o4PSr-0000oT-80
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 12:13:56 -0400
Received: from forwardcorp1p.mail.yandex.net ([77.88.29.217]:53200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o4PSl-0008EG-UF
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 12:13:52 -0400
Received: from sas1-9c28cd37d27b.qloud-c.yandex.net
 (sas1-9c28cd37d27b.qloud-c.yandex.net
 [IPv6:2a02:6b8:c14:309b:0:640:9c28:cd37])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id CA4AD2E1BB7;
 Thu, 23 Jun 2022 19:13:37 +0300 (MSK)
Received: from sas1-7470331623bb.qloud-c.yandex.net
 (sas1-7470331623bb.qloud-c.yandex.net [2a02:6b8:c08:bd1e:0:640:7470:3316])
 by sas1-9c28cd37d27b.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 CDFzn402Mb-DaK4bleB; Thu, 23 Jun 2022 19:13:37 +0300
X-Yandex-Fwd: 2
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1656000817; bh=rM7a6H3XEkC53Jd8XXbbD0b4YNaF0oiN3pz+EfaGZ0c=;
 h=Cc:Message-Id:Date:Subject:To:From;
 b=N09RVfNaFPI1s0ldFpOmJc/hxnvnPRDUmzYMEw+eFplsQZjfh5hQIYZqG09DiNfDC
 H4rv3K5qBU7oEd85FcQ43wMzZsYsdNZ25NJD5Ncdd3cAtT3rFlt4hZ8dVOIjXDmPow
 rmBm5T/RCe1E5yNnKpDjd3JEub5bR5qXr9ESI2v0=
Authentication-Results: sas1-9c28cd37d27b.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from vsementsov-win.yandex-team.ru (unknown [2a02:6b8:b081:14::1:1e])
 by sas1-7470331623bb.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 nZkhqFOnB8-DaNiwU4s; Thu, 23 Jun 2022 19:13:36 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, vsementsov@yandex-team.ru, yc-core@yandex-team.ru,
 rvkagan@yandex-team.ru, armbru@redhat.com
Subject: [PATCH v2 0/2] vhost: implement VHOST_SET_VRING_ERR
Date: Thu, 23 Jun 2022 19:13:23 +0300
Message-Id: <20220623161325.18813-1-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=77.88.29.217;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1p.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Both vhost-user and kernel vhost can inform Qemu about virt-queue error
through separate eventfd. Let's use this possibility.

For now just dump a message on error like elsewhere in vhost.c.

Further plan is implement QAPI event for this and may be some other
vhost/virtio errors to make it possible to instantly notify user about
problems in vm. That would be a separate patch or patchset.

v2: don't add QAPI event for now. Let's first realize the vhost
interface.

Yandex-ST: CLOUD-101375

Konstantin Khlebnikov (2):
  vhost: add method vhost_set_vring_err
  vhost: setup error eventfd and dump errors

 hw/virtio/vhost-backend.c         |  7 ++++++
 hw/virtio/vhost-user.c            |  6 +++++
 hw/virtio/vhost.c                 | 37 +++++++++++++++++++++++++++++++
 include/hw/virtio/vhost-backend.h |  3 +++
 include/hw/virtio/vhost.h         |  1 +
 5 files changed, 54 insertions(+)

-- 
2.25.1


