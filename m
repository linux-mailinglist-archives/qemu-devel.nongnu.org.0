Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E41559660
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 11:24:19 +0200 (CEST)
Received: from localhost ([::1]:56562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4fY2-0003ts-St
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 05:24:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o4f1k-0004S9-08
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 04:50:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o4f1h-0000cf-CO
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 04:50:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656060652;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=DQUl0iT3rgr1GwEzrV3Znm4eNoOtV8HI8JOGwCG2gGg=;
 b=MCVJygrUYuvcuA4ew+bFQw91N8i/mdEd6j2YOL6+23ApaO8oVN35XOY4s6OXetgraTiD+F
 djDY2ICi6Br9wk0u2yBfbZUiMiI7c8eWlserGuJNGoOCJtn59HR9qRGMwwDxFBWm+9+JN3
 ATUA+20pfj8OpZvjpr9XzQ8vh4ld03k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-483-YqLMJxVsPv6ZwvPXYvP9jA-1; Fri, 24 Jun 2022 04:50:46 -0400
X-MC-Unique: YqLMJxVsPv6ZwvPXYvP9jA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 62F83811E80;
 Fri, 24 Jun 2022 08:50:46 +0000 (UTC)
Received: from thuth.com (unknown [10.39.195.0])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1F82E40334F;
 Fri, 24 Jun 2022 08:50:44 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-s390x@nongnu.org,
	Eric Farman <farman@linux.ibm.com>
Cc: qemu-devel@nongnu.org,
	Christian Borntraeger <borntraeger@linux.ibm.com>
Subject: [PATCH 0/2] Fix booting from non-DASD disks with sector size of 4096
Date: Fri, 24 Jun 2022 10:50:35 +0200
Message-Id: <20220624085037.612235-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

The s390-ccw bios fails to boot from non-DASD disks that have a
sector size of 4096. Fix it by relaxing the check for the disk
geometries.

Thomas Huth (2):
  pc-bios/s390-ccw/virtio-blkdev: Simplify/fix
    virtio_ipl_disk_is_valid()
  pc-bios/s390-ccw/virtio-blkdev: Remove virtio_assume_scsi()

 pc-bios/s390-ccw/virtio.h        |  2 -
 pc-bios/s390-ccw/virtio-blkdev.c | 65 ++++----------------------------
 2 files changed, 7 insertions(+), 60 deletions(-)

-- 
2.31.1


