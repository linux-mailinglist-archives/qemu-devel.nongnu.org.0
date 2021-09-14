Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA4940ACDC
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 13:56:40 +0200 (CEST)
Received: from localhost ([::1]:51804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ73H-0003kV-Vy
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 07:56:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mQ6yt-00056o-GH
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 07:52:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mQ6yq-0007Im-2j
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 07:52:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631620322;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=QfiVkrIKVgHBoeemFA6FCs+OHl0oooWxt0IxQrQJqZk=;
 b=Lgyv4HicWDcr4eain0tgweU74/u66i0Rt5fKymbiD8gq4XUPQmlkwklU+koWWRdMBYHhWt
 9VY5ihAoK/dKU4d1knju7QpQw66ZErFPF6PBcUxTbDMHWq9LDZbJpK/nQJMjNie4y4tMK0
 fnSrPVGMHVfKSx8oLF+qpSNHf2z5dzI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-aRLrOyJ2OO6GpOPEWnrv2Q-1; Tue, 14 Sep 2021 07:52:00 -0400
X-MC-Unique: aRLrOyJ2OO6GpOPEWnrv2Q-1
Received: by mail-wr1-f71.google.com with SMTP id
 m18-20020adfe952000000b0015b0aa32fd6so3854413wrn.12
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 04:52:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=koqnN2xp6YL+5covsqMG63EPIUFDaE+HwpMYCzdSvK0=;
 b=ncNE+IqYC9WmE/cYitz2CigD3YznvJww12L9rzYk7QQRWaYfDykGcvNWhix1ImCcNu
 Vcj9p1WoNLRHyKvml0mFmkwtzhDWywI/MJeD9mRMCnn3PChrieK02wKFWA6jA702ZFnF
 NFh0rD2Z106dpul8atU9+9Lm8islmylFtzvZrgII2n/KHQCgZungBzV1AH3FHin0Je7O
 rxfg1LMWpOSFo0kI8NVh/lwzcrbWqmfVipiR6qpiwce3t35pgMe7JjUGGl+Eo+rRNsZ7
 3fUxo5JpTS2I92yp6kP2Y4H0tK1rHzpMA7F8KVd/3INVtoOo4SzHMlQ1sQkkpzoQsC5d
 fvPA==
X-Gm-Message-State: AOAM5308BmPc84Z7XFahtb0cGbkuOt7UcizTH67pXPQJekGklfwxdEia
 6EEwjT/kZRiePEuiYnceV4PUryw4vl/73ViIMr+nKyJwGhpuKbr/9G86WveXB2mBi3jQ9vCdN9Z
 hLShV7/IaKLobo/wZh/q+wiNJsqyuDcWDZzfG3c4xwGYBVbH5f1D4RvBbp3fZMVP6duE=
X-Received: by 2002:adf:b7c1:: with SMTP id t1mr17890460wre.387.1631620318804; 
 Tue, 14 Sep 2021 04:51:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJycRPEk7uOnTqF68+D3j85CYOUPmH9CL2ofGk5KOMpUyc/b1mfCIpkBdMdt28QR1jYl1yrJjw==
X-Received: by 2002:adf:b7c1:: with SMTP id t1mr17890433wre.387.1631620318521; 
 Tue, 14 Sep 2021 04:51:58 -0700 (PDT)
Received: from localhost (static-109-144-85-188.ipcom.comunitel.net.
 [188.85.144.109])
 by smtp.gmail.com with ESMTPSA id j2sm10149283wrq.35.2021.09.14.04.51.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 04:51:57 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/5] Migration.next patches
Date: Tue, 14 Sep 2021 13:51:52 +0200
Message-Id: <20210914115157.35868-1-quintela@redhat.com>
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
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

The following changes since commit c6f5e042d89e79206cd1ce5525d3df219f13c3cc=
:=0D
=0D
  Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20210=
913-3' into staging (2021-09-13 21:06:15 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://github.com/juanquintela/qemu.git tags/migration.next-pull-request=
=0D
=0D
for you to fetch changes up to d634d0e7b0225f97f45cecb72ca90bd0e7bdb211:=0D
=0D
  migration/ram: Don't passs RAMState to migration_clear_memory_region_dirt=
y_bitmap_*() (2021-09-14 13:45:06 +0200)=0D
=0D
----------------------------------------------------------------=0D
Migration Pull request (take 2)=0D
=0D
This pull request includes:=0D
- Remove RAMState unused parameter for several prototypes (dropped)=0D
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
Li Zhijian (2):=0D
  migration/rdma: Try to register On-Demand Paging memory region=0D
  migration/rdma: advise prefetch write for ODP region=0D
=0D
Lukas Straub (2):=0D
  multifd: Implement yank for multifd send side=0D
  multifd: Unconditionally unregister yank function=0D
=0D
 migration/multifd.h    |   2 +=0D
 migration/multifd.c    |  11 ++--=0D
 migration/ram.c        |  13 ++---=0D
 migration/rdma.c       | 111 ++++++++++++++++++++++++++++++++++-------=0D
 migration/trace-events |   2 +=0D
 5 files changed, 107 insertions(+), 32 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


