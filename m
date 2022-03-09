Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2B24D399A
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 20:12:00 +0100 (CET)
Received: from localhost ([::1]:49230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nS1j5-0007UP-AH
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 14:11:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <51e7f12fad3f36ce166e2f6e415784b13c4df5c4@lizzy.crudebyte.com>)
 id 1nS1hw-0006fA-Tx
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 14:10:49 -0500
Received: from lizzy.crudebyte.com ([91.194.90.13]:53873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <51e7f12fad3f36ce166e2f6e415784b13c4df5c4@lizzy.crudebyte.com>)
 id 1nS1hv-0004GZ-Dq
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 14:10:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Content-ID:
 Content-Description; bh=PzZjm0V43CI2P9SZOhq5QHw2/Pd3QX290y9wEK0E28g=; b=eLkG3
 cFfw18lzQs1IT9lU+RLGRfxtw+sf9OTMauFFF2i0G7O/mqjWazTU3mIM+f8DxPc7rZeGBeJIFE/td
 xar0SfKp7zG6ZrPGKGlhhsy/epoV4udOKzWRa4xEhmevWruNPumLpE+wUtrg2Me/fkmAgEq1+Ef4z
 T0D6UttcQfNf4TsB9bwc7K4AYwwX7fI+opeKYPcER70UkaJZTKNe5Mhr7mL0QcAQK4Se7uYyGfBRl
 TZ7VzNax+7MS+l8X/1mp0QngSbDvVLOob8zNeTEI8H3T2K1U39r4c11m3AAXLF+XPPkGlAN4Doj69
 mudKiRBvhuHtesXHLoRb4Rs5sh0rA==;
Message-Id: <cover.1646850707.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Wed, 9 Mar 2022 19:31:47 +0100
Subject: [PATCH 0/6] 9pfs: fix 'Twalk' protocol violation
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=51e7f12fad3f36ce166e2f6e415784b13c4df5c4@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Currently the implementation of 'Twalk' does not behave exactly as specified
by the 9p2000 protocol specification. Actual fix is patch 5; see the
description of that patch for details of what this overall fix and series is
about.

Patch 4 is a preparatory (pure) refactoring change to make patch 5 better
readable.

All the other patches are just additional test cases for guarding 'Twalk'
behaviour.

Christian Schoenebeck (6):
  tests/9pfs: walk to non-existent dir
  tests/9pfs: Twalk with nwname=0
  tests/9pfs: compare QIDs in fs_walk_none() test
  9pfs: refactor 'name_idx' -> 'nvalid' in v9fs_walk()
  9pfs: fix 'Twalk' to only send error if no component walked
  tests/9pfs: guard recent 'Twalk' behaviour fix

 hw/9pfs/9p.c                 |  43 ++++++----
 tests/qtest/virtio-9p-test.c | 162 ++++++++++++++++++++++++++++++++++-
 2 files changed, 188 insertions(+), 17 deletions(-)

-- 
2.30.2


