Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C66D96A1E6A
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 16:22:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVZsP-0004vM-6U; Fri, 24 Feb 2023 10:20:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVZsJ-0004v3-7O
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 10:20:43 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVZrz-0003sw-NP
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 10:20:26 -0500
Received: by mail-wr1-x429.google.com with SMTP id h14so5606765wru.4
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 07:20:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NW2hSLPKQjHfo4qS9sp+ojGRK3AOhAw5hNSXEkYXyn8=;
 b=oZG+IjZgSkQY9wZ08Mw+PuFjkYzGcb96B/mZGyhBal81HqtMqH9ty1rjSqeIxbO3s0
 YV9xLr2lCkE+ywl8CrLz9m1Q5Y/WdHlRKLkacLGIQUAtZ2RILQS1+AtK4iuONa+h9YlE
 PYHgIqbPNGp3vY3TwnO7nFdxEhD6b+nySYB1vU9jiQvm72mh3xvbQDLv+wECEToHweyM
 YXUdXLclc0NPswog2kKqp7x70NzAN0ofB1dFMgNO7YqlPqL8c7Bm8pOdyNZw/LMvAeVo
 Lq/4A3rJA4M6KdK91gdP8Zx+0fVrfliQ0HMjkSzNsY0Cz4Bj0+baje5GpfruthZvARdl
 wK7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NW2hSLPKQjHfo4qS9sp+ojGRK3AOhAw5hNSXEkYXyn8=;
 b=eo6wGN60TT455U0XJCQlG6/oqNA4e0GbCkLNftZqEx/xkS/aCDKFEyB2GW1ibglRyH
 QMEwB76srK7ThqoX9FMsoRS2GH+Sm7SkcciW7jnNZwd0gVG4xKJs5NNVk5CXZ9D2TukI
 Xrc0bOrL8mHe1W/iItURabvIE8e0y4FldsyqZkXLqSbCcMaVbpGMGzCo+XAq2fLs/lVY
 Zf5dInwt48L8GvTJFa6QfejvMyGj2SBnRMd5pIz/1LORzfebPID5wTpOMu4lPLhIYRt6
 lwkcnwu1IrQBYEV4WAu/P2A/Rgvd7ChlV1eYmkFRh65st3m6BqL6YRWaiPZsV4MpJZHF
 7ykw==
X-Gm-Message-State: AO0yUKVdER3rhxKvdJNa09jWbSOzAswUjz+XQVk6S85AFUoCaWeCYma3
 WEQeZNFQnzKRa7ZkSfvHJ0pwBWUUSYRjOImE
X-Google-Smtp-Source: AK7set/1al3aoQd0EE/SZFdqdQFdeHEbv0yygv9ry6NAF0kuRnjp+JIYi1KmyeYu53rv3qF9OvYLDQ==
X-Received: by 2002:a5d:59c2:0:b0:2c5:4c5e:412b with SMTP id
 v2-20020a5d59c2000000b002c54c5e412bmr24925wry.23.1677252021835; 
 Fri, 24 Feb 2023 07:20:21 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a056000114900b002c5584d0e3dsm13319916wrx.24.2023.02.24.07.20.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 24 Feb 2023 07:20:21 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Kevin Wolf <kwolf@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/2] block/qcow2: QAPI'fy Qcow2DiscardType
Date: Fri, 24 Feb 2023 16:20:17 +0100
Message-Id: <20230224152019.19278-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

QAPI seems designed to maintain such enums,
so convert Qcow2DiscardType to be QAPI generated.
Besides, this is how Qcow2CompressionType is maintained.

Philippe Mathieu-Daudé (2):
  block/qcow2: Rename QCOW2_DISCARD_TYPE enum definitions
  block/qcow2: QAPI'fy Qcow2DiscardType

 block/qcow2-bitmap.c   | 12 ++++++------
 block/qcow2-cluster.c  | 32 ++++++++++++++++----------------
 block/qcow2-refcount.c | 36 ++++++++++++++++++------------------
 block/qcow2-snapshot.c |  8 ++++----
 block/qcow2.c          | 26 +++++++++++++-------------
 block/qcow2.h          | 19 +++++--------------
 qapi/block-core.json   | 10 ++++++++++
 7 files changed, 72 insertions(+), 71 deletions(-)

-- 
2.38.1


