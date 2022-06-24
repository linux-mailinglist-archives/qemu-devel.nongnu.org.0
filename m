Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9998555A381
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 23:32:43 +0200 (CEST)
Received: from localhost ([::1]:49404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4quw-00037o-7A
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 17:32:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o4qrt-0008S6-Tw; Fri, 24 Jun 2022 17:29:33 -0400
Received: from forwardcorp1p.mail.yandex.net ([77.88.29.217]:35502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o4qrs-0004Q8-1o; Fri, 24 Jun 2022 17:29:33 -0400
Received: from myt5-4c5921969858.qloud-c.yandex.net
 (myt5-4c5921969858.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:3b1a:0:640:4c59:2196])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 0C1202E2010;
 Sat, 25 Jun 2022 00:29:23 +0300 (MSK)
Received: from myt6-81d8ab6a9f9d.qloud-c.yandex.net
 (myt6-81d8ab6a9f9d.qloud-c.yandex.net [2a02:6b8:c12:520a:0:640:81d8:ab6a])
 by myt5-4c5921969858.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 SmxgV3AE9a-TMJS4PQn; Sat, 25 Jun 2022 00:29:22 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1656106162; bh=LQYMRtdCGQcUO9O6oDDrH7XxsGe5O2F7xLet6igGGcc=;
 h=Message-Id:References:Date:Subject:In-Reply-To:Cc:To:From;
 b=hblDEd07FtmzsgFvxLyfj9T0qOTJlUuyN3J1f8fwDgo5S7bJHC4XMltfNwDbUTd5e
 Bu15cdfTNYwdV3w9JVCh/D0JrkzD0zDK7rAIx+tgn1gOz/xZq41KyFvZvmhs5wrw8Y
 i3sjYPzHUwfoEbiztfuQmZcSI4FaWd3uXjMi61yg=
Authentication-Results: myt5-4c5921969858.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:b64c::1:2c])
 by myt6-81d8ab6a9f9d.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 KXs24KJ458-TMMSfUL9; Sat, 25 Jun 2022 00:29:22 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 vsementsov@yandex-team.ru, Ari Sundholm <ari@tuxera.com>
Subject: [PATCH v6 03/15] block/blklogwrites: don't care to remove bs->file
 child on failure
Date: Sat, 25 Jun 2022 00:28:18 +0300
Message-Id: <20220624212830.316919-4-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220624212830.316919-1-vsementsov@yandex-team.ru>
References: <20220624212830.316919-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=77.88.29.217;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1p.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

We don't need to remove bs->file, generic layer takes care of it. No
other driver cares to remove bs->file on failure by hand.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 block/blklogwrites.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/block/blklogwrites.c b/block/blklogwrites.c
index f66a617eb3..7d25df97cc 100644
--- a/block/blklogwrites.c
+++ b/block/blklogwrites.c
@@ -254,10 +254,6 @@ fail_log:
         s->log_file = NULL;
     }
 fail:
-    if (ret < 0) {
-        bdrv_unref_child(bs, bs->file);
-        bs->file = NULL;
-    }
     qemu_opts_del(opts);
     return ret;
 }
-- 
2.25.1


