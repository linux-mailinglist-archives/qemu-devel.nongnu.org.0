Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8684D7ECD
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 10:39:23 +0100 (CET)
Received: from localhost ([::1]:37316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nThAg-00008x-Oq
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 05:39:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nTh3k-0007rm-Nq; Mon, 14 Mar 2022 05:32:12 -0400
Received: from [2a00:1450:4864:20::429] (port=38791
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nTh3j-00083N-35; Mon, 14 Mar 2022 05:32:12 -0400
Received: by mail-wr1-x429.google.com with SMTP id t11so22822543wrm.5;
 Mon, 14 Mar 2022 02:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oZRbnlR7DjztUlVfB6oMsIzJvB2h7pYihmVs7iTF1As=;
 b=O79ZkC9X/GkBsetuasaEaNf+EOoFXfOAaLa1d9En2CFXFi45NgfnNFGbACbJ7/de2L
 LQzG4IKgD9QzfIedPqFipfcCwYE4w/6g+XxhecYebQFUTtJabi86rp28PtdYsBbROfzm
 8IzMY1XGBCAMFCAEaqCTUmrP4a016iJaKge3TSqcRkgTlgb/CPbrf5O0hAzMMf5ceWU4
 wCqv/WUlP+YUBP+xlyNAA/sKvJ36/Qtj1V8OaomkzKi0Qv7b5O2TJCwRiaC964/koCUM
 oeyOLyOW7KxeZol+CJ9GSTNGjHdXYpRrvVRYDB49QdzzfnLT1LQqDqoBjANQelvMaUeD
 0mHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=oZRbnlR7DjztUlVfB6oMsIzJvB2h7pYihmVs7iTF1As=;
 b=QZiBGdkbaIKrGqYhuXWQ0eDVByBqsEQyyUTgb4vjtYAY3ulP3+9UHh9CUlqXwDYOo3
 2fUi0l+ZaXvh9e7lYwporIM/2rL2J2cjEde7TRtwISvs1Xrj/MLgmXe5vTrgfvgIbP/7
 vF+9Zv/zXpWwPORr50Pi7Te58RF6BEfnPWDiQ1z4cX57hQT7dizxK4g6nQeIJ+7eTYpU
 6CmwvFafnQ8Ro8TGhzH/DMxW7nUpUwONA5/9MAfQJwPhuLm+H/IQ8hhp0VpiQ5NlPeMf
 azvbEiRpgL3Qv4QASmRIRqosPBMNLIosFZST4xpdsFucl+O46SFpAg9kM5WOwEWf3rwX
 XTMQ==
X-Gm-Message-State: AOAM530YPM3cFOo4/imLG5gPpfSTG/chY5ItOBgG5tSPE+Z596T9Q8Yp
 QdcDD+YFtJxd2JVgs4j+JQhhEffikS4=
X-Google-Smtp-Source: ABdhPJz8HPzEP1qNbOr8O06CTUEjeJIIjDTdgMw0n15K26z5LfSBgJcOe3n1WAqmtRAHJojMUnJNfw==
X-Received: by 2002:a5d:4089:0:b0:1f0:4819:61ba with SMTP id
 o9-20020a5d4089000000b001f0481961bamr16194002wrp.307.1647250329301; 
 Mon, 14 Mar 2022 02:32:09 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 l7-20020adfe9c7000000b001f06f8ec92dsm12707517wrn.30.2022.03.14.02.32.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Mar 2022 02:32:08 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH experiment 05/16] port atomic.h to C++
Date: Mon, 14 Mar 2022 10:31:52 +0100
Message-Id: <20220314093203.1420404-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220314093203.1420404-1-pbonzini@redhat.com>
References: <20220314093203.1420404-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: kwolf@redhat.com, hreitz@redhat.com, berrange@redhat.com,
 qemu-block@nongnu.org, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The functionality of typeof_strip_qual is provided by the standard library.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qemu/atomic.h | 5 +++++
 include/qemu/osdep.h  | 1 +
 2 files changed, 6 insertions(+)

diff --git a/include/qemu/atomic.h b/include/qemu/atomic.h
index 112a29910b..0889a9c5d2 100644
--- a/include/qemu/atomic.h
+++ b/include/qemu/atomic.h
@@ -26,6 +26,10 @@
  * implicit promotion.  int and larger types, as well as pointers, can be
  * converted to a non-qualified type just by applying a binary operator.
  */
+#ifdef __cplusplus
+#define typeof_strip_qual(expr)                                                    \
+	std::remove_cv<typeof(expr)>::type
+#else
 #define typeof_strip_qual(expr)                                                    \
   typeof(                                                                          \
     __builtin_choose_expr(                                                         \
@@ -59,6 +63,7 @@
         __builtin_types_compatible_p(typeof(expr), const volatile unsigned short), \
         (unsigned short)1,                                                         \
       (expr)+0))))))
+#endif
 
 #ifndef __ATOMIC_RELAXED
 #error "Expecting C11 atomic ops"
diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index c9ec7830c9..28707bbde3 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -140,6 +140,7 @@ QEMU_EXTERN_C int daemon(int, int);
 #endif
 
 #ifdef __cplusplus
+#include <type_traits>
 extern "C" {
 #endif
 
-- 
2.35.1



