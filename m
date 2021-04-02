Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2694352D46
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Apr 2021 18:10:18 +0200 (CEST)
Received: from localhost ([::1]:36908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lSMNF-0005WA-JF
	for lists+qemu-devel@lfdr.de; Fri, 02 Apr 2021 12:10:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lSMGQ-0000Dt-Uz; Fri, 02 Apr 2021 12:03:14 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:53996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lSMGP-0002Bz-9x; Fri, 02 Apr 2021 12:03:14 -0400
Received: by mail-pj1-x102d.google.com with SMTP id t18so2887076pjs.3;
 Fri, 02 Apr 2021 09:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0dthNCxoWM5R/u/5zvjAtyDLPaOOu/14OIq3l3c/fOY=;
 b=ECFJuon9tNBZQgpjYQZsYJ5H4sxOdRozCEZlcFx+bac/Ctp32cExrZzbdLd2lR7dUu
 QqFA28flW+hYIIAAlYj82BMfJihpO/TgBp1zp3vM9GWndRIr2FuRiHtc1Vi+1Xty9hlE
 u4f78YknV3cr0aGEQA06rAekZlLPe5TEgIs5tZhzjjMZffSkM2xhnAeI6O9QYuciXR41
 jben+ZjnV/hYthFTkaDgxwrGJlEvCpAtR1BBlwmMpEIgbTfSlejPtv9dCX8wxuPt+yav
 +QOnVP+8N8BYcEsLWC/tVqhTY3E237H29CL6R8spk5MlC+R1JakdASZhLSqwBRS8zBPk
 pOYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0dthNCxoWM5R/u/5zvjAtyDLPaOOu/14OIq3l3c/fOY=;
 b=LPcsytSZrP+/QtarqxURXb7fi6CNYbEQzifor6RqbG5hqP468GMTrunn1Or+cyoxi4
 ruHwOBRcYQ2ukCg5ADYYwTjFejqzmZWdg80c0vFYeMye74HJQqbxOaa5KD6afrMyJ2jQ
 /i5KfqvOY2CPxTk0Ej5UAbJKoYtcGCrYih+U3q9c/exCWR3u1qctcAP1eQsm8+w8r4MJ
 vBPv60bbx6pacOWAcUlP6It6DAdMX3s/ghCdMuG36EBrC71wI4+9X7UxCzGJ0EyewmIh
 wS7zZIlx6RKh+wRZ9ExR2Vd4KkTweUJuy6NPy+NVQQ/MvySSW/IndIsZdltWnDdf6QYm
 QjEg==
X-Gm-Message-State: AOAM530KVRcuAXDGokF01soM8EF4SVbXionEmJ88+Lxiy6OuS8aiIN/J
 /ZYoCyxama8a8iz3vMthnIBDLtMEkb9gaw==
X-Google-Smtp-Source: ABdhPJw32kOP7Lnop4UannvunOv6L+cYzYlkRnU5cI1vGKsyGSAmqc4eEDWUXCBvg84bL72L87fwRA==
X-Received: by 2002:a17:90a:c20a:: with SMTP id
 e10mr13945685pjt.221.1617379391529; 
 Fri, 02 Apr 2021 09:03:11 -0700 (PDT)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:3c79:94d8:55ff:9601])
 by smtp.gmail.com with ESMTPSA id w84sm8708723pfc.142.2021.04.02.09.03.08
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 02 Apr 2021 09:03:11 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [v5 3/3] block/io: Merge discard request alignments
Date: Sat,  3 Apr 2021 01:02:56 +0900
Message-Id: <20210402160256.39647-3-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20210402160256.39647-1-akihiko.odaki@gmail.com>
References: <20210402160256.39647-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x102d.google.com
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


