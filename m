Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0B75AA506
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 03:28:03 +0200 (CEST)
Received: from localhost ([::1]:34688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTvTW-0001o2-D6
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 21:28:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tkng@rivosinc.com>) id 1oTt0t-0000Vf-TR
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 18:50:19 -0400
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c]:45899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tkng@rivosinc.com>) id 1oTt0s-00059N-An
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 18:50:19 -0400
Received: by mail-lj1-x22c.google.com with SMTP id b26so536966ljk.12
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 15:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc;
 bh=mZlvj2dJQEf8fslm0GS4F3GXJzF4Exj+Sm9anPoC8vw=;
 b=fwN4UrYAf4Et+E0QfQuE9TYnoSY0A8md6zErLM86ajtPfeiqkQrxuciisV8NTCtpG3
 0+RlzPRLnOUo6fqmUk6wBgeVXWB9P1zXZmHLTvS1/ObtRUO7DL/SdwK1SQzP7y8mCO7n
 Q+gOwppShQ2H7rOay+c9DFZOXPaZtK5gPfp/QFxaAlSQwEC5OIi+9i5trRk2v1A0qcVe
 gi/qsh3yVZnjzSQ88TJAqG/ufbEoVa2+spG2+QhftIg+Y8s89cnR6k2/scr+TwiS/fEQ
 JEB0zIVvgeNIhSVF07JdiM01wP39kXCmOVdRcsyNVKpZARig/zUTNkmqe7+iGTv3s9Lg
 Wgvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc;
 bh=mZlvj2dJQEf8fslm0GS4F3GXJzF4Exj+Sm9anPoC8vw=;
 b=MXRtj3psCdaJusGtzjURfiQoETuIiljIGlyUVu5LbQQ9Q9imbBRzkakk1O2SNI5Mz1
 YJB/K6MUEmjC1cKHzBT5XGPdi5nL2CEWeYUswfaTeCpxTZgn/+Ty/y1iKYPTQ3L77ONZ
 cOJpg/hBT0D6yjh7RIfYp89f4sfunYm2MuZ38JereAIA5Qv1278QvlNFEpBEsXNNajTy
 Bo/oqZDlBjFieA67fEUj5EfskGLhQsF3ZWx0/QAWzf8/1zoILkeQFr4DzTv2dUB7BbtW
 cua6IcrW0xGYnT3Trlo9R1v2zuP1JC3b1LmqU80gQ8tKM459B15Q1ZObdMEV60CNROZM
 fd/Q==
X-Gm-Message-State: ACgBeo0nEjq+00xXUQq//87Ew7Yxsu1yHX6GF3DBrs7MNaCZhU+Ds01S
 0FHj+9/RqrAo1lpyTn7e17e7uTLAludyBM+FhXB8DA==
X-Google-Smtp-Source: AA6agR43oprdOzxc5esJtyCZj8MVQEDSIDaFknsWH/mQQXgsrs5J7SSgxroGz+TKJSMwOZxylIDpjmsi30/5ZH7C4NQ=
X-Received: by 2002:a2e:9dc7:0:b0:266:8a7e:6226 with SMTP id
 x7-20020a2e9dc7000000b002668a7e6226mr5548735ljj.276.1662072616738; Thu, 01
 Sep 2022 15:50:16 -0700 (PDT)
MIME-Version: 1.0
From: Tyler Ng <tkng@rivosinc.com>
Date: Thu, 1 Sep 2022 15:50:06 -0700
Message-ID: <CAB88-qPD2OAxeg4WA65utUmFj4Y=SceeFTuStpZS4pPWevdBXA@mail.gmail.com>
Subject: [PATCH 2/4] hw/intc: sifive_plic.c: Fix interrupt priority index.
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: Alistair.Francis@wdc.com, bin.meng@windriver.com, palmer@dabbelt.com, 
 thuth@redhat.com, pbonzini@redhat.com, lvivier@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::22c;
 envelope-from=tkng@rivosinc.com; helo=mail-lj1-x22c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 01 Sep 2022 21:22:28 -0400
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fixes a bug in which the index of the interrupt priority is off by 1.
For example, using an IRQ number of 3 with a priority of 1 is supposed to set
plic->source_priority[2] = 1, but instead it sets
plic->source_priority[3] = 1. When an interrupt is claimed to be
serviced, it checks the index 2 instead of 3.

Signed-off-by: Tyler Ng <tkng@rivosinc.com>
---
 hw/intc/sifive_plic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
index af4ae3630e..e75c47300a 100644
--- a/hw/intc/sifive_plic.c
+++ b/hw/intc/sifive_plic.c
@@ -178,7 +178,7 @@ static void sifive_plic_write(void *opaque, hwaddr
addr, uint64_t value,
     SiFivePLICState *plic = opaque;

     if (addr_between(addr, plic->priority_base, plic->num_sources << 2)) {
-        uint32_t irq = ((addr - plic->priority_base) >> 2) + 1;
+        uint32_t irq = ((addr - plic->priority_base) >> 2) + 0;

         plic->source_priority[irq] = value & 7;
         sifive_plic_update(plic);
--
2.30.2

