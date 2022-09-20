Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3F35BEFFD
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 00:20:40 +0200 (CEST)
Received: from localhost ([::1]:35492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oalba-00073G-Ol
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 18:20:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oah0C-0006Qc-O5
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:25:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oah0A-0002BE-72
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:25:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663694741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ki83e2Sfs73t8nh59NwsARPUhdXZ3icuXqbcNfYW5rk=;
 b=BttnwrwpVnBhLgrn8L6c1963KVaDnaOw72JISqu3+LupH9ho9r7Vtyxk2g71PyNYaw1FPq
 FptsA6FTzezGGpImjmYOx5DGRYxlriYjgV8erDD5ELzu8u/jauwq0rLTdaumkP3hm8Z+jM
 eX53S/ANNnitHUcRYCX7frBk9Gs/beU=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-126-3jRzBHMVOPKZzM2MS63sjg-1; Tue, 20 Sep 2022 13:25:39 -0400
X-MC-Unique: 3jRzBHMVOPKZzM2MS63sjg-1
Received: by mail-ej1-f70.google.com with SMTP id
 gv43-20020a1709072beb00b0077c3f58a03eso1770309ejc.4
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 10:25:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Ki83e2Sfs73t8nh59NwsARPUhdXZ3icuXqbcNfYW5rk=;
 b=ETwAq8U7tyg3DNICmlfzj5fJh2aibkHfTYGgHZ9vEIlD+eK1KBCdh6dZjgFttXMCIt
 /Ga2Cr2yQ9iQBvHsT9rA4OYNExkkwvNI1wY9tyF2haEyPgrj1eByQwIc7Xud6wQLvRWP
 XN7uxFKNA6JKuxZVEN6mLb3cGxHjaXQScmTSMowcGIm6wGsb+hkdO4pWbkmQs5rbBhEd
 QN7QpavpWGA0vZizu0SwL/btMUsJw+R+Co/hbQUTkt205MhkVtoEZoEalKZe01Pab0qL
 P5K0KQ+VL9yrQZTtlSJQRNEdYVTs2VLC0yfhSb1oADmlnjadmvobNr6m+LDVoecFsp3p
 JM6w==
X-Gm-Message-State: ACrzQf3ps5t0F1Bcb/dGDz+zvILR9nPYM5n7n6U17tAkxmTaP8F/vBaa
 osgvFT309Qh7nViebKpZIwkPcPKRkfA5fyWuBbutmF73bqQk3EDwYArC3/iU6xnBVK2fFcYxwOa
 vUfqVwAeiGxV0yxQtGtacv7csXd5i/2visJpkSTsDoJGgSUsF9mNeUc4wxAcwD84hFzg=
X-Received: by 2002:a17:907:2cd3:b0:77c:3e23:7bec with SMTP id
 hg19-20020a1709072cd300b0077c3e237becmr18514406ejc.380.1663694736944; 
 Tue, 20 Sep 2022 10:25:36 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM66oYPDyCt3VUrlKqJFeZ7fc3ay75aWSQDl+KQCg16la7lDOzmzC4xuNqs8QLXQAd407CQ/FQ==
X-Received: by 2002:a17:907:2cd3:b0:77c:3e23:7bec with SMTP id
 hg19-20020a1709072cd300b0077c3e237becmr18514377ejc.380.1663694736646; 
 Tue, 20 Sep 2022 10:25:36 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 hb19-20020a170906b89300b0077fc47605b4sm108711ejb.217.2022.09.20.10.25.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 10:25:36 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	paul@nowt.org
Subject: [PATCH v2 18/37] target/i386: Introduce 256-bit vector helpers
Date: Tue, 20 Sep 2022 19:24:48 +0200
Message-Id: <20220920172507.95568-19-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220920172507.95568-1-pbonzini@redhat.com>
References: <20220920172507.95568-1-pbonzini@redhat.com>
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

The new implementation of SSE will cover AVX from the get go, because
all the work for the helper functions is already done.  We just need to
build them.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/helper.h         | 2 ++
 target/i386/ops_sse.h        | 5 +++++
 target/i386/ops_sse_header.h | 4 ++++
 target/i386/tcg/fpu_helper.c | 3 +++
 4 files changed, 14 insertions(+)

diff --git a/target/i386/helper.h b/target/i386/helper.h
index ac3b4d1ee3..3da5df98b9 100644
--- a/target/i386/helper.h
+++ b/target/i386/helper.h
@@ -218,6 +218,8 @@ DEF_HELPER_3(movq, void, env, ptr, ptr)
 #include "ops_sse_header.h"
 #define SHIFT 1
 #include "ops_sse_header.h"
+#define SHIFT 2
+#include "ops_sse_header.h"
 
 DEF_HELPER_3(rclb, tl, env, tl, tl)
 DEF_HELPER_3(rclw, tl, env, tl, tl)
diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 18d217ebf5..090ba013b3 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -35,7 +35,11 @@
 #define W(n) ZMM_W(n)
 #define L(n) ZMM_L(n)
 #define Q(n) ZMM_Q(n)
+#if SHIFT == 1
 #define SUFFIX _xmm
+#else
+#define SUFFIX _ymm
+#endif
 #endif
 
 #define LANE_WIDTH (SHIFT ? 16 : 8)
@@ -2379,6 +2383,7 @@ void glue(helper_aeskeygenassist, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
 
 #undef SSE_HELPER_S
 
+#undef LANE_WIDTH
 #undef SHIFT
 #undef XMM_ONLY
 #undef Reg
diff --git a/target/i386/ops_sse_header.h b/target/i386/ops_sse_header.h
index e7866a8395..440f1c0e78 100644
--- a/target/i386/ops_sse_header.h
+++ b/target/i386/ops_sse_header.h
@@ -21,7 +21,11 @@
 #define SUFFIX _mmx
 #else
 #define Reg ZMMReg
+#if SHIFT == 1
 #define SUFFIX _xmm
+#else
+#define SUFFIX _ymm
+#endif
 #endif
 
 #define dh_alias_Reg ptr
diff --git a/target/i386/tcg/fpu_helper.c b/target/i386/tcg/fpu_helper.c
index 48bf0c5cf8..819e920ec6 100644
--- a/target/i386/tcg/fpu_helper.c
+++ b/target/i386/tcg/fpu_helper.c
@@ -3053,3 +3053,6 @@ void helper_movq(CPUX86State *env, void *d, void *s)
 
 #define SHIFT 1
 #include "ops_sse.h"
+
+#define SHIFT 2
+#include "ops_sse.h"
-- 
2.37.2


