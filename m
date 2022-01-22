Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FC7496D51
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Jan 2022 19:32:21 +0100 (CET)
Received: from localhost ([::1]:53280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBLBU-000160-T7
	for lists+qemu-devel@lfdr.de; Sat, 22 Jan 2022 13:32:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nBL4o-0005jz-VK
 for qemu-devel@nongnu.org; Sat, 22 Jan 2022 13:25:29 -0500
Received: from [2a00:1450:4864:20::433] (port=35723
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nBL4V-0007hP-Ap
 for qemu-devel@nongnu.org; Sat, 22 Jan 2022 13:25:10 -0500
Received: by mail-wr1-x433.google.com with SMTP id r14so5908929wrp.2
 for <qemu-devel@nongnu.org>; Sat, 22 Jan 2022 10:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A9W2sZCF9TsA92jrnmPwe+qydShQXcLUoRlpZNsydLs=;
 b=hY9qBsqe5YW6mXtX8cv2chdwQrP/T27eaRN2GA+0H0NFbezHCuoMHcBbmEg/ggFIm3
 apsTcKZPhWoC9Yx6h2tvc2SNzasDPjfDbPTS1rmARjqo2dmIcmyUdQ30O05+mmbixrvw
 4/pvmcxdY8P+IjiJq2eFD7BfDyRIe3vOpjsHo8x4C9hQ707OnrNgTpQ7y8OFcVybtaYk
 OoiW3m/65A62L6CfxOUVu/4QD4ysKfAW2LoVFn7dlOUY9u3rdCpRPUD9sIIuZAWh9MQG
 f6ABcPJGtURGVrFcg45tGUhA3VMg6fzcg9LOlw9qPPLcpC977LGw/Qw6oPdNG47R/fe5
 MyPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A9W2sZCF9TsA92jrnmPwe+qydShQXcLUoRlpZNsydLs=;
 b=Q46BxaQYQ8ENgJapl5fimBziZyC0hpxhZTnZYHWvNM+DZhthwczO+22rxVW4XH6uQ3
 cVqKQlCXZMKxMvKh5mlE2ZhSElRuhMHRryq+ErgC0srZvsvJr/51pMiWK7bz6atzjzuO
 BuEPDxqg1C7zElZ9cbPyyKP2dO+6MXWFr8s6MT1BPsjLZdekLwo5zjnwdrVbYVkgme9M
 mIdVXcDeMp6LV7AT6IE9E7I5KbiitJVOh8JtGSLIby5fPx7xNw32w443Mr0cZ+XoCgl7
 50i+6QpG5BFt37SY4169Yxp68Cdg6MYKuwQDyn2C8JxATMRGEgYTwMoCzW5YhblVZHJN
 ZA+w==
X-Gm-Message-State: AOAM533V/c+zMdofyRte6ZBzgQq8Vqr7L8mbJ4oDW9AMVC2IOMfrxAvc
 NnpWfZxefc3qc0xDZC03p5Ljrb6UhsJN4A==
X-Google-Smtp-Source: ABdhPJzrB873bmslKntesPqWvrfWddSqFHwBk2gylyHQ2MXAOWI0MDsPJLsOd9+BSaKkKML454gsjA==
X-Received: by 2002:adf:f7c8:: with SMTP id a8mr8433490wrq.603.1642875893344; 
 Sat, 22 Jan 2022 10:24:53 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id 21sm8870774wmk.45.2022.01.22.10.24.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jan 2022 10:24:52 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 10/14] hw/intc/arm_gicv3_its: Provide read accessor for
 translation_ops
Date: Sat, 22 Jan 2022 18:24:40 +0000
Message-Id: <20220122182444.724087-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220122182444.724087-1-peter.maydell@linaro.org>
References: <20220122182444.724087-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
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


