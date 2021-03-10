Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 843FC333BB9
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 12:46:32 +0100 (CET)
Received: from localhost ([::1]:57834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJxIN-0002Dj-HP
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 06:46:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJxFY-0007Jr-LX
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 06:43:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJxFU-0003DH-VJ
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 06:43:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615376612;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dQp9RrJbaARFkItMfTOnAojZt2imEdHJA1UlVrvebRs=;
 b=PbABloiEcYX2K94zVgoyztGcBszRTyn2V4nu2bdPt3yfRPSFv2/5nTXq7i7Mw197pOoulr
 eGKn+icUb+PW4kSqiFqIhDd6TM1nwwUcFCbmbol9Ncy9apHivmanihZXWYqBZMnCnlc8B4
 TadvRe+G9CIKhigfddTsMJPcycXC858=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-393-STrlWzCDMEWqey9LY6Y0ng-1; Wed, 10 Mar 2021 06:43:29 -0500
X-MC-Unique: STrlWzCDMEWqey9LY6Y0ng-1
Received: by mail-ej1-f70.google.com with SMTP id rl7so7073184ejb.16
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 03:43:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dQp9RrJbaARFkItMfTOnAojZt2imEdHJA1UlVrvebRs=;
 b=WotM0KBjgLoORqYbrLq4MhedzL29e+jSU5VflcNbIXg9DTUpbdGXrPkRruo1atxKmY
 rwJS6rJfSWQS3PLTfqGHKJ/1wp729uW7/qAhLe6I8FAzIzvSEnMPwlr2NiULA/4vX9j6
 0c2x4Pkuh5JbNs7gpA1H2T3Z/ukbq8ytO5X7APMbSPKeIohevEOgnF6fXynFE9ecYrya
 HpU46k4117u1ZZJA1UTGc23HLBOaIS0rvrVSSsn6WM6PQB8XurrY1xyGGwm9zGZ2q+cY
 w2GdCAGNjfBMZk2NFPL05ORsUuqrFRJAIAn7YbxetNGX+yPQudFo15CY5AZUaK3vslBt
 /XWA==
X-Gm-Message-State: AOAM531BR/LmqdTqzG8758wVCcH2Wvo+JEOrexGd9NXh8z9Sl792S9bT
 rl/6eB0Xo58K+3sYWh8Y0/YcutFlfiQzyeQ3drSYoyNw7C9dawFGtDw8JyUcaestfzp9Ec0jyyh
 KWPxmjhb/6Fnp/VXjWo503wvhMdxHVFOV72vAgzM5lVBp7FjY75tezR/l5gKfTDsO
X-Received: by 2002:aa7:da0f:: with SMTP id r15mr2730414eds.111.1615376607656; 
 Wed, 10 Mar 2021 03:43:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwd1g259jRwulBhpmLoYfbF6uNVqM4VQHr3C4sxI8H7Y5u7jf/7IsxZ/bl72nh1ObAVf9VBRg==
X-Received: by 2002:aa7:da0f:: with SMTP id r15mr2730385eds.111.1615376607409; 
 Wed, 10 Mar 2021 03:43:27 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id t15sm11296132edc.34.2021.03.10.03.43.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 03:43:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 2/3] tests/test-blockjob: Use zeroes-co instead of null-co,
 read-zeroes=on
Date: Wed, 10 Mar 2021 12:43:13 +0100
Message-Id: <20210310114314.1068957-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210310114314.1068957-1-philmd@redhat.com>
References: <20210310114314.1068957-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Bandan Das <bsd@redhat.com>, Prasad J Pandit <ppandit@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
RFC because I won't convert the rest of the tests until the
previous patch is reviewed.
---
 tests/test-blockjob.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/tests/test-blockjob.c b/tests/test-blockjob.c
index 75198479120..ae2ea7028ee 100644
--- a/tests/test-blockjob.c
+++ b/tests/test-blockjob.c
@@ -70,9 +70,7 @@ static BlockBackend *create_blk(const char *name)
     BlockBackend *blk = blk_new(qemu_get_aio_context(), 0, BLK_PERM_ALL);
     BlockDriverState *bs;
 
-    QDict *opt = qdict_new();
-    qdict_put_str(opt, "file.read-zeroes", "on");
-    bs = bdrv_open("null-co://", NULL, opt, 0, &error_abort);
+    bs = bdrv_open("zeroes-co://", NULL, NULL, 0, &error_abort);
     g_assert_nonnull(bs);
 
     blk_insert_bs(blk, bs, &error_abort);
-- 
2.26.2


