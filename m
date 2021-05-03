Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1444F371EE3
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 19:50:28 +0200 (CEST)
Received: from localhost ([::1]:49630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldciB-00068G-3y
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 13:50:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thatlemon@gmail.com>)
 id 1ldcc4-0008KH-U0; Mon, 03 May 2021 13:44:09 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:39449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <thatlemon@gmail.com>)
 id 1ldcc2-0004Ch-DE; Mon, 03 May 2021 13:44:08 -0400
Received: by mail-ed1-x534.google.com with SMTP id g14so7259419edy.6;
 Mon, 03 May 2021 10:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FWWwHJ6P9tfA0D6n2oH0MjrYr62QGzNYFUt3OV35jXo=;
 b=mCJ7pzbB2aHppIzHK1lYhNcLgCSMqOfKdKcTg+W3WhTvgUyMmjrKmBOVRz7APHxjym
 cNn/9idPewA9dlZDb70htfEe0ti5jsrrlcJRCS9s3EvhDGYZSoG78aqs9BJoZfwjRZVM
 Cac/gGnO2BIRt0KVAXYe6L02x/vJ8BlukmrzvHEUSMdwN7r7UMo3OucwA420d5fb6r51
 NqdE7NYxoU88noQXkHe7W4s28HDb+YHah76b1F/6OAdpsV1ttdIHdwS1JRAlQ9nJFF0T
 qNjKnk3SnyAD8m7g4Ghr1cQH4d5rj4jNnxwZiCAuOGYtle5KAcUJ8TZ0dhNN3jdX/0lL
 QhlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FWWwHJ6P9tfA0D6n2oH0MjrYr62QGzNYFUt3OV35jXo=;
 b=IQGwTMPIpwoGhjTRfgYCDI3RHEhdwacMmTYWZ124FOwbfb4kZUtoPSSlgfAHK6cryr
 u5ovL5MScv2skBLZbXdBpYHSwFjPEH/1Zgsef8dBZb1Abqm2U4TLhcdEyjSeYQ8GUiEG
 9QvwzofWeH9VRbf4/lE8btqdbKhDR2b4eUAorN9q+5NaWaod9QHNk8js9AJS4aS4R9JD
 cp3DOTjY/L8VV0mELTu02vVrjun4EUOX4YTaFp7LUaSiH+WqIlZGumzky2TS6yhRHSEm
 B0NkWdmQdbMkJ1Ppnlb9+5PmiK/dhUo/S4KpFrG29ZqqDmWnAs8EYGb8oGQj1baVA9Nt
 cImw==
X-Gm-Message-State: AOAM533AWDvYclfyYSNkBCHXdeiUmgrLHDosDzodNUZeFjC/kga77kxI
 za54NIE+gy6iMpONmvlNoC2wk9gb6eE=
X-Google-Smtp-Source: ABdhPJz8sK9OJYl8TL7V/97VGS2S0PU8OA6tZ2/I0f21dKdYfGjUy1pAHB3gN1t/w3Rxe7Z4cD8nNQ==
X-Received: by 2002:a05:6402:34cd:: with SMTP id
 w13mr21280758edc.73.1620063844659; 
 Mon, 03 May 2021 10:44:04 -0700 (PDT)
Received: from localhost.localdomain ([151.60.47.133])
 by smtp.gmail.com with ESMTPSA id x7sm155879ejc.116.2021.05.03.10.44.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 10:44:04 -0700 (PDT)
From: LemonBoy <thatlemon@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] linux-user: Fix erroneous conversion in copy_file_range
Date: Mon,  3 May 2021 19:41:59 +0200
Message-Id: <20210503174159.54302-3-thatlemon@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210503174159.54302-1-thatlemon@gmail.com>
References: <20210503174159.54302-1-thatlemon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=thatlemon@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: qemu-ppc@nongnu.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Giuseppe Musacchio <thatlemon@gmail.com>

The implicit cast from abi_long to size_t may introduce an intermediate
unwanted sign-extension of the value for 32bit targets running on 64bit
hosts.

Signed-off-by: Giuseppe Musacchio <thatlemon@gmail.com>
---
 linux-user/syscall.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 95d79ddc43..c425dfa278 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -13245,8 +13245,9 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
                 }
                 poutoff = &outoff;
             }
+            /* Do not sign-extend the count parameter. */
             ret = get_errno(safe_copy_file_range(arg1, pinoff, arg3, poutoff,
-                                                 arg5, arg6));
+                                                 (abi_ulong)arg5, arg6));
             if (!is_error(ret) && ret > 0) {
                 if (arg2) {
                     if (put_user_u64(inoff, arg2)) {
-- 
2.30.2


