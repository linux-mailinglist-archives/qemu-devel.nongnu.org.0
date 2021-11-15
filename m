Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C87E1450711
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 15:33:38 +0100 (CET)
Received: from localhost ([::1]:59636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmd3B-0006vU-Tu
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 09:33:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mmcz8-0001De-VD
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 09:29:27 -0500
Received: from [2a00:1450:4864:20::429] (port=34344
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mmcz4-0004Mb-NX
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 09:29:26 -0500
Received: by mail-wr1-x429.google.com with SMTP id d5so31117274wrc.1
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 06:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KyWAPp1xuJA1TgR/nKiRs9GzqMMIIWAboE5PWMbSQ2g=;
 b=RDLre2ndy2SVTVDKA5yZwm4p7ZstDWAHXlg+gnnaAbhyC8prfjxsdVO17kQZnpNRKQ
 uaLcvjmyznd2iGzHOm9Xrqj/urNbSgtO0a6BbyBa95DbYe0jg6wnoNOFmjukpwdCDPbe
 k+bbbzHTrYZ1g6f4Eqh7yAyjY9b1MTeUAqA8y5ocTNFgkVMoiTXK3OJjGIa37LBYYiOK
 Wi/FaKN8PGDlpGzOU70gJdlAyh57UJ7AzMYNPExkKg7u0xBomh+9xD+5qQlqGZ0hlgnT
 WVck+M5JQJsyOFYIY9RwrHH/YrRjh6ng24Jb9+1pwhZONVZj7QFm0BDcbuWYt5C+e6r7
 NPYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KyWAPp1xuJA1TgR/nKiRs9GzqMMIIWAboE5PWMbSQ2g=;
 b=VmFO52h530lhpdIMN8h7SYB4yVHy+gAKWtruDnixkJZ5Ws4jKD0NyVYSpeO2i4OBap
 8cFIt6FK0uIUpsdqtOvA4EYdgedO2EkZ+mhBB/d500d/eYj2tAjcRGg7b4AXDCKMpSBa
 pM92ewCELHW9ioTv1NXptfzHuBTJYvbvzdCIHENTWB9Pa/SJig/rysB3XPFERzFVIOXy
 dRa1clZO4bt19UWjHRYguC0p8dfIejB5cSB9EG+y2H7QuQvT+WKTQCbAEVN1MFNXeIOF
 ETwC+q2PyJEGU8oRiHOkxkNNXAWc9CsniozDZygVk0fEbSzumOuGWI+cpgiweV61HuxW
 Sjeg==
X-Gm-Message-State: AOAM533PXGidRMKEjgxm+ACae1vGxyC8Eh+OeljS2d/S6T8gkVk/7yu1
 RyxigJOmmbfKaAHEcHGvZKwluPNZn0Q11g==
X-Google-Smtp-Source: ABdhPJwB46kdMxJGqXhB3VLIkD5uupFh6MvRw2PL+EZfRfBYQ/LVsbWfjnx95J2XppHaa3znbX88AQ==
X-Received: by 2002:adf:e882:: with SMTP id d2mr48183741wrm.389.1636986561295; 
 Mon, 15 Nov 2021 06:29:21 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 8sm12292077wmg.24.2021.11.15.06.29.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 06:29:17 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 372D31FF99;
 Mon, 15 Nov 2021 14:29:16 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 2/6] tests/vm: sort the special variable list
Date: Mon, 15 Nov 2021 14:29:11 +0000
Message-Id: <20211115142915.3797652-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211115142915.3797652-1-alex.bennee@linaro.org>
References: <20211115142915.3797652-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 f4bug@amsat.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Making the list alphabetical makes it easier to find the config option
you are looking for.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/vm/Makefile.include | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tests/vm/Makefile.include b/tests/vm/Makefile.include
index f3a3a1c751..f8ca619cf2 100644
--- a/tests/vm/Makefile.include
+++ b/tests/vm/Makefile.include
@@ -52,21 +52,21 @@ endif
 	@echo
 	@echo "Special variables:"
 	@echo "    BUILD_TARGET=foo		 - Override the build target"
-	@echo "    TARGET_LIST=a,b,c    	 - Override target list in builds"
-	@echo '    EXTRA_CONFIGURE_OPTS="..."'
-	@echo "    J=[0..9]*            	 - Override the -jN parameter for make commands"
 	@echo "    DEBUG=1              	 - Enable verbose output on host and interactive debugging"
+	@echo '    EXTRA_CONFIGURE_OPTS="..."   - Pass to configure step'
+	@echo "    J=[0..9]*            	 - Override the -jN parameter for make commands"
 	@echo "    LOG_CONSOLE=1        	 - Log console to file in: ~/.cache/qemu-vm "
-	@echo "    V=1				 - Enable verbose ouput on host and guest commands"
-	@echo "    QEMU_LOCAL=1                 - Use QEMU binary local to this build."
 	@echo "    QEMU=/path/to/qemu		 - Change path to QEMU binary"
-	@echo "    QEMU_IMG=/path/to/qemu-img	 - Change path to qemu-img tool"
 ifeq ($(HAVE_PYTHON_YAML),yes)
 	@echo "    QEMU_CONFIG=/path/conf.yml   - Change path to VM configuration .yml file."
 else
 	@echo "    (install python3-yaml to enable support for yaml file to configure a VM.)"
 endif
 	@echo "                                   See conf_example_*.yml for file format details."
+	@echo "    QEMU_IMG=/path/to/qemu-img	 - Change path to qemu-img tool"
+	@echo "    QEMU_LOCAL=1                 - Use QEMU binary local to this build."
+	@echo "    TARGET_LIST=a,b,c    	 - Override target list in builds"
+	@echo "    V=1				 - Enable verbose ouput on host and guest commands"
 
 vm-build-all: $(addprefix vm-build-, $(IMAGES))
 
-- 
2.30.2


