Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1E95F4449
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 15:33:21 +0200 (CEST)
Received: from localhost ([::1]:49284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofi2y-00013i-Bx
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 09:33:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhYe-0008Ny-73
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:02:01 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:36533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhYb-0007Qo-4A
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:01:59 -0400
Received: by mail-wr1-x434.google.com with SMTP id j7so15849650wrr.3
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 06:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=UN7L9+SUgDtohTUMYtICnL8liPbJxVd92fjTJihycdQ=;
 b=CbUbbRW4pETjp8SOPiJGkzfJRPsHY8G6W3CQGZluGjUH/AnSp7JzUDb8ZeLjHva3s5
 3ImtWdXWM7ivihresVqW286+YWI5VVMbFStZANJl0WTHdx7CQURjRpnlgVthjZxnSDxS
 CJHjrvi2EpSajQC6rk5TeXi+wURmoL9e4v4gdLsVkrQFNNZMyN0KmxuWjtEic9CkZCY5
 nRgYXXGZoOjPaf+VBc7rjsEsiKtZV7ISKmAhV8247ZKBsOfNMqaU+xwhGe1ER/a1PBeH
 yLYYIneGhkt+IeePkQY+Od+5IDqkJCHuGB9FXi65SMVW+hLP8AMtRLXnfosOSaIWvxWt
 XnBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=UN7L9+SUgDtohTUMYtICnL8liPbJxVd92fjTJihycdQ=;
 b=hkR3pbd7VBTD537YHlEi+j9+iAsDEOeudlV058Rv7tZJtmWvWdobm8NuBhqdHHZqPq
 D7SLWbIyc2+4uA9H/kZOcK2LVcoNi9jQ3YdD+CTGwoO5zgH0PH1XAnz5fyAhrOSd7sEU
 Yv4pRAt44xYcXji9RpHkPCgSc7gR+xY5AMbjadcui3WAIQcnxnVnWxHnq1QHLnKxHan+
 MadUeggMsrLPLeAOxvwSArvHK7Mjfs317BY+VR+syvyn+6LuT/CJ32jAKesE0W4kPeCt
 NVT5CrXvuX0Pe2qksytTdBEg7qQ0Ic3pwpPshwPyjzqb6vebDv+1LJ50t5UMHer7qNof
 LpYw==
X-Gm-Message-State: ACrzQf0vt30yvKAxPiMHklndNqX8hMbYZEKw0CjBSAHDXqosfoEpP8FM
 NWkT8H2o7hsJ2jtEg0tz9OKJKA==
X-Google-Smtp-Source: AMsMyM6cGcTvc1fUzf/o7+/JClLe3kJe7myqjuIQDxMWd225eB0UPAeazDV4spYQ8hHVcdpe+lzCSg==
X-Received: by 2002:a5d:5010:0:b0:22a:cb71:9493 with SMTP id
 e16-20020a5d5010000000b0022acb719493mr16459894wrt.514.1664888515689; 
 Tue, 04 Oct 2022 06:01:55 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 y14-20020adfe6ce000000b0022c96d3b6f2sm15723482wrm.54.2022.10.04.06.01.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 06:01:51 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1E7DD1FFC7;
 Tue,  4 Oct 2022 14:01:40 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 16/54] build: add recursive distclean rules
Date: Tue,  4 Oct 2022 14:01:00 +0100
Message-Id: <20221004130138.2299307-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221004130138.2299307-1-alex.bennee@linaro.org>
References: <20221004130138.2299307-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220929114231.583801-17-alex.bennee@linaro.org>

diff --git a/Makefile b/Makefile
index b576cba5a8..0fcde48bec 100644
--- a/Makefile
+++ b/Makefile
@@ -186,7 +186,7 @@ include $(SRC_PATH)/tests/Makefile.include
 
 all: recurse-all
 
-ROMS_RULES=$(foreach t, all clean, $(addsuffix /$(t), $(ROMS)))
+ROMS_RULES=$(foreach t, all clean distclean, $(addsuffix /$(t), $(ROMS)))
 .PHONY: $(ROMS_RULES)
 $(ROMS_RULES):
 	$(call quiet-command,$(MAKE) $(SUBDIR_MAKEFLAGS) -C $(dir $@) V="$(V)" TARGET_DIR="$(dir $@)" $(notdir $@),)
@@ -194,6 +194,7 @@ $(ROMS_RULES):
 .PHONY: recurse-all recurse-clean
 recurse-all: $(addsuffix /all, $(ROMS))
 recurse-clean: $(addsuffix /clean, $(ROMS))
+recurse-distclean: $(addsuffix /distclean, $(ROMS))
 
 ######################################################################
 
@@ -214,7 +215,7 @@ dist: qemu-$(VERSION).tar.bz2
 qemu-%.tar.bz2:
 	$(SRC_PATH)/scripts/make-release "$(SRC_PATH)" "$(patsubst qemu-%.tar.bz2,%,$@)"
 
-distclean: clean
+distclean: clean recurse-distclean
 	-$(quiet-@)test -f build.ninja && $(NINJA) $(NINJAFLAGS) -t clean -g || :
 	rm -f config-host.mak qemu-bundle
 	rm -f tests/tcg/config-*.mak
-- 
2.34.1


