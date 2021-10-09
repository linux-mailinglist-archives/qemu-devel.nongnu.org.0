Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD524277FD
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Oct 2021 09:58:34 +0200 (CEST)
Received: from localhost ([::1]:45926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZ7FX-0007sN-BP
	for lists+qemu-devel@lfdr.de; Sat, 09 Oct 2021 03:58:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1mZ7Do-0005bl-Cv
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 03:56:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1mZ7Dj-0002XG-Tm
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 03:56:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633766196;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=k6SVz67nk/cejPij2pldNG+fASrRRP89ZLCtwxSsEns=;
 b=djcwYmSupWL0Ei55jRsRoXp2TTABoFPgJvQ6jL3NZMWO9xladbOkjsIWMW7kHMUCkFJoOd
 k5M66qx1O1UndhVK3SqlfwaTTvIfwa7+kxSsqTfyA6aObkRxFUH1PpXCPAoaROR6mcak1N
 mpTr3/o5jFrtxya2/pAtz5ldk7MgeQM=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-VOV5kPN4PqiVhhvu5Jfkng-1; Sat, 09 Oct 2021 03:56:35 -0400
X-MC-Unique: VOV5kPN4PqiVhhvu5Jfkng-1
Received: by mail-ed1-f69.google.com with SMTP id
 u24-20020aa7db98000000b003db57b1688aso5896445edt.6
 for <qemu-devel@nongnu.org>; Sat, 09 Oct 2021 00:56:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k6SVz67nk/cejPij2pldNG+fASrRRP89ZLCtwxSsEns=;
 b=k4OCMQR1bFXO9vKc3ZKsKyBMRW8i0L4IIw2DxCd2XAtviRJY1DeYAnWLqmMdV6bXbI
 5UQbV+DK180x8XF8LC9vfoEOVpI2jvXChAYXCFFx3M5gp+HMGXBhY1RE7vVBWenP90X7
 VbWOOyF0GWTDz7tJjLahs0+ktwRdiDx9+Zx3sGHR7DuC/t05WssPgP4ImavyMvQ5cPCs
 tJtbKo8zLHFD6Mq2gvO0hLQiLUt0FylPL43UwHPXfUEsJFrr8dxzbKLqWqIZqJgHDsfj
 wuGm+dVO7gIEQdNdtdS3nHeh8HJhcHCuH3jCls7i5bJi8811qFhff/KCmj0nGCrPW2sC
 L1Jw==
X-Gm-Message-State: AOAM533qgNl4nitPdwai4PHPWTVGh1aNwwqAoRqWcnx7EpTC5yZASIlL
 dPBhrexbrphMDGKcft8yEIdSd3ZQi0oCJDPHRuTReInBp005ILEmwrI54fu4VkCMlbKk08YK7UY
 Cv/h1C8IsxP/DRCc=
X-Received: by 2002:a05:6402:354a:: with SMTP id
 f10mr18776110edd.365.1633766193906; 
 Sat, 09 Oct 2021 00:56:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyD+Dxova2iXA5CWFMIeSKwbykcdI9vT5hX/xIRxL0EDUiYjpn77vjnkorR0SbeSuyB7pfjLg==
X-Received: by 2002:a05:6402:354a:: with SMTP id
 f10mr18776084edd.365.1633766193714; 
 Sat, 09 Oct 2021 00:56:33 -0700 (PDT)
Received: from LeoBras.redhat.com ([2804:431:c7f0:5307:af36:9661:8efc:9b2c])
 by smtp.gmail.com with ESMTPSA id p23sm782059edw.94.2021.10.09.00.56.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Oct 2021 00:56:33 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Peter Xu <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>
Subject: [PATCH v4 0/3] MSG_ZEROCOPY for multifd
Date: Sat,  9 Oct 2021 04:56:10 -0300
Message-Id: <20211009075612.230283-1-leobras@redhat.com>
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
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.051,
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
of zerocopy writing.

Patch #2 implements writev_zerocopy and flush_zerocopy on QIOChannelSocket,
making use of MSG_ZEROCOPY on Linux.

Patch #3 Makes use of QIOChannelSocket zerocopy implementation on
nocomp multifd migration.

Results:
So far, the resource usage of __sys_sendmsg() reduced 15 times, and the
overall migration took 13-22% less time, based in synthetic workload.

The objective is to reduce migration time in hosts with heavy cpu usage.

---
Changes since v3:
- QIOChannel interface names changed from io_async_{writev,flush} to
  io_{writev,flush}_zerocopy
- Instead of falling back in case zerocopy is not implemented, return
  error and abort operation.
- Flush now waits as long as needed, or return error in case anything 
  goes wrong, aborting the operation.
- Zerocopy is now conditional in multifd, being set by parameter 
  multifd-zerocopy
- Moves zerocopy_flush to multifd_send_sync_main() from multifd_save_cleanup
  so migration can abort if flush goes wrong.
- Several other small improvements

Changes since v2:
- Patch #1: One more fallback
- Patch #2: Fall back to sync if fails to lock buffer memory in MSG_ZEROCOPY send.

Changes since v1:
- Reimplemented the patchset using async_write + async_flush approach.
- Implemented a flush to be able to tell whenever all data was written.

Leonardo Bras (3):
  QIOChannel: Add io_writev_zerocopy & io_flush_zerocopy callbacks
  QIOChannelSocket: Implement io_writev_zerocopy & io_flush_zerocopy for
    CONFIG_LINUX
  multifd: Implement zerocopy write in multifd migration
    (multifd-zerocopy)

 qapi/migration.json         |  18 ++++
 include/io/channel-socket.h |   2 +
 include/io/channel.h        | 104 +++++++++++++++++----
 migration/migration.h       |   1 +
 migration/multifd.h         |   2 +-
 io/channel-socket.c         | 180 ++++++++++++++++++++++++++++++++++--
 io/channel.c                |  74 +++++++++++----
 migration/migration.c       |  20 ++++
 migration/multifd.c         |  33 ++++++-
 migration/ram.c             |  20 ++--
 monitor/hmp-cmds.c          |   4 +
 11 files changed, 399 insertions(+), 59 deletions(-)

-- 
2.33.0


