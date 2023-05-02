Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 164106F49DA
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 20:43:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptuwl-0000E3-6j; Tue, 02 May 2023 14:41:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ptuwc-0000Bw-By
 for qemu-devel@nongnu.org; Tue, 02 May 2023 14:41:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ptuwa-0006VT-Dv
 for qemu-devel@nongnu.org; Tue, 02 May 2023 14:41:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683052903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=1dQjO7TXO8l7MQRQ7B2Zn5Aa7CrAGDw85wqFlKjOJT0=;
 b=eeXiHi3HF5ObMXL/brdtN4ZhRgRbZLe/mTc9aforR6E5oNwtvocelXhFliw/kJAux5CLKX
 0O+zOO8BQ/u9/FAyVQXdr2RwRM3qeT2mOLumpw8el74k/CSdCxj2bTSElcuA88KAknruai
 u4lY/LrOCtZVSAS0CB8OVgTsvl4t+RA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-204-VO2D25BONK6CA3xgX2NUGQ-1; Tue, 02 May 2023 14:41:40 -0400
X-MC-Unique: VO2D25BONK6CA3xgX2NUGQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E24243850547;
 Tue,  2 May 2023 18:41:36 +0000 (UTC)
Received: from localhost (unknown [10.39.192.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 492E563F4A;
 Tue,  2 May 2023 18:41:36 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org
Subject: [PATCH 0/2] aio-posix: do not nest poll handlers
Date: Tue,  2 May 2023 14:41:32 -0400
Message-Id: <20230502184134.534703-1-stefanha@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The following stack exhaustion was reported in
https://bugzilla.redhat.com/show_bug.cgi?id=2186181:

  ...
  #51 0x000055884fca7451 aio_poll (qemu-kvm + 0x9d6451)
  #52 0x000055884fab9cbd bdrv_poll_co (qemu-kvm + 0x7e8cbd)
  #53 0x000055884fab654b blk_io_plug (qemu-kvm + 0x7e554b)
  #54 0x000055884f927fef virtio_blk_handle_vq (qemu-kvm + 0x656fef)
  #55 0x000055884f96d384 virtio_queue_host_notifier_aio_poll_ready (qemu-kvm + 0x69c384)
  #56 0x000055884fca671b aio_dispatch_handler (qemu-kvm + 0x9d571b)
  #57 0x000055884fca7451 aio_poll (qemu-kvm + 0x9d6451)
  #58 0x000055884fab9cbd bdrv_poll_co (qemu-kvm + 0x7e8cbd)
  #59 0x000055884fab654b blk_io_plug (qemu-kvm + 0x7e554b)
  #60 0x000055884f927fef virtio_blk_handle_vq (qemu-kvm + 0x656fef)
  #61 0x000055884f96d384 virtio_queue_host_notifier_aio_poll_ready (qemu-kvm + 0x69c384)
  #62 0x000055884fca671b aio_dispatch_handler (qemu-kvm + 0x9d571b)
  #63 0x000055884fca7451 aio_poll (qemu-kvm + 0x9d6451)
  ...

This happens because some block layer APIs in QEMU 8.0 run in coroutines in
order to take the graph rdlock. Existing virtqueue handler functions weren't
written with this in mind.

A simplified example of the problem is:

  void my_fd_handler(void *opaque)
  {
      do_something();
      event_notifier_test_and_clear(opaque);
      do_something_else();
  }

When do_something() calls aio_poll(), my_fd_handler() will be entered again
immediately because the fd is still readable and stack exhaustion will occur.

When do_something_else() calls aio_poll(), there is no stack exhaustion since
the event notifier has been cleared and the fd is not readable.

The actual bug is more involved. The handler in question is a poll handler, not
an fd handler, but the principle is the same.

I haven't been able to reproduce the bug, but I have included a test case that
demonstrates the problem.

Stefan Hajnoczi (2):
  aio-posix: do not nest poll handlers
  tested: add test for nested aio_poll() in poll handlers

 tests/unit/test-nested-aio-poll.c | 130 ++++++++++++++++++++++++++++++
 util/aio-posix.c                  |  11 +++
 tests/unit/meson.build            |   1 +
 3 files changed, 142 insertions(+)
 create mode 100644 tests/unit/test-nested-aio-poll.c

-- 
2.40.1


