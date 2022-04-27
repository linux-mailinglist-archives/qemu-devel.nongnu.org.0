Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C655118D4
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 16:37:43 +0200 (CEST)
Received: from localhost ([::1]:46762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njinW-0003DW-De
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 10:37:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1njilh-0000N1-2S
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 10:35:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1njild-0000gT-OA
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 10:35:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651070145;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=cdiGrqqPUzHa0QKKk6VoIHrIR9j86bMAMXsgLr+tBR8=;
 b=c1i8fP2tDCRcPB/vAteZxtl2oEd1EjCW6H7nQ99ppqw581+z0aqt+LRGDP368fTsgPZNrB
 gdFYFcaImikq9gzFzsWwkJAG2uP+wYq1y5mWQkC/HXN4QmB6RP2X/ITMynni/mXbvSFuw7
 dofnXpdC3SptdQQoxTlffngXDKM6bek=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-447-HPLln2yGO4aR9og_Mfe7GA-1; Wed, 27 Apr 2022 10:35:43 -0400
X-MC-Unique: HPLln2yGO4aR9og_Mfe7GA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D6BDF1E17FEB;
 Wed, 27 Apr 2022 14:35:42 +0000 (UTC)
Received: from localhost (unknown [10.39.195.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8809140D282F;
 Wed, 27 Apr 2022 14:35:42 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/6] virtio-scsi: fix 100% CPU consumption in IOThread
Date: Wed, 27 Apr 2022 15:35:35 +0100
Message-Id: <20220427143541.119567-1-stefanha@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Cc: Nir Soffer <nsoffer@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-stable@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Nir Soffer reported that virtio-scsi,iothread=... consumes 100% CPU in QEMU
7.0. This patch series addresses two bugs in hw/scsi/virtio-scsi.c (see patches
1 & 2) and follows up with code cleanups.

Stefan Hajnoczi (6):
  virtio-scsi: fix ctrl and event handler functions in dataplane mode
  virtio-scsi: don't waste CPU polling the event virtqueue
  virtio-scsi: clean up virtio_scsi_handle_event_vq()
  virtio-scsi: clean up virtio_scsi_handle_ctrl_vq()
  virtio-scsi: clean up virtio_scsi_handle_cmd_vq()
  virtio-scsi: move request-related items from .h to .c

 include/hw/virtio/virtio-scsi.h |  43 --------------
 include/hw/virtio/virtio.h      |   1 +
 hw/scsi/virtio-scsi-dataplane.c |   2 +-
 hw/scsi/virtio-scsi.c           | 101 ++++++++++++++++++++++----------
 hw/virtio/virtio.c              |  13 ++++
 5 files changed, 86 insertions(+), 74 deletions(-)

-- 
2.35.1


