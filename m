Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DE24D165E
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 12:38:44 +0100 (CET)
Received: from localhost ([::1]:33876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRYAt-0002GI-Lq
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 06:38:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRY7A-0007cn-Op
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 06:34:52 -0500
Received: from [2a00:1450:4864:20::52e] (port=33371
 helo=mail-ed1-x52e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRY79-0005m4-Bl
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 06:34:52 -0500
Received: by mail-ed1-x52e.google.com with SMTP id s10so2817452edd.0
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 03:34:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yMUJAFUDX52CRdJ33zGTF80GRdiEdw/04diTOjeLv2U=;
 b=djggZ0ULOnYj2DRX6zv9wPrubdgWYM3kbx1h0mtXzY2b8UIpLgAbGQxXVdpDKP8cj/
 NNhrZ90YMPQiXEnVnM8k8z5XyxC4MaaWYYahYJIGLJOfLZ9parxua1c1VnmHELJTPJqN
 Gi7NmBoj69gHSVytcuvkO2Ps1uoi2c7wF+uPd3NH09UHW3NJGpR9qhsMttYnYOeq+08G
 7HA8eeWuPzAfWxzD4UtHLS4BthOqkU5f8MOGYKjq4h1YBgzxyo1GrNVESTY9O4DePcxg
 pUKgxobtp+3F6J+GnVK9k7H/JNUnixy0wR5do2+dZ0LVYyENfR+4XM9SXs9/Y/hpAaVk
 3SUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=yMUJAFUDX52CRdJ33zGTF80GRdiEdw/04diTOjeLv2U=;
 b=vfWtxuW41ZrChcX8vBKnBQe+Z6oGvOFopLEQVhAu6ZC9sxv/XqzpbmD58EBdTpR0ql
 apEAVTBYI5eybVpH+ONwK6ar14N24XvYeD5qj2G2WfoUvtJ0l5jRglWCq1c27cDzTPTv
 cGPNgtTdoJe5TNtfIcaXW/nN5YErXIEGPdY2rlNZH9m3FmH20MyggGUzWCX6e+T7sJSl
 Xadn6AuNxbPfW7f0orgxCUComLLuLjis5WJvrfK9W95zNGZUPMZiKusy+Grhi7+eIH+P
 gnVwOXiKrltddws0yjwvutoujdfsakYKdqaLoCSiBroopcYXUvE2NBmIG4cy2WpmLryW
 D8rQ==
X-Gm-Message-State: AOAM530747u+eT8+y9vQvoiwVqQPnQCY/+B0zuWF12NiWLaMe0NQsHbB
 o74mX9KEaIh+j2RwAASQ+o31cSwxrTo=
X-Google-Smtp-Source: ABdhPJzwdKj8CU1wEzBCYkyHDHgbfBb9Aexs3PZfH4t+4Kbbcnpsoc2lVoMM3nmz5YQNNsm3mT87Fw==
X-Received: by 2002:a05:6402:2714:b0:416:4bcf:89a9 with SMTP id
 y20-20020a056402271400b004164bcf89a9mr8472609edd.226.1646739290006; 
 Tue, 08 Mar 2022 03:34:50 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 l2-20020aa7cac2000000b003f9b3ac68d6sm7491868edt.15.2022.03.08.03.34.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 03:34:49 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/22] whpx: Fixed reporting of the CPU context to GDB for
 64-bit
Date: Tue,  8 Mar 2022 12:34:24 +0100
Message-Id: <20220308113445.859669-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220308113445.859669-1-pbonzini@redhat.com>
References: <20220308113445.859669-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Ivan Shcherbakov <ivan@sysprogs.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ivan Shcherbakov <ivan@sysprogs.com>

Make sure that pausing the VM while in 64-bit mode will set the
HF_CS64_MASK flag in env->hflags (see x86_update_hflags() in
target/i386/cpu.c).

Without it, the code in gdbstub.c would only use the 32-bit register values
when debugging 64-bit targets, making debugging effectively impossible.

Signed-off-by: Ivan Shcherbakov <ivan@sysprogs.com>
Message-Id: <00f701d82874$68b02000$3a106000$@sysprogs.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/whpx/whpx-all.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/i386/whpx/whpx-all.c b/target/i386/whpx/whpx-all.c
index ef896da0a2..edd4fafbdf 100644
--- a/target/i386/whpx/whpx-all.c
+++ b/target/i386/whpx/whpx-all.c
@@ -604,6 +604,8 @@ static void whpx_get_registers(CPUState *cpu)
         whpx_apic_get(x86_cpu->apic_state);
     }
 
+    x86_update_hflags(env);
+
     return;
 }
 
-- 
2.35.1



