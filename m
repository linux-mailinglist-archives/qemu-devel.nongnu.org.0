Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB95A544F0C
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 16:30:13 +0200 (CEST)
Received: from localhost ([::1]:55330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzJAo-0006sF-GU
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 10:30:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nzITA-0008MD-FO
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 09:45:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nzIT8-0004hR-5f
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 09:45:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654782301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=feFkEu8J5c4LFXAes4NkU9LYkUPJiwEjmRZG2EL1Mkw=;
 b=RxinrAh3PiCpm/y00lYKeTtRkiUMdMw393HNkHZ4anvlXtMLFm0fnfQbZ/Xm0I9EoGzspC
 aIWF26AxPe3QEjuBhuZfdy/0AMgFjRgHlhxcn8G0xS0lP0LnW3BEEReSy0bDozwLEHq/0H
 MYz2txP/OVP25+Bt8DSSwLqXYPRS9YU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-80-z2muBhW6PlGjtqtkWoTgMA-1; Thu, 09 Jun 2022 09:44:56 -0400
X-MC-Unique: z2muBhW6PlGjtqtkWoTgMA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CADF91C05153;
 Thu,  9 Jun 2022 13:44:54 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6D0FF492C3B;
 Thu,  9 Jun 2022 13:44:54 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH 0/2] AioContext removal: LinuxAioState and ThreadPool
Date: Thu,  9 Jun 2022 09:44:50 -0400
Message-Id: <20220609134452.1146309-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Just remove some AioContext lock in LinuxAioState and ThreadPool.
Not related to anything specific, so I decided to send it as
a separate patch.

These patches are taken from Paolo's old draft series.

Emanuele Giuseppe Esposito (1):
  thread-pool: use ThreadPool from the running thread

Paolo Bonzini (1):
  linux-aio: use LinuxAioState from the running thread

 block/file-posix.c    | 22 +++++++++++-----------
 block/file-win32.c    |  2 +-
 block/linux-aio.c     | 13 ++++++-------
 block/qcow2-threads.c |  2 +-
 include/block/aio.h   |  4 ----
 util/thread-pool.c    |  6 +-----
 6 files changed, 20 insertions(+), 29 deletions(-)

-- 
2.31.1


