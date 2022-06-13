Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C10F8548498
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 12:47:32 +0200 (CEST)
Received: from localhost ([::1]:33632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0hbX-0005GB-Aq
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 06:47:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhang@suse.de>) id 1o0hZ6-0004Vd-EW
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 06:45:01 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:33618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lizhang@suse.de>) id 1o0hZ3-0001k2-8t
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 06:44:59 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1B7F421D73;
 Mon, 13 Jun 2022 10:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1655117086; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=8AKmDJ6mLM4eptJ/y/4ULYOMELVLkHtRT340cUiVhSA=;
 b=sW01hyEQrB/Ltn1rVbL3CX77E53mxTdvgTW96RqUBALd//Yl2T3wjG03yc/WPHvTk42k9M
 BO0jLbIHW5ZFhLDrr4LixlVBEoscLzmT4wo7N9mMO66WRNmSuYOm5AF1FVfaePXMX38Ixh
 Ei3AwCKJe0r07hTBAH6saEJE8xojy/w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1655117086;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=8AKmDJ6mLM4eptJ/y/4ULYOMELVLkHtRT340cUiVhSA=;
 b=42sJgjpmX6vFBKTXP8GgsKvbIbAvSwu0DZsE65zceeBVc/lvdJYWgNokg4N6D8FG1NoEDy
 ZEHFubWyiriPbjAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CAD9513443;
 Mon, 13 Jun 2022 10:44:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ym3WLx0Vp2KfZgAAMHmgww
 (envelope-from <lizhang@suse.de>); Mon, 13 Jun 2022 10:44:45 +0000
From: Li Zhang <lizhang@suse.de>
To: imammedo@redhat.com, marcel.apfelbaum@gmail.com, f4bug@amsat.org,
 wangyanan55@huawei.com, qemu-devel@nongnu.org, zhlcindy@gmail.com
Cc: Li Zhang <lizhang@suse.de>
Subject: [PATCH v3 1/1] Fix the coredump when memory backend id conflicts with
 default_ram_id
Date: Mon, 13 Jun 2022 12:44:02 +0200
Message-Id: <20220613104402.10279-1-lizhang@suse.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=lizhang@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When no memory backend is specified in machine options,
a default memory device will be added with default_ram_id.
However, if a memory backend object is added in QEMU options
and id is the same as default_ram_id, a coredump happens.

Command line:
qemu-system-x86_64 -name guest=vmtest,debug-threads=on \
-machine pc-q35-6.0,accel=kvm,usb=off,vmport=off \
-smp 16,sockets=16,cores=1,threads=1 \
-m 4G \
-object memory-backend-ram,id=pc.ram,size=4G \
-no-user-config -nodefaults -nographic

Stack trace of thread 16903:
    #0  0x00007fb109a9318b raise (libc.so.6 + 0x3a18b)
    #1  0x00007fb109a94585 abort (libc.so.6 + 0x3b585)
    #2  0x0000558c34bc89be error_handle_fatal (qemu-system-x86_64 + 0x9c89be)
    #3  0x0000558c34bc8aee error_setv (qemu-system-x86_64 + 0x9c8aee)
    #4  0x0000558c34bc8ccf error_setg_internal (qemu-system-x86_64 + 0x9c8ccf)
    #5  0x0000558c349f6899 object_property_try_add (qemu-system-x86_64 + 0x7f6899)
    #6  0x0000558c349f7df8 object_property_try_add_child (qemu-system-x86_64 + 0x7f7df8)
    #7  0x0000558c349f7e91 object_property_add_child (qemu-system-x86_64 + 0x7f7e91)
    #8  0x0000558c3454686d create_default_memdev (qemu-system-x86_64 + 0x34686d)
    #9  0x0000558c34546f58 qemu_init_board (qemu-system-x86_64 + 0x346f58)
    #10 0x0000558c345471b9 qmp_x_exit_preconfig (qemu-system-x86_64 + 0x3471b9)
    #11 0x0000558c345497d9 qemu_init (qemu-system-x86_64 + 0x3497d9)
    #12 0x0000558c344e54c2 main (qemu-system-x86_64 + 0x2e54c2)
    #13 0x00007fb109a7e34d __libc_start_main (libc.so.6 + 0x2534d)
    #14 0x0000558c344e53ba _start (qemu-system-x86_64 + 0x2e53ba)

Signed-off-by: Li Zhang <lizhang@suse.de>
---
 hw/core/machine.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index a673302cce..9ede63b01c 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1265,9 +1265,21 @@ MemoryRegion *machine_consume_memdev(MachineState *machine,
 static bool create_default_memdev(MachineState *ms, const char *path, Error **errp)
 {
     Object *obj;
+    ObjectProperty *prop;
     MachineClass *mc = MACHINE_GET_CLASS(ms);
     bool r = false;
 
+    prop = object_property_find(object_get_objects_root(), mc->default_ram_id);
+    if (prop) {
+        error_report("A memory backend with id '%s' already exists, "
+                     "cannot create default RAM backend with the same id. "
+                     "Either change id of the offending backend or "
+                     "provide system RAM backend explicitly using "
+                     "'-machine memory-backend' option. " ,
+                     mc->default_ram_id);
+        exit(EXIT_FAILURE);
+    }
+
     obj = object_new(path ? TYPE_MEMORY_BACKEND_FILE : TYPE_MEMORY_BACKEND_RAM);
     if (path) {
         if (!object_property_set_str(obj, "mem-path", path, errp)) {
-- 
2.34.1


