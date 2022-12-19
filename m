Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC0665091F
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 10:10:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7C97-0002jt-BN; Mon, 19 Dec 2022 04:09:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1p7C8v-0002jc-VG; Mon, 19 Dec 2022 04:09:06 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1p7C8u-00038R-8Z; Mon, 19 Dec 2022 04:09:05 -0500
Received: by mail-pl1-x62a.google.com with SMTP id a9so8389789pld.7;
 Mon, 19 Dec 2022 01:09:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YUXoDTd5mrLgYAevT7iW/zTe8SIIIPc/wtlTUB5CjuQ=;
 b=DsFzs6KG9aVQN4CaaxTRqJuhAdVqRH4kLU3bIqtpvTL26PNlIL4/TeLI7H5YhfF1/R
 5cjY6uFhJHD/Qtc9WQ3Jw+r5+zYw9n6pktuTA7jOtRZ35yWiF4g5kGWWrVRPLHOIdhbT
 mtkJLtfQ2QJ6gz0bf0GkN85FA+Olbkcx//VrhYb3M7yCbx9bT2FOOPYiveFisQaPOs3a
 x52QsVS3ReQCvWe2w6KON080PvQhWABxW4fxssdkqbG39LXCn0tDStbTPBqak//vxaa6
 h3h5ETPQDZT7ycVemd2uhyjSkHfuLzE5uKEyc2do7BVXOGnEcKhlfzGjBU4CEPAIqtkZ
 XZrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YUXoDTd5mrLgYAevT7iW/zTe8SIIIPc/wtlTUB5CjuQ=;
 b=xdSajInrtIKDMUVagviVJDxsY3KBXQ70YZxTmIW5pt4y7/UEqmJu5kILNBQ5SRIfdQ
 QHttNlou5F3cfPu/ALFOc88A1DVxlRxYl5kHlZcgpmB8XiRqd/MkYITYtXdqJEXNcm6O
 LLYtDeMvyYRMgVX8RIgHdddJ4SGeRrpFRToZBendosUMSZkY8nc0W3uy1JU6A1jpQJYp
 +jiGvWnV6et5X9vpf9zxMsZ3RgI72iIYZyRac0w3f8xc2quHtnkYdfqZ4wHa5BRMq+8g
 WUE/CteHv8vLdR86HmWSVJTCavQIAV+j7yZ1Ya3en3DrZuQIKmhFyPkutnxZEKoi90uL
 1SFA==
X-Gm-Message-State: ANoB5pmKI4UJolxSiFu2IH9pdkBr9uiaL62KlPl1QzGAmpSp1zt020YZ
 lR0PqY+ROksrhpXzj3YOyUf3YFc/LhjskUST
X-Google-Smtp-Source: AA0mqf5jSz4RN4KnXFVnRDsdOdHoMG1Z0/eI3T3D5nosM0E7nUSfCPlOc77WOJwPUIfOwLM65RkAlA==
X-Received: by 2002:a17:90a:69c2:b0:219:3bd:c32e with SMTP id
 s60-20020a17090a69c200b0021903bdc32emr42692349pjj.49.1671440941745; 
 Mon, 19 Dec 2022 01:09:01 -0800 (PST)
Received: from fedlinux.. ([106.84.132.155]) by smtp.gmail.com with ESMTPSA id
 rj14-20020a17090b3e8e00b002187a4dd830sm8658487pjb.46.2022.12.19.01.08.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Dec 2022 01:09:01 -0800 (PST)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, hare@suse.de,
 Eric Blake <eblake@redhat.com>, dmitry.fomichev@wdc.com,
 Hanna Reitz <hreitz@redhat.com>, damien.lemoal@opensource.wdc.com,
 stefanha@redhat.com, Markus Armbruster <armbru@redhat.com>,
 Sam Li <faithilikerun@gmail.com>
Subject: [RFC 0/2] Add full zoned storage emulation support
Date: Mon, 19 Dec 2022 17:08:38 +0800
Message-Id: <20221219090840.20388-1-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.38.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=faithilikerun@gmail.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

This patch series serve as a supplement to previous zoned emulation support.
It introduces a new format driver - zoned driver to enable full emulation of
a block device file for a zoned block device on the host.

Each zone of a zoned device makes state transitions following the zone state
machine. The zone state machine mainly describes five states, IMPLICIT OPEN,
EXPLICIT OPEN, FULL, EMPTY and CLOSED. READ ONLY and OFFLINE states will
generally be affected by device internal events. Different operations on zones
cause corresponding state changing, which can be found more on the chart of
following link.
https://zonedstorage.io/docs/introduction/zoned-storage#zone-states-and-state-transitions

Zoned devices have a limit on zone resources, which puts constraints on write
operations into zones.

Sam Li (2):
  block: add configs for the zoned format driver
  block: introduce the zoned format driver

 block/meson.build                |   1 +
 block/zoned.c                    | 935 +++++++++++++++++++++++++++++++
 include/block/block_int-common.h |   7 +
 qapi/block-core.json             |  44 +-
 4 files changed, 984 insertions(+), 3 deletions(-)
 create mode 100644 block/zoned.c

-- 
2.38.1


