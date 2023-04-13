Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 043A96E10A0
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 17:09:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmyY2-00082e-D2; Thu, 13 Apr 2023 11:07:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmyY0-000828-01
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 11:07:40 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmyXr-000546-0R
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 11:07:39 -0400
Received: by mail-wr1-x42e.google.com with SMTP id v27so5306949wra.13
 for <qemu-devel@nongnu.org>; Thu, 13 Apr 2023 08:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681398448; x=1683990448;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Yo+EgMosNtZ80RQKxt6SkmU9l8pELWDWAv7GI9lbZVg=;
 b=T8/hm3AQHnWPVgwwTb+nMduEMHZLg8TFO3zciuCSR0x+63Ax35Aa9NjTLJ6q+WACRi
 kGigKnrUK3I2DjWkDh5OpEPJxioqyFBZWXKIRmrOpzVBTE6z3mZutBJbX8FqZoJRCPRz
 k4EkR8GU6YqJNEvigRezoNmGmjg5k9l3B17kXlsijsUmBx3m28d199IaSVLP8+yBCUVu
 QsuUIea37MHUhx+Nv4TdpTZXC8uiBfeCyBe6chV6YYWbBBM8i0Dxv2dAg4HwTJTwZIhP
 zhI69xb+vadzQHTdRle9s8Lkh7C1PJaVwhPSUR/2O3kKG/bx7UKPpyu+NOXyJYY3t0aZ
 UhOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681398448; x=1683990448;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Yo+EgMosNtZ80RQKxt6SkmU9l8pELWDWAv7GI9lbZVg=;
 b=kqGutOEy9ZfK+xNK6ksjWKwQCLobI+0ibU+Yd+Hsumpc/OGUDXgAPxuXqZxXagCHgx
 0ZUuPrdacTyyi2vd/n7mTQPwZJZ0O78HG8dmJAe2zJIPHSN5QoOOdto3FyXDmWdffwzZ
 lMJXm7ah06mHOcL7F4FebF/BOggdQkl19KzCobuSdy7OiLo12Xcj05qMWnlfAwSbm8Mx
 nmwr9Lh+nV1+9Fv2CtAiUSO20WEc/zr3vBysTI7VTPfrwqwyulSWLcnxQhlizd6xMQWf
 EbbghTICFXbV2yN+fH29gFvI4vwhudDI1EkTl2vsD9wjZ1p954FAFEl2wn6o78jGjTeX
 KPmg==
X-Gm-Message-State: AAQBX9fTF5lsJQCcM2X07y85ON9mfmZ0PctfMh0ERuxJT0Z7Sxtn+4/S
 OgkzaL3PPQzdvWZmFVN534WuhAMhEaPoKhC2oew=
X-Google-Smtp-Source: AKy350a+N2nflA3f0cG3ut4DsYnyUApDpdGvovO043Fq6swFDSoKrChDKV3TDyDe0AwjHA/lOWLghA==
X-Received: by 2002:a5d:6ac6:0:b0:2f4:9f46:6865 with SMTP id
 u6-20020a5d6ac6000000b002f49f466865mr1864104wrw.30.1681398447907; 
 Thu, 13 Apr 2023 08:07:27 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 t3-20020a5d5343000000b002c55521903bsm1484870wrv.51.2023.04.13.08.07.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Apr 2023 08:07:27 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH 1/2] qtest: Don't assert on "-qtest chardev:myid"
Date: Thu, 13 Apr 2023 16:07:23 +0100
Message-Id: <20230413150724.404304-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230413150724.404304-1-peter.maydell@linaro.org>
References: <20230413150724.404304-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

If the -qtest command line argument is passed a string that says
"use this chardev for I/O", then it will assert:

$ ./build/clang/qemu-system-i386 -chardev file,path=/dev/null,id=myid -qtest chardev:myid
Unexpected error in qtest_set_chardev() at ../../softmmu/qtest.c:1011:
qemu-system-i386: Cannot find character device 'qtest'
Aborted (core dumped)

This is because in qtest_server_init() we assume that when we create
the chardev with qemu_chr_new() it will always have the name "qtest".
This is true if qemu_chr_new() had to create a new chardev, but not
true if one already existed and is being referred to with
"chardev:myid".

Use the name of the chardev we get back from qemu_chr_new() as the
string to set the qtest 'chardev' property to, instead of hardcoding
it to "qtest".

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 softmmu/qtest.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/softmmu/qtest.c b/softmmu/qtest.c
index 34bd2a33a76..26852996b5b 100644
--- a/softmmu/qtest.c
+++ b/softmmu/qtest.c
@@ -867,7 +867,7 @@ void qtest_server_init(const char *qtest_chrdev, const char *qtest_log, Error **
     }
 
     qtest = object_new(TYPE_QTEST);
-    object_property_set_str(qtest, "chardev", "qtest", &error_abort);
+    object_property_set_str(qtest, "chardev", chr->label, &error_abort);
     if (qtest_log) {
         object_property_set_str(qtest, "log", qtest_log, &error_abort);
     }
-- 
2.34.1


