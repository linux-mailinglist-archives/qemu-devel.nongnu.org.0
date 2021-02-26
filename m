Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43CEB3265E1
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 17:53:22 +0100 (CET)
Received: from localhost ([::1]:47816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFgMh-00040K-EV
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 11:53:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lFg3a-0004uS-2H; Fri, 26 Feb 2021 11:33:34 -0500
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833]:34108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lFg3S-0007k5-68; Fri, 26 Feb 2021 11:33:33 -0500
Received: by mail-qt1-x833.google.com with SMTP id c1so7058428qtc.1;
 Fri, 26 Feb 2021 08:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=861800TWaNkqS5Y/m11iEAVnYay2bHYjqTj17onrvN8=;
 b=cuACRIbDfYY6+FyeBnVtAY8nMJdSbqsBalNAaVEkgYwcE/m3AHfCTLvadKisbMPwc7
 soV1dNaHxcF83Bh5f39wv3qoHPV3dtrfgds63Yf/yS/8vk0/vc1V2KszCsw2VDUgEKcP
 BqeN7SG8dNyeEvnLR5srRsh8uNmZL+UIyg+FSxUxLjN5b1u033YsQzP3gWFDphdWAGCM
 VCLzAJhuKdFnCZ1ktasPi5CZ2VF5TIekacGh1knfIx31NnbzDvKIpD6CWPkaex0lBKgE
 8n0ifWFeAYZqVvuxRvZ0pe5A7B5mrT3alSQh1M9z/VNePRlxd0+3/VHH6CijVo7ZZC99
 jbbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=861800TWaNkqS5Y/m11iEAVnYay2bHYjqTj17onrvN8=;
 b=s8Bv6kGNReoIKe1cMS1W0iaGnmS0rkQEn+DWjUJuAsv7C3Ap1OFO5ZIKpa8d9LEXSA
 Iu6ZcVP5gyZtvXxrYtGpXF1zlyjRswkhPb8ooZI3D12ONozuO/++rlnAPL0C5MT/Fozz
 p05R61VetSrDW+8aQBrhJksPRC92qKWgl/4TXb7xsPkFufBNYfKWCLS47zLwCrr4NDKB
 8FUfjJMr4QVGhwas1Vnx4rfwPcDCLyRQMU4ECchgfeSOdysjptX665ckBmBEHFy+zVOp
 SYb2mNe4KW+GSBPC/BvuCefZQBG8QmeHBB2wFSoBjs++mRuojEFHZu9r+u06jpiTLP2L
 5Tqw==
X-Gm-Message-State: AOAM530+KjbVxXRlzxcc9Taf65gBy9hrDh7+PLdpq0JIacHeFnugvQd0
 K8C9PQk0cLfbJao+klXc91xWX17GDD48zQ==
X-Google-Smtp-Source: ABdhPJyipI5XLQCdKUA6MUNhxsaHlngKUK26A3+uq9yWBfb3nhOrmOKbyic2gtCeMtoL7cwvLTPdwg==
X-Received: by 2002:ac8:5d0c:: with SMTP id f12mr3355948qtx.192.1614357202926; 
 Fri, 26 Feb 2021 08:33:22 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:cd1c:d722:e26f:4e76:c5c1])
 by smtp.gmail.com with ESMTPSA id t33sm731116qtd.13.2021.02.26.08.33.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 08:33:22 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/5] spapr.c: add 'unplug already in progress' message for PHB
 unplug
Date: Fri, 26 Feb 2021 13:32:59 -0300
Message-Id: <20210226163301.419727-4-danielhb413@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210226163301.419727-1-danielhb413@gmail.com>
References: <20210226163301.419727-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::833;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x833.google.com
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

Both CPU hotunplug and PC_DIMM unplug reports an user warning,
mentioning that the hotunplug is in progress, if consecutive
'device_del' are issued in quick succession.

Do the same for PHBs in spapr_phb_unplug_request().

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 149dc2113f..6ef72ee7bd 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -4030,6 +4030,10 @@ static void spapr_phb_unplug_request(HotplugHandler *hotplug_dev,
     if (!spapr_drc_unplug_requested(drc)) {
         spapr_drc_unplug_request(drc);
         spapr_hotplug_req_remove_by_index(drc);
+    } else {
+        error_setg(errp,
+                   "PCI Host Bridge unplug already in progress for device %s",
+                   dev->id);
     }
 }
 
-- 
2.29.2


