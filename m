Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 268B15EF821
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 16:59:06 +0200 (CEST)
Received: from localhost ([::1]:54102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odv0C-0007qc-Oe
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 10:59:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odsD1-0007UN-AN
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 08:00:07 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:45603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odsCu-0004On-RF
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 08:00:06 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 d12-20020a05600c3acc00b003b4c12e47f3so608876wms.4
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 05:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=3gQSShOSw7mXVJmYGT4mj+J2+/RqeX/ZMhykdWqwlSw=;
 b=VaJBxCICdK8dO8PMD/HcQOteW2Q5XNz3e6zY/2FT8jSgFXZYCgdv8kC8hJr0OXdkMr
 rC8N5mdgexqCCH8X25ZcJGDTlzVWzw6OFGBFRRZ2eRRaIgI6Dh8JiJgiU3A/EjARRjeH
 mYF9sRUR9KEQhwnvL/qr609pIKggp1E4Lwa9OERPK2w3a5rNvY2DwM2nnRv4i932TUaM
 wlQktHgCBaHDNsC0wTIJiM9vasaMh/F7d0Ui6WFVYhByxPDNGR+Yrhs9H7cuQ+mLZomG
 BTvDVPsSAVg/UMzheqHzEMlOIEolMjh36KiWlVmP4u6sMzApSPrvtfBDRekpp8KuhgqE
 CEQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=3gQSShOSw7mXVJmYGT4mj+J2+/RqeX/ZMhykdWqwlSw=;
 b=Jin0rL8+r7sIJ0byCZyytb9fFSeddXhgGIagE3U3BtcT363KqswOF469z0aK7axxf8
 A4eCaADLkc/PgRnMRhfR34nbzSjXoB26seT2pPl2baIYu9eq2FDuEwGdsanT2fWsIMpO
 Cx5KhYNQfpE+KXYsSZ2y8lKj8H9tm7h1NPrsEQSIIvfHKVkXj3tS8J9veR4ii1RxC+W6
 MBNBk8S849JH5nBQQIxigDg2VewUs/KSvfWAEaoewZuf+wSpEmCQBZZky0aGhOwKbTv7
 cZCYo0/JvDsHcjgPiftjEblbgAbs2mwzlPjBXNgBREnSzbVIxRZDc3hB2sC/HxQOeRCr
 OVIA==
X-Gm-Message-State: ACrzQf3for9O6omnwVeFaXzQHJ+Y8QJwP9tTywIv68KtHmgphz2YNMK+
 p6tOT00g4WRPfiR8R4R0UTxVf8wqmZ2hrw==
X-Google-Smtp-Source: AMsMyM6iZfyvknRweKg6ydMAXZ0KMtmoAwGE7wm8lic2/c2RoCdLhxoGwlLsKPB6Y9yVdB1iiuoDDQ==
X-Received: by 2002:a05:600c:282:b0:3b4:76c8:da3c with SMTP id
 2-20020a05600c028200b003b476c8da3cmr2122404wmk.153.1664452799239; 
 Thu, 29 Sep 2022 04:59:59 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 j1-20020a5d4481000000b0022ae401e9e0sm6394434wrq.78.2022.09.29.04.59.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 04:59:55 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B29351FFCB;
 Thu, 29 Sep 2022 12:42:33 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 minyihh@uci.edu, ma.mandourr@gmail.com, Luke.Craig@ll.mit.edu,
 cota@braap.org, aaron@os.amperecomputing.com, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v1 22/51] tests/tcg: unify ppc64 and ppc64le Makefiles
Date: Thu, 29 Sep 2022 12:42:02 +0100
Message-Id: <20220929114231.583801-23-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220929114231.583801-1-alex.bennee@linaro.org>
References: <20220929114231.583801-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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

Make tests/tcg/ppc64le include tests/tcg/ppc64 instead of duplicating
the rules.  Because the ppc64le vpath includes tests/tcg/ppc64 but
not vice versa, the tests have to be moved from tests/tcg/ppc64le/
to tests/tcg/ppc64.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/{ppc64le => ppc64}/bcdsub.c         |  0
 tests/tcg/{ppc64le => ppc64}/byte_reverse.c   |  0
 tests/tcg/{ppc64le => ppc64}/mffsce.c         |  0
 tests/tcg/{ppc64le => ppc64}/mtfsf.c          |  0
 .../{ppc64le => ppc64}/non_signalling_xscv.c  |  0
 .../signal_save_restore_xer.c                 |  0
 tests/tcg/{ppc64le => ppc64}/xxspltw.c        |  0
 tests/tcg/ppc64/Makefile.target               |  1 -
 tests/tcg/ppc64le/Makefile.target             | 26 +------------------
 9 files changed, 1 insertion(+), 26 deletions(-)
 rename tests/tcg/{ppc64le => ppc64}/bcdsub.c (100%)
 rename tests/tcg/{ppc64le => ppc64}/byte_reverse.c (100%)
 rename tests/tcg/{ppc64le => ppc64}/mffsce.c (100%)
 rename tests/tcg/{ppc64le => ppc64}/mtfsf.c (100%)
 rename tests/tcg/{ppc64le => ppc64}/non_signalling_xscv.c (100%)
 rename tests/tcg/{ppc64le => ppc64}/signal_save_restore_xer.c (100%)
 rename tests/tcg/{ppc64le => ppc64}/xxspltw.c (100%)

diff --git a/tests/tcg/ppc64le/bcdsub.c b/tests/tcg/ppc64/bcdsub.c
similarity index 100%
rename from tests/tcg/ppc64le/bcdsub.c
rename to tests/tcg/ppc64/bcdsub.c
diff --git a/tests/tcg/ppc64le/byte_reverse.c b/tests/tcg/ppc64/byte_reverse.c
similarity index 100%
rename from tests/tcg/ppc64le/byte_reverse.c
rename to tests/tcg/ppc64/byte_reverse.c
diff --git a/tests/tcg/ppc64le/mffsce.c b/tests/tcg/ppc64/mffsce.c
similarity index 100%
rename from tests/tcg/ppc64le/mffsce.c
rename to tests/tcg/ppc64/mffsce.c
diff --git a/tests/tcg/ppc64le/mtfsf.c b/tests/tcg/ppc64/mtfsf.c
similarity index 100%
rename from tests/tcg/ppc64le/mtfsf.c
rename to tests/tcg/ppc64/mtfsf.c
diff --git a/tests/tcg/ppc64le/non_signalling_xscv.c b/tests/tcg/ppc64/non_signalling_xscv.c
similarity index 100%
rename from tests/tcg/ppc64le/non_signalling_xscv.c
rename to tests/tcg/ppc64/non_signalling_xscv.c
diff --git a/tests/tcg/ppc64le/signal_save_restore_xer.c b/tests/tcg/ppc64/signal_save_restore_xer.c
similarity index 100%
rename from tests/tcg/ppc64le/signal_save_restore_xer.c
rename to tests/tcg/ppc64/signal_save_restore_xer.c
diff --git a/tests/tcg/ppc64le/xxspltw.c b/tests/tcg/ppc64/xxspltw.c
similarity index 100%
rename from tests/tcg/ppc64le/xxspltw.c
rename to tests/tcg/ppc64/xxspltw.c
diff --git a/tests/tcg/ppc64/Makefile.target b/tests/tcg/ppc64/Makefile.target
index 331fae628e..7db7a3e2b3 100644
--- a/tests/tcg/ppc64/Makefile.target
+++ b/tests/tcg/ppc64/Makefile.target
@@ -3,7 +3,6 @@
 # ppc64 specific tweaks
 
 VPATH += $(SRC_PATH)/tests/tcg/ppc64
-VPATH += $(SRC_PATH)/tests/tcg/ppc64le
 
 ifneq ($(CROSS_CC_HAS_POWER8_VECTOR),)
 PPC64_TESTS=bcdsub non_signalling_xscv
diff --git a/tests/tcg/ppc64le/Makefile.target b/tests/tcg/ppc64le/Makefile.target
index 6ca3003f02..daad5118a5 100644
--- a/tests/tcg/ppc64le/Makefile.target
+++ b/tests/tcg/ppc64le/Makefile.target
@@ -4,28 +4,4 @@
 
 VPATH += $(SRC_PATH)/tests/tcg/ppc64le
 
-ifneq ($(CROSS_CC_HAS_POWER8_VECTOR),)
-PPC64LE_TESTS=bcdsub non_signalling_xscv
-endif
-$(PPC64LE_TESTS): CFLAGS += -mpower8-vector
-
-ifneq ($(CROSS_CC_HAS_POWER10),)
-PPC64LE_TESTS += byte_reverse sha512-vector
-endif
-byte_reverse: CFLAGS += -mcpu=power10
-run-byte_reverse: QEMU_OPTS+=-cpu POWER10
-run-plugin-byte_reverse-with-%: QEMU_OPTS+=-cpu POWER10
-
-sha512-vector: CFLAGS +=-mcpu=power10 -O3
-sha512-vector: sha512.c
-	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
-
-run-sha512-vector: QEMU_OPTS+=-cpu POWER10
-run-plugin-sha512-vector-with-%: QEMU_OPTS+=-cpu POWER10
-
-PPC64LE_TESTS += mtfsf
-PPC64LE_TESTS += mffsce
-PPC64LE_TESTS += signal_save_restore_xer
-PPC64LE_TESTS += xxspltw
-
-TESTS += $(PPC64LE_TESTS)
+include $(SRC_PATH)/tests/tcg/ppc64/Makefile.target
-- 
2.34.1


