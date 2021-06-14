Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E020B3A6EB9
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 21:18:43 +0200 (CEST)
Received: from localhost ([::1]:48882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lss6c-0005HV-WD
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 15:18:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raj.khem@gmail.com>)
 id 1lss5Z-00036g-71
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 15:17:37 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:43832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <raj.khem@gmail.com>)
 id 1lss5X-0003ya-Eg
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 15:17:36 -0400
Received: by mail-pf1-x430.google.com with SMTP id a127so5483786pfa.10
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 12:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EiJSvpvbOmHMIGNvTF2KRvPrsWT9/UKQ54J8UzR1MIM=;
 b=gRVbUq/45VMK/daoNgfrs4DEbvuW4c3C81cLQwZ0YL61Ouu79eQIMxhDr9QkauL3Bn
 h3sTEQz/+iS5eJfVQTfVnq1edaADKjtnk2rlPjTwbekGTZ9mB9e/2LJrFQlBgbZPFKB5
 H74/Ft5TFZOQVbK6NYlJwilyl9wSwyw9iBh4fXJGirYVOyRZG3J0GtGaQkYr0ldffetO
 ymTmWKklyuoZUrl8vHXO43sFfFmIEvGGkxb+s07q39sM5JFmQx5E9K2m52l91Zt0WbBy
 Xsrn/bgAutdoFLP9S9vBWkC+vQQqvxCZsfr5jmy078Auxv5zxrCVKx4iZ33aZ9RhEBHx
 nuig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EiJSvpvbOmHMIGNvTF2KRvPrsWT9/UKQ54J8UzR1MIM=;
 b=j3iV/F1JYmO1GJHXw9WfRj2g+F/oomjkrOmFE4QX5IZLbQh5QDHYaHSVzLRwoTGITM
 gs2UHAEZ6RravDFnlVaB8ptmQCgcDbrVU0C5CcinNuoFthtka5bjXPoO+2uDmMOVc00K
 MRpLVFvF9EgE6ox5VkUjBnIij/jZqRhihtvsENQNO0M8xhKHbPrFFAAOzprVD2UrFV1s
 qQ0xY5EhlYDPyX27CgkFOAx4sEWNZNFMZskGo34o7uZMMukdInmb/e4RuqdeggzyGwo5
 fifZFtu4wP2Rr5cIzezXjWt9aPfoQAur3W4CWmQJfSlXuZBz7PMncelqrQib4cDiir+K
 WWiQ==
X-Gm-Message-State: AOAM531EuPjGKO/A2MhdqPvwpOzILRyHIIAMvqFbuIVbVXiZLHK/s5yQ
 fc7PuoGKEb2ep7FOftMfjBW6PW7ZAosdGg==
X-Google-Smtp-Source: ABdhPJzWVhRJBKpclpyhfgQXdLJfn3nBHM8a+15duJ5y62nzmUbwIFl5mI8sBLTw3x+UAEyExxdtYw==
X-Received: by 2002:a65:6393:: with SMTP id h19mr7366664pgv.95.1623698252444; 
 Mon, 14 Jun 2021 12:17:32 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a054])
 by smtp.gmail.com with ESMTPSA id d8sm13592148pfq.198.2021.06.14.12.17.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 12:17:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] linux-user: Check for ieee128 fpbits in PPC64 HWCAP2 feature
 list
Date: Mon, 14 Jun 2021 12:17:29 -0700
Message-Id: <20210614191729.2981488-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=raj.khem@gmail.com; helo=mail-pf1-x430.google.com
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
Cc: Florian Weimer <fweimer@redhat.com>, Khem Raj <raj.khem@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

glibc 2.34 is now checking for this in hwcaps at
runtime [1] and failing to run the binary if machine
does not support 128bit IEEE fp

Fixes
Fatal glibc error: CPU lacks float128 support (POWER 9 or later required)

[1] https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=d337345ce145e23c5f3a956f349d924fdf54ce2d;hp=eb24865637a271ab7dad13190330105eab0d478d

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Florian Weimer <fweimer@redhat.com>
---
 linux-user/elfload.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 17ab06f612..e7dd18fd40 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -830,7 +830,7 @@ static uint32_t get_elf_hwcap2(void)
                   PPC2_ISA207S), QEMU_PPC_FEATURE2_ARCH_2_07 |
                   QEMU_PPC_FEATURE2_VEC_CRYPTO);
     GET_FEATURE2(PPC2_ISA300, QEMU_PPC_FEATURE2_ARCH_3_00 |
-                 QEMU_PPC_FEATURE2_DARN);
+                 QEMU_PPC_FEATURE2_DARN | QEMU_PPC_FEATURE2_HAS_IEEE128);
 
 #undef GET_FEATURE
 #undef GET_FEATURE2
-- 
2.32.0


