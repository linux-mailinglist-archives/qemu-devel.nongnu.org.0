Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D67834A535A
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 00:38:19 +0100 (CET)
Received: from localhost ([::1]:54848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEgFW-0006h7-Uw
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 18:38:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nEgCv-0004VW-5r
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 18:35:38 -0500
Received: from [2a00:1450:4864:20::42e] (port=36531
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nEgCs-0000TS-6B
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 18:35:36 -0500
Received: by mail-wr1-x42e.google.com with SMTP id u15so28509771wrt.3
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 15:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zj+Qri8GcGZt7FEwIVzC4hgXAvnCPP2yo0dnh3pQ+eg=;
 b=ZZvm4w4DaqlyuuxbGZ73x5aQlxLmfFG1/qdXGExkVnc/pwJXUroFPCLP8LJCNxEKc+
 Oq5ILq2HNaKl5iRY3WCpJmxLEsqw0Sqjl37/tbrHeS7/zX6PUh3wPF5e/e5Hy/sXGVxa
 1kO+HDljrfGpERNBvfTVO85ivPkY/eBrV1QNMamNZKhxSSx3EUTnwqrZGgX+PbeYijrc
 yblJ5Y/AR/ropqZNQv+mmIu9uGIPnj9rmE3B6UHgd3ty6os9Yco/ksz+8+J5k7s+nt3n
 81c7IOdx56qdjb8XCd6aG1IX5ae9nsVoaT64SJ/Q1M/jSv7LuaQwIKl5JFBimgD0nex/
 hS5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=zj+Qri8GcGZt7FEwIVzC4hgXAvnCPP2yo0dnh3pQ+eg=;
 b=VWh0tYbDrOP2pLOUKhV8T6z19ChvxWwtFbLlJybeXRP7FMeVfQoqoJxHMNaXl9dju8
 82FnI1VRQ1RpGZ761ZaNLSYi3wsIuH/4XKGiuuHZccyK9ea0VzZkwditDL0YVYfSeaoS
 +uRW8tacnE7/1yQdaQRePJRTfXLAJOOmomjL7kJmEq37z9tM3vvhNr/mORnOLVXex7Qd
 7a9nK+2Czbf8iWHP7iElFyuv8GwQtMV/x7tifswVwqJPy1dhkzoiPVDLkifDxkOrTyNj
 8wYufWK7oHIBSV3kCobg81I1gL/H+xuOQqgbxzGuR0pDOzxkMlr7/TbANPdqqvvAaCqe
 ZyPQ==
X-Gm-Message-State: AOAM530K3k91pPUUxKRMn1IGVbJR3HVTYtsZu5Ttu94o7t/rg92Z/4xZ
 aGtBzOoVO8384nYS4oHPJW9jC9mEHvs=
X-Google-Smtp-Source: ABdhPJwJj4g/0yEovyDQhxWmq7DmPLuZC+St8XVGoYaifI5Vq0b8lcWKvHGqU2vQQRV7VG1Z2UI0lQ==
X-Received: by 2002:a05:6000:18af:: with SMTP id
 b15mr18560679wri.589.1643672120384; 
 Mon, 31 Jan 2022 15:35:20 -0800 (PST)
Received: from nuc.. (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id
 j28sm590674wms.14.2022.01.31.15.35.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 15:35:20 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Yang Zhong <yang.zhong@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v3 2/2] hw/i386/sgx: Attach SGX-EPC objects to machine
Date: Tue,  1 Feb 2022 00:35:07 +0100
Message-Id: <20220131233507.334174-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220131233507.334174-1-f4bug@amsat.org>
References: <20220131233507.334174-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

Previously SGX-EPC objects were exposed in the QOM tree at a path

  /machine/unattached/device[nn]

where the 'nn' varies depending on what devices were already created.

With this change the SGX-EPC objects are now at

  /machine/sgx-epc[nn]

where the 'nn' of the first SGX-EPC object is always zero.

Reported-by: Yang Zhong <yang.zhong@intel.com>
Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/i386/sgx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/i386/sgx.c b/hw/i386/sgx.c
index a2b318dd938..3ab2217ca43 100644
--- a/hw/i386/sgx.c
+++ b/hw/i386/sgx.c
@@ -304,6 +304,8 @@ void pc_machine_init_sgx_epc(PCMachineState *pcms)
     for (list = x86ms->sgx_epc_list; list; list = list->next) {
         obj = object_new("sgx-epc");
 
+        object_property_add_child(OBJECT(pcms), "sgx-epc[*]", OBJECT(obj));
+
         /* set the memdev link with memory backend */
         object_property_parse(obj, SGX_EPC_MEMDEV_PROP, list->value->memdev,
                               &error_fatal);
-- 
2.34.1


