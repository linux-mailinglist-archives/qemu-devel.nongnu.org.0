Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4556885CD
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 18:59:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNdrg-00079A-Qh; Thu, 02 Feb 2023 12:59:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pNdrd-00078h-0U
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 12:59:13 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pNdrb-0002f0-AM
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 12:59:12 -0500
Received: by mail-wr1-x432.google.com with SMTP id q10so2466313wrm.4
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 09:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/kl7Wnb95W7ecCWXdcf3Ol9VrmG2bFqzs6d5O5+PjTo=;
 b=dUxYrItTKW9ho4q86/JBEbgUNcnBltA9SXwURt+1UlR31VAxxv0Xk8d463hiD2Mj3G
 uiV1HH6Oriy7Dpl2dQboF3il9fMtC/QddUVYyw5Aw4VIeCrTZCk+jmX+0SMdb3gkfkx0
 vRfbnoQ3SxBt618O5gWJd4l6OjB7YB7plERujdySMDO7HK1U6yVb0gXwVEyZy6r7LY24
 b+WwNeuPMGywkfcgwXIb+8nZ3Dr2xy5sKslnrK1/V5kMHcXgU+WS6Q/Y0Ri2jFmaDb7p
 XhbYV4bYR8KiQZSuUDrXYBYV/TpVuq97yBihk2MNZutc44UmYXrMjhx0/RhanSOfefP7
 ZrfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/kl7Wnb95W7ecCWXdcf3Ol9VrmG2bFqzs6d5O5+PjTo=;
 b=xL/CJUTlIEWoU1TPkAhcrKlqVm50aNT3HBCLjslTJ9jTuTMCOEawiYyY05espfpCaw
 JNpDjOT0R0hEnjgBxG72aaXGpry6KuFZvwUESPIlzAjZr6q0Urpip4YI6Bl1q+v8pI19
 vcXsCsxoWHSyUkqAxMmAuOOpcUbfKzbhABbxF/kS7ne+mngSqNcL6H5RLVSpFSrYUSsR
 sFZUePAWu/ICC7WeydlqpozzYVr12MQovMjY3XdalnNfCEsh1ldUCQml19oQSVaOraHR
 ABR4QVpdHRlAGYXzhv2o2WR5ZluPwjNdK15wX78yppObY6Ti5H5kx5yx923OeaWBOmqc
 VKoQ==
X-Gm-Message-State: AO0yUKXUYie0VL2Jgt1caPK7Y2YNZO3Weu2zSBFwBuy48thdLSO3N1/g
 GEZ0oyFh9d8+YseJJd8ZFJG9Ag==
X-Google-Smtp-Source: AK7set+5sPQ4jZSBT/nQg/uvkA1QsBoHQpT0GM1OP7JS6vDTZSSkq2S74Ku0OBOlzSmY4asBjak44w==
X-Received: by 2002:adf:f452:0:b0:2bf:f214:fdca with SMTP id
 f18-20020adff452000000b002bff214fdcamr6292484wrp.27.1675360749888; 
 Thu, 02 Feb 2023 09:59:09 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 j1-20020adfe501000000b0029e1aa67fd2sm65183wrm.115.2023.02.02.09.59.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 09:59:09 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E4C6C1FFB7;
 Thu,  2 Feb 2023 17:59:08 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [RFC PATCH] gitlab: call ninja directly and reduce build noise
Date: Thu,  2 Feb 2023 17:59:03 +0000
Message-Id: <20230202175903.2119702-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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

A significant portion of our CI logs are just enumerating each
successfully built object file. The current widespread versions of
ninja don't have a quiet option so we use NINJA_STATUS to add a fixed
string to the ninja output which we then filter with fgrep. If there
are any errors in the output we get them from the compiler.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.d/buildtest-template.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitlab-ci.d/buildtest-template.yml b/.gitlab-ci.d/buildtest-template.yml
index 73ecfabb8d..3c4b237e4f 100644
--- a/.gitlab-ci.d/buildtest-template.yml
+++ b/.gitlab-ci.d/buildtest-template.yml
@@ -21,7 +21,7 @@
       then
         ../meson/meson.py configure . -Dbackend_max_links="$LD_JOBS" ;
       fi || exit 1;
-    - make -j"$JOBS"
+    - env NINJA_STATUS="[ninja][%f/%t] " ninja | fgrep -v "[ninja]"
     - if test -n "$MAKE_CHECK_ARGS";
       then
         make -j"$JOBS" $MAKE_CHECK_ARGS ;
-- 
2.39.1


