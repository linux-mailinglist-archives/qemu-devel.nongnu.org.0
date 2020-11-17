Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B972B728F
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 00:42:53 +0100 (CET)
Received: from localhost ([::1]:55512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfAce-0008A8-5f
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 18:42:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <linus.walleij@linaro.org>)
 id 1kfAbW-0007fw-GU
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 18:41:42 -0500
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143]:38584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <linus.walleij@linaro.org>)
 id 1kfAbT-0006lK-V1
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 18:41:42 -0500
Received: by mail-lf1-x143.google.com with SMTP id 74so315994lfo.5
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 15:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/VY+nQ2+UO2kcxbgAdKN/xAgZTIoZN8mXsaR1/QilVU=;
 b=z58pW0BS88wNFYMWYjt0AVNlmSMk43J53u4ImfvAycVmnZdAEpvCNtZumx/+A0xWJU
 xiQZ09czG0P5tZEHxQJxOXNCbnCHBSzlmebEQcufwk+3R+XToxmNxFkX/rUiw9RdfDHd
 /wi9mJZ7/55xEX3OL/v1sXoL3vUVjR1+ZWMDbX9m3JtcXd+HNZA2XyYAlbbay7AF/1uF
 IdBOenz+w60eSdFUmQuLmBIi+EfhKIdh2duixAuTRqZksuWxf75uXuye2FxFl1k/Oqtu
 FPIvl9Q0bR8yE19fH0H7FopV3rEuu1ZLa+gh6gS7s07uKoh5xGwqRSSSvop3DGd2MNri
 nQ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/VY+nQ2+UO2kcxbgAdKN/xAgZTIoZN8mXsaR1/QilVU=;
 b=muU61JineBMjx0SwxeJXmCeIS88vmQIhg0M6pCF2CljLAKp2FG4odq0b8OYUwRJ4NI
 jG2mp7MB057sveDUle5Lt63pcAZsV8grgIg67+2cpXXviFcUkawbfaWI17FWSoQRsGqT
 P+K54goz+xChUApEO89M62DunJVrdE3gO4qTEOWZCI8WJBCqbeY4qgSDWPiQxu4p8foM
 xcbXbNAiIYVFOssKeJM3+40us8wFZzUouXtmp8/BkKNcP7Bth6ExTBMXB4GWZRqmz13F
 XOFt7d1ZRLacROzYNmDKz2EzxBoSXzuaTPMtuv9YsZqa7jPHOOkGP6SVrfD9fjipgxUT
 YN2g==
X-Gm-Message-State: AOAM531fG75I/lyD9+WPpdTJMcmtVozXdfgpIadQ8lJqEbs7vcEoRmoE
 RkF+Aa7/j2+fQ/HLG7nOc9HAHw==
X-Google-Smtp-Source: ABdhPJzQu7X3lREJOVWuD7GAs2Xvm8gSDnb/ql5+zreK46MHGQ5FFbfih3+EFYqiS/L5HsrRxhu3Qw==
X-Received: by 2002:a19:8083:: with SMTP id b125mr2763067lfd.23.1605656497660; 
 Tue, 17 Nov 2020 15:41:37 -0800 (PST)
Received: from localhost.localdomain
 (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
 by smtp.gmail.com with ESMTPSA id n20sm3293035lfl.249.2020.11.17.15.41.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 15:41:36 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
To: Theodore Ts'o <tytso@mit.edu>,
	Andreas Dilger <adilger.kernel@dilger.ca>
Subject: [PATCH v4] fcntl: Add 32bit filesystem mode
Date: Wed, 18 Nov 2020 00:39:28 +0100
Message-Id: <20201117233928.255671-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::143;
 envelope-from=linus.walleij@linaro.org; helo=mail-lf1-x143.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Peter Maydell <peter.maydell@linaro.org>, linux-api@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?q?=E7=BD=97=E5=8B=87=E5=88=9A?= <luoyonggang@gmail.com>,
 Florian Weimer <fw@deneb.enyo.de>, Andy Lutomirski <luto@kernel.org>,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It was brought to my attention that this bug from 2018 was
still unresolved: 32 bit emulators like QEMU were given
64 bit hashes when running 32 bit emulation on 64 bit systems.

This adds a flag to the fcntl() F_GETFD and F_SETFD operations
to set the underlying filesystem into 32bit mode even if the
file handle was opened using 64bit mode without the compat
syscalls.

Programs that need the 32 bit file system behavior need to
issue a fcntl() system call such as in this example:

  #define FD_32BIT_MODE 2

  int main(int argc, char** argv) {
    DIR* dir;
    int err;
    int mode;
    int fd;

    dir = opendir("/boot");
    fd = dirfd(dir);
    mode = fcntl(fd, F_GETFD);
    mode |= FD_32BIT_MODE;
    err = fcntl(fd, F_SETFD, mode);
    if (err) {
      printf("fcntl() failed! err=%d\n", err);
      return 1;
    }
    printf("dir=%p\n", dir);
    printf("readdir(dir)=%p\n", readdir(dir));
    printf("errno=%d: %s\n", errno, strerror(errno));
    return 0;
  }

This can be pretty hard to test since C libraries and linux
userspace security extensions aggressively filter the parameters
that are passed down and allowed to commit into actual system
calls.

Cc: Florian Weimer <fw@deneb.enyo.de>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Eric Blake <eblake@redhat.com>
Reported-by: 罗勇刚(Yonggang Luo) <luoyonggang@gmail.com>
Suggested-by: Theodore Ts'o <tytso@mit.edu>
Link: https://bugs.launchpad.net/qemu/+bug/1805913
Link: https://lore.kernel.org/lkml/87bm56vqg4.fsf@mid.deneb.enyo.de/
Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=205957
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v3 RESEND 1-> v4:
- Update the example in the commit message to a read/modify/write
  version.
- Notice that Yonggang Luo sees the sema problem on i386 binaries
  as we see on ARM 32bit binaries.
ChangeLog v3->v3 RESEND 1:
- Resending during the v5.10 merge window to get attention.
ChangeLog v2->v3:
- Realized that I also have to clear the flag correspondingly
  if someone ask for !FD_32BIT_MODE after setting it the
  first time.
ChangeLog v1->v2:
- Use a new flag FD_32BIT_MODE to F_GETFD and F_SETFD
  instead of a new fcntl operation, there is already a fcntl
  operation to set random flags.
- Sorry for taking forever to respin this patch :(
---
 fs/fcntl.c                       | 7 +++++++
 include/uapi/asm-generic/fcntl.h | 8 ++++++++
 2 files changed, 15 insertions(+)

diff --git a/fs/fcntl.c b/fs/fcntl.c
index 19ac5baad50f..6c32edc4099a 100644
--- a/fs/fcntl.c
+++ b/fs/fcntl.c
@@ -335,10 +335,17 @@ static long do_fcntl(int fd, unsigned int cmd, unsigned long arg,
 		break;
 	case F_GETFD:
 		err = get_close_on_exec(fd) ? FD_CLOEXEC : 0;
+		/* Report 32bit file system mode */
+		if (filp->f_mode & FMODE_32BITHASH)
+			err |= FD_32BIT_MODE;
 		break;
 	case F_SETFD:
 		err = 0;
 		set_close_on_exec(fd, arg & FD_CLOEXEC);
+		if (arg & FD_32BIT_MODE)
+			filp->f_mode |= FMODE_32BITHASH;
+		else
+			filp->f_mode &= ~FMODE_32BITHASH;
 		break;
 	case F_GETFL:
 		err = filp->f_flags;
diff --git a/include/uapi/asm-generic/fcntl.h b/include/uapi/asm-generic/fcntl.h
index 9dc0bf0c5a6e..edd3573cb7ef 100644
--- a/include/uapi/asm-generic/fcntl.h
+++ b/include/uapi/asm-generic/fcntl.h
@@ -160,6 +160,14 @@ struct f_owner_ex {
 
 /* for F_[GET|SET]FL */
 #define FD_CLOEXEC	1	/* actually anything with low bit set goes */
+/*
+ * This instructs the kernel to provide 32bit semantics (such as hashes) from
+ * the file system layer, when running a userland that depend on 32bit
+ * semantics on a kernel that supports 64bit userland, but does not use the
+ * compat ioctl() for e.g. open(), so that the kernel would otherwise assume
+ * that the userland process is capable of dealing with 64bit semantics.
+ */
+#define FD_32BIT_MODE	2
 
 /* for posix fcntl() and lockf() */
 #ifndef F_RDLCK
-- 
2.26.2


