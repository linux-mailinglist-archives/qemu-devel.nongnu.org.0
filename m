Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E83D059F7B3
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 12:29:01 +0200 (CEST)
Received: from localhost ([::1]:33748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQnd7-0008JX-1X
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 06:29:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmtr-00031p-Vp
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:42:15 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:34553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmtp-0001Xc-HY
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:42:14 -0400
Received: by mail-pl1-x635.google.com with SMTP id io24so1898118plb.1
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 02:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=3b8VL5TpGtN7dWhCerIisYEccmQt7giekuIGaaaF6O8=;
 b=qjaaqfAWuFwFCJHnVsNpJJ4gN1ZDvHmCZyVyO4SqM97cld8qBtRn0kZg6ii5eWL4mQ
 4AI1pqRO7A1G6V85mw18rNARWTtZgxG54oPSuhyDplklrcoa3sPoToZv60SHmGzqznp7
 RCXAiGvk9Dczt2OPMbctu7lNYMCrQ9VTgXmeO2UFijR6sMbrHlw81TJ+zw2fZmS8SfkF
 pt6hqMjnehG6SHtCfnQV9GlSjGovSzRH9wsNOo7PkISsBv8C66soAKI6OkGtQ7JV68Ed
 qdp6QyNBUY7kBFo/NFE0eu1yZFVpe/ETKUxUEurFPC/r1qWcSuAeiQVbsoGtBOhkPD3J
 W3Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=3b8VL5TpGtN7dWhCerIisYEccmQt7giekuIGaaaF6O8=;
 b=uai9jVRGSynNRRNuHcIB7OBstjVIhRGG87/n78ve26FCinJJuKePYG43kwj+asjwnU
 /PSgQzxdDN6bp3IVdLrgwGqTqkPsCaNV6kRX+Ti6DV8HU/a4e5TwLy3qqgfJIFQ54I7d
 /o/khIQDrAPT24l7Hievr8PmZC899zXjAfMgaJtbZ40l4EAgvF+5RTIDe+buiTBk//ny
 5zzE0E5BGBU8q2ZUe58EWIZyQHWjPs4yHHIQ0thc65saIUfz7OrXwiLke133Htz/AeKu
 KhphO+LHnfmLiGpYAzJMfkLwaDYG8lXiQXds4YevEZjNd3AW4ybBd/xZAlwSBO3KW4NY
 G9IQ==
X-Gm-Message-State: ACgBeo26Hwu2ep+EAbTIcmPNqcErKh2sOyXIkNI1NfkFblCEZ9FnF/64
 C2IZWPJuLPHXC9BuTvxskNaP2UOV2Xw=
X-Google-Smtp-Source: AA6agR5TBeQk+xNJ/7wJcR3S3X6PS/Fvdo+awDk7uXMldiZ9G0Do5uNda7Y3iC5uEX0W7ux4dY1GSg==
X-Received: by 2002:a17:90b:4a51:b0:1f5:8308:6ed7 with SMTP id
 lb17-20020a17090b4a5100b001f583086ed7mr7374559pjb.177.1661334132149; 
 Wed, 24 Aug 2022 02:42:12 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a170903228e00b001728eb339e2sm12165972plh.286.2022.08.24.02.42.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 02:42:11 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>
Subject: [PATCH 14/51] backends/tpm: Exclude headers and macros that don't
 exist on win32
Date: Wed, 24 Aug 2022 17:39:52 +0800
Message-Id: <20220824094029.1634519-15-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220824094029.1634519-1-bmeng.cn@gmail.com>
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Bin Meng <bin.meng@windriver.com>

These headers and macros do not exist on Windows. Exclude them.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 backends/tpm/tpm_ioctl.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/backends/tpm/tpm_ioctl.h b/backends/tpm/tpm_ioctl.h
index bd6c12cb86..d67bf0283b 100644
--- a/backends/tpm/tpm_ioctl.h
+++ b/backends/tpm/tpm_ioctl.h
@@ -9,8 +9,10 @@
 #ifndef TPM_IOCTL_H
 #define TPM_IOCTL_H
 
+#ifndef _WIN32
 #include <sys/uio.h>
 #include <sys/ioctl.h>
+#endif
 
 #ifdef HAVE_SYS_IOCCOM_H
 #include <sys/ioccom.h>
@@ -222,6 +224,7 @@ typedef struct ptm_setbuffersize ptm_setbuffersize;
 #define PTM_CAP_SET_DATAFD         (1 << 12)
 #define PTM_CAP_SET_BUFFERSIZE     (1 << 13)
 
+#ifndef _WIN32
 enum {
     PTM_GET_CAPABILITY     = _IOR('P', 0, ptm_cap),
     PTM_INIT               = _IOWR('P', 1, ptm_init),
@@ -241,6 +244,7 @@ enum {
     PTM_SET_DATAFD         = _IOR('P', 15, ptm_res),
     PTM_SET_BUFFERSIZE     = _IOWR('P', 16, ptm_setbuffersize),
 };
+#endif
 
 /*
  * Commands used by the non-CUSE TPMs
-- 
2.34.1


