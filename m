Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C346646FF
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 18:07:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFH62-0003Bm-Vp; Tue, 10 Jan 2023 11:03:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pFH5T-0002tn-AD
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:02:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pFH5Q-0004zF-51
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:02:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673366571;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vK7tRlKetPWfu1xFcYQJylkefi9bwf8+ewl3JjUXMVY=;
 b=ESMwW39xAq2YQj1u4kOhkDQz0ipMbg7jvB1UGs09twUnHw/mTATpY9E0+fcpilHxFpAsF4
 dRe6NgnT/+ri2SGUvaAaZ/dmC2VHhVllajdpeRzt2V+ArYA8TaO+LvLwsqMXEUyJ5du5uB
 qIW8DtzdU1FuFrDcOS1FncCWvJEjdak=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-596-iqoO-PKAM_Cw_k-ZtXawSQ-1; Tue, 10 Jan 2023 11:02:49 -0500
X-MC-Unique: iqoO-PKAM_Cw_k-ZtXawSQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 k20-20020a05600c1c9400b003d9717c8b11so6480386wms.7
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 08:02:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vK7tRlKetPWfu1xFcYQJylkefi9bwf8+ewl3JjUXMVY=;
 b=ts+2qJPL7/x8YEgBsu3u5w9p8jIWL++54TwOsGlFw24ddUIkJmliZGgnJxj6G8JeVY
 mOpCBXTL/8DDmZ96Hz6Qek1SNgntAUbvab/xgSr/Y0/88LKSxGzMIhIeibOM8Kuxt73e
 YoIseSm2ijMeBsAxeopBYbKM8me85GeRF+g9nhQTQwQpE/6XPi0TKaehfoOjoNWL7IZ4
 yMHa/TVpX0LKVkhbHEVzqumPm7GhsWmT8tmnRvwfGKPgonQfrgoWaF9VPwCBJq6Z7h/H
 n/peBI3hn4vrECfcYKx9utuir4qzvUMn3eecmirlBBH53k45bq4h00+IbP3JA2/FckyR
 va1A==
X-Gm-Message-State: AFqh2kq+q1xAXOIZlUDaPpp5lyVFQXaqwkD1YhFa7jlVznyF9uAzFwC/
 qvx2NtPSuNUNZF9QvKsLbktDplRxMypEyAU3dC7NCG3bpSmfEgYAnzXT93ZYpzna0pMR9eIReFq
 QNKp6D5ftIxO/IRTrWsFXw9tNPqs88Mwzxhs90U9W9O8UYZAv37XYGlK/Di14BHbNCVY=
X-Received: by 2002:a05:600c:1d0e:b0:3cf:7c8b:a7c7 with SMTP id
 l14-20020a05600c1d0e00b003cf7c8ba7c7mr49348989wms.39.1673366566734; 
 Tue, 10 Jan 2023 08:02:46 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvx+Go2R1HDUazY1BypKSRP26M/hR0pfJKdb45NcD5+PJlG41CDf3gZhivXWqwSWcEzKAmvTQ==
X-Received: by 2002:a05:600c:1d0e:b0:3cf:7c8b:a7c7 with SMTP id
 l14-20020a05600c1d0e00b003cf7c8ba7c7mr49348964wms.39.1673366566459; 
 Tue, 10 Jan 2023 08:02:46 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 c7-20020a05600c0a4700b003c6bbe910fdsm23582630wmq.9.2023.01.10.08.02.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 08:02:46 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 David Hildenbrand <david@redhat.com>
Subject: [PULL 04/29] KVM: keep track of running ioctls
Date: Tue, 10 Jan 2023 17:02:08 +0100
Message-Id: <20230110160233.339771-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230110160233.339771-1-pbonzini@redhat.com>
References: <20230110160233.339771-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Emanuele Giuseppe Esposito <eesposit@redhat.com>

Using the new accel-blocker API, mark where ioctls are being called
in KVM. Next, we will implement the critical section that will take
care of performing memslots modifications atomically, therefore
preventing any new ioctl from running and allowing the running ones
to finish.

Signed-off-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-Id: <20221111154758.1372674-3-eesposit@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/kvm/kvm-all.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index e86c33e0e612..8760d55002cc 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -2310,6 +2310,7 @@ static int kvm_init(MachineState *ms)
     assert(TARGET_PAGE_SIZE <= qemu_real_host_page_size());
 
     s->sigmask_len = 8;
+    accel_blocker_init();
 
 #ifdef KVM_CAP_SET_GUEST_DEBUG
     QTAILQ_INIT(&s->kvm_sw_breakpoints);
@@ -3014,7 +3015,9 @@ int kvm_vm_ioctl(KVMState *s, int type, ...)
     va_end(ap);
 
     trace_kvm_vm_ioctl(type, arg);
+    accel_ioctl_begin();
     ret = ioctl(s->vmfd, type, arg);
+    accel_ioctl_end();
     if (ret == -1) {
         ret = -errno;
     }
@@ -3032,7 +3035,9 @@ int kvm_vcpu_ioctl(CPUState *cpu, int type, ...)
     va_end(ap);
 
     trace_kvm_vcpu_ioctl(cpu->cpu_index, type, arg);
+    accel_cpu_ioctl_begin(cpu);
     ret = ioctl(cpu->kvm_fd, type, arg);
+    accel_cpu_ioctl_end(cpu);
     if (ret == -1) {
         ret = -errno;
     }
@@ -3050,7 +3055,9 @@ int kvm_device_ioctl(int fd, int type, ...)
     va_end(ap);
 
     trace_kvm_device_ioctl(fd, type, arg);
+    accel_ioctl_begin();
     ret = ioctl(fd, type, arg);
+    accel_ioctl_end();
     if (ret == -1) {
         ret = -errno;
     }
-- 
2.38.1


