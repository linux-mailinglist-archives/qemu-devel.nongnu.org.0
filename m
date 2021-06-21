Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 946043AE96D
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 14:53:01 +0200 (CEST)
Received: from localhost ([::1]:42652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvJQC-0006bW-JE
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 08:53:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1lvJNl-0003zs-Mu
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 08:50:29 -0400
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234]:36431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1lvJNj-0004Tz-Sz
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 08:50:29 -0400
Received: by mail-lj1-x234.google.com with SMTP id a16so3484374ljq.3
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 05:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YoLbqiyGCdQEK5KSSCA5bkMl9JyPlBcDUjtO3zA8i9U=;
 b=O2MoTxPYfR2PrVuRua9qxGPs4y3zX/AvkADmosEkB4aT3wNBStMtZZ/mwk8Jt8kHbm
 HdkcWptXeEjMGsHfEtpg6KL8JhaIMV8Kt7Hd2dt/wK+5HKsHlK0ZqaHXRqXIegW6j6Jv
 PBSMzBvKmid9qBybB3PL8mOgkh1qFhevAvfDZdeGlNQTQkQY2aZ6B6liuy9wXf4pISzJ
 BUITG8G4s+2db7dJhm+2W5fIlpIejQSBSGv9twQ+VHROwPpKgZgfAHI6JFR5GAtKbmIZ
 lZQUxM7PhhDRqg9K+n+pxQ24gurxHRGFjEz6g5sxuPKyPHxjkQ4BncHhR5kM6Uf7Qx14
 4k/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YoLbqiyGCdQEK5KSSCA5bkMl9JyPlBcDUjtO3zA8i9U=;
 b=Azr5N2UyxvLJ5jD9a/SyrlCbLNPIQSQq2s8L1wrlPi5SZ6U8VdoTJL6g6AFKQbsKrm
 +vCZeaxVILHvBTjhT7r++COYtN14Ua6HitDWSlXwGE1F2EmQ9iFT9uzNGHteHnNNmkNk
 g1BM0nDTeLrFbQe60Suj0rAO7uklwZmfikYVvviDVxvR2ECAGZNZaftngV3HPztKMGJn
 pyD1l0kYOIQPCwZfKvO+A9/ESyhyASpWvi+dpB9ZSEXYXXZ6DkIHXwdQ4VMJLmhnzfBR
 v04OXLEsnpeHbaIg5vJtWBkxQLchdNRv+h9nnpzYs6uHU48RGLK6puwbkaUCsZE90NWg
 2lbw==
X-Gm-Message-State: AOAM530OTDMOECdMFj144HVUUe/PwEHsW8VmqE61NP5JLiry3sMhXISO
 ow9Gq2AEM3XE9OE8k7ntSXuAbMLHhOI+x9fX
X-Google-Smtp-Source: ABdhPJxBaRBbBsiRocnzL1WuJx9H1UgdyUL3qWxTD3SmPP8NprnixiOoL9fJKoLku6i/nbu56yWzDQ==
X-Received: by 2002:a2e:91d8:: with SMTP id u24mr20051552ljg.451.1624279825393; 
 Mon, 21 Jun 2021 05:50:25 -0700 (PDT)
Received: from kostyanf14nb.Dlink (93-77-45-80.vin.volia.net. [93.77.45.80])
 by smtp.gmail.com with ESMTPSA id v19sm2178068ljc.78.2021.06.21.05.50.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 05:50:25 -0700 (PDT)
From: Kostiantyn Kostiuk <konstantin@daynix.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] qga-win: Add support of Windows Server 2022 in get-osinfo
 command
Date: Mon, 21 Jun 2021 15:50:17 +0300
Message-Id: <20210621125017.113989-1-konstantin@daynix.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::234;
 envelope-from=konstantin@daynix.com; helo=mail-lj1-x234.google.com
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
Cc: Michael Roth <mdroth@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Kostiantyn Kostiuk <konstantin@daynix.com>
---
 qga/commands-win32.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/qga/commands-win32.c b/qga/commands-win32.c
index 300b87c859..93b08fd4b5 100644
--- a/qga/commands-win32.c
+++ b/qga/commands-win32.c
@@ -2209,9 +2209,10 @@ typedef struct _ga_win_10_0_server_t {
     char const *version_id;
 } ga_win_10_0_server_t;

-static ga_win_10_0_server_t const WIN_10_0_SERVER_VERSION_MATRIX[3] = {
+static ga_win_10_0_server_t const WIN_10_0_SERVER_VERSION_MATRIX[4] = {
     {14393, "Microsoft Windows Server 2016",    "2016"},
     {17763, "Microsoft Windows Server 2019",    "2019"},
+    {20344, "Microsoft Windows Server 2022",    "2022"},
     {0, 0}
 };

--
2.25.1

