Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F59F57B9AF
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 17:32:19 +0200 (CEST)
Received: from localhost ([::1]:41214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEBgQ-0001jj-DS
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 11:32:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oEBay-0002RV-Ub
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 11:26:41 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:45829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oEBaw-0005Bm-U9
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 11:26:40 -0400
Received: by mail-wr1-x434.google.com with SMTP id a5so26589235wrx.12
 for <qemu-devel@nongnu.org>; Wed, 20 Jul 2022 08:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j7LZZeIQ/sz4HsnzuYWBDPxebi7JrS8w/X6Vb6vFc3U=;
 b=ErKAfFUWDaFCW5fEZnWlNYDlVBJeFN6C9yxL139Usz3TFEmR79m/iTMU/Ew93YKLU0
 fg+7TDSGSfEd5jdUKiP5UQKPrrwMtvBJiOYA0yutTZWzYpRqIjvrJSJ9en9guJgwdR/J
 CZHj48xwmWuKtXYSbnKCc/L8zfjpUu3K/Xla4FLTl/qm9fkPEEnmLSeC9Q1IqWpIoi8E
 0kMS/jpHIhXIdjIQEC2qTOtvu8+ROVMYk7XkU2bJxuiodTn92CE1RSn2Zxge+i4knHn4
 +PxaYYciY5Wk8dlfJPeUbQGuGXjKMjVJ4PbIWfbg48sQka9WkWxNGVOBXOap6PT9otJs
 hnpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j7LZZeIQ/sz4HsnzuYWBDPxebi7JrS8w/X6Vb6vFc3U=;
 b=378sgKU2w+AFh7kORiWV+ZsE4pnUVFDSZFaBABqc6r/Wf0cVpXWIiQT1OjucwBtJSV
 x+CpSGB+/ocoyS/A+B/PybWZOFgix0YKPpTnTRhPjEMcC+KIc+4LUJ0TkHEIDcRYo5BJ
 W7nqId+bxzOsdTgiwTpewYrrmPZ7TKkSBS00wvRseN+wg+Xk49PfFTBZXZgyJoVcoWrI
 HMLrQdBsXSYNXYUEtdIRbbv03V1MIxYKAXVn/cOP9xC0vv3SgWJQvLE/EMxsngdpMC+5
 sIwP2biQkC5Ms43qRcPC6AWbXXv5b7OYw1R23lWJzR262uXCLlKifJj0XQZRWKLPlNFC
 JDBA==
X-Gm-Message-State: AJIora+oJF5UWPG0NwrB0gQcPqbJgu4gK+4HRqXEIeJ7WrtYCxYi8tJs
 rAmE8izKX9XmyZ/jXXQhWDFHuYQVD0e1Cg==
X-Google-Smtp-Source: AGRyM1tv4fF3W2anDhsF0esR84q7frAqHZFVWPHchclEj97pIi4zEMo9ew1Yroi1M037+lcjqenJ3w==
X-Received: by 2002:a5d:64c2:0:b0:21e:2e1b:d031 with SMTP id
 f2-20020a5d64c2000000b0021e2e1bd031mr7421595wri.8.1658330798265; 
 Wed, 20 Jul 2022 08:26:38 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 r10-20020a056000014a00b0021d68a504cbsm16395987wrx.94.2022.07.20.08.26.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 08:26:37 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 5/5] configure: Avoid '==' bashism
Date: Wed, 20 Jul 2022 16:26:31 +0100
Message-Id: <20220720152631.450903-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220720152631.450903-1-peter.maydell@linaro.org>
References: <20220720152631.450903-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The '==' operator to test is a bashism; the standard way to copmare
strings is '='. This causes dash to complain:

../../configure: 681: test: linux: unexpected operator

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index d0e9a51462e..2c19329d58c 100755
--- a/configure
+++ b/configure
@@ -678,7 +678,7 @@ werror=""
 
 meson_option_build_array() {
   printf '['
-  (if test "$targetos" == windows; then
+  (if test "$targetos" = windows; then
     IFS=\;
   else
     IFS=:
-- 
2.25.1


