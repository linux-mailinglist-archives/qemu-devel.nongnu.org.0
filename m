Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B41154323AE
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 18:19:39 +0200 (CEST)
Received: from localhost ([::1]:45224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcVMQ-0002Yb-Qc
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 12:19:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcV8z-0007ix-0k
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 12:05:46 -0400
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32]:33737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcV8m-00081l-MR
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 12:05:39 -0400
Received: by mail-io1-xd32.google.com with SMTP id n7so16966236iod.0
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 09:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vJYc+d0t5Q+xLUHUW/ZgWS+rpFy2RSrgUaVL6ybl14c=;
 b=tDfhWSIofsP9YIW4wl78egNO+5a2y0hVHJsfwOqsAeip0oxEsPqmJLJZlV4wZU2qVT
 3au2J2KpbxJ7eZu6ZdjalIl9OQG2mlE+bp6XRXet6kFwapIVb+8i7vwnR4educjvDhNB
 NbfBS0q4MFx0FaFgudW2cgj0cv0hC3prWV0aA1oEK5u6gm/XIgGzoliC/T7m3nJljmo8
 izCCNkIrV8AXxOXT4jeiZO+rXyIpxxowVKwbv/G5y90nv75LlqLpi2dm1qryqyxzHdk6
 ceUab4+Ith4eZOuONK91D9lUTmZJMLqBtzHmuACI9N6KI3ydGRQFBt7oJHN/xCs+id+B
 +Org==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vJYc+d0t5Q+xLUHUW/ZgWS+rpFy2RSrgUaVL6ybl14c=;
 b=46hzTA1OdmkVRB0LFCSDRcD4oox+eTbzGoh1g5w/LRLyOKNsR45upQB6fy/2Tuz1OH
 sX2/SeSOqQphIOmRNPcZuFtvddn6vvTi+NDBKvzjsimeU6wnsCI6PxJkLSmhkef8Rjbl
 bxywodjLWOat2sSsKjG1ncGoSDSLpge4KsD7ez4BNOYkKeWTnmAz0+t6yeAfA1LIJtQh
 uGdMXgyPtLj28khTOQ44tgXxoYRziSl1ykvN2b3LQFOqjp1k7vbZRU4VEfZTCdtwl2Jc
 7+xTkE83j2G//D4S/6nvuKyG2l898JAto3XTHE1zmY78Wx/ydtilLowFGnX+X9KyipoS
 FW8g==
X-Gm-Message-State: AOAM531x6eVeojfKnSOGt28uSV/j1I484udr2fzEuy/iC0njOngC282r
 GZL5n5Op1BnhMK/ekC4fGUfe2N5xIub1ug==
X-Google-Smtp-Source: ABdhPJzahoMKS3TEJnLZbRZdQQAhaEFHyLp2pggb8su6VJFGEReeL75k7XraA56XNrC0zXH5BDy2WA==
X-Received: by 2002:a5e:d80a:: with SMTP id l10mr15311166iok.182.1634573128657; 
 Mon, 18 Oct 2021 09:05:28 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a4sm7240936ild.52.2021.10.18.09.05.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 09:05:28 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/23] bsd-user: export get_errno and is_error from syscall.c
Date: Mon, 18 Oct 2021 10:04:49 -0600
Message-Id: <20211018160458.1976-15-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211018160458.1976-1-imp@bsdimp.com>
References: <20211018160458.1976-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d32;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd32.google.com
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
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make get_errno and is_error global so files other than syscall.c can use
them.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
---
 bsd-user/qemu.h    |  4 ++++
 bsd-user/syscall.c | 10 +++++-----
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index 522d6c4031..3b8475394c 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -235,6 +235,10 @@ extern unsigned long target_dflssiz;
 extern unsigned long target_maxssiz;
 extern unsigned long target_sgrowsiz;
 
+/* syscall.c */
+abi_long get_errno(abi_long ret);
+bool is_error(abi_long ret);
+
 /* user access */
 
 #define VERIFY_READ  PAGE_READ
diff --git a/bsd-user/syscall.c b/bsd-user/syscall.c
index 372836d44d..2fd2ba8330 100644
--- a/bsd-user/syscall.c
+++ b/bsd-user/syscall.c
@@ -33,18 +33,18 @@
 static abi_ulong target_brk;
 static abi_ulong target_original_brk;
 
-static inline abi_long get_errno(abi_long ret)
+abi_long get_errno(abi_long ret)
 {
-    if (ret == -1)
+    if (ret == -1) {
         /* XXX need to translate host -> target errnos here */
         return -(errno);
-    else
-        return ret;
+    }
+    return ret;
 }
 
 #define target_to_host_bitmask(x, tbl) (x)
 
-static inline int is_error(abi_long ret)
+bool is_error(abi_long ret)
 {
     return (abi_ulong)ret >= (abi_ulong)(-4096);
 }
-- 
2.32.0


