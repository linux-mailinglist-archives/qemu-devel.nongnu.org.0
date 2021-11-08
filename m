Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BFA447940
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 05:18:10 +0100 (CET)
Received: from localhost ([::1]:54520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjw6k-0008Pa-3C
	for lists+qemu-devel@lfdr.de; Sun, 07 Nov 2021 23:18:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvi6-0006vh-QW
 for qemu-devel@nongnu.org; Sun, 07 Nov 2021 22:52:42 -0500
Received: from [2607:f8b0:4864:20::132] (port=45002
 helo=mail-il1-x132.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvi5-0002wV-DJ
 for qemu-devel@nongnu.org; Sun, 07 Nov 2021 22:52:42 -0500
Received: by mail-il1-x132.google.com with SMTP id h2so15475271ili.11
 for <qemu-devel@nongnu.org>; Sun, 07 Nov 2021 19:52:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wTJ+aNmLUuLgPbIqCfjTw0uGO5B5PIHdICe2l5V6Jhk=;
 b=At6Q16nSfw6xubgdSP7jv5+WuNGJnjyilld+vaUH6D/4kmfYjnoLaq5fm+yAkXki9S
 xddcTUQy/TI3LH0+Y7pVVGSLBqv/4kJ8I8OfF3Gs7lWelanHjWehQ1m9fPIcVbRIwPdC
 h48/xR6JIcCyBR9h3tOAEuuPRktzljDlO2bpxAcgeP0G1Q2LtuWp6JsAaIBkJbAK4vDi
 w3Bm4QM6vvAwfBK7Tl9RrdTUaiIBQ9pQyz29GYU703DZxrKkKOqf/MQYg5PMZzXKX9yq
 gs6q0Pl1CUi/FPE1etuGOpGUyz9nBVZ1Ftrq1e1PZ7Iz5wWAcr5IxYqHKxt3I3Ez5fPd
 nj2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wTJ+aNmLUuLgPbIqCfjTw0uGO5B5PIHdICe2l5V6Jhk=;
 b=3WKhfZxrpPGVmVRrAmvXhzM2WhDJmWeSDwjnHxXX1+wVv2QeXSbZnvUUMhCU6ZYWv1
 tgdYjtJxOK8JemXkLU5a/nUu+K2PGLw00s6khMdYMOvJgS/NaReEV9tAV3ye2zP4Ld25
 jrIctl30EUfJMDJfcYttIqXHX6EWvTaDW7YY/t4hDMrE8uMaNTFHiSKFHVbrgmNQQHcf
 hR/KbQmjd6T2O43iMZ4mhgbre+c/fkbAQKzfxUHlT/Ak5s6dzQJaCPZBIscecSzpuDMU
 9nyNrNrPm4GlAwfioa5/T4PTHEb+IEgS6MmW2UU7u9Wjrp1DFPHeSmGaRtHlYuS7rKdv
 5EIg==
X-Gm-Message-State: AOAM5318XET/5sx7/pDL1eLoKIB0MM4G7TWSZz5sl62y+HOBVSurZfgt
 l/1WFEJU8jmfKHcaCSLwaV3bug7mHqW3Cg==
X-Google-Smtp-Source: ABdhPJwNYreqhVlq+C8Xorb7NxcFCR2Ex+0JeIcvtKR0leJpDCq0dOCoiHTnwEbjzUr+53dM+bs59w==
X-Received: by 2002:a05:6e02:1e0c:: with SMTP id
 g12mr50847960ila.86.1636343558939; 
 Sun, 07 Nov 2021 19:52:38 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id x15sm876909iob.8.2021.11.07.19.52.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 19:52:38 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 31/37] bsd-user/arm/target_arch_signal.h: Define size of
 *context_t
Date: Sun,  7 Nov 2021 20:51:30 -0700
Message-Id: <20211108035136.43687-32-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211108035136.43687-1-imp@bsdimp.com>
References: <20211108035136.43687-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::132
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::132;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x132.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Philippe Mathieu-Daude <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Define the native sizes of mcontext_t and ucontext_t so that the tests
in target_os_ucontext.h ensure the size of arm's version of these
structures is correct.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/target_arch_signal.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/bsd-user/arm/target_arch_signal.h b/bsd-user/arm/target_arch_signal.h
index 9527335cc9..f1844dbf22 100644
--- a/bsd-user/arm/target_arch_signal.h
+++ b/bsd-user/arm/target_arch_signal.h
@@ -74,6 +74,9 @@ typedef struct target_mcontext {
     abi_int     mc_spare[33];
 } target_mcontext_t;
 
+#define TARGET_MCONTEXT_SIZE 208
+#define TARGET_UCONTEXT_SIZE 260
+
 #include "target_os_ucontext.h"
 
 struct target_sigframe {
-- 
2.33.0


