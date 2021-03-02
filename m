Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FBE32A200
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 15:15:13 +0100 (CET)
Received: from localhost ([::1]:42576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH5ns-0007yA-4F
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 09:15:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lH5jP-0002SM-6c; Tue, 02 Mar 2021 09:10:35 -0500
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a]:35346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lH5jN-0007AQ-Mv; Tue, 02 Mar 2021 09:10:34 -0500
Received: by mail-qk1-x72a.google.com with SMTP id d20so19276467qkc.2;
 Tue, 02 Mar 2021 06:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uOA/dEAG3MBKjUMll/cJjGDnuaqcJUMuLLC8SsN07EU=;
 b=pduWghJqTsbBZvg7PvHCh9A59AWbc6/H43DdLxHmdkASjD18/RqWF4R+9mfZ4TGanJ
 JvLOGz0Gsi7ZS7ZDffUN6RcO3liFqcuVI+ZpJNebQDgBpwY9X8k2Ru04ws7/GkQ4GOHp
 4O5VW7obJ44n3N0FWZhokaAKXDy2TCqr54yJnRsGeb5jg94PdJNlE/XA+mykQs0gdwI5
 89Hj0+9Ehx76EDhLwgI5mqxZyEmGrkvH3gZXDY5bwULWMoh4lWcK/gLqwKeHcXbu8bWV
 SwgCwfKSJd3PMoanyM8qZVbP9bGWzMlE6JpQxUyTD1l9psSfwchSvVf4+4vdr1326qpI
 kyoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uOA/dEAG3MBKjUMll/cJjGDnuaqcJUMuLLC8SsN07EU=;
 b=no/x18uC/DuALvUfhrbx5urjACzxtuqI6EtV4aPaa1qvp6UrtAXi3pxatmxn2RKwv1
 4L2/AFYOFYjMxhHyM57wWVBIRp+TkXKI03yr3PU35LoWtqtNJpbbvtCThuAsacd+F0he
 Ude9lxG8/hdVea7RFIGvZlOxcNnbo/CSfzDiAtF/kpc8qSe7xF44dhjzB54kecKwOn5Z
 ktjWzc4eLMVjcy7Hlous9I3CuBGQHQH+hNQidIXqA0mJGgAPrAutkkAclsBCG2xWcceN
 ckM+gI0DAwqSMIQYOVyouUTyX/CCRdzs7BISlygSJsfAwoSpU4q8pbYoOxpVDzv7bC77
 TNOA==
X-Gm-Message-State: AOAM530oR4zZfFp1zTN2ulzBMNazsL77a2P143hso2JY9rQvFg6XN878
 HilzIkwI/JenSZ7z9pgS2Lgv3NLgTyldBw==
X-Google-Smtp-Source: ABdhPJyBFg208XaqlV7/qwo9JUwxcazY6CLSr3XsxgHhtAxa909Mf8D4TondB54nIF6hLdxHJ6fGqA==
X-Received: by 2002:a05:620a:12ae:: with SMTP id
 x14mr20028939qki.25.1614694232027; 
 Tue, 02 Mar 2021 06:10:32 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c7:1670:7849:4614:f4b6:4112])
 by smtp.gmail.com with ESMTPSA id n5sm9376504qkp.133.2021.03.02.06.10.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 06:10:31 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] spapr.c: remove duplicated assert in
 spapr_memory_unplug_request()
Date: Tue,  2 Mar 2021 11:10:18 -0300
Message-Id: <20210302141019.153729-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210302141019.153729-1-danielhb413@gmail.com>
References: <20210302141019.153729-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72a;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x72a.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We are asserting the existence of the first DRC LMB after sending unplug
requests to all LMBs of the DIMM, where every DRC is being asserted
inside the loop. This means that the first DRC is being asserted twice.

Remove the duplicated assert.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index aca3ef9d58..b579830832 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -3703,7 +3703,6 @@ static void spapr_memory_unplug_request(HotplugHandler *hotplug_dev,
 
     drc = spapr_drc_by_id(TYPE_SPAPR_DRC_LMB,
                           addr_start / SPAPR_MEMORY_BLOCK_SIZE);
-    g_assert(drc);
     spapr_hotplug_req_remove_by_count_indexed(SPAPR_DR_CONNECTOR_TYPE_LMB,
                                               nr_lmbs, spapr_drc_index(drc));
 }
-- 
2.29.2


