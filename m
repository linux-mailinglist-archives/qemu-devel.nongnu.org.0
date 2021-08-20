Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4F53F3213
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 19:13:32 +0200 (CEST)
Received: from localhost ([::1]:40190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH85D-0004ol-H6
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 13:13:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mH849-0003zA-3w
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 13:12:25 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:39634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mH847-00081d-Hv
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 13:12:24 -0400
Received: by mail-wr1-x433.google.com with SMTP id q6so15222975wrv.6
 for <qemu-devel@nongnu.org>; Fri, 20 Aug 2021 10:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gQVk1GmuMNWMRrS46YK1WBzIPofFIRFw7DIbereq6GI=;
 b=i1mP2tca/rx9BtaascIB/2h/cuARc7+O0DLUMQ+AVDKXXN9SEV4J58Kq5RjiHckvFh
 CcptBpw4Ku/32AShzZZq4dK5pcw0Pf4Bfcy6pMe/efaeLKKm7gdAbKIP2ahUXzUhIyty
 GT515aJ0aVd8Nrydfw3zLa/Bzy3sXqEiGHqzKLzYzaNGlW3LQP3QQ3jCw7Vdm0cIVTgs
 6du8dEp2VHWGAA6pdMQhOqWyTOI7YBPe2EH/pceHVCGVhssK1tfR4ghzKCKXYv9ZjqQQ
 aR+P/m16z5tedVj+/SHQxrVuue8V3Jrw97n5m0MXkO9EhjI09ANX/SWdjOWr/Jg6PTTW
 rUlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gQVk1GmuMNWMRrS46YK1WBzIPofFIRFw7DIbereq6GI=;
 b=klzHnubxlbu2OyVn1tKADjTjGlJ9dj6ABdLAhB3v8p6qw+If0mvL0aUaiZaCZDFVFS
 /m0zZjxwD8fAinxBrX3mvWslpSllNRcFZgWf6gbrxI7I2CkdSf+EHJfxNu2WoYnCC3d2
 pg+ALuuXF0xdUR8Jz+sgMmBZvYjQ9xSKZBh0N0OhX2neTbiuFwwj0vSERdeJjPpknYBF
 JWJ7Udly2i4S5wGNHYnJsjYwKhLm7i7Ma7fLF9D5eynTTEmfnv7UGTPtCyMhCgI0pMdt
 Ja/7GyBVtQYfR7p6sk4iw1nXcwJJnwla++1SkZKJfCadyUHcCK1k4oLnxTGJtAfZonzQ
 HbIA==
X-Gm-Message-State: AOAM532mZC01uxnRoIXi0mIAXo+H648DptQK7yw3pmHnO62NHKKal+lr
 97AWESVPBBKn7NcAy7+zy3gvR3/w27e+fg==
X-Google-Smtp-Source: ABdhPJyWzNXm9xU/5MiKVKDX2SaWUvxz+uDCGBoOstY9gQGSZeSg/YiKSJUJinPlx2Wd8pi4lLns9A==
X-Received: by 2002:adf:ed8f:: with SMTP id c15mr11383431wro.351.1629479542050; 
 Fri, 20 Aug 2021 10:12:22 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m39sm12114125wms.36.2021.08.20.10.12.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Aug 2021 10:12:21 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/i386: Remove unnecessary checks of b2 in SSE decode
Date: Fri, 20 Aug 2021 18:12:20 +0100
Message-Id: <20210820171220.15089-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In the SSE decode function gen_sse(), we combine a byte
'b' and a value 'b1' which can be [0..3], and switch on them:
   b |= (b1 << 8);
   switch (b) {
   ...
   default:
   unknown_op:
       gen_unknown_opcode(env, s);
       return;
   }

In three cases inside this switch, we were then also checking for
 "if (b1 >= 2) { goto unknown_op; }".
However, this can never happen, because the 'case' values in each place
are 0x0nn or 0x1nn and the switch will have directed the b1 == (2, 3)
cases to the default already.

Delete the dead code.

This check was added in commit c045af25a52e9 in 2010; the added code
was unnecessary then as well.  this commit amounts to a revert of
c045af25a52e9.

Fixes: Coverity CID 1460207
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Somebody should double-check this, because one assumes Andi
added the code for a reason...
---
 target/i386/tcg/translate.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index aacb605eee4..3e7afd2620e 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -3521,9 +3521,6 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
         case 0x171: /* shift xmm, im */
         case 0x172:
         case 0x173:
-            if (b1 >= 2) {
-                goto unknown_op;
-            }
             val = x86_ldub_code(env, s);
             if (is_xmm) {
                 tcg_gen_movi_tl(s->T0, val);
@@ -3772,9 +3769,6 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             rm = modrm & 7;
             reg = ((modrm >> 3) & 7) | REX_R(s);
             mod = (modrm >> 6) & 3;
-            if (b1 >= 2) {
-                goto unknown_op;
-            }
 
             sse_fn_epp = sse_op_table6[b].op[b1];
             if (!sse_fn_epp) {
@@ -4202,9 +4196,6 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             rm = modrm & 7;
             reg = ((modrm >> 3) & 7) | REX_R(s);
             mod = (modrm >> 6) & 3;
-            if (b1 >= 2) {
-                goto unknown_op;
-            }
 
             sse_fn_eppi = sse_op_table7[b].op[b1];
             if (!sse_fn_eppi) {
-- 
2.20.1


