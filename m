Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A0B24C3E3
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Aug 2020 19:00:18 +0200 (CEST)
Received: from localhost ([::1]:47842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k8nvF-0003qn-R1
	for lists+qemu-devel@lfdr.de; Thu, 20 Aug 2020 13:00:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1k8nu9-0002XL-GI
 for qemu-devel@nongnu.org; Thu, 20 Aug 2020 12:59:09 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:30363
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1k8nu7-00069Y-Td
 for qemu-devel@nongnu.org; Thu, 20 Aug 2020 12:59:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597942747;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=1+dFywjWaGOWvaSQvP1gcHnvaKLxS9ou4ShxZ/mKU1Q=;
 b=elQwS9phB4u8shEbph0Qs48VgbxuaN6I9FTMAfxSy52A2tKTkpYzP9PeNRoCDpWnfAs7Db
 3LRZUsEiVDqGkZkQsRZn1mfKqFh0FSnae3sKfQYDcGhK2IajOfIcwiYhZC1uvasX46vPsg
 uPUo5Wcagezp4Vv9niAkmTzU0Ogik2s=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-77-OMAy5l3nMy-c8_3ySwEUjQ-1; Thu, 20 Aug 2020 12:59:05 -0400
X-MC-Unique: OMAy5l3nMy-c8_3ySwEUjQ-1
Received: by mail-wm1-f70.google.com with SMTP id a82so693921wmh.5
 for <qemu-devel@nongnu.org>; Thu, 20 Aug 2020 09:59:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1+dFywjWaGOWvaSQvP1gcHnvaKLxS9ou4ShxZ/mKU1Q=;
 b=YABtvj/h3rOG+ALnzsR67zWbTHJUPCMd8bb3UmP2c3yYw8ulo7BHlFlaBrE/VwRwbT
 PU67OdBx02ptO+GeL/O5FaOhpboXa0oC7sobmgYH1vnsfNenKNw4x0tzhbKdgBcF0JA/
 4YgUKTuxLJmW9gFKZpTq+Kr2Xj8oC69EG8yNI1FkxIEO4B4tZEDHvM0Z/SkOm+L3xCpO
 qPmk3rrR68f29f8WcAbp+DoRT8zhFuCDY5vXfFSXlVkRHY/5CTJEw45OTl36wQIBCAyY
 LWZc6n1RsO1VMZAoPcS+lamFFz7RaXxsEeSEvCrxy80fhKsJxBdzCRe2iqPQoH7Bb3DF
 ypBw==
X-Gm-Message-State: AOAM53317NVWZr9MR+cpgOXHEZQ7PBpqG+EAPquW8JanapZNsZuBhmeq
 3ZnkxzWmFtbrJNzQH7VZWi3KQSF0D8cClXtIzq/UZxG5rrmyJTGA4m3YQpq0jUM5fBC5Oia/J9n
 G3RqCn6yeOP/v6hI=
X-Received: by 2002:adf:dfcf:: with SMTP id q15mr4214339wrn.345.1597942744052; 
 Thu, 20 Aug 2020 09:59:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyTVd8fvlamgEsclrxuddFythBgvgbWGbXJy9Pej1ZInT3/+QUiedTwnKroDGFc7OmqGkaMmA==
X-Received: by 2002:adf:dfcf:: with SMTP id q15mr4214315wrn.345.1597942743819; 
 Thu, 20 Aug 2020 09:59:03 -0700 (PDT)
Received: from x1w.redhat.com (121.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.121])
 by smtp.gmail.com with ESMTPSA id t3sm5163586wrx.5.2020.08.20.09.59.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2020 09:59:03 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 00/15] block/nvme: Various cleanups required to use
 multiple queues
Date: Thu, 20 Aug 2020 18:58:46 +0200
Message-Id: <20200820165901.1139109-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/20 08:28:03
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Kevin,

This series is mostly code rearrangement (cleanups) to be
able to split the hardware code from the block driver code,
to be able to use multiple queues on the same hardware, or
multiple block drivers on the same hardware.

All this series is reviewed.

Since v4:
- added 'block/nvme: Use an array of EventNotifier' patch

Since v3:
- renamed QUEUE_INDEX_{ADMIN/IO} -> INDEX{ADMIN/IO}
- added stefanha tags

Since v2:
- addressed stefanha review comments
- added 4 trivial patches (to simplify the last one)
- register IRQ notifier for each queuepair (admin and io)

Since v1:
- rebased
- use SCALE_MS definition
- added Stefan's R-b
- addressed Stefan's review comments
  - use union { NvmeIdCtrl / NvmeIdNs }
  - move irq_notifier to NVMeQueuePair
  - removed patches depending on "a tracable hardware stateo
    object instead of BDRVNVMeState".

Phil.

Philippe Mathieu-Daudé (15):
  block/nvme: Replace magic value by SCALE_MS definition
  block/nvme: Avoid further processing if trace event not enabled
  block/nvme: Let nvme_create_queue_pair() fail gracefully
  block/nvme: Define INDEX macros to ease code review
  block/nvme: Improve error message when IO queue creation failed
  block/nvme: Use common error path in nvme_add_io_queue()
  block/nvme: Rename local variable
  block/nvme: Use union of NvmeIdCtrl / NvmeIdNs structures
  block/nvme: Replace qemu_try_blockalign0 by qemu_try_blockalign/memset
  block/nvme: Replace qemu_try_blockalign(bs) by
    qemu_try_memalign(pg_sz)
  block/nvme: Simplify nvme_init_queue() arguments
  block/nvme: Replace BDRV_POLL_WHILE by AIO_WAIT_WHILE
  block/nvme: Simplify nvme_create_queue_pair() arguments
  block/nvme: Extract nvme_poll_queue()
  block/nvme: Use an array of EventNotifier

 block/nvme.c | 211 ++++++++++++++++++++++++++++++---------------------
 1 file changed, 125 insertions(+), 86 deletions(-)

-- 
2.26.2


