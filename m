Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F6E465EDC
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 08:47:53 +0100 (CET)
Received: from localhost ([::1]:33786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msgop-0004yh-Qq
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 02:47:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1msg9T-0005Uw-91
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 02:05:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1msg9P-0006Fz-Rg
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 02:05:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638428703;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HuDNU5cB6zt9MhfLlrF0Gf7BvooKApGl+AABzywjdHw=;
 b=OwqAFBURGMf39sAgJW33pA9aNr99Ah6L44bK3NU346BKFQq4Q9B8H8N1aG6eieAEH0HbNB
 Ny17I8opbZHJVkR1hxm/c6T7jDOuVEVscuylErupO89mdkScaLHoamrCrKbom4HzeHu1Z5
 SYv7i4UYgUQYhaOqCe+pi2loIKBDJ+c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-225-Ep_VwwKUNxO6Rfjw5cti8w-1; Thu, 02 Dec 2021 02:05:01 -0500
X-MC-Unique: Ep_VwwKUNxO6Rfjw5cti8w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4AAD583DD20;
 Thu,  2 Dec 2021 07:05:00 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F4FA19EF9;
 Thu,  2 Dec 2021 07:04:54 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3F9DA1138224; Thu,  2 Dec 2021 08:04:50 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 11/11] vl: Enter main loop in phase @machine-initialized
Date: Thu,  2 Dec 2021 08:04:50 +0100
Message-Id: <20211202070450.264743-12-armbru@redhat.com>
In-Reply-To: <20211202070450.264743-1-armbru@redhat.com>
References: <20211202070450.264743-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: damien.hedde@greensocs.com, berrange@redhat.com, mark.burton@greensocs.com,
 edgar.iglesias@gmail.co, mirela.grujic@greensocs.com,
 marcandre.lureau@redhat.com, pbonzini@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The previous commit demonstrated how you can interleave QMP-over-CLI
with startup.  We want the same for real QMP.

QMP-over-CLI starts in phase @no-machine, and may advance the phase.

We then advance to phase @machine-ready, and enter the main loop, and
real QMP becomes available.

If we skip the phase advance, real QMP becomes exactly as expressive
as QMP-over-CLI.  Except the main loop crashes.

If we skip to phase @machine-created, it doesn't crash, but it doesn't
give me a QMP monitor either.  Same for phase @accel-created.

Skipping to @machine-initialized works, and suffices to let me
demonstrate cold plug via QMP:

    $ qemu-system-x86_64
    {"QMP": {"version": {"qemu": {"micro": 92, "minor": 1, "major": 6}, "package": "v6.2.0-rc2-39-g8c7f07732b"}, "capabilities": ["oob"]}}
    {"execute": "qmp_capabilities", "arguments": {"enable": ["oob"]}}
    {"return": {}}
    {"execute": "device_add", "arguments": {"driver": "isa-serial"}}
    {"return": {}}

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 softmmu/vl.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index 9406368338..01f87aec07 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -1038,7 +1038,12 @@ void qemu_init(int argc, char **argv, char **envp)
         }
     }
 
-    qemu_until_phase(PHASE_MACHINE_READY);
+    /*
+     * FIXME need to force phase, because staying in PHASE_NO_MACHINE
+     * crashes, and going only to PHASE_MACHINE_CREATED or
+     * PHASE_ACCEL_CREATED gives no monitor.
+     */
+    qemu_until_phase(PHASE_MACHINE_INITIALIZED);
 }
 
 void qemu_until_phase(MachineInitPhase phase)
-- 
2.31.1


