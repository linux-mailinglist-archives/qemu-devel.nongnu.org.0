Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B5242008A
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 09:52:53 +0200 (CEST)
Received: from localhost ([::1]:43406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWwIm-0000rW-8l
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 03:52:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mWw9J-0003Vz-EL
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 03:43:05 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:34445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mWw9H-0000rr-OF
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 03:43:05 -0400
Received: by mail-ed1-x52e.google.com with SMTP id g7so50879123edv.1
 for <qemu-devel@nongnu.org>; Sun, 03 Oct 2021 00:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d5KVo7fwa78aJLS92JAbYmvR8UXHXfLItQt4hY4PWJw=;
 b=ZisFnKaPxRh1/aOL7viemcY1TfOqEbf90l2c8sM+nwL6lxx5fCu7MhG7Ya9FTLXvlP
 8Z6USkuy5eICP+Mlhq7NyCd3gooQTlxZcvRrJPzIW66rGcj0cLcYPDZJ/SMD8RoBx3o9
 nkyI/XzetWx/WmleNBjC8c3wRMvBFfr3Bh3gKLKwfCT3xXRYTrsAfXjTQ8avWE0Hyb/t
 DkgRm3pVOVLI7O2YCkvMNIzsUUrgwLzblQODWTjlzhMrxQqoK62SwJHD9xYa7A605Nuz
 Ze7J4kx/8SS90bSMXFnvaE/Aiyvf+3by/5kksSX7oeZLWh49neaFZDLC8zwn9SzncmsS
 sp/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=d5KVo7fwa78aJLS92JAbYmvR8UXHXfLItQt4hY4PWJw=;
 b=FiydVdZUupYA1e+AHHM6yWfcYaqz4WN7ydiN4HdSPPMaenrMiOfP8VNQpFzMWN6Fcj
 Lesg88bye7YZWKQn40TJLTJ7mdyzX1xcu89+i5Vt+DH2e/CpoH2i2bojwaQQ15nH/s6j
 fLgSV3gwYdEoLxGQCH818BaUl4HifMMDVc1jEe2CAhETeRbe+ROtL6VDtTEt7UboSxkX
 z+mu2SvuAd5Ty9wYRR/FVVYq8VvxeY9XcPPEyVlwW6wXupPGFC0YVElALLqFaYyyYKm5
 N6cGT/IzfBS2MX3dW0JyOFiGKL6+07en7JA7tvpm6yo/ojgygmWxk8aMX1fvmxaRP9ih
 WX9w==
X-Gm-Message-State: AOAM532wp/Z8MosRhKW5ZIUmm4O7gZb0QPFdVkZlnpN3tdJS1O4ofgG0
 U2TPvAHQWVPOD3yzDZPTlMw47C827tg=
X-Google-Smtp-Source: ABdhPJwp6l285xOoKFs/x2Z16s8ChLNabXqLqbZgO7gJuj38F9NU48Hsog5QgvbzlbG/9hyqukcwJA==
X-Received: by 2002:a17:906:3ce2:: with SMTP id
 d2mr9273306ejh.410.1633246982420; 
 Sun, 03 Oct 2021 00:43:02 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n6sm5560856eds.10.2021.10.03.00.43.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Oct 2021 00:43:02 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/30] machine: Remove smp_parse callback from MachineClass
Date: Sun,  3 Oct 2021 09:42:33 +0200
Message-Id: <20211003074250.60869-14-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211003074250.60869-1-pbonzini@redhat.com>
References: <20211003074250.60869-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Yanan Wang <wangyanan55@huawei.com>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yanan Wang <wangyanan55@huawei.com>

Now we have a generic smp parser for all arches, and there will
not be any other arch specific ones, so let's remove the callback
from MachineClass and call the parser directly.

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20210929025816.21076-14-wangyanan55@huawei.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/core/machine.c   | 3 +--
 include/hw/boards.h | 5 -----
 2 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 12872d7715..8b0f1aed83 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -918,7 +918,7 @@ static void machine_set_smp(Object *obj, Visitor *v, const char *name,
                     "CPU topology parameters must be greater than zero");
     }
 
-    mc->smp_parse(ms, config, errp);
+    smp_parse(ms, config, errp);
     if (*errp) {
         goto out_free;
     }
@@ -947,7 +947,6 @@ static void machine_class_init(ObjectClass *oc, void *data)
     /* Default 128 MB as guest ram size */
     mc->default_ram_size = 128 * MiB;
     mc->rom_file_has_mr = true;
-    mc->smp_parse = smp_parse;
 
     /* numa node memory size aligned on 8MB by default.
      * On Linux, each node's border has to be 8MB aligned
diff --git a/include/hw/boards.h b/include/hw/boards.h
index 72a23e4e0f..fa284e01e9 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -177,10 +177,6 @@ typedef struct {
  *    kvm-type may be NULL if it is not needed.
  * @numa_mem_supported:
  *    true if '--numa node.mem' option is supported and false otherwise
- * @smp_parse:
- *    The function pointer to hook different machine specific functions for
- *    parsing "smp-opts" from QemuOpts to MachineState::CpuTopology and more
- *    machine specific topology fields, such as smp_dies for PCMachine.
  * @hotplug_allowed:
  *    If the hook is provided, then it'll be called for each device
  *    hotplug to check whether the device hotplug is allowed.  Return
@@ -217,7 +213,6 @@ struct MachineClass {
     void (*reset)(MachineState *state);
     void (*wakeup)(MachineState *state);
     int (*kvm_type)(MachineState *machine, const char *arg);
-    void (*smp_parse)(MachineState *ms, SMPConfiguration *config, Error **errp);
 
     BlockInterfaceType block_default_type;
     int units_per_default_bus;
-- 
2.31.1



