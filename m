Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B025E4A5B3F
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 12:34:25 +0100 (CET)
Received: from localhost ([::1]:60384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nErQW-00088x-Nd
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 06:34:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEr7o-0004zd-RC
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 06:15:04 -0500
Received: from [2607:f8b0:4864:20::d2e] (port=38681
 helo=mail-io1-xd2e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEr7k-0003XD-6b
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 06:15:04 -0500
Received: by mail-io1-xd2e.google.com with SMTP id w7so20717268ioj.5
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 03:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SeIissd9yu6sr1EpyUUZEaaK6kIza5Vpduyt6eMziNI=;
 b=dG2RwdFmh5jSpgQcSqgXnNibD/LupeCO5WrMuau+PQvqPO7q3jh3OlISmBK0vnDrig
 OF/r4goH16kGXEvlQp1H9Z00wPv30OckWmarE3C9OM3oOLBG19N48T9s1mdbIQL3kBSP
 GEoNEqFlv7uvzGRU4BZTMT+G1fYzn4o1/yj9uM/8X5D/UeaoUFmDwHFCineRfrr1Hm4T
 uS5LWpkF2hzXQBrut8H/QcmgLj0vMOrLDIWoA4ckY6oYjMdGU67DWGuESs01TCehBWsN
 y3RJ9UE5UD8vJCJVfVljXDYYsfgoHxDlOUwLuuTaZvqH5hKldPQ4vx0cLVT/ON+oOI4p
 +WoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SeIissd9yu6sr1EpyUUZEaaK6kIza5Vpduyt6eMziNI=;
 b=iC0csU+vzL6Zrz6Xabn5Mah49L6UzaMq3Mq3rvAvEbSWg929r9tyQhRd2yalLzDCge
 geLVqMgGPSHIduaGBvWjJQl94T9h4oZKxubCg4I1gUQx2oQIINHN0RQ+lUdDI+Z+VPVP
 PHRWwkiBXGd4MqsRmK6L8esp5fgrxsalanVnrxlai4PGvnT5uci2D+574KQlVehOZq7J
 hLWH9syloVMz9i2fT/JZf3jzqS2C50Y0Z1RPjLcAMGP+Y+14kXGzjbxuFj/P9Et2UANr
 nKpJQ/Y6LDOuFLc7iEBhfnZiTnHUqTfNys3mXd4QAIPe/xVx8NdfYiRXsxOZCaRQkuI1
 O8bQ==
X-Gm-Message-State: AOAM532xcrCsU9Xc6HF+Pc2RSlTDg+r3iEslGoJjcan/nQBpitly+OXb
 WS1mVYMFFNlOIaQn7oikEw1QXaJX4CQqmg==
X-Google-Smtp-Source: ABdhPJwRV772UJ8ajp/eClpFdzYMVrBYdN9H5bRXfu5bpDXUtNkyoj6ywVpX3VMheMJhohvLHaUOmA==
X-Received: by 2002:a6b:760c:: with SMTP id g12mr13656908iom.27.1643714094213; 
 Tue, 01 Feb 2022 03:14:54 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id w5sm13526852ilu.83.2022.02.01.03.14.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 03:14:53 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/22] bsd-user/arm/target_arch_thread.h: Assume a FreeBSD
 target
Date: Tue,  1 Feb 2022 04:14:39 -0700
Message-Id: <20220201111455.52511-7-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220201111455.52511-1-imp@bsdimp.com>
References: <20220201111455.52511-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2e
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2e.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, arrowd@FreeBSD.org,
 Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Warner Losh <imp@bsdimp.com>,
 Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since we can't run on anything else, assume for the moment that this is
a FreeBSD target. In the future, we'll need to handle this properly
via some include file in bsd-user/*bsd/arm/mumble.h. There's a number
of other diffs that would be needed to make things work on OtherBSD,
so it doesn't make sense to preseve this one detail today.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/arm/target_arch_thread.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/bsd-user/arm/target_arch_thread.h b/bsd-user/arm/target_arch_thread.h
index 11c7f765838..fcafca2408c 100644
--- a/bsd-user/arm/target_arch_thread.h
+++ b/bsd-user/arm/target_arch_thread.h
@@ -62,9 +62,7 @@ static inline void target_thread_init(struct target_pt_regs *regs,
     }
     regs->ARM_pc = infop->entry & 0xfffffffe;
     regs->ARM_sp = stack;
-    if (bsd_type == target_freebsd) {
-        regs->ARM_lr = infop->entry & 0xfffffffe;
-    }
+    regs->ARM_lr = infop->entry & 0xfffffffe;
     /*
      * FreeBSD kernel passes the ps_strings pointer in r0. This is used by some
      * programs to set status messages that we see in ps. bsd-user doesn't
-- 
2.33.1


