Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3EA243B0BA
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 13:03:28 +0200 (CEST)
Received: from localhost ([::1]:37480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfKEp-0004Iv-Qs
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 07:03:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mfJiD-0002pQ-T9
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 06:29:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mfJiC-0004hx-92
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 06:29:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635244183;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=dXUTLKqftnigezLQMCldC2Fqu+IXkNqjxfjk0gIBd6Q=;
 b=DsSTRbhH9iQTUcSt8883TEh7z7DJy6P9bFjVWECbJdfxpWoT3BhEgpb8C0oNe7HczdLvnp
 N7o24CnDzFtN2tvIZ7g78sZJSZSXWUzQqRIKcq1PruvlTxDUY9/OzIXXtXuFXtRPnsJffA
 NPCpb4Flx93de2H/tXSJ+nkwWkfcdEw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-482-kU4O4phOMnmVSshSE2Xi7g-1; Tue, 26 Oct 2021 06:29:42 -0400
X-MC-Unique: kU4O4phOMnmVSshSE2Xi7g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 748D21018734
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 10:29:39 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.39.195.33])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 99E64100EBAD;
 Tue, 26 Oct 2021 10:29:38 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/5] virtiofs queue
Date: Tue, 26 Oct 2021 11:29:28 +0100
Message-Id: <20211026102933.103139-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

The following changes since commit c5b2f559814104f4145f8bc310f4d33c7ead8f49:

  Merge remote-tracking branch 'remotes/vivier/tags/trivial-branch-for-6.2-pull-request' into staging (2021-10-23 14:30:10 -0700)

are available in the Git repository at:

  https://gitlab.com/dagrh/qemu.git tags/pull-virtiofs-20211026

for you to fetch changes up to 555a76e5e5dc2cd3c84c5e1bc060be17d5b32584:

  virtiofsd: Error on bad socket group name (2021-10-25 19:38:32 +0100)

----------------------------------------------------------------
Virtiofsd pull 2021-10-26

New 'unsupported' feature for xattr mapping
  Good for hiding selinux

Plus some tidy ups and error handling.
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

----------------------------------------------------------------
Dr. David Alan Gilbert (1):
      virtiofsd: Error on bad socket group name

Vivek Goyal (4):
      virtiofsd: xattr mapping add a new type "unsupported"
      virtiofsd: Remove unused virtio_fs_config definition
      virtiofsd: Add a helper to send element on virtqueue
      virtiofsd: Add a helper to stop all queues

 docs/tools/virtiofsd.rst         |  6 +++
 tools/virtiofsd/fuse_virtio.c    | 80 +++++++++++++++++++---------------------
 tools/virtiofsd/passthrough_ll.c | 17 +++++++--
 3 files changed, 58 insertions(+), 45 deletions(-)


