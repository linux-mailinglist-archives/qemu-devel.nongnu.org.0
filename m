Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A5D5EF601
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 15:06:03 +0200 (CEST)
Received: from localhost ([::1]:56956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odtEo-0004rG-NB
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 09:06:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odrwD-0004aO-PT
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:42:46 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:46753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odrwB-0001C1-Q0
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:42:45 -0400
Received: by mail-wr1-x432.google.com with SMTP id bk15so1727760wrb.13
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 04:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=yjAfNNAxyxkA6bbj5wcYil3jVmy6SPpXlGorSEsyun4=;
 b=JDsAagkEEFKbFUNpJV8Ehr2/EV1dnLT/tb5FRIwFncCgL7SMnoPMDOb1KrMB1U3+1i
 tcj2Hw633usg8Bhty/JYq8sn8zWI0huuJ+q0VZt4xlNzgdsy8MZTO0+BGXCqdBOj4rdq
 YGxFPTGXBZFPxAJFvrCemFeMApwBJqIH35BptcGQ82JnbH7WoD1OL3JvB+J8hgOLacwT
 7dTXH4XQIu7U8WlCOPGhFaSpsupYoCTRh/ge4l4KOhrbKdHJ74aiiZOgmd/oPDgiFx7a
 V9DnCerLZvwb3uX1EsAujgQhXcsbPGSQvcyTePE/8vxa1lJudU8xrG+syYyZ+BmYgdTC
 qYKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=yjAfNNAxyxkA6bbj5wcYil3jVmy6SPpXlGorSEsyun4=;
 b=fr3uW9W4YjsUDQqG+sNA8ngWv9KJMmH0j51xg/s3t0ofDwv+E+BGScv0kQSST21G7C
 3azvTQtQe3eXWaflCY0QWUSo+cAkVI4uMyVqGK9t74bl3AlQcyX++U66nX0q/yNtZZS1
 SuxsZxSp4Ics6X82fWvkM/M7loaUGNbIUx9mbchxHB5F5sTCahA7Yk9GngL7DdPk2hJt
 m9YCmrC2iCMRRNy7otxiCORhNqPmb6KYOw11+lFKfGCjvq0j2i0FPfBDUjhYdOlgXocC
 dKG/9p13KMHk2GkARY6MvIvLhTIH1UuN71svbJ8PHWxpmNDXEsx3vxrO4zQARyqw9FIq
 3hMw==
X-Gm-Message-State: ACrzQf297FGZKfwfU9YNhNZTh0iJXGciIFuPagq4PMG9wlX7c1Bbt/l6
 DQuOHI1TE0NskiQcb7HBeTaCVQ==
X-Google-Smtp-Source: AMsMyM4mu00HTt9OybxyTFkVr7olDSk3ARwi5sUIK0E8hXpmlz8OIhYJx8uvrjzOTfdESeXU1gT9yQ==
X-Received: by 2002:a5d:5944:0:b0:22a:c2d1:e3fe with SMTP id
 e4-20020a5d5944000000b0022ac2d1e3femr1913484wri.261.1664451763101; 
 Thu, 29 Sep 2022 04:42:43 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 s15-20020adfeccf000000b00228d6edade0sm6745785wro.46.2022.09.29.04.42.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 04:42:40 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1814A1FFC7;
 Thu, 29 Sep 2022 12:42:33 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 minyihh@uci.edu, ma.mandourr@gmail.com, Luke.Craig@ll.mit.edu,
 cota@braap.org, aaron@os.amperecomputing.com, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v1 16/51] build: add recursive distclean rules
Date: Thu, 29 Sep 2022 12:41:56 +0100
Message-Id: <20220929114231.583801-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220929114231.583801-1-alex.bennee@linaro.org>
References: <20220929114231.583801-1-alex.bennee@linaro.org>
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 Makefile | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

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


