Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3416DCAB4
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Apr 2023 20:24:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plw8r-0002gl-SX; Mon, 10 Apr 2023 14:21:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1plw8h-0002fJ-8I
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 14:21:16 -0400
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1plw8f-0000hM-Oo
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 14:21:15 -0400
Received: by mail-il1-x12b.google.com with SMTP id r11so2066689ilb.9
 for <qemu-devel@nongnu.org>; Mon, 10 Apr 2023 11:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112; t=1681150872;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p/770m3m0UuWja7n7zJRMdkcuTqSX6pSDmKn7o3gni8=;
 b=jP28ot3lOoWTfCEYsoXSNyqLume40JINZCkOT9k6UaZxuLSQWM86TY7kqlnc4XOlYj
 l6YSk2f0dGv1xeAJj59qU/WXKhyW0bHHX1xM3/OJe10vctwiWpqq8AKTt7QugODDSKCc
 wzC/J0si6OdXhXN7XI5BE2ZstRpun1lojN+jHPGORJ/ZZPiUQ+hi6qk+ax/8CABSuzOL
 hlDYCWADf/BUu2ElPrljnmFeLKh8dKadWLkynOgZ2LHfMFP+Z4aQWYa06ChtV++4dd9e
 AYlaU+UONFncBoB8yt96b3QKqI3Redob5TzFynKZR8kx0aLJwjioiGA8AYiwBuQiLiCX
 YEJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681150872;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p/770m3m0UuWja7n7zJRMdkcuTqSX6pSDmKn7o3gni8=;
 b=TGrewesVwPdtb1MuerkE4jEBIqiMQMHFwA9dG/wO6lm8S4smCbLE5lbuSI8Dxx4LBW
 vlItYALGIeEggfyPHkK/957OIpemjm5euTiyRwLGdIeR+efo6dyfBcJ0FZZTCY03a2Fz
 /RElOViUZjDerNeDmriBRyy9AOSwbY4mkwytOcmL14Q1uttwTHqQ0xAbcNQ7OOaEllXq
 t9eNctNb9WqltTVGbAw/d8Bu3rxAgfktKHF7M0LcHVemKU7CG7i7VEtEaPYBa7GR4qXh
 o87wslhizFf5FxXg+ruJ1ugqR7lwiA6OxneCGojYiolp3o4ownmM7A7a9vGfpXjCeA0A
 8xag==
X-Gm-Message-State: AAQBX9eRIhk70KLGNvgziMzRFATK/diGdv67Cdu0aTtb2bHUy+HqgLnj
 DEBed3SchdbezWqFO6YVK9eWdIN4f3LMeC4gPdM=
X-Google-Smtp-Source: AKy350aXi/xRkI5BxO3ySTHiPg3Bc3FvC6Bpk3O9eS1TeP2gFOXuApCNQMZEyO9wxw08v+t6ytauSg==
X-Received: by 2002:a92:d9cf:0:b0:317:93dc:1122 with SMTP id
 n15-20020a92d9cf000000b0031793dc1122mr4678565ilq.14.1681150872393; 
 Mon, 10 Apr 2023 11:21:12 -0700 (PDT)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 a15-20020a056e02120f00b00313b281ecd2sm3104314ilq.70.2023.04.10.11.21.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 11:21:12 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: jrtc27@jrtc27.com, riastradh@netbsd.org, Kyle Evans <kevans@freebsd.org>,
 Ryo ONODERA <ryoon@netbsd.org>, Brad Smith <brad@comstyle.com>,
 Warner Losh <imp@bsdimp.com>, reinoud@netbsd.org,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 08/19] bsd-user: Remove useless mmap definitions
Date: Mon, 10 Apr 2023 12:20:45 -0600
Message-Id: <20230410182056.320-9-imp@bsdimp.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230410182056.320-1-imp@bsdimp.com>
References: <20230410182056.320-1-imp@bsdimp.com>
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


