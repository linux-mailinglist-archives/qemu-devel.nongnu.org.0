Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1AFB39DEEC
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 16:37:01 +0200 (CEST)
Received: from localhost ([::1]:48364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqGNA-0002sd-HE
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 10:37:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqGJW-00030R-PN
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 10:33:14 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:45813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqGJT-0000Lj-SO
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 10:33:14 -0400
Received: by mail-wr1-x42b.google.com with SMTP id z8so17847506wrp.12
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 07:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j3NTNXz+uS7lfDmWPW0+9MGKzWKidvbpOVLTCYmft64=;
 b=meYNdQKI4kHqMN1YRia38Ifzbwju9rJXJqhQMlZf/LQgT8UQCe+tUE5Cz5WUutT7Uu
 Erf9w0siD/dOr2kI3EimEw7pydxMY4iSRkhA9ZphsRQ5acQ/jxzYcQXa+53uPREcg9EC
 I7XJ1nbGADLHENP5uUMQU0tdOs4J1TLrQkQmhR/jzkg43pijs4jul2gioulUExsQwV/1
 YCz1gQHTYozdgN0zSwPv4Z8FS8EfJckU9MIm+jyuk4udLExR4tmdInCoKbkuOGl4mi5u
 rAfJptLertJJnIoepPhweAn6RWh5usnuJg3TeJT8ujH9Q7AYqNQe8SluSVXap6bw/MVF
 iS3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j3NTNXz+uS7lfDmWPW0+9MGKzWKidvbpOVLTCYmft64=;
 b=jje1e9R+ZuOVU5gVskavdm2d40q2Hl9JU7tJIhZwfY5fa7sYMVXvrmSbjz3LkSqbwI
 jzWZ6Uz9JqCaDDoGL2mj+4UrvsvUWgnxpriZfbjqJhRrLs/cUbeWDq7rsUUqZdp1gkqr
 KGIG8GXx7cD+PceY/7gHULwSna0Sf/NBpb4tn+Ue6i9AZHb4ewmE287GWjmWk5QMs4K6
 Rbtnyhgcbp0Ix15pmCh9kzF1w0BRdcgq+OpXVssIGlmwHWd8U3RCSSrPuoy6BAzA4TqC
 lsmKGKWtUq8t4YvG/neLEiggUJfXBX08NPFDzFD0GBiNknQ8R879kLdRPKuLVErG+sP5
 Cc/A==
X-Gm-Message-State: AOAM532ZaXoj4GJ1pPo91BO+iCsUuG1itc0qgcgJXXlmLUCz4r3yONk/
 XTl/fMej0ahzFbisuJ5ROIfB+Q==
X-Google-Smtp-Source: ABdhPJxFVQeB8J4aBh3nF4qXBUvaD4iDLiD9itOJnlQQvBH/hpu1NYns/ShOEJi4MpOE1D8tPVMr1A==
X-Received: by 2002:a5d:4351:: with SMTP id u17mr17296640wrr.47.1623076389566; 
 Mon, 07 Jun 2021 07:33:09 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p6sm16635878wrf.51.2021.06.07.07.33.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 07:33:08 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D3C881FF8F;
 Mon,  7 Jun 2021 15:33:03 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 3/8] tests/tcg/configure.sh: tweak quoting of target_compiler
Date: Mon,  7 Jun 2021 15:32:58 +0100
Message-Id: <20210607143303.28572-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210607143303.28572-1-alex.bennee@linaro.org>
References: <20210607143303.28572-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If you configure the host compiler with a multi-command stanza like:

  --cc="ccache gcc"

then the configure.sh machinery falls over with confusion. Work around
this by ensuring we correctly quote so where we need a complete
evaluation we get it. Of course the has() check needs single variable
so we need to unquote that. This does mean it essentially checks that
just the ccache command exits but if we got past that step we still
check the compiler actually does something.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>
Message-Id: <20210527160319.19834-4-alex.bennee@linaro.org>

diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index ed6492ce59..aa7c24328a 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -222,10 +222,10 @@ for target in $target_list; do
 
   got_cross_cc=no
 
-  if eval test "x\${cross_cc_$arch}" != xyes; then
-      eval "target_compiler=\${cross_cc_$arch}"
+  if eval test "x\"\${cross_cc_$arch}\"" != xyes; then
+      eval "target_compiler=\"\${cross_cc_$arch}\""
 
-      if has "$target_compiler"; then
+      if has $target_compiler; then
           if test "$supress_clang" = yes &&
                   $target_compiler --version | grep -qi "clang"; then
               got_cross_cc=no
-- 
2.20.1


