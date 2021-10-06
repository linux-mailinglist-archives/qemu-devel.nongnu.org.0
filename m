Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19141424469
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 19:36:11 +0200 (CEST)
Received: from localhost ([::1]:41020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYApu-0002Va-3a
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 13:36:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYAdd-0007F3-4f
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 13:23:30 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:39679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYAdZ-00086U-AF
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 13:23:28 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 ls18-20020a17090b351200b001a00250584aso4459517pjb.4
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 10:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p8GaNWW3vnRejpH0QBiQY2hh87QfB4bhIFphc+bCE2U=;
 b=ytoPKlquXpwXJxu+jlWQyYkpfiLEEHa1UmeNRm7JGZv4HhS39Wacrp4mlzlj/i6Dby
 I2cc7LdoQXuaTE1NMexXLR7OZEhjsbP/Hl87LUSxqcIRt3OvvftrCNftQMbwgY/i4BwG
 ebXcJBvtv7FvoRL5j113fkFo6+fLZe0wBO+ZWoE8RR6+m6ckQEx1HB8MW3+JjptGIoeW
 wxXbUF2HfIawWRdeE8BecbJLWsgkvRdOjoeZTL6nkk2oQZHthLZZvi0H3LRfRhRfjY+k
 j39mWVx2Hp7HMzvPuuPF1qUJT6ruoE0nV0TNIgw+oA15eQQbwIzf5AtS1AXdaVr/z4aH
 NE4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p8GaNWW3vnRejpH0QBiQY2hh87QfB4bhIFphc+bCE2U=;
 b=VR/1cxYiqdMBmkDw/hG7jDD8QjRUxwbvVF0HUqUH5jUuGRphJbCUjuuEM4hVawGBJJ
 D+oxRz/UVCPfvMXyO9hq+30epxS6YyrFat9n7iDlLPK00fY2XTRbicR8muTIcXFolfPr
 ZR/PlFKgFMrpVfyLsGX2K8Dqg+NGU7amvviHBnkzb7hkYn5hrYx7Qr6HwG+m8iHqqKa7
 whKRxh753koAOQ9LDoHUlEN0Ma2/F0DdvAEyoTyHplOhkjhk1PNo59fGCHEWfJVs1QMr
 AN0xlf6Y1/qQjTO5ZyhN5Kjy/nz21gaRZ7iZ+Jtg6DY32YAoJw6B99jPeIruZWj9SM+c
 FEDg==
X-Gm-Message-State: AOAM5305QI5C6+7xGI8xRf4O4sfsOKYRVeG3hVaDHJYAgKR34HHicI8a
 1OUyuVJ2C8AGCgM8XpLMJo3JKn2r4f7hKQ==
X-Google-Smtp-Source: ABdhPJzM6rulxJDkTaIMTQYEtKOrGrj9aVFAwM/Svwqo7gAzud03Uuar8eJ1ZMksQXoBap6xa/vEFw==
X-Received: by 2002:a17:90a:b105:: with SMTP id
 z5mr11885461pjq.64.1633541004001; 
 Wed, 06 Oct 2021 10:23:24 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id w7sm21606929pfj.189.2021.10.06.10.23.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 10:23:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 19/41] hw/core: Add TCGCPUOps.record_sigsegv
Date: Wed,  6 Oct 2021 10:22:45 -0700
Message-Id: <20211006172307.780893-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211006172307.780893-1-richard.henderson@linaro.org>
References: <20211006172307.780893-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a new user-only interface for updating cpu state before
raising a signal.  This will replace tlb_fill for user-only
and should result in less boilerplate for each guest.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/tcg-cpu-ops.h | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
index 6cbe17f2e6..41718b695b 100644
--- a/include/hw/core/tcg-cpu-ops.h
+++ b/include/hw/core/tcg-cpu-ops.h
@@ -111,6 +111,32 @@ struct TCGCPUOps {
      */
     bool (*io_recompile_replay_branch)(CPUState *cpu,
                                        const TranslationBlock *tb);
+#else
+    /**
+     * record_sigsegv:
+     * @cpu: cpu context
+     * @addr: faulting guest address
+     * @access_type: access was read/write/execute
+     * @maperr: true for invalid page, false for permission fault
+     * @ra: host pc for unwinding
+     *
+     * We are about to raise SIGSEGV with si_code set for @maperr,
+     * and si_addr set for @addr.  Record anything further needed
+     * for the signal ucontext_t.
+     *
+     * If the emulated kernel does not provide anything to the signal
+     * handler with anything besides the user context registers, and
+     * the siginfo_t, then this hook need do nothing and may be omitted.
+     * Otherwise, record the data and return; the caller will raise
+     * the signal, unwind the cpu state, and return to the main loop.
+     *
+     * If it is simpler to re-use the sysemu tlb_fill code, @ra is provided
+     * so that a "normal" cpu exception can be raised.  In this case,
+     * the signal must be raised by the architecture cpu_loop.
+     */
+    void (*record_sigsegv)(CPUState *cpu, vaddr addr,
+                           MMUAccessType access_type,
+                           bool maperr, uintptr_t ra);
 #endif /* CONFIG_SOFTMMU */
 #endif /* NEED_CPU_H */
 
-- 
2.25.1


