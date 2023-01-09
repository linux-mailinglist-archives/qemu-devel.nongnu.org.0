Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C45C662AF9
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 17:17:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEupS-0005je-NT; Mon, 09 Jan 2023 11:16:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pEupK-0005fN-7v
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 11:16:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pEupI-0006BQ-CR
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 11:16:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673281002;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=oUdyYI941CM9JHfuKD9PKFjZZcimdzGZDdfwkTBzE6Q=;
 b=X+Lt8CsFGa6yOF2ubyWQOz8VBML9Q1S7OkvatfClqc9o+SQlVL/GY2GEPKu45TLT6GJrhU
 9vxZv/CvEZ2z2wKnvSnp6mwJFimYPDUuqe8TDBlySyY1zTUKQZ35kGDiMzopCoEhwkn7el
 WVMU1AjYQi/xG+HIrFUgyOumOfPrYzg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-272--5pQrm0dNxeBPtvbN_t6vA-1; Mon, 09 Jan 2023 11:16:40 -0500
X-MC-Unique: -5pQrm0dNxeBPtvbN_t6vA-1
Received: by mail-wm1-f69.google.com with SMTP id
 l31-20020a05600c1d1f00b003d9720d2a0eso7505878wms.7
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 08:16:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oUdyYI941CM9JHfuKD9PKFjZZcimdzGZDdfwkTBzE6Q=;
 b=S8waDOwRci11CRnHNrLkjCKMfY4KhoNIyJLsm8otQPB0WqkNowrn0Sq+WRefb1LQIN
 x7ZPOjctpMcjMpK67ScWVBb6pE+1TMJh5jT/brdZJ53XuYxdlq8xCXLCgtHmOA/dsiyO
 73GDFdY802rkGxVH3peCYaISB/zOy6+BeVXsJZj2m3Lfh0dtin2To6J8GhZh2ZyN5CT/
 MRW+tyopfEL1s3nHlzY53mWZcf8Er4rGSdaTVDwgIzdZxeTYdZv4MjZF+PiLEhf8bv7P
 PMfPl1TEdTKjGEfa5CnqGuNvXJUVP7Vn0p/exDCCte8BE7rAZjmqF34HVGImS8j8ak+W
 fBgA==
X-Gm-Message-State: AFqh2kpcLVN2g1uz0tSu/582iQDae+v9rcaPctTqIcM+2CmXfFXxuizh
 f1EOV1LV6cKiju3+OuIwEhHhTOhbovtT37tTVetYlVVBFchsIUDa2kt5bk/mBt9Wx4bVZr4fw+P
 eLaWE/GHFm8W0/rnYOnbgOsFpmCRp3iQjfwgmtvfgUSqT7NWSetPEUw50JyJlU0hSJyw=
X-Received: by 2002:a05:600c:348b:b0:3d2:2a72:2577 with SMTP id
 a11-20020a05600c348b00b003d22a722577mr45926396wmq.27.1673280999167; 
 Mon, 09 Jan 2023 08:16:39 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt7DYq2x8hnfsRWfsOySX8UXbYThbtKbX0Uey73+4RBnPQN50TVeKvsXRLesxEQ+2tQmJqYgg==
X-Received: by 2002:a05:600c:348b:b0:3d2:2a72:2577 with SMTP id
 a11-20020a05600c348b00b003d22a722577mr45926378wmq.27.1673280998907; 
 Mon, 09 Jan 2023 08:16:38 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 l16-20020a05600c1d1000b003d23928b654sm18402155wms.11.2023.01.09.08.16.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 08:16:38 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [PATCH] target/i386: fix operand size of unary SSE operations
Date: Mon,  9 Jan 2023 17:16:31 +0100
Message-Id: <20230109161635.276783-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

VRCPSS, VRSQRTSS and VCVTSx2Sx have a 32-bit or 64-bit memory operand,
which is represented in the decoding tables by X86_VEX_REPScalar.  Add it
to the tables, and make validate_vex() handle the case of an instruction
that is in exception type 4 without the REP prefix and exception type 5
with it; this is the cas of VRCP and VRSQRT.

Reported-by: yongwoo <https://gitlab.com/yongwoo36>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1377
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/decode-new.c.inc | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/target/i386/tcg/decode-new.c.inc b/target/i386/tcg/decode-new.c.inc
index 80c579164ff2..d5fd8d965c44 100644
--- a/target/i386/tcg/decode-new.c.inc
+++ b/target/i386/tcg/decode-new.c.inc
@@ -105,6 +105,7 @@
 #define vex3 .vex_class = 3,
 #define vex4 .vex_class = 4,
 #define vex4_unal .vex_class = 4, .vex_special = X86_VEX_SSEUnaligned,
+#define vex4_rep5 .vex_class = 4, .vex_special = X86_VEX_REPScalar,
 #define vex5 .vex_class = 5,
 #define vex6 .vex_class = 6,
 #define vex7 .vex_class = 7,
@@ -839,8 +840,8 @@ static const X86OpEntry opcodes_0F[256] = {
 
     [0x50] = X86_OP_ENTRY3(MOVMSK,     G,y, None,None, U,x, vex7 p_00_66),
     [0x51] = X86_OP_GROUP3(sse_unary,  V,x, H,x, W,x, vex2_rep3 p_00_66_f3_f2),
-    [0x52] = X86_OP_GROUP3(sse_unary,  V,x, H,x, W,x, vex5 p_00_f3),
-    [0x53] = X86_OP_GROUP3(sse_unary,  V,x, H,x, W,x, vex5 p_00_f3),
+    [0x52] = X86_OP_GROUP3(sse_unary,  V,x, H,x, W,x, vex4_rep5 p_00_f3),
+    [0x53] = X86_OP_GROUP3(sse_unary,  V,x, H,x, W,x, vex4_rep5 p_00_f3),
     [0x54] = X86_OP_ENTRY3(PAND,       V,x, H,x, W,x,  vex4 p_00_66), /* vand */
     [0x55] = X86_OP_ENTRY3(PANDN,      V,x, H,x, W,x,  vex4 p_00_66), /* vandn */
     [0x56] = X86_OP_ENTRY3(POR,        V,x, H,x, W,x,  vex4 p_00_66), /* vor */
@@ -878,7 +879,7 @@ static const X86OpEntry opcodes_0F[256] = {
 
     [0x58] = X86_OP_ENTRY3(VADD,       V,x, H,x, W,x, vex2_rep3 p_00_66_f3_f2),
     [0x59] = X86_OP_ENTRY3(VMUL,       V,x, H,x, W,x, vex2_rep3 p_00_66_f3_f2),
-    [0x5a] = X86_OP_GROUP3(sse_unary,  V,x, H,x, W,x, vex3 p_00_66_f3_f2),
+    [0x5a] = X86_OP_GROUP3(sse_unary,  V,x, H,x, W,x, vex2_rep3 p_00_66_f3_f2),
     [0x5b] = X86_OP_GROUP0(0F5B),
     [0x5c] = X86_OP_ENTRY3(VSUB,       V,x, H,x, W,x, vex2_rep3 p_00_66_f3_f2),
     [0x5d] = X86_OP_ENTRY3(VMIN,       V,x, H,x, W,x, vex2_rep3 p_00_66_f3_f2),
@@ -1447,9 +1448,9 @@ static bool validate_vex(DisasContext *s, X86DecodedInsn *decode)
          * Instructions which differ between 00/66 and F2/F3 in the
          * exception classification and the size of the memory operand.
          */
-        assert(e->vex_class == 1 || e->vex_class == 2);
+        assert(e->vex_class == 1 || e->vex_class == 2 || e->vex_class == 4);
         if (s->prefix & (PREFIX_REPZ | PREFIX_REPNZ)) {
-            e->vex_class = 3;
+            e->vex_class = e->vex_class < 4 ? 3 : 5;
             if (s->vex_l) {
                 goto illegal;
             }
-- 
2.38.1


