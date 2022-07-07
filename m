Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA93456ADBE
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 23:35:47 +0200 (CEST)
Received: from localhost ([::1]:58990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9ZA2-0005Qa-O2
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 17:35:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9Z4w-0000Ja-Ed; Thu, 07 Jul 2022 17:30:31 -0400
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c]:46933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9Z4v-0004iJ-1C; Thu, 07 Jul 2022 17:30:30 -0400
Received: by mail-vs1-xe2c.google.com with SMTP id 126so19600709vsq.13;
 Thu, 07 Jul 2022 14:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X7g0ZEIbbAirSzVLJgJceqK9f+d4u/48V7OosDEGVa0=;
 b=L3YyPdvEAVHYlqRVKBeSK0hvGJivtJUr4I2PWkrAjt8t/WLLbWzaKejhGuA9V/nSoC
 rDvrSRW115vpFNPW2BN56Yc5glBtlyPq4liQ0wbYo2kIRjx/2VMhAcPE2ssvD7Ev7RJn
 y1nN7Ol7fyR9EqMZ8hS0eeViRpwNGIOp+ZfaeVkth4rgA2YOOuPs2v2QSz9izQBRKXLA
 DAdUHL9x8icDM9QA0viOwUgGrotbQMRD+fJOfC6GeJNvOQoYRHHLyMxsMtLWdIRYNB12
 57/x3KejhaO6FKEfLJ/HN6lAEY3SIaRKDeYmY56ep94Y6cNwEQkI1oQDaIvsrnuC8x1F
 BKOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X7g0ZEIbbAirSzVLJgJceqK9f+d4u/48V7OosDEGVa0=;
 b=G4KUUCiubUNN4+8CrWCNZGNZvVsZaMGaoP0XJdmfFYfcQgDUcUZFRyiH5OOKXO84MO
 GMsoE1aakP/aZ0XgM34PLG/m0+4syYGqSqU3tKogjcaI8/3oV87OzPfxPNlqVbTmMwD7
 D1knyp8tXxMHdNc/51HmNBAQ+8ThsSixQR5PObq7LYyz+18Cu47o0IFUNhjFcfKRBBU8
 dYaptGOUy66qZDglrGAEKSXNAuYzUnHoZ6dAoNgzDvUEft02rbDRx3dLaCRXWso2+PxQ
 w6zMd2Q9Auv0KM1cjz0pccybG7oezusX4sgetKXieS6FAVdupb2hSJULTAaQoAG0DxmB
 456g==
X-Gm-Message-State: AJIora822D8O+aeVa3k9lcNNJT/lwvy/4JShlbTjS3P6s+OR7LkDe7/z
 8IWl0dPFTg+iVuuLLOT4bl82pgMZcUY=
X-Google-Smtp-Source: AGRyM1uM7mVsug6R+ynP5P5KzkGKSrLMUu1fNwEZCljzgoKmfV+E5PPYVk1704VJHiM/DXAy9MuvZA==
X-Received: by 2002:a05:6102:e8b:b0:356:5222:e574 with SMTP id
 l11-20020a0561020e8b00b003565222e574mr26881795vst.62.1657229427796; 
 Thu, 07 Jul 2022 14:30:27 -0700 (PDT)
Received: from balboa.ibmuc.com (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 66-20020a1f1745000000b0036bfe74006esm12122103vkx.31.2022.07.07.14.30.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 14:30:27 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v3 4/4] target/ppc: exit(1) on failure in
 kvmppc_get_clockfreq()
Date: Thu,  7 Jul 2022 18:30:15 -0300
Message-Id: <20220707213015.552104-5-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220707213015.552104-1-danielhb413@gmail.com>
References: <20220707213015.552104-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2c;
 envelope-from=danielhb413@gmail.com; helo=mail-vs1-xe2c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

When running under KVM accel it is expected to have 'clock-frequency' in
the DT. Not having this attribute is too risky for both the machine
emulation and userspace.

We have a way of telling whether this error scenario might happen or not
via kvmppc_read_int_cpu_dt() now being able to report errors. From now
on, when running KVM, we will assume that 'clock-frequency' will always
be present in the DT.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/kvm.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index 37a312288d..14faa14da3 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -1945,9 +1945,24 @@ static uint64_t kvmppc_read_int_cpu_dt(const char *propname, Error **errp)
     return kvmppc_read_int_dt(tmp, errp);
 }
 
+/*
+ * Read the clock-frequency from the DT. On error (e.g.
+ * 'clock-frequency' is not present in the DT) will
+ * report an error and exit(1).
+ */
 uint64_t kvmppc_get_clockfreq(void)
 {
-    return kvmppc_read_int_cpu_dt("clock-frequency", NULL);
+    Error *local_err = NULL;
+    int ret;
+
+    ret = kvmppc_read_int_cpu_dt("clock-frequency", &local_err);
+
+    if (local_err) {
+        error_report_err(local_err);
+        exit(1);
+    }
+
+    return ret;
 }
 
 static int kvmppc_get_dec_bits(void)
-- 
2.36.1


