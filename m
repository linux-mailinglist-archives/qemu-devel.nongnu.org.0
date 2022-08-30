Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42FD65A6856
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 18:25:59 +0200 (CEST)
Received: from localhost ([::1]:39672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oT43n-0007pB-It
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 12:25:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1oT3uG-0001sa-1v
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 12:16:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1oT3u8-00020G-14
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 12:15:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661876152;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Mgfp9Kfm8+8VnpVA5PeH9BoHGs2IGHPwq0P2IshG0lk=;
 b=WzO1ZNyT2yAOFce2vLdE3h4p3xAbka+Kn9CJy+OaLsYBgSx0LmkbbfmN/IGracnb6M0B/Q
 mSdv4oLwH3+YEZLNC+vgEgiECQSj9yU7mydAONy3QWdJ2vcOk+3s/wb6GtvjMIRleEW0i9
 Mx8z/qTTfYx1B+mgH77CLsm5BBI2Lkk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-354-pnMclsTwMN65PXApn7u8xg-1; Tue, 30 Aug 2022 12:15:48 -0400
X-MC-Unique: pnMclsTwMN65PXApn7u8xg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7177E802E5D;
 Tue, 30 Aug 2022 16:15:48 +0000 (UTC)
Received: from tapioca.redhat.com (unknown [10.40.192.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0DEE81415117;
 Tue, 30 Aug 2022 16:15:46 +0000 (UTC)
From: Victor Toso <victortoso@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 John Snow <jsnow@redhat.com>, Michael Roth <michael.roth@amd.com>
Subject: [PATCH v1 00/16] qapi examples fixes and rfc for another generator
Date: Tue, 30 Aug 2022 18:15:29 +0200
Message-Id: <20220830161545.84198-1-victortoso@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=victortoso@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

I've been using the examples as a way to test the qapi-go proposal [0]
and I thought it would be neat to have a way to parse those examples and
regenerate them in a way that we could use for testing.

The first 10 patches are fixes to issues found when loading the Example
into python's json library.

Patches 11-15 are fixes to issues found when using those exampels in the
qapi-go module [1].

Patch 16 is the RFC for the generator used. If the idea is interesting,
I can rework it and add some qapi/qmp verification of the examples at
generation time with python-qemu-qmp [2].

[0] https://lists.nongnu.org/archive/html/qemu-devel/2022-06/msg03105.html
[1] https://gitlab.com/victortoso/qapi-go/-/tree/wip-v3/test
[2] https://gitlab.com/qemu-project/python-qemu-qmp

Cheers,
Victor

Victor Toso (16):
  qapi: fix example of query-ballon command
  qapi: fix example of query-vnc command
  qapi: fix example of query-spice command
  qapi: fix example of query-rocker-of-dpa-flows command
  qapi: fix example of query-dump-guest-memory-capability command
  qapi: fix example of query-blockstats command
  qapi: fix example of BLOCK_JOB_READY event
  qapi: fix example of NIC_RX_FILTER_CHANGED event
  qapi: fix example of DEVICE_UNPLUG_GUEST_ERROR event
  qapi: fix example of MEM_UNPLUG_ERROR event
  qapi: fix examples of blockdev-add with qcow2
  qapi: fix example of blockdev-add command
  qapi: fix example of query-hotpluggable-cpus command
  qapi: fix example of query-migrate command
  qapi: fix examples of events missing timestamp
  RFC: add a generator for qapi's examples

 qapi/block-core.json         |  46 ++++-----
 qapi/dump.json               |   1 +
 qapi/machine.json            |   8 +-
 qapi/migration.json          |  83 +++++++++++++--
 qapi/net.json                |   2 +-
 qapi/qdev.json               |   3 +-
 qapi/rocker.json             |   3 +-
 qapi/ui.json                 |   7 +-
 scripts/qapi/dumpexamples.py | 194 +++++++++++++++++++++++++++++++++++
 scripts/qapi/main.py         |   2 +
 10 files changed, 304 insertions(+), 45 deletions(-)
 create mode 100644 scripts/qapi/dumpexamples.py

-- 
2.37.2


