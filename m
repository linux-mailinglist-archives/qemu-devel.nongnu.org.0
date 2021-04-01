Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FBF33515B9
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 16:48:13 +0200 (CEST)
Received: from localhost ([::1]:39160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRycG-0003UN-Cg
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 10:48:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1lRyWW-0000B1-FB
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 10:42:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25293)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1lRyWQ-00079S-R5
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 10:42:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617288127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Wqovkryd67AAu1yEb9Qoyk/Fi5dhTRWrAiv6mvYiJ+M=;
 b=Sk/Eol0gaRlIc2ielSgZ0qeNuePtTEGf0Q3SM/M+1DWItK3aMJ0JOVfmjJtGBc6jWW2p1k
 MCnN2l/nAhkuFwuqjbfD3ewy1F+1tcHpbK37U+hyMioGo7jf5jckHUXPMM4nf2bzTeLWaF
 1ojF4knmim3pD/mp4jGQcy98GUTmPYA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-cYAo7J9-MaOgWw0At0kROw-1; Thu, 01 Apr 2021 10:42:06 -0400
X-MC-Unique: cYAo7J9-MaOgWw0At0kROw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E1961927813;
 Thu,  1 Apr 2021 14:41:55 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.35.206.58])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4C3DD5D6B1;
 Thu,  1 Apr 2021 14:41:53 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] gdbstub: implement support for blocking interrupts on
 single stepping
Date: Thu,  1 Apr 2021 17:41:50 +0300
Message-Id: <20210401144152.1031282-1-mlevitsk@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

clone of "starship_unstable"=0D
=0D
Maxim Levitsky (2):=0D
  kvm: update kernel headers for KVM_GUESTDBG_BLOCKEVENTS=0D
  gdbstub: implement NOIRQ support for single step on KVM, when kvm's=0D
    KVM_GUESTDBG_BLOCKIRQ debug flag is supported.=0D
=0D
 accel/kvm/kvm-all.c         | 25 ++++++++++++++++=0D
 gdbstub.c                   | 59 ++++++++++++++++++++++++++++++-------=0D
 include/sysemu/kvm.h        | 13 ++++++++=0D
 linux-headers/asm-x86/kvm.h |  2 ++=0D
 linux-headers/linux/kvm.h   |  1 +=0D
 5 files changed, 90 insertions(+), 10 deletions(-)=0D
=0D
-- =0D
2.26.2=0D
=0D


