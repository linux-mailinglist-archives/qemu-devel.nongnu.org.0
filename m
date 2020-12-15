Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1AA2DB33D
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 19:07:50 +0100 (CET)
Received: from localhost ([::1]:53202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpEjl-0002OF-Vs
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 13:07:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kpEXO-0003AG-Fy
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 12:55:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28327)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kpEXG-0001UC-Ss
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 12:55:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608054894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kt/a++xy3rWmXmW1npWofSpNk9PQdl2jrsIpu/bXV64=;
 b=A39HE9pfn2Bvjsu6tWEBXfWWYA6mk5Dk5MMR9uDFgYdSLJjI2bsHVy1HbOdgATscpA+O4w
 wFk7kDk5U+fG3ZmdIbksITsYAn0rG5CWUpfcyiPYRRwr/aCqHorXK999tRwl2He/3PbFb7
 t5flQVmrIfCa3/3/X2QEeNmv94MQ0zU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-335-ArviOShwOwiNU7j-oPINww-1; Tue, 15 Dec 2020 12:54:52 -0500
X-MC-Unique: ArviOShwOwiNU7j-oPINww-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C37718B37E9
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 17:54:51 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2D37C100238C;
 Tue, 15 Dec 2020 17:54:51 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/45] monitor: allow quitting while in preconfig state
Date: Tue, 15 Dec 2020 12:54:13 -0500
Message-Id: <20201215175445.1272776-14-pbonzini@redhat.com>
In-Reply-To: <20201215175445.1272776-1-pbonzini@redhat.com>
References: <20201215175445.1272776-1-pbonzini@redhat.com>
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
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hmp-commands.hx   | 1 +
 qapi/control.json | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/hmp-commands.hx b/hmp-commands.hx
index dd460eb908..470a420c2d 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -45,6 +45,7 @@ ERST
         .params     = "",
         .help       = "quit the emulator",
         .cmd        = hmp_quit,
+        .flags      = "p",
     },
 
 SRST
diff --git a/qapi/control.json b/qapi/control.json
index 9c8a51352d..2615d5170b 100644
--- a/qapi/control.json
+++ b/qapi/control.json
@@ -219,7 +219,8 @@
 # -> { "execute": "quit" }
 # <- { "return": {} }
 ##
-{ 'command': 'quit' }
+{ 'command': 'quit',
+  'allow-preconfig': true }
 
 ##
 # @MonitorMode:
-- 
2.26.2



