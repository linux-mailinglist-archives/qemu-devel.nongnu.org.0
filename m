Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBD32A0F61
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Oct 2020 21:23:38 +0100 (CET)
Received: from localhost ([::1]:45022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kYavx-00021M-NC
	for lists+qemu-devel@lfdr.de; Fri, 30 Oct 2020 16:23:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kYau5-0000Bo-G2
 for qemu-devel@nongnu.org; Fri, 30 Oct 2020 16:21:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kYau3-0007hA-Si
 for qemu-devel@nongnu.org; Fri, 30 Oct 2020 16:21:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604089299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=heSHQZUMbRn1It5jncQ6+b74Z3Hrufzin1N4upH9idU=;
 b=gUAMDIS4zaS5oMiqIwJse0UmuE4p3Rdp8uvrjyvrlYAV2g0GCpzMaD73u64qJ8ktXGmh74
 /0THZUzO2zuQI28ZQgBoFInVLiRIacETN3TQfqg3hpuKb9o2Fu282Jmon/IWkAyAxitI0F
 vPNw4TXspIEvPq1vB1GsNosTLziKOxg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-469-voZOZUAqMsCf7N5J3hFq5A-1; Fri, 30 Oct 2020 16:21:37 -0400
X-MC-Unique: voZOZUAqMsCf7N5J3hFq5A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73E0F18A2257
 for <qemu-devel@nongnu.org>; Fri, 30 Oct 2020 20:21:36 +0000 (UTC)
Received: from localhost (ovpn-114-68.rdu2.redhat.com [10.10.114.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 417455D9D2;
 Fri, 30 Oct 2020 20:21:36 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/20] qdev: Stop using error_set_from_qdev_prop_error() for
 audiodev property
Date: Fri, 30 Oct 2020 16:21:14 -0400
Message-Id: <20201030202131.796967-4-ehabkost@redhat.com>
In-Reply-To: <20201030202131.796967-1-ehabkost@redhat.com>
References: <20201030202131.796967-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/30 16:21:37
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Just setting a reasonable error string using error_setg() is
simpler and makes error messages clearer.

Before:

  $ qemu-system-x86_64 -device AC97,audiodev=a0
  qemu-system-x86_64: -device AC97,audiodev=a0: Property 'AC97.audiodev' can't find value 'a0'

After:

  $ ./qemu-system-x86_64 -device AC97,audiodev=a0
  qemu-system-x86_64: -device AC97,audiodev=a0: Property 'AC97.audiodev' can't take value 'a0': audiodev not found

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Daniel P. Berrangé" <berrange@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: qemu-devel@nongnu.org
---
 hw/core/qdev-properties-system.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-system.c
index 60be09efba..a5a1a6ffee 100644
--- a/hw/core/qdev-properties-system.c
+++ b/hw/core/qdev-properties-system.c
@@ -447,7 +447,6 @@ static void set_audiodev(Object *obj, Visitor *v, const char* name,
     Property *prop = opaque;
     QEMUSoundCard *card = object_static_prop_ptr(obj, prop);
     AudioState *state;
-    int err = 0;
     char *str;
 
     if (!visit_type_str(v, name, &str, errp)) {
@@ -457,13 +456,12 @@ static void set_audiodev(Object *obj, Visitor *v, const char* name,
     state = audio_state_by_name(str);
 
     if (!state) {
-        err = -ENOENT;
+        error_setg(errp, "audiodev not found");
         goto out;
     }
     card->state = state;
 
 out:
-    error_set_from_qdev_prop_error(errp, err, obj, prop, str);
     g_free(str);
 }
 
-- 
2.28.0


