Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DED564A040B
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Jan 2022 00:04:07 +0100 (CET)
Received: from localhost ([::1]:38064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDaHl-0008JG-Pg
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 18:04:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nDaEP-0005CA-Jg
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 18:00:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nDaE3-0006A7-Ua
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 18:00:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643410813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Hn54uZiPJtM+aBVtUUL0UushxZu76ATVpakse+31g0k=;
 b=VMpfHsJn7ur7i0j7J6HwqndM1hOVx0zFZaZXifaZ95FrYaNsX7oqy2n7AED6fSBzWL/4pk
 cXUlqOkRjLNyhfrNNzKhjMXyw+XyoRMKH6TweVm3fHoN4olEroVCrPDXhah9PE1ygkLa5X
 uOux258jreJT6KZ0SPMOEtMA63s87fE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-516-mr-rXBV5N6mAvhoQsUUYdg-1; Fri, 28 Jan 2022 18:00:06 -0500
X-MC-Unique: mr-rXBV5N6mAvhoQsUUYdg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D693F18B9EC8
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 23:00:05 +0000 (UTC)
Received: from blue.redhat.com (unknown [10.22.32.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 74B4A108B4
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 23:00:05 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/4] NBD patches for 2022-01-28
Date: Fri, 28 Jan 2022 16:59:59 -0600
Message-Id: <20220128230003.1114719-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) DKIMWL_WL_HIGH=-0.167, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

The following changes since commit 7a1043cef91739ff4b59812d30f1ed2850d3d34e:

  Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' into staging (2022-01-28 14:04:01 +0000)

are available in the Git repository at:

  https://repo.or.cz/qemu/ericb.git tags/pull-nbd-2022-01-28

for you to fetch changes up to 6384dd534d742123d26c008d9794b20bc41359d5:

  iotests/block-status-cache: New test (2022-01-28 16:55:23 -0600)

----------------------------------------------------------------
nbd patches for 2022-01-28

- Hanna Reitz: regression fix for block status caching
- Philippe Mathieu-Daude: documentation formatting
- Nir Soffer: dead code removal

----------------------------------------------------------------
Hanna Reitz (2):
      block/io: Update BSC only if want_zero is true
      iotests/block-status-cache: New test

Nir Soffer (1):
      nbd/server.c: Remove unused field

Philippe Mathieu-Daude (1):
      qapi/block: Cosmetic change in BlockExportType schema

 qapi/block-export.json                          |   3 +-
 block/io.c                                      |   6 +-
 nbd/server.c                                    |   1 -
 tests/qemu-iotests/tests/block-status-cache     | 139 ++++++++++++++++++++++++
 tests/qemu-iotests/tests/block-status-cache.out |   5 +
 5 files changed, 151 insertions(+), 3 deletions(-)
 create mode 100755 tests/qemu-iotests/tests/block-status-cache
 create mode 100644 tests/qemu-iotests/tests/block-status-cache.out

-- 
2.34.1


