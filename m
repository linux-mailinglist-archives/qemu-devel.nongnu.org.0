Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D40049C1F5
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 04:16:47 +0100 (CET)
Received: from localhost ([::1]:35526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCYne-0006aD-Ha
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 22:16:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nCYkr-0005GE-L4
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 22:13:53 -0500
Received: from [2607:f8b0:4864:20::430] (port=39685
 helo=mail-pf1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nCYkp-0006mO-Sv
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 22:13:53 -0500
Received: by mail-pf1-x430.google.com with SMTP id a8so16163606pfa.6
 for <qemu-devel@nongnu.org>; Tue, 25 Jan 2022 19:13:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2llNbxjMfpf2Jukwmedk46mb2VnuNKQYb+fp7nUZSRE=;
 b=lgOKmRiB+WwzX+NSjAV0VqhmkrnhLtnv7uI/2i+oJFQHzvIfhaGtPF5Yc2+xN8F94N
 /Ro/lExByzM8LjS/+UCgG8pJsI11/HCdwZRk+y5OLmRaHazNKaKfNQ7HtukvvmneucUi
 ufU6isYaz49Bw7xta5MG+1sMOs7Hq4oj0dUSqpMos2a1i2eaIF5QhLoRtl4MAWSNYJXg
 9GiPQtIzLz89P2Fuhr0owEbeOX4dnHZNoDRgY4AotfD2HtBJPxkP0la8OyvGbwQj6MiE
 HKi4QDX97LCNuiub12a9C5ADNpiKnoIXqS/o3SLv9sVthxRaH83pp3nfu1jqhVp0qpzN
 of8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2llNbxjMfpf2Jukwmedk46mb2VnuNKQYb+fp7nUZSRE=;
 b=QaZPekAeAsD+GCzAVDa8Wb3uxO0mrZv/oRLMImNNFXh69MTI/8zP38HRJqU+o5yX4E
 7C6qn8JAFZ3DtxzmnHhHhCcuzfgHgH3nezkyvz1prCO/LxOe/yeODoF9GB3BrKKI26PT
 d23cx+GiCKYngluIC3Da7aZeHml8LQzV69y/jwUlJDbWaz9IzcFEjQA0xwgatgUL/ENK
 bP1deRPor6EksV9GJXc3bSCZfAAQ1JX4udCgIkTMCKSvPI4/Dcxk4NJfjz7A+4Zv7pFN
 caKfCTZX+PIyFqk9bBbLWfHr4rVji2CGpIi8yvaklp/nrnkVLBdMp90g1zj5HGLPWPcE
 Rhjg==
X-Gm-Message-State: AOAM5316z7w2bqh/XWxkuyt07C++bZg5g11rIazUG6IJZfUo4Sf5vti2
 ifdtUw2sLMJVcPU2A3h5nJTerVUhcOoHsA==
X-Google-Smtp-Source: ABdhPJwjsIQdkG35i2JFbQ/0y+0ljzAlurqWTVoFvLgDdkfE6CBxn4JAs2uQRZH8S9BjqX8mN9tuow==
X-Received: by 2002:a63:7f0c:: with SMTP id a12mr17577442pgd.548.1643166829765; 
 Tue, 25 Jan 2022 19:13:49 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id e6sm378696pfv.43.2022.01.25.19.13.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jan 2022 19:13:48 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/sd: Correct CMD58's R3 response "in idle state" bit in
 SPI-mode
Date: Wed, 26 Jan 2022 11:13:43 +0800
Message-Id: <20220126031345.3372-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::430
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x430.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Frank Chang <frank.chang@sifive.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

In SPI-mode, CMD58 returns R3 response with the format:

39          32 31                                  0
+------------+ +-----------------------------------+
|     R1     | |                OCR                |
+------------+ +-----------------------------------+

Where R1 has bits[0] indicating whether SD card is "in idle state".
However, according to SD card state transition table, CMD58 can only be
transited from trans to data state, which the "in idle state" bit should
not be set in CMD58's R3 response.
(But CMD8 should still have "in idle state" bit to be set in its
R7 response because it can only be transited from idle to idle state.)

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 hw/sd/ssi-sd.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/hw/sd/ssi-sd.c b/hw/sd/ssi-sd.c
index 167c03b780..7faa969e82 100644
--- a/hw/sd/ssi-sd.c
+++ b/hw/sd/ssi-sd.c
@@ -176,12 +176,17 @@ static uint32_t ssi_sd_transfer(SSIPeripheral *dev, uint32_t val)
                 s->arglen = 1;
                 s->response[0] = 4;
                 DPRINTF("SD command failed\n");
-            } else if (s->cmd == 8 || s->cmd == 58) {
-                /* CMD8/CMD58 returns R3/R7 response */
-                DPRINTF("Returned R3/R7\n");
+            } else if (s->cmd == 8) {
+                /* CMD8 returns R7 response */
+                DPRINTF("Returned R7\n");
                 s->arglen = 5;
                 s->response[0] = 1;
                 memcpy(&s->response[1], longresp, 4);
+            } else if (s->cmd == 58) {
+                /* CMD58 returns R3 response */
+                DPRINTF("Returned R3\n");
+                s->arglen = 5;
+                memcpy(&s->response[1], longresp, 4);
             } else if (s->arglen != 4) {
                 BADF("Unexpected response to cmd %d\n", s->cmd);
                 /* Illegal command is about as near as we can get.  */
-- 
2.31.1


