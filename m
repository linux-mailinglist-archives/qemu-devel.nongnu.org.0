Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 212A03A21A3
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 02:54:40 +0200 (CEST)
Received: from localhost ([::1]:36772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr8xu-0002B9-WE
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 20:54:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lr8wC-0000G9-Nd
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 20:52:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lr8wA-0005ze-0Z
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 20:52:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623286364;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=UKcnT1KsfB8GHOpOeAHMo9ILcmIwtttwmzDhBOfWscY=;
 b=YfaXhVNcoBwVmlhA1TJKsGJOwkylpmAORwdbFrlTr3bRcAmcgBATfs4Cps45AkydM9cV7t
 NCxm1iILOspJO+FfEyggAm9NNZiAZvJYjZ8E6SBEvSWaKrZwA1R7ho0KpYO9SZ9HyWzN5T
 tvOvpqcBKc8DnZKZw7kZbLJbTnMRGzM=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-573-V6DnHlFUP4KDAYQbrkV5ig-1; Wed, 09 Jun 2021 20:52:44 -0400
X-MC-Unique: V6DnHlFUP4KDAYQbrkV5ig-1
Received: by mail-qv1-f71.google.com with SMTP id
 ca13-20020ad4560d0000b029023ebd662003so1331141qvb.17
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 17:52:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PMKIm4MJQpY8h6kaEIYoNEjmkLNaluKUCWF9P27nWmw=;
 b=Fca9wWVgxa/qLJP9pnqxOVIF0ydu4ImA9dcKu9uGPPpuf39yZTa18uVcuQR5gzeNph
 yEgVjV/EVhDio8Gad19D0REF9WOZYIIlNaFxX5jUuOop/1rR2As1kxxoqS9tPIJfropX
 icUbGYzZtLY1/CW8XEejM/6ZpX0LRZfO5kQhJ29tpJQRzEkVJ65IoBvt0V+waLVtKgqq
 Bl4hg42yGnm8KzSZbzi0Y65Ql9h1ggsSUzmWnyrcSQddQmGeBaOXmOtgtRCMTUKkhNos
 eT/V+yWhu0x+jl4tb/I6w2JSgngxBVEFhy6/ONkarVhZ4neB8xeHqe9xWnVva6BuVX4d
 UBWw==
X-Gm-Message-State: AOAM532zWqy9CQ6hD/axGUaVgv18y7V9jVO4s+0wPD6bGRABHq8UIstJ
 8sIoMpuTX+zQMZUZUAUJptRUoVZXxUiUmj4v3zMR8Aj1m7JJz+vL0ttf/+NnoBaFYpwasaiGfQ7
 xnoxy7/MO+HiucZ5hlMxqcviXydCkvN88CNuLWQQrnSNLcm8brPAl7cNonDxgrmyC
X-Received: by 2002:a37:68c7:: with SMTP id d190mr2429959qkc.485.1623286363076; 
 Wed, 09 Jun 2021 17:52:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxWpQL14sQtAv7XnLtWPsLOTMq+Gx0AV/KXH8gTKCfaot+nP2q78XeOqWQM9MwuxCKQ3VC7Cg==
X-Received: by 2002:a37:68c7:: with SMTP id d190mr2429926qkc.485.1623286362736; 
 Wed, 09 Jun 2021 17:52:42 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-toroon474qw-grc-88-174-93-75-200.dsl.bell.ca. [174.93.75.200])
 by smtp.gmail.com with ESMTPSA id x15sm1279045qkh.19.2021.06.09.17.52.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 17:52:41 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] tests: migration-test: Fix agressive test skip,
 add dirty ring test
Date: Wed,  9 Jun 2021 20:52:37 -0400
Message-Id: <20210610005239.265588-1-peterx@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Based-on: <20210609014355.217110-1-peterx@redhat.com>=0D
=0D
Patch 1 is a fix for migration test not really running on new kernels.  The=
=0D
problem is uffd check now will constantly fail after upstream commit=0D
37cd0575b8510159 - that means any host kernel newer than 5.11.=0D
=0D
Patch 1 makes it slightly better by only skipping the two postcopy tests th=
at=0D
needs uffd on these kernels.  When we want to run the full test, we can do:=
=0D
=0D
  $ sudo QTEST_QEMU_BINARY=3D./qemu-system-x86_64 ./tests/qtest/migration-t=
est=0D
=0D
Then the uffd check will pass, and postcopy tests will be run.=0D
=0D
Patch 2 of this series adds the dirty ring test that just got merged into q=
emu.=0D
It needs the other patch "[PATCH] KVM: Fix dirty ring mmap incorrect size d=
ue=0D
to renaming accident", and that's majorly why we need the "Based-on" tag.=
=0D
=0D
Not sure what's the easiest way for the series as it'll depend on the other=
 kvm=0D
patch.  Perhaps if I can try to get ack from Dave so Paolo could queue it t=
oo=0D
along with the kvm fix (for either the whole series or patch 2 only)?  I'll=
=0D
leave that to maintainers to decide..=0D
=0D
Please review, thanks.=0D
=0D
Peter Xu (2):=0D
  tests: migration-test: Still run the rest even if uffd missing=0D
  tests: migration-test: Add dirty ring test=0D
=0D
 tests/qtest/migration-test.c | 62 ++++++++++++++++++++++++++++++------=0D
 1 file changed, 53 insertions(+), 9 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


