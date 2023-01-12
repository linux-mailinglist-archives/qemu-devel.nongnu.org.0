Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A114C667EDF
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 20:18:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pG32b-0007ZC-8u; Thu, 12 Jan 2023 14:15:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pG32X-0007Xj-Je
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 14:15:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pG32V-00082U-P1
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 14:15:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673550902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=au23L2rZcrGnhuQGEWWXEaEGpyqP12PeavEbfq7Mfc0=;
 b=Ip++q+j0bUGUimUkAOcwdLkSdqZSd1FGcr2p3xs3/v+zux4RFqD6/NwsMvnGN/xcOmGgqs
 PlFYGB7RANzYwTIOOzZAfSjg1+rafeIsqxaixxhW8PBi92ev2gBUJgMv7PDjvkPxIaQ0IK
 w+N9W16YTzW+51k8t2eFWIu8N9wsXwQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-556-1oN1-H4zNSyZ5oFs8oq2mg-1; Thu, 12 Jan 2023 14:14:59 -0500
X-MC-Unique: 1oN1-H4zNSyZ5oFs8oq2mg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0DC7A1C05192;
 Thu, 12 Jan 2023 19:14:59 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.195.125])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D639F492C14;
 Thu, 12 Jan 2023 19:14:57 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, hreitz@redhat.com, aesteve@redhat.com,
 nsoffer@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH 0/4] qemu-img: Fix exit code for errors closing the image
Date: Thu, 12 Jan 2023 20:14:50 +0100
Message-Id: <20230112191454.169353-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
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

This series addresses the problem described in these bug reports:
https://gitlab.com/qemu-project/qemu/-/issues/1330
https://bugzilla.redhat.com/show_bug.cgi?id=2147617

qcow2 can fail when writing back dirty bitmaps in qcow2_inactivate().
However, when the function is called through blk_unref(), in the case of
such errors, while an error message is written to stderr, the callers
never see an error return. Specifically, 'qemu-img bitmap/commit' are
reported to exit with an exit code 0 despite the errors.

The solution taken here is inactivating the images first, which can
still return errors, but already performs all of the write operations.
Only then the images are actually blk_unref()-ed.

If we agree that this is the way to go (as a potential alternative,
allowing blk_unref() to fail would require changes in all kinds of
places, many of which probably wouldn't even know what to do with the
error), then I suppose doing the same for other qemu-img subcommands
would make sense, too.

As a bonus fix, I found an endianness confusion in an error path of
store_bitmap(). The reported error message "qcow2_free_clusters failed:
No space left on device" looked too suspicious to ignore this. Freeing
an actually existing cluster should never run into ENOSPC.

Kevin Wolf (4):
  qcow2: Fix theoretical corruption in store_bitmap() error path
  qemu-img commit: Report errors while closing the image
  qemu-img bitmap: Report errors while closing the image
  qemu-iotests: Test qemu-img bitmap/commit exit code on error

 block/qcow2-bitmap.c                          |  5 +-
 qemu-img.c                                    | 24 +++++
 .../qemu-iotests/tests/qemu-img-close-errors  | 95 +++++++++++++++++++
 .../tests/qemu-img-close-errors.out           | 23 +++++
 4 files changed, 145 insertions(+), 2 deletions(-)
 create mode 100755 tests/qemu-iotests/tests/qemu-img-close-errors
 create mode 100644 tests/qemu-iotests/tests/qemu-img-close-errors.out

-- 
2.38.1


