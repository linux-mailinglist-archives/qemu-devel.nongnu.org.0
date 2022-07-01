Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA8956375F
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 18:06:20 +0200 (CEST)
Received: from localhost ([::1]:56488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7J9u-0000Od-Vo
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 12:06:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1o7J3r-0005qn-3Y
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 12:00:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31040)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1o7J3m-0001w3-6o
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 12:00:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656691196;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=3PdqlyleCjiRtf5T8+dawVGkBUCFQG9Z5Cf2Q+H9NM4=;
 b=R2Wt0XpknSnzFzF0+Pv9usVXi3zijAAu5R1x3/s0rLuWEMrc0H2V7vCFrdm3OhaLUJ5daP
 cX9hHMuvcyCzk+oupEZ+8YbBAnSfSHPyuaVDtAceyR+fcBYAhVy+wDfvtnqR2UpjLoiEsH
 OhF/Nhcxd2Xh9OlrHJ+5QRQmUn4R4Jw=
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-671-LgZh5apPNGSRrrGCe5gSnA-1; Fri, 01 Jul 2022 11:59:55 -0400
X-MC-Unique: LgZh5apPNGSRrrGCe5gSnA-1
Received: by mail-oa1-f70.google.com with SMTP id
 586e51a60fabf-f15a7ca913so1706529fac.8
 for <qemu-devel@nongnu.org>; Fri, 01 Jul 2022 08:59:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3PdqlyleCjiRtf5T8+dawVGkBUCFQG9Z5Cf2Q+H9NM4=;
 b=GFqcvnkW97t5dBUEFK0Wp4PUKev8WMS2Sl7qID0w98hKINzoaoYo7CMAWjoNnPXbPt
 HaH14b0HYyX2i3rFUgI3BX7ha4lFaYanvkXO48d1JnyjEQry+5XwzkFtPYaElSpgBDUM
 zgWo34ikRcqm0rSU3UoOQnaDhUKyK6PEDFl3m/F26iYQEFlbfKSehDnCRx5fBF6If2xX
 /EsnEuAtdbbsXfa/yKK6lcB1Iho7vHYX3rp+FZJLjNVDv14tBguHKASKwiEHSI+BaFY4
 UL+4Q3GPEaLbCJB2kB9VVgzK9+gb3Lb2erkmTj5AVx7eUqj0MX7OqNBW8QRLsZkW5Fbn
 EuvQ==
X-Gm-Message-State: AJIora+B5m5rGhzZIdLkZBIlH5EZn9cyQg4MYHBY2Zdqz4GDsAdPN8i6
 vHqgQR6w+6GjXj85Ntav2xKjqBZJ/ZI00bGeKFdG3+o8FBktXxNaSXu4O/KYCkbcdPVo8WQI0Hj
 co5txY9A8VvUX6W0=
X-Received: by 2002:a05:6870:f616:b0:f2:dac0:e339 with SMTP id
 ek22-20020a056870f61600b000f2dac0e339mr10552495oab.116.1656691194201; 
 Fri, 01 Jul 2022 08:59:54 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s07Wq64bFBrEj4XSIabR8ut0y1+iaqaecfckd8IIAF6B8klcMG3ShkSD8YvabdSJmGPZXGcg==
X-Received: by 2002:a05:6870:f616:b0:f2:dac0:e339 with SMTP id
 ek22-20020a056870f61600b000f2dac0e339mr10552469oab.116.1656691193652; 
 Fri, 01 Jul 2022 08:59:53 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7f1:da6a:610c:873d:4fe2:e6ce])
 by smtp.gmail.com with ESMTPSA id
 n39-20020a056870972700b000f333ac991fsm14884274oaq.27.2022.07.01.08.59.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Jul 2022 08:59:52 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Peter Xu <peterx@redhat.com>
Cc: Leonardo Bras <leobras@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v2 0/3] Zero copy improvements (QIOChannel + multifd)
Date: Fri,  1 Jul 2022 12:59:33 -0300
Message-Id: <20220701155935.482503-1-leobras@redhat.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=leobras@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The first patch avoid spuriously returning 1 [*] when zero-copy flush is
attempted before any buffer was sent using MSG_ZEROCOPY.

[*] zero-copy not being used, even though it's enabled and supported
by kernel

The second patch introduces a new migration stat (zero-copy-copied)
that will be used to keep track of [*]. 

Honestly I would like some help with this naming, which I don't think
is quite good, but I could also not think on anything better.

The third patch keeps track of how many zero-copy flushes retured 1 [*]

Leonardo Bras (3):
  QIOChannelSocket: Fix zero-copy flush returning code 1 when nothing
    sent
  Add zero-copy-copied migration stat
  migration/multifd: Warn user when zerocopy not working

 qapi/migration.json   | 5 ++++-
 migration/ram.h       | 2 ++
 io/channel-socket.c   | 8 +++++++-
 migration/migration.c | 1 +
 migration/multifd.c   | 2 ++
 migration/ram.c       | 5 +++++
 monitor/hmp-cmds.c    | 4 ++++
 7 files changed, 25 insertions(+), 2 deletions(-)

-- 
2.36.1


