Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 209B868F8DC
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 21:33:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPr7z-00086R-P5; Wed, 08 Feb 2023 15:33:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxime.coquelin@redhat.com>)
 id 1pPr7v-00084L-UB
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 15:33:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxime.coquelin@redhat.com>)
 id 1pPr7t-0005RP-3V
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 15:33:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675888387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=PfwLWYBfNc9sMCbOjaR26nmDunLrWsAH4OTxFwd8KlY=;
 b=dI3rt9zqiSqLQm3dxpAFUNjjFjaXC7oSuRQQc/9hGLyOJYdmahPaiwud3oFlviaArtmJLk
 UoILv/VDaBKetqPQWDwfpYo0B+jtd32kfhzIm+Vm82+PJy0feG/GiEhP1QX7J9EYzAEXa1
 KZRwuxxdjFM3LA0OMD+oNo2WMe2JqRo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-77-5NtLsuTfMnu4eyhicBPWYg-1; Wed, 08 Feb 2023 15:33:04 -0500
X-MC-Unique: 5NtLsuTfMnu4eyhicBPWYg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 14E602803611;
 Wed,  8 Feb 2023 20:33:04 +0000 (UTC)
Received: from max-t490s.redhat.com (unknown [10.39.208.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5C0F51121314;
 Wed,  8 Feb 2023 20:33:02 +0000 (UTC)
From: Maxime Coquelin <maxime.coquelin@redhat.com>
To: qemu-devel@nongnu.org, mst@redhat.com, pbonzini@redhat.com,
 stephen@networkplumber.org, chenbo.xia@intel.com, thomas@monjalon.net,
 dmarchan@redhat.com
Cc: Maxime Coquelin <maxime.coquelin@redhat.com>
Subject: [PATCH v2 0/3] Vhost-user: replace _SLAVE_ with _BACKEND_
Date: Wed,  8 Feb 2023 21:32:56 +0100
Message-Id: <20230208203259.381326-1-maxime.coquelin@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=maxime.coquelin@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

This series continues the work done to switch to a more
inclusive terminology in the Vhost-user specification.

While the spec texts were changed to replace slave with
backend, the protocol features and messages names hadn't
been changed. 

This series renames remaining occurences in the spec and
make use of the new names in both libvhost-user and the
Vhost-user frontend code.

Changes in v2:
==============
- Use positive wording (Michael)
- Fix grammar mistakes (Michael)

Maxime Coquelin (3):
  docs: vhost-user: replace _SLAVE_ with _BACKEND_
  libvhost-user: Adopt new backend naming
  vhost-user: Adopt new backend naming

 docs/interop/vhost-user.rst               | 40 +++++++++++------------
 hw/virtio/vhost-user.c                    | 30 ++++++++---------
 hw/virtio/virtio-qmp.c                    | 12 +++----
 subprojects/libvhost-user/libvhost-user.c | 20 ++++++------
 subprojects/libvhost-user/libvhost-user.h | 20 ++++++------
 5 files changed, 61 insertions(+), 61 deletions(-)

-- 
2.39.1


