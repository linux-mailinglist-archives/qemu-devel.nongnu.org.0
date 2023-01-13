Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32AAE669E30
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 17:33:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGMor-0006pK-DS; Fri, 13 Jan 2023 11:22:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pGMon-0006lK-93
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 11:22:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pGMol-0005nH-OZ
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 11:22:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673626930;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XPiLURC+pasBUtX+TWccqsO1skJM4eGW3ibva3hIUKc=;
 b=QnFgcunlXQr7i+9sAtoQsxGzWsV024Zh/AjqpNRREW0ZY3nZp3HVO9k6/9dyGkTd572mru
 tm6H/IfVXbY7DQPxSlRudObu8jffZ7ujTay1d3GGhWXUQshWoD6c/aPqcGmkX7bQyBxt5t
 QziWwLdnafL9es5Bz3U4Njs/aGkWQIk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-616-EnuSca-6OP6zOpEqDWxxqw-1; Fri, 13 Jan 2023 11:22:02 -0500
X-MC-Unique: EnuSca-6OP6zOpEqDWxxqw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 19A223803917;
 Fri, 13 Jan 2023 16:22:02 +0000 (UTC)
Received: from virtlab420.virt.lab.eng.bos.redhat.com
 (virtlab420.virt.lab.eng.bos.redhat.com [10.19.152.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ABCB940C2004;
 Fri, 13 Jan 2023 16:22:01 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Bandan Das <bsd@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, libvir-list@redhat.com,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Thomas Huth <thuth@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 1/9] audio: don't check qemu_add_vm_change_state_handler
 failure
Date: Fri, 13 Jan 2023 11:21:52 -0500
Message-Id: <20230113162200.3010804-2-berrange@redhat.com>
In-Reply-To: <20230113162200.3010804-1-berrange@redhat.com>
References: <20230113162200.3010804-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This function cannot fail since g_malloc0 aborts on OOM.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 audio/audio.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/audio/audio.c b/audio/audio.c
index d849a94a81..7b4b957945 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -1712,7 +1712,6 @@ static AudioState *audio_init(Audiodev *dev, const char *name)
     size_t i;
     int done = 0;
     const char *drvname = NULL;
-    VMChangeStateEntry *e;
     AudioState *s;
     struct audio_driver *driver;
     /* silence gcc warning about uninitialized variable */
@@ -1830,11 +1829,7 @@ static AudioState *audio_init(Audiodev *dev, const char *name)
         s->period_ticks = dev->timer_period * (int64_t)SCALE_US;
     }
 
-    e = qemu_add_vm_change_state_handler (audio_vm_change_state_handler, s);
-    if (!e) {
-        dolog ("warning: Could not register change state handler\n"
-               "(Audio can continue looping even after stopping the VM)\n");
-    }
+    qemu_add_vm_change_state_handler (audio_vm_change_state_handler, s);
 
     QTAILQ_INSERT_TAIL(&audio_states, s, list);
     QLIST_INIT (&s->card_head);
-- 
2.38.1


