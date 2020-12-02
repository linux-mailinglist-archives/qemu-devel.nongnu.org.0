Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C7F2CB9AF
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 10:51:59 +0100 (CET)
Received: from localhost ([::1]:44292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkOnm-0000fJ-2z
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 04:51:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNM4-0006c7-RJ
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:19:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20993)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNM1-0006wk-4P
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:19:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606897147;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VthueJ+wcmCD21Tv2S71bw+Fela9fIth1B3tPzW5ixA=;
 b=V01/5IIQcegnQfvlyi7ZcTukoBmSe98V1ZVMfPAYNPBD3idFA1S533LXsYBsMflA5GWRhI
 IlH2P9Ph8W/SD/4ZnfDQmTAroPe22jmiX2Eykp7i8ZYvHPRIGW32RwtprJMSGUopz4Ue3x
 TUHBbqlWb1bvZmdKxfPNc0gFnmMAZfI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-237-gR8cJwKeMEiUfcYnsMugMQ-1; Wed, 02 Dec 2020 03:19:06 -0500
X-MC-Unique: gR8cJwKeMEiUfcYnsMugMQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 32CAB185A0CA
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:19:04 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E1A90100238C;
 Wed,  2 Dec 2020 08:19:03 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/15] machine: record whether nvdimm= was set
Date: Wed,  2 Dec 2020 03:18:48 -0500
Message-Id: <20201202081854.4126071-10-pbonzini@redhat.com>
In-Reply-To: <20201202081854.4126071-1-pbonzini@redhat.com>
References: <20201202081854.4126071-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is needed for SPAPR which has different defaults than everyone else.
Right now it looks at the -machine QemuOpts, but those will go away.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/core/machine.c       | 1 +
 include/hw/mem/nvdimm.h | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 2c0bc15143..94992fa1c0 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -455,6 +455,7 @@ static void machine_set_nvdimm(Object *obj, bool value, Error **errp)
 {
     MachineState *ms = MACHINE(obj);
 
+    ms->nvdimms_state->has_is_enabled = true;
     ms->nvdimms_state->is_enabled = value;
 }
 
diff --git a/include/hw/mem/nvdimm.h b/include/hw/mem/nvdimm.h
index c699842dd0..14c101c180 100644
--- a/include/hw/mem/nvdimm.h
+++ b/include/hw/mem/nvdimm.h
@@ -129,7 +129,7 @@ typedef struct NvdimmFitBuffer NvdimmFitBuffer;
 
 struct NVDIMMState {
     /* detect if NVDIMM support is enabled. */
-    bool is_enabled;
+    bool has_is_enabled, is_enabled;
 
     /* the data of the fw_cfg file NVDIMM_DSM_MEM_FILE. */
     GArray *dsm_mem;
-- 
2.26.2



