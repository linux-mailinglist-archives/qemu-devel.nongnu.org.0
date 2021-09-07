Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A27774021B5
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 02:55:50 +0200 (CEST)
Received: from localhost ([::1]:38046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNPOv-0002Jh-Ns
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 20:55:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mNPHb-0002Z1-DL; Mon, 06 Sep 2021 20:48:16 -0400
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f]:40568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mNPHY-0003nF-SD; Mon, 06 Sep 2021 20:48:15 -0400
Received: by mail-qv1-xf2f.google.com with SMTP id 93so4846032qva.7;
 Mon, 06 Sep 2021 17:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TT0UFxZrmRZc15RE6QSPgF8yShX5v3WEiTd1Mg5K8Pg=;
 b=p8hrcPOukIVyBbKvt/QbmdCHCchK8lh3Cre87u6DGpMu08yVNGxt/Q27G3GPdD5yzI
 pubAb4gGT8h1jxJ36ag5pNMzwNwVCnFs5lCCmnfD6V7Xwkf6/5+EfZ7r8FHyvxYmRHtW
 HHDnRI0Odo/Xf8QrILosAE4dsYEUwAngOYfOAEFEpqxfe6fj+3LFN7vDOvPjhqhSdmdx
 hKTh4VwzL0YYer+SzdTutdo1ZMjeuWP/4gLZfMXBDr8uTtAq6fSMq5fvZGDTCWmMNOZi
 +fiu875Alc1fIrTpHz9rynVPbIv1iwPlJ/DHI/rlP+psXUOGqdlM6pvATYMwbJtxiXpQ
 FWdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TT0UFxZrmRZc15RE6QSPgF8yShX5v3WEiTd1Mg5K8Pg=;
 b=OWDUXAUCd1m6vEX629PgaRQ4OKCSw3Z0ocr5F3agiOQwdAWSxR/73amYCfXOgr3LDM
 EiW+dbrbE2Mu7rE9ac4Qc0lNjwysdPFuTrxVBLlatEG/PdbnLhrCV5uwXm/J3+HEu/uX
 apwywCaKMlemzvRzs5b6WMw/zEmo1aKVy+M0UrtspxvNuSfBQlwbcumW8ZZfXS00m0gM
 8vAJVVkdFzTrZmbgnPJZedfIJzVa9NAdAH7sjhsrFnDkqliIloe3rAgRVAJysPg7x6+p
 pbnebpX63Ply+ypOnR12GLwV1rIyuuCpbF7pGx43ucWpcK2/zHL4GfRN20a6OjI2nmSy
 ZqlQ==
X-Gm-Message-State: AOAM530mVMi0UGBQGCOEJ3BknEoGj7DvWLqn8lrEaH/gdL1cFSu5rlBP
 ja8m07YQUUf1AqMK8f1ALeookjac+AA=
X-Google-Smtp-Source: ABdhPJx92LEut4hKfSprMPF2qBel1XmAN3/5f9e7Xdr6QnoskVLx+GJUTxNW2jE8UCxYN9bxR+hOhw==
X-Received: by 2002:a05:6214:762:: with SMTP id
 f2mr14522747qvz.48.1630975691508; 
 Mon, 06 Sep 2021 17:48:11 -0700 (PDT)
Received: from rekt.COMFAST ([179.247.136.122])
 by smtp.gmail.com with ESMTPSA id x83sm7799538qkb.118.2021.09.06.17.48.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 17:48:11 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 1/7] memory_hotplug.c: handle dev->id = NULL in
 acpi_memory_hotplug_write()
Date: Mon,  6 Sep 2021 21:47:49 -0300
Message-Id: <20210907004755.424931-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210907004755.424931-1-danielhb413@gmail.com>
References: <20210907004755.424931-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2f;
 envelope-from=danielhb413@gmail.com; helo=mail-qv1-xf2f.google.com
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, groug@kaod.org, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qapi_event_send_mem_unplug_error() deals with @device being NULL by
replacing it with an empty string ("") when emitting the event. Aside
from the fact that this behavior (qapi visitor mapping NULL pointer to
"") can be patched/changed someday, there's also the lack of utility
that the event brings to listeners, e.g. "a memory unplug error happened
somewhere".

In theory we should just avoit emitting this event at all if dev->id is
NULL, but this would be an incompatible change to existing guests.
Instead, let's make the forementioned behavior explicit: if dev->id is
NULL, pass an empty string to qapi_event_send_mem_unplug_error().

Suggested-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/acpi/memory_hotplug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/acpi/memory_hotplug.c b/hw/acpi/memory_hotplug.c
index af37889423..6a71de408b 100644
--- a/hw/acpi/memory_hotplug.c
+++ b/hw/acpi/memory_hotplug.c
@@ -178,7 +178,7 @@ static void acpi_memory_hotplug_write(void *opaque, hwaddr addr, uint64_t data,
             hotplug_handler_unplug(hotplug_ctrl, dev, &local_err);
             if (local_err) {
                 trace_mhp_acpi_pc_dimm_delete_failed(mem_st->selector);
-                qapi_event_send_mem_unplug_error(dev->id,
+                qapi_event_send_mem_unplug_error(dev->id ? : "",
                                                  error_get_pretty(local_err));
                 error_free(local_err);
                 break;
-- 
2.31.1


