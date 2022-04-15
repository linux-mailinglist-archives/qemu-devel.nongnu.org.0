Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F032A502B32
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Apr 2022 15:44:24 +0200 (CEST)
Received: from localhost ([::1]:59082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nfMFM-00028T-1m
	for lists+qemu-devel@lfdr.de; Fri, 15 Apr 2022 09:44:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nfLsI-0007HY-9S; Fri, 15 Apr 2022 09:20:36 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:42934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nfLsG-0008SV-MB; Fri, 15 Apr 2022 09:20:34 -0400
Received: by mail-ej1-x62f.google.com with SMTP id i27so15335794ejd.9;
 Fri, 15 Apr 2022 06:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A7C8lG6R8RX27Fo+XJU6Uqyin0IHJd8cGVFwfHkJe4Q=;
 b=cB5lJ7uAdz3jBbuQ8fuqA10d69GcCcXMXdVoqHmqzVNidj92/V4zkjYS33dBxACH4j
 Fruz6XN9WXatwvjY1ovw55qRaKr/e3P7A4lb2iuOvb+DZ5jSGknOIWDsAOeIHuyNS3MI
 VGj0pBS/wQ51ytCHR2H3Klp/ZFi0WjA+XpEtb3hd5ppHFNP1HCoPg8FGQJAAf0DAzXpi
 ARx5Tr3+9mIXz9GESostT4BbrprsKr9HUNMKCE7AGIfnI3MNwXIMGy/KBO+tZs7ydY+H
 5Dp5vEfaqD4kL1sqexf8hv+OMuLV69nB1O4I9d+zSJE5vxvHPvOHysN6x0fcZpbvBj7/
 VM1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=A7C8lG6R8RX27Fo+XJU6Uqyin0IHJd8cGVFwfHkJe4Q=;
 b=KFHgbgt29H1rcZaWGTejTj2UE07Z31+BvD8DaUKwXd200o23Y9yP3nUVNHO7Z64/C8
 wLxIb04RfA7T9befrXFsBNHW8sUYYb1UdBpAlOCAb8V/Jjjcp/gxEt1yGQ6rypVPfxvp
 uB1sO7Eq1kk1GMe6kk063v64KVueHOxFN3+BrEQ/vvs5GhN5ronSk7YVVY0v3B7/l7jk
 1b6DQl+NkczZJNUQ9mErZmTly52W0il1W5qOsmInWVYU/0/UfcTaRhBOPvEMOlpLbZ2q
 SuG1UNjvxK66xe0zubXCySbqc/x6i4z0iC4TlULsrFVSvVTmHhuo8YaYPV9vVwnOYiib
 37Yg==
X-Gm-Message-State: AOAM533hcYx7/+s8vgfTwlewwVaLxO72ZogS9AkRx3qmFD6sGRJYJI5s
 m8MY0fLnVe1MTg6xmHzAPSt51aN9sTAw5w==
X-Google-Smtp-Source: ABdhPJyXJ5VfLh7pfrCKSJNq7Ztebv+37KbUiMpjHwk/q3gUDmD5/Mo3BnvAZilaVaTsnc/5KIllKg==
X-Received: by 2002:a17:907:3e16:b0:6df:b4f0:5cc2 with SMTP id
 hp22-20020a1709073e1600b006dfb4f05cc2mr6302462ejc.285.1650028830476; 
 Fri, 15 Apr 2022 06:20:30 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.gmail.com with ESMTPSA id
 dn7-20020a17090794c700b006e8b176143bsm1683529ejc.155.2022.04.15.06.20.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Apr 2022 06:20:30 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 17/26] qed: add missing coroutine_fn annotations
Date: Fri, 15 Apr 2022 15:18:51 +0200
Message-Id: <20220415131900.793161-18-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220415131900.793161-1-pbonzini@redhat.com>
References: <20220415131900.793161-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: malureau@redhat.com, kwolf@redhat.com, hreitz@redhat.com,
 stefanha@redhat.com, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/qed.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/block/qed.c b/block/qed.c
index f34d9a3ac1..208128d679 100644
--- a/block/qed.c
+++ b/block/qed.c
@@ -259,7 +259,7 @@ static CachedL2Table *qed_new_l2_table(BDRVQEDState *s)
     return l2_table;
 }
 
-static bool qed_plug_allocating_write_reqs(BDRVQEDState *s)
+static bool coroutine_fn qed_plug_allocating_write_reqs(BDRVQEDState *s)
 {
     qemu_co_mutex_lock(&s->table_lock);
 
@@ -278,7 +278,7 @@ static bool qed_plug_allocating_write_reqs(BDRVQEDState *s)
     return true;
 }
 
-static void qed_unplug_allocating_write_reqs(BDRVQEDState *s)
+static void coroutine_fn qed_unplug_allocating_write_reqs(BDRVQEDState *s)
 {
     qemu_co_mutex_lock(&s->table_lock);
     assert(s->allocating_write_reqs_plugged);
-- 
2.35.1



