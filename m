Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 154B0345EF3
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 14:08:49 +0100 (CET)
Received: from localhost ([::1]:43080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOgm8-0007qy-4K
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 09:08:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lOgjr-0005dV-GY; Tue, 23 Mar 2021 09:06:27 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:51959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lOgjm-0002Mb-4k; Tue, 23 Mar 2021 09:06:27 -0400
Received: by mail-wm1-x333.google.com with SMTP id p19so11019643wmq.1;
 Tue, 23 Mar 2021 06:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FIiDl70VzJ29OzobWO6rnz2BouytBDFb+3CY1MtwOxA=;
 b=Xhwy6rUg3XoFKRIT+ew8RVk5NKrr+ptwWgdxPT3IAAMJbgNB+D+pZLIPRf/peFXHYT
 VJyyIIQiT2x9EAKD5fnREwhjIjFUUkALvcLAUSmOzYive/4DaqA98/uQZ+ofDFdcjjQV
 hjvyAElrpvilCFqNmuGjaOwtdzgDEUbhlWzTH9464tCrDE9OfVkwPzZKVY9THZyGH47A
 56O7Bo1gtkwBDiselMTQvWSlB58RmzMZ+bwTl1eTX9ydQoyY/5WRNxpzdPbHqQTnqEq6
 6GZym9jfR3xXQ3d4ZaVkbp9BQ2L42Wra9Kx49J7CHwlulQuawVbornXK68uXLIHIhWXL
 mNaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=FIiDl70VzJ29OzobWO6rnz2BouytBDFb+3CY1MtwOxA=;
 b=eOnq+ujrUy1HdF3w9N/3GTMDiMs5qQzJgya7b1GnsZq4c3paGjbUNmJJ6mXEEq8pHj
 xQ9w+5pTx0GSSWcjLv2wouRyjv2Avip4zQTqrczYNY92zLYgtJMo0TrGHj4zlvGPT1H/
 GO4E+RjcLxT7MzJ+IKcQvX69evQLnAqSZqmZE7fS9p/y4t8pMv+g5M2Rvbdyg4CYmlW3
 Ol9PF6Mmi1DJGeS2wwVeoL8HAmUGBO5ZxZwjuXy6CvEMBW7u7Zs2/xFQU6shwvzR2ibI
 RrrR40BgPDAuwGRQR7NJ7oz6XmKP0cpXVo40641Dehdc1onMUxTvFuPdidZl3UByz9je
 p+qA==
X-Gm-Message-State: AOAM530F38h/ffvBhu+9DVENv8sXLl3Mqd6kT8UG/M5KOo0sK8HqLRqb
 vDEhedg1Ce02iSOvUZv+MGOnbSMwIbQ=
X-Google-Smtp-Source: ABdhPJzcT4wKyt70ZwC9rUV+bB3Xg05QF+jCr7U1ogajAs2Y3Vnf6cM7H4shWelObZa0Ao24ZwT9hA==
X-Received: by 2002:a05:600c:614:: with SMTP id
 o20mr3225924wmm.66.1616504780087; 
 Tue, 23 Mar 2021 06:06:20 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id i8sm2507590wmi.6.2021.03.23.06.06.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 06:06:19 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/4] qemu-iotests: fix case of SOCK_DIR already in the
 environment
Date: Tue, 23 Mar 2021 14:06:14 +0100
Message-Id: <20210323130614.146399-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210323130614.146399-1-pbonzini@redhat.com>
References: <20210323130614.146399-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: eesposit@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Due to a typo, in this case the SOCK_DIR was not being created.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/qemu-iotests/testenv.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
index 6767eeeb25..169268f61a 100644
--- a/tests/qemu-iotests/testenv.py
+++ b/tests/qemu-iotests/testenv.py
@@ -120,7 +120,7 @@ def init_directories(self) -> None:
         try:
             self.sock_dir = os.environ['SOCK_DIR']
             self.tmp_sock_dir = False
-            Path(self.test_dir).mkdir(parents=True, exist_ok=True)
+            Path(self.sock_dir).mkdir(parents=True, exist_ok=True)
         except KeyError:
             self.sock_dir = tempfile.mkdtemp()
             self.tmp_sock_dir = True
-- 
2.30.1


