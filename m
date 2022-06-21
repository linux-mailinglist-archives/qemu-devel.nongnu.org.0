Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F7655291F
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 03:50:51 +0200 (CEST)
Received: from localhost ([::1]:32782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3T2Y-00069k-JR
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 21:50:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3T0T-0003R6-Mv
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 21:48:41 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:45773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3T0S-0001tB-4z
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 21:48:41 -0400
Received: by mail-pl1-x62f.google.com with SMTP id d5so11204495plo.12
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 18:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P4BA2iKdBEMkxE2ofwBmHASz6W3lmAQv7Fk+tiz3hJI=;
 b=x1yB8kJJ7uRfUBSg6Cas/KSlJpF3t9KCifc5UlM48w0J1wwkVwnsPVUtzxZpLmLgwi
 WIedAIomS1oduKoJeCmEys3TNZSypKquBxP4Ew5jayUi1DTCAs5FbCJKN5czZVhy2t3/
 fjCeQB6VImkmrQqRxi6c0PWg6hzWkdjPDTv5tduWFGJKq5j/KklBwAbmCeeSjV2kBJHp
 1DUA9H74JduYF6S+hW2gounpr9hG7v+nW2xKPGrnsOe2C6qTXCUqFFHX9weKFwE7jUgt
 a8TnBRkhNs9EJmdqwNjd/ZNX4catfKAxTutcPf9X+yCuWkyXa6KtfYB3bOw1ngzut2VD
 NOaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P4BA2iKdBEMkxE2ofwBmHASz6W3lmAQv7Fk+tiz3hJI=;
 b=uOs6Rc7jo5XScNfZGPSzHP08ImeOcjrg67tYizkNbTg9NCHMUY7SxAgkazHuCW5x5q
 ayVWSNEjl81pYsuDdVWQhPqaJ7UbbRbJOQ6MN/8QGnaJJNv+W+W7mg4p5fgqPvlu9Enb
 SMhPfzSRZeckD9qjiWDBr3mSMX6Thfy3ScW3obLCjo2y9q+vExDvthqqK5PX9QcDnfDP
 WlbxDwrChiHVJvI4xxFUWRzJNzIoxeMMVxVhUBx5D3tLrcGe9QC4O5Ijst34yIIE1UOD
 Pbmv+OHadUx76jVKxVntnUNjRhlHQUdkCvKE/c8zSKJFWJgoOSkb0neQt/k2AbuNrVCX
 JDxA==
X-Gm-Message-State: AJIora9jkknaoj3gZf4xnfreVxlRbhlDrkn/wiPi5RtFapS0/IvbdNso
 0hglITsYEjcmOOgi15UUeWZJmmyGUQMZbQ==
X-Google-Smtp-Source: AGRyM1uaVOWekIpp19nvVZUSnNb/ZROxBhoU3JL5CBlrQLfoGnCo4JTDAIQPtgasLET+G5aiS54/cg==
X-Received: by 2002:a17:90a:8b8c:b0:1ec:711e:c426 with SMTP id
 z12-20020a17090a8b8c00b001ec711ec426mr24408118pjn.17.1655776118596; 
 Mon, 20 Jun 2022 18:48:38 -0700 (PDT)
Received: from stoup.. ([2602:47:d49e:3c01:a3e0:8a80:7b85:aea6])
 by smtp.gmail.com with ESMTPSA id
 q11-20020a056a00084b00b0051bc3a2355csm9907875pfk.64.2022.06.20.18.48.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 18:48:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: npiggin@gmail.com,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 0/3] util: Optimize flushing when ppc host has coherent
 icache
Date: Mon, 20 Jun 2022 18:48:34 -0700
Message-Id: <20220621014837.189139-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This is Nick's patch, with the merge of the two files
as I suggested, and the aarch64 cleanup I promised.


r~


Nicholas Piggin (1):
  util/cacheflush: Optimize flushing when ppc host has coherent icache

Richard Henderson (2):
  util: Merge cacheflush.c and cacheinfo.c
  util/cacheflush: Merge aarch64 ctr_el0 usage

 util/cacheflush.c | 247 +++++++++++++++++++++++++++++++++++++++++++---
 util/cacheinfo.c  | 200 -------------------------------------
 util/meson.build  |   2 +-
 3 files changed, 232 insertions(+), 217 deletions(-)
 delete mode 100644 util/cacheinfo.c

-- 
2.34.1


