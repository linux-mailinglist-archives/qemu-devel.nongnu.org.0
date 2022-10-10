Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC185F9AE1
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 10:22:31 +0200 (CEST)
Received: from localhost ([::1]:55432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oho3R-0007tW-Fl
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 04:22:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ohnfm-00049G-4H
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 03:58:02 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:35502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ohnfj-0005sJ-J3
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 03:58:01 -0400
Received: by mail-pl1-x631.google.com with SMTP id h10so9705239plb.2
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 00:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8xLdNzijNA1WBazAWtqWd32PR9Wq9bLrEykj5KkRYDo=;
 b=jR+5y3rzMvi8WNJr72P/SVPyI9bfWOAEnBP2qWSfMqgzN2R8AaqBb6oiCdAyzq/LUL
 E9oXFLLv53XZY49iaoFHeIEtTnSFX8DhNyDhJwrW15/2Tbv2tvlAJPGvEFNGU3vdRcE1
 LFlNejvM6exJ7Rmuxk4o2C1mm6QqGayfnb7NybfZM0I1kDf25jn609p8ig98yQTCIDCQ
 1sKVnmnftwnWsvjVHtKzfCjsXsmMGe8//j/A2iWtkyHB4UX8WVRplN97OkNp3Ab4VTy7
 rgJXV9cgNfgIdulkYhGzh+bC393Ta0XCshVtHaLUI1eV+PRZz/eTrJI7anHuYfrKds1Y
 HmKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8xLdNzijNA1WBazAWtqWd32PR9Wq9bLrEykj5KkRYDo=;
 b=nQc4KD0i4axdns9Spwqo3TPy7id0Xtqby8eVMC0XpmJG4YImrDCyJWwQImjoF69qS4
 w8vwkfYaHyPOdqC5bdOXQle1GLwUs5My4eWoSXolv9Y2a6HAmz3NLhgydbLy9tCyCnLW
 /QNsIWYGI3ywAYAN8M7AiJktIgPP6TxUJJdRsfqXcNQvas22qFlaUJ6XTT+zhInwuQaJ
 44Lm59O0nPcZcICFGE3b2l39hL7xiF7clrXNGf7pM6FjbVXOEYaosEunh4xunDJpROAq
 r8dcecrdUcfkU3iRCt0Yu5G41y5XyoEXceSrc/yVKzC04Epg2yis7aB5ie9sMhY7nj41
 HUaw==
X-Gm-Message-State: ACrzQf1B3hf9RtNVdQ8w5HOoWzjTkfmib/kpfJXTYilrxvzdGyHuy592
 /+Ln67DopG/CAPp4Jkik26B/uVJJ3lWHUA==
X-Google-Smtp-Source: AMsMyM5MABChcumcbKRSJVbnzgWsFH6RS9dOxBrRPQjpCRF0AnEsBFPifF2B6Ay84vMX6BYhm/SnBg==
X-Received: by 2002:a17:90a:bb94:b0:209:618f:46ac with SMTP id
 v20-20020a17090abb9400b00209618f46acmr30918421pjr.240.1665388675093; 
 Mon, 10 Oct 2022 00:57:55 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([203.163.239.238])
 by smtp.googlemail.com with ESMTPSA id
 s2-20020a625e02000000b005624b4bd738sm6200379pfb.156.2022.10.10.00.57.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 00:57:54 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, imammedo@redhat.com, Ani Sinha <ani@anisinha.ca>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Maydell Peter <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH v3 09/10] MAINTAINERS: add myself as the maintainer for acpi
 biosbits avocado tests
Date: Mon, 10 Oct 2022 13:26:18 +0530
Message-Id: <20221010075619.4147111-10-ani@anisinha.ca>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221010075619.4147111-2-ani@anisinha.ca>
References: <20221010075619.4147111-2-ani@anisinha.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::631;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x631.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

I wrote the biosbits avocado tests for testing QEMU's ACPI/SMBIOS implementation
with biosbits and all the related changes. Making myself as the maintainer for
biosbits related files and test scripts.

Cc: Daniel P. Berrangé <berrange@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Maydell Peter <peter.maydell@linaro.org>
Cc: John Snow <jsnow@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>
Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e1530b51a2..46d829efd1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1859,6 +1859,12 @@ S: Supported
 F: hw/acpi/viot.c
 F: hw/acpi/viot.h
 
+ACPI/AVOCADO/BIOSBITS
+M: Ani Sinha <ani@anisinha.ca>
+S: Supported
+F: tests/avocado/acpi-bits/*
+F: tests/avocado/acpi-bits.py
+
 ACPI/HEST/GHES
 R: Dongjiu Geng <gengdongjiu1@gmail.com>
 L: qemu-arm@nongnu.org
-- 
2.34.1


