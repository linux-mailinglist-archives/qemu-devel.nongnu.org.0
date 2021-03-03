Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6D932B654
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 10:50:18 +0100 (CET)
Received: from localhost ([::1]:55696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHO93-0002v7-NT
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 04:50:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ivan.a.melnikov@gmail.com>)
 id 1lHO8D-0002U8-FG
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 04:49:25 -0500
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136]:33577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ivan.a.melnikov@gmail.com>)
 id 1lHO8B-0001Lt-MW
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 04:49:25 -0500
Received: by mail-lf1-x136.google.com with SMTP id u4so36124521lfs.0
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 01:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=ZBxO/xwBY8bXQHfr6OQebwwQ7hHzAWtmRm1lUul7FII=;
 b=NHNPLjOA86KEPBqCBxHgEMSIBE0MjS1WSuPbRiFELCcoiWxhKQBb2GI0jkjGjRonQe
 zQckdI3Rh/dpPKMD4KVcKB+FzqWo6HU0L7B//V9hDcMbSJI87V/Hyoax5VTCYnD1xZzG
 pMOcOBfstn2lUjj3iyHPUc/iVjmna4ryHORqWLBF9icpafqILV0ca1FFP1KDSiHVbEHs
 RCVwqxyJjCm98sWV5qrc0JTEyov0uhrfW38ItzJjZ5/dK/lih+odlthYA+qcC1SuSmCb
 k00R3eBEtt/VIDrtcn4XxY/nWLF/V+qqHgT5DJLRPPz73niB8gTrGZdlDson7lHHsyBF
 BE2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mime-version:content-disposition;
 bh=ZBxO/xwBY8bXQHfr6OQebwwQ7hHzAWtmRm1lUul7FII=;
 b=idZawTtbGpQZ/CDtC+f+XvFGQ4hD18zDFiIX7gZflA3XXYPIhjwWhH0W6/AroM49DG
 zFbEuyfL9Vy5SPbEesZZhZ0T+n6SpuA/WWFTWNtPskzPBqHuwMjxHNSTkFqc32VEdMa1
 h8x1jU2IiwoFCBdXQmNOW+r17XNgGjDcKg2yB61mdPRN9Y3E0cRdvGiw5DLVYJHAc5kT
 7O73/g2S6L+0iRxxYfuclvjWcsLfEECDg882sRglGZBfgGuVqj509AQOlzJsPhZzSP+5
 AqZ+xWpv1ERmPGCuhDWVzzzdi60S/pooN/foiAFFtqJdJ0niWP/knCRhcgrgxqaaJZVq
 d56g==
X-Gm-Message-State: AOAM530sEHfIVryK5K7YU9DR/Qv/IjlBXhcvjr2ae3BpEKbR94RU5TNU
 aTpGZYUodONr6DpC40AIP/ayhNpe8Uk=
X-Google-Smtp-Source: ABdhPJwhd+mriCjOFpO7FNO3n3MHT2uab3t+pAE8PbbFkfDee1TwmKKC5gXqyNoSE62xjxH6+IyMbQ==
X-Received: by 2002:a19:6109:: with SMTP id v9mr3216493lfb.546.1614764961180; 
 Wed, 03 Mar 2021 01:49:21 -0800 (PST)
Received: from titan.localdomain ([193.43.9.4])
 by smtp.gmail.com with ESMTPSA id r7sm2995081lfr.230.2021.03.03.01.49.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 01:49:20 -0800 (PST)
Date: Wed, 3 Mar 2021 13:49:19 +0400
From: "Ivan A. Melnikov" <iv@altlinux.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] linux-user: Adjust pgd_find_hole_fallback result with
 guest_loaddr
Message-ID: <20210303094919.x6wnlh6qulx72fz6@titan.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=ivan.a.melnikov@gmail.com; helo=mail-lf1-x136.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While pgd_find_hole_fallback returns the beginning of the
hole found, pgb_find_hole returns guest_base, which
is somewhat different as the binary qemu-user is loading
usually has non-zero load address.

Failing to take this into account leads to random crashes
if the hole is "just big enough", but not bigger:
in that case, important mappings (e.g. parts of qemu-user
itself) may be replaced with the binary it is loading
(e.g. the guest elf interpreter).

This patch also fixes the return type of pgd_find_hole_fallback:
it returns -1 if no hole is found, so a signed return type
should be used.

Downstream issue (in Russian): https://bugzilla.altlinux.org/39141
Signed-off-by: Ivan A. Melnikov <iv@altlinux.org>
---
 linux-user/elfload.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index bab4237e90..acd510532c 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -2205,9 +2205,11 @@ static void pgb_have_guest_base(const char *image_name, abi_ulong guest_loaddr,
  * /proc/self/map. It can potentially take a very long time as we can
  * only dumbly iterate up the host address space seeing if the
  * allocation would work.
+ *
+ * Returns the start addres of the hole found, or -1 if no hole found.
  */
-static uintptr_t pgd_find_hole_fallback(uintptr_t guest_size, uintptr_t brk,
-                                        long align, uintptr_t offset)
+static intptr_t pgd_find_hole_fallback(uintptr_t guest_size, uintptr_t brk,
+                                       long align, uintptr_t offset)
 {
     uintptr_t base;
 
@@ -2235,7 +2237,7 @@ static uintptr_t pgd_find_hole_fallback(uintptr_t guest_size, uintptr_t brk,
                 munmap((void *) align_start, guest_size);
                 if (MAP_FIXED_NOREPLACE != 0 ||
                     mmap_start == (void *) align_start) {
-                    return (uintptr_t) mmap_start + offset;
+                    return (intptr_t) mmap_start + offset;
                 }
             }
             base += qemu_host_page_size;
@@ -2259,7 +2261,8 @@ static uintptr_t pgb_find_hole(uintptr_t guest_loaddr, uintptr_t guest_size,
     brk = (uintptr_t)sbrk(0);
 
     if (!maps) {
-        return pgd_find_hole_fallback(guest_size, brk, align, offset);
+        ret = pgd_find_hole_fallback(guest_size, brk, align, offset);
+        return (ret > guest_loaddr) ? (ret - guest_loaddr) : -1;
     }
 
     /* The first hole is before the first map entry. */
-- 
2.29.2

