Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A87848438F
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 15:41:27 +0100 (CET)
Received: from localhost ([::1]:51024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4l09-0006GW-SI
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 09:41:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ahmedaabouzied44@gmail.com>)
 id 1n4kyE-0005YS-Nz
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 09:39:26 -0500
Received: from mail-ed1-f52.google.com ([209.85.208.52]:35334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ahmedaabouzied44@gmail.com>)
 id 1n4kyD-000747-5o
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 09:39:26 -0500
Received: by mail-ed1-f52.google.com with SMTP id y22so149398731edq.2;
 Tue, 04 Jan 2022 06:39:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kxYvO6vytvThSJJhNF/SYLJHX4z9Qoey16/6hwLNNOU=;
 b=uht1gWVDxfHPB85FodVKRT6labMlLMuXmt9BbmZ9zMFtFrtUaW9u7cl7ZRgYoivOOq
 H13DKXO7A2lVyJ+d02Q0DoypKAI+fLG7dM0KWFdVP3hwdE+7BH5ekDfp8iURDQgRN7jW
 pxuKJfFlmmj87pGhVs536Nh/HQn3Ty2aCEFpEs3pSPrb9OU2OJzj2bS9C1MyZFUzEm0e
 zVjjCJ3oZpioAON4UfTcw55TIUXhdizjXppRANQLmLLYILX2QEpoKwSn8ICH+EKXWAZ6
 4povdT6FAk5anrI4N7ecPUNVlRXwwH9mdnerR8DmyOTf3j3qd1NPD/IFRJKGl8iX1HoC
 EMEw==
X-Gm-Message-State: AOAM531mc86O3X7npH/nVFKgOgZa1HX+oM4D6+6YgKrBNJHev6NDJ7+O
 ws0CwJ8/CqoRNybvxbQ2ePd2fRyCCC5m3k1h
X-Google-Smtp-Source: ABdhPJy8h+zIlZLE2QLqMVmvPKX8L/I45RBi5qbA6vhlIRPHDPdID4WJtaMtEf7k7CdWeFVVLQL+RA==
X-Received: by 2002:aa7:d799:: with SMTP id s25mr46578188edq.127.1641307162618; 
 Tue, 04 Jan 2022 06:39:22 -0800 (PST)
Received: from pythagoras.localdomain ([154.190.100.93])
 by smtp.googlemail.com with ESMTPSA id g9sm14889368edb.53.2022.01.04.06.39.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 06:39:22 -0800 (PST)
From: Ahmed Abouzied <email@aabouzied.com>
To: qemu-qemu-trivial@nongnu.org
Subject: [PATCH] linux-user/syscall.c: malloc to g_try_malloc
Date: Tue,  4 Jan 2022 16:38:41 +0200
Message-Id: <20220104143841.25116-1-email@aabouzied.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.208.52;
 envelope-from=ahmedaabouzied44@gmail.com; helo=mail-ed1-f52.google.com
X-Spam_score_int: 7
X-Spam_score: 0.7
X-Spam_bar: /
X-Spam_report: (0.7 / 5.0 requ) FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Ahmed Abouzied <email@aabouzied.com>, jsnow@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use g_try_malloc instead of malloc to alocate the target ifconfig.
Also replace the corresponding free with g_free.

Signed-off-by: Ahmed Abouzied <email@aabouzied.com>
---

Hello, 

I noticed that there was a `malloc` call in this file. It seems that it
was added by the commit 22e4a267 (3 years ago) which was after the commit
0e173b24 (6 years ago) that replaced malloc calls with glib alternative calls.

There is no issue for this on Gitlab. Should I have created an issue
first? 

Best regards,

 linux-user/syscall.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 56a3e17183..715f9430e1 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -4867,7 +4867,7 @@ static abi_long do_ioctl_ifconf(const IOCTLEntry *ie, uint8_t *buf_temp,
              * We can't fit all the extents into the fixed size buffer.
              * Allocate one that is large enough and use it instead.
              */
-            host_ifconf = malloc(outbufsz);
+            host_ifconf = g_try_malloc(outbufsz);
             if (!host_ifconf) {
                 return -TARGET_ENOMEM;
             }
@@ -4915,7 +4915,7 @@ static abi_long do_ioctl_ifconf(const IOCTLEntry *ie, uint8_t *buf_temp,
     }
 
     if (free_buf) {
-        free(host_ifconf);
+        g_free(host_ifconf);
     }
 
     return ret;
-- 
2.25.1


