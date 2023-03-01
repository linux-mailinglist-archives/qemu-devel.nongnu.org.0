Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 069836A75A8
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 21:58:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXTWo-0003Gu-UN; Wed, 01 Mar 2023 15:58:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pXTWn-0003GZ-Cs
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 15:58:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pXTWm-0003vv-1a
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 15:58:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677704299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=HdxtgeDWwU35j3dVSfrhRSl+cI6XuhXBhntF2MAyi8M=;
 b=JnXIjiWhPVD7jeeL4/CJHP3t84T8GyYCdCsMVz1irzherrkxE4SkDXgxCuBSPWEM83Racy
 LNtAHwbMSqwa/B47nxeWpdelnMMSIgbo/QDcreoCULkypcBRkvS9su8S0/jXJJPgmhqiwJ
 gGqQ2KctXqrqeYjjotl1wusYo3GA5Wc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-583-4vdUQ2iAN_Cs4EI6rh7GuA-1; Wed, 01 Mar 2023 15:58:14 -0500
X-MC-Unique: 4vdUQ2iAN_Cs4EI6rh7GuA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BC377811E9C;
 Wed,  1 Mar 2023 20:58:13 +0000 (UTC)
Received: from localhost (unknown [10.39.192.234])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 29B361121315;
 Wed,  1 Mar 2023 20:58:12 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>, qemu-block@nongnu.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
Subject: [PATCH 0/6] block: switch to AIO_WAIT_WHILE_UNLOCKED() where possible
Date: Wed,  1 Mar 2023 15:57:55 -0500
Message-Id: <20230301205801.2453491-1-stefanha@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

AIO_WAIT_WHILE_UNLOCKED() is the future replacement for AIO_WAIT_WHILE(). Most
callers haven't been converted yet because they rely on the AioContext lock. I
looked through the code and found the easy cases that can be converted today.

Stefan Hajnoczi (6):
  block: don't acquire AioContext lock in bdrv_drain_all()
  block: convert blk_exp_close_all_type() to AIO_WAIT_WHILE_UNLOCKED()
  block: convert bdrv_graph_wrlock() to AIO_WAIT_WHILE_UNLOCKED()
  block: convert bdrv_drain_all_begin() to AIO_WAIT_WHILE_UNLOCKED()
  hmp: convert handle_hmp_command() to AIO_WAIT_WHILE_UNLOCKED()
  monitor: convert monitor_cleanup() to AIO_WAIT_WHILE_UNLOCKED()

 block/block-backend.c | 8 +-------
 block/export/export.c | 2 +-
 block/graph-lock.c    | 2 +-
 block/io.c            | 2 +-
 monitor/hmp.c         | 2 +-
 monitor/monitor.c     | 4 ++--
 6 files changed, 7 insertions(+), 13 deletions(-)

-- 
2.39.2


