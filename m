Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E886DE20A
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 19:12:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmHW8-0003tC-6a; Tue, 11 Apr 2023 13:10:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pmHVx-0003rk-QU
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 13:10:43 -0400
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pmHVt-00069e-1P
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 13:10:39 -0400
Received: by mail-il1-x12a.google.com with SMTP id b7so2898769ilm.4
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 10:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112; t=1681233035;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Hvg0H+jAXckcuN28KMVfXkb7fwvWyCcCCQgrLkQjtV8=;
 b=fAEqfK9cjSjOMNEfhZ/U/A35iKIDORWKRFgrKRjBasaj1jneqQD3Mj7RXDm/rJCYSH
 WBuN3txTxZgcnYLq06upQDy09HN2Gwp8Dgtg/d8SZ8/IOfZEce5V1Q85IiaQ3FjWr/iV
 qVomB+giD3opJAh0kRkVUaRn70laMsURhTrWjSNINFWF6Kg+XU9xkDCZ8aYn+5Uu/iJi
 sadJNHXdDMyag36CoFMQCwjuF+Wi4aijAYiZL4+zYC5BIjfjl1Bsz1yOn5w51Bu3Zi4Z
 WPqYl8sEL4mvQshR+21lPgq7VFc6xmWP6yBDR4PLt+TaHFgO+Lqi6m3zvdxlzGZVOVfg
 YXIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681233036;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Hvg0H+jAXckcuN28KMVfXkb7fwvWyCcCCQgrLkQjtV8=;
 b=0hGkhnd1t0O06pdzOxdBENjkuA4HC35sO0qlKvv543HZFtZm2WHMC4Nog7XqTHUZ73
 VUHg9PxbKhbq6WzlzzRWzol92xdfWhy+Hj5pvOxgRakn+ldiyZNsOKs0iNUq3F6jiDMu
 zrVI1vky2dnp/c0iFafJj6SnoC0yqO4GnbrxR/Bkx82LL5yL2gYYd6ANZFJ96LOcLCQN
 Zy+R/3bPoqcQj4d2bftUz+xvLkiEOtQ4RIY9Omn7HaMXdckKimj8jgKlVkw7B4oAsFDj
 1ZDQGIwkfETCzFkKpR7ad9H5HpybSj4kYPYSKlI7UATFIzDymkPrhQ8ytBKavuSNY5RQ
 KxIg==
X-Gm-Message-State: AAQBX9fflER69xWOVZpZs2po64xTdgNqNBMa000iQZwxS7Y6bbPSU5IG
 xMUFD5+8fmg2/OWiXdzt+K4Tmcb533k98JdAp/I=
X-Google-Smtp-Source: AKy350aAQx6sR6CwkawIu1ZrGCp7NCn5XRryyNdgPag36WjuyV0tQQkmGff9EGM4MrFVvp8OfcZ/vA==
X-Received: by 2002:a92:d991:0:b0:325:b783:b47f with SMTP id
 r17-20020a92d991000000b00325b783b47fmr8691085iln.18.1681233035591; 
 Tue, 11 Apr 2023 10:10:35 -0700 (PDT)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 d36-20020a0285a7000000b0040b11b7ef54sm4140942jai.39.2023.04.11.10.10.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 10:10:35 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: ryoon@netbsd.org, kevans@freebsd.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, riastradh@netbsd.org, brad@comstyle.com,
 reinoud@netbsd.org, jrtc27@jrtc27.com,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Warner Losh <imp@bsdimp.com>,
 Stacey Son <sson@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 13/20] bsd-user: Implement sysctl kern.proc,
 except kern.proc.full_path
Date: Tue, 11 Apr 2023 11:09:48 -0600
Message-Id: <20230411170955.17358-14-imp@bsdimp.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230411170955.17358-1-imp@bsdimp.com>
References: <20230411170955.17358-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12a;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12a.google.com
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


