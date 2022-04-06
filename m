Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5868D4F6355
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 17:34:37 +0200 (CEST)
Received: from localhost ([::1]:46916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nc7g4-0002vd-7Z
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 11:34:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nc7dr-0000uA-K1
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 11:32:19 -0400
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230]:42703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nc7dp-0001tV-Ri
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 11:32:19 -0400
Received: by mail-lj1-x230.google.com with SMTP id c15so3715337ljr.9
 for <qemu-devel@nongnu.org>; Wed, 06 Apr 2022 08:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jVeljm6J+tR8QaGaKRkXn7IoJmb1f9yIz6k7qp7O13U=;
 b=cEDTG7bnMw+vCVqnL1kkYR8r+yUN6G+VYXlWMTZSQ0b8aeZVumCzatak5+WZY1m2tA
 DeJuiQ1HNBqIKNtmTiWoSxM7/XmU0SNjS7U6KuD4yveXfsEhxsTjx4YM76eL0/8V1qhU
 XuyqHvB8rw9d7dD3yjZJIrgeFmhE7qjc5//+Vi/s5pd9v5A+S5IYSlmqzfNJs5nhU7h+
 Pm/07KIwtXXIV1vTYYZKSWWxoG3enXxyQRZN+rz8YQARmsnZhbrk9Qzk7rHTwoLki4g5
 TCANdWF7Pn60QUtLSIkjdXUM2JdafQAgfvzjpyck4F0h64uq7yNbmCiMFeIS/j/DliJt
 xu6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jVeljm6J+tR8QaGaKRkXn7IoJmb1f9yIz6k7qp7O13U=;
 b=Ab4lnVhLjuN1jirTMoPd9nZETS8IqHohQWMu3drKRCh3KHxuGS4ef5izluJe1LJkFE
 NFgCSpTFXQnp9TjJYS/v5rFgqWvu83AxFVRUOwpyAr9Srii3Dt/S84nimPB2N+d5VQwU
 uSpTmW/b7hWrE83w1C2KNGb8XYSIkVSHjjQjUun+2qz97s2o3QXd8R7qZxx5vSAJPb0s
 TygiUnALFrwThP0DbTwR5tN8PZR/cSy7Pt4KKlZE7DQaP+i4RbSdhXrOC7cxz4wEaJ4t
 nhKCKXslfbL58i9uqbqFySakIDbxzVcFesPQlz2q9SKKsJrCfKtclpCfCV9vbsVhehm+
 z1Rg==
X-Gm-Message-State: AOAM532nzEcz8FctdDyLDOmemfaSg7VNqKFLalVfTq9BL3IrdbltC2f2
 cVtyUTpV7z2baSDiUFoukOpZCg==
X-Google-Smtp-Source: ABdhPJxjMVbrOwXTP3W/tnLzWppFUxDg3E0XN32QKfvD3K4WsGvg+/s0yQZ2GWBuRbxXnyQ7GG53iQ==
X-Received: by 2002:a05:651c:2043:b0:24a:e614:c059 with SMTP id
 t3-20020a05651c204300b0024ae614c059mr5596903ljo.482.1649259135274; 
 Wed, 06 Apr 2022 08:32:15 -0700 (PDT)
Received: from fedora.. ([185.215.60.161]) by smtp.gmail.com with ESMTPSA id
 m20-20020a056512115400b0044aa2184999sm1861378lfg.142.2022.04.06.08.32.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 08:32:14 -0700 (PDT)
From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
X-Google-Original-From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
To: qemu-block@nongnu.org
Subject: [PATCH for-7.1 0/2] throttle-groups: use QEMU_CLOCK_REALTIME
Date: Wed,  6 Apr 2022 18:32:00 +0300
Message-Id: <20220406153202.332186-1-vsementsov@openvz.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::230;
 envelope-from=vladimir.sementsov-ogievskiy@openvz.org;
 helo=mail-lj1-x230.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, v.sementsov-og@mail.ru, berto@igalia.com,
 qemu-devel@nongnu.org, hreitz@redhat.com, vsementsov@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all!

Honestly, I don't know why QEMU_CLOCK_VIRTUAL is used here. Comment say
that that's specially for throttle tests, but the simple test (patch 02)
just hangs because QEMU_CLOCK_VIRTUAL clock just doesn't tick in this
environment.. And if we change the clock to QEMU_CLOCK_REALTIME, new
test works, and old tests work as well.

What the relation between QEMU_CLOCK_VIRTUAL, qtest and throttle?
This code is here since "throttle: Add throttle group support" of 2015..

Vladimir Sementsov-Ogievskiy (2):
  block/throttle-groups: use QEMU_CLOCK_REALTIME for qtest too
  iotests: add throttle test

 block/throttle-groups.c               |  4 ---
 tests/qemu-iotests/tests/throttle     | 50 +++++++++++++++++++++++++++
 tests/qemu-iotests/tests/throttle.out |  0
 3 files changed, 50 insertions(+), 4 deletions(-)
 create mode 100755 tests/qemu-iotests/tests/throttle
 create mode 100644 tests/qemu-iotests/tests/throttle.out

-- 
2.35.1


