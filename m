Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 641364D0688
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 19:29:27 +0100 (CET)
Received: from localhost ([::1]:50226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRI6o-000221-G0
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 13:29:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRHuj-000197-1d
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 13:16:57 -0500
Received: from [2a00:1450:4864:20::529] (port=41659
 helo=mail-ed1-x529.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRHud-0005Mb-7w
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 13:16:56 -0500
Received: by mail-ed1-x529.google.com with SMTP id c20so2720047edr.8
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 10:16:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y9cqJILoV0+xn8mWQ2aytUPnC+SpQT6vl7Ugzs0thRM=;
 b=juzHXceilW31CyV5E9mPgkehz6KhjV5CzDz4/s11KlLT32CvnWRlPm1iIZW6yyfI9B
 aqWF99/ZaigyH29JGSO6653W6Cd9NxaY6V6E852OVg94CFyS5lLw9r5YsycEh3cZhxTx
 /pGkNb+G7PSTqjUfhaAjuwAEbAAgO04LV0VKP1M0s27adZSWVquXG5rThsIU+GEXMItB
 zuUcmO+iHCZDn3C4BDvcHt6AyIkvjYCcyWo5RzHZYsKx3lArCe1D8G9w+6GCzflurP17
 vyGKZZtkuxSeConWrmWoar0NPYax4xAKUm2nK4/TbQj2eHrqnZA8vMB621EBwCB/AXbZ
 yrrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Y9cqJILoV0+xn8mWQ2aytUPnC+SpQT6vl7Ugzs0thRM=;
 b=1xtzK8ShftPeYwtwiN/jbgKKuD+MDjHElcehkB0WwW14uvJI+0ng+G3tkRfp8BnwaL
 nXfuPoTQvLvARvRpXtEzbGrInVo7GieL+Myow/FEnmGicDoI+6DWqltlONYRk73Px3do
 tLsRB79+8uO/bwLVgHzr8J7YKal9Fnbjk9juwH0/OdZwYm/5+XQEVBz3/QdmC1V8ksGy
 I8+rNCTjMzk7Mn2RPYIz2lpwWaTPJajSTX28pT9iAhJuWytsR9M3bicrtTqsHwEoV/jt
 0arThk/wtgBR2mDICYLGjgWg8srAixkxfz5l6LBcrAlySRZikQpwwzuve7FSsP/BkSwd
 ELTw==
X-Gm-Message-State: AOAM530Yk7VEX0mBqxr8iOHYOhjlgnoklVphiFnaTVCz2baz1/zy/8+Z
 dosc1XiDlOLBt/tKzvyyvOixwMk9lEU=
X-Google-Smtp-Source: ABdhPJzuJ2CcNqMr+9oavKZ0y+YANajD5E7gZXeNgEeGLvlFvKpe16WW9EPSJ/TqXFTO/s4hxzrzVw==
X-Received: by 2002:a50:d498:0:b0:416:2b00:532 with SMTP id
 s24-20020a50d498000000b004162b000532mr10545738edi.396.1646676996341; 
 Mon, 07 Mar 2022 10:16:36 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 d8-20020a170906304800b006cdf8a1e146sm4983382ejd.217.2022.03.07.10.16.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 10:16:35 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/23] whpx: Fixed reporting of the CPU context to GDB for
 64-bit
Date: Mon,  7 Mar 2022 19:16:11 +0100
Message-Id: <20220307181633.596898-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220307181633.596898-1-pbonzini@redhat.com>
References: <20220307181633.596898-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::529
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x529.google.com
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
2.34.1



