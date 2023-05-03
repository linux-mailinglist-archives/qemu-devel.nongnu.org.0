Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C726F5778
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 13:56:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puB4X-0001zg-LV; Wed, 03 May 2023 07:55:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1puB4V-0001wM-4E
 for qemu-devel@nongnu.org; Wed, 03 May 2023 07:54:59 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1puB4J-00012P-Rf
 for qemu-devel@nongnu.org; Wed, 03 May 2023 07:54:58 -0400
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-63b5465fb99so3994313b3a.1
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 04:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1683114884; x=1685706884;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7pgI9GbithIVI7QR54i0GOM4iaL1+6pZCz6AZ+iH2xo=;
 b=Xc050Or+O8CDj90Dgiv9CAGz5oltY07/F27VPDDOwPTbWjJjR68TQ2DgDDMxRfHfPA
 wj9qHstlz2KlOkiu25VFh6Nk5a8Y3s5sAvmmyqSRrbeWaYul2Mxrrhct8g2KRIwyICHG
 oirr65UqYsLu9wsG6TKrSBNq8DWu4RSoPjE9Uo7dX60ZTCCbIvM0MLPJwWOI9SA/PSCM
 MmKlhTlSRGjod08AqUuWdWxqdGtT318NY6aUT2EVAjcoE9RYU+M4TJ/xB0g8wDJmW/FR
 FRf4jBQGhY369zFw6IUMK+WjUVwCY+kYMFs9O+ow17+fFE6kD/0ozP3LkZmg/qGqddMM
 kvMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683114884; x=1685706884;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7pgI9GbithIVI7QR54i0GOM4iaL1+6pZCz6AZ+iH2xo=;
 b=UOQMFjaZoEB0USM9tdNRDoH+PuV/gGOEB0FNMY+7OsFHcMO4ccwAVvU3y6MDYjkC+Q
 FKkSCiODb5ThxCgqdihTiw0B08cGQMM4TeRj5belXCsTnpyTEnyRtTykzpFrgf9pt26P
 nGyGfa+gl751NQgIoODphVh910R2QL6KqE4KSIR+PH1E9JJawlyyGjbneJ925nAVd6Ei
 iUByE9TvZdlP7ZSHNA8To8duvjE87HK/Bw/zoBlKmGkdxKzZ2CQW82v9+6wFnJPAX5qE
 XQn84lOnu2pjU/IguLAkc+IuEH7e9oCkAU5OFQZbDSulXalatIUopz73iBixrP8Vus29
 VzyQ==
X-Gm-Message-State: AC+VfDyoRF0oHvZhE1M7VdHyobj0rhKYX12m6BNig1rT22erSfbDJxYl
 eshMhVQtRaEEmu2J7abIJGUFHQ==
X-Google-Smtp-Source: ACHHUZ5hzvhElq4ek+vImQUmI0QFCnR3VhsiyapRAz2Y8F7/05GBxsWiafUwzuJkXGd/zp/lzQ8WpA==
X-Received: by 2002:a05:6a21:7884:b0:ec:88e1:1452 with SMTP id
 bf4-20020a056a21788400b000ec88e11452mr25421527pzc.62.1683114883792; 
 Wed, 03 May 2023 04:54:43 -0700 (PDT)
Received: from libai.bytedance.net ([61.213.176.11])
 by smtp.gmail.com with ESMTPSA id
 136-20020a63008e000000b0051806da5cd6sm20039586pga.60.2023.05.03.04.54.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 04:54:43 -0700 (PDT)
From: zhenwei pi <pizhenwei@bytedance.com>
To: mst@redhat.com,
	arei.gonglei@huawei.com
Cc: qemu-devel@nongnu.org, zhenwei pi <pizhenwei@bytedance.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH] cryptodev: fix memory leak during stats query
Date: Wed,  3 May 2023 19:54:37 +0800
Message-Id: <20230503115437.262469-1-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pf1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

object_get_canonical_path already returns newly allocated memory, this
means no additional g_strdup required. Remove g_strdup to avoid memory
leak.

Fixes: Coverity CID 1508074
Fixes: f2b901098 ("cryptodev: Support query-stats QMP command")
Cc: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 backends/cryptodev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/backends/cryptodev.c b/backends/cryptodev.c
index 94ca393cee..7d29517843 100644
--- a/backends/cryptodev.c
+++ b/backends/cryptodev.c
@@ -522,7 +522,7 @@ static int cryptodev_backend_stats_query(Object *obj, void *data)
 
     entry = g_new0(StatsResult, 1);
     entry->provider = STATS_PROVIDER_CRYPTODEV;
-    entry->qom_path = g_strdup(object_get_canonical_path(obj));
+    entry->qom_path = object_get_canonical_path(obj);
     entry->stats = stats_list;
     QAPI_LIST_PREPEND(*stats_results, entry);
 
-- 
2.34.1


