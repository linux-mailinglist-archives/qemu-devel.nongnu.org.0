Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5022574F44
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 15:35:54 +0200 (CEST)
Received: from localhost ([::1]:55214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBz0T-0000uz-PR
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 09:35:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oByt6-0006U3-1b
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 09:28:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oByt2-00029Z-TA
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 09:28:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657805287;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=I0TnT2laFYn+WDNeLNfriY4/vINaSPU1AR6WfPxG0X4=;
 b=VNQzO8QKbhiJ++5DPtBxXLuuCE5uoGWppLiTat8xY26UQ/Knjm9oLHpR0sdgM73ORwzr8A
 j0Tnt25XR7X8BjIIz4FWlkAlzPeAV7lNrrirb060ub5r8+dd/pAcDOUz473SJADnqJMJ6P
 z1IfcoJAKBOmuTfvI7M1nzjepsUU1sg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-82-6r2_0cDhOUyKERP0IIdHYQ-1; Thu, 14 Jul 2022 09:28:04 -0400
X-MC-Unique: 6r2_0cDhOUyKERP0IIdHYQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A4B0D3C01D93;
 Thu, 14 Jul 2022 13:28:03 +0000 (UTC)
Received: from localhost (unknown [10.39.192.157])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1D7AF2026D64;
 Thu, 14 Jul 2022 13:28:02 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Denis V . Lunev" <den@openvz.org>,
 Kevin Wolf <kwolf@redhat.com>
Subject: [PATCH 0/2] block/parallels: Fix buffer-based write call
Date: Thu, 14 Jul 2022 15:27:59 +0200
Message-Id: <20220714132801.72464-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Hi,

While reviewing Stefan’s libblkio driver series, I’ve noticed that
block/parallels.c contains a call to bdrv_co_pwritev() that doesn’t pass
a QEMUIOVector object but a plain buffer instead.  That seems wrong and
also pretty dangerous, so change it to a bdrv_co_pwrite() call (as I
assume it should be), and add a regression test demonstrating the
problem.


Hanna Reitz (2):
  block/parallels: Fix buffer-based write call
  iotests/131: Add parallels regression test

 block/parallels.c          |  4 ++--
 tests/qemu-iotests/131     | 35 ++++++++++++++++++++++++++++++++++-
 tests/qemu-iotests/131.out | 13 +++++++++++++
 3 files changed, 49 insertions(+), 3 deletions(-)

-- 
2.35.3


