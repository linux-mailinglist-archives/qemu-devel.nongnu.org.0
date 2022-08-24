Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7A059F5CC
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 10:58:09 +0200 (CEST)
Received: from localhost ([::1]:60554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQmDA-0008Ru-3m
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 04:58:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQm86-0003ZV-Ii
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 04:53:01 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:42966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQm84-0002lv-QJ
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 04:52:54 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 s3-20020a17090a2f0300b001facfc6fdbcso854756pjd.1
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 01:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=PUYyT/q8xyjc7ipXsof4pbMbgPo7KiI7Ss2BgxrXup0=;
 b=dqlcpbHk9jNagMOTcyMB6ZW3X0bybSyJtZYCU6ai2rSB9IFmhQeoqPDwmiEP5Kf00p
 hnxwyUwgBS6XPU1cJ5j22jyU8z5upviKdwdKoE9Y8EG6P/Chtp0/QdtKyR5YgIHJRm7X
 awy2WJLKOAL+q67YNpkIsTt68FEraQsgHlrv5AkbEyjylP0BViq7P6qvNZaIIBaN2JwY
 tS0ODIbTCLl+DvKrLs0kzsavLjQIvZxALH5lQdrPtxTFFfRBiQjrbyKYpCcS4lJmQ2Li
 OSJbk0hfbE8PNcM/wLH24ATefnotVU/FkOYKLHtLcqtxXc9boe9LxFFv6dSXOyxIebvW
 J9Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=PUYyT/q8xyjc7ipXsof4pbMbgPo7KiI7Ss2BgxrXup0=;
 b=PNSRLXmPqoLFt9bpjITIjlW0/t2c/LrsQRE8hwhvOvx81OYokxuW7zslQqixy3NjKi
 RodSvVlJZO8fH1q4F6jzx11z30q8IGLhlfCD3NznSFKOnx/tVo9N+nRzpjab+V6rbkFp
 gjjDaXuwTzMm1CEaxphkPvga1qlPBCe93gQGDGy3C9x8ZRtEtoXmnfBOD6Q//IeOT1BH
 0ycpSBo1n96Dbx+b0e9deIfH6dUDJhBxC+OuDqRnaXIPMooGMPvvzZ2aU63eYdR/c3K3
 UNo5FQmMPA/ixwLlw5JTkH8nkOd3NPAVJwhg/FHlJqNpaW2wZJ2CaaV1Mb/XNgbVgfwl
 qGOg==
X-Gm-Message-State: ACgBeo13Cj9YEN6uFlcdyXmJTRaOmWou7YFIHl4a1w3Mg/IUwjqOz2yb
 R4W5dqTomr3DhNtC2juQq0+fejYJOpE=
X-Google-Smtp-Source: AA6agR4qH3ezhYxbeR6/ib+BQmpzpxuB2GHtWDDZlRAsitmQX4AX6TVUdym9FHGgX+aILZM+IPq7Ow==
X-Received: by 2002:a17:90b:4b89:b0:1f5:68b:b14e with SMTP id
 lr9-20020a17090b4b8900b001f5068bb14emr7510874pjb.30.1661331170995; 
 Wed, 24 Aug 2022 01:52:50 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 qi3-20020a17090b274300b001f3162e4e55sm813800pjb.35.2022.08.24.01.52.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 01:52:50 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>
Cc: Bin Meng <bin.meng@windriver.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v3 2/3] util/main-loop: Avoid adding the same HANDLE twice
Date: Wed, 24 Aug 2022 16:52:30 +0800
Message-Id: <20220824085231.1630804-2-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220824085231.1630804-1-bmeng.cn@gmail.com>
References: <20220824085231.1630804-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1035.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Fix the logic in qemu_add_wait_object() to avoid adding the same
HANDLE twice, as the behavior is undefined when passing an array
that contains same HANDLEs to WaitForMultipleObjects() API.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

Changes in v3:
- new patch: avoid adding the same HANDLE twice

 include/qemu/main-loop.h |  2 ++
 util/main-loop.c         | 10 ++++++++++
 2 files changed, 12 insertions(+)

diff --git a/include/qemu/main-loop.h b/include/qemu/main-loop.h
index c50d1b7e3a..db8d380550 100644
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
index cb018dc33c..dae33a8daf 100644
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
2.34.1


