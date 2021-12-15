Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDED94758D6
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 13:26:06 +0100 (CET)
Received: from localhost ([::1]:55946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxTMD-00084M-Qf
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 07:26:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mxT92-0001Ju-TB
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 07:12:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mxT8z-00088G-Tm
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 07:12:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639570343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rnqf+nhDIMcKKkypqsiM6RVaYRejB48CBsq6V6Y4nRY=;
 b=G0Tazy6qYQNM5NDky2C6McWhxCHOH0TzxwKLR3GcOeJQCxiI3BDN49gXL8zfuJSsBzL38Y
 IZOLHfYlXSo4CNtMmQ55348ydmohBhcrqa5+6mTg/oKaW38pnn9JIgDqxehi+b//XLYC1Y
 fU+sF3ywU286a0EcexBLavoGr/uzoPE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-396-JKYFtNgON9qOH8G2yXLWHA-1; Wed, 15 Dec 2021 07:12:20 -0500
X-MC-Unique: JKYFtNgON9qOH8G2yXLWHA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B0DE8104FC0E;
 Wed, 15 Dec 2021 12:12:19 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DCF807A46D;
 Wed, 15 Dec 2021 12:11:42 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 0/3] block: minor refactoring in preparation to the block
 layer API split
Date: Wed, 15 Dec 2021 07:11:37 -0500
Message-Id: <20211215121140.456939-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These patches are taken from my old patches and feedback of
my series "block layer: split block APIs in global state and I/O".

The reason for a separate series is that the original one is
already too long, and these patches are just refactoring the code,
mainly deleting or moving functions in blockdev.h and block_int.h.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
v3:
* Apply Kevin comments, remove getter method added in v2 and do
  not touch drive_add().

v2:
* Apply Philippe comments, instead of renaming a make if_name
  public, create a getter method (discard old patch 2).

Emanuele Giuseppe Esposito (3):
  block_int: make bdrv_backing_overridden static
  include/sysemu/blockdev.h: remove drive_mark_claimed_by_board and
    inline drive_def
  include/sysemu/blockdev.h: remove drive_get_max_devs

 block.c                        |  4 +++-
 block/monitor/block-hmp-cmds.c |  2 +-
 blockdev.c                     | 24 +-----------------------
 include/block/block_int.h      |  3 ---
 include/sysemu/blockdev.h      |  3 ---
 softmmu/vl.c                   |  4 +++-
 6 files changed, 8 insertions(+), 32 deletions(-)

-- 
2.31.1


