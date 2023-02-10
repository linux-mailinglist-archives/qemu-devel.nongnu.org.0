Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7C0692B17
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Feb 2023 00:24:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQcj8-0007BF-1y; Fri, 10 Feb 2023 18:22:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pQcj5-00079f-9R
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 18:22:43 -0500
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pQcj2-00052c-OD
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 18:22:43 -0500
Received: by mail-il1-x12a.google.com with SMTP id w13so2917998ilv.3
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 15:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sMGqedAh8Ans+v+hJJSpSqEHhstJlaRxbkoS1A21XV8=;
 b=mXlBN2Jr9FVfellGhEpCMzsQuiMqDPvSO+uGPTVldVJKLdICjeY0mIy59KmnLAKdZL
 4DouulfDb/qsgFU3o0/c5r2t5Sv5l/IwRt+r7MRPVWMk9XAnJEm3W5qM/Y7b+0Zaad7m
 7gLPZg0np5/UGoEBLO/F/9Vqx5zxMsvsGrMUwitnzzvmNirC+SG7U9l2EWN0p6r/ucmS
 SkqXC5WlyCnVFmvYavjuoFcuHgoWErt2VSx6pcn6OZma3fInKYUbZ9kJp28mwo9tieTn
 IrW1WkwlLZeGOcYzM1ImmSKPA0fi/yZj0i00vMImiGNngFwtx5T1XLWsjmjieg/7Fe80
 1Tig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sMGqedAh8Ans+v+hJJSpSqEHhstJlaRxbkoS1A21XV8=;
 b=493ZNT/d+0HpJrkwaOW8qgxU5a/MuiiWA/WGZXYwhs1Q4CEDgynatDqXMqXb+mDpin
 GvRU5G775AQZi8CDxTL4Brojqm7mdTW0AdrweTBvDDBN0WzruiPphn1ziRBNG2/7DGVb
 /CxxWLQtH6gkEQugXmNZ7ukn0jnGfeHSpGreQ9aaRwar4Xn4YjuvP6hi6SckM6+cKfxD
 kfed9UnzV0up3vnxXidCj5tVSs60SqIJqqLRoMDuULJ6rIihbsTd4QlK29AbhorEDztb
 OhdUTO+XxuMt1/vwwamRL3wPxCyRxGVS2ApKYOHOTiH0qRDZVO7f44qopjs7wc0K05tW
 CRHQ==
X-Gm-Message-State: AO0yUKWmQkFAAoQKpJbs5o6yEpJWvgU52MGxZwr1BTMwBKA7ybFuQHK/
 vDHm8L+GH7/wR3Cxif4QJ+IrrqhkSKAZsUCg
X-Google-Smtp-Source: AK7set/8vuS9+ug5uJSa2BoM4AMF1FkYdC1fgCZ6Ne0Cpt/xG272ogHgBrwnj+HOY+8gCx/8MuzB7Q==
X-Received: by 2002:a92:2611:0:b0:311:e48:d64a with SMTP id
 n17-20020a922611000000b003110e48d64amr11896249ile.17.1676071359109; 
 Fri, 10 Feb 2023 15:22:39 -0800 (PST)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 k18-20020a02c772000000b003a9418e89acsm1850995jao.23.2023.02.10.15.22.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 15:22:38 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 f4bug@amsat.org, Warner Losh <imp@bsdimp.com>,
 richard.henderson@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Juergen Lock <nox@jelal.kn-bremen.de>
Subject: [PATCH 5/9] bsd-user: sysctl helper funtions: sysctl_name2oid and
 sysctl_oidfmt
Date: Fri, 10 Feb 2023 16:18:25 -0700
Message-Id: <20230210231829.39476-6-imp@bsdimp.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230210231829.39476-1-imp@bsdimp.com>
References: <20230210231829.39476-1-imp@bsdimp.com>
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

From: Juergen Lock <nox@jelal.kn-bremen.de>

Helper functions for sysctl implementations. sysctl_name2oid and
sysctl_oidfmt convert oids between host and targets

Signed-off-by: Juergen Lock <nox@jelal.kn-bremen.de>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/freebsd/os-sys.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/bsd-user/freebsd/os-sys.c b/bsd-user/freebsd/os-sys.c
index e3b9f168a2b..ac5ab9b17bc 100644
--- a/bsd-user/freebsd/os-sys.c
+++ b/bsd-user/freebsd/os-sys.c
@@ -115,6 +115,24 @@ static int sysctl_oldcvt(void *holdp, size_t *holdlen, uint32_t kind)
     return 0;
 }
 
+/*
+ * Convert the undocmented name2oid sysctl data for the target.
+ */
+static inline void sysctl_name2oid(uint32_t *holdp, size_t holdlen)
+{
+    size_t i, num = holdlen / sizeof(uint32_t);
+
+    for (i = 0; i < num; i++) {
+        holdp[i] = tswap32(holdp[i]);
+    }
+}
+
+static inline void sysctl_oidfmt(uint32_t *holdp)
+{
+    /* byte swap the kind */
+    holdp[0] = tswap32(holdp[0]);
+}
+
 /* sysarch() is architecture dependent. */
 abi_long do_freebsd_sysarch(void *cpu_env, abi_long arg1, abi_long arg2)
 {
-- 
2.39.1


