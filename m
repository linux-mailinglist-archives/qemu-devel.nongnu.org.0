Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 980275A9235
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 10:39:32 +0200 (CEST)
Received: from localhost ([::1]:39130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTfjX-0002Rq-Nc
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 04:39:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTexH-0001UL-9i
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 03:49:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28102)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTexC-0003C6-HM
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 03:49:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662018574;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9IC2Tite3HzkQmKsgB8f7REAQrQ4k7ITc5m5MXNySxs=;
 b=fcDWuM8h1KCNDZ6cjqIZwyfD2L1OwHZqmjT3cew5Hgqk4dLv95iZFDnYBVxJkQxC18Y0iK
 OD6Jecrq4vxUdlnMAHv7CcWAdw8vie150tfiZ/h3NKU5rdtqyfEk7sMi5oktXKPwNQkLT2
 dFT/Pv6K0zaIX0UyxLum1RRyBo46vw8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-517-utm8OatfOYqb8Y1h9cRfNw-1; Thu, 01 Sep 2022 03:49:33 -0400
X-MC-Unique: utm8OatfOYqb8Y1h9cRfNw-1
Received: by mail-wr1-f69.google.com with SMTP id
 j4-20020adfa544000000b002255264474bso2851938wrb.17
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 00:49:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=9IC2Tite3HzkQmKsgB8f7REAQrQ4k7ITc5m5MXNySxs=;
 b=zCvK/n6Im6agLkYeAo19BWweILBZVht23e5xZfivtbMFla6GsPctkwMnS8z6cno0si
 FiVj8ZnIBgXt63ihCyZvS1uq5KJC+oaTCl/IzxcoAVmUQZqPN4dhSOhi/umJiYOJM5/w
 0FMe86NpNomt3bYjq/9sritKH0hklUY7o38NF3cys1Nl8b0irzuWAZ8neXZvwniu5QaK
 NU/Sldd/chJdlzx8Hi066m6uqr89tGzkfsy8kG31EP7eXreUdzz1aRfelOAfDsFn/26V
 Cs/Z6bNEay6Neh1wPqtwqdTrscF6FvHnm0Rf2HW95XFLcJQljLdnSo0fVbC9UCAIinP6
 IQ2A==
X-Gm-Message-State: ACgBeo3iolY5Q/fZg0ogpXAUdivU3iT14EdPZS9S/X5W42ClhieFTxM7
 h7y0a5BxoR1osecd2c/LHVyH1p/ZgYm4uIAQo85ez9kdtdMtitBwF2OzBFc+E8lldstRFb36w08
 fuHdx5giJOKAg3BNwkOMv64cD5xJJFaQH0T9UoNQkkiEMh26UFyAwsd9rcD3b4fySCzk=
X-Received: by 2002:adf:e112:0:b0:21d:7195:3a8d with SMTP id
 t18-20020adfe112000000b0021d71953a8dmr14377871wrz.371.1662018571688; 
 Thu, 01 Sep 2022 00:49:31 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5d97Eps6E1yKE7QmKPefzYFRb24jNsMQ+5lq5MGgnYQD9jRz5/2HO5KP8E5+2flI2VoVCWcg==
X-Received: by 2002:adf:e112:0:b0:21d:7195:3a8d with SMTP id
 t18-20020adfe112000000b0021d71953a8dmr14377855wrz.371.1662018571423; 
 Thu, 01 Sep 2022 00:49:31 -0700 (PDT)
Received: from goa-sendmail ([93.56.160.208]) by smtp.gmail.com with ESMTPSA id
 l14-20020a5d410e000000b002238a1f6b74sm13906987wrp.37.2022.09.01.00.49.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 00:49:30 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: paul@nowt.org,
	richard.henderson@linaro.org
Subject: [PATCH v3 22/23] i386: AVX pclmulqdq prep
Date: Thu,  1 Sep 2022 09:48:41 +0200
Message-Id: <20220901074842.57424-23-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220901074842.57424-1-pbonzini@redhat.com>
References: <20220901074842.57424-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Paul Brook <paul@nowt.org>

Make the pclmulqdq helper AVX ready

Signed-off-by: Paul Brook <paul@nowt.org>
Message-Id: <20220424220204.2493824-21-paul@nowt.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/ops_sse.h | 29 ++++++++++++++++++++++-------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index a11a0143bf..4135623ad8 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -2211,14 +2211,14 @@ target_ulong helper_crc32(uint32_t crc1, target_ulong msg, uint32_t len)
 
 #endif
 
-void glue(helper_pclmulqdq, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
-                                    uint32_t ctrl)
+#if SHIFT == 1
+static void clmulq(uint64_t *dest_l, uint64_t *dest_h,
+                          uint64_t a, uint64_t b)
 {
-    uint64_t ah, al, b, resh, resl;
+    uint64_t al, ah, resh, resl;
 
     ah = 0;
-    al = d->Q((ctrl & 1) != 0);
-    b = s->Q((ctrl & 16) != 0);
+    al = a;
     resh = resl = 0;
 
     while (b) {
@@ -2231,8 +2231,23 @@ void glue(helper_pclmulqdq, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
         b >>= 1;
     }
 
-    d->Q(0) = resl;
-    d->Q(1) = resh;
+    *dest_l = resl;
+    *dest_h = resh;
+}
+#endif
+
+void glue(helper_pclmulqdq, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
+                                    uint32_t ctrl)
+{
+    Reg *v = d;
+    uint64_t a, b;
+    int i;
+
+    for (i = 0; i < 1 << SHIFT; i += 2) {
+        a = v->Q(((ctrl & 1) != 0) + i);
+        b = s->Q(((ctrl & 16) != 0) + i);
+        clmulq(&d->Q(i), &d->Q(i + 1), a, b);
+    }
 }
 
 void glue(helper_aesdec, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
-- 
2.37.1



