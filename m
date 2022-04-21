Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87FC950A65A
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 18:57:14 +0200 (CEST)
Received: from localhost ([::1]:35550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nha7F-0003en-BM
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 12:57:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1nhZnv-0000LE-8H
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 12:37:17 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:40458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1nhZnt-0002P2-Q3
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 12:37:14 -0400
Received: by mail-pg1-x531.google.com with SMTP id h5so5099644pgc.7
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 09:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wJJ4ZohRCUqzki73KfclYR+6Bu1OubBsv7UphTN5DGk=;
 b=DDaJBbLbai51kg9V59WH1jIdrvH3Hja/ooLvhM/6xnTfrw/jEhGVcUg3TnSi0aO9Jb
 fbUEqmRkB3ztQo2n0xvF9DHIUTST1wkGsErurvf4jcIQyKBJb5z09J8nTM7QkTPkMTlx
 7jATOxN9gSd3W/KFowtwp/mPvgtG3PKQIsZK3u7MVah6/pibH9thiCNnE5M5ykd+ld8J
 1di6vGdCl4HgLuyr2X1EXoCXFI3FxW5OzjlbNENv5h72jsa/4GNFJf2XS4OVoMcxehhz
 gF8+seYBZZiImCM10mH+Hlv4VRnMOyb2rl9EsihUxsxcs1MmN2GZ4PJkGORZ82Eu+2O4
 SirQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wJJ4ZohRCUqzki73KfclYR+6Bu1OubBsv7UphTN5DGk=;
 b=0F9QvRL7Z6FxgHWUTiByKEMcVi/PK9exf8HIUuFM5Pf0zj0a76vzaFLnPBgd2sh97A
 CZIW75O4o5HyRrcDT6mP9BcuHj0+vVLVeRla4mc6/2WwwTLRGjHRri+QC8c5wwwYe5aH
 QdSOE5SlHtzFrantCCL66Jro6Up1PIDW9OZD+e6fhIgxGw6xPN3K3wDS6EnFpafR8H+e
 sunxKNfTHUhh26hrfaA8eyZKVXEwngzBneIf5QwO+XVX9gAb2RTat+dqGOhPsO9/S9Eb
 9BIFA67blbOt87UiATiQmo6pYEIkkJyvCLI2R6vbKBlR411mhd5O+7bvmyHK5z2boC6o
 RouQ==
X-Gm-Message-State: AOAM532OgqMpLHUy91Vwqy7yEDnkrKDnlqGSMAFSGrQ0cHgqOE6ZlfcM
 EFQ1HsFeue9tfQ1JgEaL1l6CBKUI+KQQyRlqvDmcyQ==
X-Google-Smtp-Source: ABdhPJyADLwJnzyXF9LJ/32m2ImS92xgTpL36AAwpHHLvzjrA2BMved8xrue0LuTNA78+CYS4JbcRA==
X-Received: by 2002:a05:6a00:1da2:b0:508:29cc:a894 with SMTP id
 z34-20020a056a001da200b0050829cca894mr465561pfw.43.1650559031882; 
 Thu, 21 Apr 2022 09:37:11 -0700 (PDT)
Received: from fedora.. ([119.4.252.222]) by smtp.gmail.com with ESMTPSA id
 n4-20020a637204000000b00398522203a2sm24051072pgc.80.2022.04.21.09.37.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 09:37:11 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v4] Use io_uring_register_ring_fd() to skip fd operations
Date: Fri, 22 Apr 2022 00:36:49 +0800
Message-Id: <20220421163648.4205-1-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=faithilikerun@gmail.com; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Damien Le Moal <Damien.LeMoal@wdc.com>,
 Dmitry Fomichev <Dmitry.Fomichev@wdc.com>,
 Stefan Hajnoczi <stefanha@gmail.com>, Sam Li <faithilikerun@gmail.com>,
 Hannes Reinecke <hare@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Linux recently added a new io_uring(7) optimization API that QEMU
doesn't take advantage of yet. The liburing library that QEMU uses
has added a corresponding new API calling io_uring_register_ring_fd().
When this API is called after creating the ring, the io_uring_submit()
library function passes a flag to the io_uring_enter(2) syscall
allowing it to skip the ring file descriptor fdget()/fdput()
operations. This saves some CPU cycles.

Signed-off-by: Sam Li <faithilikerun@gmail.com>
---
 block/io_uring.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/block/io_uring.c b/block/io_uring.c
index 782afdb433..5247fb79e2 100644
--- a/block/io_uring.c
+++ b/block/io_uring.c
@@ -435,8 +435,16 @@ LuringState *luring_init(Error **errp)
     }
 
     ioq_init(&s->io_q);
-    return s;
+    if (io_uring_register_ring_fd(&s->ring) < 0) {
+        /*
+         * Only warn about this error: we will fallback to the non-optimized
+         * io_uring operations.
+         */
+        error_reportf_err(*errp,
+                         "failed to register linux io_uring ring file descriptor");
+    }
 
+    return s;
 }
 
 void luring_cleanup(LuringState *s)
-- 
Use error_reportf_err to avoid memory leak due to not freeing error
object.
--
2.35.1


