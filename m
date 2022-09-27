Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 491AE5EBFAE
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 12:25:45 +0200 (CEST)
Received: from localhost ([::1]:41206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od7mY-00012U-Tm
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 06:25:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1od7aI-0001HZ-Id
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 06:13:02 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:41777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1od7a4-0002U8-Qz
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 06:13:01 -0400
Received: by mail-wr1-x436.google.com with SMTP id t14so14196426wrx.8
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 03:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=GLFHpYK2uYHTqgCRso0xwWMXytcOMYQaJsHAn18FQd4=;
 b=OncPQMB6JLaNtutPOIjDeYSrTZWMRK2iGPsHrUJccw92MsoSYCgtgU2ZzDcqkryLn1
 LimZXN/bYy+9uSRacYYrw+2H8KsW3gPZ79mjHS0rf6Wl5QRgDNQmDTkSppOnFERAeR1a
 cFDUsfmvBbxon9i+hxlVFuaK30aNo3ZpvrDZq8IcNSq1jobQA4K6g1pxN49iLZOijGf3
 5ijiC5jqBXMdZP9DnPl5ylFxB0Z9Sk5qF40MTzekgySmi6JRETJGvbGouyTeDILf6IRY
 aNCsKoPc99KgMtGpA10MoOfmeTJilNY7C1i7viwEPCvdAW64zQilpusxpcjfewdwBLVv
 c+Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=GLFHpYK2uYHTqgCRso0xwWMXytcOMYQaJsHAn18FQd4=;
 b=zT9a0AKYw9sVxGcupNXU1Uw65wr1p6Bkbu4w1HhZfoJWBY1XNyHK+1o2a1ykBx1gkF
 fQPTF0dduxV2VSawLKgCI1ElZfQgXXW6Jb5IPiEjDDCRv6Fdh2X2OebeCJwIclhbB7vH
 XCr71JstptP/DwuhLkcQcDOsUjRSSVXGYIQv8djd8mimrOqXx2EkBoK7GmKLhvh/PD+5
 SASiFVr61DVOlKEzFq4XOi10QjidQ2eMDRO/zyhyaMbSkH5jv06ezpjvSMN+/s9vWjKw
 HqqdN9fq9R1zHgJE+MQLVtPLT0HpV87pccLNhHJiqj3b3t+ZN+wH8bfpzQMx08iSsIXH
 foBA==
X-Gm-Message-State: ACrzQf2PA7Vpv4srU6OyGgQ49sT0B7og2apIjQngxlGEpJrNO7F0U+eG
 27JU8XfyhCLKT9qWYvIQ2ricVw==
X-Google-Smtp-Source: AMsMyM6ljfHbt4fX7Mkw+cpCcOxSHFpWovgFXnJhKBHPIFIJebfJLJ0BkqZRflj5r0LZRDgXp39Z5A==
X-Received: by 2002:a5d:4bc3:0:b0:22a:4b7a:6f60 with SMTP id
 l3-20020a5d4bc3000000b0022a4b7a6f60mr16082160wrt.549.1664273566760; 
 Tue, 27 Sep 2022 03:12:46 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id
 w6-20020adfd4c6000000b00223b8168b15sm1398387wrk.66.2022.09.27.03.12.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 03:12:46 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, robh+dt@kernel.org,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH v2 1/8] hw/arm/virt: Fix devicetree warning about the root node
Date: Tue, 27 Sep 2022 11:03:42 +0100
Message-Id: <20220927100347.176606-2-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220927100347.176606-1-jean-philippe@linaro.org>
References: <20220927100347.176606-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The devicetree specification requires a 'model' property in the root
node. Fix the corresponding dt-validate warning:

  /: 'model' is a required property
  From schema: dtschema/schemas/root-node.yaml

Use the same name for model as for compatible. The specification
recommends that 'compatible' follows the format 'manufacturer,model' and
'model' follows the format 'manufacturer,model-number'. Since our
'compatible' doesn't observe this, 'model' doesn't really need to
either.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 hw/arm/virt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 1a6480fd2a..83ab1a37fb 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -252,6 +252,7 @@ static void create_fdt(VirtMachineState *vms)
     qemu_fdt_setprop_string(fdt, "/", "compatible", "linux,dummy-virt");
     qemu_fdt_setprop_cell(fdt, "/", "#address-cells", 0x2);
     qemu_fdt_setprop_cell(fdt, "/", "#size-cells", 0x2);
+    qemu_fdt_setprop_string(fdt, "/", "model", "linux,dummy-virt");
 
     /* /chosen must exist for load_dtb to fill in necessary properties later */
     qemu_fdt_add_subnode(fdt, "/chosen");
-- 
2.37.3


