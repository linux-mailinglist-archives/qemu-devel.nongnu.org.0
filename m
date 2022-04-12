Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F2A4FDF5F
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 14:22:22 +0200 (CEST)
Received: from localhost ([::1]:54576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neFXJ-00049A-BE
	for lists+qemu-devel@lfdr.de; Tue, 12 Apr 2022 08:22:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1neFP3-0004yp-7w
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 08:13:53 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:41709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1neFP1-0001Nn-ON
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 08:13:48 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 o20-20020a05600c511400b0038ebbbb2ad8so1509754wms.0
 for <qemu-devel@nongnu.org>; Tue, 12 Apr 2022 05:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZpbfXhhFu37+qhfFpaMUS+AAe9dGLE6sTDUGZufIQeE=;
 b=VVSn0aDM9WfAPWM0GAm6wG6qNcl7BX3yb6QekoLePaEcJQDz5T+i/7G8V4iSjYArrV
 +yuZUN+uTtB+0Y7tAmNzA5iJUdc4trFD6oGrgPdnAb9/ewd5l7QiCrQgobFu4w/oUPtT
 Okmoa5CsBkMDEDUYWu6RinR4WCbYcsV6eXzmfNPe6whvfxDehrYnoeLcY/ZRhIQEFOjE
 Xf3PoSDwPVKFav0ihF5/A8fLhs10evRcT7Mh2hcaolm5Rd32TWZsg7k74bDMDuwTM61C
 ZfykLu3q2VxX+sBh+lRNpAZv27tAzeaRwnIzoqwtXJinIn1daZ6eukVe6v0R2Zk9K3Z9
 3Qsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ZpbfXhhFu37+qhfFpaMUS+AAe9dGLE6sTDUGZufIQeE=;
 b=gS4ByxFoj908KyD/ADSYifxvGGRx7sEQSV/vqibvIDbpf6sqfiqR1khcLFlDmDFrGD
 lYpRmsMJ+gtx4ARayCw5NXMrdwLHrYQISlvzA4YAg1liwv+oskp0/MfBg/elmUVSfKZo
 czodbgu1A6PA1eD5qvEQXoSznygWDwfCao6W60BAfREiefBDaN9A6O1XGTgKENjWdSdW
 WtYDTHtY9AqNSxtgX/B59vKEIuNCstMUgYDA020Yzy2ms4+apjNXnDpCBpFeBMHcLWJJ
 olalmhhvj44Wtwaom6PtKeQcypaHgjrCrf4rEt5NWqssuck+HpQYhNLy1U4G4HM6bSi5
 eJBQ==
X-Gm-Message-State: AOAM531p99PVQrRXeuxwSfKXyc4HhgH3g5lTGWx5Lf5lKkDpzJYVb9o8
 2btOI7BBPx/Pij5TGSbut6tqcuNtZ8EJpA==
X-Google-Smtp-Source: ABdhPJzHwrHzCYj+o4vQb3+wTOpM8OX8mHLfOF5NH2ehm2n3NVLgDaBwehjb/wlccG4wx+siNT7GTA==
X-Received: by 2002:a1c:3587:0:b0:381:50ff:cbd with SMTP id
 c129-20020a1c3587000000b0038150ff0cbdmr3859899wma.140.1649765626470; 
 Tue, 12 Apr 2022 05:13:46 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 m18-20020a05600c4f5200b0038e8f9d7b57sm2355805wmq.42.2022.04.12.05.13.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 05:13:46 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 3/4] net: slirp: add support for CFI-friendly timer API
Date: Tue, 12 Apr 2022 14:13:36 +0200
Message-Id: <20220412121337.207203-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220412121337.207203-1-pbonzini@redhat.com>
References: <20220412121337.207203-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x332.google.com
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

libslirp 4.7 introduces a CFI-friendly version of the .timer_new callback.
The new callback replaces the function pointer with an enum; invoking the
callback is done with a new function slirp_handle_timer.

Support the new API so that CFI can be made compatible with using a system
libslirp.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 net/slirp.c | 41 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/net/slirp.c b/net/slirp.c
index b3a92d6e38..57af42299d 100644
--- a/net/slirp.c
+++ b/net/slirp.c
@@ -184,10 +184,43 @@ static int64_t net_slirp_clock_get_ns(void *opaque)
     return qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
 }
 
+typedef struct SlirpTimer SlirpTimer;
 struct SlirpTimer {
     QEMUTimer timer;
+#if SLIRP_CHECK_VERSION(4,7,0)
+    Slirp *slirp;
+    SlirpTimerId id;
+    void *cb_opaque;
+#endif
+};
+
+#if SLIRP_CHECK_VERSION(4,7,0)
+static void net_slirp_init_completed(Slirp *slirp, void *opaque)
+{
+    SlirpState *s = opaque;
+    s->slirp = slirp;
 }
 
+static void net_slirp_timer_cb(void *opaque)
+{
+    SlirpTimer *t = opaque;
+    slirp_handle_timer(t->slirp, t->id, t->cb_opaque);
+}
+
+static void *net_slirp_timer_new_opaque(SlirpTimerId id,
+                                        void *cb_opaque, void *opaque)
+{
+    SlirpState *s = opaque;
+    SlirpTimer *t = g_new(SlirpTimer, 1);
+    t->slirp = s->slirp;
+    t->id = id;
+    t->cb_opaque = cb_opaque;
+    timer_init_full(&t->timer, NULL, QEMU_CLOCK_VIRTUAL,
+                    SCALE_MS, QEMU_TIMER_ATTR_EXTERNAL,
+                    net_slirp_timer_cb, t);
+    return t;
+}
+#else
 static void *net_slirp_timer_new(SlirpTimerCb cb,
                                  void *cb_opaque, void *opaque)
 {
@@ -197,6 +230,7 @@ static void *net_slirp_timer_new(SlirpTimerCb cb,
                     cb, cb_opaque);
     return t;
 }
+#endif
 
 static void net_slirp_timer_free(void *timer, void *opaque)
 {
@@ -231,7 +265,12 @@ static const SlirpCb slirp_cb = {
     .send_packet = net_slirp_send_packet,
     .guest_error = net_slirp_guest_error,
     .clock_get_ns = net_slirp_clock_get_ns,
+#if SLIRP_CHECK_VERSION(4,7,0)
+    .init_completed = net_slirp_init_completed,
+    .timer_new_opaque = net_slirp_timer_new_opaque,
+#else
     .timer_new = net_slirp_timer_new,
+#endif
     .timer_free = net_slirp_timer_free,
     .timer_mod = net_slirp_timer_mod,
     .register_poll_fd = net_slirp_register_poll_fd,
@@ -578,7 +617,7 @@ static int net_slirp_init(NetClientState *peer, const char *model,
 
     s = DO_UPCAST(SlirpState, nc, nc);
 
-    cfg.version = 3;
+    cfg.version = SLIRP_CHECK_VERSION(4,7,0) ? 4 : 3;
     cfg.restricted = restricted;
     cfg.in_enabled = ipv4;
     cfg.vnetwork = net;
-- 
2.35.1



