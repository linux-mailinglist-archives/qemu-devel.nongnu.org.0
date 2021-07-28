Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A23DE3D955D
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 20:37:23 +0200 (CEST)
Received: from localhost ([::1]:45152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8oQk-00078Q-2p
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 14:37:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m8oLi-0005um-3J
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 14:32:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m8oLf-000764-3g
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 14:32:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627497126;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u1Bbhy9FxQTFvhtC24q8Zh262TZNyYALI7nv979a/e0=;
 b=M+nVBBkq8E1l7Q63db5Iv9DOqki2kWVSjAaz0wxrXcXVtNUrhY6rpK7rfXfepYWCYB+0QX
 qVU0pa2FJnoTRmsrauIDjOfqhXbbeA0egY0OqGdkFMypcJnhlLsEYFG8KQ1B19Y2bosule
 l50W3fl8hftlvxe6DQ01ivR1/eiQ53g=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-N1u-VKVROU62AjNaEuyJiQ-1; Wed, 28 Jul 2021 14:32:04 -0400
X-MC-Unique: N1u-VKVROU62AjNaEuyJiQ-1
Received: by mail-qk1-f197.google.com with SMTP id
 x12-20020a05620a14acb02903b8f9d28c19so2109554qkj.23
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 11:32:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u1Bbhy9FxQTFvhtC24q8Zh262TZNyYALI7nv979a/e0=;
 b=UrDNDryCe1Df8seOngBUzZ941hxlNbqk+HC0W2nqtag8u7uef2J4hCogn7pKJSgICz
 Rf4U7BHvQhhb7WZ2e7I1W6mJeVZUk6+w2kS2/Sx6+Dh/OS8Bar4DL/Wmi7A/bP1Hc5OV
 X1ltML363KjB/+oQnxPWGtRTcnxofZqEYP2y2Fo2AS0b1wEEyRYYCJId2AwM7GbK/Hbb
 NwQ18en7XRUNsKgN346/7Uk7qfQypHHb+PGJQuXiDBulOL9t4MQztY/obZf5LK0dlr6c
 P2fJaQ9l9wgyBA3y3bkNPxkBPKXU54zvVtiIH0cAlFBdt3eDzWWJ/AmUdE/JSVMOaHOP
 Ep0A==
X-Gm-Message-State: AOAM532nH9nGYmvV2wOqR5riyuai1y1kNaXb9jj2R70S7Ax2ofBiC2Mi
 4/nhyQVYggvgOBZwUnkJ12f+uPyX+/Rd35F4pYIS0NK6uMe8aVal0awizepa7lL1CbXbcdtCQvQ
 9bILJbPU8qCvFQRBLdC5h4Wsqw7tjBIQJV1OEm/768DsofT1BmxV9OBfeVJ1yxDxp
X-Received: by 2002:ad4:5b85:: with SMTP id 5mr1413915qvp.24.1627497123790;
 Wed, 28 Jul 2021 11:32:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzkK1SQ5P7mMO2LBJA3bSxDOY3Ycl0Ju/N/WQ7U6xpjCVPQ5rjeWT4QZfsQobrECcG1KTPcNQ==
X-Received: by 2002:ad4:5b85:: with SMTP id 5mr1413891qvp.24.1627497123532;
 Wed, 28 Jul 2021 11:32:03 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id n5sm417528qkp.116.2021.07.28.11.32.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 11:32:02 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 5/8] cpus: Use qemu_cond_wait_iothread() where proper
Date: Wed, 28 Jul 2021 14:31:48 -0400
Message-Id: <20210728183151.195139-6-peterx@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210728183151.195139-1-peterx@redhat.com>
References: <20210728183151.195139-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 peterx@redhat.com, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The helper is introduced but we've still got plenty of places that are directly
referencing the qemu_global_mutex itself.  Spread the usage.

Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 softmmu/cpus.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index 49e0368438..e714dfbf2b 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -439,7 +439,7 @@ void qemu_wait_io_event(CPUState *cpu)
             slept = true;
             qemu_plugin_vcpu_idle_cb(cpu);
         }
-        qemu_cond_wait(cpu->halt_cond, &qemu_global_mutex);
+        qemu_cond_wait_iothread(cpu->halt_cond);
     }
     if (slept) {
         qemu_plugin_vcpu_resume_cb(cpu);
@@ -582,7 +582,7 @@ void pause_all_vcpus(void)
     replay_mutex_unlock();
 
     while (!all_vcpus_paused()) {
-        qemu_cond_wait(&qemu_pause_cond, &qemu_global_mutex);
+        qemu_cond_wait_iothread(&qemu_pause_cond);
         CPU_FOREACH(cpu) {
             qemu_cpu_kick(cpu);
         }
@@ -653,7 +653,7 @@ void qemu_init_vcpu(CPUState *cpu)
     cpus_accel->create_vcpu_thread(cpu);
 
     while (!cpu->created) {
-        qemu_cond_wait(&qemu_cpu_cond, &qemu_global_mutex);
+        qemu_cond_wait_iothread(&qemu_cpu_cond);
     }
 }
 
-- 
2.31.1


