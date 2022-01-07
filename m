Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6EEA4871C3
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 05:32:33 +0100 (CET)
Received: from localhost ([::1]:49890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5gvY-0001Ce-Gj
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 23:32:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5gpM-000499-Vs
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 23:26:09 -0500
Received: from [2607:f8b0:4864:20::62f] (port=42646
 helo=mail-pl1-x62f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5gpI-0005Pm-82
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 23:26:08 -0500
Received: by mail-pl1-x62f.google.com with SMTP id u16so3974442plg.9
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 20:26:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8ZMgZma7y3Y5aemv0S5ckK//EPzY+ql8sNS6qdMb/To=;
 b=pGGNXVhuqFXDcgJouLuGpyr2MLiAXsZqG75WdUWNhy5qAakIup1nLgGhmTXX8FYrCI
 36plHZtgBIDq0d1HV7Q6a1ekopN/gQ7Yq08ahDw9isPOQdoMfzDT3s1Vgzg++Mtpn0PL
 dZyqUehr+tAgIYCg4V8E0y77s4AYVtOMbhnLogETkYLIqDXbhZe+H1DQppzToetbPXyW
 4uJXgwGj0896JC1fxUjunK33lSRC43AhbH6aPqm2jZgfges1zVZ1D6o+eCNUJer/Agcr
 Jei4aiQDQPP0PGZ5EZv1lL5J2fXacqa4EWHR1xCkJMy7tnJKFUOBxOzID6z1H6rdtxzy
 17Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8ZMgZma7y3Y5aemv0S5ckK//EPzY+ql8sNS6qdMb/To=;
 b=jFeQNKSFkNWKOMbRn62N5UQ3BKA8XSEUy/P9SOkxgyiEJia5Wl16/TaMeSamjADV9L
 wxFE28T5zGs2Q8GNfOTEGv5ynSHmRcfhHLvVw4eKg5liZ80W5C1h1xBxJN7PP+Y4ajK8
 5e9h55WUWhO9d/gT6YsMgPLKMavqE/Shs8zZnp5bQj5HIO8w7b9XeiL40I5ElSuNv5d2
 bs0uFDO/4l65xwlYeTTFZH7bbFrlkhI5CZ5SPsGAcfx2BInqVaIlqf4vwtJnrcDpzuDX
 Y5hw+ENp4kFz5KMDNCaCQE6bbdIhUu1O7F5h0DIBg5SiZ1aKQjwkV5s90PotuGhhTdWv
 pxgQ==
X-Gm-Message-State: AOAM531fr1nctbr5RC/zvbxN8mbRbi2QN0BIw9Hx7/Eczp5kbPPlTqNK
 cf39tSzvtHgrL+Lwng6Nt5i0iJSUJjg83w==
X-Google-Smtp-Source: ABdhPJyJWqcdcUtHwyBGZd9CD+B4BmPAMmnBlGSxr/6CNhjuEJHnqQ4TeRAipbXnU3E5jOjYOCnXCA==
X-Received: by 2002:a17:90b:180e:: with SMTP id
 lw14mr13848611pjb.179.1641529562678; 
 Thu, 06 Jan 2022 20:26:02 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id e4sm1396862pjr.40.2022.01.06.20.26.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 20:26:02 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] linux-user: Move target_struct.h generic definitions to
 generic/
Date: Thu,  6 Jan 2022 20:26:00 -0800
Message-Id: <20220107042600.149852-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220107042600.149852-1-richard.henderson@linaro.org>
References: <20220107042600.149852-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: gaosong@loongson.cn, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Most targets share the same generic ipc structure definitions.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/target_structs.h    | 59 +-------------------------
 linux-user/arm/target_structs.h        | 52 +----------------------
 linux-user/cris/target_structs.h       | 59 +-------------------------
 linux-user/generic/target_structs.h    | 58 +++++++++++++++++++++++++
 linux-user/hexagon/target_structs.h    | 55 +-----------------------
 linux-user/i386/target_structs.h       | 59 +-------------------------
 linux-user/m68k/target_structs.h       | 59 +-------------------------
 linux-user/microblaze/target_structs.h | 59 +-------------------------
 linux-user/nios2/target_structs.h      | 59 +-------------------------
 linux-user/openrisc/target_structs.h   | 59 +-------------------------
 linux-user/riscv/target_structs.h      | 47 +-------------------
 linux-user/sh4/target_structs.h        | 59 +-------------------------
 linux-user/x86_64/target_structs.h     | 36 +---------------
 13 files changed, 70 insertions(+), 650 deletions(-)
 create mode 100644 linux-user/generic/target_structs.h

diff --git a/linux-user/aarch64/target_structs.h b/linux-user/aarch64/target_structs.h
index 7c748344ca..3a06f373c3 100644
--- a/linux-user/aarch64/target_structs.h
+++ b/linux-user/aarch64/target_structs.h
@@ -1,58 +1 @@
-/*
- * ARM AArch64 specific structures for linux-user
- *
- * Copyright (c) 2013 Fabrice Bellard
- *
- * This library is free software; you can redistribute it and/or
- * modify it under the terms of the GNU Lesser General Public
- * License as published by the Free Software Foundation; either
- * version 2.1 of the License, or (at your option) any later version.
- *
- * This library is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * Lesser General Public License for more details.
- *
- * You should have received a copy of the GNU Lesser General Public
- * License along with this library; if not, see <http://www.gnu.org/licenses/>.
- */
-#ifndef AARCH64_TARGET_STRUCTS_H
-#define AARCH64_TARGET_STRUCTS_H
-
-struct target_ipc_perm {
-    abi_int __key;                      /* Key.  */
-    abi_uint uid;                       /* Owner's user ID.  */
-    abi_uint gid;                       /* Owner's group ID.  */
-    abi_uint cuid;                      /* Creator's user ID.  */
-    abi_uint cgid;                      /* Creator's group ID.  */
-    abi_ushort mode;                    /* Read/write permission.  */
-    abi_ushort __pad1;
-    abi_ushort __seq;                   /* Sequence number.  */
-    abi_ushort __pad2;
-    abi_ulong __unused1;
-    abi_ulong __unused2;
-};
-
-struct target_shmid_ds {
-    struct target_ipc_perm shm_perm;    /* operation permission struct */
-    abi_long shm_segsz;                 /* size of segment in bytes */
-    abi_ulong shm_atime;                /* time of last shmat() */
-#if TARGET_ABI_BITS == 32
-    abi_ulong __unused1;
-#endif
-    abi_ulong shm_dtime;                /* time of last shmdt() */
-#if TARGET_ABI_BITS == 32
-    abi_ulong __unused2;
-#endif
-    abi_ulong shm_ctime;                /* time of last change by shmctl() */
-#if TARGET_ABI_BITS == 32
-    abi_ulong __unused3;
-#endif
-    abi_int shm_cpid;                   /* pid of creator */
-    abi_int shm_lpid;                   /* pid of last shmop */
-    abi_ulong shm_nattch;               /* number of current attaches */
-    abi_ulong __unused4;
-    abi_ulong __unused5;
-};
-
-#endif
+#include "../generic/target_structs.h"
diff --git a/linux-user/arm/target_structs.h b/linux-user/arm/target_structs.h
index 25bf8dd3a5..3a06f373c3 100644
--- a/linux-user/arm/target_structs.h
+++ b/linux-user/arm/target_structs.h
@@ -1,51 +1 @@
-/*
- * ARM specific structures for linux-user
- *
- * Copyright (c) 2013 Fabrice Bellard
- *
- * This library is free software; you can redistribute it and/or
- * modify it under the terms of the GNU Lesser General Public
- * License as published by the Free Software Foundation; either
- * version 2.1 of the License, or (at your option) any later version.
- *
- * This library is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * Lesser General Public License for more details.
- *
- * You should have received a copy of the GNU Lesser General Public
- * License along with this library; if not, see <http://www.gnu.org/licenses/>.
- */
-#ifndef ARM_TARGET_STRUCTS_H
-#define ARM_TARGET_STRUCTS_H
-
-struct target_ipc_perm {
-    abi_int __key;                      /* Key.  */
-    abi_uint uid;                       /* Owner's user ID.  */
-    abi_uint gid;                       /* Owner's group ID.  */
-    abi_uint cuid;                      /* Creator's user ID.  */
-    abi_uint cgid;                      /* Creator's group ID.  */
-    abi_ushort mode;                    /* Read/write permission.  */
-    abi_ushort __pad1;
-    abi_ushort __seq;                   /* Sequence number.  */
-    abi_ushort __pad2;
-    abi_ulong __unused1;
-    abi_ulong __unused2;
-};
-
-struct target_shmid_ds {
-    struct target_ipc_perm shm_perm;    /* operation permission struct */
-    abi_long shm_segsz;                 /* size of segment in bytes */
-    abi_ulong shm_atime;                /* time of last shmat() */
-    abi_ulong __unused1;
-    abi_ulong shm_dtime;                /* time of last shmdt() */
-    abi_ulong __unused2;
-    abi_ulong shm_ctime;                /* time of last change by shmctl() */
-    abi_ulong __unused3;
-    abi_int shm_cpid;                   /* pid of creator */
-    abi_int shm_lpid;                   /* pid of last shmop */
-    abi_ulong shm_nattch;               /* number of current attaches */
-    abi_ulong __unused4;
-    abi_ulong __unused5;
-};
-#endif
+#include "../generic/target_structs.h"
diff --git a/linux-user/cris/target_structs.h b/linux-user/cris/target_structs.h
index f949d2331e..3a06f373c3 100644
--- a/linux-user/cris/target_structs.h
+++ b/linux-user/cris/target_structs.h
@@ -1,58 +1 @@
-/*
- * CRIS specific structures for linux-user
- *
- * Copyright (c) 2013 Fabrice Bellard
- *
- * This library is free software; you can redistribute it and/or
- * modify it under the terms of the GNU Lesser General Public
- * License as published by the Free Software Foundation; either
- * version 2.1 of the License, or (at your option) any later version.
- *
- * This library is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * Lesser General Public License for more details.
- *
- * You should have received a copy of the GNU Lesser General Public
- * License along with this library; if not, see <http://www.gnu.org/licenses/>.
- */
-#ifndef CRIS_TARGET_STRUCTS_H
-#define CRIS_TARGET_STRUCTS_H
-
-struct target_ipc_perm {
-    abi_int __key;                      /* Key.  */
-    abi_uint uid;                       /* Owner's user ID.  */
-    abi_uint gid;                       /* Owner's group ID.  */
-    abi_uint cuid;                      /* Creator's user ID.  */
-    abi_uint cgid;                      /* Creator's group ID.  */
-    abi_ushort mode;                    /* Read/write permission.  */
-    abi_ushort __pad1;
-    abi_ushort __seq;                   /* Sequence number.  */
-    abi_ushort __pad2;
-    abi_ulong __unused1;
-    abi_ulong __unused2;
-};
-
-struct target_shmid_ds {
-    struct target_ipc_perm shm_perm;    /* operation permission struct */
-    abi_long shm_segsz;                 /* size of segment in bytes */
-    abi_ulong shm_atime;                /* time of last shmat() */
-#if TARGET_ABI_BITS == 32
-    abi_ulong __unused1;
-#endif
-    abi_ulong shm_dtime;                /* time of last shmdt() */
-#if TARGET_ABI_BITS == 32
-    abi_ulong __unused2;
-#endif
-    abi_ulong shm_ctime;                /* time of last change by shmctl() */
-#if TARGET_ABI_BITS == 32
-    abi_ulong __unused3;
-#endif
-    abi_int shm_cpid;                   /* pid of creator */
-    abi_int shm_lpid;                   /* pid of last shmop */
-    abi_ulong shm_nattch;               /* number of current attaches */
-    abi_ulong __unused4;
-    abi_ulong __unused5;
-};
-
-#endif
+#include "../generic/target_structs.h"
diff --git a/linux-user/generic/target_structs.h b/linux-user/generic/target_structs.h
new file mode 100644
index 0000000000..09ff858b6e
--- /dev/null
+++ b/linux-user/generic/target_structs.h
@@ -0,0 +1,58 @@
+/*
+ * Generic structures for linux-user
+ *
+ * Copyright (c) 2013 Fabrice Bellard
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+#ifndef GENERIC_TARGET_STRUCTS_H
+#define GENERIC_TARGET_STRUCTS_H
+
+struct target_ipc_perm {
+    abi_int __key;                      /* Key.  */
+    abi_uint uid;                       /* Owner's user ID.  */
+    abi_uint gid;                       /* Owner's group ID.  */
+    abi_uint cuid;                      /* Creator's user ID.  */
+    abi_uint cgid;                      /* Creator's group ID.  */
+    abi_ushort mode;                    /* Read/write permission.  */
+    abi_ushort __pad1;
+    abi_ushort __seq;                   /* Sequence number.  */
+    abi_ushort __pad2;
+    abi_ulong __unused1;
+    abi_ulong __unused2;
+};
+
+struct target_shmid_ds {
+    struct target_ipc_perm shm_perm;    /* operation permission struct */
+    abi_long shm_segsz;                 /* size of segment in bytes */
+    abi_ulong shm_atime;                /* time of last shmat() */
+#if TARGET_ABI_BITS == 32
+    abi_ulong __unused1;
+#endif
+    abi_ulong shm_dtime;                /* time of last shmdt() */
+#if TARGET_ABI_BITS == 32
+    abi_ulong __unused2;
+#endif
+    abi_ulong shm_ctime;                /* time of last change by shmctl() */
+#if TARGET_ABI_BITS == 32
+    abi_ulong __unused3;
+#endif
+    abi_int shm_cpid;                   /* pid of creator */
+    abi_int shm_lpid;                   /* pid of last shmop */
+    abi_ulong shm_nattch;               /* number of current attaches */
+    abi_ulong __unused4;
+    abi_ulong __unused5;
+};
+
+#endif
diff --git a/linux-user/hexagon/target_structs.h b/linux-user/hexagon/target_structs.h
index c217d9442a..3a06f373c3 100644
--- a/linux-user/hexagon/target_structs.h
+++ b/linux-user/hexagon/target_structs.h
@@ -1,54 +1 @@
-/*
- *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
- *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License as published by
- *  the Free Software Foundation; either version 2 of the License, or
- *  (at your option) any later version.
- *
- *  This program is distributed in the hope that it will be useful,
- *  but WITHOUT ANY WARRANTY; without even the implied warranty of
- *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *  GNU General Public License for more details.
- *
- *  You should have received a copy of the GNU General Public License
- *  along with this program; if not, see <http://www.gnu.org/licenses/>.
- */
-
-/*
- * Hexagon specific structures for linux-user
- */
-#ifndef HEXAGON_TARGET_STRUCTS_H
-#define HEXAGON_TARGET_STRUCTS_H
-
-struct target_ipc_perm {
-    abi_int __key;                      /* Key.  */
-    abi_uint uid;                       /* Owner's user ID.  */
-    abi_uint gid;                       /* Owner's group ID.  */
-    abi_uint cuid;                      /* Creator's user ID.  */
-    abi_uint cgid;                      /* Creator's group ID.  */
-    abi_ushort mode;                    /* Read/write permission.  */
-    abi_ushort __pad1;
-    abi_ushort __seq;                   /* Sequence number.  */
-    abi_ushort __pad2;
-    abi_ulong __unused1;
-    abi_ulong __unused2;
-};
-
-struct target_shmid_ds {
-    struct target_ipc_perm shm_perm;    /* operation permission struct */
-    abi_long shm_segsz;                 /* size of segment in bytes */
-    abi_ulong shm_atime;                /* time of last shmat() */
-    abi_ulong __unused1;
-    abi_ulong shm_dtime;                /* time of last shmdt() */
-    abi_ulong __unused2;
-    abi_ulong shm_ctime;                /* time of last change by shmctl() */
-    abi_ulong __unused3;
-    abi_int shm_cpid;                   /* pid of creator */
-    abi_int shm_lpid;                   /* pid of last shmop */
-    abi_ulong shm_nattch;               /* number of current attaches */
-    abi_ulong __unused4;
-    abi_ulong __unused5;
-};
-
-#endif
+#include "../generic/target_structs.h"
diff --git a/linux-user/i386/target_structs.h b/linux-user/i386/target_structs.h
index e22847fd20..3a06f373c3 100644
--- a/linux-user/i386/target_structs.h
+++ b/linux-user/i386/target_structs.h
@@ -1,58 +1 @@
-/*
- * i386 specific structures for linux-user
- *
- * Copyright (c) 2013 Fabrice Bellard
- *
- * This library is free software; you can redistribute it and/or
- * modify it under the terms of the GNU Lesser General Public
- * License as published by the Free Software Foundation; either
- * version 2.1 of the License, or (at your option) any later version.
- *
- * This library is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * Lesser General Public License for more details.
- *
- * You should have received a copy of the GNU Lesser General Public
- * License along with this library; if not, see <http://www.gnu.org/licenses/>.
- */
-#ifndef I386_TARGET_STRUCTS_H
-#define I386_TARGET_STRUCTS_H
-
-struct target_ipc_perm {
-    abi_int __key;                      /* Key.  */
-    abi_uint uid;                       /* Owner's user ID.  */
-    abi_uint gid;                       /* Owner's group ID.  */
-    abi_uint cuid;                      /* Creator's user ID.  */
-    abi_uint cgid;                      /* Creator's group ID.  */
-    abi_ushort mode;                    /* Read/write permission.  */
-    abi_ushort __pad1;
-    abi_ushort __seq;                   /* Sequence number.  */
-    abi_ushort __pad2;
-    abi_ulong __unused1;
-    abi_ulong __unused2;
-};
-
-struct target_shmid_ds {
-    struct target_ipc_perm shm_perm;    /* operation permission struct */
-    abi_long shm_segsz;                 /* size of segment in bytes */
-    abi_ulong shm_atime;                /* time of last shmat() */
-#if TARGET_ABI_BITS == 32
-    abi_ulong __unused1;
-#endif
-    abi_ulong shm_dtime;                /* time of last shmdt() */
-#if TARGET_ABI_BITS == 32
-    abi_ulong __unused2;
-#endif
-    abi_ulong shm_ctime;                /* time of last change by shmctl() */
-#if TARGET_ABI_BITS == 32
-    abi_ulong __unused3;
-#endif
-    abi_int shm_cpid;                   /* pid of creator */
-    abi_int shm_lpid;                   /* pid of last shmop */
-    abi_ulong shm_nattch;               /* number of current attaches */
-    abi_ulong __unused4;
-    abi_ulong __unused5;
-};
-
-#endif
+#include "../generic/target_structs.h"
diff --git a/linux-user/m68k/target_structs.h b/linux-user/m68k/target_structs.h
index e373d481e1..3a06f373c3 100644
--- a/linux-user/m68k/target_structs.h
+++ b/linux-user/m68k/target_structs.h
@@ -1,58 +1 @@
-/*
- * m68k specific structures for linux-user
- *
- * Copyright (c) 2013 Fabrice Bellard
- *
- * This library is free software; you can redistribute it and/or
- * modify it under the terms of the GNU Lesser General Public
- * License as published by the Free Software Foundation; either
- * version 2.1 of the License, or (at your option) any later version.
- *
- * This library is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * Lesser General Public License for more details.
- *
- * You should have received a copy of the GNU Lesser General Public
- * License along with this library; if not, see <http://www.gnu.org/licenses/>.
- */
-#ifndef M68K_TARGET_STRUCTS_H
-#define M68K_TARGET_STRUCTS_H
-
-struct target_ipc_perm {
-    abi_int __key;                      /* Key.  */
-    abi_uint uid;                       /* Owner's user ID.  */
-    abi_uint gid;                       /* Owner's group ID.  */
-    abi_uint cuid;                      /* Creator's user ID.  */
-    abi_uint cgid;                      /* Creator's group ID.  */
-    abi_ushort mode;                    /* Read/write permission.  */
-    abi_ushort __pad1;
-    abi_ushort __seq;                   /* Sequence number.  */
-    abi_ushort __pad2;
-    abi_ulong __unused1;
-    abi_ulong __unused2;
-};
-
-struct target_shmid_ds {
-    struct target_ipc_perm shm_perm;    /* operation permission struct */
-    abi_long shm_segsz;                 /* size of segment in bytes */
-    abi_ulong shm_atime;                /* time of last shmat() */
-#if TARGET_ABI_BITS == 32
-    abi_ulong __unused1;
-#endif
-    abi_ulong shm_dtime;                /* time of last shmdt() */
-#if TARGET_ABI_BITS == 32
-    abi_ulong __unused2;
-#endif
-    abi_ulong shm_ctime;                /* time of last change by shmctl() */
-#if TARGET_ABI_BITS == 32
-    abi_ulong __unused3;
-#endif
-    abi_int shm_cpid;                   /* pid of creator */
-    abi_int shm_lpid;                   /* pid of last shmop */
-    abi_ulong shm_nattch;               /* number of current attaches */
-    abi_ulong __unused4;
-    abi_ulong __unused5;
-};
-
-#endif
+#include "../generic/target_structs.h"
diff --git a/linux-user/microblaze/target_structs.h b/linux-user/microblaze/target_structs.h
index d08f6a53a8..3a06f373c3 100644
--- a/linux-user/microblaze/target_structs.h
+++ b/linux-user/microblaze/target_structs.h
@@ -1,58 +1 @@
-/*
- * MicroBlaze specific structures for linux-user
- *
- * Copyright (c) 2013 Fabrice Bellard
- *
- * This library is free software; you can redistribute it and/or
- * modify it under the terms of the GNU Lesser General Public
- * License as published by the Free Software Foundation; either
- * version 2.1 of the License, or (at your option) any later version.
- *
- * This library is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * Lesser General Public License for more details.
- *
- * You should have received a copy of the GNU Lesser General Public
- * License along with this library; if not, see <http://www.gnu.org/licenses/>.
- */
-#ifndef MICROBLAZE_TARGET_STRUCTS_H
-#define MICROBLAZE_TARGET_STRUCTS_H
-
-struct target_ipc_perm {
-    abi_int __key;                      /* Key.  */
-    abi_uint uid;                       /* Owner's user ID.  */
-    abi_uint gid;                       /* Owner's group ID.  */
-    abi_uint cuid;                      /* Creator's user ID.  */
-    abi_uint cgid;                      /* Creator's group ID.  */
-    abi_ushort mode;                    /* Read/write permission.  */
-    abi_ushort __pad1;
-    abi_ushort __seq;                   /* Sequence number.  */
-    abi_ushort __pad2;
-    abi_ulong __unused1;
-    abi_ulong __unused2;
-};
-
-struct target_shmid_ds {
-    struct target_ipc_perm shm_perm;    /* operation permission struct */
-    abi_long shm_segsz;                 /* size of segment in bytes */
-    abi_ulong shm_atime;                /* time of last shmat() */
-#if TARGET_ABI_BITS == 32
-    abi_ulong __unused1;
-#endif
-    abi_ulong shm_dtime;                /* time of last shmdt() */
-#if TARGET_ABI_BITS == 32
-    abi_ulong __unused2;
-#endif
-    abi_ulong shm_ctime;                /* time of last change by shmctl() */
-#if TARGET_ABI_BITS == 32
-    abi_ulong __unused3;
-#endif
-    abi_int shm_cpid;                   /* pid of creator */
-    abi_int shm_lpid;                   /* pid of last shmop */
-    abi_ulong shm_nattch;               /* number of current attaches */
-    abi_ulong __unused4;
-    abi_ulong __unused5;
-};
-
-#endif
+#include "../generic/target_structs.h"
diff --git a/linux-user/nios2/target_structs.h b/linux-user/nios2/target_structs.h
index daa2886f98..3a06f373c3 100644
--- a/linux-user/nios2/target_structs.h
+++ b/linux-user/nios2/target_structs.h
@@ -1,58 +1 @@
-/*
- * Nios2 specific structures for linux-user
- *
- * Copyright (c) 2016 Marek Vasut <marex@denx.de>
- *
- * This library is free software; you can redistribute it and/or
- * modify it under the terms of the GNU Lesser General Public
- * License as published by the Free Software Foundation; either
- * version 2.1 of the License, or (at your option) any later version.
- *
- * This library is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * Lesser General Public License for more details.
- *
- * You should have received a copy of the GNU Lesser General Public
- * License along with this library; if not, see <http://www.gnu.org/licenses/>.
- */
-#ifndef NIOS2_TARGET_STRUCTS_H
-#define NIOS2_TARGET_STRUCTS_H
-
-struct target_ipc_perm {
-    abi_int __key;                      /* Key.  */
-    abi_uint uid;                       /* Owner's user ID.  */
-    abi_uint gid;                       /* Owner's group ID.  */
-    abi_uint cuid;                      /* Creator's user ID.  */
-    abi_uint cgid;                      /* Creator's group ID.  */
-    abi_ushort mode;                    /* Read/write permission.  */
-    abi_ushort __pad1;
-    abi_ushort __seq;                   /* Sequence number.  */
-    abi_ushort __pad2;
-    abi_ulong __unused1;
-    abi_ulong __unused2;
-};
-
-struct target_shmid_ds {
-    struct target_ipc_perm shm_perm;    /* operation permission struct */
-    abi_long shm_segsz;                 /* size of segment in bytes */
-    abi_ulong shm_atime;                /* time of last shmat() */
-#if TARGET_ABI_BITS == 32
-    abi_ulong __unused1;
-#endif
-    abi_ulong shm_dtime;                /* time of last shmdt() */
-#if TARGET_ABI_BITS == 32
-    abi_ulong __unused2;
-#endif
-    abi_ulong shm_ctime;                /* time of last change by shmctl() */
-#if TARGET_ABI_BITS == 32
-    abi_ulong __unused3;
-#endif
-    abi_int shm_cpid;                   /* pid of creator */
-    abi_int shm_lpid;                   /* pid of last shmop */
-    abi_ulong shm_nattch;               /* number of current attaches */
-    abi_ulong __unused4;
-    abi_ulong __unused5;
-};
-
-#endif
+#include "../generic/target_structs.h"
diff --git a/linux-user/openrisc/target_structs.h b/linux-user/openrisc/target_structs.h
index e98e2bc799..3a06f373c3 100644
--- a/linux-user/openrisc/target_structs.h
+++ b/linux-user/openrisc/target_structs.h
@@ -1,58 +1 @@
-/*
- * OpenRISC specific structures for linux-user
- *
- * Copyright (c) 2013 Fabrice Bellard
- *
- * This library is free software; you can redistribute it and/or
- * modify it under the terms of the GNU Lesser General Public
- * License as published by the Free Software Foundation; either
- * version 2.1 of the License, or (at your option) any later version.
- *
- * This library is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * Lesser General Public License for more details.
- *
- * You should have received a copy of the GNU Lesser General Public
- * License along with this library; if not, see <http://www.gnu.org/licenses/>.
- */
-#ifndef OPENRISC_TARGET_STRUCTS_H
-#define OPENRISC_TARGET_STRUCTS_H
-
-struct target_ipc_perm {
-    abi_int __key;                      /* Key.  */
-    abi_uint uid;                       /* Owner's user ID.  */
-    abi_uint gid;                       /* Owner's group ID.  */
-    abi_uint cuid;                      /* Creator's user ID.  */
-    abi_uint cgid;                      /* Creator's group ID.  */
-    abi_ushort mode;                    /* Read/write permission.  */
-    abi_ushort __pad1;
-    abi_ushort __seq;                   /* Sequence number.  */
-    abi_ushort __pad2;
-    abi_ulong __unused1;
-    abi_ulong __unused2;
-};
-
-struct target_shmid_ds {
-    struct target_ipc_perm shm_perm;    /* operation permission struct */
-    abi_long shm_segsz;                 /* size of segment in bytes */
-    abi_ulong shm_atime;                /* time of last shmat() */
-#if TARGET_ABI_BITS == 32
-    abi_ulong __unused1;
-#endif
-    abi_ulong shm_dtime;                /* time of last shmdt() */
-#if TARGET_ABI_BITS == 32
-    abi_ulong __unused2;
-#endif
-    abi_ulong shm_ctime;                /* time of last change by shmctl() */
-#if TARGET_ABI_BITS == 32
-    abi_ulong __unused3;
-#endif
-    abi_int shm_cpid;                   /* pid of creator */
-    abi_int shm_lpid;                   /* pid of last shmop */
-    abi_ulong shm_nattch;               /* number of current attaches */
-    abi_ulong __unused4;
-    abi_ulong __unused5;
-};
-
-#endif
+#include "../generic/target_structs.h"
diff --git a/linux-user/riscv/target_structs.h b/linux-user/riscv/target_structs.h
index ea3e5ed17e..3a06f373c3 100644
--- a/linux-user/riscv/target_structs.h
+++ b/linux-user/riscv/target_structs.h
@@ -1,46 +1 @@
-/*
- * RISC-V specific structures for linux-user
- *
- * This is a copy of ../aarch64/target_structs.h atm.
- *
- */
-#ifndef RISCV_TARGET_STRUCTS_H
-#define RISCV_TARGET_STRUCTS_H
-
-struct target_ipc_perm {
-    abi_int __key;                      /* Key.  */
-    abi_uint uid;                       /* Owner's user ID.  */
-    abi_uint gid;                       /* Owner's group ID.  */
-    abi_uint cuid;                      /* Creator's user ID.  */
-    abi_uint cgid;                      /* Creator's group ID.  */
-    abi_ushort mode;                    /* Read/write permission.  */
-    abi_ushort __pad1;
-    abi_ushort __seq;                   /* Sequence number.  */
-    abi_ushort __pad2;
-    abi_ulong __unused1;
-    abi_ulong __unused2;
-};
-
-struct target_shmid_ds {
-    struct target_ipc_perm shm_perm;    /* operation permission struct */
-    abi_long shm_segsz;                 /* size of segment in bytes */
-    abi_ulong shm_atime;                /* time of last shmat() */
-#if TARGET_ABI_BITS == 32
-    abi_ulong __unused1;
-#endif
-    abi_ulong shm_dtime;                /* time of last shmdt() */
-#if TARGET_ABI_BITS == 32
-    abi_ulong __unused2;
-#endif
-    abi_ulong shm_ctime;                /* time of last change by shmctl() */
-#if TARGET_ABI_BITS == 32
-    abi_ulong __unused3;
-#endif
-    abi_int shm_cpid;                   /* pid of creator */
-    abi_int shm_lpid;                   /* pid of last shmop */
-    abi_ulong shm_nattch;               /* number of current attaches */
-    abi_ulong __unused4;
-    abi_ulong __unused5;
-};
-
-#endif
+#include "../generic/target_structs.h"
diff --git a/linux-user/sh4/target_structs.h b/linux-user/sh4/target_structs.h
index 00ac39478b..3a06f373c3 100644
--- a/linux-user/sh4/target_structs.h
+++ b/linux-user/sh4/target_structs.h
@@ -1,58 +1 @@
-/*
- * SH4 specific structures for linux-user
- *
- * Copyright (c) 2013 Fabrice Bellard
- *
- * This library is free software; you can redistribute it and/or
- * modify it under the terms of the GNU Lesser General Public
- * License as published by the Free Software Foundation; either
- * version 2.1 of the License, or (at your option) any later version.
- *
- * This library is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * Lesser General Public License for more details.
- *
- * You should have received a copy of the GNU Lesser General Public
- * License along with this library; if not, see <http://www.gnu.org/licenses/>.
- */
-#ifndef SH4_TARGET_STRUCTS_H
-#define SH4_TARGET_STRUCTS_H
-
-struct target_ipc_perm {
-    abi_int __key;                      /* Key.  */
-    abi_uint uid;                       /* Owner's user ID.  */
-    abi_uint gid;                       /* Owner's group ID.  */
-    abi_uint cuid;                      /* Creator's user ID.  */
-    abi_uint cgid;                      /* Creator's group ID.  */
-    abi_ushort mode;                    /* Read/write permission.  */
-    abi_ushort __pad1;
-    abi_ushort __seq;                   /* Sequence number.  */
-    abi_ushort __pad2;
-    abi_ulong __unused1;
-    abi_ulong __unused2;
-};
-
-struct target_shmid_ds {
-    struct target_ipc_perm shm_perm;    /* operation permission struct */
-    abi_long shm_segsz;                 /* size of segment in bytes */
-    abi_ulong shm_atime;                /* time of last shmat() */
-#if TARGET_ABI_BITS == 32
-    abi_ulong __unused1;
-#endif
-    abi_ulong shm_dtime;                /* time of last shmdt() */
-#if TARGET_ABI_BITS == 32
-    abi_ulong __unused2;
-#endif
-    abi_ulong shm_ctime;                /* time of last change by shmctl() */
-#if TARGET_ABI_BITS == 32
-    abi_ulong __unused3;
-#endif
-    abi_int shm_cpid;                   /* pid of creator */
-    abi_int shm_lpid;                   /* pid of last shmop */
-    abi_ulong shm_nattch;               /* number of current attaches */
-    abi_ulong __unused4;
-    abi_ulong __unused5;
-};
-
-#endif
+#include "../generic/target_structs.h"
diff --git a/linux-user/x86_64/target_structs.h b/linux-user/x86_64/target_structs.h
index ce367b253b..f1181383c4 100644
--- a/linux-user/x86_64/target_structs.h
+++ b/linux-user/x86_64/target_structs.h
@@ -19,41 +19,7 @@
 #ifndef X86_64_TARGET_STRUCTS_H
 #define X86_64_TARGET_STRUCTS_H
 
-struct target_ipc_perm {
-    abi_int __key;                      /* Key.  */
-    abi_uint uid;                       /* Owner's user ID.  */
-    abi_uint gid;                       /* Owner's group ID.  */
-    abi_uint cuid;                      /* Creator's user ID.  */
-    abi_uint cgid;                      /* Creator's group ID.  */
-    abi_ushort mode;                    /* Read/write permission.  */
-    abi_ushort __pad1;
-    abi_ushort __seq;                   /* Sequence number.  */
-    abi_ushort __pad2;
-    abi_ulong __unused1;
-    abi_ulong __unused2;
-};
-
-struct target_shmid_ds {
-    struct target_ipc_perm shm_perm;    /* operation permission struct */
-    abi_long shm_segsz;                 /* size of segment in bytes */
-    abi_ulong shm_atime;                /* time of last shmat() */
-#if TARGET_ABI_BITS == 32
-    abi_ulong __unused1;
-#endif
-    abi_ulong shm_dtime;                /* time of last shmdt() */
-#if TARGET_ABI_BITS == 32
-    abi_ulong __unused2;
-#endif
-    abi_ulong shm_ctime;                /* time of last change by shmctl() */
-#if TARGET_ABI_BITS == 32
-    abi_ulong __unused3;
-#endif
-    abi_int shm_cpid;                   /* pid of creator */
-    abi_int shm_lpid;                   /* pid of last shmop */
-    abi_ulong shm_nattch;               /* number of current attaches */
-    abi_ulong __unused4;
-    abi_ulong __unused5;
-};
+#include "../generic/target_structs.h"
 
 /* The x86 definition differs from the generic one in that the
  * two padding fields exist whether the ABI is 32 bits or 64 bits.
-- 
2.25.1


