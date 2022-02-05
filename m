Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCE34AA57E
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Feb 2022 02:58:46 +0100 (CET)
Received: from localhost ([::1]:34762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGALd-0002Hp-B8
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 20:58:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGA6F-0003fa-Sr
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 20:42:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGA6D-0003Hw-I3
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 20:42:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644025368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=djZWuMgvZEcanxSuVKi0jq5sfyl2x4cIrvJR3neBz+A=;
 b=TXWBZCj1e3Yhb2tpAds6eetsuZKbZGnJ1pTISh5VF2r7dVbx7UEN7kEG/4ZAE5qYSt+zvx
 PGF4be0nvIZnp9JnKj+GISpq9mD8m+Vvxdqey/PYNLH74IJ9F1yPiAkM01kPGKess8/AVh
 y+wpX7/cF0qYqheeaH4hNuHnOZ3x+0c=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-93-DSbc9QglMLu7WN21s-97ig-1; Fri, 04 Feb 2022 20:42:46 -0500
X-MC-Unique: DSbc9QglMLu7WN21s-97ig-1
Received: by mail-wr1-f72.google.com with SMTP id
 e1-20020adfa741000000b001e2e74c3d4eso1139406wrd.12
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 17:42:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=djZWuMgvZEcanxSuVKi0jq5sfyl2x4cIrvJR3neBz+A=;
 b=cI/hNGuVKFM1uVthvlCe6cq0y1rjCREnZ8WbnfX1wZIjRj79E4TnS9nGp9cCXm0Eam
 r/qFD0FAmqgjQqX/c+LsjV6dPfLj0yzqX0myCbTNsLaay8VfbMJOfKsQNliaqsTOA6wX
 LSroE5pJp1/stQlAoeX6y3M83kSxUaeEQYS/0b4eKoJX3yu01AMZ6rUFwMhSrFWRW2tm
 zj9ffn12SGqzZcnYVu4ykCQ8F+VmmDjUmHSKDTWw+50Me1Bjk3yNz9iV+j4iKdbheI8b
 uMl9gDZl92wAm2jc1M3Z/5xHkDqtNEmXaZ8vVXSKmk51F2KJ5FNILVaFrSPpxGXNh773
 XUsw==
X-Gm-Message-State: AOAM5321u4x+NLUax6bW4aFseyBHgTbTYSeivdyzcb6hNnoS8pgXpoWg
 uw6POBnRa6iwmNiKTjQ2JbX48A5UPWjy5mob+b9nhoVTmmjEUiXdwXSPVzuLcL9QkRzxkpR8BLf
 Jd+ERrHWhJnNyJDb9vSw/U3ejjOrmwQI1I15cT65CKOiIOINiC9baWemUy97u
X-Received: by 2002:a5d:598c:: with SMTP id n12mr1269322wri.86.1644025364764; 
 Fri, 04 Feb 2022 17:42:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwqv/E4l8LDu0uEG6CIckhX6qhjO40D/IECUQmApAnjgV/fiiwZFkPB/+880XYkolsslQ0Fcg==
X-Received: by 2002:a5d:598c:: with SMTP id n12mr1269304wri.86.1644025364551; 
 Fri, 04 Feb 2022 17:42:44 -0800 (PST)
Received: from redhat.com ([2a10:8005:331d:0:5c51:c095:613e:277c])
 by smtp.gmail.com with ESMTPSA id r12sm3519304wrw.73.2022.02.04.17.42.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 17:42:44 -0800 (PST)
Date: Fri, 4 Feb 2022 20:42:42 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/32] hw/i386: Add the possibility to disable the 'isapc'
 machine
Message-ID: <20220205014149.1189026-3-mst@redhat.com>
References: <20220205014149.1189026-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220205014149.1189026-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.092,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

We already have a CONFIG_ISAPC switch - but we're not using it yet.
Add some "#ifdefs" to make it possible to disable this machine now.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20220107160713.235918-1-thuth@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/pc_piix.c        | 5 ++++-
 tests/qtest/cdrom-test.c | 2 +-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 7c7790a5ce..d9b344248d 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -357,10 +357,12 @@ static void pc_compat_1_4_fn(MachineState *machine)
     pc_compat_1_5_fn(machine);
 }
 
+#ifdef CONFIG_ISAPC
 static void pc_init_isa(MachineState *machine)
 {
     pc_init1(machine, TYPE_I440FX_PCI_HOST_BRIDGE, TYPE_I440FX_PCI_DEVICE);
 }
+#endif
 
 #ifdef CONFIG_XEN
 static void pc_xen_hvm_init_pci(MachineState *machine)
@@ -916,6 +918,7 @@ void igd_passthrough_isa_bridge_create(PCIBus *bus, uint16_t gpu_dev_id)
     pci_config_set_revision(bridge_dev->config, pch_rev_id);
 }
 
+#ifdef CONFIG_ISAPC
 static void isapc_machine_options(MachineClass *m)
 {
     PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
@@ -935,7 +938,7 @@ static void isapc_machine_options(MachineClass *m)
 
 DEFINE_PC_MACHINE(isapc, "isapc", pc_init_isa,
                   isapc_machine_options);
-
+#endif
 
 #ifdef CONFIG_XEN
 static void xenfv_4_2_machine_options(MachineClass *m)
diff --git a/tests/qtest/cdrom-test.c b/tests/qtest/cdrom-test.c
index cfca24fa94..fdd889a487 100644
--- a/tests/qtest/cdrom-test.c
+++ b/tests/qtest/cdrom-test.c
@@ -138,7 +138,7 @@ static void add_x86_tests(void)
      * Unstable CI test under load
      * See https://lists.gnu.org/archive/html/qemu-devel/2019-02/msg05509.html
      */
-    if (g_test_slow()) {
+    if (g_test_slow() && qtest_has_machine("isapc")) {
         qtest_add_data_func("cdrom/boot/isapc", "-M isapc "
                             "-drive if=ide,media=cdrom,file=", test_cdboot);
     }
-- 
MST


