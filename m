Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F355B504E31
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Apr 2022 11:07:54 +0200 (CEST)
Received: from localhost ([::1]:59410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngNMP-0003Xq-IZ
	for lists+qemu-devel@lfdr.de; Mon, 18 Apr 2022 05:07:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1ngNJx-0002cY-SU
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 05:05:26 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:53227)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1ngNJu-0002tV-G1
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 05:05:20 -0400
Received: by mail-pj1-x1031.google.com with SMTP id 2so12528658pjw.2
 for <qemu-devel@nongnu.org>; Mon, 18 Apr 2022 02:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dLsN6PiZxS665U21WnYzKoY1I6R6IUBqThGDNUEmUYU=;
 b=dgPasdnY61ksrkjLeOB5x5pj2bA4qnQe9vojVOt96xFVBH6isybUmHbLsXgb8wzvdj
 RJvtS3ngCOulpaTTez43Lw/X8sgn8Yb/ylAfebRfImrvP8mRNKWiaFhR7igbV3Ae3+kz
 mV9qRmVByaj3HlNI6sllrAoEo+swrTZetlyFpL93YHHU8vtMJxT1va6q+WghGlh08Eid
 pIEWZAqS+BmJe9NEzl4C/uSAAT9jyjEGkEq7UmRH9AZ75I81SMMrW2soiA21QZhJWxQ7
 yuUpoxBk9U4Wc5MOuwQJHVIHLcT5WlwdXm7xtY7SpLiVFq6MSNLiGGj/oiuToylKlmMn
 Ki6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dLsN6PiZxS665U21WnYzKoY1I6R6IUBqThGDNUEmUYU=;
 b=I8K9FqreDhzw+272Xj7BSFi1JPblW6F6SPLPQQWz9/jTomVRtptTZ/ZJEIO4O9x5dJ
 0GJYIiJFJNkJ/MWE92iN2CbobjAv6lux2b1GSrC12WFbjNdhwvNUbzIQSUJUtpWMY/W6
 GnDd87U1u4QImBeVhuzD0Y5XHZZLLULvRSeGd4XP/9YyJQ/qo2AKudKv4L4isXjVbUht
 WkoKhP6b4JRR71pLx2NL3hYM2srfnyxN3m8F6/G0coI1/4mFm2mrUFc5lhEctZhSiH0P
 2iLu1F5m5ywwvscksbk0WZ7eofWPIb2unh93QCXt7QMDomlawTDwYom3FgbaIZC5b+rn
 iK4A==
X-Gm-Message-State: AOAM530IyLUxLbBb/qK5OEckX7QnGU+gzXp0Tv7iSKpsMu59RB4BEisj
 WFIsV5z2ykRvSagBn54qTK6BZb2RMvhGOwiXhqI=
X-Google-Smtp-Source: ABdhPJxjvv8aljcPljXz89dnWibe10COt/StqlMSShvZWhdkqQSMP6aT7atj7jZbsddoK80uznZjvQ==
X-Received: by 2002:a17:90b:4c43:b0:1d2:aa8f:f687 with SMTP id
 np3-20020a17090b4c4300b001d2aa8ff687mr2245801pjb.230.1650272715914; 
 Mon, 18 Apr 2022 02:05:15 -0700 (PDT)
Received: from fedora.. ([101.206.166.4]) by smtp.gmail.com with ESMTPSA id
 j13-20020a056a00130d00b004f1025a4361sm12434644pfu.202.2022.04.18.02.05.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 02:05:15 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH 2/2] Use io_ring_register_ring_fd() to skip fd operations
Date: Mon, 18 Apr 2022 17:05:04 +0800
Message-Id: <20220418090504.50107-1-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=faithilikerun@gmail.com; helo=mail-pj1-x1031.google.com
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
Cc: Dmitry Fomichev <Dmitry.Fomichev@wdc.com>,
 Stefan Hajnoczi <stefanha@gmail.com>, Damien Le Moal <Damien.LeMoal@wdc.com>,
 Sam Li <faithilikerun@gmail.com>, Hannes Reinecke <hare@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

fix code style issue.

Signed-off-by: Sam Li <faithilikerun@gmail.com>
---
 block/io_uring.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/block/io_uring.c b/block/io_uring.c
index 2942967126..57745ecfa1 100644
--- a/block/io_uring.c
+++ b/block/io_uring.c
@@ -436,10 +436,15 @@ LuringState *luring_init(Error **errp)
 
     ioq_init(&s->io_q);
     if (io_uring_register_ring_fd(&s->ring) < 0) {
-        error_setg_errno(errp, errno, "failed to register linux io_uring ring file descriptor");
+        /*
+         * If the function fails, it will fallback to the non-optimized io_uring
+         * operations.
+         */
+        error_setg_errno(errp, errno,
+                         "failed to register linux io_uring ring file descriptor");
     }
-    return s;
 
+    return s;
 }
 
 void luring_cleanup(LuringState *s)
-- 
2.35.1


