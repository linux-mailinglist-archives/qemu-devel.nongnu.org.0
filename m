Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B8E3DB78D
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 13:05:46 +0200 (CEST)
Received: from localhost ([::1]:43180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9QKo-0000MU-0A
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 07:05:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m9QFB-000052-J3
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 06:59:57 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:44760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m9QFA-0002XO-0C
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 06:59:57 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 d131-20020a1c1d890000b02902516717f562so6121778wmd.3
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 03:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K0LsDdqG46LkMTzSmmUO14QKu3yyiy2ujafOymlz2zw=;
 b=Mv3wLyyo38nn6sGZcE5VnPxF+IxzHuyB8c6mYNk4VqmU3m3s1mGLRF0e7+ViFg/b1+
 j9p0q/BTwUFkwEoiq7CwKyQHEdypX1hW5kAvXqyEx7W+P5CpCLl5u2Ec8W931AtyLl4x
 Lrvu1zGOdtsM6JZAPkWkouhdi9uRlteu/e9LiLdM5lCqvg1SI5zaEUH+VDdX1d7KdguI
 FlKFrPD79rkjlkE4t9l04jN4b417Ww14gU+Ama+LbnclrQlImCDdUORT6iZJw7GpTIzu
 t+/IXDGBFLTP9+Jdo1kjPGZyIuxbsDp1Pqb2X3j9drj+0WG3MszwvYkfyROwoUZuEL7+
 RIdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K0LsDdqG46LkMTzSmmUO14QKu3yyiy2ujafOymlz2zw=;
 b=A5KDCfq2KrodHMrJ9iwYUdY6ZY2+LUxV7UtmGivBK7Zeqe1srr+5J93G3cYws01SEo
 ThFK+iQYDDlwpgmdZVV1mOdixPOMVomOkBCvKtcXttgWVmZWVTyRXFaxpgqmVpuZk/Qt
 IPGMZwn/M/ZGJP7KYzfNnd1uCg/dibNfLERzOOoe4SkIyclU5MLUPUJwlqRr4qQ1SN1O
 4xhcYdPJomY55wxlHIIqkaErL6bwF85rF87reKtN2+eu88bJoPojTlj41isyOwIKniJI
 uw+snuAUhlT6N3CxQhMAIZEq2Rq5gWjDLqcoT4QyYmqGyZvtQpN9ttovT/bhhquFBNRh
 dfGg==
X-Gm-Message-State: AOAM532SmJu2LF2eRbDQ/DnV/Wg8/N94lTk0x5ausvmBOXnyi8u+qbVp
 0f98wsoswRjt0IbwkM2aEiP2xwTvefWRhQ==
X-Google-Smtp-Source: ABdhPJwCJD77kL+THcn/PyIqPusviJLGFdRleEVyYCMAtqXJk1FtGiphFQUKRHh0KfcZj5sT9Zv1oQ==
X-Received: by 2002:a05:600c:1d11:: with SMTP id
 l17mr2315045wms.185.1627642794667; 
 Fri, 30 Jul 2021 03:59:54 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id p2sm1349697wrr.21.2021.07.30.03.59.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 03:59:54 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 6/8] arch_init.h: Move QEMU_ARCH_VIRTIO_* to
 qdev-monitor.c
Date: Fri, 30 Jul 2021 11:59:45 +0100
Message-Id: <20210730105947.28215-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210730105947.28215-1-peter.maydell@linaro.org>
References: <20210730105947.28215-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU_ARCH_VIRTIO_* defines are used only in one file,
qdev-monitor.c. Move them to that file.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/sysemu/arch_init.h | 9 ---------
 softmmu/qdev-monitor.c     | 9 +++++++++
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/include/sysemu/arch_init.h b/include/sysemu/arch_init.h
index 60270c5ad15..e7789399508 100644
--- a/include/sysemu/arch_init.h
+++ b/include/sysemu/arch_init.h
@@ -30,13 +30,4 @@ enum {
 
 extern const uint32_t arch_type;
 
-/* default virtio transport per architecture */
-#define QEMU_ARCH_VIRTIO_PCI (QEMU_ARCH_ALPHA | QEMU_ARCH_ARM | \
-                              QEMU_ARCH_HPPA | QEMU_ARCH_I386 | \
-                              QEMU_ARCH_MIPS | QEMU_ARCH_PPC |  \
-                              QEMU_ARCH_RISCV | QEMU_ARCH_SH4 | \
-                              QEMU_ARCH_SPARC | QEMU_ARCH_XTENSA)
-#define QEMU_ARCH_VIRTIO_CCW (QEMU_ARCH_S390X)
-#define QEMU_ARCH_VIRTIO_MMIO (QEMU_ARCH_M68K)
-
 #endif
diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index 721dec2d820..a304754ab91 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -52,6 +52,15 @@ typedef struct QDevAlias
     uint32_t arch_mask;
 } QDevAlias;
 
+/* default virtio transport per architecture */
+#define QEMU_ARCH_VIRTIO_PCI (QEMU_ARCH_ALPHA | QEMU_ARCH_ARM | \
+                              QEMU_ARCH_HPPA | QEMU_ARCH_I386 | \
+                              QEMU_ARCH_MIPS | QEMU_ARCH_PPC |  \
+                              QEMU_ARCH_RISCV | QEMU_ARCH_SH4 | \
+                              QEMU_ARCH_SPARC | QEMU_ARCH_XTENSA)
+#define QEMU_ARCH_VIRTIO_CCW (QEMU_ARCH_S390X)
+#define QEMU_ARCH_VIRTIO_MMIO (QEMU_ARCH_M68K)
+
 /* Please keep this table sorted by typename. */
 static const QDevAlias qdev_alias_table[] = {
     { "AC97", "ac97" }, /* -soundhw name */
-- 
2.20.1


