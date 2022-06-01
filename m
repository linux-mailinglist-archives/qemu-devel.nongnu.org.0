Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9AA53AC91
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 20:15:36 +0200 (CEST)
Received: from localhost ([::1]:41988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwSsZ-0003Pn-Rf
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 14:15:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nwSjH-000150-7u
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 14:05:59 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:40881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nwSjF-0004wj-Iq
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 14:05:58 -0400
Received: by mail-ej1-x62d.google.com with SMTP id fu3so3885470ejc.7
 for <qemu-devel@nongnu.org>; Wed, 01 Jun 2022 11:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Nq8yzeDa35nazBz+vDIGk+SXL2jvpKA5lHmDy5gS1Bw=;
 b=CrBQ0TrlEEV9NsWJg2YhbEt04hD0irzVXkhXQVhGvGQeWKEKKCqIGAzeU4zYDbNGe1
 ZcpP/JEHCJjwuxAag226puq+kAZQiOVNQfDmszckMIVFv/UsR/du0b6DJ44EsWz76y8T
 kjNfj4pX9B0o7NFZbqJcy8s2aLBNRjeixG89t8MZquW/Bq+QlhOqxqqs87V0IPq47War
 MmB4Awok2sXCDVAInBYCH+dOsT201dT7FHIEkFsWY5+gfPAm2sOOYFOgHpWXfnP5K6fM
 Uak9+vLLvjDFeytckczFwgZ49l0jwEuugy+lIJSDhTdU59a1FORhD7AcqjzDlCANyZfo
 IwwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Nq8yzeDa35nazBz+vDIGk+SXL2jvpKA5lHmDy5gS1Bw=;
 b=W7YC1fCt3d4UOVWO23xgqk0aBBy/d9RzrUtZA2PiKHOZJSp9Dw+dUCFu0l9n7ZZ+5c
 xdmXG1MfewTmEnFEsvSaitJ0vxv9xmTySZE4xa8ynSXx2Oi/hoTqYpfv1XqeQlVumKMF
 1cYV+gjBwZgdDlKdkksgyaw1EGBI38pmun44L3rNhiYZp10aTQeAG2ySbLP/vVsJjhvc
 5Yiu4FdNPRiVIksz9+qSUEF46q/K+ZZLv15yRKhXX8eTb1XEIKlc3B8+UHtYrGlX33Ok
 933OmjOI0Fl9ptYY6DN7TGib4QSAsk6DZ8z48vgPktJbpw3rhPGvh2JlOlq/NtdJUQ86
 LS2g==
X-Gm-Message-State: AOAM530qdlU2lNsI1epIBfuzUhGtJPaGIwi7X93q0YBUzyqKopBOTBWc
 l6NCany2EZJchQiWDQ/Oi33aWg==
X-Google-Smtp-Source: ABdhPJwdGZKQmoh+6Ua2GnMiWXuMNU++OA4QcHjLrS9WLn9+5WZzRe0DYFap/TSVvW7UU5KZqkkgsw==
X-Received: by 2002:a17:907:1b1a:b0:703:a290:98f1 with SMTP id
 mp26-20020a1709071b1a00b00703a29098f1mr701896ejc.418.1654106756917; 
 Wed, 01 Jun 2022 11:05:56 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 e11-20020a056402104b00b0042dea3390cdsm1314880edu.49.2022.06.01.11.05.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 11:05:54 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E8B9B1FFC4;
 Wed,  1 Jun 2022 19:05:38 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 12/33] configure: do not define or use the CPP variable
Date: Wed,  1 Jun 2022 19:05:16 +0100
Message-Id: <20220601180537.2329566-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220601180537.2329566-1-alex.bennee@linaro.org>
References: <20220601180537.2329566-1-alex.bennee@linaro.org>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

Just hardcode $(CC) -E, it should be enough.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220517092616.1272238-2-pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220527153603.887929-13-alex.bennee@linaro.org>

diff --git a/configure b/configure
index f2baf2f526..c88ef94fec 100755
--- a/configure
+++ b/configure
@@ -376,7 +376,6 @@ fi
 ar="${AR-${cross_prefix}ar}"
 as="${AS-${cross_prefix}as}"
 ccas="${CCAS-$cc}"
-cpp="${CPP-$cc -E}"
 objcopy="${OBJCOPY-${cross_prefix}objcopy}"
 ld="${LD-${cross_prefix}ld}"
 ranlib="${RANLIB-${cross_prefix}ranlib}"
@@ -2014,7 +2013,6 @@ echo "CC=$cc" >> $config_host_mak
 echo "AR=$ar" >> $config_host_mak
 echo "AS=$as" >> $config_host_mak
 echo "CCAS=$ccas" >> $config_host_mak
-echo "CPP=$cpp" >> $config_host_mak
 echo "OBJCOPY=$objcopy" >> $config_host_mak
 echo "LD=$ld" >> $config_host_mak
 echo "QEMU_CFLAGS=$QEMU_CFLAGS" >> $config_host_mak
@@ -2257,7 +2255,6 @@ preserve_env() {
 preserve_env AR
 preserve_env AS
 preserve_env CC
-preserve_env CPP
 preserve_env CFLAGS
 preserve_env CXX
 preserve_env CXXFLAGS
diff --git a/pc-bios/optionrom/Makefile b/pc-bios/optionrom/Makefile
index 2494ad9c25..17ccc76241 100644
--- a/pc-bios/optionrom/Makefile
+++ b/pc-bios/optionrom/Makefile
@@ -50,7 +50,7 @@ override LDFLAGS = -m $(LD_I386_EMULATION) -T $(SRC_DIR)/flat.lds
 pvh.img: pvh.o pvh_main.o
 
 %.o: %.S
-	$(call quiet-command,$(CPP) $(CPPFLAGS) -c -o - $< | $(AS) $(ASFLAGS) -o $@,"AS","$@")
+	$(call quiet-command,$(CC) $(CPPFLAGS) -E -o - $< | $(AS) $(ASFLAGS) -o $@,"AS","$@")
 
 %.o: %.c
 	$(call quiet-command,$(CC) $(CPPFLAGS) $(CFLAGS) -c $< -o $@,"CC","$@")
-- 
2.30.2


