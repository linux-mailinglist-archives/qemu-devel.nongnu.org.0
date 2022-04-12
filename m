Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 701964FDF57
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 14:19:42 +0200 (CEST)
Received: from localhost ([::1]:52700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neFUj-0002sj-AA
	for lists+qemu-devel@lfdr.de; Tue, 12 Apr 2022 08:19:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1neFP0-0004ua-OP
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 08:13:46 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:37665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1neFOz-0001ND-9D
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 08:13:46 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 h126-20020a1c2184000000b0038eb17fb7d6so1643932wmh.2
 for <qemu-devel@nongnu.org>; Tue, 12 Apr 2022 05:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R4ZvnlIoUjZtjWvuejYgl9KVhXxnZ5y5G5J4vXB5mhQ=;
 b=CFRvgWU9UkjVsh5IrvLkokMJUCEh5GySXizZ19ezm0Bp2dZKss1FBCzK5nWjFvWl8K
 KfhKEjg0fzFdmdA2zm65UvxsnseKhxLnCj8m80zQ/F51jwg9NsBJxhj71dvPh/eLxbpx
 8hWVwKRnvj7LEIF4dL5pcGHLxHokt7GVXU+cWAdn42JAlB6G3RYt7Pw9hk06PPo0mp4s
 7vXxoQ5t8T9WRnv0ylofH540UudUz886moTqpSDvlsOrs8u4gfIWvQdJVl/0f80hVWiU
 SHGPnsTWxo/T4OtXj7AH5v5kRnYrZmY/OsOfa3kE5AnMR2qR2yP3Jxyv7Xuc3XvlSi/0
 VRKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=R4ZvnlIoUjZtjWvuejYgl9KVhXxnZ5y5G5J4vXB5mhQ=;
 b=HZVHw71RN4hr7O5UL8qKq/QNoo7eHEseiwexrEecaGEbwP2U8X35JTeHSIfZRctRT9
 8/He+JY9ldWCgw2RSjHQyG+oek8csXWEMBF+1SiKad7GrBHVrCHp9PRKAGlo45kCgP6G
 OOq/dJlcdErsybBwAvhYkNrlhPiR1+fY6kwDXR88uhdolD179kZKNWv5aCaOHEZe5898
 CtkfOYg3fQajVw2p5aVkV5n8fU6ofapHjZtzNVGiJzxA/5hm3dYBSsOnuIvUK4BBBLso
 hs7RC5e1kDTJV+XV3yYX4aU8Ki/680TkZ1MdtukG4PSCay9FfqDLnfnYWWlxZBMgmZkN
 A0cw==
X-Gm-Message-State: AOAM531Q3RMEIYWaj5scNVIXeqcElF9HU0DMJYdGfC2R8qpTLiTBW9YU
 A9waFVHyt1ZmJ3JeDXGoSQbTNFOphRC4/g==
X-Google-Smtp-Source: ABdhPJykZxB/2X1x1TexGzGZ0YHZy4dBSEuvep3Al7GTIM7j+oWKvsid4LUmjZIFa64OP+QaPOFzng==
X-Received: by 2002:a05:600c:1c93:b0:38e:c558:10db with SMTP id
 k19-20020a05600c1c9300b0038ec55810dbmr3764410wms.121.1649765623864; 
 Tue, 12 Apr 2022 05:13:43 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 m18-20020a05600c4f5200b0038e8f9d7b57sm2355805wmq.42.2022.04.12.05.13.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 05:13:43 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 1/4] net: slirp: introduce a wrapper struct for QemuTimer
Date: Tue, 12 Apr 2022 14:13:34 +0200
Message-Id: <20220412121337.207203-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220412121337.207203-1-pbonzini@redhat.com>
References: <20220412121337.207203-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: samuel.thibault@ens-lyon.org, thuth@redhat.com, dbuono@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This struct will be extended in the next few patches to support the
new slirp_handle_timer() call.  For that we need to store an additional
"int" for each SLIRP timer, in addition to the cb_opaque.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 net/slirp.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/net/slirp.c b/net/slirp.c
index bc5e9e4f77..f1e25d741f 100644
--- a/net/slirp.c
+++ b/net/slirp.c
@@ -184,23 +184,32 @@ static int64_t net_slirp_clock_get_ns(void *opaque)
     return qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
 }
 
+struct SlirpTimer {
+    QEMUTimer timer;
+}
+
 static void *net_slirp_timer_new(SlirpTimerCb cb,
                                  void *cb_opaque, void *opaque)
 {
-    return timer_new_full(NULL, QEMU_CLOCK_VIRTUAL,
-                          SCALE_MS, QEMU_TIMER_ATTR_EXTERNAL,
-                          cb, cb_opaque);
+    SlirpTimer *t = g_new(SlirpTimer, 1);
+    timer_init_full(&t->timer, NULL, QEMU_CLOCK_VIRTUAL,
+                    SCALE_MS, QEMU_TIMER_ATTR_EXTERNAL,
+                    cb, cb_opaque);
+    return t;
 }
 
 static void net_slirp_timer_free(void *timer, void *opaque)
 {
-    timer_free(timer);
+    SlirpTimer *t = timer;
+    timer_del(&t->timer);
+    g_free(t);
 }
 
 static void net_slirp_timer_mod(void *timer, int64_t expire_timer,
                                 void *opaque)
 {
-    timer_mod(timer, expire_timer);
+    SlirpTimer *t = timer;
+    timer_mod(&t->timer, expire_timer);
 }
 
 static void net_slirp_register_poll_fd(int fd, void *opaque)
-- 
2.35.1



