Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FE42CB941
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 10:43:25 +0100 (CET)
Received: from localhost ([::1]:51378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkOfU-0008M2-MK
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 04:43:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNMF-0006dD-1t
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:19:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNM2-0006x1-49
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:19:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606897149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CDtNKxRkqK5xwa1ACpHHy9tddOovOMZ7/pEy6jnHZZk=;
 b=LcgapIKIEDfNvifi2yZbFFZ4gRFL01x8+tAqEXKH1jk8Auiyp2zzgpI2wbMjjGrUH5oNxF
 H9vz+Hu6CVoYI37IGvPuXMyG2cFYr1XExjJvzoo620vn336NHYPwTYh/5jwPnlgcSd5Lau
 fPQqFV/r3OOrM0+p8WUQTBwnSzkBkbg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-1mi8QIo5MYyRRJJ2GXFiSw-1; Wed, 02 Dec 2020 03:19:07 -0500
X-MC-Unique: 1mi8QIo5MYyRRJJ2GXFiSw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB138805BE1
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:19:06 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A84B35D9C6;
 Wed,  2 Dec 2020 08:19:06 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 15/15] monitor: allow quitting while in preconfig state
Date: Wed,  2 Dec 2020 03:18:54 -0500
Message-Id: <20201202081854.4126071-16-pbonzini@redhat.com>
In-Reply-To: <20201202081854.4126071-1-pbonzini@redhat.com>
References: <20201202081854.4126071-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hmp-commands.hx   | 1 +
 qapi/control.json | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/hmp-commands.hx b/hmp-commands.hx
index ff2d7aa8f3..d192afa652 100644
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
index 134f842baf..1ebc450aad 100644
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


