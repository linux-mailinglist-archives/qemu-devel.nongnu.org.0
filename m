Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77CA3301EE0
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Jan 2021 22:12:55 +0100 (CET)
Received: from localhost ([::1]:44596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3mgo-0008SS-Iw
	for lists+qemu-devel@lfdr.de; Sun, 24 Jan 2021 16:12:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l3mfO-00081u-Dy
 for qemu-devel@nongnu.org; Sun, 24 Jan 2021 16:11:26 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:38629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l3mfM-0002mB-JU
 for qemu-devel@nongnu.org; Sun, 24 Jan 2021 16:11:26 -0500
Received: by mail-pj1-x1032.google.com with SMTP id l18so1154526pji.3
 for <qemu-devel@nongnu.org>; Sun, 24 Jan 2021 13:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/RSQ3V/mGVFfJd3fQbyzuIH+liARb33IsimbaXfV6O8=;
 b=LDm4QxZy4eIrq+zBQ33LgtsrafK7ePEjmbZX95Tf2eGkBEQyoKm6jTaaCo5h4Si13O
 JaTyZTM3ZRLW35QZkSAdv+15HYF5Mbhjn+yws6PBwinbwobByCIAhWbOQUCKmwJu1/gE
 HlLW2GaReW3BCO9F60UiurxhOQ9l+5mZJe6YVoc14wEuPVqLAE8HneZRitMYwV2dAEkU
 3+1c7yVODlUEXRbD2LZ7/Cy4lkl5qUcrfPzALdQ0e06/hmn4aAxx3eAqyl4LnkTsa916
 k2L2VD2RG/wwKc82y+4VEvfd4bwxsdalmbG62NTzH4CI9zmsQLBEWC+9Jtrj5oZDuime
 qF6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/RSQ3V/mGVFfJd3fQbyzuIH+liARb33IsimbaXfV6O8=;
 b=YByT+jGUbzuykf7dQxVa+s2xokP95aYQCx+QBUrDMlhDnFFzT/R34s7KrsINqjRUPJ
 6gL4naLFYFkVAGwViLec/9yAozgrtcwg4O1XQMZlFfpfG2klS0k6FRbQgheYr9r/yS/2
 4pqq0T1DEco53Cez7yIipByN7JHJLoQdbwASB6IMiSxE0278HjrXJ0e43F+wg7izARQ4
 wHymS/HTt5uK/hi43TOGBPBdVdke78iVpozWxTe52Jjya+Gd2y/l8SO2go4Qq8Wvjr7v
 te6NBy415XpmUeGXBe3tu7xMSivIQJu8dYQNiPbUomzUYRbV7DLb9kS3llS/80JkskZY
 qUog==
X-Gm-Message-State: AOAM531WKlgm+Livf0V4KOAYqv5IE7l7JS12ZPRsV0nQV0RqtnVOs3g0
 Jgr+tssVR4QRN/88MQ834IHDINx1b6qRGA==
X-Google-Smtp-Source: ABdhPJy7zcOZv4la+Dj8HmtobBEBB0mfNzqLTp2giglVTLfkDuWlkxAMK+Ir9t9MU7bZf1D6AC3KYw==
X-Received: by 2002:a17:90a:c257:: with SMTP id
 d23mr18369005pjx.190.1611522683001; 
 Sun, 24 Jan 2021 13:11:23 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id p1sm118912pfn.21.2021.01.24.13.11.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Jan 2021 13:11:22 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] configure: Fix --enable-tcg-interpreter
Date: Sun, 24 Jan 2021 11:11:19 -1000
Message-Id: <20210124211119.35563-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
Cc: pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The configure option was backward, and we failed to
pass the value on to meson.

Fixes: 23a77b2d18b
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 configure                | 5 +++--
 tcg/tci/tcg-target.c.inc | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/configure b/configure
index dcc5ea7d63..ad35e26168 100755
--- a/configure
+++ b/configure
@@ -1119,9 +1119,9 @@ for opt do
   ;;
   --enable-whpx) whpx="enabled"
   ;;
-  --disable-tcg-interpreter) tcg_interpreter="true"
+  --disable-tcg-interpreter) tcg_interpreter="false"
   ;;
-  --enable-tcg-interpreter) tcg_interpreter="false"
+  --enable-tcg-interpreter) tcg_interpreter="true"
   ;;
   --disable-cap-ng)  cap_ng="disabled"
   ;;
@@ -6374,6 +6374,7 @@ NINJA=$ninja $meson setup \
         -Dvhost_user_blk_server=$vhost_user_blk_server \
         -Dfuse=$fuse -Dfuse_lseek=$fuse_lseek -Dguest_agent_msi=$guest_agent_msi \
         $(if test "$default_features" = no; then echo "-Dauto_features=disabled"; fi) \
+	-Dtcg_interpreter=$tcg_interpreter \
         $cross_arg \
         "$PWD" "$source_path"
 
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 147c99e7e6..eb7ab1be7b 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -780,7 +780,7 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_add2_i64:
     case INDEX_op_sub2_i32:
     case INDEX_op_sub2_i64:
-        return C_O2_I4(r, r, 0, 1, re, re)
+        return C_O2_I4(r, r, 0, 1, re, re);
 
     case INDEX_op_setcond2_i32:
         return C_O1_I4(r, r, r, re, re);
-- 
2.25.1


