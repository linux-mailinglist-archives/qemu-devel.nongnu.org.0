Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1369D5F452E
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 16:09:38 +0200 (CEST)
Received: from localhost ([::1]:39870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofic5-00005P-63
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 10:09:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhqB-0001Lq-52
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:20:08 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:38413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhq7-0001sI-DO
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:20:06 -0400
Received: by mail-wr1-x432.google.com with SMTP id j16so9349868wrh.5
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 06:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=T/pxyGXpRXvNvrTzvW9UdBzvMOK7hpw0JSZ16A8Xx1I=;
 b=lLKjUBW2KZvm6c1yb+DFjbTiUlJTiiQKvqbDkqffrbWmtkSyIVIdBoIQRc4Za6LoTM
 4HE8kzV6/ZZ37O8ioC0F5uHjVJyjh2PwOblovv3FM7rOB9UtG4y9RtHGuTs+mLr3h5ON
 GUo0yanvippe6pcMxsbPz60L78KzMYqz/KLwyqUXKNBbVGSibnJ64AmGSqCjFzkLZhsj
 eGQ0k3v9t7LMn82hJwD6sfR5Gim6ykPl48Btv8MnlGSSBRtR5BNCvSKbEhze9FUbqWIP
 kezUVlPmi7RmnBoPu0DdSD7ovKidl/IpV5SxC928EcRvm+xpEpNbdYqd+hD9SpHYAmHx
 GTkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=T/pxyGXpRXvNvrTzvW9UdBzvMOK7hpw0JSZ16A8Xx1I=;
 b=MyZ4tNcR7k+Vyvg0pBYKaywaRl4vPoDxRJnr2a/X+d5n2+ZJDPpPOT6ETeStjXlrtE
 0MWchJyvsig+Br5kCdaeL4OQJaq6b/nRBQoSfgFkahWTztoUmQA3C2dcztt/aLnVt5Yo
 krh2HDoier082AImJAYZUAdMTS8p8OHQGtm1KOBsbdZJmx1Me7Z6JqpMr3obLc6YPLMZ
 TSOGWMyzPQvzD14Ptgd1hqs1MHtgkcx01Q8nhGe1ebnrm5TnL1fvd2AIrKJvldJM1YOs
 yLGaN1LkC91Fqh21YvuZ6stXvPwAbaxzmJBFmHqmO4r082y2BepNKukLkSQqKlKbXOUB
 +cdg==
X-Gm-Message-State: ACrzQf0XK06dfGD5Kt3vbLAGEgIW2BlV9TNRXhA0IzXi7q16W9Q64vqZ
 w+4SHYLfPtWt3qAIsmkSn5FqQA==
X-Google-Smtp-Source: AMsMyM4ucg+qcT+Y0ZBB7uAnGJSAii1/bl3ZIJpK98Yg2EJrU5ZazDY/FAr+gA3aSvovt001c7h51A==
X-Received: by 2002:a05:6000:1842:b0:22a:4d1d:4bd6 with SMTP id
 c2-20020a056000184200b0022a4d1d4bd6mr16027712wri.603.1664889599846; 
 Tue, 04 Oct 2022 06:19:59 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 j24-20020a05600c1c1800b003b95ed78275sm7787121wms.20.2022.10.04.06.19.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 06:19:55 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 820DE1FFCA;
 Tue,  4 Oct 2022 14:01:40 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 20/54] tests/tcg: remove -f from Makefile invocation
Date: Tue,  4 Oct 2022 14:01:04 +0100
Message-Id: <20221004130138.2299307-21-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221004130138.2299307-1-alex.bennee@linaro.org>
References: <20221004130138.2299307-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

Instead of linking tests/tcg/Makefile.target into the build tree, name
the symbolic link "Makefile" and create it in every target subdirectory.
This makes it possible to just invoke "make" in tests/tcg subdirectories.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220929114231.583801-21-alex.bennee@linaro.org>

diff --git a/configure b/configure
index 784b77ae90..a48a731bf4 100755
--- a/configure
+++ b/configure
@@ -2282,7 +2282,6 @@ fi
 # tests might fail. Prefer to keep the relevant files in their own
 # directory and symlink the directory instead.
 LINKS="Makefile"
-LINKS="$LINKS tests/tcg/Makefile.target"
 LINKS="$LINKS pc-bios/optionrom/Makefile"
 LINKS="$LINKS pc-bios/s390-ccw/Makefile"
 LINKS="$LINKS pc-bios/vof/Makefile"
@@ -2529,6 +2528,7 @@ fi
 echo "# Automatically generated by configure - do not modify" > $makefile
 
 config_host_mak=tests/tcg/config-host.mak
+mkdir -p tests/tcg
 echo "# Automatically generated by configure - do not modify" > $config_host_mak
 echo "SRC_PATH=$source_path" >> $config_host_mak
 echo "HOST_CC=$host_cc" >> $config_host_mak
@@ -2632,8 +2632,9 @@ for target in $target_list; do
       got_cross_cc=yes
   fi
   if test $got_cross_cc = yes; then
-      mkdir -p tests/tcg/$target
-      ln -sf ../config-$target.mak tests/tcg/$target/config-target.mak
+      mkdir -p "tests/tcg/$target"
+      ln -sf "$source_path/tests/tcg/Makefile.target" "tests/tcg/$target/Makefile"
+      ln -sf "../config-$target.mak" "tests/tcg/$target/config-target.mak"
       echo "TARGET=$target" >> "$config_target_mak"
       echo "QEMU=$PWD/$qemu" >> "$config_target_mak"
       echo "run-tcg-tests-$target: $qemu\$(EXESUF)" >> $makefile
diff --git a/tests/Makefile.include b/tests/Makefile.include
index 826b1895f4..caef287957 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -50,20 +50,19 @@ $(foreach TARGET,$(TCG_TESTS_TARGETS), \
 .PHONY: $(TCG_TESTS_TARGETS:%=build-tcg-tests-%)
 $(TCG_TESTS_TARGETS:%=build-tcg-tests-%): build-tcg-tests-%: $(BUILD_DIR)/tests/tcg/config-%.mak
 	$(call quiet-command, \
-            $(MAKE) -C tests/tcg/$* -f ../Makefile.target $(SUBDIR_MAKEFLAGS), \
+            $(MAKE) -C tests/tcg/$* $(SUBDIR_MAKEFLAGS), \
         "BUILD","$* guest-tests")
 
 .PHONY: $(TCG_TESTS_TARGETS:%=run-tcg-tests-%)
 $(TCG_TESTS_TARGETS:%=run-tcg-tests-%): run-tcg-tests-%: build-tcg-tests-%
 	$(call quiet-command, \
-           $(MAKE) -C tests/tcg/$* -f ../Makefile.target $(SUBDIR_MAKEFLAGS) \
-                        SPEED=$(SPEED) run, \
+           $(MAKE) -C tests/tcg/$* $(SUBDIR_MAKEFLAGS) SPEED=$(SPEED) run, \
         "RUN", "$* guest-tests")
 
 .PHONY: $(TCG_TESTS_TARGETS:%=clean-tcg-tests-%)
 $(TCG_TESTS_TARGETS:%=clean-tcg-tests-%): clean-tcg-tests-%:
 	$(call quiet-command, \
-           $(MAKE) -C tests/tcg/$* -f ../Makefile.target $(SUBDIR_MAKEFLAGS) clean, \
+           $(MAKE) -C tests/tcg/$* $(SUBDIR_MAKEFLAGS) clean, \
         "CLEAN", "$* guest-tests")
 
 .PHONY: build-tcg
-- 
2.34.1


