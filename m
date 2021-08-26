Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA1B3F8CBA
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 19:10:07 +0200 (CEST)
Received: from localhost ([::1]:59718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJItC-0002Et-75
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 13:10:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJImg-00057p-44
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:03:22 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:34798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJImd-0008Hp-A1
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:03:21 -0400
Received: by mail-wr1-x430.google.com with SMTP id h13so6201635wrp.1
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 10:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=x/Nq7lPd453gnrtSLW1mI2yW4d8E0EVPspmERk/DwAo=;
 b=ZsTzuPdOYNgrnjhcyGELA9LpGq2TGOzomIX1TyjBFGn5qXP2//Ntjv6n+N5M+aJh4F
 IHqOeWdR+3CLXgGcJjugx0dPCsEmfeBtyZJ6K2e2PpjLJMCJ+D4QmuyCG0XbxuyuoFAD
 h3e6Y42bXyBCTodJ+CoLBiBERSp4Dix8Ya2YRayUJU5V9PsP3z44+cfhx9yEruDqaPaf
 Rxke9zFUqJS8L/HNdzw71oerdM+3i1pmiHM5P7HpNMyhY1PQxjp71AlFRx7K7YUmwBrz
 pZd5ct6WRm+8ViXp48CCmuxjvOSwXXBzfnBRmLKZXeELdnCwo9KRIy0P4JX3gWltX0yd
 GAAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x/Nq7lPd453gnrtSLW1mI2yW4d8E0EVPspmERk/DwAo=;
 b=NnGEDceYB3YcTTYeiHMQI09ZTEaprlIqU+q1zJp2VF+05Y009+6vBigvUMmbCj9kVf
 m7vhrdqmvym/hcorbYC/lEAHAEMl1N20qOP8SlahB/+/dU5Vx+0+WlziiwaG1gLJ+Wya
 SRNPtElcxwofaLJ9cFGk+XdYLeNSaB5Rty7kCHtaUzwsi8UAuKs/XKxam9bRcrLnN37D
 pR5NmI9ZwnfXqFChwOaiyH8lnLeRiq/xGj2QMtG1XDkksfB7oOrHj0NfbYlIC8rCed6B
 amYY1c097+VMVnyOogBMX3veK08zo3En2My3/5yaZvgmA3c1+Ek5Y1D9Cg0751oXidbt
 W8QA==
X-Gm-Message-State: AOAM532qd4fTCZKT66U/3082/rTTTrznBdT32wLhRewJyV6OQBkJbatI
 7ZolPDoEIVWXp2BQgknmkEL0tq0jc3/1FQ==
X-Google-Smtp-Source: ABdhPJxHD02ympb4C6d9GSEoc90ON4lpTqAhTioN6ZdjdGnUVUmhAXFGIufWeoROuyyaexiE1okU2w==
X-Received: by 2002:adf:c40f:: with SMTP id v15mr2057940wrf.316.1629997395491; 
 Thu, 26 Aug 2021 10:03:15 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i21sm3632470wrb.62.2021.08.26.10.03.14
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 10:03:14 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/37] hw/arm/Kconfig: no need to enable
 ACPI_MEMORY_HOTPLUG/ACPI_NVDIMM explicitly
Date: Thu, 26 Aug 2021 18:02:35 +0100
Message-Id: <20210826170307.27733-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210826170307.27733-1-peter.maydell@linaro.org>
References: <20210826170307.27733-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ani Sinha <ani@anisinha.ca>

Since commit
36b79e3219d ("hw/acpi/Kconfig: Add missing Kconfig dependencies (build error)"),
ACPI_MEMORY_HOTPLUG and ACPI_NVDIMM is implicitly turned on when
ACPI_HW_REDUCED is selected. ACPI_HW_REDUCED is already enabled. No need to
turn on ACPI_MEMORY_HOTPLUG or ACPI_NVDIMM explicitly. This is a minor cleanup.

Signed-off-by: Ani Sinha <ani@anisinha.ca>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-id: 20210819162637.518507-1-ani@anisinha.ca
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/Kconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 4ba0aca0676..dc050b5c37f 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -25,9 +25,7 @@ config ARM_VIRT
     select ACPI_PCI
     select MEM_DEVICE
     select DIMM
-    select ACPI_MEMORY_HOTPLUG
     select ACPI_HW_REDUCED
-    select ACPI_NVDIMM
     select ACPI_APEI
 
 config CHEETAH
-- 
2.20.1


