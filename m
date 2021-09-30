Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7C041DDD6
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 17:43:01 +0200 (CEST)
Received: from localhost ([::1]:37128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVyD6-00069U-IP
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 11:43:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mVy24-0005ab-9u
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 11:31:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mVy21-0002qm-Dt
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 11:31:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633015891;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=w6qBXQ82z1qAZeC/q14f+LqwCjMHtQYta3QHGAZbKvo=;
 b=D+Dj5LmNa2H3xQni5UHLxtiGxL/gEZAWXNHq5hYrRTAjlTE5tvMu5ZDB6NOua66vyNaWRl
 sJf5GAxWhMPXwvKRRL4hNX/diApQ6L9XO0kQZSWOpnEs2VV4KC8sbC/ji+NAjzGZNPiJQk
 4X8H41PzFIiGFz2G7e4cIFQ6QcQvyyI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-471-3I25EUMzNZCDgERbtGxqwQ-1; Thu, 30 Sep 2021 11:31:30 -0400
X-MC-Unique: 3I25EUMzNZCDgERbtGxqwQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E813D1006AA2;
 Thu, 30 Sep 2021 15:31:28 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.16.146])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 496A819E7E;
 Thu, 30 Sep 2021 15:30:48 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id C50F8220B02; Thu, 30 Sep 2021 11:30:47 -0400 (EDT)
From: Vivek Goyal <vgoyal@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com,
	stefanha@redhat.com
Subject: [PATCH 00/13] virtiofsd: Support notification queue and
Date: Thu, 30 Sep 2021 11:30:24 -0400
Message-Id: <20210930153037.1194279-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: jaggel@bu.edu, iangelak@redhat.com, dgilbert@redhat.com, vgoyal@redhat.com,
 miklos@szeredi.hu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

Here are the patches to support notification queue and blocking
posix locks. One of the biggest change since las time has been
creation of custom thread pool for handling locking requests. 
Thanks to Ioannis for doing most of the work on custom thread
pool.

I have posted corresponding kernel changes here.

https://lore.kernel.org/linux-fsdevel/20210930143850.1188628-1-vgoyal@redhat.com/T/#mb2d0fbfdb580ef33b6e812d0acbd16333b11f2cf

Any feedback is welcome.

Thanks
Vivek

Vivek Goyal (13):
  virtio_fs.h: Add notification queue feature bit
  virtiofsd: fuse.h header file changes for lock notification
  virtiofsd: Remove unused virtio_fs_config definition
  virtiofsd: Add a helper to send element on virtqueue
  virtiofsd: Add a helper to stop all queues
  vhost-user-fs: Use helpers to create/cleanup virtqueue
  virtiofsd: Release file locks using F_UNLCK
  virtiofsd: Create a notification queue
  virtiofsd: Specify size of notification buffer using config space
  virtiofsd: Custom threadpool for remote blocking posix locks requests
  virtiofsd: Shutdown notification queue in the end
  virtiofsd: Implement blocking posix locks
  virtiofsd, seccomp: Add clock_nanosleep() to allow list

 hw/virtio/vhost-user-fs-pci.c              |   4 +-
 hw/virtio/vhost-user-fs.c                  | 158 ++++++++--
 include/hw/virtio/vhost-user-fs.h          |   4 +
 include/standard-headers/linux/fuse.h      |  11 +-
 include/standard-headers/linux/virtio_fs.h |   5 +
 tools/virtiofsd/fuse_i.h                   |   1 +
 tools/virtiofsd/fuse_lowlevel.c            |  37 ++-
 tools/virtiofsd/fuse_lowlevel.h            |  26 ++
 tools/virtiofsd/fuse_virtio.c              | 339 +++++++++++++++++----
 tools/virtiofsd/meson.build                |   1 +
 tools/virtiofsd/passthrough_ll.c           |  91 +++++-
 tools/virtiofsd/passthrough_seccomp.c      |   2 +
 tools/virtiofsd/tpool.c                    | 331 ++++++++++++++++++++
 tools/virtiofsd/tpool.h                    |  18 ++
 14 files changed, 915 insertions(+), 113 deletions(-)
 create mode 100644 tools/virtiofsd/tpool.c
 create mode 100644 tools/virtiofsd/tpool.h

-- 
2.31.1


