Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4113674081
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 19:05:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIZHJ-0003Pb-2H; Thu, 19 Jan 2023 13:04:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pIZH4-0003Iq-8j
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 13:04:31 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pIZH0-00011G-4P
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 13:04:29 -0500
Received: by mail-wr1-x42c.google.com with SMTP id b7so2675560wrt.3
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 10:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EduU7oyQ6B1wSk7o4iq1oV+aNe30CeGVDzVVE6Byo1U=;
 b=QjvusSrZPazJHHo5k2XB+XloUnrzKtQ2ERDBkodr16SeOL3RR/r2pp/F4BzaZ0budE
 +NuCQDGnF/S8/Gj6VX3A5PyDbTkbSHnOkfrCfWjKTOFPDMPjIhgBxK+Il37URL3KSOQY
 HHB/XWEoNIpRGpzCS7KHMTv9o4gdh13g+8OD3h0fVFIC9XPqC1PQXPTs5ZYcsPetvDWT
 VuJb0PigTY6rsmOiPOyLnmPvqtxZWrbmFkHITErAScQKSPVYULwygWlt2zPKOQRm8FLV
 CoPuirD2IYw86srunIQp1YIHNsIfT5ov/mJBWo4+H8eiyMbqcmvAs8ohLrWIof6ywj9O
 fJsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EduU7oyQ6B1wSk7o4iq1oV+aNe30CeGVDzVVE6Byo1U=;
 b=I+s6pH4ezKNpUvsRxQdGgRj1gmuFSq1QijT8rStdtuxLfmCeweQmi/Y8qLrpF8ntCR
 Aaivh9f14pq2dsQpQASmbeOzFjIMmgHDT8H46t+7Nd1vh5nrrUap9OTWnz6q7jJA6v9w
 y76nA5ABrXyntzot88ejBVrJz+aV8NrJTWIQk+DHS1u6bRVmEomu11PgDeUl7vts/2Ff
 GfFv8NGTO5FkUdot+NXziJndMIww1hpY9twlNmhqCR0IJvxXqZbj/YHaBFocljeUnx1m
 MhaFMSEpdrXdkuOdPFs/ZToppG/l3QKNK25cS1eVVd25qlDRTAo5gMJArEQPbcqpILJ7
 eb7w==
X-Gm-Message-State: AFqh2konkTRq5lJ7naFrO57FPXbhf7tABAP9rXpW0K4kkJRqQxhaan3p
 JVXwdS/LM3fdSE+AwDSJjutJqQ==
X-Google-Smtp-Source: AMrXdXv5g/JhhUyZPTVKG/FpnEXRuI7hE/sALyKSOH3kugIxJ0RLhn14z7ZyH1nadSl7HSp4Z4F8Xg==
X-Received: by 2002:a5d:59c8:0:b0:2aa:1d10:1ecf with SMTP id
 v8-20020a5d59c8000000b002aa1d101ecfmr12040123wry.37.1674151463023; 
 Thu, 19 Jan 2023 10:04:23 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 w10-20020a5d404a000000b00275970a85f4sm34162026wrp.74.2023.01.19.10.04.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 10:04:22 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2C9EE1FFBF;
 Thu, 19 Jan 2023 18:04:20 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Bandan Das <bsd@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Darren Kenny <darren.kenny@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>,
 Ed Maste <emaste@freebsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH 07/18] meson: replace Perl usage with Python
Date: Thu, 19 Jan 2023 18:04:08 +0000
Message-Id: <20230119180419.30304-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230119180419.30304-1-alex.bennee@linaro.org>
References: <20230119180419.30304-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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
---
 tests/qapi-schema/meson.build | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

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


