Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 301C0319625
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 23:58:39 +0100 (CET)
Received: from localhost ([::1]:46760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAKv0-0006pM-A4
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 17:58:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lAKph-00014q-Jw; Thu, 11 Feb 2021 17:53:09 -0500
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c]:34106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lAKpc-0002Vk-Au; Thu, 11 Feb 2021 17:53:09 -0500
Received: by mail-qt1-x82c.google.com with SMTP id c1so5482148qtc.1;
 Thu, 11 Feb 2021 14:53:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tCoYYHBKR+fFO7m++NZSpiMZ5sCIJgLWAYFJvHuEtbM=;
 b=YKJGVbBQMaUqRL3DGBeYL2qMOGSm7rhba0KFKrmAIVtRmgZwSFzbtf9FWaYVzMrunU
 08Ibwb+IjM3zzc7+26wJ1cjM+WSwHYyMyXz1eR7qfNRUgHAnbKMw0Mz8kQTxOqycd7xF
 rtb4EtD+X/9txKWX9AMMTb+2+S0yqqPxS3k50S3Y6aoMWypOO2wCq7nWeDIYBCMYHyoG
 usgnnrHSzb/ytssZP2E+C9v/OqV5YpNB1vb9HdLT8E74TV3CVz28gn/9Kj8QQQ5P3RHk
 EifpZs4v77Qca2dsYlsQ/DfB3VjYRXnQcT4ugJ9HaefZqkMVyFhRmS8E+JNQ+qtDw4mi
 LQIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tCoYYHBKR+fFO7m++NZSpiMZ5sCIJgLWAYFJvHuEtbM=;
 b=M1DSWpWrgVVtXGFW7GHUWcDGZAYvyUlanHMn5Ayq2RWVn2aLOZMKh7fJzifE8qlYVS
 rSiYXxkvdTj5iCcUo5xYDJcIjOVFv+NoWjBjxc3q3ytNLLQnwY/G6Y1PKo138T20qo9f
 MjsYvD7o/+3TXkyxR0JZF3tXCVeBIpiI6v6+cf/grMbi+1J8aJjCoZbZOwhmFpoEV4f1
 0oC+c2SelKZ7gKkb+ehKylZzKhLAN2NsZk3/vb0wmvba8VDtzD/FVl08dAuKx0BShvBC
 cs4b0AW5CcNUcqOD0btTksy+URXGkYIl/Ht6BGGqoHmQiOx3+114Uzn90m8xL0/AHiy9
 SEJw==
X-Gm-Message-State: AOAM5306XiIz6vTGd6Nm83rcGzchrXKUdmsUbTC5gMoCXlwi0+qUeKPp
 fo/GoGiumFoq+ks0t0axolfixAYGT2k2iA==
X-Google-Smtp-Source: ABdhPJwFSWef5fomf+AIjyA9WiiaeBV+PI75OKZFxe7l/qMrahkBtz5PBscUm3FeWwmoXRsY/7pBdQ==
X-Received: by 2002:a05:622a:7:: with SMTP id x7mr9554700qtw.257.1613083982884; 
 Thu, 11 Feb 2021 14:53:02 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:6e83:c920:e8d3:a2df:bf3])
 by smtp.gmail.com with ESMTPSA id x49sm4662227qth.95.2021.02.11.14.53.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 14:53:02 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/7] spapr_pci.c: simplify spapr_pci_unplug_request()
 function handling
Date: Thu, 11 Feb 2021 19:52:41 -0300
Message-Id: <20210211225246.17315-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210211225246.17315-1-danielhb413@gmail.com>
References: <20210211225246.17315-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82c;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x82c.google.com
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

When hotunplugging a PCI function we'll branch out the logic in two cases,
function zero and non-zero. If non-zero, we'll call spapr_drc_detach() and
nothing else. If it's function zero, we'll loop it once between all the
functions in the slot to call spapr_drc_detach() on them, and afterwards
we'll do another backwards loop where we'll signal the event to the guest.

We can simplify this logic. We can ignore all the DRC handling for non-zero
functions, since we'll end up doing that regardless when unplugging function
zero. And for function zero, everything can be done in a single loop, since
tt doesn't matter if we end up marking the function DRCs as unplug pending in
backwards order or not, as long as we call spapr_drc_detach() before issuing
the hotunplug event to the guest.

This will also avoid a possible scenario where the user starts to hotunplug
the slot, starting with a non-zero function, and then delays/forgets to
hotunplug function zero afterwards. This would keep the function DRC marked
as unplug requested indefinitely.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr_pci.c | 44 ++++++++++++++++----------------------------
 1 file changed, 16 insertions(+), 28 deletions(-)

diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
index f1c7479816..1791d98a49 100644
--- a/hw/ppc/spapr_pci.c
+++ b/hw/ppc/spapr_pci.c
@@ -1709,38 +1709,26 @@ static void spapr_pci_unplug_request(HotplugHandler *plug_handler,
             return;
         }
 
-        /* ensure any other present functions are pending unplug */
-        if (PCI_FUNC(pdev->devfn) == 0) {
-            for (i = 1; i < 8; i++) {
-                func_drc = drc_from_devfn(phb, chassis, PCI_DEVFN(slotnr, i));
-                func_drck = SPAPR_DR_CONNECTOR_GET_CLASS(func_drc);
-                state = func_drck->dr_entity_sense(func_drc);
-                if (state == SPAPR_DR_ENTITY_SENSE_PRESENT
-                    && !spapr_drc_unplug_requested(func_drc)) {
-                    /*
-                     * Attempting to remove function 0 of a multifunction
-                     * device will will cascade into removing all child
-                     * functions, even if their unplug weren't requested
-                     * beforehand.
-                     */
-                    spapr_drc_detach(func_drc);
-                }
-            }
+        /*
+         * The hotunplug itself will occur when unplugging function 0,
+         * regardless of marking any other functions DRCs as pending
+         * unplug beforehand (since 02a1536eee33).
+         */
+        if (PCI_FUNC(pdev->devfn) != 0) {
+            return;
         }
 
-        spapr_drc_detach(drc);
+        for (i = 7; i >= 0; i--) {
+            func_drc = drc_from_devfn(phb, chassis, PCI_DEVFN(slotnr, i));
+            func_drck = SPAPR_DR_CONNECTOR_GET_CLASS(func_drc);
+            state = func_drck->dr_entity_sense(func_drc);
 
-        /* if this isn't func 0, defer unplug event. otherwise signal removal
-         * for all present functions
-         */
-        if (PCI_FUNC(pdev->devfn) == 0) {
-            for (i = 7; i >= 0; i--) {
-                func_drc = drc_from_devfn(phb, chassis, PCI_DEVFN(slotnr, i));
-                func_drck = SPAPR_DR_CONNECTOR_GET_CLASS(func_drc);
-                state = func_drck->dr_entity_sense(func_drc);
-                if (state == SPAPR_DR_ENTITY_SENSE_PRESENT) {
-                    spapr_hotplug_req_remove_by_index(func_drc);
+            if (state == SPAPR_DR_ENTITY_SENSE_PRESENT) {
+                /* Mark the DRC as requested unplug if needed. */
+                if (!spapr_drc_unplug_requested(func_drc)) {
+                    spapr_drc_detach(func_drc);
                 }
+                spapr_hotplug_req_remove_by_index(func_drc);
             }
         }
     }
-- 
2.29.2


