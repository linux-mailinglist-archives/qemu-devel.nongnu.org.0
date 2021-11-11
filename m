Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1C244D298
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 08:42:59 +0100 (CET)
Received: from localhost ([::1]:59204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml4jb-0002p4-44
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 02:42:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ml4d5-0003f5-Fd
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 02:36:16 -0500
Received: from [2a00:1450:4864:20::52b] (port=44943
 helo=mail-ed1-x52b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ml4d3-00079K-96
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 02:36:15 -0500
Received: by mail-ed1-x52b.google.com with SMTP id j21so20421738edt.11
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 23:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j/DgBRVtXg3n5HEpQplwCbP73DDyCNVr2PK8DT2sJzk=;
 b=YMCMUcaxWyAWaY39CCybxSOyzfbAydI/lefgb+UViJlfUH4ql64RAJlo6K+QxDZOKX
 feOK5tYp5cb2HRVMo+RZMTaXVR7MfOpc2diqDRUp0ZV4UPOWhk7OJekU5VvMql0/u7hW
 qyOyKNOfJ+5Z1no/98FwNCXyQtlZek6sDeai5eo7TO8pq+Y+O1a2f0EndO53mWIpDY/u
 4XB9dPloO73qF90B/ZSoRpuW0ZDOECDcwijmsOulvQNmoXIsXr+Iai+K9sFXcb6iAWQ0
 B7ANmfFOVoOaV4875fbOLi2Y6oIxU0attXJsGBCSbC/A1slF34mYwMZJhI1exCBuDEfJ
 T9QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=j/DgBRVtXg3n5HEpQplwCbP73DDyCNVr2PK8DT2sJzk=;
 b=INGYGFTKcRbrNehedpmDFlmCNpL7/zS5FhCR5g/2bkPkrgnJvzslSoMa9uJvmYrcGm
 V7vyOsT8ieY68hHKSp3qQNUgiZrHkCImX7DmgPei+OPEkLK+StVn2sl2tQdt07W5ZO5F
 Ajf1qcblFQIgToWoz75HhKAycpTbOk33vjFIDmaAKf4hTOZZhzs43I7a5Y8whbL0l8K3
 u5ANpFT8v1HjRa7nC9tMrrK/uxvDxJtPr1Ri6OnWOhWkwne/ISBoDV7T2c1bTiNCug8D
 jp5840Rlr1AiD9Igf4MtyaTjiJQGOFUDOkpmo3n5tSKcyzaavEep3stb44HsmXfkrYZL
 KeYA==
X-Gm-Message-State: AOAM531GfawsKFLmldRn3CaBcAENV8V++SzYY/UFLc4qT3khOYce+r6z
 KIG1p6YzbGCi0Ovvcgs0WQqB+/IMHhk=
X-Google-Smtp-Source: ABdhPJyvVNcAIGb1+EdFiwGzril4qjsF1F0TDuhM3tG2ZdjrJyKiJfP0zUkitBGpCHYNTaQVpeBwkg==
X-Received: by 2002:a50:9d48:: with SMTP id j8mr4531847edk.192.1636616171788; 
 Wed, 10 Nov 2021 23:36:11 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id w1sm1062098edd.49.2021.11.10.23.36.11
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 23:36:11 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 4/5] numa: avoid crash with SGX and "info numa"
Date: Thu, 11 Nov 2021 08:36:06 +0100
Message-Id: <20211111073607.195697-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211111073607.195697-1-pbonzini@redhat.com>
References: <20211111073607.195697-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add the MEMORY_DEVICE_INFO_KIND_SGX_EPC case, so that enclave
memory is included in the output of "info numa" instead of crashing
the monitor.

Fixes: a7c565a941 ("sgx-epc: Add the fill_device_info() callback support", 2021-09-30)
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/core/numa.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/core/numa.c b/hw/core/numa.c
index 510d096a88..e6050b2273 100644
--- a/hw/core/numa.c
+++ b/hw/core/numa.c
@@ -756,6 +756,7 @@ static void numa_stat_memory_devices(NumaNodeMem node_mem[])
     PCDIMMDeviceInfo     *pcdimm_info;
     VirtioPMEMDeviceInfo *vpi;
     VirtioMEMDeviceInfo *vmi;
+    SgxEPCDeviceInfo *se;
 
     for (info = info_list; info; info = info->next) {
         MemoryDeviceInfo *value = info->value;
@@ -781,6 +782,12 @@ static void numa_stat_memory_devices(NumaNodeMem node_mem[])
                 node_mem[vmi->node].node_mem += vmi->size;
                 node_mem[vmi->node].node_plugged_mem += vmi->size;
                 break;
+            case MEMORY_DEVICE_INFO_KIND_SGX_EPC:
+                se = value->u.sgx_epc.data;
+                /* TODO: once we support numa, assign to right node */
+                node_mem[0].node_mem += se->size;
+                node_mem[0].node_plugged_mem += se->size;
+                break;
             default:
                 g_assert_not_reached();
             }
-- 
2.33.1



