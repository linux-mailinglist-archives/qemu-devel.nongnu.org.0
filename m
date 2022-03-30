Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 085EE4ECBE2
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 20:24:55 +0200 (CEST)
Received: from localhost ([::1]:50222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZd02-0005q6-4W
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 14:24:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nZcvK-0002V4-Rw
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 14:20:02 -0400
Received: from [2607:f8b0:4864:20::72e] (port=42815
 helo=mail-qk1-x72e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nZcvJ-0001eN-42
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 14:20:02 -0400
Received: by mail-qk1-x72e.google.com with SMTP id 85so17335475qkm.9
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 11:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C1v2q2eEODlLCRT1k+0udbjaZkFzUuZZRnNq/4TOfzM=;
 b=Jpnvde/5Nsp0O9Qv0bMDhzFiJqWAW6fOj+xpKrQSDjLFsMrw/nTS2PK4JgRLnQARWR
 8iRKNykzPtN0pU8ciYTAa8NzY2hSMG6+cBIvIrQzjsp0fGZNDiHDqdRytnvUtQd+af4+
 1Ke/AQ9UFTi6poa7FWZ1TcMlTMnIDPuhRC/tkao74YgWyc9dCZcml5/0QqXh2ORuJepk
 p4XAXKg3JmXHOX9JS2pYDOAmUGKpurgcVcf3B55Q6K1gDb5xmkYjfrvYwOVVdfd30KrW
 oh6rLaY+K6Pl7sMkPB4Psmijkee+ES2WmPKrXGUt02jPZCvbMr78YixjTmFuVXapKX4y
 +G+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C1v2q2eEODlLCRT1k+0udbjaZkFzUuZZRnNq/4TOfzM=;
 b=Xl+xNkjPjYL20ZooW73ZzT9IKcgR+2UPW/fqDTVyI06Ko6Gcox0j3oO/KWR8rxrOFy
 LD5LFWP4vmKhHknUw7pw1xHw/v/z7HmcseuneVjJS9pdcD06p1Dl14DO5JZ1ydRZS7Z8
 RGEKuQu3mcISVUGYBKdqyuV3l3Gft7FagBX2W7ArSaFbjTRTMBJci9wHfuR+tunGYWAR
 XYfvRAjSXftucn77b7qZBQcZlgVVU6gvV2ncO65FWWDgDuVvp4vMuc6wAJMJ4QJ43db0
 uBMh0SDX1M1SlsG3YVwvuFqjawzRI3wiWWg+FpMXl/EsyN3oiJBowHkXNpXzZmZpp5mp
 Z0yA==
X-Gm-Message-State: AOAM531FkLlhQYorIJiIUghg7mmTfs4mK0x+id/YvXrXMcNqEfz4ADIr
 ln+gc9PB3nUfUCi7WYxOvjO2S0znTXaHDQ==
X-Google-Smtp-Source: ABdhPJyW4uqxB2dNQj8TwrcGCCr1QY3BUZud4z63fhIY57+gHnMqKZpZlQZg/FsQpXdozFZWeFl8mg==
X-Received: by 2002:a05:620a:783:b0:67d:4c9d:d103 with SMTP id
 3-20020a05620a078300b0067d4c9dd103mr727172qka.250.1648664399131; 
 Wed, 30 Mar 2022 11:19:59 -0700 (PDT)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219]) by smtp.gmail.com with ESMTPSA id
 e15-20020a05622a110f00b002e1ed105652sm18600523qty.2.2022.03.30.11.19.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 11:19:58 -0700 (PDT)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] 9p: move limits.h include from 9p.c to 9p.h
Date: Wed, 30 Mar 2022 14:19:47 -0400
Message-Id: <20220330181947.68497-1-wwcohen@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::72e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::72e;
 envelope-from=wwcohen@gmail.com; helo=mail-qk1-x72e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: thuth@redhat.com, fabianfranz.oss@gmail.com,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 keno@juliacomputing.com, reactorcontrol@icloud.com,
 philippe.mathieu.daude@gmail.com, Will Cohen <wwcohen@gmail.com>, hi@alyssa.is
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As noted by https://gitlab.com/qemu-project/qemu/-/issues/950, within
the patch set adding 9p functionality to darwin, the commit
38d7fd68b0c8775b5253ab84367419621aa032e6 introduced an issue where
limits.h, which defines XATTR_SIZE_MAX, is included in 9p.c, though the
referenced constant is needed in 9p.h. This commit fixes that issue by
moving the include to 9p.h.

Signed-off-by: Will Cohen <wwcohen@gmail.com>
---
 hw/9pfs/9p.c | 5 -----
 hw/9pfs/9p.h | 5 +++++
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index dcaa602d4c..59c531ed47 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -33,11 +33,6 @@
 #include "migration/blocker.h"
 #include "qemu/xxhash.h"
 #include <math.h>
-#ifdef CONFIG_LINUX
-#include <linux/limits.h>
-#else
-#include <limits.h>
-#endif
 
 int open_fd_hw;
 int total_open_fd;
diff --git a/hw/9pfs/9p.h b/hw/9pfs/9p.h
index af2635fae9..0ce4da375c 100644
--- a/hw/9pfs/9p.h
+++ b/hw/9pfs/9p.h
@@ -9,6 +9,11 @@
 #include "qemu/thread.h"
 #include "qemu/coroutine.h"
 #include "qemu/qht.h"
+#ifdef CONFIG_LINUX
+#include <linux/limits.h>
+#else
+#include <limits.h>
+#endif
 
 enum {
     P9_TLERROR = 6,
-- 
2.35.1


