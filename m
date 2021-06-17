Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 278F93ABB4A
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 20:19:00 +0200 (CEST)
Received: from localhost ([::1]:39898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltwbP-000091-Bo
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 14:18:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1ltwVP-0006UI-RO
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 14:12:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1ltwVL-0001uh-J9
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 14:12:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623953559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=yR8G5Kp1+H2CWmXt50zJ8BlLbDJqpcNakOcFq/IhgIw=;
 b=Nd+Um3+ox0w9KalFcIVsItswVihPx6ciVeKGLls2p3kFS6mSjDFk7ML/m2CZh9XxHk8o3c
 Dm3H+rWNl2yDPcQd7+UetPHCjyxQtLoVad9VfgPDeRcJk9IZpkBBkuELaABfjSj3FUfGHF
 hNjqxN2GQ8wAzTNG9UKO2EugS1F7R/M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-275-B7aJu7_TNp2A6ms6TNpfww-1; Thu, 17 Jun 2021 14:12:35 -0400
X-MC-Unique: B7aJu7_TNp2A6ms6TNpfww-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B763780ED8B;
 Thu, 17 Jun 2021 18:12:34 +0000 (UTC)
Received: from horse.redhat.com (ovpn-116-162.rdu2.redhat.com [10.10.116.162])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7020A5D6D7;
 Thu, 17 Jun 2021 18:12:31 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id E307A220BCF; Thu, 17 Jun 2021 14:12:30 -0400 (EDT)
From: Vivek Goyal <vgoyal@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 0/8] virtiofsd: Add support to enable/disable posix acls
Date: Thu, 17 Jun 2021 14:12:05 -0400
Message-Id: <20210617181213.1177835-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: virtio-fs@redhat.com, lhenriques@suse.de, dgilbert@redhat.com,
 vgoyal@redhat.com, miklos@szeredi.hu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This is V6 of the patches.

Changes since V5:

- Kernel patches for extended setxattr have been merged in 5.13-rc1.
  These patches have been modified to work with FUSE_SETXATTR_EXT.

Currently posix ACL support does not work well with virtiofs and bunch
of tests fail when I run xfstests "./check -g acl".

This patches series fixes the issues with virtiofs posix acl support
and provides options to enable/disable posix acl (-o posix_acl/no_posix_acl).
By default posix_acls are disabled.

With this patch series applied and virtiofsd running with "-o posix_acl",
xfstests "./check -g acl" passes.

Thanks
Vivek

Vivek Goyal (8):
  linux-headers: Update linux headers to 5.13.0-rc6
  virtiofsd: Fix fuse setxattr() API change issue
  virtiofsd: Fix xattr operations overwriting errno
  virtiofsd: Add support for extended setxattr
  virtiofsd: Add umask to seccom allow list
  virtiofsd: Add capability to change/restore umask
  virtiofsd: Switch creds, drop FSETID for system.posix_acl_access xattr
  virtiofsd: Add an option to enable/disable posix acls

 docs/tools/virtiofsd.rst                      |   3 +
 .../infiniband/hw/vmw_pvrdma/pvrdma_verbs.h   |  35 -
 include/standard-headers/drm/drm_fourcc.h     |  23 +-
 include/standard-headers/linux/ethtool.h      | 109 ++-
 include/standard-headers/linux/fuse.h         |  17 +-
 .../linux/input-event-codes.h                 |   1 +
 include/standard-headers/linux/input.h        |   2 +-
 include/standard-headers/linux/virtio_ids.h   |   2 +
 .../standard-headers/rdma/vmw_pvrdma-abi.h    |   7 +
 linux-headers/asm-generic/unistd.h            |  13 +-
 linux-headers/asm-mips/unistd_n32.h           | 751 +++++++--------
 linux-headers/asm-mips/unistd_n64.h           | 703 +++++++-------
 linux-headers/asm-mips/unistd_o32.h           | 843 ++++++++---------
 linux-headers/asm-powerpc/kvm.h               |   2 +
 linux-headers/asm-powerpc/unistd_32.h         | 856 +++++++++---------
 linux-headers/asm-powerpc/unistd_64.h         | 800 ++++++++--------
 linux-headers/asm-s390/unistd_32.h            |   4 +
 linux-headers/asm-s390/unistd_64.h            |   4 +
 linux-headers/asm-x86/kvm.h                   |   3 +
 linux-headers/asm-x86/unistd_32.h             |   4 +
 linux-headers/asm-x86/unistd_64.h             |   4 +
 linux-headers/asm-x86/unistd_x32.h            |   4 +
 linux-headers/linux/kvm.h                     | 131 ++-
 linux-headers/linux/userfaultfd.h             |  36 +-
 linux-headers/linux/vfio.h                    |  35 +
 tools/virtiofsd/fuse_common.h                 |  10 +
 tools/virtiofsd/fuse_lowlevel.c               |  18 +-
 tools/virtiofsd/fuse_lowlevel.h               |   3 +-
 tools/virtiofsd/helper.c                      |   1 +
 tools/virtiofsd/passthrough_ll.c              | 229 ++++-
 tools/virtiofsd/passthrough_seccomp.c         |   1 +
 31 files changed, 2592 insertions(+), 2062 deletions(-)

-- 
2.25.4


