Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCEE40488C
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 12:36:05 +0200 (CEST)
Received: from localhost ([::1]:42332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOHPY-0005iA-5K
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 06:36:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mOHNZ-00030W-GN
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 06:34:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mOHNX-0002xm-PK
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 06:34:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631183639;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=wQCXsC2CxArBVDPF1gdY1gmnZTZQWnM2+ECr7CTfr58=;
 b=W3lmV1JVEroO6sjMoKd9GrFJbUzw9bBtiHcZYNcjqT0F0B1L78GwpmdB0DNNCo+npvSd2j
 HYy3hE9vrttxc+LIHz4dwVNQrbrYuMiR7RqhL0/v9Sh5Pl6wsbYvUfimkysd6/QwrfklJg
 iUcBgoqkCtdEdwZyuXgg0RQJ8Uanca0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-121-uvT6IixTOoK5mHnJNcXmuw-1; Thu, 09 Sep 2021 06:33:49 -0400
X-MC-Unique: uvT6IixTOoK5mHnJNcXmuw-1
Received: by mail-wm1-f72.google.com with SMTP id
 r4-20020a1c4404000000b002e728beb9fbso667257wma.9
 for <qemu-devel@nongnu.org>; Thu, 09 Sep 2021 03:33:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=V3Q9GMBQjaxairWZaYT3HXlCrgThuu7TQf11Nb4ds0Q=;
 b=2CR/a1ALlSx9TdOsUCfEhIUO7SSoJQziyl5e73gkzJQcbViRM3umWZMvbUiwyrsInD
 mTTA1n1OJRul4j1mG8EOxocX6V2ZRU34DerYY4GV/dNA/bd9irGAw5S213X1LTKtFroI
 R55GsR9UVp5MWvANdBk7mDI/SdZee3wwvtM7t5bIO+z3A8I7DWNUkGvaSgnfwO7cl4Ik
 Lf7TZktS1O7P1n3USy/ZAuzIbb6t3FXRh3eHAi+ou76j+F78sGx4loGfl3S0r88LyhKe
 5CCFWA7WSvwlZjT+ioaX2mP5CuPGtQkF4FFAC9C4h4CqYkOmWqH0biN2W38UNSuxpvgd
 Lh0w==
X-Gm-Message-State: AOAM533FneH2ROmC63rppuzoRcMse0rLqXjpHPftd11XGjzggD4V2dwm
 si94mTx7q47udEibO0q4Gu/T4IgtjMHRisr+P/oHyAk5nGZ232vt7o6OjelfmTzR60TDZjFvoxo
 GEdp5P54kh7V+n+KL3QvAAm0rSi1pXxKC9xRaJovtOCAFlqSNcwarQqueIFdQaNSZlZ4=
X-Received: by 2002:a1c:9a0e:: with SMTP id c14mr2257880wme.119.1631183628286; 
 Thu, 09 Sep 2021 03:33:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwWKPwqLJCE4OIeOQf90p9maK52oEQhZD7iMWmqBWIeuLYzYHrqFV4Y52iGErjC8HHnHef7wg==
X-Received: by 2002:a1c:9a0e:: with SMTP id c14mr2257850wme.119.1631183627939; 
 Thu, 09 Sep 2021 03:33:47 -0700 (PDT)
Received: from localhost (static-201-64-63-95.ipcom.comunitel.net.
 [95.63.64.201])
 by smtp.gmail.com with ESMTPSA id x14sm1354861wrs.28.2021.09.09.03.33.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Sep 2021 03:33:47 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/7] Migration.next patches
Date: Thu,  9 Sep 2021 12:33:39 +0200
Message-Id: <20210909103346.1990-1-quintela@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
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
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit bd662023e683850c085e98c8ff8297142c2dd9f2=
:=0D
=0D
  Merge remote-tracking branch 'remotes/mcayland/tags/qemu-openbios-2021090=
8' into staging (2021-09-08 11:06:17 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://github.com/juanquintela/qemu.git tags/migration.next-pull-request=
=0D
=0D
for you to fetch changes up to 158cced72cb2b09b0e8b523a5b15cb10889f99d1:=0D
=0D
  migration: allow enabling mutilfd for specific protocol only (2021-09-09 =
09:30:55 +0200)=0D
=0D
----------------------------------------------------------------=0D
Migration Pull request=0D
=0D
This pull request includes:=0D
- Remove RAMState unused parameter for several prototypes=0D
- RDMA fix=0D
- give an error when using RDMA and multifd=0D
- Implement yank for multifd send side=0D
=0D
Please, Apply.=0D
=0D
----------------------------------------------------------------=0D
=0D
David Hildenbrand (1):=0D
  migration/ram: Don't passs RAMState to=0D
    migration_clear_memory_region_dirty_bitmap_*()=0D
=0D
Li Zhijian (4):=0D
  migration/rdma: Try to register On-Demand Paging memory region=0D
  migration/rdma: advise prefetch write for ODP region=0D
  migration: allow multifd for socket protocol only=0D
  migration: allow enabling mutilfd for specific protocol only=0D
=0D
Lukas Straub (2):=0D
  multifd: Implement yank for multifd send side=0D
  multifd: Unconditionally unregister yank function=0D
=0D
 migration/multifd.h    |   4 ++=0D
 migration/migration.c  |  12 +++++=0D
 migration/multifd.c    |  35 ++++++++++---=0D
 migration/ram.c        |  13 ++---=0D
 migration/rdma.c       | 111 ++++++++++++++++++++++++++++++++++-------=0D
 migration/trace-events |   2 +=0D
 6 files changed, 143 insertions(+), 34 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


