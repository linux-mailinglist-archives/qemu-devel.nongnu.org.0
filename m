Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9B547F136
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Dec 2021 22:22:40 +0100 (CET)
Received: from localhost ([::1]:41090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0s1O-0004hd-Mq
	for lists+qemu-devel@lfdr.de; Fri, 24 Dec 2021 16:22:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n0s0B-0003bk-72
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 16:21:24 -0500
Received: from [2607:f8b0:4864:20::531] (port=44738
 helo=mail-pg1-x531.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n0s09-00042x-KE
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 16:21:22 -0500
Received: by mail-pg1-x531.google.com with SMTP id m15so8419572pgu.11
 for <qemu-devel@nongnu.org>; Fri, 24 Dec 2021 13:21:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4j8iJ6x2JwrdxdzFiVSALfDzAA5Vx5rvZD7tSdQG6kY=;
 b=YoDypSXsxV8FnV4DIcRDk5C9V+tW+fqP6lhtpZ9sXjDLF3IH0/26wtaYeu/NsAKar3
 biOq9MHo5UuMflbSyWL7+WMX2XkyxdDGkAwqx2sU2x+gVxl2Lgx6Uq+OjsAlHCT3sx2H
 duaDeXdw/cl2Cl6+9c4Gkgk7S1NjbU6Yd/hvPXpQcCp2UQMoFziezyy7pkGNr4lDa2Zx
 cIBUw1UtmNMdLUVjUBkCxRzW8P09TPxQco3LMaKRRhzi6GhbwUClF5DBdfnrA1Q5VKkY
 0fXykAL7qeNLPXV5+2jw0uHiOKEHyxBh0aivdrtjYs7MgAoMgeIB2X4MeAJKpPqzbuFj
 HsWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4j8iJ6x2JwrdxdzFiVSALfDzAA5Vx5rvZD7tSdQG6kY=;
 b=hCf34/u+eKe6qLK16AKF1FGI7rbrBtvQHhL/aMbtHpJvYD6CoOvMygnIqI7q375XwC
 dxto6H4ptuWaXSqfk6wDgoNOdUe8Z+c5VqUYrqwbKlASvgnGIBmYnwPsCXEBNTD6JYL4
 13BWrJ7XwPJdty8yGju56xpzOUhBwPaVE4Qs3uyrvc7D3+Qb5B8v5eIL5B4JV1cWIlYF
 O9Bd8phXImgcmRR2ZiVhCwkqZoQXfUtnPS4ff3q27H5WsCevfFrPJ4t2mPqs58bqSjFS
 c2Q3i3Q5aAjqzkJLbYNdndaMys3NhhlPueyaPLlInEJAnqQ9WBgTlJHInygLL9UXIDtF
 vNzA==
X-Gm-Message-State: AOAM532UJnpjBxYCJIx1lMt/OWFlhXWf/rTASFiQlvDL7AzMaNhPdgh9
 Kp2anfO80/oqUPNIQnoEJUydNsl8PQ6qYg==
X-Google-Smtp-Source: ABdhPJyEg3VcvHfhoolPsDY/n7Y/4ziLXylPl4oOKXGS6ElsU4vLQ6O8qxzk8vhCGRC0YMEvzwiIzg==
X-Received: by 2002:a63:fd53:: with SMTP id m19mr7259983pgj.563.1640380879547; 
 Fri, 24 Dec 2021 13:21:19 -0800 (PST)
Received: from localhost.localdomain ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id o22sm8974630pfu.89.2021.12.24.13.21.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Dec 2021 13:21:19 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] tests/tcg: Use $cpu in configure.sh
Date: Fri, 24 Dec 2021 13:21:17 -0800
Message-Id: <20211224212117.2404218-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::531
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: pbonzini@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use $cpu instead of $ARCH, which has been removed from
the top-level configure.

Fixes: 823eb013452e
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


