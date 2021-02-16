Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4900D31D05B
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 19:44:39 +0100 (CET)
Received: from localhost ([::1]:52204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC5Kw-00008q-Bi
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 13:44:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lC5EM-0004JL-EA
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 13:37:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lC5EK-0000FB-C8
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 13:37:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613500667;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=wyApsLFH0V/pKY7PHdz6aox9hoYXV1AA10IwjbbzPdk=;
 b=Rz5KoXIfHhEra8uc/FyN8IVuOfXJnvS0PC27EtzgiSsk5MW7Se1eptpIrD/N9FKp/mMtwM
 878Vdfq9fDerNYZ18ll3XQMuLPtcMzZKKWY1oS+KI3qQ8r6YU/UWRAWTIcvkuNIuKq2yuE
 xkI3fRjKjAwTTurfKtqqjYeGYtBue2s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-582-Yjd_biCeNd2xZgZsl89C2Q-1; Tue, 16 Feb 2021 13:37:44 -0500
X-MC-Unique: Yjd_biCeNd2xZgZsl89C2Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 451BB1934101;
 Tue, 16 Feb 2021 18:37:43 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-115-109.ams2.redhat.com
 [10.36.115.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BF86A5C1B4;
 Tue, 16 Feb 2021 18:37:35 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, wainersm@redhat.com, groug@kaod.org,
 philmd@redhat.com, vgoyal@redhat.com
Subject: [PULL 0/6] virtiofs queue
Date: Tue, 16 Feb 2021 18:37:28 +0000
Message-Id: <20210216183734.57810-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
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
Cc: virtio-fs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

The following changes since commit 18543229fd7a2c79dcd6818c7b1f0f62512b5220:

  Merge remote-tracking branch 'remotes/cleber-gitlab/tags/python-next-pull-request' into staging (2021-02-16 14:37:57 +0000)

are available in the Git repository at:

  https://gitlab.com/dagrh/qemu.git tags/pull-virtiofs-20210216

for you to fetch changes up to 26ec1909648e0c06ff06ebc3ddb2f88ebeeaa6a9:

  virtiofsd: Do not use a thread pool by default (2021-02-16 17:54:18 +0000)

----------------------------------------------------------------
virtiofsd pull 2021-02-16

Vivek's support for new FUSE KILLPRIV_V2
and some smaller cleanups.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

----------------------------------------------------------------
Greg Kurz (1):
      virtiofsd: vu_dispatch locking should never fail

Philippe Mathieu-Daudé (1):
      tools/virtiofsd: Replace the word 'whitelist'

Vivek Goyal (3):
      virtiofsd: Save error code early at the failure callsite
      viriofsd: Add support for FUSE_HANDLE_KILLPRIV_V2
      virtiofsd: Do not use a thread pool by default

Wainer dos Santos Moschetta (1):
      virtiofsd: Allow to build it without the tools

 tools/meson.build                     |  7 ++-
 tools/virtiofsd/fuse_common.h         | 15 ++++++
 tools/virtiofsd/fuse_lowlevel.c       | 13 ++++-
 tools/virtiofsd/fuse_lowlevel.h       |  1 +
 tools/virtiofsd/fuse_virtio.c         | 49 ++++++++++++-----
 tools/virtiofsd/passthrough_ll.c      | 99 ++++++++++++++++++++++++++++++-----
 tools/virtiofsd/passthrough_seccomp.c | 12 ++---
 7 files changed, 158 insertions(+), 38 deletions(-)


