Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 680FE3B085C
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 17:12:47 +0200 (CEST)
Received: from localhost ([::1]:54854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvi50-0008OV-Fm
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 11:12:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lvi1V-00024Q-C7
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 11:09:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lvi1S-0005sX-Kh
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 11:09:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624374545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Z29JCuSyiwdNZVh88aty8Ex/EdEwkhIxIQy0Xy6+mTE=;
 b=ZVaxrLVi+5fAdhubkhGp/kjaz//7ukonE0HV54V5J9PmAPk/JJMVC2lDbVxgdV7/4Hvo0h
 ltfEHr8x7RzicyiRGpHAf+Wqqe0KpbHQTAwLjSJReD+ladqxOy7CwWxIpcR7DcC8qUy/Kh
 4lGtnvaYoDFQIEvEgQSBS9TsEOJv2As=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-11-TosK2JbHNbWNqd1Ygypo-g-1; Tue, 22 Jun 2021 11:09:04 -0400
X-MC-Unique: TosK2JbHNbWNqd1Ygypo-g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4072E192CC46;
 Tue, 22 Jun 2021 15:09:03 +0000 (UTC)
Received: from horse.redhat.com (ovpn-115-114.rdu2.redhat.com [10.10.115.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C71E01346F;
 Tue, 22 Jun 2021 15:08:59 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 5FCE722054F; Tue, 22 Jun 2021 11:08:59 -0400 (EDT)
From: Vivek Goyal <vgoyal@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com
Subject: [PATCH v7 0/7] virtiofsd: Add support to enable/disable posix acls
Date: Tue, 22 Jun 2021 11:08:45 -0400
Message-Id: <20210622150852.1507204-1-vgoyal@redhat.com>
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
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.223,
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
Cc: miklos@szeredi.hu, dgilbert@redhat.com, vgoyal@redhat.com,
 lhenriques@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This is V7 of the patches.

Changes since V6.

- Dropped kernel header update patch as somebody else did it.
- Fixed coding style issues.

Currently posix ACL support does not work well with virtiofs and bunch
of tests fail when I run xfstests "./check -g acl".

This patches series fixes the issues with virtiofs posix acl support
and provides options to enable/disable posix acl (-o posix_acl/no_posix_acl).
By default posix_acls are disabled.

With this patch series applied and virtiofsd running with "-o posix_acl",
xfstests "./check -g acl" passes.

Thanks
Vivek


Vivek Goyal (7):
  virtiofsd: Fix fuse setxattr() API change issue
  virtiofsd: Fix xattr operations overwriting errno
  virtiofsd: Add support for extended setxattr
  virtiofsd: Add umask to seccom allow list
  virtiofsd: Add capability to change/restore umask
  virtiofsd: Switch creds, drop FSETID for system.posix_acl_access xattr
  virtiofsd: Add an option to enable/disable posix acls

 docs/tools/virtiofsd.rst              |   3 +
 tools/virtiofsd/fuse_common.h         |  10 ++
 tools/virtiofsd/fuse_lowlevel.c       |  18 +-
 tools/virtiofsd/fuse_lowlevel.h       |   3 +-
 tools/virtiofsd/helper.c              |   1 +
 tools/virtiofsd/passthrough_ll.c      | 229 ++++++++++++++++++++++++--
 tools/virtiofsd/passthrough_seccomp.c |   1 +
 7 files changed, 249 insertions(+), 16 deletions(-)

-- 
2.25.4


