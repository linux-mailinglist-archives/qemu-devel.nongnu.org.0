Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5794395528
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 07:55:36 +0200 (CEST)
Received: from localhost ([::1]:52918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnatj-0004tF-UK
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 01:55:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yamamoto@midokura.com>)
 id 1lnapX-00052p-PX
 for qemu-devel@nongnu.org; Mon, 31 May 2021 01:51:15 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:33534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yamamoto@midokura.com>)
 id 1lnapW-0003qG-1x
 for qemu-devel@nongnu.org; Mon, 31 May 2021 01:51:15 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 k22-20020a17090aef16b0290163512accedso1149685pjz.0
 for <qemu-devel@nongnu.org>; Sun, 30 May 2021 22:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=midokura.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jZBlbfeu3NXCpv3F7hDFEvZVI/DgvLfsFk5ytNgoOU8=;
 b=bJfck3h20NHGnpqQRT+T2eDYLj+kBbtUmaE2JQgaBcHcVSyCLbSr88XQfl29FqXiyp
 ZXstTRQNJQn18TZiHsbl5Llv3NQJM4im4N2PfV2bvCNZJ8Z/RRhCsqTrInbAzFtL0kzB
 MrIrTsmlZPOg3TsBUgEppv6Q7KiOB+qtxoRxQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jZBlbfeu3NXCpv3F7hDFEvZVI/DgvLfsFk5ytNgoOU8=;
 b=s3v48yyfPiul318XLnaoEpPtJ7mFB9D4dAUd8k0R0kFvUokBfHR7BATEcgLqnEijLJ
 Ck3EWbxhkeGdlP8kJXc8RQSeHSRKa80tQ1HfyDurtMhLjrfEX7E26rMTotrIdC/E6p3P
 uSnafYp1uikLKuaOZvVpIDhJHC9rvk8b0amgM17198q7n52HESGG8xPgRYOrwlydfAt/
 M8Eajf9FuACBR1YLoyFKyoMqDTwjMxgYLSuZwPXomDhpl9KnRl5hXt9m7hKC8R30G8yM
 Bu1sIpjS7Ym5k5AzOrXRO4Op4M5jkm05C+CJmFG8slVmfUO9C459gpV4tP/PUBK1WkbP
 ID9A==
X-Gm-Message-State: AOAM531yrTexEViUuiC04hq6j3hKavsNkmMAqbkgjs1OoiM6dZ9Y7P1v
 9J63aGAmvpPMZHk+zvFUclb+3VpQUtxVwg==
X-Google-Smtp-Source: ABdhPJwh1uedUhYhEmbjiMqyLbr0yJ5ksuTHLDs72YpRqsswRZ2KLPfCwelD8c0vWbzutyBjM17OLA==
X-Received: by 2002:a17:90a:4e0b:: with SMTP id
 n11mr17391336pjh.155.1622440272659; 
 Sun, 30 May 2021 22:51:12 -0700 (PDT)
Received: from spacetanuki.lan ([202.12.244.32])
 by smtp.gmail.com with ESMTPSA id b10sm4744058pfi.122.2021.05.30.22.51.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 30 May 2021 22:51:12 -0700 (PDT)
From: YAMAMOTO Takashi <yamamoto@midokura.com>
To: qemu-devel@nongnu.org
Cc: YAMAMOTO Takashi <yamamoto@midokura.com>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH v2 05/11] linux-user: Implement pivot_root
Date: Mon, 31 May 2021 14:50:12 +0900
Message-Id: <20210531055019.10149-6-yamamoto@midokura.com>
X-Mailer: git-send-email 2.21.1 (Apple Git-122.3)
In-Reply-To: <20210531055019.10149-1-yamamoto@midokura.com>
References: <20210531055019.10149-1-yamamoto@midokura.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=yamamoto@midokura.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Used by runc.

Signed-off-by: YAMAMOTO Takashi <yamamoto@midokura.com>
---
 linux-user/syscall.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 2947e79dc0..51144c6d29 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -8254,6 +8254,10 @@ static int host_to_target_cpu_mask(const unsigned long *host_mask,
     return 0;
 }
 
+#if defined(TARGET_NR_pivot_root) && defined(__NR_pivot_root)
+_syscall2(int, pivot_root, const char *, new_root, const char *, put_old)
+#endif
+
 /* This is an internal helper for do_syscall so that it is easier
  * to have a single return point, so that actions, such as logging
  * of syscall results, can be performed.
@@ -13222,6 +13226,23 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
         return ret;
 #endif
 
+#if defined(TARGET_NR_pivot_root)
+    case TARGET_NR_pivot_root:
+        {
+            void *p2;
+            p = lock_user_string(arg1); /* new_root */
+            p2 = lock_user_string(arg2); /* put_old */
+            if (!p || !p2) {
+                ret = -TARGET_EFAULT;
+            } else {
+                ret = get_errno(pivot_root(p, p2));
+            }
+            unlock_user(p2, arg2, 0);
+            unlock_user(p, arg1, 0);
+        }
+        return ret;
+#endif
+
     default:
         qemu_log_mask(LOG_UNIMP, "Unsupported syscall: %d\n", num);
         return -TARGET_ENOSYS;
-- 
2.21.1 (Apple Git-122.3)


