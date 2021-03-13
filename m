Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0614339F32
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 17:47:36 +0100 (CET)
Received: from localhost ([::1]:40812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lL7QN-0000hb-Vd
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 11:47:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lL7HO-0002W2-VR; Sat, 13 Mar 2021 11:38:18 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:38791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lL7HL-0007Ki-BD; Sat, 13 Mar 2021 11:38:18 -0500
Received: by mail-wr1-x434.google.com with SMTP id z2so3446404wrl.5;
 Sat, 13 Mar 2021 08:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SWr56kRSOwx9E4WVmBZO8tKFvHyaIRM7iDN7QdVhN0M=;
 b=jPfH694KCyCjIth3PR+wUrfs/TcMLA+8AIanuYJ/UoaBQbdMQsq0elAXtYE9oFjf+t
 hYNqE7FDQ1YAbO+3PXM/KUA1vfmpIp4NEu3CvPnBQMQhjqhY5K1R66+qXWuKzsFELoz9
 L/a/xQRZHfb9NbqGJ2WroA7PtSSg2yUPJVGu7I4VCoEpZs9h60SCpg73PH3EWJJLiILV
 JTvdVj+yte3ATRLnze8ivy3+f8HDlPK48RKQpOgrgnq2+Pvk5SdGxN7pWrmu+M5A0zcN
 OASL4Yi+Mb8T7vp5vz/O+IInSGDCTkq+o786S7LGbrkfiaUhBmxrk/8YqdsSZTXR67Of
 Y4vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SWr56kRSOwx9E4WVmBZO8tKFvHyaIRM7iDN7QdVhN0M=;
 b=gB9dEvIkDFJoaCQ906q3YjM9K5F247xu5B0PEXs/tiFHrKUMqKRS4ZB9ApiWxPGpZq
 qrWmQlQomRr0iMUihuHOLRyKZcldNcUPUEOtuQKvLBTtLzyRaLdBdV1gpGmxaGawBgsP
 1rD/rdopcfrEVdjOPyldE5AzIvveUEy3KrU/jMeFynvkhnOCR0lgyIXAjMK11gF3CqI+
 AKc9HwRs0U69pbuEhHKvqCe0/XDKc4aj5UL3I4Ver7uczwr3udahhzorW3q0BlFbClF6
 kpWEFah1Ev4LFh4EeXxmHy4ZIZJPQ/1A+XAKGKUup0U3GmQ1n0Xzd/EETIjBVsyRTs8s
 IZVg==
X-Gm-Message-State: AOAM533l5ElXSQdKrDTSMZNaUHoEapR+FGaQhdkoN5HtXq8spu+xnCQR
 nbRuv2VjCU7TfDA5kGOlHDjura/CBhI=
X-Google-Smtp-Source: ABdhPJxqhyViQNChPyViLihVE2NJZWTLFTqDZaFVMNd94ILueqa7sIVhyVYRZF8KkoimwB/X8RSidw==
X-Received: by 2002:a05:6000:18a3:: with SMTP id
 b3mr19661574wri.373.1615653488562; 
 Sat, 13 Mar 2021 08:38:08 -0800 (PST)
Received: from localhost.localdomain ([197.61.164.30])
 by smtp.googlemail.com with ESMTPSA id n6sm13173441wrt.1.2021.03.13.08.38.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Mar 2021 08:38:08 -0800 (PST)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/9] pc-bios/s390-ccw/netmain.c: Changed a malloc/free to
 GLib's variants
Date: Sat, 13 Mar 2021 18:36:48 +0200
Message-Id: <20210313163653.37089-5-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210313163653.37089-1-ma.mandourr@gmail.com>
References: <20210313163653.37089-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "open list:S390-ccw boot" <qemu-s390x@nongnu.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Changed a call to malloc() and its respective calls free() with
GLib's allocation and deallocation functions.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
---
 pc-bios/s390-ccw/netmain.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/pc-bios/s390-ccw/netmain.c b/pc-bios/s390-ccw/netmain.c
index 056e93a818..7f78150144 100644
--- a/pc-bios/s390-ccw/netmain.c
+++ b/pc-bios/s390-ccw/netmain.c
@@ -243,7 +243,7 @@ static const char *get_uuid(void)
     int i, cc, chk = 0;
     static char uuid_str[37];
 
-    mem = malloc(2 * PAGE_SIZE);
+    mem = g_try_malloc(2 * PAGE_SIZE);
     if (!mem) {
         puts("Out of memory ... can not get UUID.");
         return NULL;
@@ -261,7 +261,7 @@ static const char *get_uuid(void)
                  : "d" (r0), "d" (r1), [addr] "a" (buf)
                  : "cc", "memory");
     if (cc) {
-        free(mem);
+        g_free(mem);
         return NULL;
     }
 
@@ -269,7 +269,7 @@ static const char *get_uuid(void)
         uuid[i] = buf[STSI322_VMDB_UUID_OFFSET + i];
         chk |= uuid[i];
     }
-    free(mem);
+    g_free(mem);
     if (!chk) {
         return NULL;
     }
-- 
2.25.1


