Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D044024FA
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 10:18:21 +0200 (CEST)
Received: from localhost ([::1]:48976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNWJ8-0002Cn-BS
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 04:18:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mNWFA-0004bR-4z
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 04:14:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29158)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mNWF8-0005ch-BY
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 04:14:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631002449;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Jk1WNh0RSn9aqTaSRmDWlivTIpSsewBr8X4vEJhPIt8=;
 b=WmvARpRrvBKsWJWcxru1zPD+zS9cgwH3I+F9ktF7iqnbjMTccuP2CB7a1xfsApdeosbEvb
 2doZy5YL0D9eGsPVkb0lKoo6wbhgbUnDDBcWwSUbH2ZgQipihqr0wJyLwyKYrYfeA13CvG
 NjfPUGvwVp8dBfyu66segkdKeGBhpGo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-PoXJgF9rOka1r0CbVdo0BQ-1; Tue, 07 Sep 2021 04:14:06 -0400
X-MC-Unique: PoXJgF9rOka1r0CbVdo0BQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 504E8835DFE;
 Tue,  7 Sep 2021 08:14:05 +0000 (UTC)
Received: from localhost (unknown [10.39.194.246])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 68A995C2E4;
 Tue,  7 Sep 2021 08:14:04 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 00/11] Block patches
Date: Tue,  7 Sep 2021 09:13:52 +0100
Message-Id: <20210907081403.816404-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 88afdc92b644120e0182c8567e1b1d236e471b12=
:=0D
=0D
  Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into staging=
 (2021-09-05 15:48:42 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://gitlab.com/stefanha/qemu.git tags/block-pull-request=0D
=0D
for you to fetch changes up to 9bd2788f49c331b02372cc257b11e4c984d39708:=0D
=0D
  block/nvme: Only report VFIO error on failed retry (2021-09-07 09:08:24 +=
0100)=0D
=0D
----------------------------------------------------------------=0D
Pull request=0D
=0D
Userspace NVMe driver patches.=0D
=0D
----------------------------------------------------------------=0D
=0D
Philippe Mathieu-Daud=C3=A9 (11):=0D
  block/nvme: Use safer trace format string=0D
  util/vfio-helpers: Let qemu_vfio_verify_mappings() use error_report()=0D
  util/vfio-helpers: Replace qemu_mutex_lock() calls with=0D
    QEMU_LOCK_GUARD=0D
  util/vfio-helpers: Remove unreachable code in qemu_vfio_dma_map()=0D
  block/nvme: Have nvme_create_queue_pair() report errors consistently=0D
  util/vfio-helpers: Pass Error handle to qemu_vfio_dma_map()=0D
  util/vfio-helpers: Extract qemu_vfio_water_mark_reached()=0D
  util/vfio-helpers: Use error_setg in qemu_vfio_find_[fixed/temp]_iova=0D
  util/vfio-helpers: Simplify qemu_vfio_dma_map() returning directly=0D
  util/vfio-helpers: Let qemu_vfio_do_mapping() propagate Error=0D
  block/nvme: Only report VFIO error on failed retry=0D
=0D
 include/qemu/vfio-helpers.h |  2 +-=0D
 block/nvme.c                | 29 +++++++----=0D
 util/vfio-helpers.c         | 99 ++++++++++++++++++++-----------------=0D
 block/trace-events          |  2 +-=0D
 4 files changed, 76 insertions(+), 56 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


