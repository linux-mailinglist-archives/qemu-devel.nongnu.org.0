Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF0D6D89AE
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 23:37:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkAnz-0005Hl-CR; Wed, 05 Apr 2023 17:36:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pkAnv-0005HI-6C
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 17:36:31 -0400
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pkAnt-0005aC-Jb
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 17:36:30 -0400
Received: by mail-il1-x135.google.com with SMTP id r19so8262708ilj.6
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 14:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112; t=1680730588;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VTc0CkhboZdbdLS1nawm6MDD/m9xKS8bqWOZ/27lhR4=;
 b=jecIIYpiDVCco47YeSYCyhHB4oAgWQJiJliOoxBeizLCn1mFvtIFnk477nrn/gF1gy
 6+kB/+4XoShVvF1aZgo37AvsS8axg9RWIilBw6NrnjvpERkdw+vZVDkL6d1ASp9V/yiZ
 mMxSRAW+vbx/UcSxFOZkm+lFXMyeUbP9mSk/Q/K0QU4yu5iaBoBzJ81R9mrJAkAgU4BY
 hALovkndEDhUTtBnr0XW7ixFhTxY79GwhTVHdXO4JD6ZF+dJyH082QC2CrbzMeFNdzvP
 /DSz3PPSK0IBqib6AEif3+zFiZtGF0tYVQrQwWJ2CNtd91+GaXe8wGFhsajDCd7pWkvh
 RYzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680730588;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VTc0CkhboZdbdLS1nawm6MDD/m9xKS8bqWOZ/27lhR4=;
 b=sbZMVp7SvPwJijY2nNFMVEb/sUR051eITCAvyBVPFkY3+1WaCyhvcb5Kx6MArXBwdp
 ANYAKIT8hqQD12IS3082RvUXWD6tIr/8u/NWa0qebM8SoPnCNBu4Hd3vJYgJwhJjt2x+
 cYajyaKnS0c90dKtNA59ILC50KOZa69XLADEo/QKDDJWp35W3WApI/ZnuNfwGLK9/tSJ
 G+8hzMCut8o1bNaKWQ6USaFL1dYEul/ThUXduAHqId+mUzUAoh2P6u+umNNYfLRXuS7l
 SBfcP3pwYYjLgp5Jew9/hlus0vS75L+XqcLB2IafdwuDw3Hbeyd5HfDmxNxISKduLZX8
 JQSQ==
X-Gm-Message-State: AAQBX9e5nh2QltdymuZJAEpqvTV/H4ihpD8iBrQgYTmoNrTqIEIbIgmS
 KpA9LaPHbKIhA/twF9cKZMeXx1twU8AImUQqgeQ=
X-Google-Smtp-Source: AKy350ar8vgsWVXwTZH+tPsynguOOvjNWulAFgRE2qXedLTMVp4jLEn8rAT+tYzUKBf+IKlVt8ux7Q==
X-Received: by 2002:a92:dc90:0:b0:325:e0f6:a5a4 with SMTP id
 c16-20020a92dc90000000b00325e0f6a5a4mr5793266iln.13.1680730588257; 
 Wed, 05 Apr 2023 14:36:28 -0700 (PDT)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 i18-20020a926d12000000b003261b6acc8asm4110473ilc.79.2023.04.05.14.36.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 14:36:27 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: reinoud@netbsd.org, riastradh@netbsd.org, ryoon@netbsd.org,
 jrtc27@jrtc27.com, Warner Losh <imp@bsdimp.com>, kevans@freebsd.org,
 Brad Smith <brad@comstyle.com>
Subject: [PATCH 02/16] bsd-user: Ifdef a few MAP_ constants for NetBSD
Date: Wed,  5 Apr 2023 15:35:58 -0600
Message-Id: <20230405213612.15942-3-imp@bsdimp.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230405213612.15942-1-imp@bsdimp.com>
References: <20230405213612.15942-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::135;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x135.google.com
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

MAP_GUARD, MAP_EXCL, and MAP_NOCORE are FreeBSD only. Add back the
ifdefs that I removed in 36d5d891559f (but only these ifdefs, the
rest of the commit is not reverted).

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/mmap.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/bsd-user/mmap.c b/bsd-user/mmap.c
index d6c5a344c9b..f732a6f6f2b 100644
--- a/bsd-user/mmap.c
+++ b/bsd-user/mmap.c
@@ -416,27 +416,33 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
             qemu_log("MAP_ALIGNED(%u) ",
                      (flags & MAP_ALIGNMENT_MASK) >> MAP_ALIGNMENT_SHIFT);
         }
+#ifdef MAP_GUARD
         if (flags & MAP_GUARD) {
             qemu_log("MAP_GUARD ");
         }
+#endif
         if (flags & MAP_FIXED) {
             qemu_log("MAP_FIXED ");
         }
         if (flags & MAP_ANON) {
             qemu_log("MAP_ANON ");
         }
+#ifdef MAP_EXCL
         if (flags & MAP_EXCL) {
             qemu_log("MAP_EXCL ");
         }
+#endif
         if (flags & MAP_PRIVATE) {
             qemu_log("MAP_PRIVATE ");
         }
         if (flags & MAP_SHARED) {
             qemu_log("MAP_SHARED ");
         }
+#ifdef MAP_NOCORE
         if (flags & MAP_NOCORE) {
             qemu_log("MAP_NOCORE ");
         }
+#endif
         if (flags & MAP_STACK) {
             qemu_log("MAP_STACK ");
         }
@@ -454,6 +460,7 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
             goto fail;
         }
     }
+#ifdef MAP_GUARD
     if ((flags & MAP_GUARD) && (prot != PROT_NONE || fd != -1 ||
         offset != 0 || (flags & (MAP_SHARED | MAP_PRIVATE |
         /* MAP_PREFAULT | */ /* MAP_PREFAULT not in mman.h */
@@ -461,6 +468,7 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
         errno = EINVAL;
         goto fail;
     }
+#endif
 
     if (offset & ~TARGET_PAGE_MASK) {
         errno = EINVAL;
@@ -608,11 +616,13 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
             goto the_end;
         }
 
+#ifdef MAP_EXCL
         /* Reject the mapping if any page within the range is mapped */
         if ((flags & MAP_EXCL) && page_check_range(start, len, 0) < 0) {
             errno = EINVAL;
             goto fail;
         }
+#endif
 
         /* handle the start of the mapping */
         if (start > real_start) {
-- 
2.40.0


