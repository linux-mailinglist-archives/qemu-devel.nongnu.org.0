Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B901370FC3
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 01:25:46 +0200 (CEST)
Received: from localhost ([::1]:52064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldLT6-0000AV-Um
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 19:25:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLMU-0008D5-33
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:18:54 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:36510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLMP-0002pt-IW
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:18:53 -0400
Received: by mail-pl1-x62e.google.com with SMTP id a11so1869707plh.3
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 16:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FlK8dyxPQbLKFRz76iH/wQkaHIReZuNQ/bKEPInvNwo=;
 b=d05CtY7iayaLxJlahht6X9YsoLiKlitlJd+90CcZBNvH2AIdRE/MyjYZ78TQFTQVoo
 7Ab8SJkABdHx7sgK5HWLk83WdNaP2mTrCugfH41s/gwFFTsF9c23ofZxfMx7CwoxMwqV
 06V13ajTMAe2BnHDB8iEuViQaNvsh9YwvWwnXprJoETUSm5XurADS0o9qwXpD+nU80nK
 6pMV9u4y5sQ7WM0tir+HP7C5APWnRzveA06SkiuynRft9rngLuSD7pV6DtbGO1jh35iV
 70lXyby4GC9yJ/Df/6wO7qqHYX3LBektRHivT3Bxgyek0cBG2o9kG7dQNR7rBHrC+7VA
 EQFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FlK8dyxPQbLKFRz76iH/wQkaHIReZuNQ/bKEPInvNwo=;
 b=C81vBMx34xpCxP6nGphWSnUqqnTDX/K/W/dUI7S2ppdv4/xbpNccF0ITTcXQns+6Zg
 DBWwcfperPsK/QdV3CeJOnj2afTIMF8aZR1Na8DJK9beyAp+1itmJTamSe1PWc6y6P3j
 hQVZ/yl6LztNKK1Fhptjfi+m1wi4+RcZrRg0F5pDSBaSffJw9IcNzUa0p80+LJPPJx6/
 EjytpFLOjbjBjjmPVmmJjtzerioP4SoyN3slm65z2uDroA2+bXsq2FpY/51Ytl2JaCKk
 scLiQqf89H8o2q+IgvBj2A1kzW5pGxadVe93P7UH1ndA9mewo0WV68ZjLL8sof0w5y7+
 aYng==
X-Gm-Message-State: AOAM5337zlrzU+TUVVuLijpgBcNEtK4K7T7ZTWfaORAPZvtczWfTYswf
 d3TLtEOc79LkuhrvCKqb2XuoCvoTWNx/ng==
X-Google-Smtp-Source: ABdhPJyxHkeacYpWKKmgtBND277w9Uc8lvdIk9Ev1lqkT6ae7UIhskal4TwzQ7StrpVQBlyUe5GlOw==
X-Received: by 2002:a17:90a:bf0c:: with SMTP id
 c12mr2978816pjs.206.1619997527518; 
 Sun, 02 May 2021 16:18:47 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id k17sm7146236pfa.68.2021.05.02.16.18.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 16:18:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 02/28] meson: Split out fpu/meson.build
Date: Sun,  2 May 2021 16:18:18 -0700
Message-Id: <20210502231844.1977630-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210502231844.1977630-1-richard.henderson@linaro.org>
References: <20210502231844.1977630-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 meson.build     | 4 +---
 fpu/meson.build | 1 +
 2 files changed, 2 insertions(+), 3 deletions(-)
 create mode 100644 fpu/meson.build

diff --git a/meson.build b/meson.build
index f04565c5bb..bc70c9a2b3 100644
--- a/meson.build
+++ b/meson.build
@@ -1932,9 +1932,6 @@ subdir('softmmu')
 
 common_ss.add(capstone)
 specific_ss.add(files('cpu.c', 'disas.c', 'gdbstub.c'), capstone)
-specific_ss.add(when: 'CONFIG_TCG', if_true: files(
-  'fpu/softfloat.c',
-))
 
 # Work around a gcc bug/misfeature wherein constant propagation looks
 # through an alias:
@@ -1965,6 +1962,7 @@ subdir('replay')
 subdir('semihosting')
 subdir('hw')
 subdir('tcg')
+subdir('fpu')
 subdir('accel')
 subdir('plugins')
 subdir('bsd-user')
diff --git a/fpu/meson.build b/fpu/meson.build
new file mode 100644
index 0000000000..1a9992ded5
--- /dev/null
+++ b/fpu/meson.build
@@ -0,0 +1 @@
+specific_ss.add(when: 'CONFIG_TCG', if_true: files('softfloat.c'))
-- 
2.25.1


