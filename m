Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE551480CD9
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Dec 2021 20:49:02 +0100 (CET)
Received: from localhost ([::1]:47344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2IT0-0005Ql-0X
	for lists+qemu-devel@lfdr.de; Tue, 28 Dec 2021 14:49:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n2IIr-0003m0-Ej; Tue, 28 Dec 2021 14:38:34 -0500
Received: from [2607:f8b0:4864:20::836] (port=36779
 helo=mail-qt1-x836.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n2IIq-000450-3L; Tue, 28 Dec 2021 14:38:33 -0500
Received: by mail-qt1-x836.google.com with SMTP id m18so16626467qtk.3;
 Tue, 28 Dec 2021 11:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WeRunpZECrRIjZXf1LpiTz+adBXtU5tmvX+ycePIviw=;
 b=D35PS8dtZnF93XS+CISZAPuRTAr6eZd38X/WfL6WmKXqgSdAYdcZRRNDdHpiGYfLnW
 fI8SddaA2J9J+GmLpogUloiJ0yzIdBMXzVSnA3c5S+B4aktBzrE1fCyM0bl/X8W4BXu6
 SVaWOZEi8rmt0GUonEn6KsP8+qHCChDQpw6paUbNutHVvkRJdGWRZyqFR03JeHB5y4SX
 3oRXHHXuL5b95bE0MB5hj8mnRoJZi8mHSdwsQirUSfynk4vCWC/h4OY65Alq/wnIQ9n2
 wWAKJS4JRuIWzeLhFE4FjxFKXt4ac5BOYs07l591W6EH80YZES0l1x+QHJRPs031bI+q
 2M/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WeRunpZECrRIjZXf1LpiTz+adBXtU5tmvX+ycePIviw=;
 b=ILycVozHpg2WJgO5+VvSpUPktC1l9CcqEWiPjJpYwxYhmIraQlviEf3PEuz4jRgLrK
 YpgmCVVqUTR+9gKbYE2Kebh3rdlf7910NTnf1//UrhSgrs7PCFvNLM1rdX75/XYfqOjS
 Daqek0+73VJEn9rJI+E5Hpjsm3Cyq0OIhnnIKtG9F9CbGIGnlIU85w6HUvr1VTMJlHa+
 Im+wQg+3sd93V5DGiJEXng1WWDXwereY24aufhbcH/ntZwO57zwrk+8tiiGA4Jerj3bb
 11gkMkTjn3kRsEOhuDR+yRXWEXw0DdmSppG1THhrG8v0FMJndq6o8W0geZmPwOc4e2dg
 FnGw==
X-Gm-Message-State: AOAM531+niX1v5y1HN3WLoINRidD/AEPpryebQW7/ta5QfN5mCQ/bjq4
 rfQV6KpmjasYy60GFsl8ajAWdntoaxE=
X-Google-Smtp-Source: ABdhPJxI0JNp9heZN62T+w0lS5IO5EAk1hRT9n3Srkn4OGW4VbXapXzHA8fUvhJXorWxp9utj1/qMg==
X-Received: by 2002:a05:622a:194:: with SMTP id
 s20mr20115993qtw.617.1640720310320; 
 Tue, 28 Dec 2021 11:38:30 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:7ce4:b718:2cc0:32df:97ee])
 by smtp.gmail.com with ESMTPSA id r20sm16924059qkp.21.2021.12.28.11.38.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 11:38:30 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/17] pnv_phb4.c: check if root port exists in rc_config
 functions
Date: Tue, 28 Dec 2021 16:37:56 -0300
Message-Id: <20211228193806.1198496-8-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211228193806.1198496-1-danielhb413@gmail.com>
References: <20211228193806.1198496-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::836
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::836;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x836.google.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

pnv_phb4_rc_config_read() and pnv_phb4_rc_config_write() are asserting
the existence of the root port. The root port is now optional, and there
will be cases where a pnv-phb4 device won't have a root port attached.

Instead of asserting, check if the root port exists before read/writing
into it.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb4.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index daa468b812..6bd907f91a 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -152,7 +152,9 @@ static void pnv_phb4_rc_config_write(PnvPHB4 *phb, unsigned off,
     }
 
     pdev = pci_find_device(pci->bus, 0, 0);
-    assert(pdev);
+    if (!pdev) {
+        return;
+    }
 
     pci_host_config_write_common(pdev, off, PHB_RC_CONFIG_SIZE,
                                  bswap32(val), 4);
@@ -171,7 +173,9 @@ static uint64_t pnv_phb4_rc_config_read(PnvPHB4 *phb, unsigned off,
     }
 
     pdev = pci_find_device(pci->bus, 0, 0);
-    assert(pdev);
+    if (!pdev) {
+        return 0x0;
+    }
 
     val = pci_host_config_read_common(pdev, off, PHB_RC_CONFIG_SIZE, 4);
     return bswap32(val);
-- 
2.33.1


