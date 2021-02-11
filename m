Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7C0319617
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 23:56:06 +0100 (CET)
Received: from localhost ([::1]:38516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAKsX-0002mZ-PX
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 17:56:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lAKph-00014H-3p; Thu, 11 Feb 2021 17:53:09 -0500
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f]:37854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lAKpa-0002Uo-8r; Thu, 11 Feb 2021 17:53:08 -0500
Received: by mail-qk1-x72f.google.com with SMTP id s77so7055986qke.4;
 Thu, 11 Feb 2021 14:53:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5U9+y/dSkI4cN7W0ikuvTZLCpAHezOk1LxCyFVMnoqM=;
 b=e2RsSizrN0VC6NOo0NaAIAWSka4Qf98qa0Y/LGjbixhDYAnmD7uJcFQzZ1hZksL59l
 Du+VTd0ewRGxEq+4wxe7R/AakNCpzVJEZ2Oi1S7uo+Ta1WxRcod/QMrHNiaOTh3b0EwN
 aq/9pxxVwlO4k/Z/9m8PsS5JlHFn296bwLUsmuEYMkuGh7x7O6pCTQ4f0pxbs0lEo87M
 G3pkIrIPdniH0LYdBbUfWHEA2hk3SzNsk/7alPJ7lDtbkgOkP9yGHY00TvAeDX78TNxF
 XiP4vlRug21qUba+FYoMfyX6Mf7B/hc8J+0oZjmgSgMIkmmWx5kq3ztGu2MyDBtttQRx
 a43A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5U9+y/dSkI4cN7W0ikuvTZLCpAHezOk1LxCyFVMnoqM=;
 b=B0hrbR4ECakgIChvC/GkFSbAi/+3eR5j4jkb3TvGGXB4QBk5fWQTdNPu7qgXhPLmMa
 SRNOGP9au+GJkOIsIipEZQ+VBGUmFLsglr/QCDOmSc6fLFWespze1JE+eA08OcP1641W
 jSuGUXAeCPjBt7TpnZVaimbPOg7X/vN+i6jH9Mui0EQfMhjIZ5GVQNaxWlnR+l9jJzzJ
 wiEuUBZgINX+6290oE1vOK0zj2c4XGBoHlg4k3t4xtGuZDjjpZbey8ik2U1YWb8toYAY
 ekPTU/Tf95cOC4Q2IteYo82wL8JK5IHNX0R4vS0bGOUPDr2ubnAZ+tzd+ZR2EcyqPRDV
 Yvyw==
X-Gm-Message-State: AOAM533Qp9XGEbkTlX4TaJpT+gFVvAcCqa9j9pDRNPuBACn4+mu2BzeJ
 mOFkZmhcNI9i4BxKFGorC0XuEimWnAuwow==
X-Google-Smtp-Source: ABdhPJw0d+p8pQVAIbF+bnhXa7HnjLMS9uW0w1AxhgdkXbf2CmG1IFDht0S1jtU5qg7E1TTi2tQInA==
X-Received: by 2002:ae9:dc87:: with SMTP id q129mr50162qkf.297.1613083980726; 
 Thu, 11 Feb 2021 14:53:00 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:6e83:c920:e8d3:a2df:bf3])
 by smtp.gmail.com with ESMTPSA id x49sm4662227qth.95.2021.02.11.14.52.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 14:53:00 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/7] spapr_drc.c: do not call spapr_drc_detach() in
 drc_isolate_logical()
Date: Thu, 11 Feb 2021 19:52:40 -0300
Message-Id: <20210211225246.17315-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210211225246.17315-1-danielhb413@gmail.com>
References: <20210211225246.17315-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72f;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x72f.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, SPF_HELO_NONE=0.001,
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

drc_isolate_logical() is used to move the DRC from the "Configured" to the
"Available" state, erroring out if the DRC is in the unexpected "Unisolate"
state and doing nothing (with RTAS_OUT_SUCCESS) if the DRC is already in
"Available" or in "Unusable" state.

When moving from "Configured" to "Available", the DRC is moved to the
LOGICAL_AVAILABLE state, a drc->unplug_requested check is done and, if true,
spapr_drc_detach() is called.

What spapr_drc_detach() does then is:

- set drc->unplug_requested to true. In fact, this is the only place where
unplug_request is set to true;
- does nothing else if drc->state != drck->empty_state. If the DRC state
is equal to drck->empty_state, spapr_drc_release() is called. For logical
DRCs, drck->empty_state = LOGICAL_UNUSABLE.

In short, calling spapr_drc_detach() in drc_isolate_logical() does nothing. It'll
set unplug_request to true again ('again' since it was already true - otherwise the
function wouldn't be called), and will return without calling spapr_drc_release()
because the DRC is not in LOGICAL_UNUSABLE, since drc_isolate_logical() just
moved it to LOGICAL_AVAILABLE. The only place where the logical DRC is released
is when called from drc_set_unusable(), when it is moved to the "Unusable" state.
As it should, according to PAPR.

Even though calling spapr_drc_detach() in drc_isolate_logical() is benign, removing
it will avoid further thought about the matter. So let's go ahead and do that.

As a note, this logic was introduced in commit bbf5c878ab76. Since then, the DRC
handling code was refactored and enhanced, and PAPR itself went through some
changes in the DRC area as well. It is expected that some assumptions we had back
then are now deprecated.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr_drc.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
index 8571d5bafe..84bd3c881f 100644
--- a/hw/ppc/spapr_drc.c
+++ b/hw/ppc/spapr_drc.c
@@ -132,19 +132,6 @@ static uint32_t drc_isolate_logical(SpaprDrc *drc)
 
     drc->state = SPAPR_DRC_STATE_LOGICAL_AVAILABLE;
 
-    /* if we're awaiting release, but still in an unconfigured state,
-     * it's likely the guest is still in the process of configuring
-     * the device and is transitioning the devices to an ISOLATED
-     * state as a part of that process. so we only complete the
-     * removal when this transition happens for a device in a
-     * configured state, as suggested by the state diagram from PAPR+
-     * 2.7, 13.4
-     */
-    if (drc->unplug_requested) {
-        uint32_t drc_index = spapr_drc_index(drc);
-        trace_spapr_drc_set_isolation_state_finalizing(drc_index);
-        spapr_drc_detach(drc);
-    }
     return RTAS_OUT_SUCCESS;
 }
 
-- 
2.29.2


