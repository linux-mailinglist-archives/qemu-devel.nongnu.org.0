Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D87B44AEF9F
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 12:05:13 +0100 (CET)
Received: from localhost ([::1]:46966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHkmd-0000TU-Uw
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 06:05:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nHkct-00056P-Fs
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 05:55:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nHkcp-0003ul-OG
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 05:55:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644404102;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=j8roi+oMP/zOn9+pUupOxt5RNbo1S/W20jjwg6oiFHc=;
 b=UC1tS3SXFpgThL9/iYD7OWM+9TnwAAYN+M0giSlmXJTLiGL2WnVZG04GlRh6R6ihnDiseE
 cdbGbT+4b9iiAiQQOa5ENXCIDtGbe51Wo729l0gkBjsY7s1qixgmgTLUsX46ephvQlBSd2
 iT7+fWqq9GFCPdtDRkXjBXGUGEbl/Vk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-356-ul6erL8TMvywqjLfNePXdw-1; Wed, 09 Feb 2022 05:54:59 -0500
X-MC-Unique: ul6erL8TMvywqjLfNePXdw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 577B886A8AD;
 Wed,  9 Feb 2022 10:54:56 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E64ED5F6A9;
 Wed,  9 Feb 2022 10:54:53 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 0/5] block layer: permission API refactoring in preparation
Date: Wed,  9 Feb 2022 05:54:47 -0500
Message-Id: <20220209105452.1694545-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Greg Kurz <groug@kaod.org>, Hanna Reitz <hreitz@redhat.com>,
 qemu-ppc@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 "Denis V. Lunev" <den@openvz.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This serie aims to refactoring and fixing permission API related bugs that came
up in the serie "block layer: split block APIs in global state and I/O".
In that serie, we are splitting all block layer headers in
Global State (GS) APIs, holding always the BQL and running in the
main loop, and I/O running in iothreads.

The patches in this serie are taken from v6 of the API split,
to reduce its size and apply these fixes independently.

Patches 1 and 2 take care of crypto and amend jobs, since they
incorrectly use the permission API also in iothreads.
Patches 3-4-5 take care of bdrv_invalidate_cache and callers,
since this function checks too for permisisons while being
called by an iothread.

Emanuele Giuseppe Esposito (5):
  crypto: perform permission checks under BQL
  crypto: distinguish between main loop and I/O in
    block_crypto_amend_options_generic_luks
  block: introduce bdrv_activate
  block: rename bdrv_invalidate_cache_all, blk_invalidate_cache and
    test_sync_op_invalidate_cache
  block: move BQL logic of bdrv_co_invalidate_cache in bdrv_activate

 block.c                          | 38 +++++++++++++-------
 block/amend.c                    | 24 +++++++++++++
 block/block-backend.c            |  4 +--
 block/crypto.c                   | 62 +++++++++++++++++++++-----------
 block/export/export.c            |  2 +-
 block/parallels.c                |  2 +-
 hw/block/pflash_cfi01.c          |  2 +-
 hw/nvram/spapr_nvram.c           |  2 +-
 include/block/block.h            |  3 +-
 include/block/block_int.h        | 14 ++++++++
 include/sysemu/block-backend.h   |  2 +-
 migration/block.c                |  2 +-
 migration/migration.c            | 14 ++++----
 migration/savevm.c               |  6 ++--
 monitor/qmp-cmds.c               |  2 +-
 tests/unit/test-block-iothread.c |  8 ++---
 16 files changed, 131 insertions(+), 56 deletions(-)

-- 
2.31.1


