Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD15F43271E
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 21:08:41 +0200 (CEST)
Received: from localhost ([::1]:34134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcY00-00010S-Rp
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 15:08:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcXtI-0007xq-Km
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 15:01:46 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:40510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcXtB-0001WT-9U
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 15:01:44 -0400
Received: by mail-io1-xd36.google.com with SMTP id x1so17492804iof.7
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 12:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/esxzvTZAXy1d5qeSy++Yncrcqbi68O1hcQTBHEcYg0=;
 b=PVCO8OkvLDKWSXFwCLGJXWA30nPG5nAfz+ySEcwnbnXQJj+RUd6/W3DDS1O/ZOJCvS
 4GwuQCK1C1eleMzxi2rfMNILhoiCL+qlKvNBTEHdsdYwmorQB4nxEoKcoUIWEXMvqJ76
 DUA2ToK5EjLEtzfqyLVrxZHUabYwAInczDomC36osOi3fN6++wrbZod6hUt3HM5esMfG
 imaIOmRA7ryjGHWU4iWZEOPTu43BDmbkgIigbeGmtMteo02Uo22FBrAB/PM87B49+4Te
 +vQD00nyd0msir61XtlWd3IBjQ5F0YmtRpBq7U+7+Vd8kb/ua4RPc1Dw0Oh58oTK/r5H
 em/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/esxzvTZAXy1d5qeSy++Yncrcqbi68O1hcQTBHEcYg0=;
 b=w52rqjtt6k0dbYVaPxorlKH51trpcndOz9VY7fqUIKiAAoVvioClVZ8rxVg774QJJK
 J5iLnxzQKWt9cbtTTRrNXYOcUqNeSmn2YL9K82uMTeCaWy9qBswi7A6yVn8YMn1mokrx
 dnWfduaOiSGzZetqy2ncZT2S3ICBzN7MVH+9b87GUo9rEfQhppMkajcnFJjK3R3UxJbu
 Wx6dudpXIkRH217Vuj12xR7M021d0rmhBKibtkJ4vmWHtaApqA7+1M59V9zikC+ntWci
 RchL20zYCOWNJY5MB9dK2KdXXdDAwuzmzLgrANnKsekBbJ++SAbI01NTu9RqbYGEQdPb
 vUkQ==
X-Gm-Message-State: AOAM530VoeMCVCiUZY7YQAgTcvuzQk/pGqWQWS8cHPgsLi1yMfCHdzae
 4fMMtzbdI1NInyqcJrvPiWlNYSDy3q3s2Q==
X-Google-Smtp-Source: ABdhPJxbqf0UzyXXQn2ZpJOUL/zrS0c3yW9rgzbBHiAGSolsm3iauxBwCXc+Crx4fT9hfKyTI3HjQw==
X-Received: by 2002:a05:6638:1505:: with SMTP id
 b5mr1113692jat.99.1634583695984; 
 Mon, 18 Oct 2021 12:01:35 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a8sm6945151ilh.5.2021.10.18.12.01.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 12:01:35 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 02/23] bsd-user/mmap.c: check pread's return value to fix
 warnings with _FORTIFY_SOURCE
Date: Mon, 18 Oct 2021 13:00:54 -0600
Message-Id: <20211018190115.5365-3-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211018190115.5365-1-imp@bsdimp.com>
References: <20211018190115.5365-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d36;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd36.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Kyle Evans <kevans@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Mika=C3=ABl=20Urankar?= <mikael.urankar@gmail.com>
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
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
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


