Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8B9508FCE
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 20:51:01 +0200 (CEST)
Received: from localhost ([::1]:53602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhFPo-0002wi-RT
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 14:51:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nhEl9-0002El-GU
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:09:00 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:43705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nhEl7-0001bD-St
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:08:59 -0400
Received: by mail-ej1-x62d.google.com with SMTP id g18so5146990ejc.10
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 11:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uSlazA8G4kVbD1gf7sQNA6CefjTyFXiwEGqaggukQQU=;
 b=DQYCT3uxR/ZAiuBtJhq6YXesaHu5cJHLF7ihJomb7S6qwXSBOz8I3AluF8EJtRWrjH
 MCaDzttEGaDD892OP54NURRFJZUyGwAvrt2buMVCKDaxfy8mTzsnw3HgVNdV74/bBTrv
 U3u8g+eCRFgKN5cUf3WaJ6q1iVoHMJOQe3iBJag9LInjrPduk8pEi3ZlFT7a5/QCc83q
 tT354THlKikv18M6Dyrflr2ZT4ZfeSASsriIDjK5OedKhfhatVr2woVzvfT8sEVGR9fb
 wQgZ/eAHXbKVj8bUrjyWFfmtg8D+sdchJ4efDe8XuGYeh1iL2HCoGQA6DAe3dy5T4RNl
 DMRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uSlazA8G4kVbD1gf7sQNA6CefjTyFXiwEGqaggukQQU=;
 b=zdThtNh7IxZgXeZjeWobxjWzJ3G+RhCuG387VOxNax01c9mNwfvZRhuN7Mi78RHcw0
 YywYqiVv/+3jhnjkoUwatO58kI5m9vVLBYG92ha4WVvkmdMeTES8LTqr/TZ6B065PU7C
 5o8WSJRpXzM0c9en1t9qzrnoHtnpsI8RVkOjdpSo5isSTLln8Ml2Ad7ljTiCzkS23MPe
 rmEYMELu9jT9Bo3x2k4yTdIFJbnxpTyVnGvWlOhusADLMcY+IuWkIbHgZ3yOvXCKc2IM
 sR+am0qh/T9fmjfphSGQTsQtmKNFqO6S2aGsIOcsotfcHyQan2fX5YVCyn0lu6bdNXyf
 UKTw==
X-Gm-Message-State: AOAM531YFp04VqOx09COnKun2oXJBS0s4l+1Bxls81FtGmZYN8vRRnlH
 bt0YQt9OTXFY/sVd6+kqL51V+Q==
X-Google-Smtp-Source: ABdhPJy6MW9Gf5UkvFNdgpxUZw2gzQlmPB86yHCDdIdlwjqtkXC9jyvOZUcNzw+QWqPkfTFYCFF3Gw==
X-Received: by 2002:a17:907:3e94:b0:6ef:f135:4b with SMTP id
 hs20-20020a1709073e9400b006eff135004bmr6529408ejc.609.1650478136599; 
 Wed, 20 Apr 2022 11:08:56 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 c3-20020a17090654c300b006e4e1a3e9d5sm7121368ejp.144.2022.04.20.11.08.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 11:08:49 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D70F31FFCA;
 Wed, 20 Apr 2022 19:08:33 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Subject: [PULL 18/25] tests/tcg: isolate from QEMU's config-host.mak
Date: Wed, 20 Apr 2022 19:08:25 +0100
Message-Id: <20220420180832.3812543-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220420180832.3812543-1-alex.bennee@linaro.org>
References: <20220420180832.3812543-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62d.google.com
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

Do not include variables for the QEMU's own compiler, as they
are not necessarily related to the cross compiler used for tests/tcg.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220401141326.1244422-16-pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220419091020.3008144-19-alex.bennee@linaro.org>

diff --git a/configure b/configure
index 7c08c18358..e8786d478e 100755
--- a/configure
+++ b/configure
@@ -2937,7 +2937,6 @@ echo "GENISOIMAGE=$genisoimage" >> $config_host_mak
 echo "MESON=$meson" >> $config_host_mak
 echo "NINJA=$ninja" >> $config_host_mak
 echo "CC=$cc" >> $config_host_mak
-echo "HOST_CC=$host_cc" >> $config_host_mak
 echo "AR=$ar" >> $config_host_mak
 echo "AS=$as" >> $config_host_mak
 echo "CCAS=$ccas" >> $config_host_mak
@@ -3057,7 +3056,7 @@ done
 (for i in $cross_cc_vars; do
   export $i
 done
-export target_list source_path use_containers cpu
+export target_list source_path use_containers cpu host_cc
 $source_path/tests/tcg/configure.sh)
 
 # temporary config to build submodules
diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target
index 95499d8c9b..f427a0304e 100644
--- a/tests/tcg/Makefile.target
+++ b/tests/tcg/Makefile.target
@@ -30,7 +30,7 @@
 #
 
 all:
--include ../../../config-host.mak
+-include ../config-host.mak
 -include ../config-$(TARGET).mak
 
 # Get semihosting definitions for user-mode emulation
@@ -77,7 +77,6 @@ EXTRA_TESTS=
 
 # Start with a blank slate, the build targets get to add stuff first
 CFLAGS=
-QEMU_CFLAGS=
 LDFLAGS=
 
 QEMU_OPTS=
diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index a577dd7ece..75603fee6d 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -83,6 +83,11 @@ fi
 makefile=tests/tcg/Makefile.prereqs
 echo "# Automatically generated by configure - do not modify" > $makefile
 
+config_host_mak=tests/tcg/config-host.mak
+echo "# Automatically generated by configure - do not modify" > $config_host_mak
+echo "SRC_PATH=$source_path" >> $config_host_mak
+echo "HOST_CC=$host_cc" >> $config_host_mak
+
 tcg_tests_targets=
 for target in $target_list; do
   arch=${target%%-*}
-- 
2.30.2


