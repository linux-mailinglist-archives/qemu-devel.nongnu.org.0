Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F4B6DCAA9
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Apr 2023 20:22:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plw92-0002nB-Ut; Mon, 10 Apr 2023 14:21:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1plw8q-0002hc-Ej
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 14:21:27 -0400
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1plw8n-0000it-FT
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 14:21:23 -0400
Received: by mail-il1-x12b.google.com with SMTP id g3so3563217ilk.7
 for <qemu-devel@nongnu.org>; Mon, 10 Apr 2023 11:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112; t=1681150879;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j6xfwtkUnMMc9RuZ0yputW7S+NamT6FMav/Lxfc/8zI=;
 b=2wOLXIEMD9M4InDSizyfpjzYQ4mcJ/M5j4hDVWyh6d2XLMDSsIRZPjJ3+8yzx/pBC9
 370KYilvb9kqghtBena6uPr9sn7sTysKYzpD5xfRJLyK+n3zyamU7SWyCb5HZkiiGgCa
 W85hnlP4CdXJkpWyRMbtjHpCr9TI/CHXqbN4FL23+V7AU8x0u4J0pMk+Atn8jn7IgDaF
 kdwequfNiHvg7TVn8xumdIK/eU5wvPQVVwgEMX4QpFbyVioLePyqZE6fJVNgs/dWHQnz
 TIb0NhfPjDiN+z9jOaYBRH4v6swCwgRnfib4rYPMfwFyoGY8JKtRgopPjEMZmeClDPh+
 LgFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681150879;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j6xfwtkUnMMc9RuZ0yputW7S+NamT6FMav/Lxfc/8zI=;
 b=5T7+hbnhCeeFe0bLwDukuGX644GvCyglcUiDjMZMb+Ox85wJ2oG7DXwFzfQPIGKx9z
 LPj3nnNoup5Wyxt6tp+d0bie+805lBaiPLv+gDfrtweTlIW3ITADCGrhlgxGM/9NC0KY
 1w98/Jh5n60ff9C762efFq2CDIZ+VoeVpx6mNAN35eg+2Pxr+SIGHW07j4SEKHQslcGo
 w69atOOe+U9/66Q9gJCeWhb2BnLX5Hrbt4/lEf+6PoXptLmP9PrZrCs9fqf2kxUyx+8o
 Q0v0hi6ZKtFXlX9PipCmwbeXaUga5mklSAUzTM5z+vEkJ8a3/5xsOgPffAU3dPZgqCIW
 8tbQ==
X-Gm-Message-State: AAQBX9cQaFe/S97oob3BNQEtDRxPST43HJYXOaVR1cQhz7FBeWXFt7ZM
 jmPiSFoG3AAH+WdYIgTwwlG7UddlTorqgJveOd8=
X-Google-Smtp-Source: AKy350aYAvMb3EiL5+itcU/BlczzuC/i0Eas4pdtkiCugLZs8WGVhhfZkI7/5eLzDO/3KWsbCJpFsA==
X-Received: by 2002:a05:6e02:683:b0:328:7544:b1bf with SMTP id
 o3-20020a056e02068300b003287544b1bfmr4696584ils.23.1681150879661; 
 Mon, 10 Apr 2023 11:21:19 -0700 (PDT)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 a15-20020a056e02120f00b00313b281ecd2sm3104314ilq.70.2023.04.10.11.21.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 11:21:19 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: jrtc27@jrtc27.com, riastradh@netbsd.org, Kyle Evans <kevans@freebsd.org>,
 Ryo ONODERA <ryoon@netbsd.org>, Brad Smith <brad@comstyle.com>,
 Warner Losh <imp@bsdimp.com>, reinoud@netbsd.org,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 16/19] bsd-user: Implement SIGSYS on arm
Date: Mon, 10 Apr 2023 12:20:53 -0600
Message-Id: <20230410182056.320-17-imp@bsdimp.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230410182056.320-1-imp@bsdimp.com>
References: <20230410182056.320-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12b;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12b.google.com
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


