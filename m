Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E8267D60C
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 21:17:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL8fO-0007gi-In; Thu, 26 Jan 2023 15:16:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pL8fL-0007ec-FV
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 15:16:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pL8fD-0003Hc-6A
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 15:16:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674764162;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=QfYH1s3Kxj+kw/yOI/ovNc2bZcufPJPxK4AJmrgp0W4=;
 b=DDc+jn8cHTXha1Lydldqde90Z94FNhMZBX+wDWrr/gJQr5jYfztS3wKWWH/bVCztQBMck0
 e7N/ccGdSS5GPdfew9AxuRSPjEdm0a1Xo9nhut9WrneNfIX7+q+bALyCi+AKV93t0saNdx
 U4jAaA4h9SqFJ+t1r+46UQ1UVyZ/gVE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-532-8NctD2zNNlaRyX5Q7gtiyA-1; Thu, 26 Jan 2023 15:16:00 -0500
X-MC-Unique: 8NctD2zNNlaRyX5Q7gtiyA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 570B71C08982;
 Thu, 26 Jan 2023 20:16:00 +0000 (UTC)
Received: from localhost (unknown [10.39.192.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C62D5140EBF5;
 Thu, 26 Jan 2023 20:15:59 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-block@nongnu.org, Fiona Ebner <f.ebner@proxmox.com>
Subject: [PATCH 0/4] block: fix detect-zeroes= with BDRV_REQ_REGISTERED_BUF
Date: Thu, 26 Jan 2023 15:13:57 -0500
Message-Id: <20230126201401.348845-1-stefanha@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
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
 qemu-io-cmds.c                                | 162 ++++++++++++------
 .../tests/detect-zeroes-registered-buf        |  58 +++++++
 .../tests/detect-zeroes-registered-buf.out    |   7 +
 4 files changed, 178 insertions(+), 52 deletions(-)
 create mode 100755 tests/qemu-iotests/tests/detect-zeroes-registered-buf
 create mode 100644 tests/qemu-iotests/tests/detect-zeroes-registered-buf.out

-- 
2.39.1


