Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E994414112
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 07:08:04 +0200 (CEST)
Received: from localhost ([::1]:42476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSuUE-0007eU-R0
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 01:08:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1mSuPm-0001yf-Bn
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 01:03:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57250)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1mSuPi-0004v4-HG
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 01:03:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632287000;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=TG1pdPDNk3CVlUpfWwFFCcSEwIHKL1ktxT7Q8juMo1U=;
 b=AyKNmhcI0vhdpQLv/+K4TwZpU4OfGVEDlAcASfVg8INU92sc+wSIEq1OoUd3XyaUXAoKst
 +3CByfDySGM8gkLyaRkRjCDdYLPBHJWcpe3UB336ZH+MCbZJi9RH466Mar4NOTOXvEPGeI
 9/T5p+1FbQX4a/lipKCb0LG4bcxJl5w=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-XOD2DqRpP2a3G4ef3fQ1WQ-1; Wed, 22 Sep 2021 01:03:19 -0400
X-MC-Unique: XOD2DqRpP2a3G4ef3fQ1WQ-1
Received: by mail-qv1-f69.google.com with SMTP id
 j4-20020ad454c4000000b0037a900dda7aso9156776qvx.14
 for <qemu-devel@nongnu.org>; Tue, 21 Sep 2021 22:03:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TG1pdPDNk3CVlUpfWwFFCcSEwIHKL1ktxT7Q8juMo1U=;
 b=vAqC17b1G6/gd+Vh10dnjGv2mdRnkhUJuMEpoE3eViqTWPP7P0qztmUWYj/zFDvDet
 GYlrhS9WlGJ3z8Rhn0uRz0uNk6sgI+knTegBdBpcsgmjT3OSJBVFGDZb9j3ZI3ywVT67
 /hzdzBw49eyy0FN+X+HjS1b3jRyJy7z//Q73eRG+euLLaFYTgq9FxWkvwHqP8Zi/Kcrr
 pPSDhbjw633LJ+VZk11eWaF/Cu6QDNqCEmOLOZ6E78rm9uQSqugMmmC/2fIPlF4dFOyR
 xSVvVl/1vbEsDKm+Uoo9sqqXM694/OBiZPlzf+4Sxw2JLiCYBCwgjXdkbVoDdLM6YH1T
 753Q==
X-Gm-Message-State: AOAM533O8m5jqEue3NliVOKAfzI0lyV+qqNpD4v2FfYryDtjppV8fgkT
 ZtQPJkbBMeB2GeWJ9efZIubA7FZckRa+6hE5I7evcOlSy73yvMZobvoTwo3n6xofz/HqnygO6K4
 A3PoC9PtMxQM9Y80=
X-Received: by 2002:ad4:5591:: with SMTP id e17mr35039114qvx.50.1632286999401; 
 Tue, 21 Sep 2021 22:03:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyASq8ocPMoPFgjrmBxd4lfVy+6f5Z7cwJWW7gIBNs5tAiyIsh3SFf//ZC5X4gjJrS1Romu2A==
X-Received: by 2002:ad4:5591:: with SMTP id e17mr35039100qvx.50.1632286999216; 
 Tue, 21 Sep 2021 22:03:19 -0700 (PDT)
Received: from LeoBras.redhat.com ([2804:431:c7f0:e5d7:bbae:108a:d2ca:1c18])
 by smtp.gmail.com with ESMTPSA id q192sm926675qka.93.2021.09.21.22.03.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 22:03:18 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Xu <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>
Subject: [PATCH v2 0/3] QIOChannel async_write & async_flush + MSG_ZEROCOPY +
 multifd
Date: Wed, 22 Sep 2021 02:03:37 -0300
Message-Id: <20210922050340.614781-1-leobras@redhat.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=leobras@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=leobras@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.475,
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
Changes since v1:
- Reimplemented the patchset using async_write + async_flush approach.
- Implemented a flush to be able to tell whenever all data was written.

Leonardo Bras (3):
  QIOCHannel: Add io_async_writev & io_async_flush callbacks
  QIOChannelSocket: Implement io_async_write & io_async_flush
  multifd: Send using asynchronous write on nocomp to send RAM pages.

 include/io/channel-socket.h |   2 +
 include/io/channel.h        |  93 +++++++++++++++++++----
 io/channel-socket.c         | 145 ++++++++++++++++++++++++++++++++++--
 io/channel.c                |  66 ++++++++++++----
 migration/multifd.c         |   3 +-
 5 files changed, 271 insertions(+), 38 deletions(-)

-- 
2.33.0


