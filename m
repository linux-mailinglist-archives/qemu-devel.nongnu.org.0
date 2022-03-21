Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0394E2EE0
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 18:11:27 +0100 (CET)
Received: from localhost ([::1]:33400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWLZ0-0002tL-UI
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 13:11:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nWLRU-0001kU-Rw
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 13:03:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nWLRT-00057t-4O
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 13:03:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647882218;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NtN/0Vd1s+Zrl8loa/eEgr2gfW6652xNROytJwkZarE=;
 b=eQLXsRb1Vj0VNogIysMB+nVBy3ZEfdCiJbV+q9bXvZzcLXNlP9LAvps2CeZZ7VQH6fin3u
 99UfoHXUVbpl6deCAcPohi2qcZ0vOJsKlnOq8zmLnUXNzhDj2oWsH7iBRlZnSZL00CPtz5
 Sm7lLl5os7qwIFK+sTKiQ6Bo9hln/zE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-510-A0KEfrrbNOqUaq3G_2i9gA-1; Mon, 21 Mar 2022 13:03:35 -0400
X-MC-Unique: A0KEfrrbNOqUaq3G_2i9gA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A61BC106655B;
 Mon, 21 Mar 2022 17:03:34 +0000 (UTC)
Received: from thuth.com (unknown [10.39.195.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1362F40C1241;
 Mon, 21 Mar 2022 17:03:31 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 4/8] hw/audio/intel-hda: Restrict DMA engine to memories (not
 MMIO devices)
Date: Mon, 21 Mar 2022 18:03:16 +0100
Message-Id: <20220321170320.282496-5-thuth@redhat.com>
In-Reply-To: <20220321170320.282496-1-thuth@redhat.com>
References: <20220321170320.282496-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-block@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alexander Bulekov <alxndr@bu.edu>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Issue #542 reports a reentrancy problem when the DMA engine accesses
the HDA controller I/O registers. Fix by restricting the DMA engine
to memories regions (forbidding MMIO devices such the HDA controller).

Reported-by: OSS-Fuzz (Issue 28435)
Reported-by: Alexander Bulekov <alxndr@bu.edu>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/542
CVE: CVE-2021-3611
Message-Id: <20211218160912.1591633-3-philmd@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/audio/intel-hda.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/audio/intel-hda.c b/hw/audio/intel-hda.c
index 47a36acc71..78a47bc08c 100644
--- a/hw/audio/intel-hda.c
+++ b/hw/audio/intel-hda.c
@@ -345,7 +345,7 @@ static void intel_hda_corb_run(IntelHDAState *d)
 
 static void intel_hda_response(HDACodecDevice *dev, bool solicited, uint32_t response)
 {
-    const MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
+    const MemTxAttrs attrs = { .memory = true };
     HDACodecBus *bus = HDA_BUS(dev->qdev.parent_bus);
     IntelHDAState *d = container_of(bus, IntelHDAState, codecs);
     hwaddr addr;
-- 
2.27.0


