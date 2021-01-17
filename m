Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A352F940E
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jan 2021 17:54:18 +0100 (CET)
Received: from localhost ([::1]:38182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1BJh-0003Dd-EB
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 11:54:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1BEG-00048C-Nw
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 11:48:41 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:36788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1BEF-0001tr-98
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 11:48:40 -0500
Received: by mail-wm1-x331.google.com with SMTP id v184so7614724wma.1
 for <qemu-devel@nongnu.org>; Sun, 17 Jan 2021 08:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IdvZXWO0/2ft9HXnEBMCvSFP098rRCS4xqKPXBAMD88=;
 b=q+LybSz3hTQG0sdPiNPSWhBg9FIBb5NC04B+Ee7coimMmQUjrU7/FZA9BvTIhQ4HfU
 kKW+SH8zd7As6FUdm4x5fthoVMyvGH+YzcWQNfD/h2+y4m8jCz3OIY4gUhAYRZV+AGXt
 0QXYqU5oun5JFRRzIn0NcfkqE0PRy7iBr9krpEQt9Ne5XR7+15L/Y0LDh6Xc9Q7QPrj9
 7xk/5Oi6uOwAHbhfxsVUWN+9lw92zm4EIASm+uTgnGNVPDIZ6o1NUnmmGzWwQsaQThCp
 edAv1lrJSzgeN/XcHBnRTTkNv1aZRWFI9eZ6Uld9SzZd3owXCRFas807ENarK7R/Yb6A
 6z1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=IdvZXWO0/2ft9HXnEBMCvSFP098rRCS4xqKPXBAMD88=;
 b=n3Fc56jRaIMeE/1AV1Jh/bcVZLweLGw+PAQwOJS58aS34eqTcc6nos+2NDyV5TZw1t
 Mx70kPCBEPhC6uEZVBQFhaeZEQirMXdVRH3QvJtHifDyN+qY7gdEdJUDIiRoFC9Ziijl
 7V7hkByOGsOfttVGorHDwVE4BMLyXGoIWQMOmbhvaeFeC9SwxNmRGj0pPmBhKQxY03g8
 bCg6hPS0fTOQee+4H5a/498oPLHH+vbX1Dw/xHT3WcYTK1gonHKvjtxXZz2ehQ4YSoCf
 5WdAWHB/20Uc4YgUFbFEEQBieslwgsD3TFGuUwpL0kTeMI6b4ol8R1VRXaYyOzDXwFED
 vf5g==
X-Gm-Message-State: AOAM533iRcVGC8QzjhZ9mt/MvuFjOQUn0xHQhm1aqUqB37gm/De04TcU
 CwMeDXjo5OWI0yo8jGDJr06d35Mn+ug=
X-Google-Smtp-Source: ABdhPJySu7s0H+ZsCwsLugDNtCt67aIogtEi2clUdX79r66Ba+dIzNkbv397uoZyfTRIlrO7ANThQQ==
X-Received: by 2002:a7b:c3d3:: with SMTP id t19mr8998552wmj.151.1610902116757; 
 Sun, 17 Jan 2021 08:48:36 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id z8sm6535372wmi.44.2021.01.17.08.48.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jan 2021 08:48:36 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/6] accel/tcg: Declare missing cpu_loop_exit*() stubs
Date: Sun, 17 Jan 2021 17:48:11 +0100
Message-Id: <20210117164813.4101761-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210117164813.4101761-1-f4bug@amsat.org>
References: <20210117164813.4101761-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Riku Voipio <riku.voipio@iki.fi>,
 Eduardo Habkost <ehabkost@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

cpu_loop_exit*() functions are declared in accel/tcg/cpu-exec-common.c,
and are not available when TCG accelerator is not built. Add stubs so
linking without TCG succeed.

Problematic files:

- hw/semihosting/console.c in qemu_semihosting_console_inc()
- hw/ppc/spapr_hcall.c in h_confer()
- hw/s390x/ipl.c in s390_ipl_reset_request()
- hw/misc/mips_itu.c

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
I suppose the s390x kvm-only build didn't catch this because
of compiler optimization:

in s390_ipl_reset_request():

640     if (tcg_enabled()) {
641         cpu_loop_exit(cs);
642     }

and "sysemu/tcg.h" is:

 13 #ifdef CONFIG_TCG
 14 extern bool tcg_allowed;
 15 #define tcg_enabled() (tcg_allowed)
 16 #else
 17 #define tcg_enabled() 0
 18 #endif
---
 accel/stubs/tcg-stub.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/accel/stubs/tcg-stub.c b/accel/stubs/tcg-stub.c
index 8c18d3eabdd..2304606f8e0 100644
--- a/accel/stubs/tcg-stub.c
+++ b/accel/stubs/tcg-stub.c
@@ -28,3 +28,13 @@ void *probe_access(CPUArchState *env, target_ulong addr, int size,
      /* Handled by hardware accelerator. */
      g_assert_not_reached();
 }
+
+void QEMU_NORETURN cpu_loop_exit(CPUState *cpu)
+{
+    g_assert_not_reached();
+}
+
+void QEMU_NORETURN cpu_loop_exit_restore(CPUState *cpu, uintptr_t pc)
+{
+    g_assert_not_reached();
+}
-- 
2.26.2


