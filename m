Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CA445376A
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 17:28:47 +0100 (CET)
Received: from localhost ([::1]:43598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mn1K9-0007MD-3t
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 11:28:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mn1Gs-0004Vl-GF
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 11:25:22 -0500
Received: from [2a00:1450:4864:20::433] (port=36572
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mn1Gq-0004Bz-UC
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 11:25:22 -0500
Received: by mail-wr1-x433.google.com with SMTP id s13so38764120wrb.3
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 08:25:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BeCqD5fBRQsbmQUc4BGJhRKARVguo98gcXnxc1pBgj8=;
 b=zvYrBANba+iHr/AqkbUpXITfhR0qKbd/89tgZrED+CIxhpSgEbIsAT8xxrgmxbNS9d
 yk71EtP41/I/b6t/28KbkwNdZEallOSOomgSWAdvEf+IEFOvGsRP/aYzy96jB1RLxyyo
 8K73EeiXshxdBrtlSKmXbkEw0Qw92LrUTqaFGAkvE5idtWbc/Raa4LKGJ3FN4lHxLtBS
 cLwbkQxMAF8Stm14nbrCHoj0cmCbkLv5QEKCaE8Uuf8j43cWAqyXalOdf80CDXC/VN8+
 hnasOGOwHFAtHq4wXSdURhq0HpxpBcPVR0toGS+GULxEixn9XjFztbEZ6StlmKzgmR8B
 5CKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BeCqD5fBRQsbmQUc4BGJhRKARVguo98gcXnxc1pBgj8=;
 b=YOQmAIwDkT7ZHZ6BptWBzxaAi+cUOBDSdCkDmxHxG5Gj+F2OAg8CNLoJJfo2b0CEKX
 LvttJBKpJlsJEp4lM0xDLEyE0rRFGNL7y457ga335oJjl0kqlILkzyOQNVtWlrp+B0Qd
 uMtV7UfFjbfnNjmjiNCrK+PCIiiXz/++6DNSMc94LcqvCho+NLZ0gEs9S9sJ8Ij4+7G2
 suBVZvDE9D8RrryS7ow5TxFP0mBKiyduxEFN+65o+m+2gvp/XlFRbfmwFnKuLaTSjRr0
 uckeTt4DQ8p5K3Q1QJOhOB7DaMbFWQferVlURNFrOKK0dm5dFkGsWQ20zU+N2VJ9cm/8
 S65g==
X-Gm-Message-State: AOAM530gxKooPF/bPlgKgQBaH+tOm302aaG5kaiYp3SFFWCSfJCC8Jez
 vf5fmoqwSLIo3i2xJTYWnyAuTA==
X-Google-Smtp-Source: ABdhPJxdkOvTCqRQvnRPFUrmT0FG0bIqXfOnG9OhXW6+f6acL6jQWfkmPSpLADBnYKzew2Ym/3RwsQ==
X-Received: by 2002:a5d:598c:: with SMTP id n12mr10701406wri.250.1637079919464; 
 Tue, 16 Nov 2021 08:25:19 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s13sm2945769wmc.47.2021.11.16.08.25.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 08:25:16 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 821641FF99;
 Tue, 16 Nov 2021 16:25:15 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: richard.henderson@linaro.org
Subject: [PULL 2/7] tests/vm: sort the special variable list
Date: Tue, 16 Nov 2021 16:25:10 +0000
Message-Id: <20211116162515.4100231-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211116162515.4100231-1-alex.bennee@linaro.org>
References: <20211116162515.4100231-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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
Cc: peter.maydell@linaro.org, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Making the list alphabetical makes it easier to find the config option
you are looking for.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211115142915.3797652-3-alex.bennee@linaro.org>

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


