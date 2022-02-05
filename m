Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 902DA4AA8E8
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Feb 2022 13:58:45 +0100 (CET)
Received: from localhost ([::1]:51582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGKeK-0005hd-DQ
	for lists+qemu-devel@lfdr.de; Sat, 05 Feb 2022 07:58:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGKSE-0000RB-Re
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 07:46:15 -0500
Received: from [2a00:1450:4864:20::336] (port=52161
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGKSB-0006Hr-Lj
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 07:46:14 -0500
Received: by mail-wm1-x336.google.com with SMTP id r131so880237wma.1
 for <qemu-devel@nongnu.org>; Sat, 05 Feb 2022 04:45:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AOPY/qtmKHQg2E5Q15NX1b06PLvVTPqP1LdnToTRgJI=;
 b=aIZXgBd4YJGPwHbT6b+KcuVJevGxm8NPoo7ijv6w9nmqQaoOTQnsfASqpU6JurQXY1
 PnU0VUjboAKcfNAhcha3y+WU0pcqY+m8r54WCovaX4a/Y3JBFu3eVqmLkktNSiZXxjH8
 nXJLqS+ugLDZfMhSbu2liPZRJVS1FzNdP7KudhfLve1bG8lIiLPKG7JY3GGEctGYDg27
 oNKZxyghE/fc0YEPOoTl1K1KA/U000CLOGV3VKcQVehU188ErFEwI4tbX/ZfdE0Xu/RM
 rNYp9WKVxHw4iEBYFNJ8smykZSRrseSdoU9assjiWO7aAcYUGWBAIHBC1pzL+IWsUpux
 3QdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=AOPY/qtmKHQg2E5Q15NX1b06PLvVTPqP1LdnToTRgJI=;
 b=ZgAtGL1V3hWN8rdLN2TVljqDdCkH6YJs0IjDQ17k92UO7gYhkcQ6zRnDD+LcDnlEGr
 xePOKOfv9BIq5GVyyRYvdZLi3zuwZuUApNfXi+48vqx0UUmEwydIG3IbRQsMkaSdsyNk
 rpSmlGJ1HxzZvbZ1pSQvh4XQiU4ncERJr5DMXVLY/hzIByjTvoTFWa00H3hS+vRL+HDJ
 9sChPJRo+vgQP9AXzD0xFwtmnZTgHa0LYGxRPWxUPGe4vYJGa2yf0PyWVTsPfIf2R434
 IZeNzwNz09mtOMRrM7KULR/S3kxV2pSSD6X8q/KilO3UDg0l/JxV1jXfpXWwlKssoN1T
 VVXw==
X-Gm-Message-State: AOAM530qn4wNNmM5QphDCuXuoauHhjnJRfrFVEfy5QGu8DT0KqA83itN
 Mt9i92Ob37Rr+bINmiQJ2qGuIULl2qw=
X-Google-Smtp-Source: ABdhPJxAXZomMB3Xbc/Al5AOGAIBZPIKTC+N+R7inxoCbllxqnzp7bNgwZ3r6kNfXLuqAzNS9KOlSg==
X-Received: by 2002:a05:600c:1e84:: with SMTP id
 be4mr2976375wmb.147.1644065148639; 
 Sat, 05 Feb 2022 04:45:48 -0800 (PST)
Received: from nuc.. (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id
 v8sm3637370wmd.44.2022.02.05.04.45.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Feb 2022 04:45:48 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Yang Zhong <yang.zhong@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v4 4/4] hw/i386/sgx: Attach SGX-EPC objects to machine
Date: Sat,  5 Feb 2022 13:45:26 +0100
Message-Id: <20220205124526.500158-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220205124526.500158-1-f4bug@amsat.org>
References: <20220205124526.500158-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
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


