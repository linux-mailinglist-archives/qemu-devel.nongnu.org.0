Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF39E60C2D4
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 06:52:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onBt8-0006NG-A3; Tue, 25 Oct 2022 00:50:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1onBt5-0006Gn-Pf
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 00:50:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1onBt4-0002v1-5j
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 00:50:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666673401;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=LdbGiaFnLHNYP5z7m6iIn4+qfKvhlC9cjY0Dizr/WQ0=;
 b=EWAH2vfodwnSjonQ/OexH3gH6iuOBGAa2O79NB8GRjgdCs1qkix6JwBCBcBpjTAjtduEVx
 7bUIHZPZTvZunYCvzIpeJWdReLAZbuqs3ssMLuDizeL68CGcztv93a4dPSYyv2OBVvZH/w
 29A0R7qDNN7MNWbklQ5OTNv65mCHzWw=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-189-B4BtUjPCMNyLli1mgfmUUw-1; Tue, 25 Oct 2022 00:47:50 -0400
X-MC-Unique: B4BtUjPCMNyLli1mgfmUUw-1
Received: by mail-qt1-f199.google.com with SMTP id
 u11-20020a05622a198b00b0039cca1826c8so8278355qtc.11
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 21:47:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LdbGiaFnLHNYP5z7m6iIn4+qfKvhlC9cjY0Dizr/WQ0=;
 b=Om/zFCZFCZbLwWWyB5pvreweaiY6r362XSUy9rCnqulLMTew/yefiMBNzz4Udm2hHj
 dFqWu4u49d6PC9sY08Ap7SGkUZ451YmLgVA0Ghd1mLJpgQSjx5nTmHeprOI26zifJr/u
 0Kyer+JRJ02wzL9JuWBfMTMSyFH4RlMMB4aLo9Zv7gJ8LD3qecJCvQRhiam157P5GfHx
 p7ke/+wUgrCKvJECgbWa6dPX+FA9ooigBqs894GQXUlPb10cswH7SdHf/FFEr7rsLWOd
 DPXFPpPI/9CaDY331BLyr3owCS7gX5PyOjI045P57pWGVwQDPPNVug7Wq3SnOVim1sUx
 v0QQ==
X-Gm-Message-State: ACrzQf2zhxBx3VKoQKVDyYcis6wGwsJ+F5PtYAXfM2Y7y07mkU1UnZe7
 tHzqdid8LgzZ3qAeQPffvB4YlRmpm1hvPY9HnEayBcARA6bZlQ90HLs2EgOZ9LOcNS7omr1/UNv
 nZeKNrKv5fiUlv94=
X-Received: by 2002:a05:620a:1991:b0:6ee:ea1a:7f93 with SMTP id
 bm17-20020a05620a199100b006eeea1a7f93mr24768513qkb.252.1666673269750; 
 Mon, 24 Oct 2022 21:47:49 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM47L7q56swQ9EmI3O6IznQm+hSDdt+ks25Pmc6dZDOCfLNu4w0qi66jjMKTQWY1FhK9MiQYxw==
X-Received: by 2002:a05:620a:1991:b0:6ee:ea1a:7f93 with SMTP id
 bm17-20020a05620a199100b006eeea1a7f93mr24768505qkb.252.1666673269509; 
 Mon, 24 Oct 2022 21:47:49 -0700 (PDT)
Received: from LeoBras.redhat.com ([2804:1b3:a801:de5e:6447:4a67:eb7c:b690])
 by smtp.gmail.com with ESMTPSA id
 d23-20020a05620a141700b006cbcdc6efedsm1350968qkj.41.2022.10.24.21.47.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 21:47:48 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Xu <peterx@redhat.com>
Cc: Leonardo Bras <leobras@redhat.com>,
	qemu-devel@nongnu.org
Subject: [RFC PATCH 0/4] MultiFD zero-copy improvements
Date: Tue, 25 Oct 2022 01:47:27 -0300
Message-Id: <20221025044730.319941-1-leobras@redhat.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=leobras@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.503,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

RFC for an improvement suggested by Juan during the KVM Forum and a few
optimizations I found in the way.

Patch #1 is just moving code to a helper, should have no impact.

Patch #2 is my implementation of Juan's suggestion. I implemented the
simplest way I thought on the array size: a fixed defined value.
I am not sure if this is fine, or if the array size should be either
informed by the user either via QMP or cmdline.
That's an important point I really need feedback on.

Patch #3: Improve the qio_channel_flush() interface to accept flush
waiting for some writes finished instead of all of them. This reduces
the waiting time, since most recent writes/sends will take more time to
finish, while the older ones are probably finished by the first recvmsg()
syscall return.

Patch #4 uses #3 in multifd zero-copy. It flushes the LRU half of the
header array, allowing more writes to happen while the most recent ones
are ongoing, instead of waiting for everything to finish before sending
more.

It all works fine in my tests, but maybe I missed some cornercase.
Please provide any feedback you find fit.

Thank you all!

Best regards,
Leo

Leonardo Bras (4):
  migration/multifd/zero-copy: Create helper function for flushing
  migration/multifd/zero-copy: Merge header & pages send in a single
    write
  QIOChannel: Add max_pending parameter to qio_channel_flush()
  migration/multifd/zero-copy: Flush only the LRU half of the header
    array

 include/io/channel.h |  7 +++-
 migration/multifd.h  |  5 ++-
 io/channel-socket.c  |  5 ++-
 io/channel.c         |  5 ++-
 migration/multifd.c  | 88 ++++++++++++++++++++++++++------------------
 5 files changed, 68 insertions(+), 42 deletions(-)

-- 
2.38.0


