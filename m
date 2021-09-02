Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDFCB3FF83E
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 02:06:33 +0200 (CEST)
Received: from localhost ([::1]:60206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLwj2-00053u-Nn
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 20:06:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mLwRO-00077m-Dw
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 19:48:18 -0400
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136]:33773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mLwRM-0003AA-Sx
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 19:48:18 -0400
Received: by mail-il1-x136.google.com with SMTP id z2so3603023iln.0
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 16:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H9ErQFLat47DKuiiq7kZ6kuYSvNR5hr7MM3PVO3BHo4=;
 b=XHmyvRxDG56Rxe5l3WcDX9phyctTsN4xXIMs3TGb1Qx5VWj9MgJVEtrSOlzSAYfY/E
 yxKZV/8fsK+1zQav8ov19daNqWTczy4ApUKyCbDiv7GSWv9pqUaCV2ZjWYT6QwHs/uok
 GBwFxnAgLKo68B1LvH+NOH0nxy98dVH0AUWdRf/VW5JzNVbVIP8f7V6hM8eQv1UDDT3e
 u8kiquxLqTuvov1HchXMBzAe+81eu7ovvQzIcSaPV3MZoZ4hXtXSPtQwFnN1w9yg3yra
 Aj5jCCuYDiafsGtr9dj+9JsODMRHd5HmvpgkpzzJ7cFr3J0VOlpXGNCWnXEBgexnArBe
 EeKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H9ErQFLat47DKuiiq7kZ6kuYSvNR5hr7MM3PVO3BHo4=;
 b=kFG/7vXpEql9Z/0HZCzrXfdUCra+ngPqQ+RpycHF/FFo2Gu0hDlsxpuelPxG44R5fj
 xtMK0s2jKDHSsg0i0pa//EZqCohrKGOExTJCW2hk5WqpSy5w5MMHbS1AD5BBccSBHqVf
 ENsJla5DjQnOv2jbeESWwhkTI0uX2LBfZA4Z92Eci13Blh4cnWSYLu+79+5oeoYomfMq
 HFB2TLpqyaRHCjHB49Rs2XIpvzJUO54s4/qSGeOGB6aq7rA0FcYlZqT6JZGOZAgqnp18
 uxhWu2ShOVkSxUYn+HQnDfAPvE281b616ijhCB7FZlwYlpZjENMFggqtSRYIjrD6unTT
 stoQ==
X-Gm-Message-State: AOAM531w2f3u5lqpU5pjPaevLAyXta49vm6jzQhXXcn4Y5odiX+6hOxP
 1IJn6NrgOvDBrEBdwnaTEyECZxRwBrhdMQ==
X-Google-Smtp-Source: ABdhPJwD/PLLRHwM+wq5B5gkufvfQyqCmRue9ig5nG/iv3wb7E4Es2TKcYt+MaytTRIKBYj8YD1yzg==
X-Received: by 2002:a92:d586:: with SMTP id a6mr484899iln.283.1630626494867;
 Thu, 02 Sep 2021 16:48:14 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id u10sm1740502ilg.15.2021.09.02.16.48.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 16:48:14 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v3 33/43] bsd-user: Make cpu_model and cpu_type visible to all
 of main.c
Date: Thu,  2 Sep 2021 17:47:19 -0600
Message-Id: <20210902234729.76141-34-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210902234729.76141-1-imp@bsdimp.com>
References: <20210902234729.76141-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::136;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x136.google.com
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: kevans@freebsd.org, Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@FreeBSD.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@FreeBSD.org>

cpu_model and cpu_type will be used future commits, so move them from
main() scoped to file scoped.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index 71fd9d5aba..50c8fdc1e2 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -54,6 +54,8 @@
 int singlestep;
 unsigned long mmap_min_addr;
 uintptr_t guest_base;
+static const char *cpu_model;
+static const char *cpu_type;
 bool have_guest_base;
 unsigned long reserved_va;
 
@@ -201,8 +203,6 @@ static void save_proc_pathname(char *argv0)
 int main(int argc, char **argv)
 {
     const char *filename;
-    const char *cpu_model;
-    const char *cpu_type;
     const char *log_file = NULL;
     const char *log_mask = NULL;
     const char *seed_optarg = NULL;
-- 
2.32.0


