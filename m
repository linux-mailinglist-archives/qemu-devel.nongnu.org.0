Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D178D4DE08F
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 18:53:53 +0100 (CET)
Received: from localhost ([::1]:39970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVGnQ-0000bN-VP
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 13:53:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nVGTx-0004fW-RT; Fri, 18 Mar 2022 13:33:47 -0400
Received: from [2607:f8b0:4864:20::330] (port=34775
 helo=mail-ot1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nVGTw-0002Bb-H4; Fri, 18 Mar 2022 13:33:45 -0400
Received: by mail-ot1-x330.google.com with SMTP id
 d15-20020a05683018ef00b005b2304fdeecso6017510otf.1; 
 Fri, 18 Mar 2022 10:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EbL8lofNnOCjN+HkifQAQb7v8T80tAELaV+tNf2GBzM=;
 b=P/leGutps3L9n5qxHYHi8wGVL6KdFxgJFkGXIfp8i5bE1J9R3L/Uf7ywUfkToMDNeR
 cjRmna8klUXQF/w9ovs+03hp0iCcl70oA4dBEoaiALhghtl9+qh/EKBL+/R6HRxBuCMn
 Ccp8wem5ysOCK7PXlzo9ptVWxn405WbdRAl9Mf8p3CXlZJbkgxMXYdm/ADBOpNfHQAd7
 HvnU8F3TA2BiaTYH3N9bzqzbelzbmJZWG6LGJ1cqRxfkxgMXA7PaulO/Zdn6oMu2JBSK
 osJIwg/59gR9n8KcIKVHxtM7JxoleRY4bilkKZHMZuJbIDuBLIm1aPjoAepkiXlGdWNN
 Up5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EbL8lofNnOCjN+HkifQAQb7v8T80tAELaV+tNf2GBzM=;
 b=3D6gJF5tE3cEBUCyVDuasxojm3CceWzpWmMpQE4tznSdlRImOTj2LTZ0Fl60ctPMsh
 Wih4ZxUAki0G+i9GhIgPRBfX/y9cP4K7BCHaOfTcodSEHf0+cAhq5U8DN3A5NWV4xHr5
 yFa6J0wHyr8C+7RSO732koj6efY55F5rw//cXMUlhIUJ6Rd3wa4Ou5nHegAhsJPURwTk
 6JKeaQvyEHG+NpwHAzhTcNrIPEVJ5pHgOA9IaDu2wj0mB9tSTQx8VcyMICD2T+Hx13Gi
 /5c1dCVVsDHijVeLSIqDT3+mmZfojCXKjloYN/VTZ0jYND/p8qsk2p8t3iM9BtKa3d6b
 HIyQ==
X-Gm-Message-State: AOAM5333YvgSc/PiGFbGbY4KImQ1j98ucymZcct8WPCsGAsuE2iTjnDX
 RoqFBXF/7gfreximGvKpyg3+zQN9UvI=
X-Google-Smtp-Source: ABdhPJwQeY02wRDVIjy2SCF945BFPypR5UWeCygOgc5BNqv+woXadu13pPJDDh7V6DVzoTO6p04W8A==
X-Received: by 2002:a05:6830:2099:b0:5c9:4715:2c80 with SMTP id
 y25-20020a056830209900b005c947152c80mr3835766otq.244.1647624821634; 
 Fri, 18 Mar 2022 10:33:41 -0700 (PDT)
Received: from rekt.ibmmodules.com ([2804:431:c7c6:daa8:d948:1d15:1451:398f])
 by smtp.gmail.com with ESMTPSA id
 d2-20020a05683025c200b005c93d78e1f6sm4324662otu.29.2022.03.18.10.33.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Mar 2022 10:33:41 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.1 6/9] hw/ppc/spapr_events.c: use drc->index
Date: Fri, 18 Mar 2022 14:33:17 -0300
Message-Id: <20220318173320.320541-7-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220318173320.320541-1-danielhb413@gmail.com>
References: <20220318173320.320541-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::330
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x330.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr_events.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/ppc/spapr_events.c b/hw/ppc/spapr_events.c
index 630e86282c..d41f4e47c0 100644
--- a/hw/ppc/spapr_events.c
+++ b/hw/ppc/spapr_events.c
@@ -675,7 +675,7 @@ void spapr_hotplug_req_add_by_index(SpaprDrc *drc)
     SpaprDrcType drc_type = spapr_drc_type(drc);
     union drc_identifier drc_id;
 
-    drc_id.index = spapr_drc_index(drc);
+    drc_id.index = drc->index;
     spapr_hotplug_req_event(RTAS_LOG_V6_HP_ID_DRC_INDEX,
                             RTAS_LOG_V6_HP_ACTION_ADD, drc_type, &drc_id);
 }
@@ -685,7 +685,7 @@ void spapr_hotplug_req_remove_by_index(SpaprDrc *drc)
     SpaprDrcType drc_type = spapr_drc_type(drc);
     union drc_identifier drc_id;
 
-    drc_id.index = spapr_drc_index(drc);
+    drc_id.index = drc->index;
     spapr_hotplug_req_event(RTAS_LOG_V6_HP_ID_DRC_INDEX,
                             RTAS_LOG_V6_HP_ACTION_REMOVE, drc_type, &drc_id);
 }
-- 
2.35.1


