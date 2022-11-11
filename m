Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31360625E05
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 16:14:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otVj0-0004M3-Jx; Fri, 11 Nov 2022 10:13:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1otViQ-0004Iu-E7
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 10:13:10 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1otViN-0004rY-Ro
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 10:13:10 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 q1-20020a17090a750100b002139ec1e999so4954627pjk.1
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 07:13:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wsQMgPCL3TQDu+BSsj4DVMKGoyBZ0jGsQSTxOhUqFD8=;
 b=spv/ev7nfjJvrs2oCMSdZzNtnHZ1ba1zLcyas0+2xpGJV/pQkwoTiywMK39pWKSdsM
 BGjXRTwHkiJdIrEQpkXCj7wOvZxGYDQMF60qGt1Xmb6QIGhPOlBvb/hn2CrM2f23ITEc
 2gZIAjKvRpvmejemdGTC0bTFHXWi6hIB+nr4wk9Mz0UM2sVxws9UwJTQC1RH5eEWfQZX
 2FJMdqblaPrwe+bwURBB3o+ZDpg6266BpnfEgJXBAa6x1P9GFubX57MmyyW3nCE0FeKx
 kmDBbnBdB1P+c9LGpOM/0+C8tPP4yoH3zM41NolVFxlUaNhm/OdQ8lvyMKEYHemP1mrI
 WO+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wsQMgPCL3TQDu+BSsj4DVMKGoyBZ0jGsQSTxOhUqFD8=;
 b=FN5L7O4q4q5SrcBDWXzfutng02jMY6MPjMmCmJmHS8f+nNsN/yo1vGtStkt0QILWW3
 WuP2xi1Vxt0d6rLcnAec+zZzu3XP2iRZ1eF784opTNa483ObPucBV9q7zkhIacXGginF
 baB1XxLPAUDDclQoVxkfmiypK6d67uRPdYN0z4d63MyNVEHqhvPvwccq2/OzSal8HBMe
 5W3uN8rzuwILy+wyOnvfB/rcTPKEbUgJFEkuxNeNRSD7uuuZSuBGy+4RclznjTZSUCit
 H5OUAudLBFHcuJw+G6wjcoyhS4TTJtPvkPaJS4lbhT48slMHFCOwd7Xjp/ITU23BOgHz
 3AmA==
X-Gm-Message-State: ANoB5pkD+vlcrYnX4AAXisf8vdAiQBe6G0Dnz5XmFjYEcF/e/DmwKpa4
 yLJx0Ij3oGytq7+SjwimUhnav1Zjbn47OW3i+0A=
X-Google-Smtp-Source: AA0mqf5fAlgvHUNg+SJdW3fnIL9hCqMGYB1ejfyUjVRBBNK48bAfBalxVuUpADzSyFjqyEkgKIMJRQ==
X-Received: by 2002:a17:903:410c:b0:186:9fb9:1f84 with SMTP id
 r12-20020a170903410c00b001869fb91f84mr3061865pld.45.1668179584372; 
 Fri, 11 Nov 2022 07:13:04 -0800 (PST)
Received: from localhost.localdomain ([115.96.143.216])
 by smtp.gmail.com with ESMTPSA id
 p13-20020a17090b010d00b002009db534d1sm1727213pjz.24.2022.11.11.07.13.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 07:13:04 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org
Cc: Ani Sinha <ani@anisinha.ca>, "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH] MAINTAINERS: add mst to list of biosbits maintainers
Date: Fri, 11 Nov 2022 20:41:38 +0530
Message-Id: <20221111151138.36988-1-ani@anisinha.ca>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102b;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x102b.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Adding Michael's name to the list of bios bits maintainers so that all changes
and fixes into biosbits framework can go through his tree and he is notified.

Suggested-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index caba73ec41..c50b15f94d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1865,6 +1865,7 @@ F: hw/acpi/viot.h
 
 ACPI/AVOCADO/BIOSBITS
 M: Ani Sinha <ani@anisinha.ca>
+M: Michael S. Tsirkin <mst@redhat.com>
 S: Supported
 F: tests/avocado/acpi-bits/*
 F: tests/avocado/acpi-bits.py
-- 
2.34.1


