Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25129453820
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 17:56:42 +0100 (CET)
Received: from localhost ([::1]:43642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mn1lB-00046g-9Q
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 11:56:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mn1iz-0002ZV-Rh
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 11:54:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29144)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mn1iy-0000DL-CZ
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 11:54:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637081663;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=x5HiwyiYVuZuH85ED6y851IC5s6XJ4eT/OBpuIjWZFY=;
 b=F27MZW7dyq3qew2JcvTA6QCLTHt2+7OXfQ4daCf2xlI7YjYgmN+gFxJfFSK/aPl3bAI9h0
 mHGBFukFd0Ih0ysPgssP/8ZtO56938r4gCK0qe3TxINY4Xiskap2qffYJWEVMQdx5xp4UM
 wQ9VR6rOa+HASXMDG+PEJEjTjA5jhfY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-98-MM-5VUMAMS2XRkwl79pp1w-1; Tue, 16 Nov 2021 11:54:14 -0500
X-MC-Unique: MM-5VUMAMS2XRkwl79pp1w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 02FE8104ECFC
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 16:54:14 +0000 (UTC)
Received: from blue.redhat.com (ovpn-114-146.phx2.redhat.com [10.3.114.146])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C643C1981F
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 16:54:13 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/2] NBD patches for 6.2-rc1, 2021-11-16
Date: Tue, 16 Nov 2021 10:54:06 -0600
Message-Id: <20211116165408.751417-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The following changes since commit 9f0f846465d4c52ce9857787e947dffb64367fae:

  Merge tag 'machine-core-20211115' of https://github.com/philmd/qemu into staging (2021-11-16 12:50:27 +0100)

are available in the Git repository at:

  https://repo.or.cz/qemu/ericb.git tags/pull-nbd-2021-11-16

for you to fetch changes up to 3d212b41e9ccb3f37d04f22c59a960bac099c1d4:

  nbd/server: Add --selinux-label option (2021-11-16 10:16:38 -0600)

----------------------------------------------------------------
nbd patches for 2021-11-16

- Rich Jones: Add 'qemu-nbd --selinux-label' option for running Unix
  socket with appropriate SELinux labeling
- Eric Blake: Address clang sanitizer warning

----------------------------------------------------------------
Eric Blake (1):
      nbd/server: Silence clang sanitizer warning

Richard W.M. Jones (1):
      nbd/server: Add --selinux-label option

 meson.build                                       | 10 ++++-
 nbd/server.c                                      | 13 +++++--
 qemu-nbd.c                                        | 46 +++++++++++++++++++++++
 meson_options.txt                                 |  3 ++
 scripts/meson-buildoptions.sh                     |  3 ++
 tests/docker/dockerfiles/centos8.docker           |  1 +
 tests/docker/dockerfiles/fedora-i386-cross.docker |  1 +
 tests/docker/dockerfiles/fedora.docker            |  1 +
 tests/docker/dockerfiles/opensuse-leap.docker     |  1 +
 tests/docker/dockerfiles/ubuntu1804.docker        |  1 +
 tests/docker/dockerfiles/ubuntu2004.docker        |  1 +
 11 files changed, 76 insertions(+), 5 deletions(-)

-- 
2.33.1


