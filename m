Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A846048F9AA
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Jan 2022 23:26:47 +0100 (CET)
Received: from localhost ([::1]:38834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8rVW-0007lZ-QD
	for lists+qemu-devel@lfdr.de; Sat, 15 Jan 2022 17:26:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n8rR0-0000Kr-Bz; Sat, 15 Jan 2022 17:22:06 -0500
Received: from [2a00:1450:4864:20::330] (port=50916
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n8rQy-0000fO-6y; Sat, 15 Jan 2022 17:22:06 -0500
Received: by mail-wm1-x330.google.com with SMTP id w26so12865537wmi.0;
 Sat, 15 Jan 2022 14:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NPHfXnowRQD2+TFf0g2fYmXJjkrHfOL9fmenURj2Zdw=;
 b=XOVyJZ81s3d/nm+zzWqSgHNWcNIXy1w/PGgvbPHDlH5y+5YUVE5J0LGL9K4NrK1ea1
 LchfnesOFS93ALU01tMZNN2KSqxcgB4FcDqzMh9NQiCffrIzKq1qLinn/yqOWF142xBz
 3bWTTPWAXXAH+Bqcx1UtyDOXmwDIPQeZhR0lwfbOc4uPiPEBNAkXsHi9ZMhzmHf9zDD1
 oV39rG5O9s36ddhmrVAUaR9MGe7oE6ALfv3RZNyK8a3rAuKSPdw7afUx+1RYAJY88IVV
 8H2QmGB5hNOwa8ukicw/A793ibifKDfeonmOcKntaz9sDTmnJBYhxZD71Dio0oReOSbT
 LLcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=NPHfXnowRQD2+TFf0g2fYmXJjkrHfOL9fmenURj2Zdw=;
 b=nNhvxFpJU5cmafbtXHk2GymKqDVQ7GjjXgxxLCwf5i/Jss3gVQoaT0ep3ggHhDiY/9
 b6LYHby0MGxrVCKbkGNeWQnSPsHAtjUtLnrjFeN60Z5m1QdNuaIkYm9JfbbuSN3X/70W
 +7th7q35ENtuZJ+Srq96AxkkQsmjngsCldGTVDnPS8z0YMgudlRJpreOnDpZrmcZq/s4
 pBgN3y4+81+cO4wTeCY8sIrdWlrQcv36SNZL2A76E2OyQakE9Ro0BrqgkczhY242ulXP
 JUs3fmqE4+We+seRuvVDdzesFqA1FdexB2s1JQihsC8Ozmo79mSI/k9zUArHDWATBDQN
 hTjg==
X-Gm-Message-State: AOAM533uBLcE/xLpHjm7qzhlpU1GmvaRC64oKcr8I9/wJV41tOSFi7De
 VIk8hCSawH7kfDVX/Qzxap0s8Ku4W3U=
X-Google-Smtp-Source: ABdhPJz7mHTIxovRjJ05Uxvuyr8zO8BXDVpjC8YEoUYZmCexDi0ydH+IZI0H4WJbJR9TaYpKFUwHgw==
X-Received: by 2002:a05:6000:186e:: with SMTP id
 d14mr2857794wri.67.1642285322727; 
 Sat, 15 Jan 2022 14:22:02 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id s1sm8929616wrv.38.2022.01.15.14.22.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Jan 2022 14:22:02 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] qemu-iotests: require at least an argument to
 check-block.sh
Date: Sat, 15 Jan 2022 23:21:53 +0100
Message-Id: <20220115222154.341628-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220115222154.341628-1-pbonzini@redhat.com>
References: <20220115222154.341628-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x330.google.com
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
Cc: qemu-block@nongnu.org
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



