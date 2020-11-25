Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FE92C496B
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 21:59:54 +0100 (CET)
Received: from localhost ([::1]:59280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ki1tJ-0001y2-O4
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 15:59:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1ki1qU-0000KE-Mz
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 15:56:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1ki1qT-0003LO-5F
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 15:56:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606337816;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EFazzX6+7EagLkp46jyoR/EQd/qYnXrHDEbzHJLMYpI=;
 b=LEL9Oex/7UDBV2TIERyE6JHKlqRmOgeyBvIbLg8bAh5MF4lr84FJUlPjgSiK+OSQ+3lQO5
 nupzy5E98JhCfsWyhoHb9b2YNX/GZ/+zr0zSHxcAihonx88HVUz3A18xVUuyFt4g11p4Qy
 6oumvyY/McumwOWF7k7ydPKQrymhb8w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-360-o1JDkAcBNf-GrKvfqYDjBw-1; Wed, 25 Nov 2020 15:56:54 -0500
X-MC-Unique: o1JDkAcBNf-GrKvfqYDjBw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 66359106B821;
 Wed, 25 Nov 2020 20:56:53 +0000 (UTC)
Received: from localhost (unknown [10.10.67.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3ED7F60636;
 Wed, 25 Nov 2020 20:56:50 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/6] accel: accel_available() function
Date: Wed, 25 Nov 2020 15:56:32 -0500
Message-Id: <20201125205636.3305257-3-ehabkost@redhat.com>
In-Reply-To: <20201125205636.3305257-1-ehabkost@redhat.com>
References: <20201125205636.3305257-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This function will be used to replace the xen_available() and
kvm_available() functions from arch_init.c.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Claudio Fontana <cfontana@suse.de>
Cc: Roman Bolshakov <r.bolshakov@yadro.com>
---
 include/sysemu/accel.h | 1 +
 accel/accel.c          | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/include/sysemu/accel.h b/include/sysemu/accel.h
index e08b8ab8fa..a4a00c75c8 100644
--- a/include/sysemu/accel.h
+++ b/include/sysemu/accel.h
@@ -67,6 +67,7 @@ typedef struct AccelClass {
     OBJECT_GET_CLASS(AccelClass, (obj), TYPE_ACCEL)
 
 AccelClass *accel_find(const char *opt_name);
+bool accel_available(const char *name);
 int accel_init_machine(AccelState *accel, MachineState *ms);
 
 /* Called just before os_setup_post (ie just before drop OS privs) */
diff --git a/accel/accel.c b/accel/accel.c
index cb555e3b06..4a64a2b38a 100644
--- a/accel/accel.c
+++ b/accel/accel.c
@@ -46,6 +46,11 @@ AccelClass *accel_find(const char *opt_name)
     return ac;
 }
 
+bool accel_available(const char *name)
+{
+    return accel_find(name) != NULL;
+}
+
 int accel_init_machine(AccelState *accel, MachineState *ms)
 {
     AccelClass *acc = ACCEL_GET_CLASS(accel);
-- 
2.28.0


