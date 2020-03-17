Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4764188D1B
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Mar 2020 19:27:34 +0100 (CET)
Received: from localhost ([::1]:39156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jEGw9-0000TQ-Px
	for lists+qemu-devel@lfdr.de; Tue, 17 Mar 2020 14:27:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48832)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1jEGmx-0003TS-AQ
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 14:18:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berto@igalia.com>) id 1jEGmv-000097-5T
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 14:18:03 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:58015)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <berto@igalia.com>)
 id 1jEGmu-0005yG-4U; Tue, 17 Mar 2020 14:18:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=hxp55E9JUt56NLfwt7oK+Qjm0FNoUMZxhVIeDlCQuSw=; 
 b=ZxQ1KWUydvc5RQVXn4Iqu7OnVYcvAuhOC90senR0rMEDbNCs2d7iZJdYAr7TPXyC1nSDBgvkgVdkerh6/rodF/cRcmPACOySSroLqyHaK3PBE1QlDMSu7DZGj64h3XKFuo7k790SAEY9PzBB4KaVq5EX/Wbtnv7zOTgZqb6/Ma+ILnR3wttFX9S0ioObK1v2CPTAO/TSHk8KeOgMO6HN5x52B0G3lKdHFW7A9IK0xLvmoUeUUIN5HBT7bG6yyjn7IsnjxHd8fh8yG6Q2Qs0KcTzHJ21VFaSiY0UdLgrHaYYC1M/NTb+6LV68sgNfbIp1j2PKVBAmJwdvbXTP0PgNmA==;
Received: from [81.0.35.138] (helo=perseus.local)
 by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1jEGmD-00015Y-48; Tue, 17 Mar 2020 19:17:17 +0100
Received: from berto by perseus.local with local (Exim 4.92)
 (envelope-from <berto@igalia.com>)
 id 1jEGlw-0006Ot-U4; Tue, 17 Mar 2020 19:17:00 +0100
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 26/30] qcow2: Restrict qcow2_co_pwrite_zeroes() to full
 clusters only
Date: Tue, 17 Mar 2020 19:16:23 +0100
Message-Id: <1415552fc60acc658e3f80751d9ecd63da2b863d.1584468723.git.berto@igalia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1584468723.git.berto@igalia.com>
References: <cover.1584468723.git.berto@igalia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
 timestamps) [generic] [fuzzy]
X-Received-From: 178.60.130.6
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
Cc: Kevin Wolf <kwolf@redhat.com>, Anton Nefedov <anton.nefedov@virtuozzo.com>,
 Alberto Garcia <berto@igalia.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "Denis V . Lunev" <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ideally it should be possible to zero individual subclusters using
this function, but this is currently not implemented.

Signed-off-by: Alberto Garcia <berto@igalia.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block/qcow2.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/block/qcow2.c b/block/qcow2.c
index ad230ed1b1..d406ef355b 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -3743,7 +3743,9 @@ static coroutine_fn int qcow2_co_pwrite_zeroes(BlockDriverState *bs,
         bytes = s->cluster_size;
         nr = s->cluster_size;
         ret = qcow2_get_host_offset(bs, offset, &nr, &off, &type);
-        if (ret < 0 ||
+        /* TODO: allow zeroing separate subclusters, we only allow
+         * zeroing full clusters at the moment. */
+        if (ret < 0 || nr != bytes ||
             (type != QCOW2_SUBCLUSTER_UNALLOCATED_PLAIN &&
              type != QCOW2_SUBCLUSTER_UNALLOCATED_ALLOC &&
              type != QCOW2_SUBCLUSTER_ZERO_PLAIN &&
-- 
2.20.1


