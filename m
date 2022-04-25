Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9181950E372
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 16:40:37 +0200 (CEST)
Received: from localhost ([::1]:41078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niztE-0004D9-LS
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 10:40:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nizgU-0006UC-6h
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 10:27:26 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:45994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nizgS-0004ho-Q4
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 10:27:25 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 n33-20020a17090a5aa400b001d28f5ee3f9so6044740pji.4
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 07:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/65BMxjgN2mK/5Pu9C5+z++998qk7KcZ4nDu6mhJk3k=;
 b=RTx/kMh2eD8FhSTzwREsmyklITekC9gw3uAfU4P23D7/9Legosj2+8U7NhNGAaF+Xd
 f0ILfNYx/1xJBs4wwQH6KHq6ZbCaKbyzOlia91qfpT0RxnMc6Dqx33wqg1iXfrgGsQ55
 SjahDJYXo5Ectm3vKalAQIwmA1ONLTtAFHoD/5Sp3JJ6c1pBzZTIPtayJ8sZBh6c7PQ0
 qSnA1Yh6Nf36I9AoP5YRbMlGX9zNtg28Rkvww6plVwVJGW0ZonGcaWkeVAUbWYkHD2LG
 CX3Knfr+YA5jRf37yR0b+ToM4q8GmyLyiMHLadoWywvDyxjB2SpjS6RfzgyHncwFxfW+
 y0eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/65BMxjgN2mK/5Pu9C5+z++998qk7KcZ4nDu6mhJk3k=;
 b=NeFdmpcFCAU/Wdc8arr78UZlrLJY1zgkhFbJPt3kjj1Sy5e8C87VuGHjj1H2PiUwdJ
 l+20/G3WirhHJDfdCCCIs4aO0GJn7+qbyQroqVfxvb/rJ9AML+q+edFoQ74MtlerQMf8
 tOnbLRyk51b4IuC37s1suS43QhYxV527LD6IMe4okE7zsvckR/nR4MgpwlnVD5HeJm0F
 LiJ4O10dXzRG/zi72br/sH6abgoLcsMIDFWgxVXEzUa2WepOUcenTpD3ls2g+bnNtQB0
 51MRCeTK/WCGcmbGcsi7Sji/I+UEJotch/cm20f5zeyTdxDNJzwtE7t43WCl51NM9C9d
 cR/Q==
X-Gm-Message-State: AOAM532utpSCi4Vu7z6rQJOiDoUKo0FoIyavgzgiR0cFyg5piker6WY/
 w4bjJm5Hu+U6IRCm3H+wvDPVN33vSq4=
X-Google-Smtp-Source: ABdhPJx6RV5kvf/PxpDiZiP9VDI/Dfz77Urmz4/Ber9hVrvToUdQFviYXYV+HPmsa+EruhZorkI97w==
X-Received: by 2002:a17:902:8d8e:b0:159:4f6:c4aa with SMTP id
 v14-20020a1709028d8e00b0015904f6c4aamr18415434plo.115.1650896840853; 
 Mon, 25 Apr 2022 07:27:20 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com (unknown-176-192.windriver.com.
 [147.11.176.192]) by smtp.gmail.com with ESMTPSA id
 t1-20020a628101000000b0050d47199857sm2437968pfd.73.2022.04.25.07.27.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 07:27:20 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org
Subject: [PATCH 2/9] qemu/xatth.h: Update for Windows build
Date: Mon, 25 Apr 2022 22:26:58 +0800
Message-Id: <20220425142705.2099270-3-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220425142705.2099270-1-bmeng.cn@gmail.com>
References: <20220425142705.2099270-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x102e.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>, Guohuai Shi <guohuai.shi@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Windows does not have <sys/xattr.h>.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 include/qemu/xattr.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/qemu/xattr.h b/include/qemu/xattr.h
index f1d0f7be74..b08a934acc 100644
--- a/include/qemu/xattr.h
+++ b/include/qemu/xattr.h
@@ -25,7 +25,9 @@
 #  if !defined(ENOATTR)
 #    define ENOATTR ENODATA
 #  endif
-#  include <sys/xattr.h>
+#  ifndef CONFIG_WIN32
+#    include <sys/xattr.h>
+#  endif
 #endif
 
 #endif
-- 
2.25.1


