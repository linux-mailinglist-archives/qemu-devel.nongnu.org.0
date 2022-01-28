Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F27D749FE35
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 17:38:28 +0100 (CET)
Received: from localhost ([::1]:38450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDUGZ-0007uC-Jq
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 11:38:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDTDM-0002Fn-Op
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 10:31:06 -0500
Received: from [2a00:1450:4864:20::42e] (port=45766
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDTDK-0006Qh-4C
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 10:31:04 -0500
Received: by mail-wr1-x42e.google.com with SMTP id m14so11326515wrg.12
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 07:30:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=CQsAv8YABOqsexB08r7aY1gbvaVxjjzw44jl1Mp+yhE=;
 b=ETbcbFbDVduTUsqI3F+WtAj5h/E6ARRhYYa9oRVA41FiiNHGsG9/NPOpy5OqeY0R1S
 YfGqxzN8CZekYO6EUlecIocb0ZZIZU6qCh0iS+9ho/ppSNX43a/yXtsCkPtnXnKwo40O
 YGAjKRmrlzhh4aPXtY7/bPUdANNmBZs9WyHiz1VmQGXEkuXcIim4JFSfYNTpFmYp85JO
 m8rfGEuAHtGbdHowBIPsbWKKvWHBPnB9s0Yzys6qEgPPnKhRzxk4Ma4wXkR/JqCK7T/I
 AsP/ak5gB+06jRalQAXaOp5ppxaSblJWqqtcMTR14Qa6Z5+loNZrnARaW0puBGwQVZZU
 IQ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CQsAv8YABOqsexB08r7aY1gbvaVxjjzw44jl1Mp+yhE=;
 b=gXI69fwU5sexdhhbTRrl9GBVzn3zkXc6SvUGN/e6vVZUj1bAZWqzIDgUNtArVuEqK8
 nttPpehmmLeAdfWDZCrXOwMArg3tddP42CNGQ8OWkGL5lzqSvc+mmdgwq4ip1OJrT8oH
 a1OAJ1P9r5KGkeKnKvLbNeNpQ8HJ0tK3oojFCgjDJL8PPjYrNXo3C7B/YW94yfnihYCe
 LQFSxXMNRX96TtOFtjXW7TMlZjzNqILwz7Uewt9ARuFJ8ECDm9V5G3Jod7FvUqn449YR
 WCoCChnA+ec02jkBzcHOQUrEQcUelDYKx8An+Rmw8K9VTTIdKK+SDc8mdmlu9MK+sl3s
 e8VA==
X-Gm-Message-State: AOAM531XmOMvWsH3/U7MvZ6s6/8gPit8E8RfJT+8N0SZnl+dj9wqLZnZ
 T6BTPwGVZfTUZnm7oiMfY3tcpz9OmiOADA==
X-Google-Smtp-Source: ABdhPJyrK9CF0Jwavho+ahcX55hps7/3ZIzquLk1j74wCy/MaK44e+j7gVkp4wyS8Ki++grQR6pSOg==
X-Received: by 2002:adf:e54e:: with SMTP id z14mr7624061wrm.490.1643383838803; 
 Fri, 28 Jan 2022 07:30:38 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id j3sm4749485wrb.57.2022.01.28.07.30.38
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 07:30:38 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 26/32] hw/intc/arm_gicv3_its: Provide read accessor for
 translation_ops
Date: Fri, 28 Jan 2022 15:30:03 +0000
Message-Id: <20220128153009.2467560-27-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220128153009.2467560-1-peter.maydell@linaro.org>
References: <20220128153009.2467560-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The MemoryRegionOps gicv3_its_translation_ops currently provides only
a .write_with_attrs function, because the only register in this
region is the write-only GITS_TRANSLATER.  However, if you don't
provide a read function and the guest tries reading from this memory
region, QEMU will crash because
memory_region_read_with_attrs_accessor() calls a NULL pointer.

Add a read function which always returns 0, to cover both bogus
attempts to read GITS_TRANSLATER and also reads from the rest of the
region, which is documented to be reserved, RES0.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220122182444.724087-11-peter.maydell@linaro.org
---
 hw/intc/arm_gicv3_its.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index d9ff7b88492..b17f2631269 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -813,6 +813,18 @@ static void extract_cmdq_params(GICv3ITSState *s)
     }
 }
 
+static MemTxResult gicv3_its_translation_read(void *opaque, hwaddr offset,
+                                              uint64_t *data, unsigned size,
+                                              MemTxAttrs attrs)
+{
+    /*
+     * GITS_TRANSLATER is write-only, and all other addresses
+     * in the interrupt translation space frame are RES0.
+     */
+    *data = 0;
+    return MEMTX_OK;
+}
+
 static MemTxResult gicv3_its_translation_write(void *opaque, hwaddr offset,
                                                uint64_t data, unsigned size,
                                                MemTxAttrs attrs)
@@ -1168,6 +1180,7 @@ static const MemoryRegionOps gicv3_its_control_ops = {
 };
 
 static const MemoryRegionOps gicv3_its_translation_ops = {
+    .read_with_attrs = gicv3_its_translation_read,
     .write_with_attrs = gicv3_its_translation_write,
     .valid.min_access_size = 2,
     .valid.max_access_size = 4,
-- 
2.25.1


