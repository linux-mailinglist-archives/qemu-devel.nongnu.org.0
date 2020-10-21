Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B242953E7
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Oct 2020 23:12:49 +0200 (CEST)
Received: from localhost ([::1]:41558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVLPc-000504-Rw
	for lists+qemu-devel@lfdr.de; Wed, 21 Oct 2020 17:12:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kVLB1-0005g2-F1
 for qemu-devel@nongnu.org; Wed, 21 Oct 2020 16:57:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21085)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kVLAx-0006iI-AZ
 for qemu-devel@nongnu.org; Wed, 21 Oct 2020 16:57:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603313855;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yUI3M4ipd89OmxngsbbB8zIQpi1LjWQ0a+wUYL8SpBM=;
 b=bsRqYHsuuyYsxeIkKrKdJhUDmEpi7kcYcgXsTCfiVxycYkuAxup9UzTdeqaMO8IeK6X/ow
 eUScOOIwy9xBJJ0H7UsWLur3Gh2sKK/Sn2HaSTTkFVn2Bu0OtGfBdsTJjcBQyN9JkzdX3y
 qhiEH1+nkiZb99Qdf5jIeiP0H4ydBLA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-261-8AQQP2oIMbCIkaCTFAHxrQ-1; Wed, 21 Oct 2020 16:57:33 -0400
X-MC-Unique: 8AQQP2oIMbCIkaCTFAHxrQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AC8A6186DD23
 for <qemu-devel@nongnu.org>; Wed, 21 Oct 2020 20:57:32 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2996F6EF62;
 Wed, 21 Oct 2020 20:57:32 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 18/22] vl: move semihosting command line fallback to
 qemu_finish_machine_init
Date: Wed, 21 Oct 2020 16:57:12 -0400
Message-Id: <20201021205716.2359430-19-pbonzini@redhat.com>
In-Reply-To: <20201021205716.2359430-1-pbonzini@redhat.com>
References: <20201021205716.2359430-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/21 02:16:02
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
Cc: jsnow@redhat.com, berrange@redhat.com, ehabkost@redhat.com,
 imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move more sane parts of the huge qemu_init function out of it.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 softmmu/vl.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index 75e57133ad..e58572dbd8 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -3067,6 +3067,11 @@ void qemu_finish_machine_init(void)
 
     /* from here on runstate is RUN_STATE_PRELAUNCH */
 
+    if (semihosting_enabled() && !semihosting_get_argc() && current_machine->kernel_filename) {
+        /* fall back to the -kernel/-append */
+        semihosting_arg_fallback(current_machine->kernel_filename, current_machine->kernel_cmdline);
+    }
+
     if (machine_class->default_ram_id && current_machine->ram_size &&
         numa_uses_legacy_mem() && !current_machine->ram_memdev_id) {
         create_default_memdev(current_machine, mem_path);
@@ -4372,13 +4377,6 @@ void qemu_init(int argc, char **argv, char **envp)
         boot_order = machine_class->default_boot_order;
     }
 
-    if (semihosting_enabled() && !semihosting_get_argc()) {
-        const char *kernel_filename = qemu_opt_get(machine_opts, "kernel");
-        const char *kernel_cmdline = qemu_opt_get(machine_opts, "append");
-        /* fall back to the -kernel/-append */
-        semihosting_arg_fallback(kernel_filename, kernel_cmdline);
-    }
-
     if (net_init_clients(&err) < 0) {
         error_report_err(err);
         exit(1);
-- 
2.26.2



