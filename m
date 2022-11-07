Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC85F61F482
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 14:40:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1os2Lo-0004oE-Et; Mon, 07 Nov 2022 08:39:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1os2Lm-0004nw-2A
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 08:39:42 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1os2Lk-00068K-D2
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 08:39:41 -0500
Received: by mail-pl1-x631.google.com with SMTP id d20so10017826plr.10
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 05:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZUQwD6j+JGi6SjXn5T8pFaR+MHmOjc+TeICPHERrQMM=;
 b=rxmUEJ6ygnPUVw4IcD3ZfkBwGlWpOJWXMpjdT9dgbO59eBLAskb2GdV03308FXSceb
 uJLHcbEQVZn9NKnpOb5zsC4oLEsZEouXSYKWiTKEgjYb/EdWnHHMIXiNBbReKqtTsjqV
 Y8SWk3/juOMlaXcZsgCN7wRj/6lff3lHCKdCXjpD/351hWr7iI8XFpCyCHRVU8eYtkw2
 CjNV5SuwLwCB4uxCiM8RWHQoRD4bqIYTEbfcFDssBNk9YWc75NoDN1kTVEbtGTMBg5Bv
 KQhsL4igmBdkctI5+BtmOiYbDfk+E+zoaMr/AZKgePTHljVpWEW/kbcLbXRvqZX0kphu
 Ettg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZUQwD6j+JGi6SjXn5T8pFaR+MHmOjc+TeICPHERrQMM=;
 b=4J1nMNXGr6O0YTPUrFiENYAqmFmovtC6AREDWf3gJ66C7jvA6YNnFnFNOeeQkZjeXO
 Bgts61CVfCrpLGkcn8/ulJCaHV0Gt5z3lrYE7EXW0NNNh7ORGJqchMqWw0fPPD23qwju
 M2gcC/GFoCSbe+H3DaTeLFM9h8bVne/rx1aRafiv182ChxO2dFDMM6vm+7+4dr73t0RY
 uG1zcT6Av7XuJMupG0bpyHIKT7uWwylzZumjFaOx/QGri7Afw1G24uvsDRXM5wCFJk3T
 XrwPber6ohjcr3tu9zTOyvWJ2ewrQA737KX6GJkcKEO0UiHGtcp/sgsDfoqVy3hRcnUL
 mAIg==
X-Gm-Message-State: ACrzQf0QEEBOSkfw0bjyg3IbQqW9+sIagZQqoAmhahSrzjHJ8ETQZkhx
 Ipx7iC8gi74SzZ+Lob28g3NYZA==
X-Google-Smtp-Source: AMsMyM4p2eD/x9sYeCg/GnC7ptAtlkByDv2blh44Zf870LmBbGPNQ/tvrctHk4XsIbvP8xwlMVMcLA==
X-Received: by 2002:a17:90a:db82:b0:212:d76f:b9e6 with SMTP id
 h2-20020a17090adb8200b00212d76fb9e6mr775920pjv.224.1667828378874; 
 Mon, 07 Nov 2022 05:39:38 -0800 (PST)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([116.73.133.26])
 by smtp.googlemail.com with ESMTPSA id
 w68-20020a626247000000b0056c063dd4cfsm4512542pfb.66.2022.11.07.05.39.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 05:39:38 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
To: "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>
Cc: qemu-devel@nongnu.org
Subject: [PATCH] hw/acpi: fix breakage due to missing aml stub definitions
 when acpi is off
Date: Mon,  7 Nov 2022 19:09:20 +0530
Message-Id: <20221107133920.865060-1-ani@anisinha.ca>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::631;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x631.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Some HW architectures do not support acpi and CONFIG_ACPI is off for them. For
those architectures, dummy stub function definitions help to resolve symbols.
This change adds couple of dummy stub definitions so that symbols for those can
be resolved and failures such as the following can be fixed for or1k targets.

Configuration:
qemu/build $ ../configure --enable-werror --disable-docs --disable-nettle
             --enable-gcrypt --enable-fdt=system --enable-modules
             --enable-trace-backends=dtrace --enable-docs
	     --enable-vfio-user-server
             --target-list="ppc64-softmmu or1k-softmmu s390x-softmmu
               x86_64-softmmu rx-softmmu sh4-softmmu nios2-softmmu"

actual failure:

qemu/build $ QTEST_QEMU_BINARY=./qemu-system-or1k  ./tests/qtest/qos-test
failed to open module:
/build/qemu/qemu/build/qemu-bundle/usr/local/lib64/qemu/hw-display-virtio-vga.so:
undefined symbol: aml_return
qemu-system-or1k: ../util/error.c:59: error_setv: Assertion `*errp ==
NULL' failed.
Broken pipe
../tests/qtest/libqtest.c:188: kill_qemu() detected QEMU death from
signal 6 (Aborted) (core dumped)
Aborted (core dumped)

Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 hw/acpi/aml-build-stub.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hw/acpi/aml-build-stub.c b/hw/acpi/aml-build-stub.c
index 8d8ad1a314..89a8fec4af 100644
--- a/hw/acpi/aml-build-stub.c
+++ b/hw/acpi/aml-build-stub.c
@@ -26,6 +26,16 @@ void aml_append(Aml *parent_ctx, Aml *child)
 {
 }
 
+Aml *aml_return(Aml *val)
+{
+    return NULL;
+}
+
+Aml *aml_method(const char *name, int arg_count, AmlSerializeFlag sflag)
+{
+    return NULL;
+}
+
 Aml *aml_resource_template(void)
 {
     return NULL;
-- 
2.34.1


