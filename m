Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7562EE933
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 23:51:42 +0100 (CET)
Received: from localhost ([::1]:54636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxe85-0005ah-Rl
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 17:51:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdj9-0001pS-97
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:25:55 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:50351)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdj7-0005p3-Ph
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:25:55 -0500
Received: by mail-wm1-x32f.google.com with SMTP id 190so6378046wmz.0
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 14:25:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3jTmKcmmqBWLYbQ1cWD989jXI7AUr/FtqoKPQ00ZpaA=;
 b=JmCr9XMH0Xb/5ySjXnTL2zj8cPAsTgQNJ2XdfmLENexBJjnJtbsVgKl+4pTFOSwxGM
 bvYcgCEbrEO3qU8Xam8cLfy8CwX8GDys5m8nIKN2uDp6FwZYFZ9HHZTVjoQDU0XHmjU+
 D/NIctv2mOmnFWzaCcvTmdXkQ92s3QDfSOpnT3XTfytSuH3pJSu3q5IqezBWliQFVgT5
 apFP/C7KxsmT8lUS/XP44hhdFX8aSDXCfbfR7vVF5PD0wxu0ALVjRzADkJtUU70UcNCl
 ppnSQ25S/68/gkMsSpJyFxK1TGItTa5782GF5BA+nj6p00BSoQ6ZbfVWzf64cPrhF/lE
 K6cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=3jTmKcmmqBWLYbQ1cWD989jXI7AUr/FtqoKPQ00ZpaA=;
 b=QKG0eD3Mhi9AnStCB+ipkcGWIfq1ekKnIQ4IVvn2jO06rVitHvimVF9JpzSMK0iDqn
 XAdsm/wSYXsqy6SlDZq5cyU/NQFPklcie08QLozQaE8mmCboMmunNniQnIJqdyCwYIJM
 v/FjPNEpUxk+Q8lkQx4fCpaZW1n7GSBDhBbrTdrt5+PeclqPQGY20CBiEnNecV94VHTr
 rCwdA3PNvM3JqLqw5hj9je2dr+Po6GfMiJ/tEWF3n7HleWhourojkveYP1Rj43eqddTZ
 5QBBulJvo6T6pp6JNV4oj2Zixe21VIVkKgo4CtXc0Efly9HLMfh28gvMsAFhH1twke/a
 2p1Q==
X-Gm-Message-State: AOAM532tqpUIGN32uitwT/zsrtRXeKl4gIuS+1Ik5DPVJQ7ej7hPJRu0
 vXOidBppmAQWRHA/C2ibFyygus2YUQs=
X-Google-Smtp-Source: ABdhPJySWP2OfH3zDeQHbohqijhGKNj//KPNIRETWR+IRsQBzw41eeOhKpXMHUzNlu9Sj6QDr2gJGw==
X-Received: by 2002:a7b:c145:: with SMTP id z5mr516372wmi.164.1610058352120;
 Thu, 07 Jan 2021 14:25:52 -0800 (PST)
Received: from x1w.redhat.com (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id x66sm9249543wmg.26.2021.01.07.14.25.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 14:25:51 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 34/66] target/mips: Only build TCG code when CONFIG_TCG is set
Date: Thu,  7 Jan 2021 23:22:21 +0100
Message-Id: <20210107222253.20382-35-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210107222253.20382-1-f4bug@amsat.org>
References: <20210107222253.20382-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>, kvm@vger.kernel.org,
 libvir-list@redhat.com, Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201206233949.3783184-20-f4bug@amsat.org>
---
 target/mips/meson.build | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/target/mips/meson.build b/target/mips/meson.build
index 5a49951c6d7..596eb1aeeb3 100644
--- a/target/mips/meson.build
+++ b/target/mips/meson.build
@@ -1,9 +1,11 @@
 mips_ss = ss.source_set()
 mips_ss.add(files(
   'cpu.c',
+  'gdbstub.c',
+))
+mips_ss.add(when: 'CONFIG_TCG', if_true: files(
   'dsp_helper.c',
   'fpu_helper.c',
-  'gdbstub.c',
   'lmmi_helper.c',
   'msa_helper.c',
   'op_helper.c',
@@ -15,11 +17,13 @@
 mips_softmmu_ss = ss.source_set()
 mips_softmmu_ss.add(files(
   'addr.c',
-  'cp0_helper.c',
   'cp0_timer.c',
   'machine.c',
   'mips-semi.c',
 ))
+mips_softmmu_ss.add(when: 'CONFIG_TCG', if_true: files(
+  'cp0_helper.c',
+))
 
 target_arch += {'mips': mips_ss}
 target_softmmu_arch += {'mips': mips_softmmu_ss}
-- 
2.26.2


