Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22EF921584C
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jul 2020 15:28:00 +0200 (CEST)
Received: from localhost ([::1]:40112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jsRA7-0006qI-5x
	for lists+qemu-devel@lfdr.de; Mon, 06 Jul 2020 09:27:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jsR8i-00052l-5b; Mon, 06 Jul 2020 09:26:32 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:40796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jsR8g-0001xX-LP; Mon, 06 Jul 2020 09:26:31 -0400
Received: by mail-wr1-x431.google.com with SMTP id f2so12936434wrp.7;
 Mon, 06 Jul 2020 06:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tSVh3xZmU5Rl/VlxY1hhYknTsE0eO5DVOcNMGKELemE=;
 b=qbnbFANxBTkqeC8ntLvePUEA/6O+OhVKoiQ3wU8s9JPQSj4pshbaGeOTNW7MAamPcu
 Su+J3Dd1u74P4moHRgtiNEk57vt/sKjMkE9cJ46oAlj8Xe4Ltx59jSHx/tSifGlkp9jT
 jbSmk+3wA+8Uyjfv74QRqOXNsvpz9jkOL8r40qFfwnHqcWwWPWUUu5MwltusREfB6Yc0
 pS6kgkug7Yp/zCYMoPi2XhqG6MiJiRGd7USoADPe+zJglJiboMUZG8IhQY4v81cPu9zV
 mQl7kmK5T2dLV1wubFA+r0qPiAve69N7SG3QCH2MZOTHvjpa/0djo5deiRXNEJBfIsQR
 1Ayg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=tSVh3xZmU5Rl/VlxY1hhYknTsE0eO5DVOcNMGKELemE=;
 b=bD9r9k5G3O34e52/wtXKNYexLHdipKKHWWHbUCE7po9KDudmVlQ73I/16RENSj9Dfx
 SNFIw3Iw3Pf+rWYH9RXWmwJhFzQsNCHBbLxWEUDMr7wx0virjYBmVGHJ5lXl2qvSwR3d
 xkT9YWfrjQT4Xa/75d0xI5RHZiUVoBulCzndiGT+ahOWt1UDiKc+4KEZzcz0XLklrmlE
 sgY5yZGPUyVO1lxG3iuGfjyVxPr/EaLUmkgsBzN2N9J0yBL9hOzBW7Y7H8JWUYkAxow2
 jPVs3GdgRNe2pUX4GxWMjBBjTl6RroC5tIZLy8tNJi9ra8HbsJp1d6tLLSCWTE7qNBZK
 FP3Q==
X-Gm-Message-State: AOAM531uWu7jC1k77KNZSiF3jlGlumNAQk3iPGOTqCtUluPb30QtsGLr
 NTsB7vCex8qbp9JkUwv4+6s=
X-Google-Smtp-Source: ABdhPJy3fteBFpWnCcBm76WBnCreC3Ozl3AURYlcuW7tquHy8jvwLRuhDJFqfAi9hiIEX+1alLgbyg==
X-Received: by 2002:adf:f203:: with SMTP id p3mr20519115wro.331.1594041988856; 
 Mon, 06 Jul 2020 06:26:28 -0700 (PDT)
Received: from localhost.localdomain
 (138.red-83-57-170.dynamicip.rima-tde.net. [83.57.170.138])
 by smtp.gmail.com with ESMTPSA id w2sm24447004wrs.77.2020.07.06.06.26.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2020 06:26:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH 0/2] block/block-backend: Let blk_attach_dev() provide helpful
 error
Date: Mon,  6 Jul 2020 15:26:24 +0200
Message-Id: <20200706132626.22133-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Paul Durrant <paul@xen.org>, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A pair of patches which helps me debug an issue with block
drive already attached.

Suggestions to correctly/better use the Error API welcome, in
particular in qdev-properties-system::set_drive_helper().

Philippe Mathieu-Daudé (2):
  block/block-backend: Trace blk_attach_dev()
  block/block-backend: Let blk_attach_dev() provide helpful error

 include/sysemu/block-backend.h   |  2 +-
 block/block-backend.c            | 12 +++++++++++-
 hw/block/fdc.c                   |  4 +---
 hw/block/swim.c                  |  4 +---
 hw/block/xen-block.c             |  5 +++--
 hw/core/qdev-properties-system.c | 17 ++++++++++-------
 hw/ide/qdev.c                    |  4 +---
 hw/scsi/scsi-disk.c              |  4 +---
 block/trace-events               |  1 +
 9 files changed, 30 insertions(+), 23 deletions(-)

-- 
2.21.3


