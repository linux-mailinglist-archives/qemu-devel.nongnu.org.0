Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5FF4EEA97
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 11:38:56 +0200 (CEST)
Received: from localhost ([::1]:42774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naDk7-0003jR-7r
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 05:38:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1naDRa-0000IB-Cq
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 05:19:46 -0400
Received: from [2a00:1450:4864:20::22d] (port=42887
 helo=mail-lj1-x22d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1naDRW-0006tJ-9R
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 05:19:46 -0400
Received: by mail-lj1-x22d.google.com with SMTP id c15so3066387ljr.9
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 02:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mRK7WxLX+HR4rJNJEmFqrnmUVkOna7RNQuFOtOFhYr8=;
 b=tIZBwEAeJL7VYcTJjnEVZPJ6BVBOIUrDDRdTx6LkrgQhfxMiA6wcO+BSYez7EmDjRe
 2gId61gPMlLg0l59l9H6Lcf/XXe6OlSCg2PRMp7l2Ckm2F6BRtxfA6VN3Ew6G8VF9N2b
 8zdNJCmYX1lgwfjmE4HO9EmSe+pDYiaTAS/dtmXI+USdfwGL7o2N5pbt83mPucWlwp7i
 +k6PmQ6uE8ZQ6zQCLC5LCur39sVVJgGnKsPeRzUUEbh6lkKkMSyDPj83CqwgVSZiHoXj
 IIlOPTlQ6Q/dHNpSiv+mn+Q9VkxaxgTtWJNOhBxXLGFYvts1jRf5GtIs4dS4w0wc/Mvk
 gbLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mRK7WxLX+HR4rJNJEmFqrnmUVkOna7RNQuFOtOFhYr8=;
 b=PKk7uPBiXhi1DIPOOzFfOU+wtLrig4n8OCxAA6hDyrFZe0Tx2o2U5E7eTb9FcMpLah
 H6MypkG/VdifVcdD9w8kyVEAy9Nbzj4z8Z5k2KMnAlcjc6Yr5CDBBW2FJFJYzsyj6zVy
 jbEA7oZCOSazE3YIzsEZlFc2sqIYFxCRARDGL9jBQa2nAWsEnGb+plhB5qxpAITvSLyX
 /SO04jQyqbDoHMM9pAeST3APJW4rLlY5MnskXenk87vAGbm4T6TYEWFfNphNoqdoxkWA
 yo+IAk/65PxuhRm6eU4wY0Rh33nWhMrwQLYVB0ZKivtzm94QOk7fRYrV2WtpblxpV55y
 EwgA==
X-Gm-Message-State: AOAM533i/Zz3xmvWbQ6T49oJf6pZFsEoyfgBKVB+FZ0wAeoou4v4j9lk
 hqYt3EmFa8J6OOPq4APWPSb6Ng==
X-Google-Smtp-Source: ABdhPJxySh4ISsDwJlbva98Fu7uJ0Vp+WpCEv0MWq9sfrffpgTi8lBT5v4dHMjpslV6BJh60RPybNg==
X-Received: by 2002:a2e:1617:0:b0:24a:a6b4:40b2 with SMTP id
 w23-20020a2e1617000000b0024aa6b440b2mr12984731ljd.83.1648804777581; 
 Fri, 01 Apr 2022 02:19:37 -0700 (PDT)
Received: from fedora.. ([185.215.60.153]) by smtp.gmail.com with ESMTPSA id
 d16-20020a2eb050000000b002461d8f365bsm155135ljl.38.2022.04.01.02.19.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 02:19:37 -0700 (PDT)
From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
X-Google-Original-From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
To: qemu-block@nongnu.org
Subject: [PATCH v2 5/7] block/block-copy: block_copy(): add timeout_ns
 parameter
Date: Fri,  1 Apr 2022 12:19:18 +0300
Message-Id: <20220401091920.287612-6-vsementsov@openvz.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220401091920.287612-1-vsementsov@openvz.org>
References: <20220401091920.287612-1-vsementsov@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::22d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::22d;
 envelope-from=vladimir.sementsov-ogievskiy@openvz.org;
 helo=mail-lj1-x22d.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: kwolf@redhat.com, v.sementsov-og@mail.ru, jsnow@redhat.com,
 qemu-devel@nongnu.org, armbru@redhat.com, hreitz@redhat.com,
 vsementsov@openvz.org, stefanha@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add possibility to limit block_copy() call in time. To be used in the
next commit.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
---
 block/block-copy.c         | 26 +++++++++++++++++++-------
 block/copy-before-write.c  |  2 +-
 include/block/block-copy.h |  2 +-
 3 files changed, 21 insertions(+), 9 deletions(-)

diff --git a/block/block-copy.c b/block/block-copy.c
index ec46775ea5..b47cb188dd 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -883,10 +883,18 @@ static int coroutine_fn block_copy_common(BlockCopyCallState *call_state)
     return ret;
 }
 
+static void coroutine_fn block_copy_async_co_entry(void *opaque)
+{
+    block_copy_common(opaque);
+}
+
 int coroutine_fn block_copy(BlockCopyState *s, int64_t start, int64_t bytes,
-                            bool ignore_ratelimit)
+                            bool ignore_ratelimit, uint64_t timeout_ns)
 {
-    BlockCopyCallState call_state = {
+    int ret;
+    BlockCopyCallState *call_state = g_new(BlockCopyCallState, 1);
+
+    *call_state = (BlockCopyCallState) {
         .s = s,
         .offset = start,
         .bytes = bytes,
@@ -894,12 +902,16 @@ int coroutine_fn block_copy(BlockCopyState *s, int64_t start, int64_t bytes,
         .max_workers = BLOCK_COPY_MAX_WORKERS,
     };
 
-    return block_copy_common(&call_state);
-}
+    ret = qemu_co_timeout(block_copy_async_co_entry, call_state, timeout_ns,
+                          g_free);
+    if (ret < 0) {
+        /* Timeout. call_state will be freed by running coroutine. */
+        return ret;
+    }
 
-static void coroutine_fn block_copy_async_co_entry(void *opaque)
-{
-    block_copy_common(opaque);
+    ret = call_state->ret;
+
+    return ret;
 }
 
 BlockCopyCallState *block_copy_async(BlockCopyState *s,
diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 0614c3d08b..7ef3f9f4c1 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -107,7 +107,7 @@ static coroutine_fn int cbw_do_copy_before_write(BlockDriverState *bs,
     off = QEMU_ALIGN_DOWN(offset, cluster_size);
     end = QEMU_ALIGN_UP(offset + bytes, cluster_size);
 
-    ret = block_copy(s->bcs, off, end - off, true);
+    ret = block_copy(s->bcs, off, end - off, true, 0);
     if (ret < 0 && s->on_cbw_error == ON_CBW_ERROR_BREAK_GUEST_WRITE) {
         return ret;
     }
diff --git a/include/block/block-copy.h b/include/block/block-copy.h
index 68bbd344b2..1c9616cdee 100644
--- a/include/block/block-copy.h
+++ b/include/block/block-copy.h
@@ -40,7 +40,7 @@ int64_t block_copy_reset_unallocated(BlockCopyState *s,
                                      int64_t offset, int64_t *count);
 
 int coroutine_fn block_copy(BlockCopyState *s, int64_t offset, int64_t bytes,
-                            bool ignore_ratelimit);
+                            bool ignore_ratelimit, uint64_t timeout_ns);
 
 /*
  * Run block-copy in a coroutine, create corresponding BlockCopyCallState
-- 
2.35.1


