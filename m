Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA82D3F5FFE
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 16:15:11 +0200 (CEST)
Received: from localhost ([::1]:38842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIXCo-0005BE-8B
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 10:15:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mIXAA-0005fy-V3
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 10:12:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56068)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mIXA9-0005Wa-Ft
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 10:12:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629814344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UiR702sKQihvxXmLHPk9PJ+aENXmsbkBYxchZbzfBis=;
 b=daB7olrmBYkFMwFwjoY8BN1lofFgLTpA1nMUxyGbjpgMMQBp/+Dv6P8AfVmPB0z2dleBA1
 aPrhH3hOqmLdcp2nDZ5dsWyoN7jecCmYduVO5Ikj+V3qXyZl5GKqIGMK8B7824Oe8n3EUe
 m8cKuYXvjqb5eNdZDEXZ4qaOjFkPPMA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-528-qVmdwVN-M_mkwSm6vICpmQ-1; Tue, 24 Aug 2021 10:12:23 -0400
X-MC-Unique: qVmdwVN-M_mkwSm6vICpmQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 w25-20020a1cf6190000b0290252505ddd56so4161289wmc.3
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 07:12:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UiR702sKQihvxXmLHPk9PJ+aENXmsbkBYxchZbzfBis=;
 b=keHq1ucIr37fUBMR9u/ALXi06NIZhEqA4pW5359hRqpELKdrYqsqyVnhZAExBRgl+E
 Sc5RuwE1qiul70pnGGcTCao89OXhJwLRl2NO80Q2MqjVIo5icW5CBTaq0chjnoejsNju
 UceT6P9VYXjeL2N19YZvLM/lqgca0G5Z0AqIBx5TzuMwvpDZE/j1MBlhyxGp4EMQuRK8
 /dqjvJdX40I+nhgxnajDBxfvQU/YSNXMBWVaMqbZpJmf0BLWG5AaNQ182TeFXTthHDiQ
 cn1jK1HDdtaKJdlizr8Az1XKzE8zNrlfdqvWEmLcaP1kYSfkMjAfBb+D45adSx90DZyC
 ixGg==
X-Gm-Message-State: AOAM533dsKTmrbDwKdA+xAZZpahPuM/RDmPJVsklYtWrEMq6FCLe7pUQ
 qN3dO8AuavUBRvesjEXn8a27mQ0Z24vTUuunu6CTxWVfhLeVeF4PrD7uQu9Lf+bRhGhzC+ygFuD
 YkWcdiY4FHIJ+/KpaGoiR8XFRJTdbsa8Wtq9jy3nz7gzcHnAlvFK+Hzwvccwqv9bW
X-Received: by 2002:a05:600c:2256:: with SMTP id
 a22mr4410959wmm.16.1629814333686; 
 Tue, 24 Aug 2021 07:12:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzOd5pQMj8QHbcBH4poQP+7q/dW/ef3X3pm/whLTBk2nKMIHafm4tZDOVByVvH68WYWYq7bBw==
X-Received: by 2002:a05:600c:2256:: with SMTP id
 a22mr4410425wmm.16.1629814327382; 
 Tue, 24 Aug 2021 07:12:07 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 c7sm2317253wmq.13.2021.08.24.07.12.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 07:12:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/9] util/vfio-helpers: Remove unreachable code in
 qemu_vfio_dma_map()
Date: Tue, 24 Aug 2021 16:11:38 +0200
Message-Id: <20210824141142.1165291-6-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210824141142.1165291-1-philmd@redhat.com>
References: <20210824141142.1165291-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.747,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 qemu-block@nongnu.org, Auger Eric <eric.auger@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qemu_vfio_add_mapping() returns a pointer to an indexed entry
in pre-allocated QEMUVFIOState::mappings[], thus can not be NULL.
Remove the pointless check.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 util/vfio-helpers.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/util/vfio-helpers.c b/util/vfio-helpers.c
index d956866b4e9..e7909222cfd 100644
--- a/util/vfio-helpers.c
+++ b/util/vfio-helpers.c
@@ -751,10 +751,6 @@ int qemu_vfio_dma_map(QEMUVFIOState *s, void *host, size_t size,
             }
 
             mapping = qemu_vfio_add_mapping(s, host, size, index + 1, iova0);
-            if (!mapping) {
-                ret = -ENOMEM;
-                goto out;
-            }
             assert(qemu_vfio_verify_mappings(s));
             ret = qemu_vfio_do_mapping(s, host, size, iova0);
             if (ret) {
-- 
2.31.1


