Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0992A67C9C7
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 12:23:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL0LR-0002US-4i; Thu, 26 Jan 2023 06:23:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pL0LN-0002BH-7j
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 06:23:01 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pL0LL-0003ok-2I
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 06:23:00 -0500
Received: by mail-wm1-x32f.google.com with SMTP id l8so900828wms.3
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 03:22:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zhJ2RCjWEhtNjzcA/iBMZ7sQCLCU1u/N4bQ1NIk6DxA=;
 b=uEGNgkv/Xqobs6kufgia/0IH0K/46chO9SJ3m0INMnv/o0gBimhDYUbMSI1VHYWf/y
 J7ova60lspvCG++JFNzOymdbCOOSswQnDHQzwGCCRHHp74yK/shcJPGm9jtFAwvzvB2b
 jIRX5U5P/OWt3llxISXNK0W47wQ+v5N8mi7duBEsDahoB7pxp4t5mfmZeux4HZ8eUw9N
 J9xqmL/60pIQfZYlYlY8KZFBDB+HD71RNYDVu210hgtN7lUGGnl5IJpAbE5osjo0RlwV
 aLpMFS5BtbA1xnFKWFkjWtn04RKuj3SZWhF5INkc1pneq4zeZXC6S1E0dk+ApMdQv+1c
 aR2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zhJ2RCjWEhtNjzcA/iBMZ7sQCLCU1u/N4bQ1NIk6DxA=;
 b=zU5TGfzM72Hit1M5qwDMf5nbemqVRmSabs02ttinkFI7V993FySYdyTIASKT6xHGyr
 kOAM8jvWcGO2ib71EW/bSOjjHxXey2TP0yfD1SKNPaFRgufy9AtflOL7avdMmS5wdaC4
 piXK/uwnnxwBjIPluh4/3QsqWJW+bZE7Z0Dfx3kgOF37xcdog93qMrdfLi7QE7HvymTJ
 8D7y6hSAND48sQU0IiH3ZV9+Dk0XGf3TLLt5uyu3mj/nZD/pi+3zp561aZ29b+4sHfO0
 HHmn/s2AbZi7hLYuBCQxcsjOXKxV4mfk838WB8/OcP0WKjP4MF3sPiwuUzLol5FYO7Ai
 HNZg==
X-Gm-Message-State: AFqh2kor1xL6Kn3oN6kOi3CVlCpr63n26PwunRJ4aOVVMyIRWf/+3VW1
 45pFLSPcRK/zVtgG1/2FwVAelg==
X-Google-Smtp-Source: AMrXdXvIU6Yz7lGXUBLRR2NsODO7TayVL1v2dAxmR3jeX+lod+eVwZxRytJYbNAqG9aoLU5N7OpULg==
X-Received: by 2002:a05:600c:358b:b0:3db:2e6e:7826 with SMTP id
 p11-20020a05600c358b00b003db2e6e7826mr23963578wmq.5.1674732177540; 
 Thu, 26 Jan 2023 03:22:57 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 d1-20020adfe2c1000000b002bfba730b0fsm1031981wrj.65.2023.01.26.03.22.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 03:22:55 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 70FAE1FFBA;
 Thu, 26 Jan 2023 11:22:52 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Michael Roth <michael.roth@amd.com>
Subject: [PULL 07/35] meson: replace Perl usage with Python
Date: Thu, 26 Jan 2023 11:22:22 +0000
Message-Id: <20230126112250.2584701-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230126112250.2584701-1-alex.bennee@linaro.org>
References: <20230126112250.2584701-1-alex.bennee@linaro.org>
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Let's try to remove Perl usage during build time.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20230110132700.833690-5-marcandre.lureau@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230124180127.1881110-8-alex.bennee@linaro.org>

diff --git a/tests/qapi-schema/meson.build b/tests/qapi-schema/meson.build
index 9dfe98bc9a..d85b14f28c 100644
--- a/tests/qapi-schema/meson.build
+++ b/tests/qapi-schema/meson.build
@@ -259,22 +259,23 @@ if build_docs
   # Fix possible inconsistency in line endings in generated output and
   # in the golden reference (which could otherwise cause test failures
   # on Windows hosts). Unfortunately diff --strip-trailing-cr
-  # is GNU-diff only. The odd-looking perl is because we must avoid
+  # is GNU-diff only. The odd-looking python is because we must avoid
   # using an explicit '\' character in the command arguments to
   # a custom_target(), as Meson will unhelpfully replace it with a '/'
   # (https://github.com/mesonbuild/meson/issues/1564)
+  remove_cr = [python, '-c', 'import sys;[sys.stdout.write(line.replace(chr(13), "")) for line in sys.stdin]']
   qapi_doc_out_nocr = custom_target('QAPI rST doc newline-sanitized',
                                     output: ['doc-good.txt.nocr'],
                                     input: qapi_doc_out[0],
                                     build_by_default: true,
-                                    command: ['perl', '-pe', '$x = chr 13; s/$x$//', '@INPUT@'],
+                                    command: [remove_cr, '@INPUT@'],
                                     capture: true)
 
   qapi_doc_ref_nocr = custom_target('QAPI rST doc reference newline-sanitized',
                                     output: ['doc-good.ref.nocr'],
                                     input: files('doc-good.txt'),
                                     build_by_default: true,
-                                    command: ['perl', '-pe', '$x = chr 13; s/$x$//', '@INPUT@'],
+                                    command: [remove_cr, '@INPUT@'],
                                     capture: true)
 
   test('QAPI rST doc', diff, args: ['-u', qapi_doc_ref_nocr[0], qapi_doc_out_nocr[0]],
-- 
2.34.1


