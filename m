Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C6C48FFA9
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 00:56:06 +0100 (CET)
Received: from localhost ([::1]:38452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9FNV-0006B6-Fa
	for lists+qemu-devel@lfdr.de; Sun, 16 Jan 2022 18:56:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9FLG-00045W-FC
 for qemu-devel@nongnu.org; Sun, 16 Jan 2022 18:53:46 -0500
Received: from [2a00:1450:4864:20::336] (port=46799
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9FLE-0007aa-Uw
 for qemu-devel@nongnu.org; Sun, 16 Jan 2022 18:53:46 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 d187-20020a1c1dc4000000b003474b4b7ebcso18820920wmd.5
 for <qemu-devel@nongnu.org>; Sun, 16 Jan 2022 15:53:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mE9T7K6SmPhZ9bXu37ofq8U0FJgzH9QPe/lM62Txz24=;
 b=g5IzHq5w5/u95mZqLI0RU96p0HPBwJeHbwsihiYZ7b7WrExoFZUHCF5X5/Gxx3CA4K
 zPOfX7DAeGMCPN3x4F6O+68wW3ePiXfAykL3JYP0b9qCtz89i/9q38H/0yloSEORf05E
 LKuZUSbCTN+XBtTuLAEUrPlbZmpx3ky8RXl5cTPNlsI0grnGgSV8I8kXFKLiUE5M6HKq
 KAflOw0zRbQJXcNrSz2ZVaTtMRFVrji3VZTrPLCfwhYqXjaQpbYylWCM1At4ZOW5N5yt
 iYJKMz1z5sCfAYpPtNi24aTTEvH/xe/wXWs0U7pjuvmgd6oNz0t/NUi8GLfaxWGwmjYa
 QqQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=mE9T7K6SmPhZ9bXu37ofq8U0FJgzH9QPe/lM62Txz24=;
 b=wWluyA5HmzBvRgO0uN0siftnjtf9Zz/5YaAkt5LAC5IHJJ4t0Uri4Bn9WkjGNx9QFc
 BngUUojzqGbLG+IhsbC/tT2sjvW3ZPz51A52jy0yV0PsyWKCOlALgP1deTh0HAaYTeTx
 iETiy9QlxT/NLw1KmweG1hvJy9aoV4lz1JnHGdFtJbpAalYn45PwU5Q2WfVkkBgzTvQ7
 4AAYzRq/dSd7x9QAFnnyf4wNLgqjWbFwLmr4QMrWwOnZ2D12gATur/r/hiic1QHWW77Z
 TIxrqNeToo/QeVXb19iGRsLqmdIiP1CTdxQ669/BNjEY65SL0vYf7/Tvz/wYjWNpKt7r
 qpBQ==
X-Gm-Message-State: AOAM532d9oIGvFGow0qWdbtZsw9zpFqkLlxOfYNqV9GGEe/560Zc2y3o
 zB4BQ9HHUlQIdha6KmMomrVC2wV7nVp/xAlM
X-Google-Smtp-Source: ABdhPJykXdj1ESuWqwQfLg0oNfVV00xZmzL4g3/rYTcQABK8pAdx8jRAlVzuG4cHYGgpSzaX5BLCMg==
X-Received: by 2002:a05:600c:35cd:: with SMTP id
 r13mr1638733wmq.29.1642377223618; 
 Sun, 16 Jan 2022 15:53:43 -0800 (PST)
Received: from nuc.. (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id n4sm73055wri.29.2022.01.16.15.53.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Jan 2022 15:53:43 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Yang Zhong <yang.zhong@intel.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [RFC PATCH 2/2] hw/i386/sgx: Attach SGX-EPC to its memory backend
Date: Mon, 17 Jan 2022 00:53:31 +0100
Message-Id: <20220116235331.103977-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220116235331.103977-1-f4bug@amsat.org>
References: <20220116235331.103977-1-f4bug@amsat.org>
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
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

We have one SGX-EPC address/size/node per memory backend,
make it child of the backend in the QOM composition tree.

Cc: Yang Zhong <yang.zhong@intel.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/i386/sgx.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/i386/sgx.c b/hw/i386/sgx.c
index 5de5dd08936..6362e5e9d02 100644
--- a/hw/i386/sgx.c
+++ b/hw/i386/sgx.c
@@ -300,6 +300,9 @@ void pc_machine_init_sgx_epc(PCMachineState *pcms)
         /* set the memdev link with memory backend */
         object_property_parse(obj, SGX_EPC_MEMDEV_PROP, list->value->memdev,
                               &error_fatal);
+        object_property_add_child(OBJECT(list->value->memdev), "sgx-epc",
+                                  OBJECT(obj));
+
         /* set the numa node property for sgx epc object */
         object_property_set_uint(obj, SGX_EPC_NUMA_NODE_PROP, list->value->node,
                              &error_fatal);
-- 
2.34.1


