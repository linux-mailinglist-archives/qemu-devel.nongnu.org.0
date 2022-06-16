Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF6454DF44
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 12:39:44 +0200 (CEST)
Received: from localhost ([::1]:39502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1mud-0004Qy-V9
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 06:39:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@openvz.org>)
 id 1o1mjf-0001cy-Tn
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 06:28:24 -0400
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230]:35524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@openvz.org>)
 id 1o1mje-0001sh-Fq
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 06:28:23 -0400
Received: by mail-lj1-x230.google.com with SMTP id r24so1014042ljn.2
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 03:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DSeTt1QB5HDWqFVTnSya2l9lA2ROxRGP0qePz5aGaP4=;
 b=4qee0fVtj65lw2VRmj5huBbxCW5kniUSmpivuNXpmmKbzLReH4PagdRA00Wd+ADxZO
 ViO6/yb/8COC5WTr1pQ8OrZq3ySEP7cmdvkm+rlp3bNiq5fR9QmC3OW9gA/jFl2kEY28
 9oLFHtbdajw5Zgd2vQgABGjVsv+R33kDlX1atxLhl4Vt+DLlMcmtcNxyAu0vBfg249iR
 VwnXNsUS7guUBFC6Ccr4L7Gk1MUA0pxxA1IEu9LlDlbOxURctK2uggrlAZzhYt6MRxg9
 kTmV+uZyuMJrO8LD2Or1fjs1wWspwxz5bFKHXjdCjGfczCEuJ9ZTLSdRvQ/IWBv3rXii
 ywdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DSeTt1QB5HDWqFVTnSya2l9lA2ROxRGP0qePz5aGaP4=;
 b=tpWQQmkAzkYkdMykpxGAoej/6ScVXLCL1Y5jIuikGoul8Zxv9/gtak04HyoGq7Wq1c
 lxWjpvTcsnLTR5fbcjC4spfL1/N8QyXbbyR5zoHM+mJPm0aPZiRQywmdbuZcNdzYuJ7a
 YoISMFBOraT5XOTf8rb2QppGJOB5BkmZW4vfig6627g1Pa1U77w64P4+1ZP2olg7bsbJ
 BUIFnksjFjIMYFL9UKDazZd42MgLxcqfsnKL+ozdjL1tZ5zbI2hSWZhtAzocZYARCqet
 rFMDF3K8EbUTo434eFpagN2xaNfUvCnChbJr7Q2nR4NJovmmQHSVcjYtti78d19NdFMv
 UtBQ==
X-Gm-Message-State: AJIora+PRoHW041aDpiFZ+TSTLswdeO2pb7cmlKwlNrl7/IWeGHVfZkc
 al9glxIUSjl06WJ/KM2/oPGU+Fyq/haKvGnA
X-Google-Smtp-Source: AGRyM1t141GP+xPsMR171BCDC5yao7J8fHkYa4zEMSP88SkEun7S7mzOA/j0wO5hriJx5gjGl20Okg==
X-Received: by 2002:a2e:3315:0:b0:258:dfff:e252 with SMTP id
 d21-20020a2e3315000000b00258dfffe252mr2172335ljc.141.1655375301573; 
 Thu, 16 Jun 2022 03:28:21 -0700 (PDT)
Received: from localhost.localdomain ([93.175.28.49])
 by smtp.gmail.com with ESMTPSA id
 y24-20020a199158000000b0047255d21128sm182581lfj.87.2022.06.16.03.28.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 03:28:21 -0700 (PDT)
From: nikita.lapshin@openvz.org
To: qemu-devel@nongnu.org
Cc: den@virtuozzo.com, andrey.drobyshev@virtuozzo.com, quintela@redhat.com,
 dgilbert@redhat.com, nikita.lapshin@openvz.org
Subject: [PATCH v3 05/17] migration: Add block part of migration stream
Date: Thu, 16 Jun 2022 13:27:59 +0300
Message-Id: <20220616102811.219007-6-nikita.lapshin@openvz.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220616102811.219007-1-nikita.lapshin@openvz.org>
References: <20220616102811.219007-1-nikita.lapshin@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::230;
 envelope-from=nikita.lapshin@openvz.org; helo=mail-lj1-x230.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Nikita Lapshin <nikita.lapshin@openvz.org>

This patch enables and disable block in migration stream.

Signed-off-by: Nikita Lapshin <nikita.lapshin@openvz.org>
---
 migration/migration.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index ad789915ce..d81f3c6891 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1338,7 +1338,8 @@ static bool check_stream_parts(strList *stream_list)
 {
     for (; stream_list; stream_list = stream_list->next) {
         if (!strcmp(stream_list->value, "vmstate") ||
-            !strcmp(stream_list->value, "dirty-bitmaps")) {
+            !strcmp(stream_list->value, "dirty-bitmaps") ||
+            !strcmp(stream_list->value, "block")) {
             continue;
         }
 
@@ -2621,7 +2622,8 @@ bool migrate_use_block(void)
 
     s = migrate_get_current();
 
-    return s->enabled_capabilities[MIGRATION_CAPABILITY_BLOCK];
+    return s->enabled_capabilities[MIGRATION_CAPABILITY_BLOCK] ||
+           migrate_find_stream_content("block");
 }
 
 bool migrate_use_return_path(void)
-- 
2.31.1


