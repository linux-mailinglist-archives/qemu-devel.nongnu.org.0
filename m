Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C03F6EAFDE
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 18:58:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppu4x-0000hG-5Q; Fri, 21 Apr 2023 12:57:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kariem.taha2.7@gmail.com>)
 id 1ppu4u-0000bU-PQ
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 12:57:44 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kariem.taha2.7@gmail.com>)
 id 1ppu4t-0005VK-AM
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 12:57:44 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-2f9b9aa9d75so1275902f8f.0
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 09:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682096262; x=1684688262;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OWYQif1AwwVS310SFNMZwGeyUgr9UyWi7cSNgYOkbtQ=;
 b=PNYLUR9CXcR2vyJkF5XUzMjwew4vuYwa4E4+bzbQMf3Kq5VaZDIjgMB614EoLi0eG6
 4cQqDxcki4XbWsJ1dINS/jFPOwD/T385ZpkKVCEbWnJl+flJEYbPtfID2d8i9+Ie3L0U
 dQPCQvKaPGW0hKW1Hi7+F1DGuMmckTh/N9QqqVcVd4W6MC7E+M4tlLkxaoW/qwv+8Hmg
 HVUBSKTCy3ucj5jSp4oNe4wb5P0LNezLSh4MB+c5V/COdlaaEgIdjjST5I24iuBAIVWq
 StBOJPB3s4JUa0jGGvRzzb5xED0z55D0YLM0X4VQeO9uGQKb0jGWm+NzbR4OfjrhpTqc
 W4jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682096262; x=1684688262;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OWYQif1AwwVS310SFNMZwGeyUgr9UyWi7cSNgYOkbtQ=;
 b=XiFdqx+uTpECX1B36Ryh7sZvdN2DqpGEydt30pVmpZ7ngA61Mba1T0wgCUBOGKB6wm
 yKAsj0SAmwvxtcu5sKKTaw3BEcr6agotIAAKE/g1Kruj9YE1xUitaJTBHMWR14tMU1bW
 L2yA2wBbTn1L1uxghQe9cFcXel/zkg3oE2Y1DmDmPWxFh7coMoQa7DwVeepgDdlGXiZy
 MImZLp96v290rGwfGtqpqYIWCgo3N3cE5gmH6Tob60VaSwcqT8HswFxGO1qePca6V0GT
 l7acDZJ3TIhUGzBQ12tIatYhu7MAhzH590zAATwIxSVB3GEhVg4+qaJjEVYWLrKR0xXU
 BgLA==
X-Gm-Message-State: AAQBX9dUYK0jgauh9DbAv2L4WqmceL4CsnmNdk01ZIgv2QiUHU1zWrEu
 Zw2QhwmmYjVo2yDyqV1UDIFxEGr/U54=
X-Google-Smtp-Source: AKy350YadtYWmFH9uaayMViN5GPqna+Ya/gOvtwc4tWfTDVnjXlGnZzx13wNtMbDQztg4olWOsWTmQ==
X-Received: by 2002:adf:dbce:0:b0:2f0:e287:1fbc with SMTP id
 e14-20020adfdbce000000b002f0e2871fbcmr4465294wrj.11.1682096262007; 
 Fri, 21 Apr 2023 09:57:42 -0700 (PDT)
Received: from karim.my.domain ([197.39.145.151])
 by smtp.gmail.com with ESMTPSA id
 e5-20020a5d5305000000b002cf1c435afcsm4820581wrv.11.2023.04.21.09.57.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 09:57:41 -0700 (PDT)
From: Karim Taha <kariem.taha2.7@gmail.com>
To: qemu-devel@nongnu.org
Cc: imp@bsdimp.com, Sean Bruno <sbruno@FreeBSD.org>,
 Kyle Evans <kevans@FreeBSD.org>, Karim Taha <kariem.taha2.7@gmail.com>
Subject: [PATCH v4 03/11] Signed-off-by: Karim Taha <kariem.taha2.7@gmail.com>
Date: Fri, 21 Apr 2023 18:53:43 +0200
Message-Id: <20230421165351.3177-4-kariem.taha2.7@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230421165351.3177-1-kariem.taha2.7@gmail.com>
References: <20230421165351.3177-1-kariem.taha2.7@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=kariem.taha2.7@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Sean Bruno <sbruno@FreeBSD.org>

Target cmsghdr struct and flags.

Add the cmsghdr struct and alignment flags.

Co-authored-by: Kyle Evans <kevans@FreeBSD.org>
Signed-off-by: Sean Bruno <sbruno@FreeBSD.org>
Signed-off-by: Kyle Evans <kevans@FreeBSD.org>
Signed-off-by: Karim Taha <kariem.taha2.7@gmail.com>
---
 bsd-user/syscall_defs.h | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/bsd-user/syscall_defs.h b/bsd-user/syscall_defs.h
index f041245792..b594fafecc 100644
--- a/bsd-user/syscall_defs.h
+++ b/bsd-user/syscall_defs.h
@@ -275,6 +275,44 @@ struct target_cmsghdr {
     int32_t     cmsg_type;
 };
 
+/*
+ * mips32 is the exception to the general rule of long-alignment; it
+ * unconditionally uses 64-bit alignment instead.
+ */
+#if defined(TARGET_MIPS) && TARGET_ABI_BITS == 32
+#define TARGET_ALIGNBYTES   (sizeof(abi_llong) - 1)
+#else
+#define TARGET_ALIGNBYTES   (sizeof(abi_long) - 1)
+#endif
+
+#define TARGET_CMSG_NXTHDR(mhdr, cmsg, cmsg_start) \
+                               __target_cmsg_nxthdr(mhdr, cmsg, cmsg_start)
+#define TARGET_CMSG_ALIGN(len) (((len) + TARGET_ALIGNBYTES) \
+                               & (size_t) ~TARGET_ALIGNBYTES)
+#define TARGET_CMSG_DATA(cmsg) \
+    ((unsigned char *)(cmsg) + TARGET_CMSG_ALIGN(sizeof(struct target_cmsghdr)))
+#define TARGET_CMSG_SPACE(len) \
+    (TARGET_CMSG_ALIGN(sizeof(struct target_cmsghdr)) + TARGET_CMSG_ALIGN(len))
+#define TARGET_CMSG_LEN(len) \
+    (TARGET_CMSG_ALIGN(sizeof(struct target_cmsghdr)) + (len))
+
+static inline struct target_cmsghdr *
+__target_cmsg_nxthdr(struct target_msghdr *__mhdr,
+                     struct target_cmsghdr *__cmsg,
+                     struct target_cmsghdr *__cmsg_start)
+{
+    struct target_cmsghdr *__ptr;
+
+    __ptr = (struct target_cmsghdr *)((unsigned char *) __cmsg +
+        TARGET_CMSG_ALIGN(tswap32(__cmsg->cmsg_len)));
+    if ((unsigned long)((char *)(__ptr + 1) - (char *)__cmsg_start) >
+        tswap32(__mhdr->msg_controllen)) {
+        /* No more entries.  */
+        return (struct target_cmsghdr *)0;
+    }
+    return __ptr;
+}
+
 /*
  * netinet/in.h
  */
-- 
2.40.0


