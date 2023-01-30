Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8005681D79
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 22:55:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMc6d-0007oF-1v; Mon, 30 Jan 2023 16:54:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pMc6b-0007nv-IW
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 16:54:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pMc6Z-0006i9-S0
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 16:54:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675115662;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=c8KYDi2nMXTmdjgR4xWHOXYodSkSde0ugg2krAk+xic=;
 b=btW89O4f6EBy0qHaYwLO0wT61fPFXuE4cf69MPa3hOOiugpT1cxyuYAFKiU6dapy8IzoQ/
 tr/Ntd1eEB7vq19lqPCSe/VnP7+2OYp4RClpXzFE3DWtaFpoMgouVAnyPKXvh8D6nzgZwt
 wJaO2XdQTO1HGlH5LB5ABk8JkoIEhFg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-263-WYka2SmdPCy1hBzyTQ8G7Q-1; Mon, 30 Jan 2023 16:54:18 -0500
X-MC-Unique: WYka2SmdPCy1hBzyTQ8G7Q-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6FFE8100DEA3;
 Mon, 30 Jan 2023 21:54:18 +0000 (UTC)
Received: from localhost (unknown [10.39.195.80])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 98644492B05;
 Mon, 30 Jan 2023 21:54:17 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: <qemu-block@nongnu.org>, Fam Zheng <fam@euphon.net>,
 Fiona Ebner <f.ebner@proxmox.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>
Subject: [PATCH v2 0/4] block: fix detect-zeroes= with BDRV_REQ_REGISTERED_BUF
Date: Mon, 30 Jan 2023 16:54:11 -0500
Message-Id: <20230130215415.919494-1-stefanha@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

v2:
- Add comment explaining unbalanced error code path in
  qemu_io_alloc_from_file() [Eric]
- List options alphabetically in help output [Eric]
- Add Tested-by/Reviewed-by
- CC qemu-stable on the fix

The first patch fixes a regression in QEMU 7.2 where detect-zeroes breaks with
virtio-blk devices due to a BDRV_REQ_REGISTERED_BUF bug. Details of the
regression can be found here:
https://gitlab.com/qemu-project/qemu/-/issues/1404

The remaining patches add a regression test that will protect this code path in
the future. The qemu-io command is extended with the new -r option that calls
blk_register_buf(). This allows a qemu-iotests test case to trigger the same
bug as virtio-blk.

Stefan Hajnoczi (4):
  block: fix detect-zeroes= with BDRV_REQ_REGISTERED_BUF
  qemu-io: use BdrvRequestFlags instead of int
  qemu-io: add -r option to register I/O buffer
  iotests/detect-zeroes-registered-buf: add new test

 block/io.c                                    |   3 +
 qemu-io-cmds.c                                | 180 ++++++++++++------
 .../tests/detect-zeroes-registered-buf        |  58 ++++++
 .../tests/detect-zeroes-registered-buf.out    |   7 +
 4 files changed, 189 insertions(+), 59 deletions(-)
 create mode 100755 tests/qemu-iotests/tests/detect-zeroes-registered-buf
 create mode 100644 tests/qemu-iotests/tests/detect-zeroes-registered-buf.out

-- 
2.39.1


