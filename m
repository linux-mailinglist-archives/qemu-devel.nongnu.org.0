Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 070603E5C2D
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 15:50:38 +0200 (CEST)
Received: from localhost ([::1]:52030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDS9M-0000yA-H5
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 09:50:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1mDS7n-0007Vi-FF
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 09:48:59 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:42755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1mDS7j-0008Ib-Ih
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 09:48:59 -0400
Received: by mail-wr1-x436.google.com with SMTP id q11so8188341wrr.9
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 06:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E5hS3ENVP72CpSnlelGnT6C1q/k3+cgLvOlOPZM7xvs=;
 b=XE/5dScqU0CupFFp2hVBKsvHh1h2G4bQ/J2rFEPRiJge7mdVNwq/+ci3b/AdFC6ZyY
 b1nUdfEICbp7bd1/ivj997huDgzm9MAkVdkRofHU1h+38p/OLkiWGSp5kv0k/Qraiz5f
 XgRMAmjXz/1EoY43+O5kQHOpHok9j2NhEirVn4ZWp6QgzWUkx2zbhEuBkamJWQFQqrlj
 mCVDr1kvIpclD0Sa8OyHSBAe22NOyLv5GMilPTNTwraoealQTddaUgNqTtx/r9YOsCKY
 f3Dm5d27a6wFW/3+0WzbKp/Ms15DiteIXEk46ZE/+exP67OEuuxi+TQ8INZ9j74Q714A
 RfZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E5hS3ENVP72CpSnlelGnT6C1q/k3+cgLvOlOPZM7xvs=;
 b=h+0ZpGsF5+yE86WxxogmzibxKrd8l5dydMJGbv7IAUBv3q8KNRZWVL0n6vez+xFXK2
 LX8wP5DZ6XQjnaEyHBWZRnPA5UuxVuAG5xcvlbi96r/yWM6SmZb72JTE/c9riC7KJvvu
 7k7hs6pv/zclaWj4haZUGLvrik9cyLO4y20P3NQTyFmCBElpdp5lyA8pzfyUle3zxzdo
 /nAVkKTLnk0uksuBidS4o9yTSbVgzIelas/b12+umXgrY+GrZiakPIqVaQBUm26Z4GVi
 ruHHNH3wXkWqXzKZyWt3KrLz1cLArdu4Fg0dm8QlnWsOx0gSz9LT811x6RyWSRV9L8NI
 B6iA==
X-Gm-Message-State: AOAM530UiBSNBHT1wijklCkEyXwXXuY/5s5Bk7XbIqta+YvN/2EY8Bfp
 ciSMwqwxVVQBo0FmMEzC3AqSqRwnz10=
X-Google-Smtp-Source: ABdhPJzzaytGYcfZAHJ5QT/UcxqupugtvX621Zl6vz58tiniFS2BntF+zMKi5v0/M23T34ij+cNppA==
X-Received: by 2002:adf:ff92:: with SMTP id j18mr31787153wrr.334.1628603333828; 
 Tue, 10 Aug 2021 06:48:53 -0700 (PDT)
Received: from localhost.localdomain ([41.36.105.33])
 by smtp.gmail.com with ESMTPSA id u6sm8683413wrp.83.2021.08.10.06.48.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Aug 2021 06:48:53 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/5] plugins/cache: L2 cache modelling and a minor leak fix
Date: Tue, 10 Aug 2021 15:48:39 +0200
Message-Id: <20210810134844.166490-1-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wr1-x436.google.com
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
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

This series implements a simple L2 unified per-core cache emulation, the L2
cache is not enabled by default and is only enabled on specifying so using the
plugin arguments. L2 cache is only accessed if L1 does not contain the wanted
block. If a miss occur in L1, the block is "fetched" to L1, and then L2 is
interrogated. This effectively mean that on a cache miss, we bring the data to
all the cache hierarchy, which is quite reasonable.

Note: Some +80-column lines are left as is, since they're all 81~83 cols and I
thought that it's so important to break them since breaking a line usually looks
ugly when not sufficiently long(?) LMK if I need to fix this :)

Mahmoud Mandour (5):
  plugins/cache: freed heap-allocated mutexes
  plugins/cache: implement unified L2 cache emulation
  plugins/cache: split command line arguments into name and value
  plugins/cache: make L2 emulation optional through args
  docs/tcg-plugins: add L2 arguments to cache docs

 contrib/plugins/cache.c    | 318 ++++++++++++++++++++++++++-----------
 docs/devel/tcg-plugins.rst |  22 ++-
 2 files changed, 244 insertions(+), 96 deletions(-)

-- 
2.25.1


