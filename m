Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 908C26DE1F9
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 19:12:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmHWQ-00044l-Qn; Tue, 11 Apr 2023 13:11:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pmHVs-0003qY-6I
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 13:10:37 -0400
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pmHVo-00068X-LU
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 13:10:34 -0400
Received: by mail-il1-x12b.google.com with SMTP id j28so3888103ila.0
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 10:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112; t=1681233030;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p/770m3m0UuWja7n7zJRMdkcuTqSX6pSDmKn7o3gni8=;
 b=bf76Dq0gYUvTKu88rdQfkSFy+gzHq0G7mXgiuJbhl1kyk62vFSV4K7poQ4I8A9xhbD
 c/D1zuWxTlMXng2kD2ktR0/0VEzPbcxMKnu2AyOI7xCzRwTQSL/3VC1zgbWfb1vmrjGw
 wznKv20LxGBLG1lr9LixJCn6M5WLJiHxFaBkvAE8okGHHZb4UDx3vDGHjhRVi7/73fuk
 Zc3366McqGQbubmYkDGv7wx+DZovvBGT9ygoRDSAfZNBtiS6id3cZokvZomecdtoXzaa
 pRUI7Iiao8t3GdH3S8bocuzKVja3Cu0IYM8tgsSrhIdfthw2nfPDnEouv+vqV0SWXiOH
 FKqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681233030;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p/770m3m0UuWja7n7zJRMdkcuTqSX6pSDmKn7o3gni8=;
 b=QLd1Betl3tLwhUk2+K+wjT/uAMwmmDKy7hsr2MhPu/Zuyv90WYVn6Og4MN6JZ+uA7G
 W8Y4d1Id0QyBoYouYXEVF9d4M2HeLiztVv8uwwE6KEhk+A0YwTei9QcnAr4IhtJZZCM0
 WwacECSZWH5KbxID2B4daXre0BdVxQNTdNH2UZcQ7Jd5DyQTV/HHItgfgUMxHaNk1AqV
 9R2FxHzqMwQf5dIvKBzvL3JLQIwua/uZJXbfqicqYXu5yTrc6u7nEb7R1vKJKKfM/t+R
 fNPxokuO02SYZBGjnQOiDlc/3oiYS/9AmF0nn+wuQdyW6XfR+pHbyp0tDDgoR36wXZ6b
 Hd+w==
X-Gm-Message-State: AAQBX9egWnJtNYO9n3kprr0//SAG1ZI4y9TMNAjajjoci6yfJAqUuHTX
 ScEjfhUGJGyGS+0Kh6Tw1sOqDaov7urC+GDaBBA=
X-Google-Smtp-Source: AKy350bweKwr443Ot70W1rzL2U2o5mG/F0EZ/Lb1KnK1lRENHwPF9sf8TEHpq/rISXi/gvF+OR0YQQ==
X-Received: by 2002:a05:6e02:1d1d:b0:325:f703:6e5e with SMTP id
 i29-20020a056e021d1d00b00325f7036e5emr15433230ila.11.1681233030528; 
 Tue, 11 Apr 2023 10:10:30 -0700 (PDT)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 d36-20020a0285a7000000b0040b11b7ef54sm4140942jai.39.2023.04.11.10.10.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 10:10:30 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: ryoon@netbsd.org, kevans@freebsd.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, riastradh@netbsd.org, brad@comstyle.com,
 reinoud@netbsd.org, jrtc27@jrtc27.com,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Warner Losh <imp@bsdimp.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 08/20] bsd-user: Remove useless mmap definitions
Date: Tue, 11 Apr 2023 11:09:43 -0600
Message-Id: <20230411170955.17358-9-imp@bsdimp.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230411170955.17358-1-imp@bsdimp.com>
References: <20230411170955.17358-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12b;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12b.google.com
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


