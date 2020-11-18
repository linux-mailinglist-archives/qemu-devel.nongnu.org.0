Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D837E2B7B3A
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 11:26:14 +0100 (CET)
Received: from localhost ([::1]:44420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfKfF-0008Et-Rj
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 05:26:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kfKZ6-0000Bw-3l
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 05:19:52 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:42619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kfKZ4-0003fb-KB
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 05:19:51 -0500
Received: by mail-ej1-x629.google.com with SMTP id i19so1947117ejx.9
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 02:19:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MoDrbZFRPYimX08Mu25vJdw6TEjHqrR/m6bx2o/PoHM=;
 b=KYShNIh1dQyFHKFjeoQdbCUKn5QMO2XP6eH7WgguUS1ckLyAxskXKgDL6qzwNWS45F
 +/0BRH9Um92QF0PzWAyT/BMassTExi0fOj4qXvjBVycjAF1vzh1OLihNd+tbD34iQcnP
 Q/766l++5kpJa+W9gRxtGe7/WOhF+aIUGgNSYXN+Z3Epuv574mLTYOEuh7QmCHLzzWPI
 K03Tfp0zM7nYkz876eN3qsN3AjYyBCuTqajBxvR9CJczu4gFHk4J7NtJOg0LD/ZLWlt9
 Cl98XCwTAWaAO7YQuqaSM0UOSh4cchoRC+XoguJL7u6W9ZzVwaOPYnbTc8JW5wZf2CXv
 OJGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=MoDrbZFRPYimX08Mu25vJdw6TEjHqrR/m6bx2o/PoHM=;
 b=pKlT8yoIBxFykCIt8u1eVtEQIHfbB+t1K7HIiZwefqr3jzGIm1rYbHtp1KYMIh3b41
 lwZzuX94KxJREynLM1bfkEOVzrjDx//mXdS+kfe1Hpi3v+UXddDcP7xpo5e3qtMgBlF/
 cODPB85vaiicArfk4KHp/n8MI53VgLN606CdM6BGdZ4rciei1KfIttfeEtpdEHkCR4XS
 8+1uj1mcHW+70gjOqAcFMUAezu+Uup8+UACNib0dEVp4dZVUi2fE26Ollx9vJJBQv1A2
 FQg64ieA7qvi9C+i11vHn7X62oa49ZXAq9Bf99vyqBVKScbHmFgGB3D8NVoMhKWZABLO
 j2Iw==
X-Gm-Message-State: AOAM532uom41ABTe9h+2bVDm8ukS0wgmgTmlI27CfoxeJU92fO0U4IIZ
 F3kbN0hV5dK11RgeX/dxtDsXnIYzVEU=
X-Google-Smtp-Source: ABdhPJzLNwXoIjbXAImDojoWloj19dg0z2k8RivJ6sIAOgpRweQ3XakJNh7DYwlzBrDRJMfrIr7lTg==
X-Received: by 2002:a17:906:491a:: with SMTP id
 b26mr24326646ejq.385.1605694788983; 
 Wed, 18 Nov 2020 02:19:48 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id f24sm13230052edx.90.2020.11.18.02.19.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 02:19:48 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 6/7] hvf: Fix segment selector format
Date: Wed, 18 Nov 2020 11:19:39 +0100
Message-Id: <20201118101940.132594-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201118101940.132594-1-pbonzini@redhat.com>
References: <20201118101940.132594-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x629.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Jessica Clarke <jrtc27@jrtc27.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jessica Clarke <jrtc27@jrtc27.com>

The Requested Privilege Level field is 2 bits, the Table Indicator field
is 1 bit and the Index field is the remaining 15 bits, with TI=0 meaning
GDT and TI=1 meaning LDT.

Signed-off-by: Jessica Clarke <jrtc27@jrtc27.com>
Message-Id: <20201116200414.28286-1-jrtc27@jrtc27.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/hvf/x86.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/i386/hvf/x86.h b/target/i386/hvf/x86.h
index 9e2c0039e6..782664c2ea 100644
--- a/target/i386/hvf/x86.h
+++ b/target/i386/hvf/x86.h
@@ -214,16 +214,16 @@ static inline uint32_t x86_call_gate_offset(x86_call_gate *gate)
     return (uint32_t)((gate->offset1 << 16) | gate->offset0);
 }
 
-#define LDT_SEL     0
-#define GDT_SEL     1
+#define GDT_SEL     0
+#define LDT_SEL     1
 
 typedef struct x68_segment_selector {
     union {
         uint16_t sel;
         struct {
-            uint16_t rpl:3;
+            uint16_t rpl:2;
             uint16_t ti:1;
-            uint16_t index:12;
+            uint16_t index:13;
         };
     };
 } __attribute__ ((__packed__)) x68_segment_selector;
-- 
2.28.0



