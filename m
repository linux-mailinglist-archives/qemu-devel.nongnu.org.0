Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A59D84B744D
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 19:23:00 +0100 (CET)
Received: from localhost ([::1]:39904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK2Tb-0006uK-Ld
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 13:22:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nK2ND-0008Ng-IT
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 13:16:24 -0500
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:54306)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nK2NB-0003bw-H6
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 13:16:23 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-451-77r74kqUMqqX09q2a_AKYw-1; Tue, 15 Feb 2022 13:16:11 -0500
X-MC-Unique: 77r74kqUMqqX09q2a_AKYw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 02CAB1091DA2;
 Tue, 15 Feb 2022 18:16:09 +0000 (UTC)
Received: from bahia.redhat.com (unknown [10.39.192.173])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8E3677ACE7;
 Tue, 15 Feb 2022 18:15:30 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 0/1] virtiofsd: Add support for FUSE_SYNCFS request
Date: Tue, 15 Feb 2022 19:15:28 +0100
Message-Id: <20220215181529.164070-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
 Greg Kurz <groug@kaod.org>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 virtio-fs@redhat.com, Stefan Hajnoczi <stefanha@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

FUSE_SYNCFS allows the client to flush the host page cache.=0D
=0D
v6: - drop ! announce_submounts part for now, only the root inode is=0D
      synced in this case=0D
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
Greg Kurz (1):=0D
  virtiofsd: Add basic support for FUSE_SYNCFS request=0D
=0D
 tools/virtiofsd/fuse_lowlevel.c       | 11 +++++++=0D
 tools/virtiofsd/fuse_lowlevel.h       | 13 ++++++++=0D
 tools/virtiofsd/passthrough_ll.c      | 44 +++++++++++++++++++++++++++=0D
 tools/virtiofsd/passthrough_seccomp.c |  1 +=0D
 4 files changed, 69 insertions(+)=0D
=0D
--=20=0D
2.34.1=0D
=0D


