Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3AD5600725
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 08:58:06 +0200 (CEST)
Received: from localhost ([::1]:38074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okK4b-00063Y-EG
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 02:58:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1okJn0-0005JN-Ui
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 02:39:56 -0400
Received: from mail.loongson.cn ([114.242.206.163]:57866 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1okJmy-0002T5-6X
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 02:39:54 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id AQAAf8CxhOSw+Exj8gMAAA--.86S6;
 Mon, 17 Oct 2022 14:39:47 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, stefanha@gmail.com,
 WANG Xuerui <xen0n@gentoo.org>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 =?UTF-8?q?Andreas=20K=20=2E=20H=C3=BCttel?= <dilfridge@gentoo.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 4/5] linux-user: Fix struct statfs ABI on loongarch64
Date: Mon, 17 Oct 2022 14:39:43 +0800
Message-Id: <20221017063944.1443723-5-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221017063944.1443723-1-gaosong@loongson.cn>
References: <20221017063944.1443723-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxhOSw+Exj8gMAAA--.86S6
X-Coremail-Antispam: 1UD129KBjvJXoW7AFykKr43Cw1fJw4kCw1kGrg_yoW8KrWDpF
 97KFyrKF4Fqr42k3Wq9FyUJr1fur4vyF18JFZIgrWvk3WkX3y8GF4DCF98C3yI9as2yayj
 vr98G34YgFWUuaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: WANG Xuerui <xen0n@gentoo.org>

Previously the 32-bit version was incorrectly chosen, leading to funny
but incorrect output from e.g. df(1). Simply select the version
corresponding to the 64-bit asm-generic definition.

For reference, this program should produce the same output no matter
natively compiled or not, for loongarch64 or not:

```c
#include <stdio.h>
#include <sys/statfs.h>

int main(int argc, const char *argv[])
{
  struct statfs b;
  if (statfs(argv[0], &b))
    return 1;

  printf("f_type = 0x%lx\n", b.f_type);
  printf("f_bsize = %ld\n", b.f_bsize);
  printf("f_blocks = %ld\n", b.f_blocks);
  printf("f_bfree = %ld\n", b.f_bfree);
  printf("f_bavail = %ld\n", b.f_bavail);

  return 0;
}

// Example output on my amd64 box, with the test binary residing on a
// btrfs partition.

// Native and emulated output after the fix:
//
// f_type = 0x9123683e
// f_bsize = 4096
// f_blocks = 268435456
// f_bfree = 168406890
// f_bavail = 168355058

// Output before the fix, note the messed layout:
//
// f_type = 0x10009123683e
// f_bsize = 723302085239504896
// f_blocks = 168355058
// f_bfree = 2250817541779750912
// f_bavail = 1099229433104
```

Fixes: 1f63019632 ("linux-user: Add LoongArch syscall support")
Signed-off-by: WANG Xuerui <xen0n@gentoo.org>
Cc: Song Gao <gaosong@loongson.cn>
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Cc: Andreas K. Hüttel <dilfridge@gentoo.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Andreas K. Huettel <dilfridge@gentoo.org>
Message-Id: <20221006100710.427252-1-xen0n@gentoo.org>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 linux-user/syscall_defs.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index 01ee10a88f..77864de57f 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -2262,7 +2262,8 @@ struct target_statfs64 {
 };
 #elif (defined(TARGET_PPC64) || defined(TARGET_X86_64) || \
        defined(TARGET_SPARC64) || defined(TARGET_AARCH64) || \
-       defined(TARGET_RISCV)) && !defined(TARGET_ABI32)
+       defined(TARGET_RISCV) || defined(TARGET_LOONGARCH64)) && \
+       !defined(TARGET_ABI32)
 struct target_statfs {
 	abi_long f_type;
 	abi_long f_bsize;
-- 
2.31.1


