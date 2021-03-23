Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D062346880
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 20:06:46 +0100 (CET)
Received: from localhost ([::1]:50750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOmMX-0001nQ-Bu
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 15:06:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lOlcw-00083P-JA; Tue, 23 Mar 2021 14:19:44 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:38663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lOlct-0006gq-6e; Tue, 23 Mar 2021 14:19:37 -0400
Received: by mail-wr1-x431.google.com with SMTP id z2so21808309wrl.5;
 Tue, 23 Mar 2021 11:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=StBk6nmiw+EsZlpW2CZlR4Ksx6/vUMF0JabBotCAztI=;
 b=lcUp/6ToYNoI8njcCq4Bbf3sOjStl1j7HHy9MHJnR7w2ydZ6DCDgsiugpsbQsZizeU
 AM+aayBKTOBPq+SJWXjQEKqpC+EnoTj6hwIQeQQVeTafrKVZKyHlJH96B/ySHXD1R18Z
 xtqS5bylqCOmj5Fvz8b+v8e/gJKnzt1eicUvFjr0XBmlhqG1BM8PVwlo95zNeu+EOLvN
 mGVwZsRQHP1qTgr+qosTo5mCRLAjV6XXe3xOQbgLKG1D17lIpSWIps0x8xemhRjg5HZO
 1qxK5JvVknFajaMOBvvwuPCI/Wxe2crd4NtwwCLmn/mzo3wY5D0xpBCWYtWEmlOQIO9u
 qS2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=StBk6nmiw+EsZlpW2CZlR4Ksx6/vUMF0JabBotCAztI=;
 b=baRSQtFM4ed682PuGgpQA1qMTZYKZyt4i3pxTUX2N8BOzT1C5+DCPO0gu9MVCT3cSj
 ZLo0psOA42Fq+ShQScf05nZ0zcwOp3pnX1NxecrrEwEqTfxidQPaGFWRK3S1H/OMRaPA
 VBuetP8NN3S3gESRFqtIxkxIdQBQugW9lWUwLasP/EjiXgL+iAYFBA6zVewoYCYrgIYd
 x1C3uiTkXtIZ21BqABuZ15Ug6NPvN+UAsAjfozo+5szXdTtFuz603ONYDUSz7/nJR6BT
 m0h0rSuZVjOvxoixyLG7ck4TWwsomz7DjiJZuHVyNt793DM3GIlQssmmmrx6MN0BspjQ
 1+CA==
X-Gm-Message-State: AOAM530ZkeUI5nO4pnhQEXW4rtPiG8uj2GkJ51gbElIM+3OVfikegKt/
 KSrD0j3sXxbIjbWjo5WEN+8OXhJdE6E=
X-Google-Smtp-Source: ABdhPJwTav+gFCq1m+3KmwjaD/qfvGxsxUEm3b4BQDV1zAi0oduQlJpVM+isrN4Xy5cu8VAf+edOdQ==
X-Received: by 2002:a5d:4e52:: with SMTP id r18mr5616063wrt.28.1616523573594; 
 Tue, 23 Mar 2021 11:19:33 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 u8sm24204412wrr.42.2021.03.23.11.19.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 11:19:33 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/5] qemu-iotests: fix case of SOCK_DIR already in the
 environment
Date: Tue, 23 Mar 2021 19:19:27 +0100
Message-Id: <20210323181928.311862-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210323181928.311862-1-pbonzini@redhat.com>
References: <20210323181928.311862-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x431.google.com
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

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
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


