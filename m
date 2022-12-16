Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EAD064F42E
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 23:33:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6IqF-0008Ti-Sn; Fri, 16 Dec 2022 17:06:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6IqE-0008SO-8R
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 17:06:06 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6IqC-0005if-4q
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 17:06:05 -0500
Received: by mail-ej1-x634.google.com with SMTP id tz12so9244412ejc.9
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 14:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/7zfPeZq+WjIXkty2hBYoHNE0awyTmMmvDRWMBbE2YU=;
 b=cqv6+1TWnHKyPW8oTuB0ooZolJMgxroYIppqtkgAcOPTuVHszNg0r8Ki7TPycRuk8o
 1tcCSTOouiy1/UiOLxlpg0QjLZlL5tRrM6hIEN7cMbh9w6MgUTsyvQS0qM3GPFyZ/t2w
 9WlUKyBB3i2WOvZLJGF8DbPGPorNtktf5wd6DQuXofxdce4b+czAHie2rp/1OVusg4gx
 JAViuyfIr0beUbpx+pHdGad70Wig66tXKR+iiUBSbIpjdCGFLHtRLz/ulxI9FwIrtp8M
 jkgVH92IEu+wtVCes+5N3gVFQcvSzpR53wqjyDz1nqth51Uk/lIaLFLzpsnEYvbMzOc4
 t3pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/7zfPeZq+WjIXkty2hBYoHNE0awyTmMmvDRWMBbE2YU=;
 b=EDTeR2DiFHCi9Mv8z7vDQzm8bOTdj3iFJfylMH3Wq3VvoFpt5XtLxsST5eju6gNvFB
 Sw7rz5iuv5USpa9d5EDNyS3Dw6fS9AxhiEBI1ohm2IJgsBFCMjefuePEdyFXrCVZNYR8
 fUoMFArELq1Z+ufP92/NAZBCCLEz+hIPf/bvsCLJkxtTEzlkXP15SCRFGeQumqmcNoHf
 NjOiFORSpOLNXOYY0Yu7fIgZGL6jiRvINqHj6fh/p+/gmn+xtkPiLl0FcCdolfwvAVdP
 qxBoNvEcvK32IyhOLcBhgJTuuGv9tmtV0WKGO2STTpy+CMYP0ZrK52qGmHL6VsurB1jE
 m0GQ==
X-Gm-Message-State: ANoB5pmQC66Kf3NtInp6UU+QynxcblAXzTS9lJ2crjJhSHhDBJq1sLLD
 U8WtYvLfX2i7IMGCb34Ogps2n5f4DXgxkQtUO44=
X-Google-Smtp-Source: AA0mqf6obnHAVEockmSb5IZPjTsRxEEKMGnKgzqGNT7FzFTmrLrYgQiy9mxLLIIJ9DPUI31xrRfXBQ==
X-Received: by 2002:a17:906:e215:b0:7c1:844d:7447 with SMTP id
 gf21-20020a170906e21500b007c1844d7447mr17307071ejb.35.1671228362486; 
 Fri, 16 Dec 2022 14:06:02 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 b18-20020a1709063cb200b007be3aa82543sm1290715ejh.35.2022.12.16.14.06.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 16 Dec 2022 14:06:02 -0800 (PST)
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
Subject: [PATCH 03/10] target/loongarch/cpu: Remove unused "sysbus.h" header
Date: Fri, 16 Dec 2022 23:05:32 +0100
Message-Id: <20221216220539.7065-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221216220539.7065-1-philmd@linaro.org>
References: <20221216220539.7065-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x634.google.com
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

Nothing requires SysBus declarations here.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/loongarch/cpu.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
index e15c633b0b..c8612f5466 100644
--- a/target/loongarch/cpu.h
+++ b/target/loongarch/cpu.h
@@ -13,7 +13,6 @@
 #include "hw/registerfields.h"
 #include "qemu/timer.h"
 #include "exec/memory.h"
-#include "hw/sysbus.h"
 #include "cpu-csr.h"
 
 #define IOCSRF_TEMP             0
-- 
2.38.1


