Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C8644232E
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 23:13:02 +0100 (CET)
Received: from localhost ([::1]:47388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhfY5-0001Bl-6Y
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 18:13:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhfUa-0006pw-DK
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 18:09:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhfUW-0000YG-Av
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 18:09:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635804559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hSQaBGBpJWy0B8DIEKBqKdfykrzA4ow4TzC1HWV6kH0=;
 b=hNSNMXU2Y/ryCTwvF3V47yRHi+POxwBr4glDBEfYK0S0Ns5en9qYlDbeWezXQMwMhHb6MF
 OWKSfyUcZnxqlywL8QICTVFh9cuj2k3GFG93i+t2kCnnKwFJvGDewoZ3tDcjlv9S0F5Y0s
 PZGrDGd+EHen92OgTkJja7gRK8dXI8U=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-585-XeH5F6KwMQ2ayrEM2U6wBA-1; Mon, 01 Nov 2021 18:09:19 -0400
X-MC-Unique: XeH5F6KwMQ2ayrEM2U6wBA-1
Received: by mail-wr1-f70.google.com with SMTP id
 q5-20020a5d5745000000b00178abb72486so4821848wrw.9
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 15:09:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hSQaBGBpJWy0B8DIEKBqKdfykrzA4ow4TzC1HWV6kH0=;
 b=6ov6LqNCqLH569kWLBcebUUNUJUh5OWmGWFO74CJD/ZlT4dYu45XW4r65BKdBXOpVM
 SYzc6aWMiUpNNWx2TP/GVeiQwZgPkr5MR0vl91jbDGJtA0KOC+lAd0278Ma1g/C6QE+1
 WfqnSkaVAglGrZ6keoTzUJ0m5Ke09s1cBnKdYFz7qR0g7OTVoP5NYOPFIDWIzS3wHEam
 5cd/7q96C9JbFR0y1WTS8ZCyZ1GMboWpJQfuBVw1VlDvisPl/PBQdG9NhLdzOQqWf41a
 1wmwXENiZ0Qeks2h1hucAcXZBjtU4pChlsy1867thVR3xIGwGkZfvdzGxeed37rHNhr4
 u2Bw==
X-Gm-Message-State: AOAM530BKF0RcqlpwRdzM4MoexAWFX9pbEaye9NIwb7dGSnTeVle21jG
 o2kEDkVEbrDIF8EJKJKHed3ml21qmYTBX24gxkeNu5L6DS1bS5ktvKnlvd5q4cqOLJMentKtnHa
 O90kb+9yDdKGNklM92/Nb3CjAtCOqLd1jjtWn/qvBYTgR2CCKdk+MwPJmoBz5yluEjHQ=
X-Received: by 2002:adf:a78a:: with SMTP id j10mr42370758wrc.105.1635804557543; 
 Mon, 01 Nov 2021 15:09:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzHSBNKTiLO5JlEV3iFexkub7waHAM8W6BpiJr+wCxnuH8FeGBZ5Ook1cyDpaRUcX/w/4yrnA==
X-Received: by 2002:adf:a78a:: with SMTP id j10mr42370691wrc.105.1635804557180; 
 Mon, 01 Nov 2021 15:09:17 -0700 (PDT)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id r1sm726567wmr.36.2021.11.01.15.09.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 15:09:16 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/20] KVM: introduce dirty_pages and kvm_dirty_ring_enabled
Date: Mon,  1 Nov 2021 23:08:54 +0100
Message-Id: <20211101220912.10039-3-quintela@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211101220912.10039-1-quintela@redhat.com>
References: <20211101220912.10039-1-quintela@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?q?Hyman=20Huang=28=C3=A9=C2=BB=E2=80=9E=C3=A5=E2=80=B9?=
 =?UTF-8?q?=E2=80=A1=29?= <huangy81@chinatelecom.cn>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Paul Durrant <paul@xen.org>, Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hyman Huang(é»„å‹‡) <huangy81@chinatelecom.cn>

dirty_pages is used to calculate dirtyrate via dirty ring, when
enabled, kvm-reaper will increase the dirty pages after gfns
being dirtied.

kvm_dirty_ring_enabled shows if kvm-reaper is working. dirtyrate
thread could use it to check if measurement can base on dirty
ring feature.

Signed-off-by: Hyman Huang(é»„å‹‡) <huangy81@chinatelecom.cn>
Message-Id: <fee5fb2ab17ec2159405fc54a3cff8e02322f816.1624040308.git.huangy81@chinatelecom.cn>
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 include/hw/core/cpu.h  | 1 +
 include/sysemu/kvm.h   | 1 +
 accel/kvm/kvm-all.c    | 7 +++++++
 accel/stubs/kvm-stub.c | 5 +++++
 4 files changed, 14 insertions(+)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 1a10497af3..e948e81f1a 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -381,6 +381,7 @@ struct CPUState {
     struct kvm_run *kvm_run;
     struct kvm_dirty_gfn *kvm_dirty_gfns;
     uint32_t kvm_fetch_index;
+    uint64_t dirty_pages;
 
     /* Used for events with 'vcpu' and *without* the 'disabled' properties */
     DECLARE_BITMAP(trace_dstate_delayed, CPU_TRACE_DSTATE_MAX_EVENTS);
diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
index a1ab1ee12d..7b22aeb6ae 100644
--- a/include/sysemu/kvm.h
+++ b/include/sysemu/kvm.h
@@ -547,4 +547,5 @@ bool kvm_cpu_check_are_resettable(void);
 
 bool kvm_arch_cpu_check_are_resettable(void);
 
+bool kvm_dirty_ring_enabled(void);
 #endif
diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index db8d83b137..eecd8031cf 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -469,6 +469,7 @@ int kvm_init_vcpu(CPUState *cpu, Error **errp)
     cpu->kvm_fd = ret;
     cpu->kvm_state = s;
     cpu->vcpu_dirty = true;
+    cpu->dirty_pages = 0;
 
     mmap_size = kvm_ioctl(s, KVM_GET_VCPU_MMAP_SIZE, 0);
     if (mmap_size < 0) {
@@ -743,6 +744,7 @@ static uint32_t kvm_dirty_ring_reap_one(KVMState *s, CPUState *cpu)
         count++;
     }
     cpu->kvm_fetch_index = fetch;
+    cpu->dirty_pages += count;
 
     return count;
 }
@@ -2296,6 +2298,11 @@ bool kvm_vcpu_id_is_valid(int vcpu_id)
     return vcpu_id >= 0 && vcpu_id < kvm_max_vcpu_id(s);
 }
 
+bool kvm_dirty_ring_enabled(void)
+{
+    return kvm_state->kvm_dirty_ring_size ? true : false;
+}
+
 static int kvm_init(MachineState *ms)
 {
     MachineClass *mc = MACHINE_GET_CLASS(ms);
diff --git a/accel/stubs/kvm-stub.c b/accel/stubs/kvm-stub.c
index 5b1d00a222..5319573e00 100644
--- a/accel/stubs/kvm-stub.c
+++ b/accel/stubs/kvm-stub.c
@@ -147,4 +147,9 @@ bool kvm_arm_supports_user_irq(void)
 {
     return false;
 }
+
+bool kvm_dirty_ring_enabled(void)
+{
+    return false;
+}
 #endif
-- 
2.33.1


