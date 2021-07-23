Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DAA3D40E8
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 21:36:52 +0200 (CEST)
Received: from localhost ([::1]:33740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m70yZ-0000sy-5F
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 15:36:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m70wn-0006NC-Fw
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 15:35:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m70wm-0002Q8-2g
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 15:35:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627068899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jDJuGytz2IzGkl27XsjXnAQtzsd9r+txZlchoEebT5o=;
 b=PmWI3Oj8qU15PuGMQ1yXynYl2Ysrv80hQ+MM/4pCU3ix39vq3Hp0WcbUUsVgZxvBzWLqjC
 Pj8clxUI0C6txzj2OibjJHza9/RL6RGw7A8fXXJcvq3Fq35xv/h0+Y255/QAq5eI0CZnly
 FrUB+/BCs+2Vu1jbQHjpjeIPmn3aSFY=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-57faYHM_MBOG1wpYtjscRQ-1; Fri, 23 Jul 2021 15:34:58 -0400
X-MC-Unique: 57faYHM_MBOG1wpYtjscRQ-1
Received: by mail-qk1-f200.google.com with SMTP id
 h5-20020a05620a0525b02903b861bec838so1920834qkh.7
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 12:34:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jDJuGytz2IzGkl27XsjXnAQtzsd9r+txZlchoEebT5o=;
 b=eUMN8iuMmknoEFAGTcbDTQf6jp/+3FaH4VFO+D1V8WK/cJu75a0Oerc0djetoZ4C/0
 A+QYhcKylhOsGboh6dARoNmkAHFVDHQdzgba/4Lhs9KlRIf12k5LAEwAuVZgVOGiL4MK
 fooSBe+koelWwPq0SzWQXvAya8og7FH/HMqGdlh4e1TTrROhLch89PFGfMEQctKC/9qg
 GV8wouXZeqk9oDY6Lo+PtwhGCABMUbHA5oMyXIDMNYFOfCWRCkodgNSCMdkSbe/gb4zL
 mvhMIY73u5WOue72y4cfaocQfmeJ76rLYovup9YGGG3s0OSg06PvETNuB8n5IzvtUBVV
 j7Vw==
X-Gm-Message-State: AOAM532/8JsUv6mbWHfwMvcmfNk44EsqrtpARNy9RX4qXWstFOd6Tzsi
 SkV9g6jYe1aWHabuc7ufeT7EpS6ha7YROQkImP3N3R8giMjW0ucoO9Fsqy125rKO5AJD4LyIYx+
 ssyt7ghxVNXVUWL6Uq+XUW1VN3WopXCzLDCQrTWBGrTDq6olMBqgQ1FFdU63sTMmT
X-Received: by 2002:ac8:7ed9:: with SMTP id x25mr5391221qtj.202.1627068897655; 
 Fri, 23 Jul 2021 12:34:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7uOpMFIgPmsLxTiFcubEW0MZm704OjA8gxpe4J0a2XHJDZ9pgaL7+fa9y7WJXni0JZgikxw==
X-Received: by 2002:ac8:7ed9:: with SMTP id x25mr5391201qtj.202.1627068897386; 
 Fri, 23 Jul 2021 12:34:57 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id o2sm12659104qkm.109.2021.07.23.12.34.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 12:34:56 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/9] cpus: Use qemu_cond_wait_iothread() where proper
Date: Fri, 23 Jul 2021 15:34:40 -0400
Message-Id: <20210723193444.133412-6-peterx@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210723193444.133412-1-peterx@redhat.com>
References: <20210723193444.133412-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 peterx@redhat.com, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The helper is introduced but we've still got plenty of places that are directly
referencing the qemu_global_mutex itself.  Spread the usage.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 softmmu/cpus.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index 52adc98d39..94c2804192 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -442,7 +442,7 @@ void qemu_wait_io_event(CPUState *cpu)
             slept = true;
             qemu_plugin_vcpu_idle_cb(cpu);
         }
-        qemu_cond_wait(cpu->halt_cond, &qemu_global_mutex);
+        qemu_cond_wait_iothread(cpu->halt_cond);
     }
     if (slept) {
         qemu_plugin_vcpu_resume_cb(cpu);
@@ -585,7 +585,7 @@ void pause_all_vcpus(void)
     replay_mutex_unlock();
 
     while (!all_vcpus_paused()) {
-        qemu_cond_wait(&qemu_pause_cond, &qemu_global_mutex);
+        qemu_cond_wait_iothread(&qemu_pause_cond);
         CPU_FOREACH(cpu) {
             qemu_cpu_kick(cpu);
         }
@@ -656,7 +656,7 @@ void qemu_init_vcpu(CPUState *cpu)
     cpus_accel->create_vcpu_thread(cpu);
 
     while (!cpu->created) {
-        qemu_cond_wait(&qemu_cpu_cond, &qemu_global_mutex);
+        qemu_cond_wait_iothread(&qemu_cpu_cond);
     }
 }
 
-- 
2.31.1


