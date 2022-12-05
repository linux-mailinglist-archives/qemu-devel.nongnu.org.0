Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A8A642821
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 13:11:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2AIx-0008IV-2B; Mon, 05 Dec 2022 07:10:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1p2AIv-0008I9-8p
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 07:10:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1p2AIt-0006XJ-KB
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 07:10:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670242233;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=0HoYAxQug2Ep+ttqRkNFici2jm2LD7sCZsy7igbxPDM=;
 b=IvWUJNJGaAIeqJ6uFSu6BjMba5+1SOHn6YDIS5227aDQoqHeO6vFBz47ZjNo0po1BRxWsg
 fHWIb0o+54iTwfyWdHLx+jw1Jnosv/Y320nIJB9FPIHfdiW/iISP/H6hFyvG21+NoPx2fB
 AcaxtyFn3j9W/TKevMIWh96t8xImEcg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-192-g8ugZpigMRCQc04r60fRNg-1; Mon, 05 Dec 2022 07:10:32 -0500
X-MC-Unique: g8ugZpigMRCQc04r60fRNg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6162E185A794;
 Mon,  5 Dec 2022 12:10:32 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 074D163F45;
 Mon,  5 Dec 2022 12:10:31 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH 0/2] Fixes to test-bdrv-drain unit test
Date: Mon,  5 Dec 2022 07:10:27 -0500
Message-Id: <20221205121029.1089209-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
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

This test performs graph modification while being in IO_CODE.
This is not allowed anymore.

This serie is taken from the forgotten (and partially invalid anymore) serie:
"[PATCH v2 00/10] block: bug fixes in preparation of AioContext removal"
(actually one could also use patch 9 and 10 from that serie, so if you're
interested take a look).
https://patchew.org/QEMU/20220314131854.2202651-1-eesposit@redhat.com/20220314131854.2202651-7-eesposit@redhat.com/

This serie substitutes Paolo's recent patch:
"[RFC PATCH] test-bdrv-drain: keep graph manipulations out of coroutines"

Thank you,
Emanuele

Emanuele Giuseppe Esposito (2):
  test-bdrv-drain.c: remove test_detach_by_parent_cb()
  tests/unit/test-bdrv-drain.c: graph setup functions can't run in
    coroutines

 tests/unit/test-bdrv-drain.c | 159 ++++++++++++++++++-----------------
 1 file changed, 82 insertions(+), 77 deletions(-)

-- 
2.31.1


