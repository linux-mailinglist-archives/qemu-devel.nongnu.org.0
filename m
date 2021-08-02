Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B093DD72E
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 15:33:49 +0200 (CEST)
Received: from localhost ([::1]:60742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAY4i-0005B3-12
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 09:33:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1mAY36-0003mi-7p
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 09:32:08 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:41759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1mAY34-0006U8-R8
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 09:32:08 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 n28-20020a05600c3b9cb02902552e60df56so12011wms.0
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 06:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9CFmELi57VjbDJmiP0jjcNFNorPr3gm5A+o71n7pfb0=;
 b=Atn7hHRbJh+PqSo6jqAXL1UYFRgD/JmfZt6JTnS7Fh8hdXuDYy667O737liXTtf/dh
 3swfx3rGKi1QeLhhYFWCUywRkGAoRjujyr0Yr9xzTyFJDeOmGCbwEH/XBpfWO/k3cAMY
 iaGRxO2uWnW4Z7Y48NiuTnSHj5HIX9zEEE8DKd07j3Bsvh2E0zVR4eD3vhFXarTap6wT
 aXK6N9dFS4Mj2Us2f0sO9eE2G1lvr3gin9R+p1Sbe4FAVtQJI7FwuV/4E7gC0wUib+0Z
 TnCt5AlT3lc5morLqpfPYOKF2BD0dBrFo/7TVVRRj8c76j2gABfM1nFCv7ypkY9F90zN
 yOHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9CFmELi57VjbDJmiP0jjcNFNorPr3gm5A+o71n7pfb0=;
 b=YQQYhlaJvuMLy5pzhtLCa4YaYmwUsFyeIjZbErebVU/UzWvfAJN+QIMVZ32UBvgERy
 QY4U3mHj2/e0Z90M8qVyr82Cv9ZsZUWhNYQB7nKDuI4gOsJ/ncng/dqEvC/KPgYKkQ0v
 Lp8Jy2ISInxGI1InDm0oBVdSOI1McdKfO/VyfKiVJS0G+Qu2tFdlD2o2Da9z0copmCtN
 pzXcUVSQvwLK9zXxrru91k2gRQEK3IbxvTLZ4Gu/B3tT6ZbwJv/zyORi0taAsgdKFAgU
 8b6fFiIMcyISxaGUgIYiG8zOIcxk5hPbgQfG3j/2UoBhho4L19AfQfrVw9ZsCPU+9r4a
 rEPQ==
X-Gm-Message-State: AOAM532LlaxSjEeQznm638G87BBVQp8CIDbX7HLWvY4E1JWGT5AjSh2o
 RSVK0mMaTIoqpqOupZWnSkZZU4GKDkc=
X-Google-Smtp-Source: ABdhPJwcdW5tehOu6yo0ATyAZKz6g6EpSgf+SJ2rRiYlak4M6fzHqN8laa8Mo1DMh9x64PxyHob4NQ==
X-Received: by 2002:a05:600c:2159:: with SMTP id
 v25mr17227007wml.42.1627911124302; 
 Mon, 02 Aug 2021 06:32:04 -0700 (PDT)
Received: from localhost.localdomain ([197.61.223.190])
 by smtp.gmail.com with ESMTPSA id a2sm11269589wrn.95.2021.08.02.06.32.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 06:32:03 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/2] plugins/cache: multicore cache modelling
Date: Mon,  2 Aug 2021 15:31:41 +0200
Message-Id: <20210802133144.45196-1-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wm1-x32e.google.com
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
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>, cota@braap.org,
 alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

This series introduce multicore cache modelling in contrib/plugins/cache.c

Multi-core cache modelling is handled such that for full-system
emulation, a private L1 cache is maintained to each core available to
the system. For multi-threaded userspace emulation, a static number of
cores is maintained for the overall system, and every memory access go
through one of these, even if the number of fired threads is more than
that number.

The changes in the patches are identical to the previous version of the series,
however:

v3 -> v4:
    1. Re-based the patched on top of the current master.
    2. Dropped the patches that were already merged.

Mahmoud Mandour (2):
  plugins/cache: supported multicore cache modelling
  docs/devel/tcg-plugins: added cores arg to cache plugin

 contrib/plugins/cache.c    | 154 ++++++++++++++++++++++++++++---------
 docs/devel/tcg-plugins.rst |  13 ++--
 2 files changed, 127 insertions(+), 40 deletions(-)

-- 
2.25.1


