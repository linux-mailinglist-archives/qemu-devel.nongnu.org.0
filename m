Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B56532B9EE
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 19:36:38 +0100 (CET)
Received: from localhost ([::1]:42288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHWMP-0001E0-ET
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 13:36:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHWAK-0007fG-Cb
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 13:24:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHWAH-0000wP-Gr
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 13:24:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614795844;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M4K8ZUs7Kh4DBTFlI/pvongtlyoWjFjhXN1UWmJlGpA=;
 b=cOyqazKKxavVWMs0CqFLzPbwLcuJfMhv5nuVDlbU58hU0lGlC4d1B5wM6poqXnqRIUo40O
 hw+9MOHjaCYq/Dizz5ZLSFNuD40H2r9qPvUJJO4yN+zNfuKr5+Ah6m772KG6ndSXrHcbCL
 39azyte9uXCPhj50Jc335+m1Kn2hbi8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-g5Wt7QO4MC-CvRJy5PS_fQ-1; Wed, 03 Mar 2021 13:24:03 -0500
X-MC-Unique: g5Wt7QO4MC-CvRJy5PS_fQ-1
Received: by mail-wm1-f71.google.com with SMTP id u15so3402034wmj.2
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 10:24:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M4K8ZUs7Kh4DBTFlI/pvongtlyoWjFjhXN1UWmJlGpA=;
 b=P0SSSsdlap4g9K5dxwg/3oOlTgIMNEQTYVaL1TbdYKQ1lHhuZIRTn3EXcka5UTcPBS
 tYDnWsNAegT5F6HeMRmUHwhatD8GUt0v5WShAJAFK1X+pdPfyioQP/QUQVeLwiwV6ucw
 R4jMU0RrHBj7aZKVmQ0plsJydriZ3dB237qDXw76NaTEwKfPutVvc7RpW9/mSJjtnCMG
 c0wZR9R4lH6yKxPZ3FxgTPLIl/mtndnDqISGzHrlC8k51wU/KVpY0XMJyv6xY1e4JhUE
 6pwwREYVMsD1GmUhntY/VFOlqOWnTVtpiAnzYV0zk/xfgd4CPaM9cKiPjC9dJYCDoW+u
 ky7Q==
X-Gm-Message-State: AOAM530ZzXkusfeIrUPX8RKkHMCKuc5T+DVoRamUsFJ1YDmCoRpjXiJJ
 iXf86rrcIykoI6kaGBBEUs3YcS3zv3HxyRe0ZqZR38TbDnc+lbgWPnVZlBi2HmgyoBnO9KBp54e
 g7lJPXwo/PdpY2sWbzq3dPIPa+cBLLRqxfduBJk78EH0GPay1rt8guMZAfpsaQBbG
X-Received: by 2002:a1c:2049:: with SMTP id g70mr261177wmg.7.1614795841830;
 Wed, 03 Mar 2021 10:24:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxKNSRqR8zLkOnVmlcq5ZuBoN3wSOkgPWh5iTNFfiCeOZ6YvIytWpn9Bxp5s21C1pEsD2GscQ==
X-Received: by 2002:a1c:2049:: with SMTP id g70mr261066wmg.7.1614795840433;
 Wed, 03 Mar 2021 10:24:00 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id t14sm34525941wru.64.2021.03.03.10.23.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 10:24:00 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 15/19] accel/kvm: Move the 'kvm_state' field to
 AccelvCPUState
Date: Wed,  3 Mar 2021 19:22:15 +0100
Message-Id: <20210303182219.1631042-16-philmd@redhat.com>
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/core/cpu.h    | 1 -
 include/sysemu/kvm_int.h | 1 +
 accel/kvm/kvm-all.c      | 4 ++--
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index ca2526e6a23..4f280509f9b 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -415,7 +415,6 @@ struct CPUState {
 
     /* Accelerator-specific fields. */
     struct AccelvCPUState *accel_vcpu;
-    struct KVMState *kvm_state;
     struct kvm_run *kvm_run;
     int hvf_fd;
     /* shared by kvm, hax and hvf */
diff --git a/include/sysemu/kvm_int.h b/include/sysemu/kvm_int.h
index 3bf75e62293..dc45b3c3afa 100644
--- a/include/sysemu/kvm_int.h
+++ b/include/sysemu/kvm_int.h
@@ -18,6 +18,7 @@ struct AccelvCPUState {
      * @kvm_fd: vCPU file descriptor for KVM
      */
     int kvm_fd;
+    struct KVMState *kvm_state;
 };
 
 typedef struct KVMSlot
diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 1c08ff3fbe0..737db3d3e0e 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -437,7 +437,7 @@ int kvm_init_vcpu(CPUState *cpu, Error **errp)
 
     cpu->accel_vcpu = g_new(struct AccelvCPUState, 1);
     cpu->accel_vcpu->kvm_fd = ret;
-    cpu->kvm_state = s;
+    cpu->accel_vcpu->kvm_state = s;
     cpu->vcpu_dirty = true;
 
     mmap_size = kvm_ioctl(s, KVM_GET_VCPU_MMAP_SIZE, 0);
@@ -1985,7 +1985,7 @@ bool kvm_vcpu_id_is_valid(int vcpu_id)
 
 KVMState *kvm_vcpu_state(CPUState *cpu)
 {
-    return cpu->kvm_state;
+    return cpu->accel_vcpu->kvm_state;
 }
 
 static int kvm_init(MachineState *ms)
-- 
2.26.2


