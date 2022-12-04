Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F00F641A0D
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Dec 2022 01:05:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p1cU1-00043V-Eq; Sat, 03 Dec 2022 19:03:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p1cTy-00043G-5Q
 for qemu-devel@nongnu.org; Sat, 03 Dec 2022 19:03:46 -0500
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p1cTw-0008R1-Iq
 for qemu-devel@nongnu.org; Sat, 03 Dec 2022 19:03:45 -0500
Received: by mail-oi1-x230.google.com with SMTP id n186so9119211oih.7
 for <qemu-devel@nongnu.org>; Sat, 03 Dec 2022 16:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vNjsgcAi1s+qqB/0T1CtW2U318zYlBY2r650cvBjAws=;
 b=YJyBY4hhthneoUA/sEbvqMBiPNbszGCYnqohPVR3+JHF4gDkm+4+OipAKqCQKTkHp2
 jc8ZOEKpPhCzoesO2xHCxhNtH8StfWWc2gnQljwRb213wA7Iu5A0iNsYef8WOtQ4Yu8l
 O7vcY2tY8uaKFwcQ4y1Jfs3PvJTkFfIWKKBtmHMytVZstLzMGuVbLZz5GIW78RnltG+b
 wZjkgLhjzSce4DlyCE0TOszhbbt/GxaxcMvZp6tqLG2vZrUDn0/NjuPH0eUFtgaM0kMR
 dA8vqoKECGBzN0t+enu8GMt8px/70xt2l3sud7Nvr+rhfQ2jmw1C3X32vmBR6hcEUY3A
 a+XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vNjsgcAi1s+qqB/0T1CtW2U318zYlBY2r650cvBjAws=;
 b=quD1iTNaAPfqxSBU1DNJuRvY8G2V/N4U+K/AvEa22Vn+9xXkNRmXXds1RdbBe6DbGV
 IiRcHVYwMsjGLo7WJl+0Lom3KcbT+btcL12jXhZztdW8ttFzDFfXBjN5zap7SZFPP1l1
 MJUxSe/ISPOT4ighANQls/SiQNeh74mq+VgzoDSan6bmB3JVGRHmaKEbnc2ID5exFIDt
 o9unf0o9/htcXTdxuJ2GDQbKipyeaPyIiXzp46aRT253pmE1BUeN0KpkWWt3m8jkLE7V
 ITHxyhSyvyr/Aegmh6gXgQfDRG7CQI4H3Jvgq0mmRJiXNUJ5xt55alPfknf58V0kz96N
 5XRQ==
X-Gm-Message-State: ANoB5pnD3JLkgTXLqFuyHF8YZEjc3uYAasRCbTahVvMy+sKplzvulD7i
 EaoLF4xNgCQHuFsPRBTF76dFnHz+4RoLarxy8cY=
X-Google-Smtp-Source: AA0mqf6Z6+ajCYHCiHOZYuxtKgnoXkdd7Vu6dGcysTC0pZJIXGqCMaMMcKS1M+ZM7/rBSIL/O5f3Lg==
X-Received: by 2002:a05:6808:193:b0:35b:c0ea:b59b with SMTP id
 w19-20020a056808019300b0035bc0eab59bmr11984545oic.32.1670112222713; 
 Sat, 03 Dec 2022 16:03:42 -0800 (PST)
Received: from stoup.. ([2806:102e:18:70b5:750e:f543:b9a7:14ad])
 by smtp.gmail.com with ESMTPSA id
 bh8-20020a056830380800b006621427ecc7sm5277401otb.60.2022.12.03.16.03.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Dec 2022 16:03:42 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
Subject: [PATCH] configure: Add --enable-lto
Date: Sat,  3 Dec 2022 18:03:40 -0600
Message-Id: <20221204000340.282718-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x230.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Separately control b_lto without --enable-cfi.
Also add --disable-lto for completeness.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 configure | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/configure b/configure
index 26c7bc5154..d9c9babfc3 100755
--- a/configure
+++ b/configure
@@ -301,6 +301,7 @@ fdt="auto"
 # 2. Automatically enable/disable other options
 tcg="auto"
 cfi="false"
+lto="true"
 
 # parse CC options second
 for opt do
@@ -837,12 +838,14 @@ for opt do
   ;;
   --disable-safe-stack) safe_stack="no"
   ;;
-  --enable-cfi)
-      cfi="true";
-      meson_option_add -Db_lto=true
+  --enable-cfi) cfi="true" lto="true"
   ;;
   --disable-cfi) cfi="false"
   ;;
+  --enable-lto) lto="true"
+  ;;
+  --disable-lto) lto="false"
+  ;;
   --disable-fdt) fdt="disabled"
   ;;
   --enable-fdt) fdt="enabled"
@@ -2591,6 +2594,7 @@ if test "$skip_meson" = no; then
   test "$default_feature" = no && meson_option_add -Dauto_features=disabled
   test "$pie" = no && meson_option_add -Db_pie=false
   test "$werror" = yes && meson_option_add -Dwerror=true
+  test "$lto" = true && meson_option_add "-Db_lto=true"
 
   # QEMU options
   test "$cfi" != false && meson_option_add "-Dcfi=$cfi"
-- 
2.34.1


