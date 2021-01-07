Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6706D2EE875
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 23:25:46 +0100 (CET)
Received: from localhost ([::1]:48842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxdiz-0008UQ-Dg
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 17:25:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdgY-0006m6-GU
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:23:14 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:38786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdgX-0004eT-2E
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:23:14 -0500
Received: by mail-wm1-x32b.google.com with SMTP id g185so6828646wmf.3
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 14:23:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qWarhXBRCCKl1ib6yNLPWYWSvngUVzs/930y/X1kaDM=;
 b=OuM8zCGuNKENPmA4AeOPBdxZtVqMeY6L/Qv81iOjsTaLsVhNTiF50IuicWsO8xsyU6
 o0YnigsuBrsraQeRizxBsomHfdxZIkbwBoywYTxdXLmqXJ5LlsBkfCJAzthQm4hhH681
 pMnR00hnz1Vk57j5SO61N7SoMInJ12z1LYEw1qAKQLvAOLeh+6B8UifHppiM09sgyr+6
 IouSehCrBqmUXzGLX8iNu1dqgmKYWfxhb6FDOLK63NnBD25BeS8taeITL6RNsNl6kU+J
 nteWfI+rNhmXMDJUF+V7/x92LZyffEXHgdvcmn9w3dvTNFRrcOXzq5uNVBAAGeaoDmon
 6eTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=qWarhXBRCCKl1ib6yNLPWYWSvngUVzs/930y/X1kaDM=;
 b=OfWfyb2vXpcvSA5lfR81nevkWLJwSkpB+ISEMw0+Zr0tnHpkNpLLbuBYrFBVFiR4E7
 z4MbXdC5jOr00cfkn73sDWcZQQw0sbPr2Y1qa+FHYKld99AB0FGvFSNHY1P5vzyR8ozC
 INHSvKw0jay4Z1cZWxWev5a4vE/BSzozeHgnOqkMqUR+kCxQQ2E/D9/Bm/PRxW/EtSxx
 tDB94R/BK9D0lz6uiVxrWauQDBrc/MBRCtl6FRVuPyiMQHjZj5xkXOwLYT7dftEeYp3/
 F3maJfcBmu5TNL2TQvTnq1BRmThCYcbNU6EkKxVb28CVRnxktQDd0QFtmbsxxGipFVEs
 aERQ==
X-Gm-Message-State: AOAM532yzyXXOM7toyX0pHgOcTkNSxaBU6T+Th+A/QduKjiu0/Zj9CBk
 CJe2C8bqQgXF0xLB+zwI6xfpRqp0UCM=
X-Google-Smtp-Source: ABdhPJwXEJY641mvWZFlqGlSPn78NAiXwQ5lcO0KUEHFx1ZWxt8dNXQxbxwgVbBtDlkQiI8jfm1hCA==
X-Received: by 2002:a1c:6283:: with SMTP id w125mr480401wmb.155.1610058191505; 
 Thu, 07 Jan 2021 14:23:11 -0800 (PST)
Received: from x1w.redhat.com (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id q15sm9893608wrw.75.2021.01.07.14.23.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 14:23:10 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/66] target/mips/addr: Add translation helpers for KSEG1
Date: Thu,  7 Jan 2021 23:21:50 +0100
Message-Id: <20210107222253.20382-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210107222253.20382-1-f4bug@amsat.org>
References: <20210107222253.20382-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>, kvm@vger.kernel.org,
 libvir-list@redhat.com, Huacai Chen <chenhuacai@kernel.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jiaxun Yang <jiaxun.yang@flygoat.com>

It's useful for bootloader to do I/O operations.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Huacai Chen <chenhuacai@kernel.org>
Message-Id: <20201215064507.30148-3-jiaxun.yang@flygoat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/cpu.h  |  2 ++
 target/mips/addr.c | 10 ++++++++++
 2 files changed, 12 insertions(+)

diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index 0086f95ea2a..0c2d397e4a9 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -1312,6 +1312,8 @@ uint64_t cpu_mips_kseg0_to_phys(void *opaque, uint64_t addr);
 uint64_t cpu_mips_phys_to_kseg0(void *opaque, uint64_t addr);
 
 uint64_t cpu_mips_kvm_um_phys_to_kseg0(void *opaque, uint64_t addr);
+uint64_t cpu_mips_kseg1_to_phys(void *opaque, uint64_t addr);
+uint64_t cpu_mips_phys_to_kseg1(void *opaque, uint64_t addr);
 bool mips_um_ksegs_enabled(void);
 void mips_um_ksegs_enable(void);
 
diff --git a/target/mips/addr.c b/target/mips/addr.c
index 27a6036c451..86f1c129c9f 100644
--- a/target/mips/addr.c
+++ b/target/mips/addr.c
@@ -40,6 +40,16 @@ uint64_t cpu_mips_kvm_um_phys_to_kseg0(void *opaque, uint64_t addr)
     return addr | 0x40000000ll;
 }
 
+uint64_t cpu_mips_kseg1_to_phys(void *opaque, uint64_t addr)
+{
+    return addr & 0x1fffffffll;
+}
+
+uint64_t cpu_mips_phys_to_kseg1(void *opaque, uint64_t addr)
+{
+    return (addr & 0x1fffffffll) | 0xffffffffa0000000ll;
+}
+
 bool mips_um_ksegs_enabled(void)
 {
     return mips_um_ksegs;
-- 
2.26.2


