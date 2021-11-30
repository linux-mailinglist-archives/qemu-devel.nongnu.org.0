Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C20CE46300F
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Nov 2021 10:48:48 +0100 (CET)
Received: from localhost ([::1]:49564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrzkl-00042W-TV
	for lists+qemu-devel@lfdr.de; Tue, 30 Nov 2021 04:48:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mrzil-0001m7-SW
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 04:46:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mrzik-0002vW-Fd
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 04:46:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638265601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=kVV+yRGlXBMtXdfrIQETKWp+i/8fYGgfd5zUxy9fVs4=;
 b=fGMuLPExu27ta3EMfF4PVgfR27564K8dErJy3fCHrZTe5nuNWhJlEflwj/JgRvatpWBlwb
 KgebGzyDVhPQ9qIjooFBoCh3QexCURGn3kbePdVFEtqh5J6OaDBjAe3w5ZA8X10iCp8xIL
 2eCo8JZOKmOw3nxcfPeLCBGpwwkomCM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-344-_FDAClePP0-ryHGVh0rxCA-1; Tue, 30 Nov 2021 04:46:38 -0500
X-MC-Unique: _FDAClePP0-ryHGVh0rxCA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C261A835E20;
 Tue, 30 Nov 2021 09:46:37 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 127142B178;
 Tue, 30 Nov 2021 09:46:37 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 0/4] block: minor refactoring in preparation to the block
 layer API split
Date: Tue, 30 Nov 2021 04:46:29 -0500
Message-Id: <20211130094633.277982-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
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
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These patches are taken from my old patches and feedback of
my series "block layer: split block APIs in global state and I/O".

The reason for a separate series is that the original one is
already too long, and these patches are just refactoring the code,
mainly deleting or moving functions in blockdev.h and block_int.h.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
v2:
* Apply Philippe comments, instead of renaming a make if_name
  public, create a getter method (discard old patch 2).

Emanuele Giuseppe Esposito (4):
  block_int: make bdrv_backing_overridden static
  include/sysemu/blockdev.c: introduce block_if_name
  include/sysemu/blockdev.h: move drive_add and inline drive_def
  include/sysemu/blockdev.h: remove drive_get_max_devs

 block.c                        |  4 ++-
 block/monitor/block-hmp-cmds.c |  2 +-
 blockdev.c                     | 47 ++++------------------------------
 include/block/block_int.h      |  3 ---
 include/sysemu/blockdev.h      |  6 +----
 softmmu/vl.c                   | 25 +++++++++++++++++-
 6 files changed, 34 insertions(+), 53 deletions(-)

-- 
2.31.1


