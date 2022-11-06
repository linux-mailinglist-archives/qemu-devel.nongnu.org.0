Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD7261E110
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Nov 2022 09:52:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orbNH-0007K6-0R; Sun, 06 Nov 2022 03:51:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1orbNF-0007Jo-UX
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 03:51:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1orbNE-0002rB-Ia
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 03:51:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667724684;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+oyJxpuLuqZ4liCFOZlOpkC50vwpQN/UPvm6WAt0jWg=;
 b=WXya5zGQdrg3+5jmHZa/0I5gyKIJp2mxYlvfr95zvhEVxSHiQumv6l9dpMKo1nM74B1+w+
 gbA8uO7GRhErdVz3hThAlsu2vrug82puOe8CGTlVe8urfcDtVFoU/kDyrX4IabulN5QWbi
 j+6VleQCxomlltguJZE/rUd9/zjG8f8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-547-m7Kk9yeqOCmr6HWXOzPNKg-1; Sun, 06 Nov 2022 03:51:22 -0500
X-MC-Unique: m7Kk9yeqOCmr6HWXOzPNKg-1
Received: by mail-wm1-f69.google.com with SMTP id
 bi19-20020a05600c3d9300b003cf9d6c4016so2149996wmb.8
 for <qemu-devel@nongnu.org>; Sun, 06 Nov 2022 01:51:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+oyJxpuLuqZ4liCFOZlOpkC50vwpQN/UPvm6WAt0jWg=;
 b=hJyVD+kBd8bvKIOwm45SczMBnw3H0r7QXmU+EqQWzeAupr24EeBlb+0jWOZlVOLv0Y
 78qPnrD5QDeFmbiUawZ278MDdfbbUIDeIUyltbd9iDSh0j0a1uBHGhjcED8Ob7McV17O
 re0vjRT3Z/8WH1NxSA3at6FNzuUeVB7V4Uu+ot2ZhjJqNH/4pDtHpA1PeaU65C7r2C4s
 6jjm77gcTxR7Xt6TkRGYKVVtINLHtu+3uIW8hCtxpwWm/B536KoMSrM8qspo5llPSqyS
 /uvMqPzAa2lUEPtKXyaGJi2X8qSwkWsHR5bzMUoC28gRZ+lMhdnr5gNzQSb8MW6hXDZG
 44Zw==
X-Gm-Message-State: ACrzQf3Ia/6/f+SPG/r9r6qx2QspClhiooZVSs5lXX7kfJaz1XO/j/kz
 42cmjbbrJIrCSl9CX9OMdvvg/W8Vz6kway2LeSVY/oIBR64a88T4KuXBWomXKuyzggexAmB5PNN
 uFthZfcM4IlZPh/TBAiu8QfmNRwsghrS+Bs2V9M5+FDVbHDiQGZkjnZGzI29KoXeu1II=
X-Received: by 2002:a05:600c:1e89:b0:3c7:1e:acc2 with SMTP id
 be9-20020a05600c1e8900b003c7001eacc2mr29132928wmb.44.1667724680893; 
 Sun, 06 Nov 2022 01:51:20 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM59dFOHavv7C9L4UJJL5FlEiLrRb1YRsEzaKDkHgoogvV9Ov0P2184pi7zunGDRZqd3YB2rrw==
X-Received: by 2002:a05:600c:1e89:b0:3c7:1e:acc2 with SMTP id
 be9-20020a05600c1e8900b003c7001eacc2mr29132913wmb.44.1667724680613; 
 Sun, 06 Nov 2022 01:51:20 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 l22-20020a05600c089600b003c6bbe910fdsm9431144wmp.9.2022.11.06.01.51.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Nov 2022 01:51:20 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PULL 01/12] util/main-loop: Fix maximum number of wait objects for
 win32
Date: Sun,  6 Nov 2022 09:51:04 +0100
Message-Id: <20221106085115.257018-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221106085115.257018-1-pbonzini@redhat.com>
References: <20221106085115.257018-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Bin Meng <bin.meng@windriver.com>

The maximum number of wait objects for win32 should be
MAXIMUM_WAIT_OBJECTS, not MAXIMUM_WAIT_OBJECTS + 1.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Message-Id: <20221019102015.2441622-1-bmeng.cn@gmail.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/main-loop.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/util/main-loop.c b/util/main-loop.c
index f00a25451bdc..de38876064e4 100644
--- a/util/main-loop.c
+++ b/util/main-loop.c
@@ -363,10 +363,10 @@ void qemu_del_polling_cb(PollingFunc *func, void *opaque)
 /* Wait objects support */
 typedef struct WaitObjects {
     int num;
-    int revents[MAXIMUM_WAIT_OBJECTS + 1];
-    HANDLE events[MAXIMUM_WAIT_OBJECTS + 1];
-    WaitObjectFunc *func[MAXIMUM_WAIT_OBJECTS + 1];
-    void *opaque[MAXIMUM_WAIT_OBJECTS + 1];
+    int revents[MAXIMUM_WAIT_OBJECTS];
+    HANDLE events[MAXIMUM_WAIT_OBJECTS];
+    WaitObjectFunc *func[MAXIMUM_WAIT_OBJECTS];
+    void *opaque[MAXIMUM_WAIT_OBJECTS];
 } WaitObjects;
 
 static WaitObjects wait_objects = {0};
@@ -395,7 +395,7 @@ void qemu_del_wait_object(HANDLE handle, WaitObjectFunc *func, void *opaque)
         if (w->events[i] == handle) {
             found = 1;
         }
-        if (found) {
+        if (found && i < (MAXIMUM_WAIT_OBJECTS - 1)) {
             w->events[i] = w->events[i + 1];
             w->func[i] = w->func[i + 1];
             w->opaque[i] = w->opaque[i + 1];
-- 
2.38.1


