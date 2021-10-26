Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0210243B73B
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 18:32:02 +0200 (CEST)
Received: from localhost ([::1]:52410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfPMn-0001S3-2G
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 12:32:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mfPF5-0007Nr-IW
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 12:24:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mfPF3-00039Q-7C
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 12:24:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635265440;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=EjBjjQVr7KL1zsDJKefz8qMA2NcxkphUB8cXf94FlNc=;
 b=GyZ1T74klLFBIvO6XpqcrVz1BMgrdO63DsUrHG1U5o4JOSDWfajuAsXinUFG9q2+XcaL1L
 LpJRr0i+2/sizmSmbPS75fbB96q/P87brGrqfgNc3ZL6c4GXgbpYf4vHtR2QLnc24CPZX+
 B8SJi0TLMEApq4Kv9g4rnWDYedA1f5Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-522-FOZGfhcXO3G4macDl0zZOg-1; Tue, 26 Oct 2021 12:23:57 -0400
X-MC-Unique: FOZGfhcXO3G4macDl0zZOg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B4DB1397B03;
 Tue, 26 Oct 2021 16:23:56 +0000 (UTC)
Received: from steredhat.redhat.com (unknown [10.39.194.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5062B19811;
 Tue, 26 Oct 2021 16:23:47 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/3] linux-aio: allow block devices to limit aio-max-batch
Date: Tue, 26 Oct 2021 18:23:43 +0200
Message-Id: <20211026162346.253081-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v1: https://lore.kernel.org/qemu-devel/20210923143100.182979-1-sgarzare@redhat.com
v2:
- @aio-max-batch documentation rewrite [Stefan, Kevin]
- added Stefan and Kevin R-b tags

Commit d7ddd0a161 ("linux-aio: limit the batch size using
`aio-max-batch` parameter") added a way to limit the batch size
of Linux AIO backend for the entire AIO context.

The same AIO context can be shared by multiple devices, so
latency-sensitive devices may want to limit the batch size even
more to avoid increasing latency.

This series add the `aio-max-batch` option to the file backend,
and use it in laio_co_submit() and laio_io_unplug() to limit the
Linux AIO batch size more than the limit set by the AIO context.

Stefano Garzarella (3):
  file-posix: add `aio-max-batch` option
  linux-aio: add `dev_max_batch` parameter to laio_co_submit()
  linux-aio: add `dev_max_batch` parameter to laio_io_unplug()

 qapi/block-core.json    |  7 +++++++
 include/block/raw-aio.h |  6 ++++--
 block/file-posix.c      | 14 ++++++++++++--
 block/linux-aio.c       | 38 +++++++++++++++++++++++++++-----------
 4 files changed, 50 insertions(+), 15 deletions(-)

-- 
2.31.1


