Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFBD3B4590
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 16:29:58 +0200 (CEST)
Received: from localhost ([::1]:54642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwmqD-0006CY-O9
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 10:29:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lwmfK-0003JJ-7P
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 10:18:42 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:43548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lwmfI-0003Ep-Jc
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 10:18:41 -0400
Received: by mail-ej1-x632.google.com with SMTP id nb6so15364314ejc.10
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 07:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GNN3PKGCrmEv1egmkbcKJ78YTkUsB3DLKlu9c2s2Q9Y=;
 b=SDawVslL8U2T3cqpgFD4moIXEhvIRIUP9jUv/u9jwug3+tuhScbxWsS3DU9HGltonz
 WR8GePGsJbSjJUdyH7Au0Urh9nDP/E3gKzzNl9RR/8Rxj4lUihj3ElejK/XIoJN9fJtC
 h9fORT/s7TBqCzODkdGue6SXYbJc4T9ObcVh1wMmkawjDgY8XCC2NtA6psMFuwlbGGNG
 Uor3hJNsgNbzKoB/YFeFGhzovkMYDVehxa55rQ2/UAMmQqr7v3YHdr09ZCFFEvBq+1wO
 042ouAD3D0IsqE/fcmVHBIdz6mz49lRHXblZxmyEa/kT1jsxQ4Ws9NjcJcGyrSDdwRHz
 RgDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=GNN3PKGCrmEv1egmkbcKJ78YTkUsB3DLKlu9c2s2Q9Y=;
 b=h7+c8dv/kYVIt5N5v+Wk5QsDIvrxnrG0SII4U8vrozsiVh3Ts/0tfe0zoCJFwyXKFG
 u+zZzhbz9TWz/YxWQlf3NCD9KfyA45R/YLFOnCVcqbniSGXl6DjWg/4iPc7pknj0OOzC
 Hfg1Eh90rAPO6IfWtDwT7ECzlSV5OKJb6KjIRRtBK1LZnBD4DTKGGUGJO3LjaXgqT7fh
 uZZKBjrJfPj5ISjADQOEuuOrYkq54UpeLMkI1+rnyWFDOBo617jHToYoPEugUiN4vxay
 2Ff3fuQlsO7vH/DrGVH3PGs767duvBWty8JhEtBVE22U3NAEzTXTLsJE53jiS4DR6PJV
 VPtA==
X-Gm-Message-State: AOAM531wuUiaKSYWLHCclBlClENGvYl+weN4L2x3Z7g4H7vbDz6gfwbn
 uIKcbcfM74AZcnZqTZbKjbDLm5l1b6Q=
X-Google-Smtp-Source: ABdhPJwQXDflJpWbtWiTOmgMcbG51cMATsdujMtsQ9fCJYJxaTvSReLAyU9smW/lMgXWgi6kLGMnDA==
X-Received: by 2002:a17:906:2bd9:: with SMTP id
 n25mr11233122ejg.513.1624630719267; 
 Fri, 25 Jun 2021 07:18:39 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c28sm326579ejc.102.2021.06.25.07.18.38
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 07:18:38 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/28] osdep: provide ROUND_DOWN macro
Date: Fri, 25 Jun 2021 16:18:09 +0200
Message-Id: <20210625141822.1368639-16-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210625141822.1368639-1-pbonzini@redhat.com>
References: <20210625141822.1368639-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x632.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

osdep.h provides a ROUND_UP macro to hide bitwise operations for the
purpose of rounding a number up to a power of two; add a ROUND_DOWN
macro that does the same with truncation towards zero.

While at it, change the formatting of some comments.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qemu/osdep.h | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index 0a54bf7be8..c3656b755a 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -319,11 +319,16 @@ extern "C" {
     })
 #endif
 
-/* Round number down to multiple */
+/*
+ * Round number down to multiple. Safe when m is not a power of 2 (see
+ * ROUND_DOWN for a faster version when a power of 2 is guaranteed).
+ */
 #define QEMU_ALIGN_DOWN(n, m) ((n) / (m) * (m))
 
-/* Round number up to multiple. Safe when m is not a power of 2 (see
- * ROUND_UP for a faster version when a power of 2 is guaranteed) */
+/*
+ * Round number up to multiple. Safe when m is not a power of 2 (see
+ * ROUND_UP for a faster version when a power of 2 is guaranteed).
+ */
 #define QEMU_ALIGN_UP(n, m) QEMU_ALIGN_DOWN((n) + (m) - 1, (m))
 
 /* Check if n is a multiple of m */
@@ -340,11 +345,22 @@ extern "C" {
 /* Check if pointer p is n-bytes aligned */
 #define QEMU_PTR_IS_ALIGNED(p, n) QEMU_IS_ALIGNED((uintptr_t)(p), (n))
 
-/* Round number up to multiple. Requires that d be a power of 2 (see
+/*
+ * Round number down to multiple. Requires that d be a power of 2 (see
  * QEMU_ALIGN_UP for a safer but slower version on arbitrary
- * numbers); works even if d is a smaller type than n.  */
+ * numbers); works even if d is a smaller type than n.
+ */
+#ifndef ROUND_DOWN
+#define ROUND_DOWN(n, d) ((n) & -(0 ? (n) : (d)))
+#endif
+
+/*
+ * Round number up to multiple. Requires that d be a power of 2 (see
+ * QEMU_ALIGN_UP for a safer but slower version on arbitrary
+ * numbers); works even if d is a smaller type than n.
+ */
 #ifndef ROUND_UP
-#define ROUND_UP(n, d) (((n) + (d) - 1) & -(0 ? (n) : (d)))
+#define ROUND_UP(n, d) ROUND_DOWN((n) + (d) - 1, (d))
 #endif
 
 #ifndef DIV_ROUND_UP
-- 
2.31.1



