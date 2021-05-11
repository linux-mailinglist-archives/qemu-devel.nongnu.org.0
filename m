Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AABB537A1FA
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 10:29:22 +0200 (CEST)
Received: from localhost ([::1]:42626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgNlZ-00081i-Oi
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 04:29:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgNWy-0001ui-Qy
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:14:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33148)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgNWn-0000mc-A7
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:14:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620720844;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cztWtFoS5e/0TSdWo16Byi2NypRIr6tpTIxqzvJetf0=;
 b=PTuBIMsW5cazGtiriPC9IOd8p9i4NlE9cIQI4rAA/X79sJhMusnxVzgb0xQGuCzFWAr9kA
 Lrj5KUTpvupGYf5448PfijjYH6+qvtf9Hb3ENcIIL3HBhjCPEGey6sKgFmrlmi1z7RgaRz
 UINgY8QcO7bbQK9s/zLei1FoolV3jvc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-ZkGCPQZdPha17DLkWG0OTA-1; Tue, 11 May 2021 04:14:02 -0400
X-MC-Unique: ZkGCPQZdPha17DLkWG0OTA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC461107ACE4;
 Tue, 11 May 2021 08:14:01 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7C1E96E407;
 Tue, 11 May 2021 08:14:01 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 20/33] accel: move call to accel_init_interfaces
Date: Tue, 11 May 2021 04:13:37 -0400
Message-Id: <20210511081350.419428-21-pbonzini@redhat.com>
In-Reply-To: <20210511081350.419428-1-pbonzini@redhat.com>
References: <20210511081350.419428-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Claudio Fontana <cfontana@suse.de>

move the call for sysemu specifically in machine_run_board_init,
mirror the calling sequence for user mode too.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Claudio Fontana <cfontana@suse.de>
Message-Id: <20210322132800.7470-23-cfontana@suse.de>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 bsd-user/main.c   | 2 +-
 hw/core/machine.c | 1 +
 linux-user/main.c | 2 +-
 softmmu/vl.c      | 1 -
 4 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index 36a889d084..715129e624 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -913,8 +913,8 @@ int main(int argc, char **argv)
     {
         AccelClass *ac = ACCEL_GET_CLASS(current_accel());
 
-        ac->init_machine(NULL);
         accel_init_interfaces(ac);
+        ac->init_machine(NULL);
     }
     cpu = cpu_create(cpu_type);
     env = cpu->env_ptr;
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 0f5ce43d0c..1bf0e687b9 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1234,6 +1234,7 @@ void machine_run_board_init(MachineState *machine)
                                    "on", false);
     }
 
+    accel_init_interfaces(ACCEL_GET_CLASS(machine->accelerator));
     machine_class->init(machine);
     phase_advance(PHASE_MACHINE_INITIALIZED);
 }
diff --git a/linux-user/main.c b/linux-user/main.c
index 57ba1b45ab..7995b6e7a6 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -729,8 +729,8 @@ int main(int argc, char **argv, char **envp)
     {
         AccelClass *ac = ACCEL_GET_CLASS(current_accel());
 
-        ac->init_machine(NULL);
         accel_init_interfaces(ac);
+        ac->init_machine(NULL);
     }
     cpu = cpu_create(cpu_type);
     env = cpu->env_ptr;
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 307944aef3..93e78469bc 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -3595,7 +3595,6 @@ void qemu_init(int argc, char **argv, char **envp)
         current_machine->cpu_type = parse_cpu_option(cpu_option);
     }
     /* NB: for machine none cpu_type could STILL be NULL here! */
-    accel_init_interfaces(ACCEL_GET_CLASS(current_machine->accelerator));
 
     qemu_resolve_machine_memdev();
     parse_numa_opts(current_machine);
-- 
2.26.2



