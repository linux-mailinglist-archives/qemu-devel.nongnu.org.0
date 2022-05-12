Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1873D5241B1
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 02:52:05 +0200 (CEST)
Received: from localhost ([::1]:38108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nox3j-0006q2-N6
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 20:52:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nox1I-0005GK-VI
 for qemu-devel@nongnu.org; Wed, 11 May 2022 20:49:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nox1F-0006qW-7g
 for qemu-devel@nongnu.org; Wed, 11 May 2022 20:49:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652316567;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=L5ksbtsfXMan7nm486NNtnnfGkJwRsS4szh1Yyx+71E=;
 b=C2oslvFcwNsvScnksSJ+OWbL/5bJnCWW82ydEOmaT2zKwRq43FYha3sCIi+w3Zt0h5dL0C
 fy9yKRiYXq68+L53M3qO2jSEPSbZkKp7YbIMQZFahbEX4zT4BTImTZ2veCPNsWBfOjOpCA
 BpyJ/rPCVoQAup0shIcflZCmGBEqm/Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-303-sNNf2m4LN1C1FS07ml2mew-1; Wed, 11 May 2022 20:49:26 -0400
X-MC-Unique: sNNf2m4LN1C1FS07ml2mew-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AEAC880159B;
 Thu, 12 May 2022 00:49:25 +0000 (UTC)
Received: from blue.redhat.com (unknown [10.22.32.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1FC1A1121314;
 Thu, 12 May 2022 00:49:25 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: v.sementsov-og@mail.ru,
	kwolf@redhat.com,
	qemu-block@nongnu.org
Subject: [PATCH v4 0/2] nbd: MULTI_CONN for shared writable exports
Date: Wed, 11 May 2022 19:49:22 -0500
Message-Id: <20220512004924.417153-1-eblake@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v3 was here:
https://lists.gnu.org/archive/html/qemu-devel/2022-03/msg03701.html
with additional review here:
https://lists.gnu.org/archive/html/qemu-devel/2022-05/msg00166.html

Since then:
- patch 1 of v3 applied independently
- patch 3 simplified with beefed up commit message (now unconditional,
  because we have convinced ourselves that all shared clients go
  through a single block backend with no cache inconsistency) [kwolf]
- patch 3 rebase iotest addition to recent iotest improvements
- patch 3 s/7.0/7.1/ to match another slip in time

Eric Blake (2):
  qemu-nbd: Pass max connections to blockdev layer
  nbd/server: Allow MULTI_CONN for shared writable exports

 docs/interop/nbd.txt                          |   1 +
 docs/tools/qemu-nbd.rst                       |   3 +-
 qapi/block-export.json                        |   8 +-
 include/block/nbd.h                           |   5 +-
 blockdev-nbd.c                                |  13 +-
 nbd/server.c                                  |  10 +-
 qemu-nbd.c                                    |   2 +-
 MAINTAINERS                                   |   1 +
 tests/qemu-iotests/tests/nbd-multiconn        | 145 ++++++++++++++++++
 tests/qemu-iotests/tests/nbd-multiconn.out    |   5 +
 .../tests/nbd-qemu-allocation.out             |   2 +-
 11 files changed, 178 insertions(+), 17 deletions(-)
 create mode 100755 tests/qemu-iotests/tests/nbd-multiconn
 create mode 100644 tests/qemu-iotests/tests/nbd-multiconn.out

-- 
2.36.1


