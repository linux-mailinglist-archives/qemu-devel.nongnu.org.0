Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19490611130
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 14:23:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooONG-0004kn-6S; Fri, 28 Oct 2022 08:22:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ooOM6-0004B9-Lm
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 08:21:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ooOM3-00025i-VV
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 08:20:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666959655;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=+TKRipTQRl8NmvRYFRfYEL5gehQpA4HbXLcm/EDvXMA=;
 b=I5V5CdUVCTkeJ6TB/gWg4jivMTJh/bo3blDInTxp/mknNgah1qb6MYBqshiSqSEXeT1u7+
 O0/2m/IPAx1JNizc9rIxYQiBTmjxtqcJuGBoEIiUWseffsHtpJ+5w9P7TLSpR3cBm1zzXV
 gWxI4CKoBWcHR65+Wbr/U/uzBwZwMkI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613--BVUKsSLMRibqmRx_4kgbg-1; Fri, 28 Oct 2022 08:20:52 -0400
X-MC-Unique: -BVUKsSLMRibqmRx_4kgbg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8B4B0811E75;
 Fri, 28 Oct 2022 12:20:51 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3789140C206B;
 Fri, 28 Oct 2022 12:20:51 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Aarushi Mehta <mehta.aaru20@gmail.com>,
 Julia Suvorova <jusual@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH v3 0/3]  AioContext removal: LinuxAioState and ThreadPool
Date: Fri, 28 Oct 2022 08:20:45 -0400
Message-Id: <20221028122048.3101120-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.516,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Just remove some AioContext lock in LinuxAioState and ThreadPool.
Not related to anything specific, so I decided to send it as
a separate patch.

These patches are taken from Paolo's old draft series.

---
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
 block/linux-aio.c       | 30 +++++++++++++++-------------
 block/qcow2-threads.c   |  2 +-
 include/block/aio.h     |  8 --------
 include/block/raw-aio.h | 18 ++++++++---------
 util/thread-pool.c      |  5 ++++-
 8 files changed, 62 insertions(+), 68 deletions(-)

-- 
2.31.1


