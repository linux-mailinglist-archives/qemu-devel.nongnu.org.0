Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5869C2ECDB5
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 11:23:41 +0100 (CET)
Received: from localhost ([::1]:48172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxSSC-0003vI-EH
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 05:23:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kxSOJ-00084V-TQ
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 05:19:40 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:36270)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kxSOH-00051b-LI
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 05:19:39 -0500
Received: by mail-pl1-x62f.google.com with SMTP id j1so3259293pld.3
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 02:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q2yKQ77BbmTMA8vu+yHDdY/E8M3VxJJBikSmj73bAUs=;
 b=QHHLPhfvmxXm6LvIZgSXhsXAfvWG973GSLpSs20jt34043HB0yNtjDw3y1sDZgr1rO
 Ahm8vqGMrI3VM7nzvX1zNtIT8nGnY5ifAbNwkjejqZd9Rf/MHiix5wBZNFJ52CBtNhPa
 dNJEOAD0dqaYUtnf+rjWrcbLzkp4Dt3YccI6QzB+HVacH5LhOOFpEl3kKYMPkZDP1OV+
 e/EQPkwlOqBl5ngfIY4TKWgabZW+ftnQrBTcA+pBDhXd+bvaCUo7DNU0QnicTGoyX++p
 uGii4cUc691A2HIwiw+YSPut6N/rNn17eUQMCG0YVOEbhKzqlnyiMVxdJww/Xgur9mox
 HXoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q2yKQ77BbmTMA8vu+yHDdY/E8M3VxJJBikSmj73bAUs=;
 b=joBQHuVlRNRQP7PtYNkcA7mSSDZR1ZbAfNxKKT5CrwBpAVK+OMBhPB64Kgm8cH5XEf
 4YLdtYjf/cMec0JcOpfofJwXqRRZ9UTA4smxNmFKXC0p8oNPbSZ+mpwfnzh5iGsTJ1ha
 VKDjXkqlwvJ3Kfq04UUoRBSXMdN0FfwgEGY4Lr6ou9j8AS6DcGxhXYjI72GV13ogD76u
 6Nc4OgyMLXWXCaFZ5Da8XrkigUl2RI5JEJdWQqJaF6UYVcvXesutCgmpiXOTmpeSEVce
 gH4CqZ2WPyiYoe0c2e9TRXFI5Lu84ubhpK3L9wXEy4Ctd4bfw23kx5DEGTIj4/etcMad
 awrw==
X-Gm-Message-State: AOAM532lJnNtVHfgtYADhpMMwCa+BGBj1T6qC2paES6+psSg1FNQsfYh
 K+2FXCnfOwsojmQipAfgkvFB37iC1CHOwhV2
X-Google-Smtp-Source: ABdhPJz+HghgpdmSysuijAS4D9dcu+vD5xhn7Wt6Ruf5ltcNzZ6nWfguakLTHXZlEWb2U+9ce3GJVw==
X-Received: by 2002:a17:902:6a87:b029:da:e253:dd6a with SMTP id
 n7-20020a1709026a87b02900dae253dd6amr8445322plk.81.1610014775826; 
 Thu, 07 Jan 2021 02:19:35 -0800 (PST)
Received: from localhost.localdomain ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id s5sm4934662pju.9.2021.01.07.02.19.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 02:19:35 -0800 (PST)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 1/5] cirrus/msys2: Exit powershell with $LastExitCode
Date: Thu,  7 Jan 2021 02:19:15 -0800
Message-Id: <20210107101919.80-2-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.29.2.windows.3
In-Reply-To: <20210107101919.80-1-luoyonggang@gmail.com>
References: <20210107101919.80-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=luoyonggang@gmail.com; helo=mail-pl1-x62f.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Ed Maste <emaste@freebsd.org>,
 Yonggang Luo <luoyonggang@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently if we don't exit with $LastExitCode manually,
the cirrus would not report the build/testing failure.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 .cirrus.yml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/.cirrus.yml b/.cirrus.yml
index 3907e036da..68b8a8fa9c 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -137,5 +137,7 @@ windows_msys2_task:
     - C:\tools\msys64\usr\bin\bash.exe -lc "mkdir build"
     - C:\tools\msys64\usr\bin\bash.exe -lc "cd build && ../configure --python=python3"
     - C:\tools\msys64\usr\bin\bash.exe -lc "cd build && make -j8"
+    - exit $LastExitCode
   test_script:
     - C:\tools\msys64\usr\bin\bash.exe -lc "cd build && make V=1 check"
+    - exit $LastExitCode
-- 
2.29.2.windows.3


