Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1B5415367
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 00:26:25 +0200 (CEST)
Received: from localhost ([::1]:39976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTAh4-0000SM-QO
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 18:26:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1mTAf3-0007QZ-8X
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 18:24:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1mTAez-0000cx-4E
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 18:24:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632349450;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=QU6dUvXnXyNAoj9/TqdyKsPw6HkS3kIBNIo3PTQO9J0=;
 b=UrxQ7hTtfSh+TqrZmnQS8p/j0mpILeC7oEDLtFsRag2FtEKT8AozkE6VFSAvn3EefHup4a
 +0ELPYTeHthV+1iat1D/RMxR9P360nH2IHDXvR+7kJBP04RxiUMrUkvO/Hd27QkZ3Bwej9
 DDQlkflQluvhZMRVSSPY3Bct3H2DUK8=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-pOz32r4SMsCaA1jVCFeDtQ-1; Wed, 22 Sep 2021 18:24:09 -0400
X-MC-Unique: pOz32r4SMsCaA1jVCFeDtQ-1
Received: by mail-qv1-f72.google.com with SMTP id
 z8-20020a056214040800b00380dea65c01so15383077qvx.4
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 15:24:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QU6dUvXnXyNAoj9/TqdyKsPw6HkS3kIBNIo3PTQO9J0=;
 b=vUtcEZeW0nwiYIp4n1zwyJOomT8ok/6uFiuGz8NvhlEO1WAU4o9YH6ZxNgWyo2/YwF
 Llic6Rf64PEQ9fxsa1/zwH9vbaNL75AdXf7XIuyXqECKeITD7+ttS4wF8RpI2L5O4a6w
 RyAMUdGqkPEYsAFHgEH7wp2uM/q4WwAlogIDB8sc5cK8Xq9w0SL2lNw08PXKSmcFTe+x
 AAXXVnJzEzWJVfE9NkzxArTULe5gjoEv1oY1Oho+/dLO2RTzVSyR4Q/QKQ+SIaiQKCTY
 mRC4mg98EMcHNyPJh4QicEOWe+2BjurcMSUHAXwSG9G7NWPprH9zId45OgczWzKnem9E
 AiYA==
X-Gm-Message-State: AOAM532zHIt3hg2GqLeLaVinMHFBOqveIb6vjIRDbm9aCumlC/qSJi9v
 9rJgg0tcucAax/eS5hniBGI7gjMUmpqd+v9hQo5dDX3Fy7ITna4FGZT+gFZZbGzO10xuhDjqV1F
 4pzIDPfjLv3p7Io0=
X-Received: by 2002:ac8:6b43:: with SMTP id x3mr1780476qts.190.1632349448047; 
 Wed, 22 Sep 2021 15:24:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw4resFXrKaczz7vedq7uAVX5XPZ7I6CaGXmZKXREwU4diWYUB2jmeRzmCICDerFYs8x/CMNw==
X-Received: by 2002:ac8:6b43:: with SMTP id x3mr1780457qts.190.1632349447886; 
 Wed, 22 Sep 2021 15:24:07 -0700 (PDT)
Received: from LeoBras.redhat.com ([2804:431:c7f0:e5d7:bbae:108a:d2ca:1c18])
 by smtp.gmail.com with ESMTPSA id 9sm2948633qkc.52.2021.09.22.15.24.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Sep 2021 15:24:07 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Xu <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>
Subject: [PATCH v3 0/3] QIOChannel async_write & async_flush + MSG_ZEROCOPY +
 multifd
Date: Wed, 22 Sep 2021 19:24:20 -0300
Message-Id: <20210922222423.644444-1-leobras@redhat.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=leobras@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=leobras@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Leonardo Bras <leobras@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch series intends to enable MSG_ZEROCOPY in QIOChannel, and make
use of it for multifd migration performance improvement.

Patch #1 creates new callbacks for QIOChannel, allowing the implementation
of asynchronous writing.

Patch #2 implements async_write and async_flush on QIOChannelSocket,

Patch #3 Makes use of async_write + async_flush to enable MSG_ZEROCOPY
for migration using multifd nocomp.

Results:
So far, the resource usage of __sys_sendmsg() reduced 15 times, and the
overall migration took 13-18% less time, based in synthetic workload.

The objective is to reduce migration time in hosts with heavy cpu usage.

---
Changes since v2:
- Patch #1: One more fallback
- Patch #2: Fall back to sync if fails to lock buffer memory in MSG_ZEROCOPY send.

Changes since v1:
- Reimplemented the patchset using async_write + async_flush approach.
- Implemented a flush to be able to tell whenever all data was written.

Leonardo Bras (3):
  QIOChannel: Add io_async_writev & io_async_flush callbacks
  QIOChannelSocket: Implement io_async_write & io_async_flush
  multifd: Send using asynchronous write on nocomp to send RAM pages.

 include/io/channel-socket.h |   2 +
 include/io/channel.h        |  94 ++++++++++++++++---
 io/channel-socket.c         | 176 ++++++++++++++++++++++++++++++++++--
 io/channel.c                |  66 +++++++++++---
 migration/multifd.c         |   3 +-
 5 files changed, 300 insertions(+), 41 deletions(-)

-- 
2.33.0


