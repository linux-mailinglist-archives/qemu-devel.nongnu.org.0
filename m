Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B698959F831
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 12:53:16 +0200 (CEST)
Received: from localhost ([::1]:59816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQo0Z-0000Cc-MS
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 06:53:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmuT-0004GG-Kl
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:42:56 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:40815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmuS-0001cB-0V
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:42:53 -0400
Received: by mail-pf1-x42e.google.com with SMTP id y141so15966782pfb.7
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 02:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=7B//sRlwmvr0NqRVKAmxDWMajm9GtHuIKBPMgzMp1rQ=;
 b=S0LDz4mgG3iVYKSUqh8+rhpHR5eUZY1VYYnZPoaOrsumn1PE0EmZFMyKx3NxhW8ihB
 1Can46UqFVM8RkPuA2tvnc5mTmGc6IAFRzhY6ShJv8JMOniVCBAluv2isa6xcyeBSKfp
 CwKz5zTrFfIvn/bNJQAKoWap/Ry7bEjV49UqABNRiAqxsj1KWIxovDo+Popu8UYagqu7
 gSsb6BiZRShy90Vu5klhmTOckoQBL557N674mwRio3GfhLsaMzWjREKnPl1TFLlfeo70
 b4LdBZ+eBArYgNav2tl8AcmYXEaIwvniP5uu5O+c5u87hUFTbYEcKK0oC7OVmN/T5R4B
 4VlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=7B//sRlwmvr0NqRVKAmxDWMajm9GtHuIKBPMgzMp1rQ=;
 b=B9Dy/NfvtVnGHEWmrpWZxd9cGaipk0gW8Z/LhbCBkb8/iIZqrVBzD3LtwXm2uxhTTy
 aO0bcP6V2TdbkrMZvM36SspkTsYI14t9Nu2U2gydwIpqumuEMjTANmdqcQwlP0raw/g/
 1fuzPvK5XSl7pvWqxH/WB4EtW0HHuTd6L2pWD5xRCeWXTuO7YGxbsHGiwgDDa2Nfjcnq
 a24XO1XFSBtE8IFaP6g2bdrhQolJ62CB2hqnr0iRAwQYqfjNIOILidqV1ogrilTXIcXj
 71E+43FN5IsekRimT874Mo0xUcHFahIuVYggielAwSZo1QeQJzr7ka7j0UlC4ts9vM6r
 94ug==
X-Gm-Message-State: ACgBeo20A1Ioh39LrNCWTXfL2NuY4ACZ51C4NF36BR3w60zWkbPDNk2L
 mE3G2BTlebbrVuHbQiLPW22veqAoK1M=
X-Google-Smtp-Source: AA6agR4FJgKJn/DcSXVToENvx6SagYVahEUG2h4MSpz7/d7gAm+L+eYsxlbRl0QKf+xIESTfrBdUpg==
X-Received: by 2002:a05:6a00:24d1:b0:537:2916:e1d with SMTP id
 d17-20020a056a0024d100b0053729160e1dmr3537906pfv.66.1661334170485; 
 Wed, 24 Aug 2022 02:42:50 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a170903228e00b001728eb339e2sm12165972plh.286.2022.08.24.02.42.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 02:42:50 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH 29/51] tests/qtest: libqtest: Install signal handler via
 signal()
Date: Wed, 24 Aug 2022 17:40:07 +0800
Message-Id: <20220824094029.1634519-30-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220824094029.1634519-1-bmeng.cn@gmail.com>
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x42e.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

At present the codes uses sigaction() to install signal handler with
a flag SA_RESETHAND. Such usage can be covered by the signal() API
that is a simplified interface to the general sigaction() facility.

Update to use signal() to install the signal handler, as it is
avaiable on Windows which we are going to support.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 tests/qtest/libqtest.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 1b24a4f1f7..70d7578740 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -68,7 +68,7 @@ struct QTestState
 QTestState *global_qtest;
 
 static GHookList abrt_hooks;
-static struct sigaction sigact_old;
+static sighandler_t sighandler_old;
 
 static int qtest_query_target_endianness(QTestState *s);
 
@@ -181,20 +181,12 @@ static void sigabrt_handler(int signo)
 
 static void setup_sigabrt_handler(void)
 {
-    struct sigaction sigact;
-
-    /* Catch SIGABRT to clean up on g_assert() failure */
-    sigact = (struct sigaction){
-        .sa_handler = sigabrt_handler,
-        .sa_flags = SA_RESETHAND,
-    };
-    sigemptyset(&sigact.sa_mask);
-    sigaction(SIGABRT, &sigact, &sigact_old);
+    sighandler_old = signal(SIGABRT, sigabrt_handler);
 }
 
 static void cleanup_sigabrt_handler(void)
 {
-    sigaction(SIGABRT, &sigact_old, NULL);
+    signal(SIGABRT, sighandler_old);
 }
 
 static bool hook_list_is_empty(GHookList *hook_list)
-- 
2.34.1


