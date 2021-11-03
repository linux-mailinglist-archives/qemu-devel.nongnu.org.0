Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC757443EA8
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 09:51:45 +0100 (CET)
Received: from localhost ([::1]:37492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miBzl-0001fE-0F
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 04:51:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1miBw2-0002uU-11
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 04:47:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1miBvX-00048q-32
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 04:47:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635929242;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=VSL98u0tVkqpPIPAxy+NhLcUfQUYiyvtVSRku1s88Gc=;
 b=PZH5qoNQIWPduVMIBbAEk7+weRpx3+iZwKib2gU0NWjnZEBnxHh6KEbnr19jqRiGy1Fsva
 gxoZXGiiQmlEGsU5olOCMJ3jD36FMBtgcjWM2LvOiv8p1oro/+iwGmYZqEe8lJy4xobXFT
 PSCBRcMvQZCiXSJGihN/epITM71nVec=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-223-597HalSMPcCPytIgL3ULiw-1; Wed, 03 Nov 2021 04:46:18 -0400
X-MC-Unique: 597HalSMPcCPytIgL3ULiw-1
Received: by mail-wm1-f71.google.com with SMTP id
 144-20020a1c0496000000b003305ac0e03aso2413620wme.8
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 01:46:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9yz8lorpXuB5tAOXFGWcOc9vQLb6ddxBDoaUCWu56Po=;
 b=uEgKvh4KekgcPUNA2M1pdaMG88RFfGOfC4zIn9SG6OOlGfFJJmwcT8TCZSQFvkPC0k
 pBQaX0M5QhQZnkCxbB03fpzX0BLGZIIoiHWro6mC+AvecTGReCPY7m3h2nA+EvKBlqO/
 fVpszrV1q2HKewVJT1RGEx4Nsg82nYNo+oCZ49WHs6r3qcBCxSUIPrukyx/UVle64ds3
 0p3OSjU8hxplVhzcKywrzWCzQKdNNQoaanRWbTPnD6g3khNAeM7ObxTsWOLKO6f5ELdg
 llRgA6HywOy0S9A0xBp8jZTf6juF97EdwvYm3ndFQ1XY9KKtdKAJIqclxlJ3g2GfNoHr
 zN9Q==
X-Gm-Message-State: AOAM5311ERuEHpBH+PB0joOFq0BJuxtP35fcnbhK7f3ETOz3UD/0SaPD
 mnwHFVzwlK/ZGV2NaDAYqXw3uVPRymPpyRH6nsKgqr6w8fNMChau2UzBT+qFN4Rt++na7fvVmxm
 nGGXtU60D6m3MIuhLAjTFYlkuYPxAXu2D4w4b9z56WRhXejeG0YM0SHnCHjQzEmtIjg0=
X-Received: by 2002:a7b:c084:: with SMTP id r4mr14499461wmh.117.1635929177322; 
 Wed, 03 Nov 2021 01:46:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwRcj1P2F7eFV0IZ1MVMakl+/OWG8OSQAFlh/DKBKpUQwoUth2yeZ6p6QIoYEJ+1fPYVcZRLw==
X-Received: by 2002:a05:600c:2c4a:: with SMTP id
 r10mr13508703wmg.125.1635929166850; 
 Wed, 03 Nov 2021 01:46:06 -0700 (PDT)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id 9sm1662079wry.0.2021.11.03.01.46.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 01:46:06 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/11] Migration 20211102 patches
Date: Wed,  3 Nov 2021 09:45:54 +0100
Message-Id: <20211103084605.20027-1-quintela@redhat.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, Juan Quintela <quintela@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Zhang Chen <chen.zhang@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 741bdeb1d5a4024a2c54c6abb2de493a27b61953=
:=0D
=0D
  Merge remote-tracking branch 'remotes/kwolf/tags/for-upstream' into stagi=
ng (2021-11-03 00:32:56 -0400)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://github.com/juanquintela/qemu.git tags/migration-20211102-pull-req=
uest=0D
=0D
for you to fetch changes up to 64153ca613d0a50d1301eae4bd895aade001fcca:=0D
=0D
  Optimized the function of fill_connection_key. (2021-11-03 09:39:48 +0100=
)=0D
=0D
----------------------------------------------------------------=0D
Migration Pull request=0D
=0D
Hi=0D
=0D
This are the pending migration patches on the list:=0D
- Provide an error message for migration_cancel by Laurent=0D
- Don't dump colo cache when a guest core is requested by Lukas=0D
- Initialise Compression_conters for new migration by Yuxiating=0D
  On top of that I added another missing initialization=0D
- Colo optimizations and crash improvements by Rao.=0D
=0D
Please, apply.=0D
=0D
----------------------------------------------------------------=0D
=0D
Juan Quintela (1):=0D
  migration: Zero migration compression counters=0D
=0D
Laurent Vivier (1):=0D
  migration: provide an error message to migration_cancel()=0D
=0D
Lukas Straub (1):=0D
  colo: Don't dump colo cache if dump-guest-core=3Doff=0D
=0D
Rao, Lei (7):=0D
  Some minor optimizations for COLO=0D
  Fixed qemu crash when guest power off in COLO mode=0D
  Fixed SVM hang when do failover before PVM crash=0D
  colo: fixed 'Segmentation fault' when the simplex mode PVM poweroff=0D
  Removed the qemu_fclose() in colo_process_incoming_thread=0D
  Changed the last-mode to none of first start COLO=0D
  Optimized the function of fill_connection_key.=0D
=0D
yuxiating (1):=0D
  migration: initialise compression_counters for a new migration=0D
=0D
 migration/migration.h |  2 +-=0D
 net/colo.h            |  6 +++---=0D
 migration/colo.c      | 16 +++++-----------=0D
 migration/migration.c | 18 +++++++++++++-----=0D
 migration/ram.c       |  9 +++++++--=0D
 migration/savevm.c    |  1 +=0D
 net/colo-compare.c    |  4 ++--=0D
 net/colo.c            | 31 ++++++++++++-------------------=0D
 net/filter-rewriter.c | 10 +---------=0D
 9 files changed, 45 insertions(+), 52 deletions(-)=0D
=0D
--=20=0D
2.33.1=0D
=0D


