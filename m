Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 851246B7FBA
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 18:50:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbmIF-0006GV-IG; Mon, 13 Mar 2023 13:49:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pbmHq-0006Ex-G4
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 13:48:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pbmHo-0000j7-S6
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 13:48:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678729716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=aEqvPEHcZpqcSa/m3CU48A3ZOtYVsZnPIvlbZeJwru0=;
 b=F9LxV58D1rybd++0kG63SBIDKOgvJ5c5UpnVWYaDd95zL45e0KVVbPE9Qnx3eGipb3XmrW
 pFZ6pjnWBB6kniFJhSvMz/JtaSoeNBc44UWd0oHmhyvpAzpdk6wpBnbrhs+aYiZEW3pS10
 Upgj2JET4olh4+uhxEls84bDJcovs40=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-674-DMrSVmTWOK2fZzCAA2hsTA-1; Mon, 13 Mar 2023 13:48:35 -0400
X-MC-Unique: DMrSVmTWOK2fZzCAA2hsTA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 17643857F47
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 17:48:35 +0000 (UTC)
Received: from localhost (unknown [10.39.193.191])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AC4E11121315;
 Mon, 13 Mar 2023 17:48:34 +0000 (UTC)
From: Hanna Czenczek <hreitz@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com
Cc: Hanna Czenczek <hreitz@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: [RFC 0/2] vhost-user-fs: Stateful migration
Date: Mon, 13 Mar 2023 18:48:31 +0100
Message-Id: <20230313174833.28790-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi,

Patch 1 of this RFC series adds virtio-fs-specific operations to vhost
for transferring a binary blob of back-end-internal state, and
implements those for vhost-user.

Patch 2 uses those operations to implement stateful migration for
vhost-user-fs devices, assuming the back-end (virtiofsd) supports it.

This is an RFC for multiple reasons, most notably:
- Patch 1 proposes yet undiscussed changes to the vhost protocol, which
  makes it RFC by default.
- Without much experience in the fields of migration or vhost (on the
  qemu side), I hope marking this as an RFC leads to extra scrutiny on
  the reviewer’s side. O:)


Hanna Czenczek (2):
  vhost-user: Add interface for virtio-fs migration
  vhost-user-fs: Implement stateful migration

 include/hw/virtio/vhost-backend.h |   9 ++
 include/hw/virtio/vhost.h         |  68 ++++++++++++
 hw/virtio/vhost-user-fs.c         | 171 +++++++++++++++++++++++++++++-
 hw/virtio/vhost-user.c            | 138 ++++++++++++++++++++++++
 hw/virtio/vhost.c                 |  29 +++++
 5 files changed, 414 insertions(+), 1 deletion(-)

-- 
2.39.1


