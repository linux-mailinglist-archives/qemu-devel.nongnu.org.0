Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6BD3CEC05
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 22:09:28 +0200 (CEST)
Received: from localhost ([::1]:48958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5ZZv-0002ru-TB
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 16:09:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5ZS3-0007JU-OL
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 16:01:19 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:44653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5ZS2-0005we-5e
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 16:01:19 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 p4-20020a17090a9304b029016f3020d867so898018pjo.3
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 13:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I75nMdj/5jTUf39xoEvvQEaNsHzEMl4g6sFKLKBsn2U=;
 b=g4rtmzo/ApbdnrLPDPjEuf7YaGWLh3KJ9ARzuRjGpEoxFGAi+hMH2gMGhe+t80Aoe7
 iPvhcOW6+WOaioCgTZvOzZa7jxOgHX0xVEiBSVlCkmyTbWlIsiA+TPF5y52jkYZN8bT7
 ahly1OcG/IE0YJ0QBFbuyQtQp3OgctIct7PM6NrGc6Q2rDJvOeWZhCjtt/y/YUrrfRd1
 nIjpXuJEgHrnJzlX8J1wTMYHTsgZJVsQOfbNYnlllbSrT4wLAZCSfTDC/fLmbsHAZs9u
 RRdHk9QfCKZ47gFvggZF5CQKZEUK1cWpBTNWSnE3SJ1nr2FeQHjO18HyyTlSIHWsz20P
 r6YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I75nMdj/5jTUf39xoEvvQEaNsHzEMl4g6sFKLKBsn2U=;
 b=mzCkyr2fGAeZeIqtSNcEtI3kKjLJIviqfUhmtqd7RgNJkHsMVH4+b1tMHea2agzNAd
 gzNtNwsR+xSxq7NOnaD85u7P0CH29ITczFtCepbJI+HackHgCkS564nTo2LvFjnfRB7D
 iaysyhZu68Gxd7qg1PSKOkoePChgNbCus2NMfyQ0aGXrYCA49oHNa3J9NqeBBNTUrCly
 ABa8gLXRlPrEgyx7VJ4lXvDQtiqFgKG/L2+RVfiSaM5+KKidhg7nNB9JK4OiJMrM/8RB
 0kE11FRcpwcYyvkXCZjNwlwUBiNBtBauu+2qfgcF3mYeM4h80GM9J2YJQa6J/QX9wmBC
 62wQ==
X-Gm-Message-State: AOAM531le2jgk+fKRZ5znNNtFeNSev6XPC+Yak/VhXIXsn+Os0fgX73j
 m8zB57rN4Bo8fHVWsMa0vHtuzEacSJh2H7Ut
X-Google-Smtp-Source: ABdhPJzSep8YPC8COSezRx713IAFOWcA9FjgTi3sxW5GR9gG98RUrM55E79FKe0l8bU7f3MPajKV5Q==
X-Received: by 2002:a17:90b:338d:: with SMTP id
 ke13mr31956174pjb.151.1626724875996; 
 Mon, 19 Jul 2021 13:01:15 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id m7sm16962953pjf.0.2021.07.19.13.01.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 13:01:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] configure: Add -Werror to avx2, avx512 tests
Date: Mon, 19 Jul 2021 10:01:12 -1000
Message-Id: <20210719200112.295316-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When using clang, we get

ERROR: configure test passed without -Werror but failed with -Werror.
       This is probably a bug in the configure script. The failing command
       will be at the bottom of config.log.
       You can run configure with --disable-werror to bypass this check.

What we really want from these two tests is whether the
entire code sequence is supported, including pragmas.
Adding -Werror makes the test properly fail for clang.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 configure | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 63f38fa94c..cf4616f635 100755
--- a/configure
+++ b/configure
@@ -3884,7 +3884,7 @@ static int bar(void *a) {
 }
 int main(int argc, char *argv[]) { return bar(argv[0]); }
 EOF
-  if compile_object "" ; then
+  if compile_object "-Werror" ; then
     avx2_opt="yes"
   else
     avx2_opt="no"
@@ -3914,7 +3914,7 @@ int main(int argc, char *argv[])
 	return bar(argv[0]);
 }
 EOF
-  if ! compile_object "" ; then
+  if ! compile_object "-Werror" ; then
     avx512f_opt="no"
   fi
 else
-- 
2.25.1


