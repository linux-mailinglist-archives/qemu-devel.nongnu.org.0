Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2A442DE4F
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 17:38:33 +0200 (CEST)
Received: from localhost ([::1]:42998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb2oS-0000Aw-G5
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 11:38:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mb2hv-0005Ol-Ea
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 11:31:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mb2hr-0003SN-UL
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 11:31:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634225501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9FC2XleGeDwU6etf3CDxT6ghy2PqWRm/LKwzmStcB1Q=;
 b=MIEM9y/QnjqMS82rxq9+vhzcy9TWkMK2D1Hubf4kswsYXxB5l1a0r+koafEILrQ/b1qkL+
 ZN2zB83RIRow+r0ZLSTTjaW2lxIiHlWIEGMfB/8fDjytK8bZSkCZwbV2Tyt/soHqxt/wYi
 W02y9pFy6uF73ab6k4ZwHEoBUe57i8Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323-MCacJba5MoqOuGNkCtgwVA-1; Thu, 14 Oct 2021 11:31:39 -0400
X-MC-Unique: MCacJba5MoqOuGNkCtgwVA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 97B27101796F;
 Thu, 14 Oct 2021 15:31:38 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.16.190])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ACC4D1972D;
 Thu, 14 Oct 2021 15:31:37 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 3C05A22023A; Thu, 14 Oct 2021 11:31:37 -0400 (EDT)
From: Vivek Goyal <vgoyal@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com
Subject: [PATCH v2 0/6] virtiofsd: Add support for file security context at
 creation
Date: Thu, 14 Oct 2021 11:31:20 -0400
Message-Id: <20211014153126.575173-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: miklos@szeredi.hu, chirantan@chromium.org, stephen.smalley.work@gmail.com,
 dwalsh@redhat.com, dgilbert@redhat.com, omosnace@redhat.com,
 casey@schaufler-ca.com, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This is v2 of patches. I posted v1 here.

https://lore.kernel.org/qemu-devel/20210924194854.919414-1-vgoyal@redhat.com/

Posted corresponding kernel patches here.

https://lore.kernel.org/linux-fsdevel/20211012180624.447474-1-vgoyal@redhat.com/

changes since v1:

- Modified patches to handle changes to fuse protocol which allowed
  protocol to send multiple security lables. As of now we can handle
  only one label and we expect it to be selinux label.

- Added an option (-o security_label/no_security_label) to
  enable/disable security label. It is disabled by default.

- Did a fix to not use fscreate if host does not have selinux enabled.   

Description
-----------
These patches add support to receive and set file security context at
the time of file creation. This is one of the components needed to
support SELinux on virtiofs.

These patches will allow users to configure virtiofsd in multiple modes
to set security context.

A. Guest and host selinux policies can work with each other.
        - virtiofsd will use /proc/thread-self/attr/fscreate knob to
          set security context before file creation.

B. Remap guest selinux security xattr to something else say,
   trusted.virtiofs.security.selinux.
        - Give CAP_SYS_ADMIN to virtiofsd.
        - "-o -o xattrmap=:map:security.selinux:trusted.virtiofsd.:"

C. If no SELinux on host.
        - Give CAP_SYS_ADMIN to virtiofsd and security xattr will be
	  saved in security.selinux xattr on host.

With these patches, I am able to boot a guest VM with rootfs on virtiofs
and with SELinux enabled in guest.


Vivek Goyal (6):
  fuse: Header file changes for FUSE_SECURITY_CTX
  virtiofsd, fuse_lowlevel.c: Add capability to parse security context
  virtiofsd: Move core file creation code in separate function
  virtiofsd: Create new file with fscreate set
  virtiofsd: Create new file using O_TMPFILE and set security context
  virtiofsd: Add an option to enable/disable security label

 docs/tools/virtiofsd.rst              |   7 +
 include/standard-headers/linux/fuse.h |  19 +-
 tools/virtiofsd/fuse_common.h         |   5 +
 tools/virtiofsd/fuse_i.h              |   7 +
 tools/virtiofsd/fuse_lowlevel.c       |  91 ++++++
 tools/virtiofsd/helper.c              |   1 +
 tools/virtiofsd/passthrough_ll.c      | 414 ++++++++++++++++++++++++--
 7 files changed, 514 insertions(+), 30 deletions(-)

-- 
2.31.1


