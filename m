Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E31C43C61AE
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 19:13:07 +0200 (CEST)
Received: from localhost ([::1]:44332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2zUQ-0000vk-VW
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 13:13:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m2zRV-00061c-SQ
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 13:10:06 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:41810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m2zRU-0007O2-0u
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 13:10:05 -0400
Received: by mail-ej1-x630.google.com with SMTP id go30so8906902ejc.8
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 10:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UtPtNn8ftw/KiXb4mpy41KrE1wYrg158kWzmq14tXRs=;
 b=GR2abcL7WvvLb2/yfTJTSfciDopoBvUAaZOSSxW38qPtFeedJF1sPc/IDMnBaUiCxJ
 SPhP7QjfQFxdaeC3ZvHeaic2SLBhYoeKxfmT4rh0kUXCSsshsIiqdsMwhiPRQ9+kKRQJ
 /THvHYhXtWUbY7154Bdio0n10c3C4+o9FVmjgLIX/9vKq9XB4YywcZGxKNFxt41Vxyrt
 QIiL/4y8hCOsfbSt3nFiOa8BeALozv6H9tEHHGTc+rhqsLW1WGrMaaML/T0b0TawO6ZP
 yJpWHeyxRrBZMJXkDWg7eZ6VM/zqDDXiGSYqKgTPfZEXe0LVxN89b2NcfufJHbaKm9z8
 gI5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=UtPtNn8ftw/KiXb4mpy41KrE1wYrg158kWzmq14tXRs=;
 b=RbPbPCCdjudmvlmfHXruF5VU9A8O1ZY8zma9lCA9+zew9wyX/hiNGlr/ur63wvLaA8
 GHOi69em6VCyreAiQInior6UDS8NezNQTTSqNfHyTS5BA80eeMbn6tzHC2Ke/1Z9JdZp
 jkvtVFkYM4osbFcoM6SAltJU4d9xvw4Pc0GKJYH2aKkuZHsPX3TxbFOGUxAtmdP5GAyA
 AyyNYeir5DkHuSyQafFufdMEMHMnddyyb6x5VU1oJ3Qe1Keyf6uLU7BedGruLu9EIxJg
 Dvh4v8SR3yoDKFScdKvGhQFhfH1LeZtubK3Oqe/a3hvmK7SFEXzbAmLJAFt6Sz54HnFN
 eJMw==
X-Gm-Message-State: AOAM530axtDEUxlW8jFxP2XVcjn9mHZAAof6ocjl0AWCsW8zSNVAwWaV
 +17g2HHSBT4+dmdqXhNnk+3BgXvac7Q=
X-Google-Smtp-Source: ABdhPJyVNKLfI7ubOzJIhpdP3UjHAWeDG9bT/S10/4Qzsxdm95dW5BT6dRdeYYPx2ujJg9hflCwxJQ==
X-Received: by 2002:a17:906:5650:: with SMTP id
 v16mr66387ejr.533.1626109802319; 
 Mon, 12 Jul 2021 10:10:02 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id t4sm2969776ejo.125.2021.07.12.10.10.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 10:10:01 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] disable modular TCG on Darwin
Date: Mon, 12 Jul 2021 19:09:53 +0200
Message-Id: <20210712170953.554555-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x630.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Accelerator modularity does not work on Darwin:

ld: illegal thread local variable reference to regular symbol _current_cpu for architecture x86_64
clang: error: linker command failed with exit code 1 (use -v to see invocation)

Fix by avoiding modular TCG builds.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index dd7f9ed6a8..6bfc44f7d7 100644
--- a/meson.build
+++ b/meson.build
@@ -92,7 +92,11 @@ if cpu in ['x86', 'x86_64']
   }
 endif
 
-modular_tcg = ['i386-softmmu', 'x86_64-softmmu']
+modular_tcg = []
+# Darwin does not support references to thread-local variables in modules
+if targetos != 'darwin'
+  modular_tcg = ['i386-softmmu', 'x86_64-softmmu']
+endif
 
 edk2_targets = [ 'arm-softmmu', 'aarch64-softmmu', 'i386-softmmu', 'x86_64-softmmu' ]
 install_edk2_blobs = false
-- 
2.31.1


