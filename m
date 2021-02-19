Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BE031FE6E
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 18:57:57 +0100 (CET)
Received: from localhost ([::1]:49012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDA2O-00052q-O8
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 12:57:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lD9kv-0003C3-Mx
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 12:39:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lD9kt-0005ji-TA
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 12:39:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613756391;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=23DXGFBg27YE0s/hCFn43oTEX31jOtnU+ISUArv5+bE=;
 b=EKjm6U6bY70wuhb3vqQGR0Dvq4DkQm+EDbhBjkhqCZglaKi2kBY4U0AWXtIJSVUuX/58Yn
 RQgzII0JbRNuCnwWXWwtBHEN+Ws0ecKeDdCLOQgu5FUVD7Xck0TGAroIx+0v6u28C2D/JD
 eI07p4PyhgiGh74tN4QNTrtPlgrCQ0k=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-sw-QugbvOCiLU9DgZJM50Q-1; Fri, 19 Feb 2021 12:39:49 -0500
X-MC-Unique: sw-QugbvOCiLU9DgZJM50Q-1
Received: by mail-wr1-f71.google.com with SMTP id l3so1135889wrx.15
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 09:39:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=23DXGFBg27YE0s/hCFn43oTEX31jOtnU+ISUArv5+bE=;
 b=ma/ZmOhfZNCOfB2GTbuPw0WhxsDp73SsTorjfLlhQ4SqvtyO1To26MgBRJn8IAv72l
 yzm1/S+/fHuhiezK2T4yNIcV1ytfFgS43+YCdLV+ozfSwOJDghHDQlxeja3H/kJNAcLg
 AKbLUSszX9ZDdbO24VHWziN/5Y2UHT66zda9QoSApJJCmniLQjEpNElgNbKOPGT90iqe
 DsMBhdBxsERQQAflMy5K3t6kmR3DOBugYEDKiWMwebnQGY8YQB1wVfDMML3AYCrEJOtY
 DTuqAIxe7LInHUiaRsWX+O399c4wwjQns2eeV3gPW7eeBAO7cPoESkb4J77KZym6WMd+
 ECAg==
X-Gm-Message-State: AOAM533NH6dsXrvMeK1ueF/qQ5lW/WUjXGfm1wXmYGVALbq9gEUR3lPG
 fLfBxWlA86ar3TIS+C7T8o3gT0uZXV4FBI8kFmZnh6hKPwMcRMkuaTB6f0R8r/vB0AVbL03cBeA
 LdeERuqQTw3KnlZDu4+2H16Bj2X3A+CID0zVHetTxkeAdv+wWBKS2RJj3uyB1n5Xq
X-Received: by 2002:a7b:c095:: with SMTP id r21mr3049575wmh.48.1613756387978; 
 Fri, 19 Feb 2021 09:39:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxiAWfgHRpHyAW3kKe8U38bgrZikJVMduVGw3sP0TrSilsr1/3Kg29a0ZDcfjt7MheizWAw2g==
X-Received: by 2002:a7b:c095:: with SMTP id r21mr3049522wmh.48.1613756387730; 
 Fri, 19 Feb 2021 09:39:47 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id v9sm9098392wrn.86.2021.02.19.09.39.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 09:39:47 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/11] hw/board: Only allow TCG accelerator by default
Date: Fri, 19 Feb 2021 18:38:46 +0100
Message-Id: <20210219173847.2054123-11-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210219173847.2054123-1-philmd@redhat.com>
References: <20210219173847.2054123-1-philmd@redhat.com>
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>, kvm@vger.kernel.org,
 Paul Durrant <paul@xen.org>, David Hildenbrand <david@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Leif Lindholm <leif@nuviainc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Radoslaw Biernacki <rad@semihalf.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

By default machines can only use the TCG and QTest accelerators.

If a machine can use another accelerator, it has to explicitly
list it in its MachineClass valid_accelerators[].

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/boards.h | 4 ++--
 hw/core/machine.c   | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index 4d08bc12093..b93d290b348 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -146,8 +146,8 @@ typedef struct {
  * @valid_accelerators:
  *    If this machine supports a specific set of virtualization accelerators,
  *    this contains a NULL-terminated list of the accelerators that can be
- *    used. If this field is not set, any accelerator is valid. The QTest
- *    accelerator is always valid.
+ *    used. If this field is not set, a default list containing only the TCG
+ *    accelerator is used. The QTest accelerator is always valid.
  * @kvm_type:
  *    Return the type of KVM corresponding to the kvm-type string option or
  *    computed based on other criteria such as the host kernel capabilities
diff --git a/hw/core/machine.c b/hw/core/machine.c
index c42d8e382b1..ca7c9ee2a0c 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -520,11 +520,11 @@ static void machine_set_nvdimm_persistence(Object *obj, const char *value,
 
 bool machine_class_valid_for_accelerator(MachineClass *mc, const char *acc_name)
 {
-    const char *const *name = mc->valid_accelerators;
+    static const char *const default_accels[] = {
+        "tcg", NULL
+    };
+    const char *const *name = mc->valid_accelerators ? : default_accels;
 
-    if (!name) {
-        return true;
-    }
     if (strcmp(acc_name, "qtest") == 0) {
         return true;
     }
-- 
2.26.2


