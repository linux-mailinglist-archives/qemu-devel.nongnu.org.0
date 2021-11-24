Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A7A45B46F
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 07:44:14 +0100 (CET)
Received: from localhost ([::1]:59084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpm0q-00026o-Nd
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 01:44:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mpltm-0008Di-0a
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 01:36:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mplti-0007b7-PV
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 01:36:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637735808;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=X5oo1tZ8kb1BdtIZo76oCGBBGVA1X3/eDDOJtgokIBU=;
 b=SJiI95qWpiBwgYFgmIc0CL/12HHDYUS94bp5tXVE1JcW7k/VZ/F9TK2o5yFyfEMxuNbjYx
 2AdlTHlAayH68kGZY6tOOq6BXQDA0YWutzlnJ2hpC4cY9u0UbsQAIYuGptW0OOeflSbbAk
 7CXmW1NKtBwFocGuzXqPc0DGsgZnbQU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-313-8NO0_bRmMoezEO6BsqMntQ-1; Wed, 24 Nov 2021 01:36:47 -0500
X-MC-Unique: 8NO0_bRmMoezEO6BsqMntQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6C716100C662;
 Wed, 24 Nov 2021 06:36:46 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 288F0100EBBF;
 Wed, 24 Nov 2021 06:36:43 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 0/4] block: minor refactoring in preparation to the block
 layer API split
Date: Wed, 24 Nov 2021 01:36:36 -0500
Message-Id: <20211124063640.3118897-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Emanuele Giuseppe Esposito (4):
  block_int: make bdrv_backing_overridden static
  include/sysemu/blockdev.h: rename if_name in block_if_name
  include/sysemu/blockdev.h: move drive_add and inline drive_def
  include/sysemu/blockdev.h: remove drive_get_max_devs

 include/block/block_int.h      |  3 --
 include/sysemu/blockdev.h      |  7 ++---
 block.c                        |  4 ++-
 block/monitor/block-hmp-cmds.c |  2 +-
 blockdev.c                     | 54 ++++------------------------------
 softmmu/vl.c                   | 25 +++++++++++++++-
 6 files changed, 36 insertions(+), 59 deletions(-)

-- 
2.27.0


