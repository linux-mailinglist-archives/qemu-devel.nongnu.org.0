Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF56664790
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 18:41:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFH6g-0003bs-1S; Tue, 10 Jan 2023 11:04:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pFH6a-0003ZM-SY
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:04:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pFH6Z-00058q-7N
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:04:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673366642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oUdyYI941CM9JHfuKD9PKFjZZcimdzGZDdfwkTBzE6Q=;
 b=fb/vBMRDlysK1lWzgNkv23OYKk9iacWG41FlPOV2cCR8EXSBm5GxqcKSG1T/0NAK6nMFo3
 ljOX2WyJr/lvAo1HBZh6xMBX8VNC02/wpjhrOnOuPn6fkZTDN7nIEJFS4Q/lez3jVB3zWT
 oFn75noL84gWlHIGJ3ICNsOZRzG//7o=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-25-_XrZTs2mOoanQ_CMqkRkPQ-1; Tue, 10 Jan 2023 11:04:01 -0500
X-MC-Unique: _XrZTs2mOoanQ_CMqkRkPQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 fm25-20020a05600c0c1900b003d9702a11e5so6514052wmb.0
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 08:04:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oUdyYI941CM9JHfuKD9PKFjZZcimdzGZDdfwkTBzE6Q=;
 b=mOSk/M6nojtirfTOjj8o3+QnxnaxO0R/OigFnHXyacZWWqH9BlygGwOUXXq7Hv5iSK
 FV3YVxEKvsMmmDdQbSzhR0jJE/Kv2RHn2sCZdtwIxgUwsxINmqcgSyv3C1siFKIUp87C
 jdEuiI6KULCmv/osSQel4QP/2jHMQAJioV58ie/1vIWVls5cD4ooOkd3pQbBt9ZuO6Tk
 OkYmpJVcHOebKhouI+zDnjzM6YJ8fFuQoYoMSe7aCfX5V3FRUidiZg45su+DczMJ7fZw
 10tDeS4nG5BRpfUREnr0GtRj5Izho7tiur6pKqfeHV8afn4Lw86EqUBnp6FrVlH5qHuP
 W4PQ==
X-Gm-Message-State: AFqh2kpKI1tY0Dykp/sNw+MyDv619jzbSXPIUpVV4Mlw5Bvdz+YZUWog
 nI7Au1DGRBtNPfrkHRMwYchfkLz3/hpSvuIG5dUr+XBmbAte3wSAOxBCGOUUG/vWJPliwPxXuwz
 qKcb33p+mdHqYVYV9sUZHAkydr/rh+rvm2nhChelPPiMkHTLf+lJskSIwCrsRKAVA3P0=
X-Received: by 2002:a05:600c:a56:b0:3cf:894d:1d06 with SMTP id
 c22-20020a05600c0a5600b003cf894d1d06mr49585035wmq.30.1673366639741; 
 Tue, 10 Jan 2023 08:03:59 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs3FbZm1V/1gvul7IMQo5sXqyHyJnO6UTBVuUt4v45XQ2v9aFDD8wJo1YqzjL+1RiQhhNxQEg==
X-Received: by 2002:a05:600c:a56:b0:3cf:894d:1d06 with SMTP id
 c22-20020a05600c0a5600b003cf894d1d06mr49584996wmq.30.1673366639345; 
 Tue, 10 Jan 2023 08:03:59 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 o14-20020a5d58ce000000b002879c013b8asm11501129wrf.42.2023.01.10.08.03.58
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 08:03:58 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 28/29] target/i386: fix operand size of unary SSE operations
Date: Tue, 10 Jan 2023 17:02:32 +0100
Message-Id: <20230110160233.339771-29-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230110160233.339771-1-pbonzini@redhat.com>
References: <20230110160233.339771-1-pbonzini@redhat.com>
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


