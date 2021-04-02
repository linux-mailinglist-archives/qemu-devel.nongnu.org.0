Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8228352BE1
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Apr 2021 17:56:52 +0200 (CEST)
Received: from localhost ([::1]:40568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lSMAF-00034B-Va
	for lists+qemu-devel@lfdr.de; Fri, 02 Apr 2021 11:56:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lSM89-0001f3-A4; Fri, 02 Apr 2021 11:54:41 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:36454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lSM87-000570-Si; Fri, 02 Apr 2021 11:54:41 -0400
Received: by mail-pl1-x62e.google.com with SMTP id ay2so2698652plb.3;
 Fri, 02 Apr 2021 08:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0dthNCxoWM5R/u/5zvjAtyDLPaOOu/14OIq3l3c/fOY=;
 b=SeVKNFxF2UY7UUjOR9yoECqTzjlsJGXH8ZMQlueUiecGZEtCyOrSchr57nh+c1xC/D
 ajvvs2ktqN9HBBzOeViNJeBb41YJkT5f+67BuxPK5/iHIe5RMIDEcp5RqUJ69HxeoOVQ
 1evCgcdkW6B+6fcbL+eTs9EB7p16gWg25XJZ33DiOA3BXp2QNS9VwmBc0XYSIp+CFezJ
 3CSHFQGOUfyu8seWtFHQ6ciUrtpErScH/Ux5k7ThuhJ/6tRH74t/PgKC1QZxegFDENQS
 hdHhuU/nEvEFW/fb3377TgJiHg4wq5FFK4tkBrO+2jDAGDr7wCJr5F56GyKBmuvx4yo/
 FfwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0dthNCxoWM5R/u/5zvjAtyDLPaOOu/14OIq3l3c/fOY=;
 b=j2rf7BkafyZsE1+yX7cQJYj5cICVRjPSPBpvV59I5c+VPVMImVl+iOz6kTI57ybTMx
 0C4aBv+YZU9F7jkIUQxzzwqmGQK9d887xJRDFJHK8xk+pVVJ8nmcbIezTJvPUi9FIId6
 uHmI7lsQhbvzhQb+bWt8d5wX4FsZPB1kWun8BLMKUWwBi4m6qHLjcIyIWmT8z0PwO0AC
 25WSypATYMODhHl8uZigKwQFmfQ8FeVnnRg30xL+jjav5Yh5vQQ2H7CNymqd7acOxyRh
 7uKtH8LpgWb7sBbDaL9Kkw5qvUekMXeyJopoVkRYg0IEBrwZZ1EMB8p7t6UTdTv36zXp
 Y+Nw==
X-Gm-Message-State: AOAM531N6gPAp6qsEQuyK9e8zmIomtL8p4z8glJfKGT6xxepqevnMa7z
 zVGzDmSaf6XM8mH7EllHuyKVN71vGZcOPw==
X-Google-Smtp-Source: ABdhPJybbvxUCSCYQWex6d6xze9pDEn2JQLrwVBgqkLXTHpiJh+7eSimXvvct5bNDudOJe74r4Z9sg==
X-Received: by 2002:a17:902:a502:b029:e8:3a40:bc6d with SMTP id
 s2-20020a170902a502b02900e83a40bc6dmr11247250plq.14.1617378878130; 
 Fri, 02 Apr 2021 08:54:38 -0700 (PDT)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:3c79:94d8:55ff:9601])
 by smtp.gmail.com with ESMTPSA id 138sm8540278pfv.192.2021.04.02.08.54.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 02 Apr 2021 08:54:37 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [v4 3/3] block/io: Merge discard request alignments
Date: Sat,  3 Apr 2021 00:54:06 +0900
Message-Id: <20210402155406.31033-3-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20210402155406.31033-1-akihiko.odaki@gmail.com>
References: <20210402155406.31033-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 pkrempa@redhat.com, Akihiko Odaki <akihiko.odaki@gmail.com>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Konstantin Nazarov <mail@knazarov.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 John Snow <jsnow@redhat.com>, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 block/io.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/block/io.c b/block/io.c
index ca2dca30070..aad74bd6714 100644
--- a/block/io.c
+++ b/block/io.c
@@ -124,6 +124,8 @@ void bdrv_parent_drained_begin_single(BdrvChild *c, bool poll)
 
 static void bdrv_merge_limits(BlockLimits *dst, const BlockLimits *src)
 {
+    dst->pdiscard_alignment = MAX(dst->pdiscard_alignment,
+                                  src->pdiscard_alignment);
     dst->opt_transfer = MAX(dst->opt_transfer, src->opt_transfer);
     dst->max_transfer = MIN_NON_ZERO(dst->max_transfer, src->max_transfer);
     dst->opt_mem_alignment = MAX(dst->opt_mem_alignment,
-- 
2.24.3 (Apple Git-128)


