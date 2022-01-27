Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AFAE49E12E
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 12:34:38 +0100 (CET)
Received: from localhost ([::1]:33606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD32z-0004nM-48
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 06:34:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nD2fz-0006mz-RG
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 06:10:54 -0500
Received: from [2a00:1450:4864:20::42a] (port=45767
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nD2fy-00069h-6y
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 06:10:51 -0500
Received: by mail-wr1-x42a.google.com with SMTP id m14so3835262wrg.12
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 03:10:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ttURzTalLkLajQUhATr7fk42UhO1pdqdls5RkRt15E4=;
 b=Q4v0kRAbAbFziQiLU5C9pT819EYpA2icEWmA072ofrw4f3KL0BDymaEDsVHdv/GjzC
 BNjydgYz9kC8/HxaXzIf9TJaJnBHXkUO+Pl3TlMAlUVPAnLn/25HbYJ0NXHZVKdymqbq
 nTG5YGhWWEQb5115qMfaNkDQ+b+7bUfOjpAROBs+Tl5fiLL0ns8ETwBjRwFowmWj7Mh8
 rP/m4ZvmrArSrGQOAjWCbYhf/9/tUW5FQJrURO/9ikUwrIU7+RBVEi6Z7y1lcBPei/eG
 eK3isA2cdcWR6/tWRSzUl+JdSDwMQzW+60CKsQKZ9MQq7WkZDOseNFM0q0RY8WO3Kps2
 EKFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ttURzTalLkLajQUhATr7fk42UhO1pdqdls5RkRt15E4=;
 b=mrxEH7lo+OBYedD2cigNsSo0iwTWd+ZxSwH2skcowzBddDGvq82Jg+umxp4inNb6jm
 E0LtGYUD1v0ZXb4FLo97YkrMcTzj03tpuqEBmM010242I69nckukC/atgMwiMaH8dXoA
 PHcXLTfS1VR/VNZcqq4gemSLsNkhk1+z8k+s7uzBBPjireXf6gIPuq/8Yeosu6iGP0oS
 EmT+VxATnDc/c7tEELKFx7fTvt+LlxNl59RnDW53dNl4gxxIV0dNyRqyr95JB0YKSeMJ
 mwzFpwAhbabGfz3uuoMJG8u/6c74i2JvWDfBSB/8TLCMOFeGDlhbR1rfLmMle75Z2pl1
 otXw==
X-Gm-Message-State: AOAM533SJbM2jeBBJCqQDRWW+pWHQyOUD9HXUpwHJjf1hYoiaTuIw/Hp
 dYiiRudC3WBYzop2CoIK5WXz39Nnrrw=
X-Google-Smtp-Source: ABdhPJwRNaEh3xm9MoJakuUgp0CjlJP0naWCohKAD9QxnY7L+JSUxSUQY8KRF47RuQxP8Jvh0z7B+w==
X-Received: by 2002:a5d:5552:: with SMTP id g18mr2648578wrw.343.1643281847672; 
 Thu, 27 Jan 2022 03:10:47 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id s17sm1825742wrm.62.2022.01.27.03.10.47
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 03:10:47 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/14] qemu-iotests: require at least an argument to
 check-block.sh
Date: Thu, 27 Jan 2022 12:10:34 +0100
Message-Id: <20220127111037.457901-12-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220127111037.457901-1-pbonzini@redhat.com>
References: <20220127111037.457901-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
2.34.1



