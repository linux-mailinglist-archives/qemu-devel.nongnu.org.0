Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 264DE613772
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 14:09:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUOS-0000jC-O9; Mon, 31 Oct 2022 08:59:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1opUOP-0000ZX-CJ
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:59:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1opUON-0005ZI-0K
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:59:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667221190;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=ErZzWrpFY7OdNZU+cj5TGtnq3npkbwEO3xk6hu01XvU=;
 b=YzeYunbo2OlzaLqUOrwo6t6S2P02x3H460iRQm1R27o8aiW8rZ1ljt01IAHm2uYxBs3H9x
 X00HceAWEerEk02HRzZSlr+T3/PzxfEL9rN21hOe6wGZazH3rB/BfbEIYTOnM9nMrr9mrj
 YNKToJ3MyhbmeKLeHTtWWVPn6NMXMsw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-483-TyUIiseANNaFJFJZDvAWqA-1; Mon, 31 Oct 2022 08:59:46 -0400
X-MC-Unique: TyUIiseANNaFJFJZDvAWqA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F3C9B383328C;
 Mon, 31 Oct 2022 12:59:45 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6A1E22027061;
 Mon, 31 Oct 2022 12:59:45 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Aarushi Mehta <mehta.aaru20@gmail.com>,
 Julia Suvorova <jusual@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH v4 0/3] AioContext removal: LinuxAioState and ThreadPool
Date: Mon, 31 Oct 2022 08:59:33 -0400
Message-Id: <20221031125936.3458740-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

Just remove some AioContext lock in LinuxAioState and ThreadPool.
Not related to anything specific, so I decided to send it as
a separate patch.

These patches are taken from Paolo's old draft series.

---
v4:
* add missing aio_context removal, and fix typo

v3:
* remove qemu_coroutine_enter_if_inactive

v2:
* assertion in thread_pool
* remove useless BlockDriverState * param in patch 1 and 2
* io_uring cleaned too

Emanuele Giuseppe Esposito (2):
  io_uring: use LuringState from the running thread
  thread-pool: use ThreadPool from the running thread

Paolo Bonzini (1):
  linux-aio: use LinuxAioState from the running thread

 block/file-posix.c      | 43 ++++++++++++++++-------------------------
 block/file-win32.c      |  2 +-
 block/io_uring.c        | 22 +++++++++++++--------
 block/linux-aio.c       | 29 +++++++++++++++------------
 block/qcow2-threads.c   |  2 +-
 include/block/aio.h     |  8 --------
 include/block/raw-aio.h | 18 ++++++++---------
 util/thread-pool.c      |  9 ++++-----
 8 files changed, 62 insertions(+), 71 deletions(-)

-- 
2.31.1


