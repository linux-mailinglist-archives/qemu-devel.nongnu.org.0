Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5946ED3FA
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 19:56:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pr0PR-0007yV-Bu; Mon, 24 Apr 2023 13:55:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pr0PP-0007yE-BW
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 13:55:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pr0PN-0007st-Rp
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 13:55:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682358925;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=AzbXbzgu7iK63fIEMUlwFTS+GVUEtIB4uhpIOKGqqsY=;
 b=LToBLLJ+OeYcdzN3vm5rTdub5eOG/Axwzno4FFYjlSoOv8V0+k9LPXYwf+7VGx2uXVTSBw
 CQ9qvvtXtJohU9uyOYghErVDSlHcKR1QTvxY4K1CCYwavMWsL6vbS6FBKE1aB54lHeN2wJ
 YXYIPavBBZAi4QmsV55RNp3lAUgfB7k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-453-UMnYFDxFMPmxFoE2SFebrg-1; Mon, 24 Apr 2023 13:55:21 -0400
X-MC-Unique: UMnYFDxFMPmxFoE2SFebrg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 08BA6885621;
 Mon, 24 Apr 2023 17:55:21 +0000 (UTC)
Received: from localhost (unknown [10.39.195.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6989840C6E67;
 Mon, 24 Apr 2023 17:55:20 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Subject: [PULL 0/2] Block patches
Date: Mon, 24 Apr 2023 13:55:16 -0400
Message-Id: <20230424175518.325931-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The following changes since commit ac5f7bf8e208cd7893dbb1a9520559e569a4677c:

  Merge tag 'migration-20230424-pull-request' of https://gitlab.com/juan.quintela/qemu into staging (2023-04-24 15:00:39 +0100)

are available in the Git repository at:

  https://gitlab.com/stefanha/qemu.git tags/block-pull-request

for you to fetch changes up to 9d672e290475001fcecdcc9dc79ad088ff89d17f:

  tracetool: use relative paths for '#line' preprocessor directives (2023-04-24 13:53:44 -0400)

----------------------------------------------------------------
Pull request (v2)

I dropped the zoned storage patches that had CI failures. This pull request
only contains fixes now.

----------------------------------------------------------------

Philippe Mathieu-Daudé (1):
  block/dmg: Declare a type definition for DMG uncompress function

Thomas De Schampheleire (1):
  tracetool: use relative paths for '#line' preprocessor directives

 block/dmg.h                         | 8 ++++----
 block/dmg.c                         | 7 ++-----
 scripts/tracetool/backend/ftrace.py | 4 +++-
 scripts/tracetool/backend/log.py    | 4 +++-
 scripts/tracetool/backend/syslog.py | 4 +++-
 5 files changed, 15 insertions(+), 12 deletions(-)

-- 
2.39.2


