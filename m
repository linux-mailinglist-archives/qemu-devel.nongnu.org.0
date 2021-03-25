Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C213495DC
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 16:44:00 +0100 (CET)
Received: from localhost ([::1]:33964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPS9P-0000Vp-D0
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 11:43:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lPS4t-0003Yq-Te
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 11:39:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lPS4r-0008Fr-Gz
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 11:39:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616686756;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=thBGSTr8I9vNq1uELKtgW8+7KumHiXIZ/UWz2tjrm58=;
 b=M01eXVzFvX5O9OFQjZZQRwuIcGYZz/UXDr+5W2B213Xn8l8FVS16udUviVcJIpRd+hIza2
 OJpWLsRkpyQGMmFmnRNZBMNt1CBrtd6e5IntvDTFuxh76Jb/5yGCixdKAMhzcQycimtvuE
 jP82LtdZxEzKWcZUKjBMlw3723frc1k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-486-_PiXWr3cNXOF1t8BAZUi9g-1; Thu, 25 Mar 2021 11:39:14 -0400
X-MC-Unique: _PiXWr3cNXOF1t8BAZUi9g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B65E1922960;
 Thu, 25 Mar 2021 15:39:13 +0000 (UTC)
Received: from horse.redhat.com (ovpn-118-78.rdu2.redhat.com [10.10.118.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 48AE51007606;
 Thu, 25 Mar 2021 15:39:09 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id D1806220BCF; Thu, 25 Mar 2021 11:39:08 -0400 (EDT)
From: Vivek Goyal <vgoyal@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com
Subject: [PATCH v5 0/5] virtiofsd: Add support to enable/disable posix acls
Date: Thu, 25 Mar 2021 11:38:47 -0400
Message-Id: <20210325153852.572927-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: lhenriques@suse.de, dgilbert@redhat.com, vgoyal@redhat.com,
 miklos@szeredi.hu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This is V5 of the patches.

Changes since V4:

- Added support to clear SGID while setting posix access acl. fuse
  client sends this information in a flag in SETXATTR message. This
  also requires opting in for using SETXATTR V2.

These patches have dependency on fuse kernel patches. So kernel patches
need to be get merged first.

https://lore.kernel.org/linux-fsdevel/20210325151823.572089-1-vgoyal@redhat.com/

Posting patches anyway, so that patches can get reviewed and tested.

Thanks
Vivek
 
Vivek Goyal (5):
  virtiofsd: Add umask to seccom allow list
  virtiofsd: Add capability to change/restore umask
  virtiofsd: Add an option to enable/disable posix acls
  virtiofsd: Add support for setxattr_v2
  virtiofsd: Switch creds, drop FSETID for system.posix_acl_access xattr

 docs/tools/virtiofsd.rst              |   3 +
 include/standard-headers/linux/fuse.h |  19 ++-
 tools/virtiofsd/fuse_common.h         |   6 +
 tools/virtiofsd/fuse_lowlevel.c       |  42 ++++++-
 tools/virtiofsd/fuse_lowlevel.h       |   3 +-
 tools/virtiofsd/helper.c              |   1 +
 tools/virtiofsd/passthrough_ll.c      | 166 ++++++++++++++++++++++++--
 tools/virtiofsd/passthrough_seccomp.c |   1 +
 8 files changed, 230 insertions(+), 11 deletions(-)

-- 
2.25.4


