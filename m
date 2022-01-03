Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D08D48364B
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 18:40:50 +0100 (CET)
Received: from localhost ([::1]:33846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4RKD-0006Tp-4b
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 12:40:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n4RDD-0004gf-UE
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 12:33:36 -0500
Received: from [2607:f8b0:4864:20::1029] (port=41827
 helo=mail-pj1-x1029.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n4RD8-00088r-1L
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 12:33:35 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 b1-20020a17090a990100b001b14bd47532so456323pjp.0
 for <qemu-devel@nongnu.org>; Mon, 03 Jan 2022 09:33:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6qDMOLWgWfCZR+6HLA+1KBnQYln9LrfklhmxozHAFZM=;
 b=O1Dry9EmAjKFh9HmB6f89wLFrVUJ3F4VITWSofLq3780kQDPNVA6zsFP8NyEznHh1L
 YKw9bB+t4oC9zQb3miRB2DNdwCzdbTldP/m5+LJe3KhrAXpjQnpCAMzW3jUAx6+4njwD
 BdTBaKwSq9JHE5rSwPna78ddJUkJmNg0FV16PhUfiL139mF/ZONA5++jBNKZZ7je163y
 Id2VHTuHQF3lmvBCyqqNSU1ghkS0bPt8qC8r2rhhSllrwyWQLKbfn4DlUWaKM+EYdP84
 0rd//vhR0Ite15JG5Fogs9RWjTJVnTZSXzXWICR9ZGEgeJhbeiO/eICeGZC5hM51m4rD
 i74w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6qDMOLWgWfCZR+6HLA+1KBnQYln9LrfklhmxozHAFZM=;
 b=fvwIJMx6W+PW2AAQikEr71brP2DYb89w16Vgi9NBoRMDDuPlM71maEKiPk7o29xaiQ
 zghqjCGlvLPIlG0tnjkNen10ehiKm1qhJ6CHo8ijGKGWPcfECHu9oxwu/HYeetAqESBW
 JTOxSu3H4saNVFm8YPRqepLDmnI0EC4zRFxrbzjy5wN88Vq/f2FBn87qnIU3NjePsc0E
 1HN12lafjBAULOfcQLcSPC0up0GI1bPcT3lYxoNyLOjLlPpsvlyXlrcHWRSb95BcVKR6
 2HM/4qSbhGAMJ4I0SEcVY61L5wUrohqM0F2tPT8Lv46lykNIwUMf0q5MFHxCWwltEvdz
 yqQA==
X-Gm-Message-State: AOAM533eP5U37CewQmWNGG+eAPLG1VPYdG7P1iibebHzfe7ilqr7GyT5
 PXCj13d6M3ae3Mohf+Nx8npHk63CMbBv9A==
X-Google-Smtp-Source: ABdhPJwcqfycB7K0Tb/AOsJXle/Xz3DwX6nOZdb3gm/nC4Fj2gt6pH+Ab2zSGOC3EhqyR91kh9lRNw==
X-Received: by 2002:a17:902:b718:b0:143:72b7:409e with SMTP id
 d24-20020a170902b71800b0014372b7409emr46423130pls.28.1641231208390; 
 Mon, 03 Jan 2022 09:33:28 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id s14sm39348564pfk.171.2022.01.03.09.33.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 09:33:28 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 2/5] tests/tcg: Use $cpu in configure.sh
Date: Mon,  3 Jan 2022 09:33:23 -0800
Message-Id: <20220103173326.257152-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220103173326.257152-1-richard.henderson@linaro.org>
References: <20220103173326.257152-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1029
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: 10
X-Spam_score: 1.0
X-Spam_bar: +
X-Spam_report: (1.0 / 5.0 requ) DKIM_INVALID=0.1, DKIM_SIGNED=0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use $cpu instead of $ARCH, which has been removed from
the top-level configure.

Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Fixes: 823eb013452e ("configure, meson: move ARCH to meson.build")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 configure              | 2 +-
 tests/tcg/configure.sh | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index eb977e5b6f..030728d11e 100755
--- a/configure
+++ b/configure
@@ -3821,7 +3821,7 @@ done
 (for i in $cross_cc_vars; do
   export $i
 done
-export target_list source_path use_containers ARCH
+export target_list source_path use_containers cpu
 $source_path/tests/tcg/configure.sh)
 
 # temporary config to build submodules
diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index 9ef913df5b..8eb4287c84 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -326,7 +326,7 @@ for target in $target_list; do
   elif test $got_cross_cc = no && test "$container" != no && \
           test -n "$container_image"; then
       for host in $container_hosts; do
-          if test "$host" = "$ARCH"; then
+          if test "$host" = "$cpu"; then
               echo "DOCKER_IMAGE=$container_image" >> $config_target_mak
               echo "DOCKER_CROSS_CC_GUEST=$container_cross_cc" >> \
                    $config_target_mak
-- 
2.25.1


