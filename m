Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C926842730E
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 23:28:32 +0200 (CEST)
Received: from localhost ([::1]:57858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYxPr-0001oM-Oe
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 17:28:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mYxLZ-00038s-10
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 17:24:05 -0400
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d]:45958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mYxLX-0007cJ-52
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 17:24:04 -0400
Received: by mail-il1-x12d.google.com with SMTP id i11so10284069ila.12
 for <qemu-devel@nongnu.org>; Fri, 08 Oct 2021 14:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BVN0ugWOSWpBWHbRsPpyH98PmJG0IHpMrYYWEQcve3M=;
 b=npe3xBRQIMJOgW3GFiZ0TT7PuxR3n9fxse2EIqXIyICzK75XdZmFz5tSxgfgPRxHpL
 FAxzoPO0p8Ydulpmit8Dl9aLkJwsUluTwJybdpNbYXklkuHyZV8vGQAPc+QLdrdPGLcg
 A5KV0LAaLAGwDMCoMDVtWQ50F8n+4UatGpK1FoTWhG5EMGeaR/K/UNQ8/kECiRrqnuuJ
 KTpliBquIFy+lUyhDJLgQOcBxNly29G5/017xJbviedDJndin0p5vBeaIwdbwXcG7tvg
 REOy6TudQouUB16n9aMV8CyuJSH0Xm98x56A2HHyKXpoyAzv7UQpCrLZtavg2as/L4/A
 Ou5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BVN0ugWOSWpBWHbRsPpyH98PmJG0IHpMrYYWEQcve3M=;
 b=jv3KT9haBzSS5/6lY0dvzRxRCOXRi94FpFqlWXWi31PW9weoN/40IIzGC8zKml6lEN
 7dArXIn2cisQbm9U12Pfr1eVeD1h1nLg8GN9AlVENXvhpfnEIhDtoCn3zsPcV/W8xOH0
 ptFQTChRRHjugZJcgkSmorwjJXCtTgIUiNk0YFfWFcf/pf+zPSMWDqnHZZyk35eEjl3Z
 8A6L4mp9boYN8cUAL16Q+HH8d80w0hvfxIz0dWfkJ1RkuUZ/sK5KbAlh8bb89NRu8FiE
 C9ozEQN6J2S5J0eSkvfTxT6yl/2Hmy8XJMx7nutD7RDVIniDJEmnzSwXcua68eF6OOVa
 32mQ==
X-Gm-Message-State: AOAM530B2s/VuZX/tJN02iyjNfKk/MyTLdpJJbfucscVp4i7jv1JVRIQ
 euNqAeWVeRmuSpz/Nipfhq1dNEMiBeXNdQ==
X-Google-Smtp-Source: ABdhPJyeQF2q0uaLA6nEZsIbkPrPm0ijsj7sIk7G6FFQnoGQvtbhylzm46HLeeoWedX1BMfXY6URZw==
X-Received: by 2002:a05:6e02:1c04:: with SMTP id
 l4mr9149686ilh.83.1633728241756; 
 Fri, 08 Oct 2021 14:24:01 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a4sm186620ild.52.2021.10.08.14.24.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 14:24:01 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/9] bsd-user/mmap.c: check pread's return value to fix
 warnings with _FORTIFY_SOURCE
Date: Fri,  8 Oct 2021 15:23:37 -0600
Message-Id: <20211008212344.95537-3-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211008212344.95537-1-imp@bsdimp.com>
References: <20211008212344.95537-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12d;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12d.google.com
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: kevans@freebsd.org,
 =?UTF-8?q?Mika=C3=ABl=20Urankar?= <mikael.urankar@gmail.com>,
 richard.henderson@linaro.org, f4bug@amsat.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mikaël Urankar <mikael.urankar@gmail.com>

Simmilar to the equivalent linux-user: commit fb7e378cf9c, which added
checking to pread's return value. Update to current qemu standards with
{} around the if statement.

Signed-off-by: Mikaël Urankar <mikael.urankar@gmail.com>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 bsd-user/mmap.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/bsd-user/mmap.c b/bsd-user/mmap.c
index fc3c1480f5..4f4fa3ab46 100644
--- a/bsd-user/mmap.c
+++ b/bsd-user/mmap.c
@@ -174,7 +174,9 @@ static int mmap_frag(abi_ulong real_start,
             mprotect(host_start, qemu_host_page_size, prot1 | PROT_WRITE);
 
         /* read the corresponding file data */
-        pread(fd, g2h_untagged(start), end - start, offset);
+        if (pread(fd, g2h_untagged(start), end - start, offset) == -1) {
+            return -1;
+        }
 
         /* put final protection */
         if (prot_new != (prot1 | PROT_WRITE))
@@ -593,7 +595,9 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
                                   -1, 0);
             if (retaddr == -1)
                 goto fail;
-            pread(fd, g2h_untagged(start), len, offset);
+            if (pread(fd, g2h_untagged(start), len, offset) == -1) {
+                goto fail;
+            }
             if (!(prot & PROT_WRITE)) {
                 ret = target_mprotect(start, len, prot);
                 if (ret != 0) {
-- 
2.32.0


