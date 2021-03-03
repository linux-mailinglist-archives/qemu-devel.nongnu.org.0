Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB2732B9F8
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 19:42:13 +0100 (CET)
Received: from localhost ([::1]:54848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHWRo-0006ew-Bw
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 13:42:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHWAb-0007tC-Pn
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 13:24:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHWAZ-00011J-JF
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 13:24:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614795862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ozgu7uGJ7L5oIFikBv6nOOwVLHj62DaXoZ2b5Z4gqKA=;
 b=Aci5pTeARlemGUMMVrMn4mTp3oA4gQlGZlGCIZq3JUCBXJYGHwQn5wesZfe8MXSWwo3AZk
 +kLtg+VIl9rttdBToGLd8R06rCjTFxd94VzhpJMRtMm+tR4xDXZE8H9TGamTJV9S2IO73G
 IDC8aOtSK6qYTsyX+8vp/gLSkiKcs8o=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-123-82y9QdQWPtC7nVx9W7u_ow-1; Wed, 03 Mar 2021 13:24:20 -0500
X-MC-Unique: 82y9QdQWPtC7nVx9W7u_ow-1
Received: by mail-wm1-f72.google.com with SMTP id m17so2176112wml.3
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 10:24:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ozgu7uGJ7L5oIFikBv6nOOwVLHj62DaXoZ2b5Z4gqKA=;
 b=s4wcv/W0HkJ7C0fxUt2O26AlEWu1uVs3I8M7llOpM/fUFrtzIrI2KxOJnuW63LDFh5
 CB0Cbe5Og3FkLwi3oJR+7Nb8nlXiYH/kbH+w1DMhYg0g23SZQl+6hDnuIQA52AWePkax
 rbqcswa1JMImagW6A3u2h/R9E7YTSjy1lLXJ41FYb8L6X8yPbtSm8R/U8Z7H/WQL40Do
 VrzViqDA36x0TjzQMuT/RsxZuHDtReqAnoCYu/5CXX1A8pvCYQP7N9H6kd14aLsJ9fnp
 KiWvvewrBJtLuEIsRHPTuQ+VPPE0TEHBqJu0qcqhXRX6nIABdzfBgEyoJ0e5g3WZhzMR
 4pHA==
X-Gm-Message-State: AOAM532/PggovdkafHg02hmPd5zOncGE0YvRuNvxF6AAHBAfMYugcoZm
 Pyb8/gZiQKPfjXMJA2niLJJ+dM09chRnTmAHgqyAxAW6HxQ6x+WL6SF+EDRlEmZXtWrjLgSIXcZ
 Ri5TNCZHJEt0Ur7I27pf7Gvz+99hYnpS+khBvdDorpwhbkqpmYok81xAev9/Y7i5u
X-Received: by 2002:a1c:2403:: with SMTP id k3mr290766wmk.130.1614795859128;
 Wed, 03 Mar 2021 10:24:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw+bwiGrhW1JytZf41VJLAQvq5kfy08h7D0p9N1gS+u3y7+Y378geBpKVUXOU+Y1nVBjdtymg==
X-Received: by 2002:a1c:2403:: with SMTP id k3mr290721wmk.130.1614795858585;
 Wed, 03 Mar 2021 10:24:18 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id j12sm23071093wrt.27.2021.03.03.10.24.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 10:24:18 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 18/19] accel/hvf: Declare and allocate AccelvCPUState
 struct
Date: Wed,  3 Mar 2021 19:22:18 +0100
Message-Id: <20210303182219.1631042-19-philmd@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

In preparation of moving HVF-specific fields from CPUState
to the accelerator-specific AccelvCPUState structure, first
declare it empty and allocate it. This will make the following
commits easier to review.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/i386/hvf/hvf-i386.h | 3 +++
 target/i386/hvf/hvf.c      | 4 +++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/i386/hvf/hvf-i386.h b/target/i386/hvf/hvf-i386.h
index 59cfca8875e..1f12eb647a0 100644
--- a/target/i386/hvf/hvf-i386.h
+++ b/target/i386/hvf/hvf-i386.h
@@ -51,6 +51,9 @@ struct HVFState {
 };
 extern HVFState *hvf_state;
 
+struct AccelvCPUState {
+};
+
 void hvf_set_phys_mem(MemoryRegionSection *, bool);
 void hvf_handle_io(CPUArchState *, uint16_t, void *, int, int, int);
 hvf_slot *hvf_find_overlap_slot(uint64_t, uint64_t);
diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index effee39ee9b..342659f1e15 100644
--- a/target/i386/hvf/hvf.c
+++ b/target/i386/hvf/hvf.c
@@ -451,6 +451,7 @@ void hvf_vcpu_destroy(CPUState *cpu)
     hv_return_t ret = hv_vcpu_destroy((hv_vcpuid_t)cpu->hvf_fd);
     g_free(env->hvf_mmio_buf);
     assert_hvf_ok(ret);
+    g_free(cpu->accel_vcpu);
 }
 
 static void dummy_signal(int sig)
@@ -534,9 +535,10 @@ int hvf_init_vcpu(CPUState *cpu)
     }
 
     r = hv_vcpu_create(&hvf_fd, HV_VCPU_DEFAULT);
-    cpu->vcpu_dirty = true;
     assert_hvf_ok(r);
+    cpu->accel_vcpu = g_new(struct AccelvCPUState, 1);
     cpu->hvf_fd = (int)hvf_fd
+    cpu->vcpu_dirty = true;
 
     if (hv_vmx_read_capability(HV_VMX_CAP_PINBASED,
         &hvf_state->hvf_caps->vmx_cap_pinbased)) {
-- 
2.26.2


