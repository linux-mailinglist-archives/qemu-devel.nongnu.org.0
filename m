Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21DCA473DF2
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 09:06:59 +0100 (CET)
Received: from localhost ([::1]:54550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx2pu-0000gY-2M
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 03:06:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mx2m9-0006Rc-4P
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 03:03:05 -0500
Received: from mail.xen0n.name ([115.28.160.31]:48404
 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mx2m5-0000TO-5e
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 03:03:04 -0500
Received: from ld50.lan (unknown [101.88.31.179])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 698E56017D;
 Tue, 14 Dec 2021 16:02:57 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1639468977; bh=2il0F4oG2U/NXS3ijNKBJcFVjyz+VzUjGcGAKbXGevc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jkLj+ojUMsLJNK/D2QyqmXfXhK2dEaz0/b6uATQ+aOlxO7ilapvsLyuuSZjLJBgq3
 j+0dvjMyxjv5zOjOpIZC5d11FJByE/EWvLwnSz5e+9LEQsr1jptPBJ0xuG7UIN3MtZ
 eYY5kOBU6M19+NSljKC8hpQtZo88R+NeKSCjFRYQ=
From: WANG Xuerui <git@xen0n.name>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 01/31] elf: Add machine type value for LoongArch
Date: Tue, 14 Dec 2021 16:01:24 +0800
Message-Id: <20211214080154.196350-2-git@xen0n.name>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211214080154.196350-1-git@xen0n.name>
References: <20211214080154.196350-1-git@xen0n.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.28.160.31; envelope-from=git@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 XiaoJuan Yang <yangxiaojuan@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>, WANG Xuerui <git@xen0n.name>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is already officially allocated as recorded in GNU binutils
repo [1], and the description is updated in [2]. Add to enable further
work.

[1]: https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=4cf2ad720078a9f490dd5b5bc8893a926479196e
[2]: https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=01a8c731aacbdbed0eb5682d13cc074dc7e25fb3

Signed-off-by: WANG Xuerui <git@xen0n.name>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/elf.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/elf.h b/include/elf.h
index 811bf4a1cb..3a4bcb646a 100644
--- a/include/elf.h
+++ b/include/elf.h
@@ -182,6 +182,8 @@ typedef struct mips_elf_abiflags_v0 {
 
 #define EM_NANOMIPS     249     /* Wave Computing nanoMIPS */
 
+#define EM_LOONGARCH    258     /* LoongArch */
+
 /*
  * This is an interim value that we will use until the committee comes
  * up with a final number.
-- 
2.34.0


