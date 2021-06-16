Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 238BB3AA5AB
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 22:52:32 +0200 (CEST)
Received: from localhost ([::1]:49906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltcWV-00005z-1l
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 16:52:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iangelak@redhat.com>)
 id 1ltbPM-0003ZD-GD
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 15:41:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iangelak@redhat.com>)
 id 1ltbPK-0001Pr-Nt
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 15:41:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623872462;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=YosVWItPS1TuNd2cvhwLaTtK4BfJK4q/sTcTBZW0Yh0=;
 b=QguqX+hcH+aq99nNYkVdRnuNBB9nkQKU+unepBiVAyx9mR0Y2Fe0bNXQyeJgIWP1Sdb1Il
 QdfKmQJYGUDjkRrUJWEQM2W5GmUPZIwUstSlmuo5/ssp1CXQK6The5ojNUWowM/7NrGid+
 ilF5rYhe57OtOl8PKgLXCAnqIkY0ZGA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-OUoMgNb9OI6dLkfZSxM0Lw-1; Wed, 16 Jun 2021 15:39:42 -0400
X-MC-Unique: OUoMgNb9OI6dLkfZSxM0Lw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 82594801AE7
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 19:39:41 +0000 (UTC)
Received: from iangelak.remote.csb (ovpn-113-44.rdu2.redhat.com [10.10.113.44])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C4F0B60BF1;
 Wed, 16 Jun 2021 19:39:32 +0000 (UTC)
From: Ioannis Angelakopoulos <iangelak@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com
Subject: [PATCH 0/6] virtiofsd: Support for remote blocking posix locks
Date: Wed, 16 Jun 2021 15:39:15 -0400
Message-Id: <20210616193921.608720-1-iangelak@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=iangelak@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=iangelak@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 16 Jun 2021 16:41:48 -0400
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
Cc: iangelak@redhat.com, stefanha@redhat.com, dgilbert@redhat.com,
 vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

Here is the implementation for the remote blocking posix locks in
virtiofsd.

This patch series also addresses the issues that were not fixed in:
[Virtio-fs] [PATCH v2 0/5] [RFC] virtiofsd, vhost-user-fs: Add support
for notification queue
https://patchwork.kernel.org/project/qemu-devel/cover/20191204190836.31324-1-vgoyal@redhat.com/

The main issue was that the guest could not reboot when a thread of the
virtiofsd process was blocked, waiting to acquire a lock. The
introduction of a custom threadpool dedicated to servicing only locking
requests addresses the aforementioned issue.

Description:

Through the addition of a notification queue it is possible for a
guest now to block waiting for a remote lock held by another guest.

When the lock is available virtiofsd sends a notification to the guest
that unblocks the process/thread waiting for the lock in order to
acquire it.

This implementation also handles cases where the guest that is
waiting for a lock, hard-reboots through SYSRQ
(echo "b" > /proc/sysrq-trigger). Specifically, a custom threadpool
(posix theads) in virtiofsd is used to service the locking requests.
If one of the threads is blocked waiting for a lock and the guest
hard-reboots then virtiofsd sends a signal to the blocked thread waking 
it up so that it exits and then virtiofsd cleans up its state and
re-initializes.

Finally, the custom threadpool enables virtiofsd to concurrently service
other requests that are non-blocking or block for a limited time while
the custom threadpool services locking requests that might block. This is
especially useful in the case where the GThreadPool is not utilized.

Thanks,
Ioannis

Ioannis Angelakopoulos (2):
  virtiofsd: Thread state cleanup when blocking posix locks are used
  virtiofsd: Custom threadpool for remote blocking posix locks requests

Vivek Goyal (4):
  virtiofsd: Release file locks using F_UNLCK
  virtiofsd: Create a notification queue
  virtiofsd: Specify size of notification buffer using config space
  virtiofsd: Implement blocking posix locks

 hw/virtio/vhost-user-fs.c                  |  57 +-
 include/hw/virtio/vhost-user-fs.h          |   4 +-
 include/standard-headers/linux/fuse.h      |   8 +
 include/standard-headers/linux/virtio_fs.h |   5 +
 tools/virtiofsd/fuse_i.h                   |   2 +
 tools/virtiofsd/fuse_lowlevel.c            |  40 +-
 tools/virtiofsd/fuse_lowlevel.h            |  26 +
 tools/virtiofsd/fuse_virtio.c              | 626 +++++++++++++++++++--
 tools/virtiofsd/passthrough_ll.c           |  90 ++-
 9 files changed, 804 insertions(+), 54 deletions(-)

-- 
2.27.0


