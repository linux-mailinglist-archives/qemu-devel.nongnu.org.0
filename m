Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 628053FC5CA
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 13:05:28 +0200 (CEST)
Received: from localhost ([::1]:35398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL1a3-0001BE-8B
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 07:05:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1mL1Xc-0007Yv-3T
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 07:02:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1mL1XZ-0005yA-OV
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 07:02:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630407772;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=bwYIVAjwCGLQKbtVQCCFSi3jI5oXekweU87cr9L4CPE=;
 b=NR+aWVl7W4+EOD16Ktzm+V6/3t5ZWwqfvb/OVZp54T8qKKPuaOv96+3QkjmU1cwOld49Fw
 R/M4Xs1CIr8LEauEgtQt9AbFpmVzieaqqXsaoiq/k89p7GsAK2x+GBvgUmvu4IAt5qPHhZ
 yCz+StiLZ+r+oN1MmqV6rRlNxjZTzWk=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-351-eQc0knjDMuqiH6O4fykifw-1; Tue, 31 Aug 2021 07:02:50 -0400
X-MC-Unique: eQc0knjDMuqiH6O4fykifw-1
Received: by mail-qk1-f200.google.com with SMTP id
 u19-20020a05620a121300b0042665527c3bso1122763qkj.14
 for <qemu-devel@nongnu.org>; Tue, 31 Aug 2021 04:02:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bwYIVAjwCGLQKbtVQCCFSi3jI5oXekweU87cr9L4CPE=;
 b=ce3hXeY6jszAxUdkHy7WTT7XkWQpjAy3xgClgxe79JJaJ0G2L6iECQgqXbfQCtg3r0
 mY+m2u7u2JjD0HTQGe38uSGdxOEMyFgilM+tDDRcEVjv/SYrt6SQ4SwkFLZxUIWamCVi
 BxjAZiNDmBCwCngf/k7jIH82mJ/rc3zvM7UXLNnGcxWzylIwcd66pqHZipoGpTcURrFC
 aeEg20yukfrecqliDwHfd+8zMe05FgKZTJoSzr6dcG8okm9z13Ji6ITie+zPAqm7LlJC
 s1Wwa5Ys+yM2Ijt7N3LJG9oq7BSVLnvzgYMhN3atGeejXjZNWBH2WmCdtuK4JxJaUoDS
 n4Yw==
X-Gm-Message-State: AOAM530aW+keE8mvCITu9HhmfVb6aOjjmmL/b6NsKpNlvmEnDgKIUJqD
 Oge1kKHB/Xy1Vwx5oGAWEIKikxxcuSa+J5kHcqiHaZBVsP/zHhfamMV/sJE/YRSkCwV7wnP/Pw+
 +2XryD3Y4WJ7seOc=
X-Received: by 2002:a0c:ac48:: with SMTP id m8mr21980971qvb.28.1630407770329; 
 Tue, 31 Aug 2021 04:02:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyMPOMQ9x5A/NdCWkggMuVVXVAFbwewNnBIzhqjlPQBxs0sVL1dQZScNZ5L46CgYJdvQYy2QQ==
X-Received: by 2002:a0c:ac48:: with SMTP id m8mr21980961qvb.28.1630407770195; 
 Tue, 31 Aug 2021 04:02:50 -0700 (PDT)
Received: from LeoBras.redhat.com ([2804:431:c7f1:e948:8e69:9cd6:5512:12f4])
 by smtp.gmail.com with ESMTPSA id b25sm13315536qka.23.2021.08.31.04.02.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Aug 2021 04:02:49 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Fam Zheng <fam@euphon.net>,
 Peter Xu <peterx@redhat.com>
Subject: [PATCH v1 0/3] QIOChannel flags + multifd zerocopy
Date: Tue, 31 Aug 2021 08:02:36 -0300
Message-Id: <20210831110238.299458-1-leobras@redhat.com>
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
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.391, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Leonardo Bras <leobras@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch series intends to enable MSG_ZEROCOPY in QIOChannel, and make
use of it for multifd migration performance improvement.

Patch #1 enables the use of flags on qio_channel_write*(), allowing
more flexibility in using the channel. 
It was designed for MSG_ZEROCOPY usage, in which it's a good idea
having a eassy way to choose what packets are sent with the flag, but
also makes it more flexible for future usage.

Patch #2 just adds the MSG_ZEROCOPY feature, and defines the enablement
mechanics, while not enabling it in any code.

Patch #3 enables MSG_ZEROCOPY for migration / multifd.


Results:
So far, the resource usage of __sys_sendmsg() reduced 15 times, and the
overall migration took 13-18% less time, based in synthetic workload.

The objective is to reduce migration time in hosts with heavy cpu usage.

Leonardo Bras (3):
  io: Enable write flags for QIOChannel
  io: Add zerocopy and errqueue
  migration: multifd: Enable zerocopy

 chardev/char-io.c                   |  2 +-
 hw/remote/mpqemu-link.c             |  2 +-
 include/io/channel-socket.h         |  2 +
 include/io/channel.h                | 85 +++++++++++++++++++++++------
 io/channel-buffer.c                 |  1 +
 io/channel-command.c                |  1 +
 io/channel-file.c                   |  1 +
 io/channel-socket.c                 | 80 ++++++++++++++++++++++++++-
 io/channel-tls.c                    | 12 ++++
 io/channel-websock.c                | 10 ++++
 io/channel.c                        | 64 +++++++++++++---------
 migration/multifd-zlib.c            |  7 ++-
 migration/multifd-zstd.c            |  7 ++-
 migration/multifd.c                 |  9 ++-
 migration/multifd.h                 |  3 +-
 migration/rdma.c                    |  1 +
 scsi/pr-manager-helper.c            |  2 +-
 tests/unit/test-io-channel-socket.c |  1 +
 18 files changed, 235 insertions(+), 55 deletions(-)

-- 
2.33.0


