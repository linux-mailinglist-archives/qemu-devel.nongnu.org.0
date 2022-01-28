Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF4749F05A
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 02:08:10 +0100 (CET)
Received: from localhost ([::1]:38756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDFkH-0004fE-7X
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 20:08:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nDFZO-0003Zg-Gv
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 19:56:54 -0500
Received: from [2607:f8b0:4864:20::f2c] (port=42932
 helo=mail-qv1-xf2c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nDFZK-0005Nd-Cj
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 19:56:51 -0500
Received: by mail-qv1-xf2c.google.com with SMTP id k9so4426662qvv.9
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 16:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3S2V6ARhl1aMzNhU2yWHR2KacSVXhHdyuq3Vlg7QCTA=;
 b=JHkb4WaRYVorkxv/zkj996/7tWaG5S3Rmm2GkQVkDXjJhIXSHy2O9EkvbcUuq5fQqW
 cgyuzUUKbIDbq5vIj9joIPsxFo0VqJrKOB+cIbiMygZHdEc6RHgatA9cnLwGr5h9eBvz
 BD0Y7RILgfpcrCpre9oMn2Xa7oiRrOuYIMgdiuXiUQV9XGgQKIFFXoCflTTHZcKmPMDq
 pORfuwaJunRInwzS4JtuyCpX15VYaeIYN51fwlVOV0fncW2X3cME5nbgJzilgZh9asVi
 9Uk2T67M369Vfsek5G0iR0u6ZuXTOjBgnz2fmpPUVUfSjrtILvXNydEZIP+tK3L/cba2
 1jSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3S2V6ARhl1aMzNhU2yWHR2KacSVXhHdyuq3Vlg7QCTA=;
 b=1STjBv7gsDpgAxlTXWBDQIY1QLCUgraK8YWLY9QgH1IfJTo68GIz7e3znuIsBrHQPN
 A+r9OCwtv6e0xJA2BjnNVbDhZxIhaabDI4YvifaYgZQbHbPHwS48xQJ8Vb7Y0CLIRONy
 IeZv140aB6fWuZ+wGFL7r3XspV+0qhiRooD7yP6VRuy6KMQF5lCUp4mr6X3GDXnXdFPd
 n5g9prOxtje9X8aFp1jnM7eDZHozXQsYZDon5JFLz3U2L6poWP7/F4qTeGv5wh6lVGW8
 J+4p7BwG0dRozhahZ+9/wJAt/UFCdwuZj+KIeIZWKbDNEUJxTgpAcIlxO3kKSsJ7TqQ6
 IdUw==
X-Gm-Message-State: AOAM530u4s3zwqcm8HRudEe6A0VwQofid2CM8JIbwCKN+IP4fxRbjqeB
 sgaUw0NrpwObiyt6zDg8Eh8PNiqayM6dUg==
X-Google-Smtp-Source: ABdhPJwoEGoL6R5P1LlRZINGMxTmEAxWoHnu90uD8Stm87+tK91wxOXshTYOGKOKXgr8uuAlFqY9dg==
X-Received: by 2002:a0c:f84b:: with SMTP id g11mr5898016qvo.11.1643331390064; 
 Thu, 27 Jan 2022 16:56:30 -0800 (PST)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219])
 by smtp.gmail.com with ESMTPSA id d8sm2182003qtd.70.2022.01.27.16.56.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 16:56:29 -0800 (PST)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 05/11] 9p: darwin: Ignore O_{NOATIME, DIRECT}
Date: Thu, 27 Jan 2022 19:56:05 -0500
Message-Id: <20220128005611.87185-6-wwcohen@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220128005611.87185-1-wwcohen@gmail.com>
References: <20220128005611.87185-1-wwcohen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f2c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2c;
 envelope-from=wwcohen@gmail.com; helo=mail-qv1-xf2c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 hi@alyssa.is, Michael Roitzsch <reactorcontrol@icloud.com>,
 Will Cohen <wwcohen@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Keno Fischer <keno@juliacomputing.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Keno Fischer <keno@juliacomputing.com>

Darwin doesn't have either of these flags. Darwin does have
F_NOCACHE, which is similar to O_DIRECT, but has different
enough semantics that other projects don't generally map
them automatically. In any case, we don't support O_DIRECT
on Linux at the moment either.

Signed-off-by: Keno Fischer <keno@juliacomputing.com>
[Michael Roitzsch: - Rebase for NixOS]
Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>
[Will Cohen: - Adjust coding style]
Signed-off-by: Will Cohen <wwcohen@gmail.com>
---
 hw/9pfs/9p-util.h |  2 ++
 hw/9pfs/9p.c      | 13 ++++++++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
index 546f46dc7d..627baebaba 100644
--- a/hw/9pfs/9p-util.h
+++ b/hw/9pfs/9p-util.h
@@ -41,6 +41,7 @@ again:
     fd = openat(dirfd, name, flags | O_NOFOLLOW | O_NOCTTY | O_NONBLOCK,
                 mode);
     if (fd == -1) {
+#ifndef CONFIG_DARWIN
         if (errno == EPERM && (flags & O_NOATIME)) {
             /*
              * The client passed O_NOATIME but we lack permissions to honor it.
@@ -53,6 +54,7 @@ again:
             flags &= ~O_NOATIME;
             goto again;
         }
+#endif
         return -1;
     }
 
diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index 7851f85f8f..9b0c057e9c 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -137,11 +137,20 @@ static int dotl_to_open_flags(int flags)
         { P9_DOTL_NONBLOCK, O_NONBLOCK } ,
         { P9_DOTL_DSYNC, O_DSYNC },
         { P9_DOTL_FASYNC, FASYNC },
+#ifndef CONFIG_DARWIN
+        { P9_DOTL_NOATIME, O_NOATIME },
+        /*
+         *  On Darwin, we could map to F_NOCACHE, which is
+         *  similar, but doesn't quite have the same
+         *  semantics. However, we don't support O_DIRECT
+         *  even on linux at the moment, so we just ignore
+         *  it here.
+         */
         { P9_DOTL_DIRECT, O_DIRECT },
+#endif
         { P9_DOTL_LARGEFILE, O_LARGEFILE },
         { P9_DOTL_DIRECTORY, O_DIRECTORY },
         { P9_DOTL_NOFOLLOW, O_NOFOLLOW },
-        { P9_DOTL_NOATIME, O_NOATIME },
         { P9_DOTL_SYNC, O_SYNC },
     };
 
@@ -170,10 +179,12 @@ static int get_dotl_openflags(V9fsState *s, int oflags)
      */
     flags = dotl_to_open_flags(oflags);
     flags &= ~(O_NOCTTY | O_ASYNC | O_CREAT);
+#ifndef CONFIG_DARWIN
     /*
      * Ignore direct disk access hint until the server supports it.
      */
     flags &= ~O_DIRECT;
+#endif
     return flags;
 }
 
-- 
2.34.1


