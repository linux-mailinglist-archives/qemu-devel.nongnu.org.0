Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2206C7097
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 19:56:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfQ6k-0005SS-7y; Thu, 23 Mar 2023 14:56:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pfQ6i-0005RV-Bi
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 14:56:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pfQ6g-0007A5-Tu
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 14:56:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679597774;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=EtHWdd81jHz9GNk9X6lMDXIiJ/YFCVABcQ8gKi8zIR4=;
 b=jRkFdEfzmxeaHG5s0oRyrweiTMx5jkEF5drAh328kUzh6EG/V6kEF7JRa/JVYI1ZlSCZYe
 zy2LjshhLFDI5y7kp9SGZISwBfFVk44zzJM08k7eUzPCgnva847Z6eJF+BIIBFyqDOsvNm
 MO3wW2FgJpx2EI4NFGM5dGMfyYMwl6g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-554-RohgSxorPJCsMnlTHDL_SA-1; Thu, 23 Mar 2023 14:56:10 -0400
X-MC-Unique: RohgSxorPJCsMnlTHDL_SA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D555B885627;
 Thu, 23 Mar 2023 18:56:09 +0000 (UTC)
Received: from localhost (unknown [10.39.192.106])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C3E411121314;
 Thu, 23 Mar 2023 18:56:08 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Fam Zheng <fam@euphon.net>, kwolf@redhat.com, <qemu-block@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH 0/2] virtio-scsi: stop using aio_disable_external() during
 unplug
Date: Thu, 23 Mar 2023 14:56:05 -0400
Message-Id: <20230323185607.1458987-1-stefanha@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The aio_disable_external() API is a solution for stopping I/O during critical
sections. The newer BlockDevOps->drained_begin/end/poll() callbacks offer a
cleaner solution that supports the upcoming multi-queue block layer. This
series removes aio_disable_external() from the virtio-scsi emulation code.

Patch 1 is a fix for something I noticed when reading the code.

Patch 2 replaces aio_disable_external() with functionality for safe hot unplug
that's mostly already present in the SCSI emulation code.

Stefan Hajnoczi (2):
  virtio-scsi: avoid race between unplug and transport event
  virtio-scsi: stop using aio_disable_external() during unplug

 hw/scsi/scsi-bus.c    |  3 ++-
 hw/scsi/scsi-disk.c   |  1 +
 hw/scsi/virtio-scsi.c | 21 +++++++++------------
 3 files changed, 12 insertions(+), 13 deletions(-)

-- 
2.39.2


