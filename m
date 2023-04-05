Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BBC6D89B8
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 23:38:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkAoH-0005P7-Rm; Wed, 05 Apr 2023 17:36:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pkAo5-0005JM-Dj
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 17:36:41 -0400
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pkAo3-0005cO-Oj
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 17:36:41 -0400
Received: by mail-il1-x134.google.com with SMTP id q5so14135212ilg.12
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 14:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112; t=1680730598;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AeIvXzgL0oZucwVnf8p6ob7Tf8wGgiHdAxgwBN2F8Dc=;
 b=iYX4D0VUvWTGhzDwh2Vf0kXp45+zqdUShNQEhxrk5RBNuKQH21V3p/VbYM4DoEYdla
 mKwXA7GIPrrAf9w1+P4dQ3/gugB5IjhSB5Ix+A9OQGV5eEyEU8LOqofBK5yZccJu2HmW
 ofdtguBVQ/nVGMEzPwlA2qafvbCRaTCBcZnWIYkzMk/nuYBkoQz/3LG52e9MtZjnJoz3
 Z8FbpsZAN1yKEq8wVSVfCEl4EdNVT1bF1WxH52aMCHOWEmR8fwFLh0yrJJ2gmKFewe21
 05RdNEa31i3A6VR9KkGrXG7/4/eKcPmy9aShOAff7+a39NHPY7k+Blh+eJ/4VZxZ4nEP
 DI1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680730598;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AeIvXzgL0oZucwVnf8p6ob7Tf8wGgiHdAxgwBN2F8Dc=;
 b=gv12asGS6d7tuCXGiFju8JfScxjs3A6yCJ9OwLyx3BDFuybSSutvQIkpKY/yuUR+7O
 BoceaDprS/mf8BcrjurapyyQLwtryG566qcAEx4XUj6NmuM5DNXzplQQg+NIPKwqyW2B
 rhG2CepxBmxUF1ysdHSg2d6HqKB1eJLzL9Kc+X+HED4cAuJ7rOaUDDHN9Svx5Ae5CIgY
 TGrmkIqxTwHw2E5+B6nOec+EwADIOqgexoOA+tkGdtbszs/3uWqWBPa83z9wZsk2o23R
 C5b0ZcNTs1Ky+fNxyTXN5wWDysl+yYXtAElFWvLav0r5XakQ8jRlpZ+mSNk+bPc5KtlI
 4rRA==
X-Gm-Message-State: AAQBX9ev/X+BhxDOeIaxYVpRhMuv5S1N9ChC31MFb62L6gl7upY6n63P
 woYaCSSIIaLYIDOhKPThq2ISCAz/tpHh/leZtgc=
X-Google-Smtp-Source: AKy350YwlVD5n8BVNMELRgWfp/1PMZyv45BgzGzE3sLbsSc5fgJURQMJM3p9ukVj1OaCu/+Hxvf8YQ==
X-Received: by 2002:a92:6c06:0:b0:326:c31b:81d1 with SMTP id
 h6-20020a926c06000000b00326c31b81d1mr3568188ilc.14.1680730598019; 
 Wed, 05 Apr 2023 14:36:38 -0700 (PDT)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 i18-20020a926d12000000b003261b6acc8asm4110473ilc.79.2023.04.05.14.36.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 14:36:37 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: reinoud@netbsd.org, riastradh@netbsd.org, ryoon@netbsd.org,
 jrtc27@jrtc27.com, Warner Losh <imp@bsdimp.com>, kevans@freebsd.org,
 Brad Smith <brad@comstyle.com>, Stacey Son <sson@FreeBSD.org>
Subject: [PATCH 13/16] bsd-user: Implement sysctl kern.proc,
 except kern.proc.full_path
Date: Wed,  5 Apr 2023 15:36:09 -0600
Message-Id: <20230405213612.15942-14-imp@bsdimp.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230405213612.15942-1-imp@bsdimp.com>
References: <20230405213612.15942-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::134;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x134.google.com
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


