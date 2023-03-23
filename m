Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C116C6962
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 14:22:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfKs9-0004N9-GW; Thu, 23 Mar 2023 09:20:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhoujiajing.vergil@bytedance.com>)
 id 1pfKs7-0004MV-0M
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 09:20:51 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zhoujiajing.vergil@bytedance.com>)
 id 1pfKs3-0004cs-7u
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 09:20:50 -0400
Received: by mail-pl1-x632.google.com with SMTP id k2so22259455pll.8
 for <qemu-devel@nongnu.org>; Thu, 23 Mar 2023 06:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1679577642;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GHuaFRXDPzNTxPM/DIKIJwNdV8kTeODSJ/C2RRZchJw=;
 b=bKxb4Xai2NT+lw7HOqcWOqKFy88n+v8zXU7LkGrLgsoIY7OrUyTcYGLfHwy3DV1Evy
 O55Dt7FLkzLgJYn4H6dLnsehs4H8E9mkCjt53cEItVQPYlI2voMGm251e/rrlBqPVuvI
 jK9VAf3n51z9IoKQAS6sdrh3KdvPf9KPJfWMUo9F9ftfKMVbWiT6/ICyg89g9ytMaGkj
 EUWMlWcZlCd1fSfLwIsrtmeFzN/2AfXuP1aIUHWXbePnJqFzbQZSgOIfeo05eLefzG8i
 R+3Gx4U13pToBCrSxukImM0yPaGxqVKKr1+naYbHWqSjQkymD3GFt+pEQSucz9Ve8oNP
 5Q/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679577642;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GHuaFRXDPzNTxPM/DIKIJwNdV8kTeODSJ/C2RRZchJw=;
 b=hneaQdCH4Qyfjwnbb4D0AxpkIm96jOaPPRWpxJ/4q9BMxekYe+7tJM6Hhb4Xk+cvPS
 VA+y5KXKEAZPLKs9hhFq2ePiywZe5PPdvb+NscCCXMxPVtjkAUVuyfzRqdEbFJB7D+oi
 5L2yc4Tx4lS2h7m+bCn99rfp+lIeOBqGyyU8+GR3DML/q431LOWhLl7YBwp8FM7yspkr
 mG+dtbE3OJMdXV3dlhOpJBH8H7YK3AOnuonmO+K/UKAVbeHkmiFLPx/pSA8bSNG6e+LC
 mg5qyDJsVeScYxO6qxoSObeuOcBNZiIa/I3FXRIoE2yTLaQhwjA4n9+uj5ZM1nQyTXUs
 rSvA==
X-Gm-Message-State: AO0yUKVTr4sIoqRPCg3nIA1ucSJGeGC3dI99av4DalG5xTmzIZ1AnNvo
 2ha/D2HxeJkFJLCw1Sai/4K03kCHWvpsmn5MHkSqHQ==
X-Google-Smtp-Source: AK7set8fiiq52kWNA7+Wc3wX1nQrgZ9OG3mhY/22VjjP1Y79ke29rZEOHvQl9yx+gt49K98vvJxmow==
X-Received: by 2002:a05:6a20:af2a:b0:dd:9f07:626d with SMTP id
 dr42-20020a056a20af2a00b000dd9f07626dmr1380920pzb.44.1679577642490; 
 Thu, 23 Mar 2023 06:20:42 -0700 (PDT)
Received: from Q71MXRM07K.bytedance.net ([139.177.225.239])
 by smtp.gmail.com with ESMTPSA id
 f14-20020aa78b0e000000b005898fcb7c1bsm12354451pfd.177.2023.03.23.06.20.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Mar 2023 06:20:42 -0700 (PDT)
From: Jiajing Zhou <zhoujiajing.vergil@bytedance.com>
To: qemu-devel <qemu-devel@nongnu.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?=27Philippe=20Mathieu-Daud=C3=A9=27?= <philmd@linaro.org>,
 "'Dr . David Alan Gilbert'" <dgilbert@redhat.com>,
 "zhoujiajing.vergil" <zhoujiajing.vergil@bytedance.com>
Subject: [PATCH 1/1] accel/kvm/kvm-all: fix vm crash when set dirty ring and
 memorybacking
Date: Thu, 23 Mar 2023 21:19:15 +0800
Message-Id: <20230323131914.35583-1-zhoujiajing.vergil@bytedance.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=zhoujiajing.vergil@bytedance.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From: "zhoujiajing.vergil" <zhoujiajing.vergil@bytedance.com>

It is possible enter this function when the cpu not finished creating but
is already in the cpu list. The value of dirty_gfns is null, causing vm
crash here.

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

The call stack is as follows:
  kvm_dirty_ring_reaper_thread
    -> kvm_dirty_ring_reap
       ->kvm_dirty_ring_reap_locked
         ->kvm_dirty_ring_reap_one


Signed-off-by: zhoujiajing.vergil <zhoujiajing.vergil@bytedance.com>
---
 accel/kvm/kvm-all.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index f2a6ea6a68..698a59162a 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -685,6 +685,11 @@ static uint32_t kvm_dirty_ring_reap_one(KVMState *s, CPUState *cpu)
     uint32_t ring_size = s->kvm_dirty_ring_size;
     uint32_t count = 0, fetch = cpu->kvm_fetch_index;
 
+    /* return 0 when cpu not finished creating */
+    if (!cpu->created) {
+        return 0;
+    }
+
     assert(dirty_gfns && ring_size);
     trace_kvm_dirty_ring_reap_vcpu(cpu->cpu_index);
 
-- 
2.40.0


