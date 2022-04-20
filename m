Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F672507ED6
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 04:33:06 +0200 (CEST)
Received: from localhost ([::1]:52424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nh09R-0000uO-81
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 22:33:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nh06S-0007HD-1R
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 22:30:00 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:41595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nh06N-0000b3-Ef
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 22:29:57 -0400
Received: by mail-pl1-x629.google.com with SMTP id s14so487074plk.8
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 19:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p2PeLb14X2GIuCKFlYq9RQW88BWRisfM3efGkSN6qzk=;
 b=riNnM9M7jYc6N3FFBzezW+h2IjKRJdGsvgqFKJ/6dniEH3jG36egUPxFgeCvvLSnUn
 HebzI/k76GV0luU1syAifUiP02pcc54r7C7j3USzf8mxbU23Y5i+1gLf4v/KWoYjrgH7
 NFIlXfUQXy8/JEpphKPvcKFSmue1sj3Uc7+mCi6XTYe2P+rl+AHhS4KPoH5SL9j20OXb
 2H6vWQ09DlwSBdh/mKpb2mqujINE/rtg8SbQwh+amYReIri4UQPY2Pf4P95O9vAO4zfz
 oKsGhI3SA+UJGpCypZSl0FXLj6KiWGD/yXJo3XrLXN+aHgLBKoaeg9rmBWbLcocm3qhY
 j7kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p2PeLb14X2GIuCKFlYq9RQW88BWRisfM3efGkSN6qzk=;
 b=Kwa4/Sj5ytiijocIKhqbGHGwTTPtzwwsOgzA5i//5p37WDrTMZFTA/D1CfV5534i2i
 HzRYwkUP/G9LaAbHjcDIIuznMJJil11u2y2bnyRa/KGd0P+CuBJOCKJTDCvpM3as7AjO
 VF0XqpOXfqsAe4K+tKPVzRZs9ebQSXNQe9a+LrTfqPcryuKgDJ/gA5JYTHSXshyzB6uP
 CNzcmWscERijLOzzBKtRKXrfb7iAUuVsG+VAN6R6viKkOWJhOhZbpG45SjkUMR7PSygC
 Ag6Oq6BWzLfpyLezCUa3roGVYEWX6lh/HHaFLAhqnjzD8XKpOT3wTUHUv074+AWsnA2x
 7AHg==
X-Gm-Message-State: AOAM533dDakA4STgLM+/FV8BRIownAF+suHQ3cNbBKucDCtvUc7Y+svd
 +Qa6sFdcGC8CKVjG8aFbTTeimw==
X-Google-Smtp-Source: ABdhPJym3cMMSwUgs0qQ9fqTZ6xBB3FaV9UUtPfKXFf1bMXvPKOFO+xuvjUFA10Si13GzKA2NguThA==
X-Received: by 2002:a17:90a:fd82:b0:1d2:8936:7671 with SMTP id
 cx2-20020a17090afd8200b001d289367671mr1795701pjb.209.1650421792752; 
 Tue, 19 Apr 2022 19:29:52 -0700 (PDT)
Received: from always-x1.bytedance.net ([61.120.150.70])
 by smtp.gmail.com with ESMTPSA id
 c64-20020a624e43000000b005081ec7d679sm17629625pfb.1.2022.04.19.19.29.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 19:29:52 -0700 (PDT)
From: zhenwei pi <pizhenwei@bytedance.com>
To: michael.roth@amd.com,
	armbru@redhat.com
Subject: [PATCH v2 0/2] qga: Support NVMe disk type and SMART
Date: Wed, 20 Apr 2022 10:26:08 +0800
Message-Id: <20220420022610.418052-1-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pl1-x629.google.com
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
Cc: marcandre.lureau@redhat.com, qemu-devel@nongnu.org,
 zhenwei pi <pizhenwei@bytedance.com>, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v1 -> v2:
 - Update version from 7.0 to 7.1.

v1:
 - Introduce NVMe type for command 'guest-get-disks'.
 - Introduce SMART, and implement NVMe SMART for command 'guest-get-disks'.

Zhenwei Pi (2):
  qga: Introduce NVMe disk bus type
  qga: Introduce disk smart

 qga/commands-posix.c | 78 +++++++++++++++++++++++++++++++++++++++++++-
 qga/qapi-schema.json | 56 +++++++++++++++++++++++++++++--
 2 files changed, 131 insertions(+), 3 deletions(-)

-- 
2.20.1


