Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A25432380
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 18:08:36 +0200 (CEST)
Received: from localhost ([::1]:38388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcVBj-0004H4-70
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 12:08:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcV8e-0007e9-20
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 12:05:25 -0400
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136]:38472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcV8b-0007pl-6K
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 12:05:23 -0400
Received: by mail-il1-x136.google.com with SMTP id h27so9682289ila.5
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 09:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oK8OdzI3+mMf4vVbNx2oZhOXbhyBiMQd575mcLOjFB0=;
 b=Z63aA+vnX0ivSX6b4sc7hABGqhsOZ7qOqY/eJQtznatjMvjtOs+yYVKIfz+XIPqZTX
 KodfK3C0+1irE1kbgff3zZrHOW8rZpM0RbHFObpv4pjnxXnrM/K0YtFX5FxerdIBndbD
 qGS/6XtyIQ988sG/FMOXQG7jfVea02bMlTNOiYsXLv0qG7YaCS6I6L2Fq2ZZdB19F9xk
 j90BZClbqJj1Pe9uCeFimcd0OXGiloGauVC6HprDY+ycjVqW4EgFJEtWjBItFdvZkuhc
 UGAkl62H/yWBa9MtE6q1pqYEuWczOqpw/sIoKcDamgzIczY7YxsO45BlpLRj0Rg0VCkN
 eK7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oK8OdzI3+mMf4vVbNx2oZhOXbhyBiMQd575mcLOjFB0=;
 b=XmTrMUEtJ5I6oxbCnsiPYe0CFuhnOo2TQeX6WgoDm+IeuEBs9HSd2XmJVMWg7nxpGr
 LitDlXMf2F9+h99BmxmWq/iFP2EkhLLqnOcOmisCZW6QNrxcbnZLW8NZyqWU7u3+UdYp
 NVn4hjnvk9ovNuvq19Ax3PPIlLSE5GSSdRagk4RICI2pIe7Rsrq73rpvVVtXrzQalJEK
 jazHA80kt/mS6uMSgzy16pN4aYpFB8vGr6z9d9QpG5HmcyCE6UGhYPbAiLmaixEJGp94
 xYDqT2rJcMMNXbG+Mj7rkQKaVr/d2QnR101B7U44mYJktmqSv/2XAu2cof0dV6ShCzD5
 i3+Q==
X-Gm-Message-State: AOAM531HZMvZ2x8bWF/TlETFtRbRcmh4IuZ1LecOuVxA20WuPuOSkNLO
 cWrBKQ3FKeyp6M0RhW0ggray4Mk75PdfCg==
X-Google-Smtp-Source: ABdhPJwR9jq9dmXrWEnXZ9+ylQc9+RH1tC+mSAxkG4Vs5+CQkNZh6oivce1Flde5dz5lydHJPYKGfQ==
X-Received: by 2002:a92:ca0f:: with SMTP id j15mr14948481ils.251.1634573115965; 
 Mon, 18 Oct 2021 09:05:15 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a4sm7240936ild.52.2021.10.18.09.05.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 09:05:15 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/23] bsd-user/mmap.c: Always zero MAP_ANONYMOUS memory in
 mmap_frag()
Date: Mon, 18 Oct 2021 10:04:36 -0600
Message-Id: <20211018160458.1976-2-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211018160458.1976-1-imp@bsdimp.com>
References: <20211018160458.1976-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::136;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x136.google.com
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
 =?UTF-8?q?Mika=C3=ABl=20Urankar?= <mikael.urankar@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mikaël Urankar <mikael.urankar@gmail.com>

Similar to the equivalent linux-user commit e6deac9cf99

When mapping MAP_ANONYMOUS memory fragments, still need notice about to
set it zero, or it will cause issues.

Signed-off-by: Mikaël Urankar <mikael.urankar@gmail.com>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
---
 bsd-user/mmap.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/bsd-user/mmap.c b/bsd-user/mmap.c
index b40ab9045f..fc3c1480f5 100644
--- a/bsd-user/mmap.c
+++ b/bsd-user/mmap.c
@@ -180,10 +180,12 @@ static int mmap_frag(abi_ulong real_start,
         if (prot_new != (prot1 | PROT_WRITE))
             mprotect(host_start, qemu_host_page_size, prot_new);
     } else {
-        /* just update the protection */
         if (prot_new != prot1) {
             mprotect(host_start, qemu_host_page_size, prot_new);
         }
+        if (prot_new & PROT_WRITE) {
+            memset(g2h_untagged(start), 0, end - start);
+        }
     }
     return 0;
 }
-- 
2.32.0


