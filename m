Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F120530715D
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 09:26:34 +0100 (CET)
Received: from localhost ([::1]:33274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l52dN-0007My-OP
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 03:26:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l52ad-0005dR-IA
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 03:23:44 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:35589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l52aZ-0005bs-DM
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 03:23:42 -0500
Received: by mail-pg1-x531.google.com with SMTP id t25so3812129pga.2
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 00:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XE0PhE5jrT77dVnaZXiyTjuegsVetoGaec703uiwX/s=;
 b=N1SwYG/oksao/5xB/+4AXH5ce18FwdUZuyjIokVm3/Uk5Nf0oc3Ie7cQUaSlxytBxq
 cRV9ccl8wOtwhnvqSB2cFtC3Fyjg4GV2VTsBSgM27FqFHyE1zsjJnZhvsCRu5yIYnU42
 uNoEDxvX1Nmy2D7/vy5Yr7XiJXPZSaSW9qjCh5Hg4YfPBt3mxKU2i4dEOR78mnYXc4Hf
 ObKxjWwJK+m2eG+KBUtDa+ccemn4iNt2MAFr2hjcGEGi/VcSnwhKdc/0ZxLifk8Db2bs
 M30Wo3nZsqUmgjSBxO3XYZ5KHQpJsG5jnbrZGjr1M1MjiW40rjZVUZ5G4F0FHYhYBRAS
 2dJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XE0PhE5jrT77dVnaZXiyTjuegsVetoGaec703uiwX/s=;
 b=m0aFFtLgKq6Ei1Q7le6O2AOcahnSo5kOz1a3Fr8SSLGwt2BKddBPJXRUJXyKjfulAK
 67HF+DyQ6GgzBNjebHW09zPoJj4cczoVnM3eRBEtGkFV126FRt2RJkO5rXg5+6sjYMco
 EnWglyjjWz2iO/XtQf0OIT69GPw4hyzTkqYu7qOfgaoPXnEJjRF9/MEc5za07PiDB7It
 qYPhgBIyG6sf6QPl/0N9OExsLnNVSlbrDeVXqsMxod2IRPgJ9sTgsJtV0paKdHOfAPGo
 w3lKyTh+ttEw18WGOmsx3x1LJ3XPx4LgAx6Z7ZMIvZbx4Xpsq51KXf6VOpf84N1F0DS6
 Jizw==
X-Gm-Message-State: AOAM533eF6j7T1/Y+Od3RduUiLWKb6ge7POjXa7PiLMQiwMhh1xtLYSB
 TjM7y68KTDzatdQN2kznyNGUi5bIifjq7LC7
X-Google-Smtp-Source: ABdhPJwBvO/r08FozQW3sJhH2LKQHv4BE71BUXuDhX7CPaX9B9aD4kp4Mge+myx/VAaAaADVkqFBQA==
X-Received: by 2002:a62:ed01:0:b029:1c8:c6c:16f0 with SMTP id
 u1-20020a62ed010000b02901c80c6c16f0mr5203087pfh.80.1611822216199; 
 Thu, 28 Jan 2021 00:23:36 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id s24sm4658292pfd.118.2021.01.28.00.23.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 00:23:35 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/23] configure: Fix --enable-tcg-interpreter
Date: Wed, 27 Jan 2021 22:23:09 -1000
Message-Id: <20210128082331.196801-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210128082331.196801-1-richard.henderson@linaro.org>
References: <20210128082331.196801-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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
Cc: sw@weilnetz.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The configure option was backward, and we failed to
pass the value on to meson.

Fixes: 23a77b2d18b
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 configure | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

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
 
-- 
2.25.1


