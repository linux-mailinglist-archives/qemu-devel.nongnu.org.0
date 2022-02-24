Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAED4C2922
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 11:18:19 +0100 (CET)
Received: from localhost ([::1]:53654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNBCT-0000w5-SY
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 05:18:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nNB82-0007Gr-K9
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 05:13:42 -0500
Received: from [2a00:1450:4864:20::431] (port=37498
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nNB80-0008B9-9F
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 05:13:41 -0500
Received: by mail-wr1-x431.google.com with SMTP id d28so2168860wra.4
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 02:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EsyiBPgCFC6wledU7ZEnsllUL+n5oPFr3d0oI4Sfhe4=;
 b=eKA6c4g9b6hjeEAc5gRtQP1T6AAtpSYG4LHafnXffo2oOte7wNiDBN5vnGdDZycA72
 sf5JRQY6rAKlFsqmYh/Cnlz3fJf4n255infE/6jHCruaQFObZQDRoHlK8qbwbLNr2H5M
 JHHo+pVThhBnysET7vuPSAWVkqIk6Or6bemKNeQn7X6wSaHXOB2avx9XdbNIVLHPq9X/
 aJh63E6o42qEWzbu7SMGlbBw8LZkqNwvSQpYeDAd6+7N3fryAqDSpqrTsgrU+yt4/AyK
 wJfSxhyRr6+D3JJfRa55UQ7fhVc3FuHX/N/Px9J68dtE3VhySn+V1zHRjV2aSmF4hUi7
 TM5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EsyiBPgCFC6wledU7ZEnsllUL+n5oPFr3d0oI4Sfhe4=;
 b=JheurHarsiH0Ot2LpPWEgrjHNw3y752/8q2Hfs+FAkzpbvMQE6bhxlGo3Pdm+3Zrs+
 AHNxAQszuYFE/TWWd7scbpJ+GQq3HDudEie6WEOCqZEvE9WCiWcxnPad/B1Mdr4rQMg4
 +4Vnu5rBzm+/rzpwEN/IC01R4QzanKkIkjQuHzL8o2pDxBLooKPe6e7yqkVz4sqRUrLk
 HZ/cB4U7uBZxmKk/aFvwXdM6r/zEF6asMwIQJiqNut4xWgekK5b9FliUQhr1NvvDmbkD
 EC+tfvM6MdATMl2ngpjOwwBbXhdq1nLieNeTzqVxuQCcPSpuGUOdon7aO98Z2rldDRWs
 OH7A==
X-Gm-Message-State: AOAM5306Q8k0wW4SyN5VfAZb0U7LEryQ3nf0XgURLriNWKDBQF41r9Aa
 LwKdlvSRKLHW5GhyNg+95/GcYWQrfhGWEQ==
X-Google-Smtp-Source: ABdhPJzrsdY4epZNkGrLAA50PCYHlE6As2psOMk18ndQ1h0jnO5JJ7KIWx3qWgYcaHWdUHqmigyYTw==
X-Received: by 2002:a05:6000:2c8:b0:1ea:972b:5476 with SMTP id
 o8-20020a05600002c800b001ea972b5476mr1661576wry.278.1645697615051; 
 Thu, 24 Feb 2022 02:13:35 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id y12sm2667688wrl.81.2022.02.24.02.13.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 02:13:34 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] ui/cocoa: updateUIInfo threading, autorelease pools
Date: Thu, 24 Feb 2022 10:13:28 +0000
Message-Id: <20220224101330.967429-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patchset was originally provoked by Akihiko Odaki noting
that we have some unnecessary creation and deletion of autorelease
pools in the Cocoa UI code. Patch 2 deletes them; but to get there
we need to do a bit of cleanup of the updateUIInfo support,
which wasn't considering threads.

Tested only very lightly.

v1->v2 changes:
 * name method updateUIInfoLocked, to match existing handleEventLocked
 * don't call updateUIInfo in cocoa_display_init() -- this happens
   indirectly as a result of register_displaychangelistener()

thanks
-- PMM

Peter Maydell (2):
  ui/cocoa.m: Fix updateUIInfo threading issues
  ui/cocoa.m: Remove unnecessary NSAutoreleasePools

 ui/cocoa.m | 31 ++++++++++++++++++++++---------
 1 file changed, 22 insertions(+), 9 deletions(-)

-- 
2.25.1


