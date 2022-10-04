Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5EC5F4530
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 16:11:39 +0200 (CEST)
Received: from localhost ([::1]:56512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofie2-0002x8-HR
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 10:11:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhq5-0001JH-Sr
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:20:05 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:35399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhq2-0001qr-63
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:20:01 -0400
Received: by mail-wr1-x42f.google.com with SMTP id u10so21172009wrq.2
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 06:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=heg8HF7tr0inN2eP23IggjtyYPd8jYtsjr2DUsYoRnk=;
 b=HjUP7yOpQ0R5IUwKApvKPwS5U4XEEh2/6TIGlwEFKy/N3NXPbx+IlYDDOlUX6Gbk5M
 V8sDohO6TYL5vLfgZVZlFesx8bQUWikgJODIUyARbEq/Dx2o3tIAFmPZH7Iq4szDfYAy
 qvhwQ2oxffnztfhd3oeF0Nh0sInhmjOy20VbNHbLonIe2l7Fs6T5ZATjn2m9jTqzbEKQ
 w7dWKvW2CAWOBNLO6IJdvROCWeDp3bQywKiOPn6sxmDg+4hXny7E6wV83pJkJ8P4okeb
 3FBJpzka/YSiq8JpcC61zIXV1DdS5YY/fJ37TYRtisRa7iQ3KADTZlmRQofFFTohwmmS
 j/5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=heg8HF7tr0inN2eP23IggjtyYPd8jYtsjr2DUsYoRnk=;
 b=Uo3i7QP8OE/eECd2iyrbXeZcc2ouLHsY33NJuVSp8EuNI13vmlD3yaZbhEf0tZFD86
 3UQqKkY00+rqAZLRwE8/LfLGR0wwd/lp8uvMnlojYhXQjaIwF9sjqH+8Dife8tydGXCz
 9vxednNZ93xoI6jlHMe2jWm7AwZ8Enw/SPMo+luQCKn8aYJeBH2Uy3hnffE1ppmIfcp+
 nmGBT8ZiboVB1mLIq9wfNwLI8Fy2TblClQjDeqII6Amf9E8eTDyIoc2xzhUNnOeu8090
 H2cCUlXJaAUoVDJeNKR7tLPr7HdRwCa/bMYO0E32buQW+v/Da4My6yFzM8AKulN+EtN6
 QtoQ==
X-Gm-Message-State: ACrzQf0OoiUT9pInIYdcNtYGOl8YIeJEbhPajpNrIYAcM/89KxYWOdeS
 2GanbWQzlAV2ZuPzPMGDIAfWu+wSFhFhyQ==
X-Google-Smtp-Source: AMsMyM5QIESyn2n61QmQchs80+wLmZxE+DfJFPrOzmyNlCKhOVxOBknHEmENmx2V6jhPuKgBpcuuVQ==
X-Received: by 2002:a5d:4f81:0:b0:21e:2cd7:25df with SMTP id
 d1-20020a5d4f81000000b0021e2cd725dfmr16877790wru.439.1664889595639; 
 Tue, 04 Oct 2022 06:19:55 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 k25-20020adfd239000000b0022af865810esm12150686wrh.75.2022.10.04.06.19.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 06:19:54 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B98661FFCC;
 Tue,  4 Oct 2022 14:01:40 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 22/54] tests/tcg: unify ppc64 and ppc64le Makefiles
Date: Tue,  4 Oct 2022 14:01:06 +0100
Message-Id: <20221004130138.2299307-23-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221004130138.2299307-1-alex.bennee@linaro.org>
References: <20221004130138.2299307-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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
Message-Id: <20220929114231.583801-23-alex.bennee@linaro.org>

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


