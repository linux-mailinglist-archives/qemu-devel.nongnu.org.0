Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E79C6DCAA5
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Apr 2023 20:22:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plw8z-0002l3-H8; Mon, 10 Apr 2023 14:21:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1plw8l-0002gB-Pl
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 14:21:20 -0400
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1plw8k-0000gk-2Q
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 14:21:19 -0400
Received: by mail-il1-x129.google.com with SMTP id o12so21100451ilh.13
 for <qemu-devel@nongnu.org>; Mon, 10 Apr 2023 11:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112; t=1681150877;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Hvg0H+jAXckcuN28KMVfXkb7fwvWyCcCCQgrLkQjtV8=;
 b=Tjoxy6VuxnMkEwLnB6Z6ybsqqQ6KUW4LcJja6iRu0NtoSZqeXPv4eKzzhIi7mfi+J/
 Mxxc2FkQ0hSJ8TG504R+Q2Lc2hUsaMkU+b5uYeh6TgawAmB+jGsGbiLv4omWgl8dfeyn
 WFTmf6P6S3e6FO3tHDy/wXyQT8O3WU2jQouGrzdtXOFG/6UTyvZba/PxIjr3sGwS1B05
 059nGJE+5SqYiVirASjAr+iZSIEAhqe8rP+j5APiLtyafzcF32HTJ715miQk0jDFPlgK
 CAMjFaOIHD1hkuce5AB+a8pMLdO9o1cQ2pbbeiIFr0tVZn8/fVS6G4Sfr29sfR44PtXo
 4eNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681150877;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Hvg0H+jAXckcuN28KMVfXkb7fwvWyCcCCQgrLkQjtV8=;
 b=hjYGk4eMQ9UCG1YlogswS/lUvS9ZWYVbTZi+lJHE6wIvSi2wHYF9bvfbcT0VICQMM4
 ZOIQeMgFcswAJKx2cpfsCkeRzfH8cru/91Cl8y7nbr5eAt49Pu2vw09PJhEQASrOH+t6
 lwRx1hl5AnCrrA/PENNkzQfIoI7m8PQbHxAuKbDuuCDUd8nWVvKkdT7vbBgoUJGoPWl/
 qbsvLpPuXvuBEiHmPP33ohFAQGVpSbOmthoWwIkRE6bfG0Nzbq3swsLFWUdm2Ok+2C9V
 7Z5eBJDQ7f7cwdqDHnS7o5F1v9eT3afEZ2ledfL7psHXJLlXTrVXrBmIo3qSfriopTrT
 HH9g==
X-Gm-Message-State: AAQBX9eITbTxFST94WO1RqhnHk+5rCGDFgqLHOgfcMBAhbJNyxK7cGPS
 WYkgoAafdP8Txxhm1fkVefr8d68g8Vrj4VtOvJk=
X-Google-Smtp-Source: AKy350ZiuLG6M6Qh9RPr812ixEAieuKXDnf3dSdrYG8e+ZrARK/yeIT5Vjj8evLylxxc8oT+UlYHgA==
X-Received: by 2002:a92:608:0:b0:322:fe79:8141 with SMTP id
 x8-20020a920608000000b00322fe798141mr270238ilg.1.1681150877098; 
 Mon, 10 Apr 2023 11:21:17 -0700 (PDT)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 a15-20020a056e02120f00b00313b281ecd2sm3104314ilq.70.2023.04.10.11.21.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 11:21:16 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: jrtc27@jrtc27.com, riastradh@netbsd.org, Kyle Evans <kevans@freebsd.org>,
 Ryo ONODERA <ryoon@netbsd.org>, Brad Smith <brad@comstyle.com>,
 Warner Losh <imp@bsdimp.com>, reinoud@netbsd.org,
 Stacey Son <sson@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 13/19] bsd-user: Implement sysctl kern.proc,
 except kern.proc.full_path
Date: Mon, 10 Apr 2023 12:20:50 -0600
Message-Id: <20230410182056.320-14-imp@bsdimp.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230410182056.320-1-imp@bsdimp.com>
References: <20230410182056.320-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::129;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x129.google.com
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

From: Stacey Son <sson@FreeBSD.org>

Use the recently committed conversion routines to implement all the
kern.proc flavors, except for the full path (the prereqs of which aren't
yet in qemu-project's master branch).

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/freebsd/os-sys.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/bsd-user/freebsd/os-sys.c b/bsd-user/freebsd/os-sys.c
index 418358adc1e..3772cf500ba 100644
--- a/bsd-user/freebsd/os-sys.c
+++ b/bsd-user/freebsd/os-sys.c
@@ -753,6 +753,41 @@ static abi_long do_freebsd_sysctl_oid(CPUArchState *env, int32_t *snamep,
             ret = 0;
             goto out;
 
+        case KERN_PROC:
+            switch (snamep[2]) {
+            case KERN_PROC_ALL:
+            case KERN_PROC_PROC:
+            case KERN_PROC_PID:
+            case KERN_PROC_PID | KERN_PROC_INC_THREAD:
+            case KERN_PROC_PGRP:
+            case KERN_PROC_PGRP | KERN_PROC_INC_THREAD:
+            case KERN_PROC_SESSION:
+            case KERN_PROC_SESSION | KERN_PROC_INC_THREAD:
+            case KERN_PROC_TTY:
+            case KERN_PROC_TTY | KERN_PROC_INC_THREAD:
+            case KERN_PROC_UID:
+            case KERN_PROC_UID | KERN_PROC_INC_THREAD:
+            case KERN_PROC_RUID:
+            case KERN_PROC_RUID | KERN_PROC_INC_THREAD:
+                ret = do_sysctl_kern_getprocs(snamep[2], snamep[3], oldlen,
+                                              holdp, &holdlen);
+                goto out;
+
+            case KERN_PROC_FILEDESC:
+                ret = do_sysctl_kern_proc_filedesc(snamep[3], oldlen, holdp,
+                                                   &holdlen);
+                goto out;
+
+            case KERN_PROC_VMMAP:
+                ret = do_sysctl_kern_proc_vmmap(snamep[3], oldlen, holdp,
+                                                &holdlen);
+                goto out;
+
+            default:
+                break;
+            }
+            break;
+
         default:
             break;
         }
-- 
2.40.0


