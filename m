Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38ABC38E089
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 06:58:05 +0200 (CEST)
Received: from localhost ([::1]:57938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ll2fD-0000Gj-3G
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 00:58:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yamamoto@midokura.com>)
 id 1ll2cT-0002ix-F0
 for qemu-devel@nongnu.org; Mon, 24 May 2021 00:55:13 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:46022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yamamoto@midokura.com>)
 id 1ll2cR-0003bF-Qz
 for qemu-devel@nongnu.org; Mon, 24 May 2021 00:55:13 -0400
Received: by mail-pf1-x42c.google.com with SMTP id d16so19831534pfn.12
 for <qemu-devel@nongnu.org>; Sun, 23 May 2021 21:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=midokura.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OjEvdBCaEtLFXNObt2sjDlAUMq69u4KYkjfRSX5e7ww=;
 b=bw77HFJEdVpxj5YK5BwJ9cO8b1B+215dFODgfuwmqMqRqNt6O1TMp2KMKVmV3Og5IQ
 1nyqGtKAH0dahrIrY/gKZKyoyhBvycYZpmb34YDB3n2U0bluCQgk3w6MJVf56vDUNaMX
 GWk1PCYFtuAvTLCZuYuB8IIaK00feAgapobbI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OjEvdBCaEtLFXNObt2sjDlAUMq69u4KYkjfRSX5e7ww=;
 b=PNIeCZcTVkSo7Oi6QvSrr5VrjvNMqcODM/dpqd9TFYgznkfBL1WfCge26bXNB5Dsuh
 EFN29xwHigY7XDiGplBeUNdbpok0Om1U7aLOVKXgAIKHAXMuwhv2+J4Ker99MDcARYYu
 H4GxS+9v81ImHgg16r/bH1EyXuZ5ckbtL4s5Ux773q0S0jUucxW8bxqDw3f+e8aXb1FL
 H6UNrw2n0pk4ffyHIjZuFH8WRzECadHE37mSN/reVrAt9Ml4YKsEIwgjH7UiWzhW2Aut
 YBSHMNTr3i5YEPGpq9eXnaygBGMbHImPrHNHSjfSJFLiEgPrgRx1HbBVEkLQngo1Rq2L
 JLHA==
X-Gm-Message-State: AOAM533hIEVNlyD5xfkc1SzffLrrgJoSPKY8Ls8PLjx0Z2ONdS6S+/Is
 U73+xM67f+lnr+p8YHaooS10rdGKkYIoyg==
X-Google-Smtp-Source: ABdhPJx1dCaEMY75gNn39FuUOhZ/OttWumVmj//cNq2s3MYMSuGLof5LcT8UOyma5UjtSQeCjtof8Q==
X-Received: by 2002:a65:53c8:: with SMTP id z8mr11700527pgr.192.1621832110444; 
 Sun, 23 May 2021 21:55:10 -0700 (PDT)
Received: from spacetanuki.lan ([202.12.244.32])
 by smtp.gmail.com with ESMTPSA id 24sm10040142pgz.77.2021.05.23.21.55.09
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 23 May 2021 21:55:10 -0700 (PDT)
From: YAMAMOTO Takashi <yamamoto@midokura.com>
To: qemu-devel@nongnu.org
Cc: YAMAMOTO Takashi <yamamoto@midokura.com>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH 2/5] linux-uesr: make exec_path realpath
Date: Mon, 24 May 2021 13:54:08 +0900
Message-Id: <20210524045412.15152-3-yamamoto@midokura.com>
X-Mailer: git-send-email 2.21.1 (Apple Git-122.3)
In-Reply-To: <20210524045412.15152-1-yamamoto@midokura.com>
References: <20210524045412.15152-1-yamamoto@midokura.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=yamamoto@midokura.com; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Otherwise, it can be easily fooled by the user app using chdir().

Signed-off-by: YAMAMOTO Takashi <yamamoto@midokura.com>
---
 linux-user/main.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/linux-user/main.c b/linux-user/main.c
index 4dfc47ad3b..1f9f4e3820 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -55,6 +55,7 @@
 #endif
 
 char *exec_path;
+char exec_path_store[PATH_MAX];
 
 int singlestep;
 static const char *argv0;
@@ -610,7 +611,10 @@ static int parse_args(int argc, char **argv)
         exit(EXIT_FAILURE);
     }
 
-    exec_path = argv[optind];
+    exec_path = realpath(argv[optind], exec_path_store);
+    if (exec_path == NULL) {
+        exec_path = argv[optind];
+    }
 
     return optind;
 }
-- 
2.21.1 (Apple Git-122.3)


