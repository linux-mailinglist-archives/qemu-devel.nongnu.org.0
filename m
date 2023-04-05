Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8C46D89B4
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 23:38:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkAoG-0005OE-Ez; Wed, 05 Apr 2023 17:36:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pkAo0-0005If-Q6
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 17:36:38 -0400
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pkAnz-0005bD-3P
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 17:36:36 -0400
Received: by mail-il1-x12c.google.com with SMTP id j6so19497857ilr.7
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 14:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112; t=1680730593;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6KgNQN5pzVZc5GjTmUd6jps4RQccUnKb+ZsxjaSjC8s=;
 b=gD9OWsTOC1nd5QXZtD0kLF0DSdgKERYA8F/I318xIhg6HsD0Q54YsM1RbMd5hJAozK
 SHyzRdFOATzsI32USBJ60N8cxB3Zp3Bhe/cW0ISSSdK36nzPI5yVj4pGqAjcILJ048hr
 U9tOtDyrOOAy9NTTEXtQctOns9x4LkK1vl4brjjq5s/BDI5i2RePgnkxd1YviYQ67NnC
 DwTbdkBkVXuUAPa1jlv397ugR1PvBD6qa5u68IWOUAPlRtOzE2GKZe8toOUWITZOVtnY
 5J3HDPMYX9gu7DArOhpJO55EAH+KyGJMhqGqYrQz5mQHxRN43Mahz2EylilM2bs0O5UC
 85nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680730593;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6KgNQN5pzVZc5GjTmUd6jps4RQccUnKb+ZsxjaSjC8s=;
 b=kNncCXYPduhTbn9WgX/mfuO1QvAH6UbnXLVmRzQ8Qdl5zU96ngYPqsrlXxqLukfDZX
 L31VIArX7MvF6DrUR+anKzaQlsklgvUGFsWbSRzoim752zmKkJwri6/J3tb6BETYuRPM
 BLA88viRcj95CxG2P2C1oe+DjaF5vvkX/Z9XaSPNN5FVPIrTAzAeEWreStjaG0mhSfA2
 CWEpETgeu1R35pjx7+ohJLQM2eynARibTSU28lIEM+/d87xhAir/uoUQisrbWhx/GYy6
 OwqynaVepVUN9AR7sG7bhiIop7YbD9L5I3r7yMsA23D5Im1hEOYfh7ibKFhTWxDVq+CO
 k++Q==
X-Gm-Message-State: AAQBX9e5msVanw0qvyi0YJ1EfO3JdsEmbQWG+Msg4Sli0aScOkn05/05
 eUXrmyQHS9SUeO4q47kPvc4mxuH3gCdh0NwlFB8=
X-Google-Smtp-Source: AKy350ZbM1bpsnUO7CEwEsnxBncPt2jX8jViLXO6KTmll9MYKuMq7lulsfv+CRN0DPJ3f7gLBDFkGA==
X-Received: by 2002:a92:605:0:b0:325:cf1a:34c6 with SMTP id
 x5-20020a920605000000b00325cf1a34c6mr5910473ilg.19.1680730593309; 
 Wed, 05 Apr 2023 14:36:33 -0700 (PDT)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 i18-20020a926d12000000b003261b6acc8asm4110473ilc.79.2023.04.05.14.36.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 14:36:32 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: reinoud@netbsd.org, riastradh@netbsd.org, ryoon@netbsd.org,
 jrtc27@jrtc27.com, Warner Losh <imp@bsdimp.com>, kevans@freebsd.org,
 Brad Smith <brad@comstyle.com>
Subject: [PATCH 08/16] bsd-user: Remove useless mmap definitions
Date: Wed,  5 Apr 2023 15:36:04 -0600
Message-Id: <20230405213612.15942-9-imp@bsdimp.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230405213612.15942-1-imp@bsdimp.com>
References: <20230405213612.15942-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12c;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On BSD, all architectures have the same mmap flags. Since we don't
translate the flags, we don't need these defines here. We can't
cross-run different BSD binaries.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/syscall_defs.h | 36 ------------------------------------
 1 file changed, 36 deletions(-)

diff --git a/bsd-user/syscall_defs.h b/bsd-user/syscall_defs.h
index 489d3a2e292..0604e96973e 100644
--- a/bsd-user/syscall_defs.h
+++ b/bsd-user/syscall_defs.h
@@ -32,42 +32,6 @@ struct target_iovec {
     abi_long iov_len;   /* Number of bytes */
 };
 
-/*
- *  sys/mman.h
- */
-#define TARGET_FREEBSD_MAP_RESERVED0080 0x0080  /* previously misimplemented */
-                                                /* MAP_INHERIT */
-#define TARGET_FREEBSD_MAP_RESERVED0100 0x0100  /* previously unimplemented */
-                                                /* MAP_NOEXTEND */
-#define TARGET_FREEBSD_MAP_STACK        0x0400  /* region grows down, like a */
-                                                /* stack */
-#define TARGET_FREEBSD_MAP_NOSYNC       0x0800  /* page to but do not sync */
-                                                /* underlying file */
-
-#define TARGET_FREEBSD_MAP_FLAGMASK     0x1ff7
-
-#define TARGET_NETBSD_MAP_INHERIT       0x0080  /* region is retained after */
-                                                /* exec */
-#define TARGET_NETBSD_MAP_TRYFIXED      0x0400  /* attempt hint address, even */
-                                                /* within break */
-#define TARGET_NETBSD_MAP_WIRED         0x0800  /* mlock() mapping when it is */
-                                                /* established */
-
-#define TARGET_NETBSD_MAP_STACK         0x2000  /* allocated from memory, */
-                                                /* swap space (stack) */
-
-#define TARGET_NETBSD_MAP_FLAGMASK      0x3ff7
-
-#define TARGET_OPENBSD_MAP_INHERIT      0x0080  /* region is retained after */
-                                                /* exec */
-#define TARGET_OPENBSD_MAP_NOEXTEND     0x0100  /* for MAP_FILE, don't change */
-                                                /* file size */
-#define TARGET_OPENBSD_MAP_TRYFIXED     0x0400  /* attempt hint address, */
-                                                /* even within heap */
-
-#define TARGET_OPENBSD_MAP_FLAGMASK     0x17f7
-
-/* XXX */
 #define TARGET_BSD_MAP_FLAGMASK         0x3ff7
 
 /*
-- 
2.40.0


