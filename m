Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBEA50E369
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 16:36:51 +0200 (CEST)
Received: from localhost ([::1]:59004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nizpa-0005sX-7W
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 10:36:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nizgO-0006Sk-F8
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 10:27:20 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:34527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nizgM-0004ha-RD
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 10:27:20 -0400
Received: by mail-pg1-x52c.google.com with SMTP id z21so5919933pgj.1
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 07:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=t9wxe2NnzThJXmH701I7MFDWCA+taSH4hJNR9Xh8jHE=;
 b=E0SNec/PfBpADb6q0GdLmI7FqFdqdqcQqUO7+j+LaPshUKYShmm0auVBjpDE1n+KpE
 bte09l2coi0gbuj0LYszp2LvJYCrtsazictokF7FRKqyvFk0sKPGiGrmasGe4spJ8x2C
 PSbhtcj4X/WcfyJ0kGgA6F+uyAx3KBlXJbcWlxnLPNax75ozURbCTVmcwpaMn24HjTzn
 dmMbYsF45SZD2jMzhQLJ1q2ifUd+xFZxZFxwIVfq7HQqHWqmRnIK9gwNFUQxnVLlj2qX
 L1D9nDh6fMWCUSyW+efpfVvDFVeZXaAYB+P36VHeSzzVf8cZ5MVRduKrjIBBhVaLclz1
 LLJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t9wxe2NnzThJXmH701I7MFDWCA+taSH4hJNR9Xh8jHE=;
 b=SyJeXxbeCQ1GezsnreZFjK2xkY5/GiMbTJzEVErZVv35jwAhPq+4OduB8Ru6XV0CPk
 QThgsqz14QxpYKtXzxJyDsoCaCuzgf6C/bnjh1J4cPG2FQnpMb0ZHl1+1Nr0rZfvtObx
 vVPtTAoe+3DuYtJL56+hwl9uUqDIbET6HeFC+R9Z9RYbV0nazFMzy9J+VbTc5ddZKAZ6
 di2ZD9nfBMatrZYmJIgXAY8J63efVzCHqDbZ9VG+3jKGIxoRYMBNol4K2hwuClJxw7Nl
 cfDqE/3v0o8sWDg3h+Z19C1sJFTHyQvBF3lGfhjSQoU2PsnDyP6B3HVrsVluZbEhk0ua
 9sTg==
X-Gm-Message-State: AOAM533ChzOp9xyD8CXCXgf6w1NsTheF5ceHGT6glkQqNClnCQ0+ejJU
 wmMnZczftE5IvoVQaJQErywcWZ5kJBI=
X-Google-Smtp-Source: ABdhPJxJ2pl37kQWuiEBGuc9Nb7qdu4lBNVHGvXuUMd7IsVTKDiNJRg+zCK6t+LpJhMYn0bMEyT7dA==
X-Received: by 2002:a63:88c3:0:b0:3ab:2edc:b95b with SMTP id
 l186-20020a6388c3000000b003ab2edcb95bmr5355015pgd.233.1650896837626; 
 Mon, 25 Apr 2022 07:27:17 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com (unknown-176-192.windriver.com.
 [147.11.176.192]) by smtp.gmail.com with ESMTPSA id
 t1-20020a628101000000b0050d47199857sm2437968pfd.73.2022.04.25.07.27.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 07:27:17 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org
Subject: [PATCH 1/9] hw/9pfs: Compile 9p-local.c and 9p-proxy.c for Linux and
 macOS
Date: Mon, 25 Apr 2022 22:26:57 +0800
Message-Id: <20220425142705.2099270-2-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220425142705.2099270-1-bmeng.cn@gmail.com>
References: <20220425142705.2099270-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Bin Meng <bin.meng@windriver.com>, Guohuai Shi <guohuai.shi@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

For better readability, Windows support of 9pfs local backend driver
will be provided in a separate 9p-local-win32.c file, hence let's
only compile 9p-local.c for Linux and macOS.

As we don't plan to support 9p proxy on Windows, apply the same to
9p-proxy.c.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/9pfs/meson.build | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/hw/9pfs/meson.build b/hw/9pfs/meson.build
index 12443b6ad5..b4a8ff0913 100644
--- a/hw/9pfs/meson.build
+++ b/hw/9pfs/meson.build
@@ -1,8 +1,6 @@
 fs_ss = ss.source_set()
 fs_ss.add(files(
-  '9p-local.c',
   '9p-posix-acl.c',
-  '9p-proxy.c',
   '9p-synth.c',
   '9p-xattr-user.c',
   '9p-xattr.c',
@@ -13,8 +11,12 @@ fs_ss.add(files(
   'coth.c',
   'coxattr.c',
 ))
-fs_ss.add(when: 'CONFIG_LINUX', if_true: files('9p-util-linux.c'))
-fs_ss.add(when: 'CONFIG_DARWIN', if_true: files('9p-util-darwin.c'))
+fs_ss.add(when: 'CONFIG_LINUX', if_true: files('9p-local.c',
+                                               '9p-proxy.c',
+                                               '9p-util-linux.c'))
+fs_ss.add(when: 'CONFIG_DARWIN', if_true: files('9p-local.c',
+                                                '9p-proxy.c',
+                                                '9p-util-darwin.c'))
 fs_ss.add(when: 'CONFIG_XEN', if_true: files('xen-9p-backend.c'))
 softmmu_ss.add_all(when: 'CONFIG_FSDEV_9P', if_true: fs_ss)
 
-- 
2.25.1


