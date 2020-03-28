Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 063D819662C
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Mar 2020 13:49:15 +0100 (CET)
Received: from localhost ([::1]:52896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jIAtm-0006yb-1w
	for lists+qemu-devel@lfdr.de; Sat, 28 Mar 2020 08:49:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52025)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dereksu@qnap.com>) id 1jIAsE-00066z-2K
 for qemu-devel@nongnu.org; Sat, 28 Mar 2020 08:47:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dereksu@qnap.com>) id 1jIAsC-00080u-4n
 for qemu-devel@nongnu.org; Sat, 28 Mar 2020 08:47:37 -0400
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042]:36696)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <dereksu@qnap.com>) id 1jIAsB-0007zK-To
 for qemu-devel@nongnu.org; Sat, 28 Mar 2020 08:47:36 -0400
Received: by mail-pj1-x1042.google.com with SMTP id nu11so4964145pjb.1
 for <qemu-devel@nongnu.org>; Sat, 28 Mar 2020 05:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qnap.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=f6sHN97Z5k0H0NePRruYOF0pxNWEQGvMVIWCmlh8Qaw=;
 b=V+PthXT5425UqxL3Iyb7u+MuFT/1qyDC4VEI7WAJkcUS5sCXa8WJMlQ+TckLaDZ9Gl
 8qpCz5L3y01bstdFWJVPcQtpHYTsjMCAvlOE+EWNAxmzMy/DflfT7WrfIVhRurLLuL+8
 GQ2FoSIQt452sOGcL9IKso5afMwHVWVAtiXmU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=f6sHN97Z5k0H0NePRruYOF0pxNWEQGvMVIWCmlh8Qaw=;
 b=XdhVw1qfwNBTe3ekkMAglhG9cjtoto6ig0I5eMkMLCOigVCfYohpzcLh7CJHgqGp1S
 360YZf84jKMimNLjkNRWuHF260fRCPEfLRdF+Q2PLxV269Noa+tp7R1kQ8lcixiVL+rq
 IwYWafcy/baS69ueON1Bcoc8em9VzZUfq/t7u0zJ3YhPsPfbddF4wdgjdSeXH6FVUvp7
 dcU25zy/7XEFhK1t5kijPieMIsCbVOGBEA7R8woQLT9bxG1O3z36ZYC+pUsubY2zhdHP
 PITdbXMucd4qyJlzK+mgXkn1Y2OdO5jdMQh7nmaVcXJAw/Qhm8hO1C5NW86hKlsdOHSs
 JHig==
X-Gm-Message-State: ANhLgQ3fNZQ2qB45xQTYEJ06qOPgww+rs4hcC4UpKyFD9Y/PC1SQalfr
 CMkEaRI1k8YGmh9ZC0XZ/mi6b/lriXE=
X-Google-Smtp-Source: ADFU+vvcAzMXVZg5KK5zNV297YuZai/Gy3pV0AwtLkAmtAG9rjvxCzE2rQaglmhvLkDVVzw7mVkU5A==
X-Received: by 2002:a17:90a:bb92:: with SMTP id
 v18mr4914763pjr.103.1585399653765; 
 Sat, 28 Mar 2020 05:47:33 -0700 (PDT)
Received: from localhost.localdomain (202-39-79-13.HINET-IP.hinet.net.
 [202.39.79.13])
 by smtp.gmail.com with ESMTPSA id k14sm10176468pje.3.2020.03.28.05.47.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Mar 2020 05:47:33 -0700 (PDT)
From: Derek Su <dereksu@qnap.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 1/2] net/colo-compare.c: Fix memory leak in packet_enqueue()
Date: Sat, 28 Mar 2020 20:46:45 +0800
Message-Id: <20200328124646.7778-2-dereksu@qnap.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200328124646.7778-1-dereksu@qnap.com>
References: <20200328124646.7778-1-dereksu@qnap.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1042
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
Cc: lizhijian@cn.fujitsu.com, chyang@qnap.com, Derek Su <dereksu@qnap.com>,
 jasowang@redhat.com, ctcheng@qnap.com, chen.zhang@intel.com,
 jwsu1986@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The patch is to fix the "pkt" memory leak in packet_enqueue().
The allocated "pkt" needs to be freed if the colo compare
primary or secondary queue is too big.

Signed-off-by: Derek Su <dereksu@qnap.com>
---
 net/colo-compare.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/net/colo-compare.c b/net/colo-compare.c
index 7ee17f2cf8..cdd87b2aa8 100644
--- a/net/colo-compare.c
+++ b/net/colo-compare.c
@@ -120,6 +120,10 @@ enum {
     SECONDARY_IN,
 };
 
+static const char *colo_mode[] = {
+    [PRIMARY_IN] = "primary",
+    [SECONDARY_IN] = "secondary",
+};
 
 static int compare_chr_send(CompareState *s,
                             const uint8_t *buf,
@@ -215,6 +219,7 @@ static int packet_enqueue(CompareState *s, int mode, Connection **con)
     ConnectionKey key;
     Packet *pkt = NULL;
     Connection *conn;
+    int ret;
 
     if (mode == PRIMARY_IN) {
         pkt = packet_new(s->pri_rs.buf,
@@ -243,16 +248,18 @@ static int packet_enqueue(CompareState *s, int mode, Connection **con)
     }
 
     if (mode == PRIMARY_IN) {
-        if (!colo_insert_packet(&conn->primary_list, pkt, &conn->pack)) {
-            error_report("colo compare primary queue size too big,"
-                         "drop packet");
-        }
+        ret = colo_insert_packet(&conn->primary_list, pkt, &conn->pack);
     } else {
-        if (!colo_insert_packet(&conn->secondary_list, pkt, &conn->sack)) {
-            error_report("colo compare secondary queue size too big,"
-                         "drop packet");
-        }
+        ret = colo_insert_packet(&conn->secondary_list, pkt, &conn->sack);
     }
+
+    if (!ret) {
+        error_report("colo compare %s queue size too big,"
+                     "drop packet", colo_mode[mode]);
+        packet_destroy(pkt, NULL);
+        pkt = NULL;
+    }
+
     *con = conn;
 
     return 0;
-- 
2.17.1


