Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF8F417BF1
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 21:52:42 +0200 (CEST)
Received: from localhost ([::1]:51770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTrFR-0006ra-9D
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 15:52:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mTrCd-00049s-KO
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 15:49:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mTrCV-0004Io-Ug
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 15:49:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632512979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=x7qK3fA0fCVmP7qoPOxjVHKfm5i7Pi95nFohktMYIwM=;
 b=V/DhCHz5w0XmqNsaiwIvH4w15v9k1ugG1Ek8vWueWm2k3hm7ZTqVs/VSmey7FNJts0m6kS
 qw1hQ4i2hWbeRZQtqUHTRscjh2PegU/8LNsEktHApnpfhgHXcH99S2vVScgqhoMD2nZd20
 KtW2NFzLSX30tEDz94wRDa3clLJCg9U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-513-EFpsvFvAOeKkU9s7D1pd7Q-1; Fri, 24 Sep 2021 15:49:38 -0400
X-MC-Unique: EFpsvFvAOeKkU9s7D1pd7Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 084D010B3B7B;
 Fri, 24 Sep 2021 19:49:07 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.32.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C16F05FC13;
 Fri, 24 Sep 2021 19:49:06 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 4FEE3222E4F; Fri, 24 Sep 2021 15:49:06 -0400 (EDT)
From: Vivek Goyal <vgoyal@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com
Subject: [PATCH 0/5] virtiofsd: Add support for file security context at
 creation
Date: Fri, 24 Sep 2021 15:48:49 -0400
Message-Id: <20210924194854.919414-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.473,
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
 dwalsh@redhat.com, dgilbert@redhat.com, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

These patches add support to receive and set file security context at
the time of file creation. This is one of the components needed to
support SELinux on virtiofs.

I have posted kernel patches here just now.

https://lore.kernel.org/linux-fsdevel/20210924192442.916927-1-vgoyal@redhat.com/T/#m971f9001dd622b3f7a96a65899e3f146d2185841

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
	- Give CAP_SYS_ADMIN to virtiofsd. 

I have tested mode A and B but yet to test mode C.

I think either mode B or mode C will be most commonly used mode when
guest does need SELinux support in virtiofs.

With these patches, I am able to boot a guest VM with rootfs on virtiofs
and with SELinux enabled in guest. 

Please review.

Thanks
Vivek


Vivek Goyal (5):
  fuse: Header file changes for FUSE_SECURITY_CTX
  fuse_lowlevel.c: Add capability to parse security context
  virtiofsd: Move core file creation code in separate function
  virtiofsd: Create new file with fscreate set
  virtiofsd: Create new file using O_TMPFILE and set security context

 include/standard-headers/linux/fuse.h |  14 +-
 tools/virtiofsd/fuse_common.h         |   5 +
 tools/virtiofsd/fuse_i.h              |   7 +
 tools/virtiofsd/fuse_lowlevel.c       |  74 ++++++
 tools/virtiofsd/passthrough_ll.c      | 366 ++++++++++++++++++++++++--
 5 files changed, 436 insertions(+), 30 deletions(-)

-- 
2.31.1


