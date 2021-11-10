Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C2C44CDC0
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 00:22:38 +0100 (CET)
Received: from localhost ([::1]:45102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkwvN-0002Uj-FC
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 18:22:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mkwql-0003kE-Fb
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 18:17:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42179)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mkwqi-0001Fs-70
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 18:17:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636586266;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=TZ3BbnxMhfWnQsf+3fkM4gg11kfjNrKGyzFVYPJzZv0=;
 b=isGDuWWgftluEhRYrAFH7qRJsYF6nyY0tM3NfIW/OvZieV6P41lzJckRGuYM++pE01Vlko
 RRibTanZ8+6iO2QrJNndy5+pJRu25447TQtkNSvAogcZvRl30AGM4wRXoI1Oax6F8VbF//
 U4HPv1Ds2bE3O4XFLtRCJLkTpBo23LU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-h-VkTIpGNDqzpvXOdZi89A-1; Wed, 10 Nov 2021 18:17:45 -0500
X-MC-Unique: h-VkTIpGNDqzpvXOdZi89A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 38F3B1030C20;
 Wed, 10 Nov 2021 23:17:44 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.10.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B0CFD60854;
 Wed, 10 Nov 2021 23:17:36 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 40604223DF5; Wed, 10 Nov 2021 18:17:36 -0500 (EST)
From: Vivek Goyal <vgoyal@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com,
	dgilbert@redhat.com
Subject: [PATCH v3 0/6] virtiofsd: Add support for file security context at
 creation
Date: Wed, 10 Nov 2021 18:17:22 -0500
Message-Id: <20211110231728.50385-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: chirantan@chromium.org, casey@schaufler-ca.com, omosnace@redhat.com,
 vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This is V3 of the patches. I posted V2 here.

https://lore.kernel.org/qemu-devel/20211014153126.575173-1-vgoyal@redhat.com/

Kernel patches are not upstream yet. So header files will need to be
updated once kernel patches are merged. I posted V3 of kernel patches
here.

https://lore.kernel.org/linux-fsdevel/20211110225528.48601-1-vgoyal@redhat.com/T/#m08352d3d46f948c6c507c28f9db83098d175ca54

Changes since v2:

- Renamed "struct fuse_secctxs" to "struct fuse_secctx_header".
- Added a size field to fuse_secctx_header.    

Thanks
Vivek

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


