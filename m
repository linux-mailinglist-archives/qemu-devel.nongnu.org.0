Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D589476357
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 21:31:35 +0100 (CET)
Received: from localhost ([::1]:41354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxaw2-0004tw-A8
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 15:31:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mxaq7-0003vN-On
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 15:25:28 -0500
Received: from [2a00:1450:4864:20::32d] (port=56044
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mxaq5-0004Gy-Vd
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 15:25:27 -0500
Received: by mail-wm1-x32d.google.com with SMTP id p18so17466500wmq.5
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 12:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HIBRkSSHz3eAVQoo1k/hPPyUZpwaJoco5cdah1TL9hU=;
 b=GSyVwY/6XnA3oEG01u5HpiZMe7rZeKkXwO4mOlykz5rOKEqlYQL/qY6JR4SOv+owdD
 3sO+2eM9tS80I9pkwgSM+gh5uEX+UeQMjp9q20jx5g+F2PEO/ux4JycoLdje/Rt1xtJS
 AYyPH7OeCnuDbmvWula8P6gERxyQrrvHJwg8z0bqBAUq9Cg8cVO8vQojZtWLy5sd3Bao
 5PjgBtZMR5AHxWnI/qbLadWEdN0nUWU7xTBedZ6qvOO9RbvUOMJWg9lY0unw87e62aJl
 HfE+5GJSQA+Av9JtSe3LonLh8AXd4sBjyoRQOGOMgaqUd9jTR/YNcNZ7SwNaNToQJCwQ
 KYvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=HIBRkSSHz3eAVQoo1k/hPPyUZpwaJoco5cdah1TL9hU=;
 b=t/Ap5Yf/T9g5P+3KfKEHpZi5Ave/Oz5fyPsDF86fXyFd3KpO1xR/fSBYFmGIYP79qk
 VZKjDklDCR0LOqvl9HW1WacXvsK99TTErgBjYeh/Jao+MgvR0G+OeOYM0BI6FK/inFVI
 R91kXbPbBOCEyz0vemoi9aP6/nauHk0wzwujoFv8Mfm0cYnE+/DygfmgBrXIg0qH7e6Y
 e0uxldCq4BC9wCU5Dr2do4C4S/s3Uj8ZHAErMTE00cRC0+6jDNt75Xz2uGmHraJT7/wI
 DRFL3va8L3g3R5orvnFX9y41/78PJVF4vHDIz+S4N6LG24onvYlXnkFj+NDoLW5/zVLk
 xA6A==
X-Gm-Message-State: AOAM532nh8ua4dRFHmG562LCshN8l3aAsOQZpRXuvLzVBo4/Kf0sNUlo
 XC+09oCOshMgvfZ71KtmTl2QDzi1658=
X-Google-Smtp-Source: ABdhPJy1+G1yd/cTvPbzwEtUI7LKI49AJjbKPnNOUHw3uYyRSPh0HydleBAZSDVV+3/IZF5noTxcTg==
X-Received: by 2002:a1c:ed07:: with SMTP id l7mr1864944wmh.12.1639599924701;
 Wed, 15 Dec 2021 12:25:24 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id y11sm3794708wry.70.2021.12.15.12.25.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 12:25:24 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/13] doc: Add the SGX numa description
Date: Wed, 15 Dec 2021 21:25:14 +0100
Message-Id: <20211215202515.91586-13-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211215202515.91586-1-pbonzini@redhat.com>
References: <20211215202515.91586-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Yang Zhong <yang.zhong@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yang Zhong <yang.zhong@intel.com>

Add the SGX numa reference command and how to check if
SGX numa is support or not with multiple EPC sections.

Signed-off-by: Yang Zhong <yang.zhong@intel.com>
Message-Id: <20211101162009.62161-5-yang.zhong@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/system/i386/sgx.rst | 31 +++++++++++++++++++++++++++----
 1 file changed, 27 insertions(+), 4 deletions(-)

diff --git a/docs/system/i386/sgx.rst b/docs/system/i386/sgx.rst
index f8fade5ac2..0f0a73f758 100644
--- a/docs/system/i386/sgx.rst
+++ b/docs/system/i386/sgx.rst
@@ -141,8 +141,7 @@ To launch a SGX guest:
   |qemu_system_x86| \\
    -cpu host,+sgx-provisionkey \\
    -object memory-backend-epc,id=mem1,size=64M,prealloc=on \\
-   -object memory-backend-epc,id=mem2,size=28M \\
-   -M sgx-epc.0.memdev=mem1,sgx-epc.1.memdev=mem2
+   -M sgx-epc.0.memdev=mem1,sgx-epc.0.node=0
 
 Utilizing SGX in the guest requires a kernel/OS with SGX support.
 The support can be determined in guest by::
@@ -152,8 +151,32 @@ The support can be determined in guest by::
 and SGX epc info by::
 
   $ dmesg | grep sgx
-  [    1.242142] sgx: EPC section 0x180000000-0x181bfffff
-  [    1.242319] sgx: EPC section 0x181c00000-0x1837fffff
+  [    0.182807] sgx: EPC section 0x140000000-0x143ffffff
+  [    0.183695] sgx: [Firmware Bug]: Unable to map EPC section to online node. Fallback to the NUMA node 0.
+
+To launch a SGX numa guest:
+
+.. parsed-literal::
+
+  |qemu_system_x86| \\
+   -cpu host,+sgx-provisionkey \\
+   -object memory-backend-ram,size=2G,host-nodes=0,policy=bind,id=node0 \\
+   -object memory-backend-epc,id=mem0,size=64M,prealloc=on,host-nodes=0,policy=bind \\
+   -numa node,nodeid=0,cpus=0-1,memdev=node0 \\
+   -object memory-backend-ram,size=2G,host-nodes=1,policy=bind,id=node1 \\
+   -object memory-backend-epc,id=mem1,size=28M,prealloc=on,host-nodes=1,policy=bind \\
+   -numa node,nodeid=1,cpus=2-3,memdev=node1 \\
+   -M sgx-epc.0.memdev=mem0,sgx-epc.0.node=0,sgx-epc.1.memdev=mem1,sgx-epc.1.node=1
+
+and SGX epc numa info by::
+
+  $ dmesg | grep sgx
+  [    0.369937] sgx: EPC section 0x180000000-0x183ffffff
+  [    0.370259] sgx: EPC section 0x184000000-0x185bfffff
+
+  $ dmesg | grep SRAT
+  [    0.009981] ACPI: SRAT: Node 0 PXM 0 [mem 0x180000000-0x183ffffff]
+  [    0.009982] ACPI: SRAT: Node 1 PXM 1 [mem 0x184000000-0x185bfffff]
 
 References
 ----------
-- 
2.33.1



