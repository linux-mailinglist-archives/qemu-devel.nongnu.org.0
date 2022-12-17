Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8C464FB54
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Dec 2022 18:37:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6b1m-0003J1-FV; Sat, 17 Dec 2022 12:31:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6b1L-00035L-FU
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 12:30:50 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6b1J-0002tU-Kg
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 12:30:47 -0500
Received: by mail-ej1-x62c.google.com with SMTP id bj12so12846611ejb.13
 for <qemu-devel@nongnu.org>; Sat, 17 Dec 2022 09:30:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8puYA5pXfRf+1sAx/YhGhz4X/7vHxWP4eF1HMLfQ/pg=;
 b=exXqxUszEBEoTGnuE1nd4LT88IeFXPT86bDiG9ZqD1yNPkFGGVPkoDU75QBcVVyYva
 S0Fo7LY7cQJtBqByYf+yVCTe35Bx4Uyo79EoyC+4iD54P1038ef8JO7Rs267HNejhhXP
 /czn1U0cLol3HJYLgXe6NdFdRMEy5Rz9XAGmFu3tLHI78M6yIiAIn4VLpsvueywVNJNW
 2si+QCNBzZTrISaQ9uIootdxT9bfJLCtHFcstVSIECNmoChLBA4ww6kIzCz+24N9pvb4
 sMhl7wvLsGQr6Ls8ZvcDgcyNot3t5wq6T/E+qGygVYYTyCG/QQqjvxi6YGlzdmvt28Gr
 6iVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8puYA5pXfRf+1sAx/YhGhz4X/7vHxWP4eF1HMLfQ/pg=;
 b=bYC6Dk21WpxASzHCauKpaOCsgHjamVCjUpjru7ZmParoKmzz/4gq8otVuADIIRbEE4
 Fq3fNYVX+zsMJlFUDISa4+nNvoDyG9XDThx67FVD9s8AiQAxmN9UVovdQRWyC2m2fOsS
 ucfMiMfGOEyrnjudkPey0YEwgvhsN+3Ul5SoXt/TWqC0lRAQsTRdNK8N1f7j38p1Z0MV
 FI8pUzHt/hNHzJV1wzAcadWfFnWCYKD14qSwwjLlhVU0fu7ALz+F1fd8MzsI5yzXfdCG
 zdVmPqLwV8e4xJassuygO+y9x73TgGljC6fber7uKBzyb3xXvhVPn5C+RKNem+hglhZv
 /ldw==
X-Gm-Message-State: ANoB5plZD6M2bTDhctn8fNxC/tXfwFmcXtLhYA9ZdjtxcgXF0qO4I8Uy
 DOmIaxRxh/MdHtagPOpLy7A03+fZpB9qtW7TUUQ=
X-Google-Smtp-Source: AA0mqf7qOSUm9byNo3AcaD4j13UwfpNbVjXC2y+rsu/sw5WEXY/TNHXAP/pWodGj4/dOGhI//EoEdg==
X-Received: by 2002:a17:907:1719:b0:7c0:f9ef:23a2 with SMTP id
 le25-20020a170907171900b007c0f9ef23a2mr51716123ejc.30.1671298243563; 
 Sat, 17 Dec 2022 09:30:43 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 a2-20020a170906274200b007bb86679a32sm2198820ejd.217.2022.12.17.09.30.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 17 Dec 2022 09:30:43 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Max Filippov <jcmvbkbc@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Bin Meng <bin.meng@windriver.com>, kvm@vger.kernel.org,
 qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>, qemu-riscv@nongnu.org,
 Song Gao <gaosong@loongson.cn>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 9/9] target/xtensa/cpu: Include missing "memory.h" header
Date: Sat, 17 Dec 2022 18:29:07 +0100
Message-Id: <20221217172907.8364-10-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221217172907.8364-1-philmd@linaro.org>
References: <20221217172907.8364-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Under system emulation, xtensa_cpu_initfn() calls
memory_region_init_io(), itself declared in "exec/memory.h".

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/xtensa/cpu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index 09923301c4..879710f8d1 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -35,6 +35,9 @@
 #include "qemu/module.h"
 #include "migration/vmstate.h"
 #include "hw/qdev-clock.h"
+#ifndef CONFIG_USER_ONLY
+#include "exec/memory.h"
+#endif
 
 
 static void xtensa_cpu_set_pc(CPUState *cs, vaddr value)
-- 
2.38.1


