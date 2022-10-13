Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9674B5FD96E
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 14:44:59 +0200 (CEST)
Received: from localhost ([::1]:57306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oixa6-0008W8-Ji
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 08:44:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oixSt-0001Ug-Fn
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 08:37:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42410)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oixSp-000403-Hq
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 08:37:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665664637;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=MnFglijVdVUei1H8yyNMxeF85agUnru0AVwLKFJqDqQ=;
 b=IddRuyYfy8isb27wM2MJtXB5quNVPPRMcaNkn9GD7/nFAHRJskWCwqyJa3aZMw71zUD8mo
 ubYq5yiyLNPu89fu921nwPHcWEuw+w6w1NRSeC7P+Mmv/IJOGs0UvTGCR199lnlljK12pB
 wWrmS0AFH5QrOAJoersA6EE4AP6Q3hY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-479-gzS1XZgfPkySQ7QwGN2zHw-1; Thu, 13 Oct 2022 08:37:16 -0400
X-MC-Unique: gzS1XZgfPkySQ7QwGN2zHw-1
Received: by mail-ed1-f72.google.com with SMTP id
 z11-20020a056402274b00b0045ca9510fc8so1410996edd.23
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 05:37:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MnFglijVdVUei1H8yyNMxeF85agUnru0AVwLKFJqDqQ=;
 b=D20+j8I5zKkL9rGUU58R6f97knbifGyviN4cYB275/vJnsWNjO4hTPpkLxs/H4911C
 76xR5uLw3BSIG8tp1WPz4cXPOhF7/fiudX90eJ+1I3b8ij9ZsQLAPq13yLcuU/m6FRQp
 RsuFMhQxI9xIk9Xo9l15P8hOj7UA6m9KapYMF4RbcqIgcz3SwBMNSV9+SqQ704eIr/U7
 kPHGN/CChRaM6yddVgPxLfeFyW2JU74Dl7j8N6PIN5+pMTI7mrH/45ggdS8A5vIt+FDh
 jz6L5P0uxrtdlSYcB+R0Dzr+6e7qcAW407mUiGrLOhg6qT9bvYqzmRi2EkiR/SyvBUV7
 P94A==
X-Gm-Message-State: ACrzQf2NoXYOJWWhQaKxknCYwOKVPglvSz24spVszcz3n5MUFgJeJhXF
 r+s6otfOxISQITZBuRVa4/ZtmPy+79aL8BaCvjCfcp9i3HHsBRQmYCy6W1+nNTsVCG1IfQ7n7O+
 hEsa05QmRI3cXYk/RyrepteQe5g2rv7pxYVx+ASiNlst1CVxlHeNq+JqgC6dVyDtnISw=
X-Received: by 2002:a05:6402:368:b0:458:9b5e:fd35 with SMTP id
 s8-20020a056402036800b004589b5efd35mr2492957edw.141.1665664634623; 
 Thu, 13 Oct 2022 05:37:14 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4Mwe+Wn0LBL+tTJ7nTzdLh6ZTElDtkUM1tYe1nXWPChzivHoasCTnRkETmmAS17/hY/Wewhg==
X-Received: by 2002:a05:6402:368:b0:458:9b5e:fd35 with SMTP id
 s8-20020a056402036800b004589b5efd35mr2492934edw.141.1665664634318; 
 Thu, 13 Oct 2022 05:37:14 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 bx24-20020a170906a1d800b0077a201f6d1esm2970186ejb.87.2022.10.13.05.37.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 05:37:13 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
	afaria@redhat.com
Subject: [PATCH 00/24] More coroutine_fn fixes
Date: Thu, 13 Oct 2022 14:36:47 +0200
Message-Id: <20221013123711.620631-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Most of these were extracted from Alberto's static analysis series.
After this series, the only errors reported by the analyzer are:

- a call to bs->drv->bdrv_co_drain_begin from bdrv_open_driver.  This
  relies on bdrv_co_drain_begin not having to yield, which is indeed the
  case right after opening but is iffy

- assigning coroutine_fn to non-coroutine_fn in the human monitor
  for the two coroutine commands screendump and block_resize.

Paolo

Alberto Faria (20):
  backup: remove incorrect coroutine_fn annotation
  block: remove incorrect coroutine_fn annotation
  monitor: add missing coroutine_fn annotation
  ssh: add missing coroutine_fn annotation
  block: add missing coroutine_fn annotation to prototypes
  coroutine-lock: add missing coroutine_fn annotation to prototypes
  coroutine-io: add missing coroutine_fn annotation to prototypes
  block: add missing coroutine_fn annotation to BlockDriverState
    callbacks
  qcow2: add coroutine_fn annotation for indirect-called functions
  commit: switch to *_co_* functions
  block: switch to *_co_* functions
  mirror: switch to *_co_* functions
  parallels: switch to *_co_* functions
  qcow: switch to *_co_* functions
  qcow2: switch to *_co_* functions
  qed: switch to *_co_* functions
  vdi: switch to *_co_* functions
  vhdx: switch to *_co_* functions
  vmdk: switch to *_co_* functions
  monitor: switch to *_co_* functions

Paolo Bonzini (4):
  blkdebug: add missing coroutine_fn annotation for indirect-called
    functions
  qcow: manually add more coroutine_fn annotations
  qcow2: manually add more coroutine_fn annotations
  vmdk: manually add more coroutine_fn annotations

 block.c                          |  2 +-
 block/backup.c                   |  2 +-
 block/blkdebug.c                 |  2 +-
 block/commit.c                   |  2 +-
 block/io.c                       |  8 +--
 block/mirror.c                   |  4 +-
 block/monitor/block-hmp-cmds.c   |  2 +-
 block/parallels.c                | 28 +++++-----
 block/qcow.c                     | 56 ++++++++++----------
 block/qcow2-bitmap.c             |  4 +-
 block/qcow2-cluster.c            | 26 ++++-----
 block/qcow2-refcount.c           | 18 +++----
 block/qcow2-snapshot.c           |  6 +--
 block/qcow2.c                    | 32 ++++++------
 block/qcow2.h                    | 32 ++++++------
 block/qed-table.c                |  2 +-
 block/qed.c                      | 12 ++---
 block/ssh.c                      |  6 +--
 block/vdi.c                      | 17 +++---
 block/vhdx.c                     |  8 +--
 block/vmdk.c                     | 90 ++++++++++++++++----------------
 blockdev.c                       |  2 +-
 include/block/block-hmp-cmds.h   |  2 +-
 include/block/block-io.h         |  5 +-
 include/block/block_int-common.h | 12 ++---
 include/monitor/hmp.h            |  3 +-
 include/qemu/coroutine.h         | 18 ++++---
 27 files changed, 202 insertions(+), 199 deletions(-)

-- 
2.37.3


