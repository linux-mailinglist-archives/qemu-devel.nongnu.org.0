Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0322F6437
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 16:22:31 +0100 (CET)
Received: from localhost ([::1]:42914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l04SD-0001X1-Uw
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 10:22:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l04Gk-0006O1-3M; Thu, 14 Jan 2021 10:10:38 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:39918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l04Ge-0004GC-Nl; Thu, 14 Jan 2021 10:10:37 -0500
Received: by mail-pj1-x1034.google.com with SMTP id u4so3346709pjn.4;
 Thu, 14 Jan 2021 07:10:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PiPI+CgLlpFSv2u7mJkxDRuWofaYNb842QPJItTkQ38=;
 b=VtN1Hex8SLAWi0tzmh4xr7xl5JyM2k2/LJjWGfFuytPyc/o87flnfDgp7c3PnHaGFa
 2ohTFqIgnRx60iiiH9J2ivZyAWnE8X2+btWMopgm0ZuUWzDQOB4lyN8f0dkMU0cM5QBR
 YnzosbadCdLaeOVUoJ0Tew5x7LI4QIRKpw9AQ8ewC7vMroR7hihZSClW+EoYnEkLi+8O
 Oes+19Q+BgbKaIxoPbvcOTHgdkDkyHhXjw6FmzevH53UOlrUvcp+156lgWUCL5clfSGk
 J4rAEzfy//l3zbLhm6UeljMSkOiwyDCvdMzzRRYExN5rQ4QcjZOGnzpzUxzocALNrjxk
 CpXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PiPI+CgLlpFSv2u7mJkxDRuWofaYNb842QPJItTkQ38=;
 b=UJXhOTtVKQHdKSESRwVTurQ5oy725yMKy+ZU7QK5r+xgKPoy1cdtMB3dddvgR6Oi9S
 tWc0kmJqTMtNNN+sDZCthT5g6GGHGy+Hf/iVp+5IgsE7FIM5x5xrj5m69HAKj+0j1MT5
 CJ6D33TK2P62lMwrw2fzYzF8Wmpmq9d/3Tn1ty0A25uF9GUbfuVDvedIW/ptBghqXFfs
 TdG2WfjK17nYrvzpOmWJg8Sju4PKxjHsnJGic3IMiMqBOjbPV8HyIe0wn9A2ZMF5P5jn
 5w2rFj1Q8EsIks3IHcm/c8xvqMt2YTSnqQnhNpPrbnDqgPsDhgQwRpo7bYtamvr8a+VW
 Pzzg==
X-Gm-Message-State: AOAM5337Tb+sC/ub9+zPoOW/92xZDawuEmr+kK6mpXfhntniFRVUNp5D
 ysYrhZP4vUtZphar7s9BmlV8QjS3ZC4=
X-Google-Smtp-Source: ABdhPJzJWqjRCX51uPGs37ALsVHRkmRBaeMow6KAZv2IU598Yh3H238v6RnHptF0z6lcY0tYD33e5A==
X-Received: by 2002:a17:90a:eac3:: with SMTP id
 ev3mr5290708pjb.27.1610637030962; 
 Thu, 14 Jan 2021 07:10:30 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id w21sm5372051pfq.67.2021.01.14.07.10.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 07:10:30 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Francisco Iglesias <frasse.iglesias@gmail.com>
Subject: [PATCH 6/9] hw/ssi: xilinx_spips: Fix generic fifo dummy cycle
 handling
Date: Thu, 14 Jan 2021 23:08:59 +0800
Message-Id: <20210114150902.11515-7-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210114150902.11515-1-bmeng.cn@gmail.com>
References: <20210114150902.11515-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

The description of the genenic command fifo register says:

  When [receive, transmit, data_xfer] = [0,0,1], the [immediate_data]
  field represents the number of dummy cycle sent on the SPI interface.

However we should not simply use the programmed value to determine
how many times ssi_transfer() needs to be called to send the dummy
bytes. ssi_transfer() is used to transfer a byte on the line, not
a sigle bit. Previously the m25p80 flash model wronly implemented
the dummy cycles for fast read command on some flashes. Now this
mess is corrected and SPI flash controllers need to be updated to
do the right thing.

According to the example in the ZynqMP manual (ug1085, v2.2 [1])
we need to convert the number of dummy cycles to bytes according to
the SPI mode being used, and transfer the bytes via ssi_transfer().

[1] https://www.xilinx.com/support/documentation/user_guides/ug1085-zynq-ultrascale-trm.pdf
    table 24‐22, an example of Generic FIFO Contents for Quad I/O Read Command (EBh)

Fixes: c95997a39de6 ("xilinx_spips: Add support for the ZynqMP Generic QSPI")
Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/ssi/xilinx_spips.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/hw/ssi/xilinx_spips.c b/hw/ssi/xilinx_spips.c
index a897034601..787de60f24 100644
--- a/hw/ssi/xilinx_spips.c
+++ b/hw/ssi/xilinx_spips.c
@@ -191,6 +191,10 @@
     FIELD(GQSPI_GF_SNAPSHOT, EXPONENT, 9, 1)
     FIELD(GQSPI_GF_SNAPSHOT, DATA_XFER, 8, 1)
     FIELD(GQSPI_GF_SNAPSHOT, IMMEDIATE_DATA, 0, 8)
+#define GQSPI_GF_MODE_SPI     1
+#define GQSPI_GF_MODE_DSPI    2
+#define GQSPI_GF_MODE_QSPI    3
+
 #define R_GQSPI_MOD_ID        (0x1fc / 4)
 #define R_GQSPI_MOD_ID_RESET  (0x10a0000)
 
@@ -492,7 +496,30 @@ static void xlnx_zynqmp_qspips_flush_fifo_g(XlnxZynqMPQSPIPS *s)
                 }
                 s->regs[R_GQSPI_DATA_STS] = 1ul << imm;
             } else {
-                s->regs[R_GQSPI_DATA_STS] = imm;
+                /*
+                 * When [receive, transmit, data_xfer] = [0,0,1], it represents
+                 * the number of dummy cycle sent on the SPI interface. We need
+                 * to convert the number of dummy cycles to bytes according to
+                 * the SPI mode being used.
+                 *
+                 * Ref: ug1085 v2.2 (December 2020) table 24‐22, an example of
+                 *      Generic FIFO Contents for Quad I/O Read Command (EBh)
+                 */
+                if (!ARRAY_FIELD_EX32(s->regs, GQSPI_GF_SNAPSHOT, TRANSMIT) &&
+                    !ARRAY_FIELD_EX32(s->regs, GQSPI_GF_SNAPSHOT, RECIEVE)) {
+                    uint8_t spi_mode = ARRAY_FIELD_EX32(s->regs, GQSPI_GF_SNAPSHOT, SPI_MODE);
+                    if (spi_mode == GQSPI_GF_MODE_QSPI) {
+                        s->regs[R_GQSPI_DATA_STS] = ROUND_UP(imm * 4, 8) / 8;
+                    } else if (spi_mode == GQSPI_GF_MODE_DSPI) {
+                        s->regs[R_GQSPI_DATA_STS] = ROUND_UP(imm * 2, 8) / 8;
+                    } else if (spi_mode == GQSPI_GF_MODE_SPI) {
+                        s->regs[R_GQSPI_DATA_STS] = ROUND_UP(imm * 1, 8) / 8;
+                    } else {
+                        qemu_log_mask(LOG_GUEST_ERROR, "Unknown SPI MODE: 0x%x ", spi_mode);
+                    }
+                } else {
+                    s->regs[R_GQSPI_DATA_STS] = imm;
+                }
             }
         }
         /* Zero length transfer check */
-- 
2.25.1


