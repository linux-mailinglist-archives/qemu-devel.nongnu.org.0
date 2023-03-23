Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D896C691D
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 14:07:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfKeS-0008DT-R2; Thu, 23 Mar 2023 09:06:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhoujiajing.vergil@bytedance.com>)
 id 1pfFMs-00084z-4J
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 03:28:14 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zhoujiajing.vergil@bytedance.com>)
 id 1pfFMp-0003hL-Md
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 03:28:13 -0400
Received: by mail-pf1-x42a.google.com with SMTP id u38so7799799pfg.10
 for <qemu-devel@nongnu.org>; Thu, 23 Mar 2023 00:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1679556484;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=svH28t8Ox5OOt8nKXFv7TaWdRHJexptKA+84NioOspQ=;
 b=Vq6YwHWs7qn7pG/FgLB4fBooXdz4hlZs6KJihAxz0s80Ny0zANe9Y4LSnAGOSsmH66
 n9vsQLm20Cqp+UJB3N3IKmuA1/eMEUh1MOR4k9gnNv4WR+K9NsD5V1HERSdTAQKcgAXG
 hTcRO+dWfnnFvYuu8iyG6p5goWPVTT53dw6hwcCUgJ48qzc/y+lImvjlHYJYGgUp+7/Y
 EsphZR8fug1HWt9A22AqRUh82TigwLezu6jnE/whSjiF6LZdsf2cQT07xqJzcKc89Dq+
 ZG2CWnDi6c2D90KKQRMWn1JryJgXdF4P4Xzxquus8JCUuJz5noD5jD+7so5zoYhDtK0+
 x3wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679556484;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=svH28t8Ox5OOt8nKXFv7TaWdRHJexptKA+84NioOspQ=;
 b=ax6b9rS5p7YRYamkBsW7U4An0e4ad6i7O75tqLHyyb1cRfC+HccIYMTkAl6HcrtRBT
 epoGyEzflyquZrehyffg/doZ7C5YRfcirqUnS2FKS96FAS2LRMwOOKwk7UmYeZVvBTzj
 LoCV01bNlIhJeiTY7sghWY0gpVwkqrlTCfMNse13zBR4ZacfLimunZ/++XRF5PSvsltw
 aINgSkEXx5dNUf4UO35GTt4RnupxVmbDfGH2l7jR1UeQ8qF+gZV9pCNtv94Drb1IMd4H
 fl8YCIP4x2MoAeAvFFXKwpT5mlb/X0mx1X2jBa/ctEzLKhb4DyZUa6bstHkVFKBuEpYS
 ZKsA==
X-Gm-Message-State: AO0yUKXniTfOkLnztXGycmNZfXTfs0we8XVgmQk68idznFRQKa+FoOE2
 p2p0nvCxN6SykWTiH92JuRor30A+QNMscoEfHxLtIg==
X-Google-Smtp-Source: AK7set/Kf1IFdnZgPgx2IayaCXqxSgTbbVlXZ8gu33uiJQHda76aQkIKr1P4xjWhCqFxPDj/pQGkBA==
X-Received: by 2002:a62:644d:0:b0:628:a71:77a0 with SMTP id
 y74-20020a62644d000000b006280a7177a0mr5604742pfb.7.1679556484542; 
 Thu, 23 Mar 2023 00:28:04 -0700 (PDT)
Received: from Q71MXRM07K.bytedance.net ([139.177.225.255])
 by smtp.gmail.com with ESMTPSA id
 13-20020aa7920d000000b005e032bb1c34sm7312040pfo.24.2023.03.23.00.28.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Mar 2023 00:28:04 -0700 (PDT)
From: Jiajing Zhou <zhoujiajing.vergil@bytedance.com>
To: qemu-devel@nongnu.org
Cc: peterx@redhat.com, dgilbert@redhat.com, pbonzini@redhat.com,
 philmd@linaro.org, armbru@redhat.com,
 "zhoujiajing.vergil" <zhoujiajing.vergil@bytedance.com>
Subject: [RFC] accel/kvm/kvm-all: fix vm crash when set dirty ring and
 memorybacking
Date: Thu, 23 Mar 2023 15:27:39 +0800
Message-Id: <20230323072738.14164-1-zhoujiajing.vergil@bytedance.com>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=zhoujiajing.vergil@bytedance.com; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 23 Mar 2023 09:06:37 -0400
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

From: "zhoujiajing.vergil" <zhoujiajing.vergil@bytedance.com>

It is possible enter this function when the cpu not finished creating but
is already in the cpu list. The value of dirty_gfns is null, causing vm
crash here.

The call stack is as follows:
  kvm_dirty_ring_reaper_thread
    -> kvm_dirty_ring_reap
       ->kvm_dirty_ring_reap_locked
         ->kvm_dirty_ring_reap_one


When both dirty-ring and memorybacking are set, creating a vm will assert 
on kvm_dirty_ring_reap_one. Part of the xml as follows:


<domain type='kvm' id='9'>
  ...
  <memoryBacking>
    <hugepages>
      <page size='2048' unit='KiB' memAccess='shared'/>
    </hugepages>
  </memoryBacking>
  ...
  <features>
    <acpi/>
    <kvm>
      <dirty-ring state='on' size='4096'/>
    </kvm>
  </features>
  ...
<domain/>

The kvm-reaper thread was created before vcpu thread, and the value of 
cpu->kvm_dirty_gfns is assigned at cpu thread. In the x86_cpu_realizefn 
function, the cpu is inserted into the cpu list first, and then the cpu 
thread is created for initialization. The entry functions are 
cpu_exec_realizefn and qemu_init_vcpu. In the existing logic, the 
kvm-reaper thread traverses the cpu list every second and finally call 
kvm_dirty_ring_reap_one for each cpu in the list. If cpu has been inserted 
into cpu list but has not been initialized so that the value of dirty_gfns 
is null, kvm-reaper thread call kvm_dirty_ring_reap_one will cause vm crash.    


Signed-off-by: zhoujiajing.vergil <zhoujiajing.vergil@bytedance.com>
---
 accel/kvm/kvm-all.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index f2a6ea6a68..ecd873fe73 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -685,6 +685,10 @@ static uint32_t kvm_dirty_ring_reap_one(KVMState *s, CPUState *cpu)
     uint32_t ring_size = s->kvm_dirty_ring_size;
     uint32_t count = 0, fetch = cpu->kvm_fetch_index;
 
+    /* return 0 when cpu not finished creating */
+    if(!cpu->created)
+	return 0;
+
     assert(dirty_gfns && ring_size);
     trace_kvm_dirty_ring_reap_vcpu(cpu->cpu_index);
 
-- 
2.20.1


