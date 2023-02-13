Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54953693CA8
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 03:55:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pROwu-0002Bi-Uv; Sun, 12 Feb 2023 21:52:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pROwt-0002BT-7Y
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 21:52:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pROwr-0006tv-OI
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 21:52:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676256729;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cSap7rP2yuIXzjR89/H20UJYqGivlGaX/5tcXAgoyrk=;
 b=WwvN+kogdTNP2knGEvKPQVHGzPp1XXR5/OBrgZceM4NfEtopIZPSAIkO6taWS1wE8BQTp4
 05Ecny9QWmicnr+l62aTEasGFWacrZ8f0zH717h1l2Dk3o842+BerY8vyMZMfIhWKvaqjt
 QTQ6b7zpTEBp/JSbaK2I0MYXZNBvXkc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-458-45feDY1ZOGS2_cY1oF2blw-1; Sun, 12 Feb 2023 21:52:07 -0500
X-MC-Unique: 45feDY1ZOGS2_cY1oF2blw-1
Received: by mail-wm1-f71.google.com with SMTP id
 fl9-20020a05600c0b8900b003dfe4bae099so6075530wmb.0
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 18:52:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cSap7rP2yuIXzjR89/H20UJYqGivlGaX/5tcXAgoyrk=;
 b=UJESThRe1OJhBI/8l++Xz2PpLjWRqoE4Nj66wrBexyEO5adzgHMkGZAZg8ls1xoO4S
 MS1eJCAEsgxMDm+KSgZ4k+lPviZVouKfK8BAL0EwPP0u0NGThhhPyTsicZ/r+42JkHMh
 LzaklRNbRgvd8EJTOomHHQky2Gon8hL1pKk+7t6VGOCL67yzOaAfJEbKLrIq/FvMtOML
 eBXYTLMZjrossHbXQdiJHT8fQY9ZTuGIARgl7+h802RSi+7ln+IBYMbMSRDpDAkK2EbU
 kejE9jNj+QUMEv3H6kVofsm/dWN2aw+jhXLhDkfWj1YSnIye+ZBVIVVgVu/AzRhWUGvu
 ZPkA==
X-Gm-Message-State: AO0yUKUwHBOZUSmyFSOqNG2PcsWZNdsvDOxAQVgWiTI7sqSj/y4NqYI/
 iGibIsVqpx9vaoytWdMBvymOIOuBqfHw2534lK+hd597nV+Kzcg9pgUvn3HAAxoVT1PORu1xNlK
 22J9SjaYoy71FteqUqUa5ZPiKMriUAP8d4QqMkbCwMU0anpvGE9klEAIhOA44QDAfqLiJqPyf
X-Received: by 2002:a05:600c:601a:b0:3dc:42e7:f626 with SMTP id
 az26-20020a05600c601a00b003dc42e7f626mr17776286wmb.26.1676256726255; 
 Sun, 12 Feb 2023 18:52:06 -0800 (PST)
X-Google-Smtp-Source: AK7set++Nz7Kw+x589SL8UIfDxL0cbrEnisnDps7RxWyA0tA+XJNjZ542wFXvB0qp2bn7kIubCboBw==
X-Received: by 2002:a05:600c:601a:b0:3dc:42e7:f626 with SMTP id
 az26-20020a05600c601a00b003dc42e7f626mr17776270wmb.26.1676256726013; 
 Sun, 12 Feb 2023 18:52:06 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 b18-20020a05600c4e1200b003e00c453447sm15887254wmq.48.2023.02.12.18.52.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Feb 2023 18:52:05 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PULL 08/22] migration: Split ram_bytes_total_common() in two
 functions
Date: Mon, 13 Feb 2023 03:51:36 +0100
Message-Id: <20230213025150.71537-9-quintela@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230213025150.71537-1-quintela@redhat.com>
References: <20230213025150.71537-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

It is just a big if in the middle of the function, and we need two
functions anways.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Juan Quintela <quintela@redhat.com>

---

Reindent to make Phillipe happy (and CODING_STYLE)
---
 migration/ram.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index cf577fce5c..1727fe5ef6 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2601,28 +2601,30 @@ void acct_update_position(QEMUFile *f, size_t size, bool zero)
     }
 }
 
-static uint64_t ram_bytes_total_common(bool count_ignored)
+static uint64_t ram_bytes_total_with_ignored(void)
 {
     RAMBlock *block;
     uint64_t total = 0;
 
     RCU_READ_LOCK_GUARD();
 
-    if (count_ignored) {
-        RAMBLOCK_FOREACH_MIGRATABLE(block) {
-            total += block->used_length;
-        }
-    } else {
-        RAMBLOCK_FOREACH_NOT_IGNORED(block) {
-            total += block->used_length;
-        }
+    RAMBLOCK_FOREACH_MIGRATABLE(block) {
+        total += block->used_length;
     }
     return total;
 }
 
 uint64_t ram_bytes_total(void)
 {
-    return ram_bytes_total_common(false);
+    RAMBlock *block;
+    uint64_t total = 0;
+
+    RCU_READ_LOCK_GUARD();
+
+    RAMBLOCK_FOREACH_NOT_IGNORED(block) {
+        total += block->used_length;
+    }
+    return total;
 }
 
 static void xbzrle_load_setup(void)
@@ -3227,7 +3229,8 @@ static int ram_save_setup(QEMUFile *f, void *opaque)
     (*rsp)->pss[RAM_CHANNEL_PRECOPY].pss_channel = f;
 
     WITH_RCU_READ_LOCK_GUARD() {
-        qemu_put_be64(f, ram_bytes_total_common(true) | RAM_SAVE_FLAG_MEM_SIZE);
+        qemu_put_be64(f, ram_bytes_total_with_ignored()
+                         | RAM_SAVE_FLAG_MEM_SIZE);
 
         RAMBLOCK_FOREACH_MIGRATABLE(block) {
             qemu_put_byte(f, strlen(block->idstr));
-- 
2.39.1


