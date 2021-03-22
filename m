Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A773344026
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 12:49:30 +0100 (CET)
Received: from localhost ([::1]:53306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOJ3p-0006yH-Lv
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 07:49:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOJ29-00060B-L8
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 07:47:45 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:47066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOJ28-0001A5-4u
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 07:47:45 -0400
Received: by mail-wr1-x433.google.com with SMTP id v4so16339599wrp.13
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 04:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=N4bLAZpa0Mv/DogmMcknDMDCJ3VcMMy2g0mwqfqlfMs=;
 b=huqcfKD7jOV7Kz88tLQbZ2y8WsSx/eVTl7ume9xyg2uTL3j0rvrJH0YdZs0NyAvecr
 wxSp1C7KhRx59nm+m54NpRIV1PDGjero5Joujn8KDLEC9qC1999JUyCRyDBTMHCaChIv
 psL2g8MWM/WhWN1XMiOvRoR1iD5tDzRX1300zPhltudLgXEUdygIafLora2OI+ul45eN
 8qDSPM2uu77uPXEFHeFIWvWZ2T9CSEvhXbohIcV/H0a+oaC3UT9WmqgnftdFkrq3zWps
 mpubzoaBTUC2cjPbpNjEnSdQ8vakxN6WWTeLZlj99qAyAA4kp51rUEUs1jS+jh/uaZk5
 gNZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=N4bLAZpa0Mv/DogmMcknDMDCJ3VcMMy2g0mwqfqlfMs=;
 b=f8PuGsTCCmH7er/Ex8pj1hhIJv+ZvTfdfi1v+gTeMg2L4uFo38G+PK69WIoEBmf4uX
 k4H4qaCSn/ooYk5UUrHoPjI6aK/UAZT4UROQMe40mfBg0MXOEgX9vN9+zu5leAbYsthC
 or9IPALBdH/IraDwwfH1C5FF8Nz6ck0b+YqxIwps0/AXpDxYsAOSnsfq6Yb/fwjj0UpF
 VBa3l44zHykvmwokCIiDeIlvVRq6sNeFMzgGt4qGLjO5CHFOHq4RDFj+wh1D5vnXHoUB
 3QGNMg+gln6JN5HwyspKToJVKKSHKMCyFmkuVmLbtvZRkxw1KnrjoLOWw8SS0fdFH3/O
 fz1Q==
X-Gm-Message-State: AOAM533VTMiHZz0sv5fK1ned1Jq2iDP14+ONRDjtYXDz1OmsVxx+inKq
 P4Ztt0doG9FD07ZEQqK9zUhWK9PQQlBDng==
X-Google-Smtp-Source: ABdhPJxz9/4468I76BKex7bduD/0RCFDosB/7aA1lblpWXFB6Xd3rQV8nybxwzBCFuvTTdLU1RgnbA==
X-Received: by 2002:a5d:4d09:: with SMTP id z9mr17432898wrt.426.1616413662297; 
 Mon, 22 Mar 2021 04:47:42 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id i17sm18863574wrp.77.2021.03.22.04.47.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 04:47:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] tests/meson: Only build softfloat objects if TCG is selected
Date: Mon, 22 Mar 2021 12:47:39 +0100
Message-Id: <20210322114739.4078408-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Emilio G . Cota" <cota@braap.org>, Claudio Fontana <cfontana@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The previous attempt (commit f77147cd4de) doesn't work as
expected, as we still have CONFIG_TCG=1 when using:

  configure --disable-system --disable-user

Use Meson's get_option() instead to remove the softfloat tests
when building with --disable-tcg.

Suggested-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Alex Bennée <alex.bennee@linaro.org>
Cc: Emilio G. Cota <cota@braap.org>
---
 tests/meson.build | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/tests/meson.build b/tests/meson.build
index 55a7b082751..250fbc99a36 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -76,11 +76,8 @@
      workdir: meson.current_source_dir() / 'decode',
      suite: 'decodetree')
 
-if 'CONFIG_TCG' in config_all
-  subdir('fp')
-endif
-
 if not get_option('tcg').disabled()
+  subdir('fp')
   if 'CONFIG_PLUGIN' in config_host
     subdir('plugin')
   endif
-- 
2.26.2


