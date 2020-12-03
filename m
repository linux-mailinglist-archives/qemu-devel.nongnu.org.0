Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E472CDC69
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 18:32:31 +0100 (CET)
Received: from localhost ([::1]:43266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kksT0-0003HO-F6
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 12:32:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kksKF-0006d8-Tt
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 12:23:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kksKE-0003RR-Ak
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 12:23:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607016205;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=C4vb8odrkou8MUwdtZAVBE45IU62KUGntUxcjqpDgxU=;
 b=ArL+SbtDfMkK1PAWii5mMBRdXhG3fj7fnkylo1h21uxgM5f7ZKYYkyOIXIpzU4WERzAO2i
 3SmRd0fKbUWBhd+xn1B0BDLUSyCnoRyAlzHCbo2gW1Pg5UZ1tXWkHwVvJW9yOO50BWI+Ow
 uFcVqPFhlXlJwOOul/u86y8XZiuUjZs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-543-GCjB_U4mOXaq11Bo_FAYEw-1; Thu, 03 Dec 2020 12:23:23 -0500
X-MC-Unique: GCjB_U4mOXaq11Bo_FAYEw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 55484107ACE3;
 Thu,  3 Dec 2020 17:23:22 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-175.ams2.redhat.com [10.36.114.175])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4D72E50EDD;
 Thu,  3 Dec 2020 17:23:18 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 0/3] block: Fix block_resize deadlock with iothreads
Date: Thu,  3 Dec 2020 18:23:08 +0100
Message-Id: <20201203172311.68232-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org, qemu-stable@nongnu.org,
 stefanha@redhat.com, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The conversion of qmp_block_resize() to coroutines exposed a preexisting
locking bug in the drain implementation that can cause deadlocks.

As it happens, fixing this bug reveals in turn that the locking in
qmp_block_resize() itself is incomplete, too.

Kevin Wolf (3):
  block: Simplify qmp_block_resize() error paths
  block: Fix locking in qmp_block_resize()
  block: Fix deadlock in bdrv_co_yield_to_drain()

 block/io.c | 41 ++++++++++++++++++++++++-----------------
 blockdev.c | 12 +++++++-----
 2 files changed, 31 insertions(+), 22 deletions(-)

-- 
2.28.0


