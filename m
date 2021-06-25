Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B2B3B4606
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 16:45:16 +0200 (CEST)
Received: from localhost ([::1]:44422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwn4w-0003cX-9b
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 10:45:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lwmfO-0003bE-Um
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 10:18:46 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:33715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lwmfN-0003IH-CC
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 10:18:46 -0400
Received: by mail-ed1-x529.google.com with SMTP id w13so7641341edc.0
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 07:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1inmLhcVq0aSD320zpWtlTjRRoDETw4S+Ab6hL0QjO8=;
 b=JDzWR4qxco4TdjVmZvUi7KPsUPitzzTRlcy+jPMCa0k9sTYPOVqwwRB3DByeH4qqaO
 T0cVljP4DQqVJpoE49ihypekfjnazoCQYX6i23z50qb6GlfyWKM/4YHWibX0D36ojkqM
 RQWEMCtjACabOo4wz5GVJbn11oR5hQoJUh4DgrqOHqLRCsst6Mv1S+K6J1MGEW4YL70W
 vD9KizmFvIfVCb06unVXHHYRVB/E4gZzM3Ah20RnKyhaDq5QTpu5bUgnmgNdwqF9eNL9
 0ajJ7rTViDJ8fnAAAI3mFXaw2O03CyPmQNkie1Z9Ua6mrmEvC8K34kbUSXkuf7wXiqZ5
 y7RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=1inmLhcVq0aSD320zpWtlTjRRoDETw4S+Ab6hL0QjO8=;
 b=AgLqWGQqfMK//jJePo2JBhT4Bt9TyT3YC6BOjmMPJwe6nTO9rcufWQcQMGbJbYer+k
 KxEQ1H5w3IlJsA9ll7AFSFX6NcOtsFoGteJldA11+kcRUwP6PeyjDxjL0FsTpfO5Lv2D
 qqkN5oaYaLuT1U+VpVVDZCQ7gQH0OBaKCPW1L7jJk7F4MlvJSDoGO/T04Kic2mcEFoHT
 R39bBc/r5GDxBfKPLfTPpf/VpcfVHkNPIJDKaICtTl+8jhtWSGlMjMAm+itmh00Mfkxc
 xCIzWqNeB4MUtFwinP4uIpM5eYvpbkXM9CcfV+ZvJ+G/lWBiWItXj7vmEg0TMaIS4nol
 hrHA==
X-Gm-Message-State: AOAM531ILYQcktyQo53z+hyBhnxFIctYoL3r7+/G7js9l4kc/KS57EgZ
 2OUmRIr53fGI6KDpJNLbrL6GbDslwD0=
X-Google-Smtp-Source: ABdhPJwupxpLL+usnwEKICgDrxGP2hM9xkHsDUbAGCaUTBKhVWYaRIEF/3s4N74vVBjQG2OtAcccnQ==
X-Received: by 2002:a05:6402:12d4:: with SMTP id
 k20mr15176035edx.344.1624630723968; 
 Fri, 25 Jun 2021 07:18:43 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c28sm326579ejc.102.2021.06.25.07.18.43
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 07:18:43 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 21/28] block: try BSD disk size ioctls one after another
Date: Fri, 25 Jun 2021 16:18:15 +0200
Message-Id: <20210625141822.1368639-22-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210625141822.1368639-1-pbonzini@redhat.com>
References: <20210625141822.1368639-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x529.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Try all the possible ioctls for disk size as long as they are
supported, to keep the #if ladder simple.

Extracted and cleaned up from a patch by Joelle van Dyne and
Warner Losh.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/file-posix.c | 34 ++++++++++++++++------------------
 1 file changed, 16 insertions(+), 18 deletions(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index e56bb491a1..f16d987c07 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -2327,39 +2327,37 @@ static int64_t raw_getlength(BlockDriverState *bs)
 again:
 #endif
     if (!fstat(fd, &sb) && (S_IFCHR & sb.st_mode)) {
+        size = 0;
 #ifdef DIOCGMEDIASIZE
-        if (ioctl(fd, DIOCGMEDIASIZE, (off_t *)&size))
-#elif defined(DIOCGPART)
-        {
-                struct partinfo pi;
-                if (ioctl(fd, DIOCGPART, &pi) == 0)
-                        size = pi.media_size;
-                else
-                        size = 0;
+        if (ioctl(fd, DIOCGMEDIASIZE, (off_t *)&size)) {
+            size = 0;
+        }
+#endif
+#ifdef DIOCGPART
+        if (size == 0) {
+            struct partinfo pi;
+            if (ioctl(fd, DIOCGPART, &pi) == 0) {
+                size = pi.media_size;
+            }
         }
-        if (size == 0)
 #endif
 #if defined(__APPLE__) && defined(__MACH__)
-        {
+        if (size == 0) {
             uint64_t sectors = 0;
             uint32_t sector_size = 0;
 
             if (ioctl(fd, DKIOCGETBLOCKCOUNT, &sectors) == 0
                && ioctl(fd, DKIOCGETBLOCKSIZE, &sector_size) == 0) {
                 size = sectors * sector_size;
-            } else {
-                size = lseek(fd, 0LL, SEEK_END);
-                if (size < 0) {
-                    return -errno;
-                }
             }
         }
-#else
-        size = lseek(fd, 0LL, SEEK_END);
+#endif
+        if (size == 0) {
+            size = lseek(fd, 0LL, SEEK_END);
+        }
         if (size < 0) {
             return -errno;
         }
-#endif
 #if defined(__FreeBSD__) || defined(__FreeBSD_kernel__)
         switch(s->type) {
         case FTYPE_CD:
-- 
2.31.1



