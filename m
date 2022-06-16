Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A8D54DF2E
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 12:34:12 +0200 (CEST)
Received: from localhost ([::1]:58316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1mpG-00065F-7M
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 06:34:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@openvz.org>)
 id 1o1mcB-0006tc-PN
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 06:20:42 -0400
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e]:35579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@openvz.org>)
 id 1o1mc8-0000Vh-JN
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 06:20:39 -0400
Received: by mail-lf1-x12e.google.com with SMTP id a29so1524045lfk.2
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 03:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DSeTt1QB5HDWqFVTnSya2l9lA2ROxRGP0qePz5aGaP4=;
 b=04KQLJzfvPdl1NFUTxrhTPGCKAl+hCl8PEbKit9sDGYkZDwzwOGrveMnqfKb5by2iR
 IUD/0Dx4lUNzrF/lKX0SAhYi1rhDLmywwA4CPZ7BtbEEl3nQ2/DbHbcFRoIMx0Bp/Vnw
 VtaE2NtkF4ingopjDcnC33/6B21xcBLJz5BPso8iQVl0YdqGYh2uFkn0uxklIieFboKv
 3911eNVF8DTr3IFJQhxaM2JXFZBiz4mTZXQrACh1PwujLTYREP9vSMbHXJ7OPu+41BFv
 NzWtwePJuFVjE4ZthKSwP536Ab/neGUuO4cdSlFnRLSZ3eCNiro2C8SWJ3e6jeds6eUf
 Jabg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DSeTt1QB5HDWqFVTnSya2l9lA2ROxRGP0qePz5aGaP4=;
 b=Bn2CiSxJnYCXKHY9c78WOYVCn6pdQZXQ07cqal3tKdHHadOWZpptNTgl1H92mk4LtX
 OE8gp3xCehZDXi2UJ3tyFu2bnuXX/kQqOuM2SsDMJe3Fs71V74XXHr03wSAol2qm0+rE
 PbR9PHsw+ULZPiNDUtGN3U4nInBRxwRgBUNhbIlNhxznQRAnLXnX7AgO5hX8V1hac/s9
 rpdRZhggD1uHpf+fMG2XScZQkpQPLQOvx84tcrnL0hljoWZ5SqSyrEy8HnSL7tR9ceHz
 CJCdpzZWwnFy1mqlk22bg2/dr8EGO9Lr9BpCx/vZw1i28jNaJWhDS/hsaQ+rRY7r29gM
 qlFQ==
X-Gm-Message-State: AJIora/rTxpEpJLTSM6gMKbGNDOMYlws7+61DiRrljtUqumnC5IZfQPt
 plSWXP3LNvb6KUYHPMIUU1ZYzYERID27oJCN
X-Google-Smtp-Source: AGRyM1tX5xpyOFwovXDqMFVJx7uo9WPnTbzSFNCXv3dgKvUPkq4G99kr/CNQTjnszWdNdotwfn5dDw==
X-Received: by 2002:a05:6512:2088:b0:47d:a3ac:3512 with SMTP id
 t8-20020a056512208800b0047da3ac3512mr2212261lfr.108.1655374834437; 
 Thu, 16 Jun 2022 03:20:34 -0700 (PDT)
Received: from localhost.localdomain ([93.175.28.49])
 by smtp.gmail.com with ESMTPSA id
 q17-20020a05651232b100b0047255d21166sm179014lfe.149.2022.06.16.03.20.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 03:20:34 -0700 (PDT)
From: nikita.lapshin@openvz.org
To: qemu-devel@nongnu.org
Cc: den@virtuozzo.com, andrey.drobyshev@virtuozzo.com, quintela@redhat.com,
 dgilbert@redhat.com, nikita.lapshin@openvz.org
Subject: [PATCH 5/8] Add block part of migration stream
Date: Thu, 16 Jun 2022 13:20:02 +0300
Message-Id: <20220616102006.218693-7-nikita.lapshin@openvz.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220616102006.218693-1-nikita.lapshin@openvz.org>
References: <20220616102006.218693-1-nikita.lapshin@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=nikita.lapshin@openvz.org; helo=mail-lf1-x12e.google.com
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


