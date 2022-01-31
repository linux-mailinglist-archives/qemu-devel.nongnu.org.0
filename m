Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8293C4A5359
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 00:38:15 +0100 (CET)
Received: from localhost ([::1]:54786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEgFS-0006eR-CT
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 18:38:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nEgCu-0004VH-1f
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 18:35:38 -0500
Received: from [2a00:1450:4864:20::434] (port=36536
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nEgCp-0000QW-0Z
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 18:35:35 -0500
Received: by mail-wr1-x434.google.com with SMTP id u15so28509448wrt.3
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 15:35:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TXYGLBQl6cf9T9L1XGTbclXyqLqbG5O8yICVfWUvPCA=;
 b=aKltUBI9xjvqubuUC6sZ0q4OsnwRwNwMqbpjTzY2M91mUAFAZ5QEIDn2I+zHskHXnH
 +hAWX3wZv0GzuremtBVBE0SsDjXr/qmD0T0cAcpDIshw2AyXeIRzpgUEOrqK7l8ad74e
 L/0FwCR5ZthC33w0SghkdCOUYvfYzuphII+tZajA9jdEGF4a9OAoFGQLn23WWOqd1uk8
 vezMx7SXvahEARjl/JXc+/A1Lb7zPafeL+ytXfeyY7FHKOYx730URq98/bfnZ8yoZPsY
 YT6gX6WnHb9wRheQbpq5soO3LPqWm3EsppaU/SphelMwd0gkIgVYTgl5kSlUFmBArzRP
 TyuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=TXYGLBQl6cf9T9L1XGTbclXyqLqbG5O8yICVfWUvPCA=;
 b=jdWDvRCFI/n94ZrkaiRbMdA9ZQ82b3E6aaXO9g+nT+JSQaTox+BedTs38SR0PkGoOT
 5dP0H7KjLOxQzOydyrK+DArjiuazXjCVLoPKuxPSuUQ2WdwMmjLSdAv+fzyjjRVckjy+
 UFhbGtWmd7PvSYIDR9bymxDfn79Y6CyFiyNkNUvtrJJ6x01+0TuNNieCnVNHSPuCQizh
 u2uH5yoocDSQMG9xKpQ0rR93MYCRyjlipFmXkLMv7rxzfdbnBNVxHWKJAzXfQGh4NPna
 ujsddPEJLOVKaY6YqRZgrRpaSgRutfnVLs1TkiDmGk6DaaSZCzbZ7TGwbtHDvJIYof4i
 dPmg==
X-Gm-Message-State: AOAM531OcLQ+YeExQqVAMfEbXUQNj1MoU0qMaPvSzidToKUkPhJXyLH9
 r0nv1jhQxkOtlITNSPB1L0QeF0jss4s=
X-Google-Smtp-Source: ABdhPJyogrjJOjy150FTPVVjxRkKW+bhn2HjNtGEneCiOHNL1bMGSLft6imdQg7QWBapx3HElV0Orw==
X-Received: by 2002:adf:ebc2:: with SMTP id v2mr19794279wrn.498.1643672114968; 
 Mon, 31 Jan 2022 15:35:14 -0800 (PST)
Received: from nuc.. (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id 8sm599684wmg.0.2022.01.31.15.35.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 15:35:14 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Yang Zhong <yang.zhong@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v3 1/2] hw/i386: Attach CPUs to machine
Date: Tue,  1 Feb 2022 00:35:06 +0100
Message-Id: <20220131233507.334174-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220131233507.334174-1-f4bug@amsat.org>
References: <20220131233507.334174-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
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

Previously CPUs were exposed in the QOM tree at a path

  /machine/unattached/device[nn]

where the 'nn' of the first CPU is usually zero, but can
vary depending on what devices were already created.

With this change the CPUs are now at

  /machine/cpu[nn]

where the 'nn' of the first CPU is always zero.

Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/i386/x86.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index b84840a1bb9..50bf249c700 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -108,6 +108,7 @@ void x86_cpu_new(X86MachineState *x86ms, int64_t apic_id, Error **errp)
 {
     Object *cpu = object_new(MACHINE(x86ms)->cpu_type);
 
+    object_property_add_child(OBJECT(x86ms), "cpu[*]", OBJECT(cpu));
     if (!object_property_set_uint(cpu, "apic-id", apic_id, errp)) {
         goto out;
     }
-- 
2.34.1


