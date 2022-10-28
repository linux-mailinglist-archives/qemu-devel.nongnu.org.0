Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDAC610A12
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 08:12:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooIYk-00057s-72; Fri, 28 Oct 2022 02:09:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ooIXt-0004tb-V8
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 02:08:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ooIXZ-0006yl-VV
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 02:08:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666937299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=g2PnwlobFfpeRd8jBDkXn+tTwirzqhDVdpDJ3SAz4E8=;
 b=hzwD0Ki01rxEMdcb77QRNubNKCj3mlPo79l0OwAuRLq+a0al8wPxM+M2+kz0NuTCKddP32
 mVyJTu7GGYSKoPfEmZ+qfuVdRbZ06gi4NszwUahqqdYp67fvxTUVqHchWlxE+YKENr1Lvg
 70+NZlvg8z0OxgDr0DRm77bP922ZMk0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-425-jGays6IYP3uKq-r2UV0qZQ-1; Fri, 28 Oct 2022 02:08:17 -0400
X-MC-Unique: jGays6IYP3uKq-r2UV0qZQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 91AD9811E7A
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 06:08:17 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.118])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6AE061415102;
 Fri, 28 Oct 2022 06:08:17 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 55A1C21E6921; Fri, 28 Oct 2022 08:08:16 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com
Subject: [PULL 0/4] Error reporting patches for 2022-10-28
Date: Fri, 28 Oct 2022 08:08:12 +0200
Message-Id: <20221028060816.641399-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The following changes since commit 344744e148e6e865f5a57e745b02a87e5ea534ad:

  Merge tag 'dump-pull-request' of https://gitlab.com/marcandre.lureau/qemu into staging (2022-10-26 10:53:49 -0400)

are available in the Git repository at:

  https://repo.or.cz/qemu/armbru.git tags/pull-error-2022-10-28

for you to fetch changes up to 0dddb0fc80f83d3bb469dc220ba8e2496b27a205:

  qerror: QERR_PERMISSION_DENIED is no longer used, drop (2022-10-27 07:57:18 +0200)

----------------------------------------------------------------
Error reporting patches for 2022-10-28

----------------------------------------------------------------
Markus Armbruster (4):
      qom: Improve error messages when property has no getter or setter
      backends: Improve error messages when property can no longer be set
      qtest: Improve error messages when property can not be set right now
      qerror: QERR_PERMISSION_DENIED is no longer used, drop

 include/qapi/qmp/qerror.h       | 3 ---
 backends/cryptodev-vhost-user.c | 2 +-
 backends/rng-egd.c              | 2 +-
 backends/rng-random.c           | 2 +-
 backends/vhost-user.c           | 2 +-
 qom/object.c                    | 6 ++++--
 softmmu/qtest.c                 | 4 ++--
 7 files changed, 10 insertions(+), 11 deletions(-)

-- 
2.37.3


