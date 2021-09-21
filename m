Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3218B413758
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 18:19:09 +0200 (CEST)
Received: from localhost ([::1]:35196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSiU7-0007t2-QE
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 12:19:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mSiS2-00065d-82
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 12:16:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43188)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mSiRz-0001Xx-Ch
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 12:16:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632241013;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=MzufzfoaVIjeJEWGeE1c3ShLd7bibxKDKALHfziOsi8=;
 b=EFYEDlS8ROWDEFEOCkx1liO47Bcpk54herafSfZJ0KVSnHiJDtmiCaeoqihQLPxToRVkKn
 1MBVRzt5iilXVVtTI8lVo6FbYqeLPlJz7CtT2qhKtiG9TwQs5mAMURTkjGd15XZZUWAhaV
 +JC8G6jnugUlapMpg1VVmsdA9crbWyI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-409-esnI9GTPNPqwtiHvacaTxQ-1; Tue, 21 Sep 2021 12:16:52 -0400
X-MC-Unique: esnI9GTPNPqwtiHvacaTxQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F1A601015DA4;
 Tue, 21 Sep 2021 16:16:49 +0000 (UTC)
Received: from steredhat.redhat.com (unknown [10.39.194.165])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 30C5F69FAE;
 Tue, 21 Sep 2021 16:16:42 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] vhost-vsock: fixes for seqpacket support
Date: Tue, 21 Sep 2021 18:16:40 +0200
Message-Id: <20210921161642.206461-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.475,
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Jiang Wang <jiang.wang@bytedance.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Arseny Krasnov <arseny.krasnov@kaspersky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series includes 2 patches: the first is similar of v1, but using
OnOffAuto property.
The second patch moves the `seqpacket` handling in the vhost-vsock-common
class to reuse the same code/properties also in vhost-user-vsock devices.

Perhaps the patches can be merged into a single one, but to simplify the
backport I left them separate.

v1: https://lore.kernel.org/qemu-devel/20210907124935.147164-1-sgarzare@redhat.com/

v2:
- used OnOffAuto `seqpacket` property instead of boolean `features` [stefanha]
- moved `seqpacket` property to vhost-vsock-common class

Stefano Garzarella (2):
  vhost-vsock: fix migration issue when seqpacket is supported
  vhost-vsock: handle common features in vhost-vsock-common

 include/hw/virtio/vhost-vsock-common.h |  5 +++++
 hw/core/machine.c                      |  5 ++++-
 hw/virtio/vhost-user-vsock.c           |  4 +++-
 hw/virtio/vhost-vsock-common.c         | 31 ++++++++++++++++++++++++++
 hw/virtio/vhost-vsock.c                | 11 +--------
 5 files changed, 44 insertions(+), 12 deletions(-)

-- 
2.31.1


