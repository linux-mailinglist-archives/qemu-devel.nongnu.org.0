Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FCC61E112
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Nov 2022 09:52:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orbNO-0007L3-7y; Sun, 06 Nov 2022 03:51:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1orbNJ-0007KT-7T
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 03:51:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1orbNH-0002rV-EW
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 03:51:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667724686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kNNnPkAsfDd7VhzCb/DIEE3yafdNMonfMlCBxiGHmOg=;
 b=HqWtENkCQ9nxunIp7MEv0X36nCUlFTNquQy7Y2jD5PTHTTkq8tWmbPbzDZ2CRKpRa27VMg
 NGBMZ+ls3rEkdXnd+l7NhHy1vNpfnJe9uF+9DnfwFu0UFRnwFSrGMKvEmJ2o7lH/9+tiOG
 ix91Qe1NNnVBCPdFGbh9/Kgx6tnoflA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-444-x5gyduFlM0W5FMp_EEx9LQ-1; Sun, 06 Nov 2022 03:51:24 -0500
X-MC-Unique: x5gyduFlM0W5FMp_EEx9LQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 ay40-20020a05600c1e2800b003cf8aa16377so4511109wmb.7
 for <qemu-devel@nongnu.org>; Sun, 06 Nov 2022 01:51:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kNNnPkAsfDd7VhzCb/DIEE3yafdNMonfMlCBxiGHmOg=;
 b=b+aYwjmjuuEnvqUUPp0MNC2XOLepE4gs+fqrdAwvkCDb60bSsn5z8/1xQwpvrpi4Nr
 5H3QKA9qsx8BLLEw5dMOD663zqegR8C5qEbx+5+eqXHY8UJFiH8giVm1DrteX6nJ4sa2
 VnsdyUEqwuai9tOnFVzv/sjW7BRrrqfqU+/93NWXtwKXft6DRWRGzGuRaJUb7iio0/O0
 /UvXYWZDmSSE37zyXBUbwGqrXNOZvCSRF/67pTAC1k9kzX5dwwiI7V0nSCWp1G8JHChW
 VXE9a+EhbXhSUVpRO7akWYqEqIq9cZEsdCwAEHbmBCUrR+9dT6XQN6zQ5TJBVOqxbElP
 j99A==
X-Gm-Message-State: ACrzQf3no65MixI1JgYUL9vaKQEDFXas6epDq/TD/TYSBcoLC0+D+fJq
 LwgxVJkYKFLVBwu7ZaY9nAEY+/CZO3NdPip7hL3N6K1tEHPEFHvHt1Y324AJayp613BsNIYuix9
 1M3dpo0Z7eSiOQlWW6/4eJyZCSIo9ka3brMPJJGvhxS/x5gJ/nNh8raU0Zt/iCnqjhe0=
X-Received: by 2002:adf:e10f:0:b0:22a:43e8:969f with SMTP id
 t15-20020adfe10f000000b0022a43e8969fmr29183139wrz.292.1667724683443; 
 Sun, 06 Nov 2022 01:51:23 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4ZvDvcA7MJuyNCuFT8tcokUdU+I/U0X6qf4k0R0MHaRvcL4HOr9gGwqcQTReAVMEtg0dy8Hg==
X-Received: by 2002:adf:e10f:0:b0:22a:43e8:969f with SMTP id
 t15-20020adfe10f000000b0022a43e8969fmr29183122wrz.292.1667724683155; 
 Sun, 06 Nov 2022 01:51:23 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 c17-20020a05600c0a5100b003cfa81e2eb4sm1034900wmq.38.2022.11.06.01.51.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Nov 2022 01:51:22 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PULL 02/12] util/main-loop: Avoid adding the same HANDLE twice
Date: Sun,  6 Nov 2022 09:51:05 +0100
Message-Id: <20221106085115.257018-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221106085115.257018-1-pbonzini@redhat.com>
References: <20221106085115.257018-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Fix the logic in qemu_add_wait_object() to avoid adding the same
HANDLE twice, as the behavior is undefined when passing an array
that contains same HANDLEs to WaitForMultipleObjects() API.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Message-Id: <20221019102015.2441622-2-bmeng.cn@gmail.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qemu/main-loop.h |  2 ++
 util/main-loop.c         | 10 ++++++++++
 2 files changed, 12 insertions(+)

diff --git a/include/qemu/main-loop.h b/include/qemu/main-loop.h
index aac707d073a1..3c9a9a982def 100644
--- a/include/qemu/main-loop.h
+++ b/include/qemu/main-loop.h
@@ -157,6 +157,8 @@ typedef void WaitObjectFunc(void *opaque);
  * in the main loop's calls to WaitForMultipleObjects.  When the handle
  * is in a signaled state, QEMU will call @func.
  *
+ * If the same HANDLE is added twice, this function returns -1.
+ *
  * @handle: The Windows handle to be observed.
  * @func: A function to be called when @handle is in a signaled state.
  * @opaque: A pointer-size value that is passed to @func.
diff --git a/util/main-loop.c b/util/main-loop.c
index de38876064e4..10fa74c6e319 100644
--- a/util/main-loop.c
+++ b/util/main-loop.c
@@ -373,10 +373,20 @@ static WaitObjects wait_objects = {0};
 
 int qemu_add_wait_object(HANDLE handle, WaitObjectFunc *func, void *opaque)
 {
+    int i;
     WaitObjects *w = &wait_objects;
+
     if (w->num >= MAXIMUM_WAIT_OBJECTS) {
         return -1;
     }
+
+    for (i = 0; i < w->num; i++) {
+        /* check if the same handle is added twice */
+        if (w->events[i] == handle) {
+            return -1;
+        }
+    }
+
     w->events[w->num] = handle;
     w->func[w->num] = func;
     w->opaque[w->num] = opaque;
-- 
2.38.1


