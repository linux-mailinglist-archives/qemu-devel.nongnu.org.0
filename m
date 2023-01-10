Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE59664514
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 16:41:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFGJl-000895-Ah; Tue, 10 Jan 2023 10:13:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pFGJc-00088H-OQ
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 10:13:29 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pFGJW-0002L7-PX
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 10:13:28 -0500
Received: by mail-wr1-x434.google.com with SMTP id d17so12112657wrs.2
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 07:13:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=V9Elq3Pte1ictUNgwaSo3zapEQwR4HWZHEsrAR06n1U=;
 b=IQ1GX5+f9xkkLBAxHRGPpbwQUrYH6iks/Ra9dTui36bHo5X72qywLPE1dphRzoh/DU
 qW2edwZjoqoBRJmJfVfDy+22GzJknKocQML96hYquFenn1hr5K6jhZBuapr7tqA1EHwu
 dwx+rdtYRenQwgEoAVWmxyDnd+UOKHKciCjH/xIFlOvLc3KBcvhFOR5ZgWayEQqw1MCX
 ZfZRldBQr5R+gDZljBl61zmSlk4YWDbb6dUhWRZA941DhuIQFjn9U5JT1IzAE+EVrDQA
 l7hZwntWbdBh1UWZje7k9fq8UgBUGaeq5Q+EPfzX0KiaY8aqw3WUXkfyona2sm8PHTl+
 TnPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=V9Elq3Pte1ictUNgwaSo3zapEQwR4HWZHEsrAR06n1U=;
 b=NNRYaEYxSFnju0MneC9Z4yq4LKQOMeSSbwYEqCC4U2Ogj+vMyPa/5DXsKeNT1B7lCg
 4DtejttXfhdtWa7xy5LWN+GkqegPAyIChpMbaF1vz6T54Bw9wxHxMQ60z1PgJka7uACj
 d3Cq0xqaOVrKpxzmKrh3KlOUIrXYBFIGlGVC0C3B5LBMP5netT3hvb420kwoZFQ+PmKk
 1SC4manvlOc6VIeNQkeAbNLaSjr+DIB7cCYWrmSrQcoGgpzNATsVvEeheK4W9Pvgm4/l
 L4xxmFSLJkpumCymFL0UnwD82T9z7u+HF3iECnmj/pwLNWScdn0JqhUtGZ9hxTxVTs4D
 WpHA==
X-Gm-Message-State: AFqh2kq8LISSUn8TIeYQaI6zLdWasY1JY21i25T8GYlmDohzBXdD1X+5
 07cJkxlJXIc+VaBDGO3uhGfz37FsDiv3W2qk
X-Google-Smtp-Source: AMrXdXugbpyQ0fCVZUDWNwkLE4qQzKAivfYIL4PO/QNg5wfS5Wj+qr08SxBe9B415UY7vRAEh+uXEQ==
X-Received: by 2002:adf:d084:0:b0:278:29ac:f894 with SMTP id
 y4-20020adfd084000000b0027829acf894mr34039491wrh.64.1673363600537; 
 Tue, 10 Jan 2023 07:13:20 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l13-20020adfe58d000000b00296730b5c3esm11506277wrm.102.2023.01.10.07.13.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 07:13:20 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH] Makefile: allow 'make uninstall'
Date: Tue, 10 Jan 2023 15:13:18 +0000
Message-Id: <20230110151318.24462-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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

Meson supports an "uninstall", so we can easily allow it to work by
not suppressing the forwarding of it from Make to meson.

We originally suppressed this because Meson's 'uninstall' has a hole
in it: it will remove everything that is installed by a mechanism
meson knows about, but not things installed by "custom install
scripts", and there is no "custom uninstall script" mechanism.

For QEMU, though, the only thing that was being installed by a custom
install script was the LC_MESSAGES files handled by Meson's i18n
module, and that code was fixed in Meson commit 487d45c1e5bfff0fbdb4,
which is present in Meson 0.60.0 and later.  Since we already require
a Meson version newer than that, we're now safe to enable
'uninstall', as it will now correctly uninstall everything that was
installed.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/109
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index a48103cc8a1..ce2f83a684f 100644
--- a/Makefile
+++ b/Makefile
@@ -150,7 +150,7 @@ NINJAFLAGS = $(if $V,-v) $(if $(MAKE.n), -n) $(if $(MAKE.k), -k0) \
 ninja-cmd-goals = $(or $(MAKECMDGOALS), all)
 ninja-cmd-goals += $(foreach g, $(MAKECMDGOALS), $(.ninja-goals.$g))
 
-makefile-targets := build.ninja ctags TAGS cscope dist clean uninstall
+makefile-targets := build.ninja ctags TAGS cscope dist clean
 # "ninja -t targets" also lists all prerequisites.  If build system
 # files are marked as PHONY, however, Make will always try to execute
 # "ninja build.ninja".
-- 
2.34.1


