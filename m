Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5971832B9E5
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 19:34:12 +0100 (CET)
Received: from localhost ([::1]:32774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHWK3-0005GZ-C8
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 13:34:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHW9t-0006fy-Sm
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 13:23:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHW9r-0000m1-6V
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 13:23:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614795818;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QekL+lZ5BnBNsP996/ujwa8S4r0MydEApZGppEXSzVI=;
 b=ipXmRkFPFH1lEBooeVIEz0/Pv+DEXb3HkxMW2FCTF3vOWZb0Z0zdk3j9EQDw2deK/FeAGq
 pCCTYb1UV8TIsRrbimrK73KLJnR76MMSwb//RuA8MO20tkwJo3k7/0EV1QkTXoTzRB16FX
 GmQF+Ns1/0yDufEQuzXmVtwDAQwFIeo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-qEtALBTbN3ufD_yVtVfDsg-1; Wed, 03 Mar 2021 13:23:35 -0500
X-MC-Unique: qEtALBTbN3ufD_yVtVfDsg-1
Received: by mail-wr1-f72.google.com with SMTP id l10so13160996wry.16
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 10:23:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QekL+lZ5BnBNsP996/ujwa8S4r0MydEApZGppEXSzVI=;
 b=auji6dZdAXgOTiMwdwpzclI4WxrOsGVKyHCYA29EhmvcztRWiLZlbQMRT2DvKddQvc
 1SODOFnfzzweMsbXsWfEZiMxSATrKqD5PMa9ihg/ue3v82NDrbuld4Hbvt5/PXY0aPd3
 vgZiF2Lh0DZPbRrXTHKPjD0YVmP+vi5ua5YWrKIRSKj2S8yC86uFCw2iu9pRDQiq8b9A
 3UM+fFsdC6CGEVmA8I6rweaEIfouqAHHXGtDyNxwJgD1gc4UV6Kw6Ng3xqYJtL4ppLSI
 S8H8y2Ruyz7XDSHfNWNq3eO9Fs5dWWDvD477hcQBgIOfUkXNCei/9rmPT13E/vqIUhDE
 Ko0A==
X-Gm-Message-State: AOAM531JBSJEIX5ccvaflvJLAW45TcpeNWWEMQLLL8ZYHncNYYVBZyVn
 t42khKG3bOoYualcj+WRBcxty91TmzGCy6BLevWi5IR32WRNq5Wjcr/JZ9uDbNP+58yN2PSW58/
 FeR89H+ljeoaFbxRPa+a31Ydkm5BC3Qidgb/5Tnxwp/omURqwBW9nQRon9UxuFysl
X-Received: by 2002:a05:6000:18a:: with SMTP id
 p10mr24189wrx.166.1614795813660; 
 Wed, 03 Mar 2021 10:23:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJygnk/F+pfVCMu6jAojHIo6THJyDiFCiZ/rv0+FX+yhcbewuYsSOKLGoO8+tY/jOc1YMyvUIQ==
X-Received: by 2002:a05:6000:18a:: with SMTP id
 p10mr24137wrx.166.1614795813286; 
 Wed, 03 Mar 2021 10:23:33 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id 1sm6435516wmj.2.2021.03.03.10.23.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 10:23:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 10/19] accel/hax: Use 'accel_vcpu' generic pointer
Date: Wed,  3 Mar 2021 19:22:10 +0100
Message-Id: <20210303182219.1631042-11-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210303182219.1631042-1-philmd@redhat.com>
References: <20210303182219.1631042-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm@nongnu.org, Sunil Muthuswamy <sunilmut@microsoft.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org, Wenchao Wang <wenchao.wang@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the 'accel_vcpu' field which is meant for accelerators.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/core/cpu.h      |  3 ---
 target/i386/hax/hax-i386.h |  4 ++--
 target/i386/hax/hax-all.c  | 14 +++++++-------
 3 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index d807645af2b..65ff8d86dbc 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -244,8 +244,6 @@ typedef struct SavedIOTLB {
 struct KVMState;
 struct kvm_run;
 
-struct hax_vcpu_state;
-
 #define TB_JMP_CACHE_BITS 12
 #define TB_JMP_CACHE_SIZE (1 << TB_JMP_CACHE_BITS)
 
@@ -421,7 +419,6 @@ struct CPUState {
     int kvm_fd;
     struct KVMState *kvm_state;
     struct kvm_run *kvm_run;
-    struct hax_vcpu_state *hax_vcpu;
     int hvf_fd;
     /* shared by kvm, hax and hvf */
     bool vcpu_dirty;
diff --git a/target/i386/hax/hax-i386.h b/target/i386/hax/hax-i386.h
index ee77406a6a6..61ff0d84f2b 100644
--- a/target/i386/hax/hax-i386.h
+++ b/target/i386/hax/hax-i386.h
@@ -26,8 +26,8 @@ typedef HANDLE hax_fd;
 
 extern struct hax_state hax_global;
 
-typedef struct hax_vcpu_state hax_vcpu_state;
-struct hax_vcpu_state {
+typedef struct AccelvCPUState hax_vcpu_state;
+struct AccelvCPUState {
     hax_fd fd;
     int vcpu_id;
     struct hax_tunnel *tunnel;
diff --git a/target/i386/hax/hax-all.c b/target/i386/hax/hax-all.c
index 08c2b60b437..ce671760e64 100644
--- a/target/i386/hax/hax-all.c
+++ b/target/i386/hax/hax-all.c
@@ -68,7 +68,7 @@ int valid_hax_tunnel_size(uint16_t size)
 
 hax_fd hax_vcpu_get_fd(CPUArchState *env)
 {
-    hax_vcpu_state *vcpu = env_cpu(env)->hax_vcpu;
+    hax_vcpu_state *vcpu = env_cpu(env)->accel_vcpu;
     if (!vcpu) {
         return HAX_INVALID_FD;
     }
@@ -194,7 +194,7 @@ int hax_vcpu_create(int id)
 
 int hax_vcpu_destroy(CPUState *cpu)
 {
-    hax_vcpu_state *vcpu = cpu->hax_vcpu;
+    hax_vcpu_state *vcpu = cpu->accel_vcpu;
 
     if (!hax_global.vm) {
         fprintf(stderr, "vcpu %x destroy failed, vm is null\n", vcpu->vcpu_id);
@@ -414,7 +414,7 @@ static int hax_handle_io(CPUArchState *env, uint32_t df, uint16_t port,
 static int hax_vcpu_interrupt(CPUArchState *env)
 {
     CPUState *cpu = env_cpu(env);
-    hax_vcpu_state *vcpu = cpu->hax_vcpu;
+    hax_vcpu_state *vcpu = cpu->accel_vcpu;
     struct hax_tunnel *ht = vcpu->tunnel;
 
     /*
@@ -446,7 +446,7 @@ static int hax_vcpu_interrupt(CPUArchState *env)
 
 void hax_raise_event(CPUState *cpu)
 {
-    hax_vcpu_state *vcpu = cpu->hax_vcpu;
+    hax_vcpu_state *vcpu = cpu->accel_vcpu;
 
     if (!vcpu) {
         return;
@@ -467,7 +467,7 @@ static int hax_vcpu_hax_exec(CPUArchState *env)
     int ret = 0;
     CPUState *cpu = env_cpu(env);
     X86CPU *x86_cpu = X86_CPU(cpu);
-    hax_vcpu_state *vcpu = cpu->hax_vcpu;
+    hax_vcpu_state *vcpu = cpu->accel_vcpu;
     struct hax_tunnel *ht = vcpu->tunnel;
 
     if (!hax_enabled()) {
@@ -1113,8 +1113,8 @@ void hax_reset_vcpu_state(void *opaque)
 {
     CPUState *cpu;
     for (cpu = first_cpu; cpu != NULL; cpu = CPU_NEXT(cpu)) {
-        cpu->hax_vcpu->tunnel->user_event_pending = 0;
-        cpu->hax_vcpu->tunnel->ready_for_interrupt_injection = 0;
+        cpu->accel_vcpu->tunnel->user_event_pending = 0;
+        cpu->accel_vcpu->tunnel->ready_for_interrupt_injection = 0;
     }
 }
 
-- 
2.26.2


