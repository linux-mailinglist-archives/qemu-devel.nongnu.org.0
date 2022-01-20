Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5FE49517A
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 16:29:52 +0100 (CET)
Received: from localhost ([::1]:36982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAZNm-00019O-UN
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 10:29:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nAVjq-0007MN-Sy; Thu, 20 Jan 2022 06:36:24 -0500
Received: from [2a00:1450:4864:20::32a] (port=38728
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nAVjo-0001qF-6E; Thu, 20 Jan 2022 06:36:22 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 ay14-20020a05600c1e0e00b0034d7bef1b5dso14515380wmb.3; 
 Thu, 20 Jan 2022 03:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NPHfXnowRQD2+TFf0g2fYmXJjkrHfOL9fmenURj2Zdw=;
 b=oKpz4hMCMyzM0Zqxgb5Z9EpFGQi76RwoBkdwnewJvqsXAiPPl5G5jDs+a755adAbey
 L9f8p7vA7Qgve2BUaP0QNbplqjApTITwgAn+1Pi0GfXOxGhmLxC3TnWRk6mFojtLhsq/
 sEQ4zgD+2afNIMWj2d5ahwidhPGpsDKZm3W88umrODNxnDePDCLIUpAD20DHAeOdT+Dw
 L79V5M/0ARZr/aMTcLHsGl2xZgxN/Z2HnavU5e0ltU+zxdXEUN4ZV9qXBl4G0BbDyxeP
 Q36rHdg+BjL0+h34aX/+KOEY2//WJZp7isHTMbbY/P1vcVKzAKrReb2AE36uVOPTnMl4
 iRIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=NPHfXnowRQD2+TFf0g2fYmXJjkrHfOL9fmenURj2Zdw=;
 b=TerjCzE9AV2AikgFIogP6tvJlR9S1bxR4p8bcy2MFtHHaSsP9oZ9CEKNgGVv79P5GZ
 d0uvXNW6LY7dK0eKumFbYXeRO1BXIUTp12LwAFuSUrPg6jK2wcVzim2vrEdojkssNOsH
 BXDlLWU1zWJc8GMSw/EubXlB+4eovHDYQOBGZMvuAQPT0LNqdNNExZrfiXsQi2ZcJGjG
 do/Y5SQcwCVO21M5/9S1ojgLXUfHjIFCYOJvJOwE/PbAANYXQY7Dih9ua51UVyAXAVuj
 wCnms5Ugb4f+lZsU27a7why2GWWpPH21FhQd2FiaFKZsL2EV1/nmloMMggCcr576DXQP
 RtkA==
X-Gm-Message-State: AOAM530snwhGha5SkpIM019VaCOD5fSSiDoOvPJCLCW3hgudvcZKDI6e
 x0fojrBq+pVMUPs9MoIDyCx0F+pPRgo=
X-Google-Smtp-Source: ABdhPJyi9lEgQiSH0LSUWS5+jaylxcnxDdPhJW/LOteiO2WwWdX5y3zOwxi2Mz4vRMqI1flE2Aw3Ig==
X-Received: by 2002:adf:cd92:: with SMTP id q18mr33183136wrj.705.1642678569386; 
 Thu, 20 Jan 2022 03:36:09 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id w8sm2653423wrq.3.2022.01.20.03.36.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 03:36:09 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/4] qemu-iotests: require at least an argument to
 check-block.sh
Date: Thu, 20 Jan 2022 12:36:02 +0100
Message-Id: <20220120113603.276144-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220120113603.276144-1-pbonzini@redhat.com>
References: <20220120113603.276144-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: thuth@redhat.com, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is anyway how check-block.sh is used in practice, and by removing the
list of formats in the script we avoid duplication between meson.build
and check-block.sh.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/check-block.sh | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/tests/check-block.sh b/tests/check-block.sh
index 9afeea5275..88e02453d2 100755
--- a/tests/check-block.sh
+++ b/tests/check-block.sh
@@ -1,19 +1,16 @@
 #!/bin/sh
 
-# Honor the SPEED environment variable, just like we do it for "meson test"
-if [ "$SPEED" = "slow" ]; then
-    format_list="raw qcow2"
-    group=
-elif [ "$SPEED" = "thorough" ]; then
-    format_list="raw qcow2 qed vmdk vpc"
-    group=
-else
-    format_list=qcow2
-    group="-g auto"
+if [ "$#" -eq 0 ]; then
+    echo "Usage: $0 fmt..." >&2
+    exit 99
 fi
 
-if [ "$#" -ne 0 ]; then
-    format_list="$@"
+# Honor the SPEED environment variable, just like we do it for "meson test"
+format_list="$@"
+if [ "$SPEED" = "slow" ] || [ "$SPEED" = "thorough" ]; then
+    group=
+else
+    group="-g auto"
 fi
 
 skip() {
-- 
2.33.1



