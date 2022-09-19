Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FD85BD4D2
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 20:36:44 +0200 (CEST)
Received: from localhost ([::1]:47162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaLdK-00078t-NI
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 14:36:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oaLV3-0007uU-3x; Mon, 19 Sep 2022 14:28:09 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:46678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oaLV1-0002xr-BK; Mon, 19 Sep 2022 14:28:08 -0400
Received: by mail-pg1-x52a.google.com with SMTP id 78so96271pgb.13;
 Mon, 19 Sep 2022 11:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date;
 bh=wbYwsLtCLmXFUkpGURvr6JRX1tlbcPpOA/wi4/BuoNk=;
 b=KOQzbxML4GbIMwcIfCej8DHUXXCUZljUG0aQasJhWC9gIDJjuDOYFG5Mf9ibA7NPjc
 2swQDytTLsye17iQ9I6OVNXGoA1/L8SB1viK5Ok0SGKGoilno/sG5ehMcyq5xJptHnFX
 IolFf3/xcDV+MYo7tukSwhUP5aLKdkG0wQJ5KU834kH8WBbbZ/pNSpnzs8i4ZGT4gbLu
 3VrX82H25zCn8wMTObGARK7lo6QnF3Ea3arXNlWuEmDM33mOT/9N8csFHVFJ6sUh8N07
 XLcVEEoXFEkQLRj7WF6tMcaW1CV16wyLJ8GXaS1iL1osn9IPEoM/2cO4MIe1J8pM6jfn
 GpOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date;
 bh=wbYwsLtCLmXFUkpGURvr6JRX1tlbcPpOA/wi4/BuoNk=;
 b=RCVWjpoxdD4ELI8e44bpblMHryxabUUw0TOF/dVSufLPeisZ7aP4zE4OkSMs35RMFL
 0hx+e92RQPP5uCQSvIyQg+/2VtN4tMPHchflCvP7McJprDIMfU+Qr1CGqnGn1/InnT6z
 5cX4nCtffZUX/wTH+e8yPqukxCy9lDpv/Mya6lI/2K6krNWqaabuhCVDBSEgBO7+dkf5
 RoUwa81DJ9T1ZqiN6duPfkpXMTgpysG91M89FpxOYKmlBE4iebjGzeW0GmZzn7N7OB4F
 qJGNDjNTaUV2y1+xRGtY7qBo0ngIcflztogJ1w7zaBngy5mnk1qGOTJW/9bHi/MU4fdq
 38GQ==
X-Gm-Message-State: ACrzQf3ldH92SQSRvi4RBl9ejbfnS/Hh2F7JSCCmCQtleIPXuKxjKvwd
 j7tLvMpitcvKK0YE9iksGvA7h/yz0ag=
X-Google-Smtp-Source: AMsMyM6V1Ur01ig4Muvm4UZR8N1RQqllYb31xrKrWoe63aX0TBwbV2OFSPHsV/XYjDtvzp4Uz+6rAw==
X-Received: by 2002:aa7:8c4e:0:b0:54e:fa98:5031 with SMTP id
 e14-20020aa78c4e000000b0054efa985031mr6124939pfd.44.1663612083440; 
 Mon, 19 Sep 2022 11:28:03 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 h7-20020aa796c7000000b0053f2505318asm21283078pfq.142.2022.09.19.11.27.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 19 Sep 2022 11:28:03 -0700 (PDT)
To: qemu-devel@nongnu.org
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org,
 John Snow <jsnow@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Max Reitz <mreitz@redhat.com>
Subject: [PATCH] block/qcow2-bitmap: Add missing cast to silent GCC error
Date: Mon, 19 Sep 2022 20:27:55 +0200
Message-Id: <20220919182755.51967-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

Commit d1258dd0c8 ("qcow2: autoloading dirty bitmaps") added the
set_readonly_helper() GFunc handler, correctly casting the gpointer
user_data in both the g_slist_foreach() caller and the handler.
Few commits later (commit 1b6b0562db), the handler is reused in
qcow2_reopen_bitmaps_rw() but missing the gpointer cast, resulting
in the following error when using Homebrew GCC 12.2.0:

  [2/658] Compiling C object libblock.fa.p/block_qcow2-bitmap.c.o
  ../../block/qcow2-bitmap.c: In function 'qcow2_reopen_bitmaps_rw':
  ../../block/qcow2-bitmap.c:1211:60: error: incompatible type for argument 3 of 'g_slist_foreach'
   1211 |     g_slist_foreach(ro_dirty_bitmaps, set_readonly_helper, false);
        |                                                            ^~~~~
        |                                                            |
        |                                                            _Bool
  In file included from /opt/homebrew/Cellar/glib/2.72.3_1/include/glib-2.0/glib/gmain.h:26,
                   from /opt/homebrew/Cellar/glib/2.72.3_1/include/glib-2.0/glib/giochannel.h:33,
                   from /opt/homebrew/Cellar/glib/2.72.3_1/include/glib-2.0/glib.h:54,
                   from /Users/philmd/source/qemu/include/glib-compat.h:32,
                   from /Users/philmd/source/qemu/include/qemu/osdep.h:144,
                   from ../../block/qcow2-bitmap.c:28:
  /opt/homebrew/Cellar/glib/2.72.3_1/include/glib-2.0/glib/gslist.h:127:61: note: expected 'gpointer' {aka 'void *'} but argument is of type '_Bool'
    127 |                                           gpointer          user_data);
        |                                           ~~~~~~~~~~~~~~~~~~^~~~~~~~~
  At top level:
  FAILED: libblock.fa.p/block_qcow2-bitmap.c.o

Fix by adding the missing gpointer cast.

Fixes: 1b6b0562db ("qcow2: support .bdrv_reopen_bitmaps_rw")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Cc: John Snow <jsnow@redhat.com>
Cc: Max Reitz <mreitz@redhat.com>
---
 block/qcow2-bitmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/qcow2-bitmap.c b/block/qcow2-bitmap.c
index ff3309846c..7197754843 100644
--- a/block/qcow2-bitmap.c
+++ b/block/qcow2-bitmap.c
@@ -1208,7 +1208,7 @@ int qcow2_reopen_bitmaps_rw(BlockDriverState *bs, Error **errp)
         }
     }
 
-    g_slist_foreach(ro_dirty_bitmaps, set_readonly_helper, false);
+    g_slist_foreach(ro_dirty_bitmaps, set_readonly_helper, (gpointer)false);
     ret = 0;
 
 out:
-- 
2.37.3


