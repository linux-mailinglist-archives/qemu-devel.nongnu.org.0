Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBE45BBC56
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Sep 2022 09:59:01 +0200 (CEST)
Received: from localhost ([::1]:51994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZpCd-0007PJ-SR
	for lists+qemu-devel@lfdr.de; Sun, 18 Sep 2022 03:58:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oZpA3-0005hs-RD
 for qemu-devel@nongnu.org; Sun, 18 Sep 2022 03:56:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oZp9z-0007iR-LU
 for qemu-devel@nongnu.org; Sun, 18 Sep 2022 03:56:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663487774;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=GHA4iB+vWgQgvrjq6bsYLAWGMi0ifafcuMJ1u5P5lbc=;
 b=OjiJ1QVoiSnkMVBIZ6NduOG0Lq8fs1g1T7ecgzKvZwOFXUQvBG6GuybAEQAxzqgbQCzSgK
 LEDVVRoArfXXvYOjD57C8/nqNHP/Lwfj73XjMOxWlyr1/GV4h7nZSl5xPHUMOar+eSe8hp
 wTjA4GoBcHC0koXzb6VwGHpibLcBuHc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-270-R62x4MwZOsmBYufk7bekew-1; Sun, 18 Sep 2022 03:56:13 -0400
X-MC-Unique: R62x4MwZOsmBYufk7bekew-1
Received: by mail-ed1-f70.google.com with SMTP id
 b16-20020a056402279000b0044f1102e6e2so18588794ede.20
 for <qemu-devel@nongnu.org>; Sun, 18 Sep 2022 00:56:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date;
 bh=GHA4iB+vWgQgvrjq6bsYLAWGMi0ifafcuMJ1u5P5lbc=;
 b=6wku87Cs8HR0nmLZmmdDBsv/Sb8y/w5740l77tE1Ao0zugLoWtiSM5/TTCBAApYFUm
 RQgDGmTqt01lLaM7z8BzMzBR0x/WOsHpXIvWZdq0bEaQKnUD6p94tdOt5JStWD/qKUC0
 u1S83091MJIbA78qf4AI5MlRR3aFeevto+BifH8juaKwr6dzGnMW1ob+kSjFz9F5Ms0s
 pIXykISRntVqYu7yL67BexZmWyNTjKUI6xFgBHxQIG1CV9Kp6OtJP0zZ/JliaIY8t3wy
 Y84VbVZKjaIKVFa5oI12CjjrHYcR8KVYPT6KiZoAia/NBAg3FoQDDfMdM6ejR/x+a5NT
 ME4w==
X-Gm-Message-State: ACrzQf0FVHSD2gwWEcTAU10ZRTY3h61XUjrpiooMQfTsCbUFMjSWZT/G
 Pxg5mGLJS9um0s2530bBtncABdDzReBp+YK1WegDyfGKt5+J2fpIOo9YmkAXPQ0qfdgjeQDz1Ku
 5TE8+CJo9J4cUr6aSatdScoVWykoJDjuEmNxzDK34dy8qJGJxfakj04mUnd/miiudQ3U=
X-Received: by 2002:a05:6402:4cb:b0:453:b9f1:f10a with SMTP id
 n11-20020a05640204cb00b00453b9f1f10amr3347785edw.47.1663487771739; 
 Sun, 18 Sep 2022 00:56:11 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6sms/pDBeEbDZtozorCc59uG47mzOb04nWuh+m45r+P7BHVK4b0hFT4ARuTZsCNhOocEBhIg==
X-Received: by 2002:a05:6402:4cb:b0:453:b9f1:f10a with SMTP id
 n11-20020a05640204cb00b00453b9f1f10amr3347769edw.47.1663487771318; 
 Sun, 18 Sep 2022 00:56:11 -0700 (PDT)
Received: from goa-sendmail ([93.56.164.28]) by smtp.gmail.com with ESMTPSA id
 x6-20020a05640226c600b00445c0ab272fsm17789329edd.29.2022.09.18.00.56.10
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Sep 2022 00:56:10 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/i386: fix INSERTQ implementation
Date: Sun, 18 Sep 2022 09:56:09 +0200
Message-Id: <20220918075609.549781-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

INSERTQ is defined to not modify any bits in the lower 64 bits of the
destination, other than the ones being replaced with bits from the
source operand.  QEMU instead is using unshifted bits from the source
for those bits.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/ops_sse.h        | 10 +++++-----
 target/i386/ops_sse_header.h |  2 +-
 target/i386/tcg/translate.c  | 14 ++++++++++++--
 3 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 3504bca36a..7bf8bb967d 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -934,7 +934,7 @@ void helper_extrq_i(CPUX86State *env, ZMMReg *d, int index, int length)
     d->ZMM_Q(0) = helper_extrq(d->ZMM_Q(0), index, length);
 }
 
-static inline uint64_t helper_insertq(uint64_t src, int shift, int len)
+static inline uint64_t helper_insertq(uint64_t dest, uint64_t src, int shift, int len)
 {
     uint64_t mask;
 
@@ -943,17 +943,17 @@ static inline uint64_t helper_insertq(uint64_t src, int shift, int len)
     } else {
         mask = (1ULL << len) - 1;
     }
-    return (src & ~(mask << shift)) | ((src & mask) << shift);
+    return (dest & ~(mask << shift)) | ((src & mask) << shift);
 }
 
 void helper_insertq_r(CPUX86State *env, ZMMReg *d, ZMMReg *s)
 {
-    d->ZMM_Q(0) = helper_insertq(s->ZMM_Q(0), s->ZMM_B(9) & 63, s->ZMM_B(8) & 63);
+    d->ZMM_Q(0) = helper_insertq(d->ZMM_Q(0), s->ZMM_Q(0), s->ZMM_B(9) & 63, s->ZMM_B(8) & 63);
 }
 
-void helper_insertq_i(CPUX86State *env, ZMMReg *d, int index, int length)
+void helper_insertq_i(CPUX86State *env, ZMMReg *d, ZMMReg *s, int index, int length)
 {
-    d->ZMM_Q(0) = helper_insertq(d->ZMM_Q(0), index, length);
+    d->ZMM_Q(0) = helper_insertq(d->ZMM_Q(0), s->ZMM_Q(0), index, length);
 }
 #endif
 
diff --git a/target/i386/ops_sse_header.h b/target/i386/ops_sse_header.h
index d99464afb0..400b24c091 100644
--- a/target/i386/ops_sse_header.h
+++ b/target/i386/ops_sse_header.h
@@ -193,7 +193,7 @@ DEF_HELPER_3(rcpss, void, env, ZMMReg, ZMMReg)
 DEF_HELPER_3(extrq_r, void, env, ZMMReg, ZMMReg)
 DEF_HELPER_4(extrq_i, void, env, ZMMReg, int, int)
 DEF_HELPER_3(insertq_r, void, env, ZMMReg, ZMMReg)
-DEF_HELPER_4(insertq_i, void, env, ZMMReg, int, int)
+DEF_HELPER_5(insertq_i, void, env, ZMMReg, ZMMReg, int, int)
 DEF_HELPER_3(glue(haddps, SUFFIX), void, env, ZMMReg, ZMMReg)
 DEF_HELPER_3(glue(haddpd, SUFFIX), void, env, ZMMReg, ZMMReg)
 DEF_HELPER_3(glue(hsubps, SUFFIX), void, env, ZMMReg, ZMMReg)
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 8ec91d17af..5f31a59fb8 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -3506,10 +3506,20 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                     gen_helper_extrq_i(cpu_env, s->ptr0,
                                        tcg_const_i32(bit_index),
                                        tcg_const_i32(field_length));
-                else
-                    gen_helper_insertq_i(cpu_env, s->ptr0,
+                else {
+                    if (mod != 3) {
+                        gen_lea_modrm(env, s, modrm);
+                        op2_offset = offsetof(CPUX86State, xmm_t0);
+                        gen_ldq_env_A0(s, offsetof(CPUX86State, xmm_t0.ZMM_D(0)));
+                    } else {
+                        rm = (modrm & 7) | REX_B(s);
+                        op2_offset = ZMM_OFFSET(rm);
+                    }
+                    tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
+                    gen_helper_insertq_i(cpu_env, s->ptr0, s->ptr1,
                                          tcg_const_i32(bit_index),
                                          tcg_const_i32(field_length));
+                }
             }
             break;
         case 0x7e: /* movd ea, mm */
-- 
2.37.2


