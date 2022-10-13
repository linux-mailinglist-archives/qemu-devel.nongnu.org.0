Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 212325FE48B
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 23:52:46 +0200 (CEST)
Received: from localhost ([::1]:33186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj68D-0008JI-7T
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 17:52:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oj62i-0002SV-Ke
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 17:47:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oj62g-0005BD-62
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 17:47:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665697621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kEyemxO9xMYMhd66NPRMZhd75CaPXlPzvYN7a53fY5Y=;
 b=MomER4icUgIJZbLQUsMxD+iFF6QUnT46cFMVlFYuimKRhjedMMQGjvorGaHTV/ishSygpc
 /3Zh9jHo8xKN963YTeW9Y8dyQH6VetcIfJkmOTaO6c9/Fnl7ilKn9gveWav9YFsU+GvkEc
 FjpmTNsAYvG7Ql86LciLdEWgvTwN3lk=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-43-HEVpW308PyyQxMuG94rgJA-1; Thu, 13 Oct 2022 17:47:00 -0400
X-MC-Unique: HEVpW308PyyQxMuG94rgJA-1
Received: by mail-ed1-f72.google.com with SMTP id
 h13-20020a056402280d00b0045cb282161cso2331433ede.8
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 14:47:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kEyemxO9xMYMhd66NPRMZhd75CaPXlPzvYN7a53fY5Y=;
 b=YPjWEmO2hT8CW7g19YfcqwSPb/R43GOW98ULVtfuLppY0yA3T0nr7Gfx09hwxjua4G
 bYEHh2C71rXwhlzBDThUBOtuwOZHHEBMc2xwSLSfRzCbO+9UveHVPvQSdDIDM8tbzmjt
 EYJe1ifwJ8XSoRfF/EERZijhhFb2mCXUt9T6NAN4gX+GXY5oijPFxs+uF+RFRKO1pj6h
 Iyf+cWKrbBpBROeRIqMAjC/WASvmkUm0egoSVa/LgYrlpq0kUnztGEX4zrVF3H0/kmWE
 QtT/VhPCQ1M/fWKgF8gtU/MEm+u79X9KBGt2kF7UyrGaMw+5SHKkraKU6hBJA2bgTlAY
 E96Q==
X-Gm-Message-State: ACrzQf3o53pEAJ28+5NBfXvgS/Ice6Gk2wgwqwSra2XH7Caa4SZhdxcO
 odopmjMrS41SJ+oS0GupfGcP9GEB7CRLNE/Txr0cZuSE80QlEDKkb1yUqGfoMvgGEZaAFu/8zYs
 QO5C5WGTl1tjuX5YNvoSFp5S53IZRH/n7yhwH7RMho4/ZQdjKccd2nZqqMMrMulILl00=
X-Received: by 2002:a05:6402:27cd:b0:45c:db6f:7e77 with SMTP id
 c13-20020a05640227cd00b0045cdb6f7e77mr1575920ede.149.1665697618830; 
 Thu, 13 Oct 2022 14:46:58 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4z6D3tpvKuvm9BwS4TIGLlbpn13zOCte7MjkP8ZsuOcPcF6VYO9l5XkYlnZ5fewDEkKNeQZQ==
X-Received: by 2002:a05:6402:27cd:b0:45c:db6f:7e77 with SMTP id
 c13-20020a05640227cd00b0045cdb6f7e77mr1575906ede.149.1665697618540; 
 Thu, 13 Oct 2022 14:46:58 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 k17-20020aa7c391000000b00456cbd8c65bsm556218edq.6.2022.10.13.14.46.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 14:46:57 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: paul@nowt.org,
	richard.henderson@linaro.org
Subject: [PATCH 01/35] target/i386: Define XMMReg and access macros,
 align ZMM registers
Date: Thu, 13 Oct 2022 23:46:17 +0200
Message-Id: <20221013214651.672114-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221013214651.672114-1-pbonzini@redhat.com>
References: <20221013214651.672114-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

This will be used for emission and endian adjustments of gvec operations.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220822223722.1697758-2-richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.h | 56 ++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 43 insertions(+), 13 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 9327353fff..63bb500d07 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1233,18 +1233,34 @@ typedef struct SegmentCache {
     uint32_t flags;
 } SegmentCache;
 
-#define MMREG_UNION(n, bits)        \
-    union n {                       \
-        uint8_t  _b_##n[(bits)/8];  \
-        uint16_t _w_##n[(bits)/16]; \
-        uint32_t _l_##n[(bits)/32]; \
-        uint64_t _q_##n[(bits)/64]; \
-        float32  _s_##n[(bits)/32]; \
-        float64  _d_##n[(bits)/64]; \
-    }
+typedef union MMXReg {
+    uint8_t  _b_MMXReg[64 / 8];
+    uint16_t _w_MMXReg[64 / 16];
+    uint32_t _l_MMXReg[64 / 32];
+    uint64_t _q_MMXReg[64 / 64];
+    float32  _s_MMXReg[64 / 32];
+    float64  _d_MMXReg[64 / 64];
+} MMXReg;
 
-typedef MMREG_UNION(ZMMReg, 512) ZMMReg;
-typedef MMREG_UNION(MMXReg, 64)  MMXReg;
+typedef union XMMReg {
+    uint64_t _q_XMMReg[128 / 64];
+} XMMReg;
+
+typedef union YMMReg {
+    uint64_t _q_YMMReg[256 / 64];
+    XMMReg   _x_YMMReg[256 / 128];
+} YMMReg;
+
+typedef union ZMMReg {
+    uint8_t  _b_ZMMReg[512 / 8];
+    uint16_t _w_ZMMReg[512 / 16];
+    uint32_t _l_ZMMReg[512 / 32];
+    uint64_t _q_ZMMReg[512 / 64];
+    float32  _s_ZMMReg[512 / 32];
+    float64  _d_ZMMReg[512 / 64];
+    XMMReg   _x_ZMMReg[512 / 128];
+    YMMReg   _y_ZMMReg[512 / 256];
+} ZMMReg;
 
 typedef struct BNDReg {
     uint64_t lb;
@@ -1267,6 +1283,13 @@ typedef struct BNDCSReg {
 #define ZMM_S(n) _s_ZMMReg[15 - (n)]
 #define ZMM_Q(n) _q_ZMMReg[7 - (n)]
 #define ZMM_D(n) _d_ZMMReg[7 - (n)]
+#define ZMM_X(n) _x_ZMMReg[3 - (n)]
+#define ZMM_Y(n) _y_ZMMReg[1 - (n)]
+
+#define XMM_Q(n) _q_XMMReg[1 - (n)]
+
+#define YMM_Q(n) _q_YMMReg[3 - (n)]
+#define YMM_X(n) _x_YMMReg[1 - (n)]
 
 #define MMX_B(n) _b_MMXReg[7 - (n)]
 #define MMX_W(n) _w_MMXReg[3 - (n)]
@@ -1279,6 +1302,13 @@ typedef struct BNDCSReg {
 #define ZMM_S(n) _s_ZMMReg[n]
 #define ZMM_Q(n) _q_ZMMReg[n]
 #define ZMM_D(n) _d_ZMMReg[n]
+#define ZMM_X(n) _x_ZMMReg[n]
+#define ZMM_Y(n) _y_ZMMReg[n]
+
+#define XMM_Q(n) _q_XMMReg[n]
+
+#define YMM_Q(n) _q_YMMReg[n]
+#define YMM_X(n) _x_YMMReg[n]
 
 #define MMX_B(n) _b_MMXReg[n]
 #define MMX_W(n) _w_MMXReg[n]
@@ -1556,8 +1586,8 @@ typedef struct CPUArchState {
     float_status mmx_status; /* for 3DNow! float ops */
     float_status sse_status;
     uint32_t mxcsr;
-    ZMMReg xmm_regs[CPU_NB_REGS == 8 ? 8 : 32];
-    ZMMReg xmm_t0;
+    ZMMReg xmm_regs[CPU_NB_REGS == 8 ? 8 : 32] QEMU_ALIGNED(16);
+    ZMMReg xmm_t0 QEMU_ALIGNED(16);
     MMXReg mmx_t0;
 
     uint64_t opmask_regs[NB_OPMASK_REGS];
-- 
2.37.3


