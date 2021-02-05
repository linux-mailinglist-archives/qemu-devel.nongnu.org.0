Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8048531164A
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Feb 2021 00:02:01 +0100 (CET)
Received: from localhost ([::1]:51722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8A6w-0006U1-TA
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 18:01:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8A2C-0001N2-Kv
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 17:57:04 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:42603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8A2B-0003BL-52
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 17:57:04 -0500
Received: by mail-pg1-x536.google.com with SMTP id g15so5561106pgu.9
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 14:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=C3tpiU3zelsjFSQQuB1ZzEawshUyJREYmvhF2hEYIiM=;
 b=QUAPEzlkG4XEJ7gMS87qaxkHynxo19jFCLuslZRJs4ZkqlNd8UkIyqKWpU3IA38tvA
 w3pJS5caJR1jYV/LUam/0nHmCzC5uAHIh0mxEh3YwdMmXSxLQ0e7N6BvvNNP8/2s/EeD
 +jPNfYfDn9DZznrUQBZ6LcudBt49tRqI7BZI7lIS01skmPqsqaZ8WNh/L4RWu8XQDGDX
 FVBndbGJOv0Bb60fCysHasNKwmu3DqNkK1W6VDiVPdBfF+HUdhJG/uxX+XQR4rHadDrP
 dQB7UiirpIrQSjiOklW8CGnOcXxH9yCXpm7Tfcxvvf6e7Hu96JlZHwDyBdwviP8UKvKB
 QQDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C3tpiU3zelsjFSQQuB1ZzEawshUyJREYmvhF2hEYIiM=;
 b=pgZChAsm//7kHmUs7dxYSwm2hCNpjSts35npekyor/oMjuPTvJLoKzPUdrNLf3SEn8
 ze+HANxNKie4GF0xVXnjKPik2Npx9rgPrm+gFl+eXe7a+ySL/wQ/Pn+PRAwIcivr7McY
 AvZE/zwCFmyUcN9yn57+Cz+4N9CKMNm3S0ytvu3ZdOGuhOkInPN3/BoEdi3VU5URJ2s8
 jLSZdr/e2vfsWXleZv742jiQzZ/8WVNnyDptmDuxs6Af9EAY/6p1IYQivZZIsWgXU6a9
 CILz9VByOAXs2oyCzaoBhSZD04LgO2WdXp4kCjZTfYjdYtRwGeBA+rTShXxexAC1Aoku
 ZMqg==
X-Gm-Message-State: AOAM530/zjmMggbp76GopwC+DE/3d4mNXzPijg2Hi4CmMpaO7Xf1ykJK
 E5X0A+JQAqbAIQWx1xlufptMem89Q2OsPIQY
X-Google-Smtp-Source: ABdhPJzjxDJ3yZSC1+9gvwUP3pbuep7ujyRyW1DV87uTsLhcfho4NtgTS7sBhCIGiQUf51MyHxSzVA==
X-Received: by 2002:a65:6119:: with SMTP id z25mr6366426pgu.17.1612565821947; 
 Fri, 05 Feb 2021 14:57:01 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id c23sm12155149pgc.72.2021.02.05.14.56.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 14:57:01 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/46] configure: Fix --enable-tcg-interpreter
Date: Fri,  5 Feb 2021 12:56:08 -1000
Message-Id: <20210205225650.1330794-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210205225650.1330794-1-richard.henderson@linaro.org>
References: <20210205225650.1330794-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The configure option was backward, and we failed to
pass the value on to meson.

Fixes: 23a77b2d18b ("build-system: clean up TCG/TCI configury")
Tested-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 configure | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index e85d6baf8f..a34f91171d 100755
--- a/configure
+++ b/configure
@@ -1110,9 +1110,9 @@ for opt do
   ;;
   --enable-whpx) whpx="enabled"
   ;;
-  --disable-tcg-interpreter) tcg_interpreter="true"
+  --disable-tcg-interpreter) tcg_interpreter="false"
   ;;
-  --enable-tcg-interpreter) tcg_interpreter="false"
+  --enable-tcg-interpreter) tcg_interpreter="true"
   ;;
   --disable-cap-ng)  cap_ng="disabled"
   ;;
@@ -6417,6 +6417,7 @@ NINJA=$ninja $meson setup \
         -Dvhost_user_blk_server=$vhost_user_blk_server \
         -Dfuse=$fuse -Dfuse_lseek=$fuse_lseek -Dguest_agent_msi=$guest_agent_msi \
         $(if test "$default_features" = no; then echo "-Dauto_features=disabled"; fi) \
+	-Dtcg_interpreter=$tcg_interpreter \
         $cross_arg \
         "$PWD" "$source_path"
 
-- 
2.25.1


