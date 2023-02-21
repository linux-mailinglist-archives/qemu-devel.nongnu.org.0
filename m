Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 849DB69EA72
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 23:54:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUbUx-0007Ex-GL; Tue, 21 Feb 2023 17:52:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pUbUu-0007EC-Kz
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 17:52:32 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pUbUs-00043C-23
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 17:52:31 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 l2-20020a05600c1d0200b003e1f6dff952so4771573wms.1
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 14:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aLGg403RjaWovushz/70Glwd971m6FnAr6QdPSjBFnQ=;
 b=SaS/eGa7SOZ2SrhDwCg5tCS0eUXDTh0LMjI9WnA8kbwFK/UQxlkO/NBM50GyLwo8id
 vySatOOXan7M2V3DALOt1EQOrPadosxizfeBswapooy4x3bO18wwe1Oyxkrbg5W79SXF
 B7ThSwIXHkZ/vcW3SjdhqnfJ9r2e9ECkNU7lw6N5D2WOpS7aS9FrHWgAq1NuCDo3At6Y
 UVv7+FExoKs8rrES0GWpocfyKA+NDYu6N+FwXqAMg9/u2SZ+k0sS3OlCZfu1Cge7lFHg
 uaQQxeMhnErLQPJX3nGLfhVs2lnllmVM0JmAQF8r7p5iclqNU9NPbG6nPii/Uv9NTasn
 YKZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aLGg403RjaWovushz/70Glwd971m6FnAr6QdPSjBFnQ=;
 b=lE1QjL52zeW2mciqARhKO3WVh5PN+UHkrREuzArsCrJByVWWig94zYe7hQBd6s9QTK
 R5/BoRH5LUPb4QS8mseJTP0VVHdaIqHvrPD7JaAB59jKXp6idhyBOh+0w+Hym+XaV3dF
 Egh+an1YljePs3f4R3bfsUcgqgJg1bRkUe8IttHPFiOqYRrY66Uefm7fKPOlzM8W4Mek
 KyB1cuc2uUd9zYJrDKuB2OrR5PmkTCNaiRUC53rx2VpM8q+HB43Kvuv8upsOds/+kmdu
 X/GTDq8AIBrd3ij4wryfz8Zf6/PURCCbHmZHREOMFe05fq2LuHWRLnfThL+lXqs2m7XX
 M7kw==
X-Gm-Message-State: AO0yUKW3UxzO1v+arO27myUXmGfL8GeJi8OpoQVyDHu7WQ4itK6q+URr
 jm8ct3WzCqvPlFImHBwP2GiTug==
X-Google-Smtp-Source: AK7set9Wbob1K0zMF7c8LJqOpDfRs1fkdaaYG5NZcJUoN9MghVdfkIaJtu3hfRyab6Yl8ogV8UCbpA==
X-Received: by 2002:a05:600c:46d2:b0:3dd:37a5:dc90 with SMTP id
 q18-20020a05600c46d200b003dd37a5dc90mr10500022wmo.32.1677019948379; 
 Tue, 21 Feb 2023 14:52:28 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 hn29-20020a05600ca39d00b003db03725e86sm5952326wmb.8.2023.02.21.14.52.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 14:52:27 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 608D01FFB8;
 Tue, 21 Feb 2023 22:52:27 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 nicolas.eder@lauterbach.com, Stafford Horne <shorne@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>, mads@ynddal.dk,
 Marek Vasut <marex@denx.de>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-ppc@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Eduardo Habkost <eduardo@habkost.net>, Bin Meng <bin.meng@windriver.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Chris Wulff <crwulff@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Greg Kurz <groug@kaod.org>,
 David Hildenbrand <david@redhat.com>, Song Gao <gaosong@loongson.cn>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v3 01/24] gdbstub/internals.h: clean up include guard
Date: Tue, 21 Feb 2023 22:52:04 +0000
Message-Id: <20230221225227.3735319-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230221225227.3735319-1-alex.bennee@linaro.org>
References: <20230221225227.3735319-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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

Use something more specific to avoid name clashes.

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 gdbstub/internals.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/gdbstub/internals.h b/gdbstub/internals.h
index eabb0341d1..b444f24ef5 100644
--- a/gdbstub/internals.h
+++ b/gdbstub/internals.h
@@ -6,12 +6,12 @@
  * SPDX-License-Identifier: GPL-2.0-or-later
  */
 
-#ifndef _INTERNALS_H_
-#define _INTERNALS_H_
+#ifndef GDBSTUB_INTERNALS_H
+#define GDBSTUB_INTERNALS_H
 
 bool gdb_supports_guest_debug(void);
 int gdb_breakpoint_insert(CPUState *cs, int type, hwaddr addr, hwaddr len);
 int gdb_breakpoint_remove(CPUState *cs, int type, hwaddr addr, hwaddr len);
 void gdb_breakpoint_remove_all(CPUState *cs);
 
-#endif /* _INTERNALS_H_ */
+#endif /* GDBSTUB_INTERNALS_H */
-- 
2.39.1


