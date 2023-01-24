Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C2367A10F
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 19:18:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKNr1-0003us-1w; Tue, 24 Jan 2023 13:17:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pKNqu-0003nH-KH
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 13:17:01 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pKNqs-00010J-EN
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 13:16:59 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 e19-20020a05600c439300b003db1cac0c1fso11952797wmn.5
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 10:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4qbDvp85POUXncnPDWXMO/+Z4Ga30ccTwEsD+MJEPGw=;
 b=qhRRcx+dTdi54MuSsh+GW9AMtIbwoWrD2y4ee+nM1qYydSdi7VwsBX5UfSiCRV4HBm
 aaqs4WaeG1ySmzR17n48EXN7ySSYzEQWBqY6buANvYzEMz/eswGbllFVElt5rrgdmKx9
 tV2wA9C6tj0FcLlRZ9sx0u8UVVyv0okpaIO7I5rngWAs+aTtgPkSzErOb6mdDAJ8crNe
 bla3ukCdlmrMq/C0nfcOE4nIyYQVup3DDto7tiKIxop2G94wpUTlgNnvJc/Gyik2kD9l
 24X9nOxEJ+f2APe43tYppLIqpNzoSuVwlYDkmFAtlDPwy0ALEDAwDIddxdQxrr4ykhs1
 fz0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4qbDvp85POUXncnPDWXMO/+Z4Ga30ccTwEsD+MJEPGw=;
 b=pl8FWl6ZDanapouLP5Bbq7eAztaM6t/RipOqhIFXEmuOJoO1YSMmpReoIuRhCG8IIe
 1L0so2vFTTJ3juzn8O8vY7S4WT6l0PsjCYgVomn8TTvt/FivqLBBGfkedP8pLydbHkNo
 ok8Ip7FikhUfoCFv10FqvTLbGuzafzY07L4cOqKfp2mdy3RfTEzn1Pgi4tWq20bM49tU
 PDgJZs9BcDoyDddsVkZtqkmvVHjpKatMM8VwMs8Pm5IbAttLgtSNwvBH9xlWA9IYhgRu
 BKZoVUtq250Yf0LSybjBQZLcBf3B4ByK1G97Qg2rZ/0zndAs/KDR81WkoyAdNYdyeaSI
 Ps3A==
X-Gm-Message-State: AFqh2kreTPEDz9UuQs8RMwu7oj/SD3zp4TPOLKg0OrEJHWscxW+v1ux0
 KgPc7UT5AW/FP6whrT+cFwphhA==
X-Google-Smtp-Source: AMrXdXsHPXEYaBSSh3OrysUsCSHLnGVWScngSJ/m1kgbtxtnSpcSkjNcB1IorEIUR4ehPJvUUeQsQg==
X-Received: by 2002:a05:600c:2d84:b0:3d9:e8b3:57f9 with SMTP id
 i4-20020a05600c2d8400b003d9e8b357f9mr29158303wmg.8.1674584216676; 
 Tue, 24 Jan 2023 10:16:56 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 t13-20020a1c770d000000b003db0ee277b2sm14076015wmi.5.2023.01.24.10.16.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 10:16:56 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A3D351FFC6;
 Tue, 24 Jan 2023 18:01:29 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Ed Maste <emaste@freebsd.org>, Thomas Huth <thuth@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Markus Armbruster <armbru@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Bandan Das <bsd@redhat.com>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Michael Roth <michael.roth@amd.com>, Eduardo Habkost <eduardo@habkost.net>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, qemu-arm@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 16/35] tests/tcg: Use SIGKILL for timeout
Date: Tue, 24 Jan 2023 18:01:08 +0000
Message-Id: <20230124180127.1881110-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124180127.1881110-1-alex.bennee@linaro.org>
References: <20230124180127.1881110-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Richard Henderson <richard.henderson@linaro.org>

linux-user blocks all signals while attempting to handle guest
signals (e.g. ABRT), which means that the default TERM sent by timeout
has no effect -- KILL instead.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230117035701.168514-2-richard.henderson@linaro.org>
[AJB: expanded commit message from cover letter]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/Makefile.target | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target
index 14bc013181..a3b0aaf8af 100644
--- a/tests/tcg/Makefile.target
+++ b/tests/tcg/Makefile.target
@@ -54,10 +54,10 @@ cc-option = if $(call cc-test, $1); then \
 
 # $1 = test name, $2 = cmd, $3 = desc
 ifeq ($(filter %-softmmu, $(TARGET)),)
-run-test = $(call quiet-command, timeout --foreground $(TIMEOUT) $2 > $1.out, \
+run-test = $(call quiet-command, timeout -s KILL --foreground $(TIMEOUT) $2 > $1.out, \
 	TEST,$(or $3, $*, $<) on $(TARGET_NAME))
 else
-run-test = $(call quiet-command, timeout --foreground $(TIMEOUT) $2, \
+run-test = $(call quiet-command, timeout -s KILL --foreground $(TIMEOUT) $2, \
         TEST,$(or $3, $*, $<) on $(TARGET_NAME))
 endif
 
-- 
2.34.1


