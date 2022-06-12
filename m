Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D680A547C11
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Jun 2022 22:51:27 +0200 (CEST)
Received: from localhost ([::1]:47846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0UYO-0008NM-H0
	for lists+qemu-devel@lfdr.de; Sun, 12 Jun 2022 16:51:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o0UVp-0005Ys-G8
 for qemu-devel@nongnu.org; Sun, 12 Jun 2022 16:48:45 -0400
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c]:40616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o0UVn-00006s-Ov
 for qemu-devel@nongnu.org; Sun, 12 Jun 2022 16:48:45 -0400
Received: by mail-io1-xd2c.google.com with SMTP id y12so4285781ior.7
 for <qemu-devel@nongnu.org>; Sun, 12 Jun 2022 13:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cEJDJrjR3J4emGzve8B4wM/c+RbwK/Ry3KMIdR1yyzs=;
 b=aO9EHYlBAEFcZmhxfJ43HqGSlhgnk62hWSqmpl4dfHddkAAbZ1dv9CY4q8mKLup3gQ
 WkFwGXZxx6WpsTpf6ffWL+b/ENgISrYD0HyIDvnlmeIYMOMi311pueJIVWSpV3vunaPU
 DvEW7O0iWq3nN5dmM3p0m6gcB18AY2V1/PzAbWnHVYu8B+qqbU7mrsWaYm//d59nnYS4
 ndeZfigjdp7ljobrYZ1ug6OjU0y2Jh3YqOLEhg0oe04QENAEKoSrqBD+a/YE7rabBcng
 cASFwr9gk3DPkrdGTjNSaUNbLvtflKNCdW1us9X41h+3LjeN5/iHx5y2XNJk2gNzM7Sa
 cPdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cEJDJrjR3J4emGzve8B4wM/c+RbwK/Ry3KMIdR1yyzs=;
 b=tmjKpotjbDkAwG3S1OKESFRRFKWRdPLuepxkZgVet07GTBiko/pl6UNXop1iOo6YYh
 u10SvhdygdpXo53sASahJ2YPg9V2bGd9ZFNRszY2BW73sUzbl3/XWh8VVfkgsiFPN/6t
 X+kGX9Q9zE1Y9kSC/W/5SihjYz80qpQr97FgsxJJExoG1EtxKoznNFUVpjRUnQecied9
 3/wfVxDidft2az654eytCDeFSXTFjj1Dk46d5XbFRBM4DqHvMyYHg5K+JO9cUHUa7UDc
 JUGK2tUdMG3qnkUCTrBNaGz7ULsmcKWc2A6FMWVMhwJK8wuDUter91A2RjZfjsTSOOLB
 Icpw==
X-Gm-Message-State: AOAM531SbSy87imuGD8EDBegbrtfuVfgONifVbGFNS3qZDUHvMalzmSL
 yBfGoEnWoflnk5rX5mtPvq4gkznKsYgkbg==
X-Google-Smtp-Source: ABdhPJwvSsyXLuFhtQGNTRK0c2OdvLL6sCaIOV0G90JwORiuUYV6R6cToyA9NtE+XKxVMWtu51lqZg==
X-Received: by 2002:a05:6602:1555:b0:669:da4a:d8f3 with SMTP id
 h21-20020a056602155500b00669da4ad8f3mr1804978iow.192.1655066922284; 
 Sun, 12 Jun 2022 13:48:42 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 j2-20020a056e02124200b002d1d8de99e7sm2911612ilq.40.2022.06.12.13.48.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jun 2022 13:48:41 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: jrtc27@FreeBSD.org, Warner Losh <imp@bsdimp.com>, def@FreeBSD.org,
 arrowd@freebsd.org, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stacey Son <sson@FreeBSD.org>
Subject: [PATCH 04/11] bsd-user: Implement chdir and fchdir
Date: Sun, 12 Jun 2022 14:48:44 -0600
Message-Id: <20220612204851.19914-5-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220612204851.19914-1-imp@bsdimp.com>
References: <20220612204851.19914-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/bsd-file.h           | 20 ++++++++++++++++++++
 bsd-user/freebsd/os-syscall.c |  8 ++++++++
 2 files changed, 28 insertions(+)

diff --git a/bsd-user/bsd-file.h b/bsd-user/bsd-file.h
index 37b3efccd2c..8e5d302972c 100644
--- a/bsd-user/bsd-file.h
+++ b/bsd-user/bsd-file.h
@@ -315,4 +315,24 @@ static abi_long do_bsd_faccessat(abi_long arg1, abi_long arg2,
     return ret;
 }
 
+/* chdir(2) */
+static abi_long do_bsd_chdir(abi_long arg1)
+{
+    abi_long ret;
+    void *p;
+
+    LOCK_PATH(p, arg1);
+    ret = get_errno(chdir(p)); /* XXX  path(p)? */
+    UNLOCK_PATH(p, arg1);
+
+    return ret;
+}
+
+/* fchdir(2) */
+static abi_long do_bsd_fchdir(abi_long arg1)
+{
+
+    return get_errno(fchdir(arg1));
+}
+
 #endif /* BSD_FILE_H */
diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
index 7b7af914e49..8698db358c1 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -301,6 +301,14 @@ static abi_long freebsd_syscall(void *cpu_env, int num, abi_long arg1,
         ret = do_bsd_faccessat(arg1, arg2, arg3, arg4);
         break;
 
+    case TARGET_FREEBSD_NR_chdir: /* chdir(2) */
+        ret = do_bsd_chdir(arg1);
+        break;
+
+    case TARGET_FREEBSD_NR_fchdir: /* fchdir(2) */
+        ret = do_bsd_fchdir(arg1);
+        break;
+
     default:
         qemu_log_mask(LOG_UNIMP, "Unsupported syscall: %d\n", num);
         ret = -TARGET_ENOSYS;
-- 
2.33.1


