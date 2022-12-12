Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE1A64A0E5
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 14:32:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4igd-0006bv-Mq; Mon, 12 Dec 2022 08:17:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p4igB-0006UJ-P8
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 08:17:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p4ig7-0004HA-IU
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 08:17:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670851026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=htf5nVEve2PXFrR4GWdn1LXbbNm9+3Lwxmj8z29C6to=;
 b=a21WmpSyXzQ8w7lgCwbG+4cKH0DXsnro1rN6n1gmXov5cbiw8eXeTt0lQo9MkyTtYvOVgl
 0CkUz5p6XdgJJeVncFgEMW7G6WFWGm5PD91PAftGuGYK0NcOz298LRY9znZVL/ZFLZbTiw
 02+aHNZfLqEmEu0xVMFLp0R3rNt8Yes=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-674-NuxIYxSOPxm7XwjaznXJgw-1; Mon, 12 Dec 2022 08:17:05 -0500
X-MC-Unique: NuxIYxSOPxm7XwjaznXJgw-1
Received: by mail-wm1-f69.google.com with SMTP id
 i132-20020a1c3b8a000000b003d0f49bc21bso4158581wma.6
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 05:17:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=htf5nVEve2PXFrR4GWdn1LXbbNm9+3Lwxmj8z29C6to=;
 b=0I2Nzsw6HDeZcqePT94Vy7A5/7VzSbv/jxueLfHmvZwISqvg9aU0RQjbizkCr05ct/
 5VrFsnAdGmtzCEuutBQCGgPeNAK/kzegRylfCsbAS0cC/YhQMsxKMC0kBpmJvl4u/XEo
 1EiPumYuzHmvo4qanDnCG4ofCW2zPlsnAkXR9A3Qin7ZVbocriaX/N11Wd2b1ahPkSxr
 UC0G7c3bX3PQLgdT7ORAIZo4LiGpitAdh/GXCrnzfGjhXmYO5SLwVEQJ1tiqk8JoXF8s
 qtVD+YAJcuClqEgbgBHj9PLs6YGtWWatEInwowOORVX4TA9hS5ZBZ1Yj4esQj3vf5uTp
 wvGA==
X-Gm-Message-State: ANoB5pm3Hf8Cy5YV6pWTm8l4QY9K0Qlb1lkZccuVGCxhnMeiLC4OqZp0
 CPteF5bayDMH2RCnJUvHPctetYR7Pe8/3bENo0Y730jxyDn3v7EIQ6oxcvwtdsaiLbqqApsImsz
 wF7Os1ddXM+S3TAAox+e2zpTCazSgXMU86zCZE+jCsvF/XzB9JoW7Ad3yt0lPdHYh+Fk=
X-Received: by 2002:a5d:4090:0:b0:24d:5829:4e59 with SMTP id
 o16-20020a5d4090000000b0024d58294e59mr5559303wrp.58.1670851024018; 
 Mon, 12 Dec 2022 05:17:04 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6sADQW9Cq5eEFfFMxqa7FoZ5ENheW5+Hvu14AUMxRHx3dZGs5x0Bbx5a79qStK+9qBqCe7Eg==
X-Received: by 2002:a5d:4090:0:b0:24d:5829:4e59 with SMTP id
 o16-20020a5d4090000000b0024d58294e59mr5559283wrp.58.1670851023686; 
 Mon, 12 Dec 2022 05:17:03 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 y11-20020adff14b000000b002365b759b65sm8847719wro.86.2022.12.12.05.17.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Dec 2022 05:17:03 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
	kwolf@redhat.com
Subject: [PATCH 0/3] block: remove separate bdrv_file_open callback
Date: Mon, 12 Dec 2022 14:16:57 +0100
Message-Id: <20221212131700.250209-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

The presence of the bdrv_file_open callback is used in some parts of the
code to distinguish protocol and format drivers.  Use the existing
.protocol_name field instead, and unify .bdrv_open with .bdrv_file_open.

Paolo

Paolo Bonzini (3):
  block: apply assertion more widely
  block: do not check bdrv_file_open
  block: remove separate bdrv_file_open callback

 block.c                          | 17 +++++++----------
 block/blkdebug.c                 |  2 +-
 block/blkio.c                    |  2 +-
 block/blkverify.c                |  2 +-
 block/curl.c                     |  8 ++++----
 block/file-posix.c               |  8 ++++----
 block/file-win32.c               |  4 ++--
 block/gluster.c                  |  8 ++++----
 block/iscsi.c                    |  4 ++--
 block/nbd.c                      |  6 +++---
 block/nfs.c                      |  2 +-
 block/null.c                     |  4 ++--
 block/nvme.c                     |  2 +-
 block/rbd.c                      |  3 ++-
 block/ssh.c                      |  2 +-
 block/vvfat.c                    |  2 +-
 include/block/block_int-common.h |  3 ---
 17 files changed, 37 insertions(+), 42 deletions(-)

-- 
2.38.1


