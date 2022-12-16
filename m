Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0826A64F415
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 23:26:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6IrL-000192-Vz; Fri, 16 Dec 2022 17:07:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6Ir1-0000ts-9I
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 17:06:58 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6Iqx-0005uU-MC
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 17:06:54 -0500
Received: by mail-ed1-x530.google.com with SMTP id e13so5498435edj.7
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 14:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y22VnmAsDUUfD7bKCVGn+CZR8vmsucMEC+QeBAK42ow=;
 b=IbI9cnoGA4zhcEDcdm/rc3qCMgyN1W9anTL3gDLJyGvkCMg4bt8fZeGvGUpeKaNQrs
 xTpi2wR3hi7iNkbWM1DdQswMgc+GTvVvdX8gJ/+5Uyjc24J6D9i2NV70KcOPLl4FK2lB
 OuBzoCoukcAjljswx6et300JoKqse7OYYqy998feFeieiJprwMuVygsL/t6S09gWxNwd
 t6JswK2Ut172EUKHk7nusDw5f+/jYl+MqFT4oDmErDMOKdBamiXrA5gWsHdJH2wpngp+
 IskVURdnSuVemsRtlqyi0+6sFHdjIwkf9wl2+CmeVVaWlyOSWulknnsX7KOSMtd2Jphb
 2FpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y22VnmAsDUUfD7bKCVGn+CZR8vmsucMEC+QeBAK42ow=;
 b=2hXDJK8gjJe0dd2OfropZyaghPudSZhj982LZN/K1WmXMNs4vfWWiYKVMkyJ1IvV3b
 meN1Uzdy5aBSwTFhf8PHGrrVf4w8YvF7uoCNim6eil9065elWhNLQkJwb+oHsaCxQ7Na
 Ewj1EQhHQOn2fZps3MV6Ua7Y705CMFwEwzMq7TfnyDphcpoxO1S3U3SRvmnG5EqLJ65U
 dGmwq8rIfq/HtUvakHWM7Nnwe/oY2iMeML1SGGG0GdxPr0bD5qVly0dmPyc+i/cSLrBv
 csswmbmAeDpnNMIVn+/oNpvTaNROxKU0DFvqPTD6mlTs2jENGNq/HlmspoX9iDvZaNJv
 LNKg==
X-Gm-Message-State: AFqh2kqKQBGT4tSTQwB/Vg9K0wgGMHbZjAjbL690CEtwfZz/IyJaBbYG
 CG8GUwElNqNH6dFfznLKl2tO0r3aSYP5s7DKD0U=
X-Google-Smtp-Source: AMrXdXur1Qndt+7ajQCO33KwDcreIT+cKbdZVwoHazlQ4LFsrAXvUeIDMggPLxREW5OPrV1TuQboiA==
X-Received: by 2002:a05:6402:2b8c:b0:466:12a0:11f3 with SMTP id
 fj12-20020a0564022b8c00b0046612a011f3mr1062813edb.22.1671228410111; 
 Fri, 16 Dec 2022 14:06:50 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 s17-20020a170906355100b007aef930360asm1281754eja.59.2022.12.16.14.06.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 16 Dec 2022 14:06:49 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Song Gao <gaosong@loongson.cn>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-ppc@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Taylor Simpson <tsimpson@quicinc.com>, Greg Kurz <groug@kaod.org>,
 qemu-riscv@nongnu.org, Max Filippov <jcmvbkbc@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 10/10] target/xtensa/cpu: Include missing "memory.h" header
Date: Fri, 16 Dec 2022 23:05:39 +0100
Message-Id: <20221216220539.7065-11-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221216220539.7065-1-philmd@linaro.org>
References: <20221216220539.7065-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x530.google.com
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


