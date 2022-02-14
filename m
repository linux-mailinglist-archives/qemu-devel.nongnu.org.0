Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E994B54BB
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 16:26:23 +0100 (CET)
Received: from localhost ([::1]:59886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJdF8-0000ni-0c
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 10:26:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nJbsV-0004mf-61
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 08:58:55 -0500
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:43084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nJbsP-0001vy-RH
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 08:58:54 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-371-6h-p7OK0PkiELePLf2HTqQ-1; Mon, 14 Feb 2022 08:58:45 -0500
X-MC-Unique: 6h-p7OK0PkiELePLf2HTqQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6601C1091DA1;
 Mon, 14 Feb 2022 13:58:44 +0000 (UTC)
Received: from bahia.redhat.com (unknown [10.39.192.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 246607DE27;
 Mon, 14 Feb 2022 13:58:20 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 0/3] virtiofsd: Add support for FUSE_SYNCFS request
Date: Mon, 14 Feb 2022 14:58:17 +0100
Message-Id: <20220214135820.43897-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Sebastian Hasler <sebastian.hasler@stuvus.uni-stuttgart.de>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 virtio-fs@redhat.com, Stefan Hajnoczi <stefanha@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

FUSE_SYNCFS allows the client to flush the host page cache.=0D
=0D
v5: - split announce_submounts and ! announce_submounts to separate patches=
=0D
      for easier review (but could be squashed together)=0D
    - track submounts directly in lo_inode structure following the same=0D
      logic as FUSE_ATTR_SUBMOUNT (i.e. directory with either st_dev or=0D
      stx_mnt_id different from parent)=0D
=0D
v4: - based on upstream linux FUSE_SYNCFS=0D
    - added support for the '-o announce_submounts' case, i.e. client sends=
=0D
      a FUSE_SYNCFS request for each submount (identified by its root inode=
)=0D
    - adapted the case without '-o announce_submounts' so that syncfs() is=
=0D
      no longer called with lo->mutex held=0D
=0D
v3: - track submounts and do per-submount syncfs() (Vivek)=0D
    - based on new version of FUSE_SYNCFS (still not upstream)=0D
      https://listman.redhat.com/archives/virtio-fs/2021-May/msg00025.html=
=0D
=0D
v2: - based on new version of FUSE_SYNCFS=0D
      https://listman.redhat.com/archives/virtio-fs/2021-April/msg00166.htm=
l=0D
    - propagate syncfs() errors to client (Vivek)=0D
=0D
Greg Kurz (3):=0D
  virtiofsd: Add support for FUSE_SYNCFS request with announce_submounts=0D
  virtiofsd: Track submounts=0D
  virtiofsd: Add support for FUSE_SYNCFS request without=0D
    announce_submounts=0D
=0D
 tools/virtiofsd/fuse_lowlevel.c       | 11 ++++=0D
 tools/virtiofsd/fuse_lowlevel.h       | 13 ++++=0D
 tools/virtiofsd/passthrough_ll.c      | 93 +++++++++++++++++++++++++--=0D
 tools/virtiofsd/passthrough_seccomp.c |  1 +=0D
 4 files changed, 114 insertions(+), 4 deletions(-)=0D
=0D
--=20=0D
2.34.1=0D
=0D


