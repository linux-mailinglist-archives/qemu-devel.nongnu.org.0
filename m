Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3AFE508FEE
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 21:04:48 +0200 (CEST)
Received: from localhost ([::1]:37374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhFd9-000633-T3
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 15:04:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nhEqn-0008G9-7V
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:14:50 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:37667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nhEqk-0002KI-AN
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:14:48 -0400
Received: by mail-wr1-x42a.google.com with SMTP id z5so1720724wre.4
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 11:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SR8wnW1ttFIce2a4dNkKsdm/Meaa02wum2aQoe3NWus=;
 b=aeByVqRxNdW9xBaaoC7rbQAZyT/T05kRq+mnGiFS146iqk7b2oGOy0B0ovE80lCWOo
 Z2ApnY6S9dvcizlnAfshRAvSVEn1VAGPsRSIfeobpIwURdJRvGduGNZSZnHcytISW6Jo
 l5k6CmduBmNTe+DxstYDqC0jdMzUqib1Mg7ehnHiiOZrjIwr0Kz2rbD/6VZjSQolgDDU
 aUIqbDCAkkj18vPfuHjDTHnDDWTljGtwtAcXXS8T5NSz/knuaAn1QGrK19losT/v59LL
 nVlpxL/qiB3S+iUSHDWx9Bhu9uELi8iE32XBfu3Awjues1/W6+Vl/ffXFRoPo98NdMrj
 pViQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SR8wnW1ttFIce2a4dNkKsdm/Meaa02wum2aQoe3NWus=;
 b=SpWpgLeyVmGBunC5IPTsqOb+vzxDVIK5IpozzR1L9Pj41oBk/Zj36BLeMFBEr/3yqL
 IhVDzReEES4Hd+rBjBWqKRO4lO3r3W9M0+VW209rd99tjv70errIH1IekrjbcuXLqLfQ
 zjLv+nWWz0shT+H/Zzz/7rpkATf3iZAuvdyq1dM4/f6hQD4uJ1cyFbiQLfjAZQIS0LUI
 HRLI7ZqgvOYdCscLzUzq0XGs+FMklcJSLlSXrLMynhGeNGj7N1BugxyTN5KD/D3n/w4R
 sfxvyFCOc+5yjaCpwU9GuTOnl0lA6SJa2XU1YRjbUQV3WfjNIUOFDjTrc1Xd794Zoirj
 D1Cg==
X-Gm-Message-State: AOAM5308Nr3t3pc4VkbSih1wbDDVVIr7BcCKXIIfL3FClZx4nDrv3Fch
 hk+94T8epo7qLbIayiOiwErG2g==
X-Google-Smtp-Source: ABdhPJziskvARFm+UY2Vinh3v3+9QHkbth4z7sPJIwOeFWWTGF5pVZnSIwpxYCNsMF3E2ca59np1Pg==
X-Received: by 2002:a5d:6b11:0:b0:20a:a247:25f4 with SMTP id
 v17-20020a5d6b11000000b0020aa24725f4mr8684285wrw.234.1650478484642; 
 Wed, 20 Apr 2022 11:14:44 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 o40-20020a05600c512800b0038ebf2858cbsm95523wms.16.2022.04.20.11.14.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 11:14:43 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 08B621FFCC;
 Wed, 20 Apr 2022 19:08:34 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Subject: [PULL 20/25] tests/tcg: fix non-static build
Date: Wed, 20 Apr 2022 19:08:27 +0100
Message-Id: <20220420180832.3812543-21-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220420180832.3812543-1-alex.bennee@linaro.org>
References: <20220420180832.3812543-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

If linking with -static fails at configure time, -static should not be used
at build time either. Do not include BUILD_STATIC in $config_target_mak.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220401141326.1244422-18-pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220419091020.3008144-21-alex.bennee@linaro.org>

diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index 75603fee6d..691d90abac 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -261,7 +261,6 @@ for target in $target_list; do
                   if do_compiler "$target_compiler" $target_compiler_cflags \
                                  -o $TMPE $TMPC ; then
                       got_cross_cc=yes
-                      echo "BUILD_STATIC=y" >> $config_target_mak
                       echo "CC=$target_compiler" >> $config_target_mak
                   fi
               else
-- 
2.30.2


