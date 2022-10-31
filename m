Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19EAD613DD0
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 19:54:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opZun-0001ry-0P; Mon, 31 Oct 2022 14:53:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1opZuK-0001If-4e
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 14:53:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1opZuH-0003mQ-LF
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 14:53:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667242387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=r9+buMRGNvtFp/2NAbiyTt/suuJ+9e1RXv+GFiW9+zk=;
 b=dGre/rGKROTh+M5nogrWiEbc9vjjKvCjcyuLm85HesUp+MnIDWiApb/+Q38/2jSwwjDc+L
 WhKem6jUi7ArvjLEpc4KH9dxO5ZyKqWRakzMqeZ0WIpyP6cINaQHzhahh6Fwt3zuqEjHdU
 XHs4po9I4L2bdhjuyx9doELKxZx9QMA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-HQ1oyvuAO3un45Clmtao7g-1; Mon, 31 Oct 2022 14:53:06 -0400
X-MC-Unique: HQ1oyvuAO3un45Clmtao7g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 435303800C24;
 Mon, 31 Oct 2022 18:53:01 +0000 (UTC)
Received: from localhost (unknown [10.39.192.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 321672166B29;
 Mon, 31 Oct 2022 18:52:59 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>
Subject: [PULL 0/3] Block patches
Date: Mon, 31 Oct 2022 14:51:03 -0400
Message-Id: <20221031185106.28245-1-stefanha@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

The following changes since commit 7208429223963c405c62fa2611398f1aa8033593:

  Merge tag 'mem-2022-10-28' of https://github.com/davidhildenbrand/qemu into staging (2022-10-30 18:31:59 -0400)

are available in the Git repository at:

  https://gitlab.com/stefanha/qemu.git tags/block-pull-request

for you to fetch changes up to 6c32fc0df9cd901add75618c831fb26a9eb742cb:

  block/blkio: Make driver nvme-io_uring take a "path" instead of a "filename" (2022-10-31 14:35:14 -0400)

----------------------------------------------------------------
Pull request

Note that we're still discussing "block/blkio: Make driver nvme-io_uring take a
"path" instead of a "filename"". I have sent the pull request now so everything
is ready for the soft freeze tomorrow if we decide to go ahead with the patch.

----------------------------------------------------------------

Alberto Faria (3):
  block/blkio: Add virtio-blk-vfio-pci BlockDriver
  block/blkio: Tolerate device size changes
  block/blkio: Make driver nvme-io_uring take a "path" instead of a
    "filename"

 qapi/block-core.json | 22 +++++++++++++++++++--
 block/blkio.c        | 47 ++++++++++++++++++++++++++++++++++++++++----
 2 files changed, 63 insertions(+), 6 deletions(-)

-- 
2.38.1


