Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 217E82F9FEE
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 13:37:38 +0100 (CET)
Received: from localhost ([::1]:37004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1Tmn-0003ws-NY
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 07:37:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l1TkM-0002K1-Tm
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 07:35:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l1TkF-0003fQ-Uc
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 07:35:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610973294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=HVJiRJdOSXOSwJM59rPFjwHtDPC+Bpd8a3iKLvhqrmk=;
 b=aes64Xc/A5W6sJ+m2VgZHrGj1qssEEu9b8pBEyl5pCVzQJzDbJU+fiD0TaRS50BmVZHkr+
 vr/2qYuJ9V8FYMLM52yPdUEduTmb22ghR8akloJ2c8UJo3fcOZxUY7eX1poPKZfmEXNp7w
 zlMawMFBV70swoHExITUQdo2YOo0Td4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-VuRi0IHYNuyqUU0Tr1Vniw-1; Mon, 18 Jan 2021 07:34:53 -0500
X-MC-Unique: VuRi0IHYNuyqUU0Tr1Vniw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ECD2A107ACE4;
 Mon, 18 Jan 2021 12:34:51 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-115-75.ams2.redhat.com [10.36.115.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BC499197F2;
 Mon, 18 Jan 2021 12:34:50 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 0/2] block: Fix crash on write to read-only devices
Date: Mon, 18 Jan 2021 13:34:46 +0100
Message-Id: <20210118123448.307825-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.175,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, alxndr@bu.edu, qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kevin Wolf (2):
  block: Separate blk_is_writable() and blk_supports_write_perm()
  virtio-scsi-test: Test writing to scsi-cd device

 include/sysemu/block-backend.h |  3 ++-
 block/block-backend.c          | 19 ++++++++++++++---
 hw/block/dataplane/xen-block.c |  2 +-
 hw/block/fdc.c                 |  9 ++++----
 hw/block/m25p80.c              |  6 +++---
 hw/block/nand.c                |  2 +-
 hw/block/nvme-ns.c             |  7 +++---
 hw/block/onenand.c             |  2 +-
 hw/block/pflash_cfi01.c        |  2 +-
 hw/block/pflash_cfi02.c        |  2 +-
 hw/block/swim.c                |  6 +++---
 hw/block/virtio-blk.c          |  6 +++---
 hw/block/xen-block.c           |  2 +-
 hw/ide/core.c                  |  2 +-
 hw/misc/sifive_u_otp.c         |  2 +-
 hw/ppc/pnv_pnor.c              |  2 +-
 hw/scsi/scsi-disk.c            | 10 ++++-----
 hw/scsi/scsi-generic.c         |  4 ++--
 hw/sd/sd.c                     |  6 +++---
 hw/usb/dev-storage.c           |  4 ++--
 tests/qtest/virtio-scsi-test.c | 39 ++++++++++++++++++++++++++++++++++
 21 files changed, 96 insertions(+), 41 deletions(-)

-- 
2.29.2


