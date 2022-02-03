Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A1A4A862E
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 15:28:44 +0100 (CET)
Received: from localhost ([::1]:59586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFd6K-0000Ys-0h
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 09:28:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nFckE-0000UQ-VJ
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 09:05:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nFckA-00018w-Hi
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 09:05:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643897143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=wfsOMK2Oq+WxbyXgidtXMKRRUK50xvvwodLN4mGuZso=;
 b=KeZaMmsB0UB8mcvOlESxkGNskumIsmTnsw+gu1AVm8NfCXbGMST/pa7CTp4JyHJ4nco13G
 cZuUkazQo59xsZDtmggjZ98zadproqUyew9PTIwUAKa5lycoTbBTiCidq2tlNEFcUU5DIn
 gs/7tue3FvM4IAZ6LKhAnK5YSb3kqsA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-184-GCxKT0JHNPymX9Tx4FFxvA-1; Thu, 03 Feb 2022 09:05:42 -0500
X-MC-Unique: GCxKT0JHNPymX9Tx4FFxvA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74D3F10B746B;
 Thu,  3 Feb 2022 14:05:41 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.195.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 30A4A1086489;
 Thu,  3 Feb 2022 14:05:40 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 0/2] block: Fix crash in blockdev-reopen with iothreads
Date: Thu,  3 Feb 2022 15:05:32 +0100
Message-Id: <20220203140534.36522-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.086,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, hreitz@redhat.com, vsementsov@virtuozzo.com,
 qinwang@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kevin Wolf (2):
  block: Lock AioContext for drain_end in blockdev-reopen
  iotests: Test blockdev-reopen with iothreads and throttling

 blockdev.c                 | 11 ++++++++++-
 tests/qemu-iotests/245     | 36 +++++++++++++++++++++++++++++++++---
 tests/qemu-iotests/245.out |  4 ++--
 3 files changed, 45 insertions(+), 6 deletions(-)

-- 
2.31.1


