Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC302D9F7C
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 19:48:07 +0100 (CET)
Received: from localhost ([::1]:33068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kostC-0006GZ-TN
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 13:48:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kosjf-00089y-Ba
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 13:38:15 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:40416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kosjW-0007OO-VE
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 13:38:12 -0500
Received: by mail-wm1-x344.google.com with SMTP id a3so16189043wmb.5
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 10:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DvL7rsuXwOy7A4uG7jIuuMdjlMIgZJtQ8Sw9rQv0vgk=;
 b=kXAzLtsWvoRZNkxK3QfzhePj2xCpEwPeaCxWn+hS8EOAxYHORP2YvWwjfrJVnVvPsE
 8Tlkx8zC5Q9G1DJ2ykbNA2MO3XK+2vihDVbBhyiamt12b0N+9sdBXuXFxr1EzW6HvxZM
 zL9L2cbM+QEvORrXsqF0pL5zzKDY5ACFV+L9dgpApMdTneuUglmnQA5tp0DE9xmhFUwg
 thbUNg+kismdH916KVP0g1X+s80HA/3zqzsINrVStNv/eNpf5KP4iimlNyn0ztxLfinf
 SNuSU7BrO+q17UUQv1Inb6nDwbXmE7dcF81tJeJgDX+unA0FPWD8yW1JtK2NnISt/MKg
 bJeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=DvL7rsuXwOy7A4uG7jIuuMdjlMIgZJtQ8Sw9rQv0vgk=;
 b=OUSsK1jzijtwpEhf6fa9xixrqzal6wN5nsvzptVpbmJkiPlZ6cKPofv7sFjuxjiduN
 alRME8STZFhf/9c63un96qdD1NNjn20tUtko9sgLatHcwt+E7FAD0oXpIVRu27coZoKJ
 dQMHUjWUSQxvZ7AqUSuVUCcu3m/YEi9Muw6kYz8om/qZCXePsstTnohLEGBlgfacWW7E
 LzULPWjUakU3Y8Lbg7GzPVAZNzAsuSKWn2dp5orbhkz8T4x3SzVmZwUmgWoRBR9JOZBp
 /7hIcrgUCxXPYcosY+Bfci1ea/bfEELVlve4yx0L6j/U4Gh+RqzMDxehoEqCxmJ25Stz
 +3lw==
X-Gm-Message-State: AOAM5336uvjDJkBYS9d1xI6NgahXh1TBtMnaTvLx7sHI17WwMQANl9GX
 PINUqyT4XKTaQ0SuIO1hA7Q+l5EDmZM=
X-Google-Smtp-Source: ABdhPJx3txinzJGaex7i/x3SQ8SYsfnEhn9muwCasq9NZdu9YYmx4x6odxQdU+R6stgDbXJrnCktAg==
X-Received: by 2002:a1c:4d0a:: with SMTP id o10mr30042071wmh.185.1607971082664; 
 Mon, 14 Dec 2020 10:38:02 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id n14sm32217432wmi.1.2020.12.14.10.38.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 10:38:02 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/16] target/mips: Remove consecutive CONFIG_USER_ONLY
 ifdefs
Date: Mon, 14 Dec 2020 19:37:27 +0100
Message-Id: <20201214183739.500368-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201214183739.500368-1-f4bug@amsat.org>
References: <20201214183739.500368-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x344.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>, Laurent Vivier <laurent@vivier.eu>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/helper.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/target/mips/helper.c b/target/mips/helper.c
index cdd7704789d..0692e232f0a 100644
--- a/target/mips/helper.c
+++ b/target/mips/helper.c
@@ -552,9 +552,7 @@ hwaddr mips_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
     }
     return phys_addr;
 }
-#endif /* !CONFIG_USER_ONLY */
 
-#if !defined(CONFIG_USER_ONLY)
 #if !defined(TARGET_MIPS64)
 
 /*
-- 
2.26.2


