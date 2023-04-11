Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 221A66DE21D
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 19:13:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmHWN-00043O-Ue; Tue, 11 Apr 2023 13:11:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pmHW3-0003t0-8R
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 13:10:47 -0400
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pmHVx-0006AH-Ku
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 13:10:46 -0400
Received: by mail-io1-xd2c.google.com with SMTP id bh15so14127959iob.9
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 10:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112; t=1681233039;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j6xfwtkUnMMc9RuZ0yputW7S+NamT6FMav/Lxfc/8zI=;
 b=z8mqc1eslUcJUL57ZREmXFvPow6rPM8SoM59ItEKXxQ8UaepEGkq89giOgs5os0rtB
 yf6nIR+MaOIKuKwBYLhP6hTZHGHBi7eFlQKptgHvej8qAeV9etblW5wFuuJ1OVpUVjA+
 TNcZm73acPMjkc6i6Q6Ig1QQTZRPV2Myn02Tv3kpzmafqFbPUWzSyNQmvJ4E8Gvgv1Bf
 r/1x0ePNM425JOl25GdWuyfkyBIdsyZ7Hg8niypgRikzWWKpuaNTeVaNACfPBTqO9EA/
 ZkKXqAvjvTSfTqK0cQOxXsR6O/S15ZZaek1XS1qO6Ioeg2WIXiQVrat7IEhW8QtMkO3X
 yllA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681233039;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j6xfwtkUnMMc9RuZ0yputW7S+NamT6FMav/Lxfc/8zI=;
 b=NMFs5odrSzsV7ipkFSsc2cJQdYVrs7e4JccIH+FizBqVv/b1HytfTXh2lAX+aUMGkp
 gJudjvdR6SdQvf9OPLn9tMNaqAMN6gToceJw8pIhMLw6uB9laHVHVOr2RK+O5iezc1jN
 0CVrVBITw4lmXRYZU4D5w6ZddoDEhmaVqFNPk39f+cyHMTaNCTct8bzuM1guqjWj3zbH
 T0KBEDLtJw1Sm0UYID8OeJJnaqXF7jYGPW5coC4/Idi9hLI53V6KzmCQk5Keol0nM19u
 mnCQZSGpcK8mbkeQ2c8zYJH3G0URAEzwqCpfpnhwpTgQz8NPLN7OUv2AktvL2Tpa+jGE
 uqcw==
X-Gm-Message-State: AAQBX9euNcMgqOPL2+P/1FqinP0XeNSN70X1LsNOMEqXx8D3rzCl49x+
 T0gH0HipK8N06uKwNW5Vpc9oplb47PEmNvnj7Q8=
X-Google-Smtp-Source: AKy350YBPRjYM+lt4bDFzrGZqMFCgtu0peNDpykTgU+TsVZD6DrQgaJpBl+by+bxOhuLEx7jdqRWmg==
X-Received: by 2002:a5d:8455:0:b0:760:2130:fc8e with SMTP id
 w21-20020a5d8455000000b007602130fc8emr11046453ior.21.1681233038731; 
 Tue, 11 Apr 2023 10:10:38 -0700 (PDT)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 d36-20020a0285a7000000b0040b11b7ef54sm4140942jai.39.2023.04.11.10.10.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 10:10:38 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: ryoon@netbsd.org, kevans@freebsd.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, riastradh@netbsd.org, brad@comstyle.com,
 reinoud@netbsd.org, jrtc27@jrtc27.com,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Warner Losh <imp@bsdimp.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 16/20] bsd-user: Implement SIGSYS on arm
Date: Tue, 11 Apr 2023 11:09:51 -0600
Message-Id: <20230411170955.17358-17-imp@bsdimp.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230411170955.17358-1-imp@bsdimp.com>
References: <20230411170955.17358-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

When a system call returns ENOSYS, send a SIGSYS to the process (to
generate a core dump).

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/target_arch_cpu.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/bsd-user/arm/target_arch_cpu.h b/bsd-user/arm/target_arch_cpu.h
index 517d0087644..c4b21fef713 100644
--- a/bsd-user/arm/target_arch_cpu.h
+++ b/bsd-user/arm/target_arch_cpu.h
@@ -127,6 +127,14 @@ static inline void target_cpu_loop(CPUARMState *env)
                     env->regs[15] -= env->thumb ? 2 : 4;
                     break;
                 }
+                /*
+                 * Emulate BSD's sigsys behavior on unimplemented system calls.
+                 * XXX may need to gate this somehow or arrange for sigsys to be
+                 * masked in some use cases.
+                 */
+                if (ret == -TARGET_ENOSYS) {
+                    force_sig_fault(TARGET_SIGSYS, SI_KERNEL, env->regs[15]);
+                }
                 if ((unsigned int)ret >= (unsigned int)(-515)) {
                     ret = -ret;
                     cpsr_write(env, CPSR_C, CPSR_C, CPSRWriteByInstr);
-- 
2.40.0


