Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E02D441BAF
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 14:25:34 +0100 (CET)
Received: from localhost ([::1]:40942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhXJd-0007zH-St
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 09:25:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1mhXHb-0005Gh-OS
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 09:23:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30406)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1mhXHY-0004vK-8h
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 09:23:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635772999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=RZLftubQZhcRywV/L4ITsBdUbnfH9UsZVxjpxPe8d9E=;
 b=GHPmszAmB0QoBnLwSC4r27mwqmfcG1tdzg+ELZ+Npz7csAiKqtkxy2wxh/v4WG41GUrZ8P
 9U4UuAm5m3J6LJNXDqb8/+rMehiXN3D4striI3WeCy79D+fgB7ERt8Mx/58yruhwBmkdXy
 DLgPcIN1z2gqCiKLootYwBwYoM0Tou0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-YrwGze3yM1qCJwoCR6itjw-1; Mon, 01 Nov 2021 09:23:16 -0400
X-MC-Unique: YrwGze3yM1qCJwoCR6itjw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E7C138026AD;
 Mon,  1 Nov 2021 13:23:14 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.40.194.243])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 10BDD60C0F;
 Mon,  1 Nov 2021 13:23:04 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/3] KVM: qemu patches for few KVM features I developed
Date: Mon,  1 Nov 2021 15:22:57 +0200
Message-Id: <20211101132300.192584-1-mlevitsk@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
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
Cc: kvm@vger.kernel.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These patches implement the qemu side logic to support=0D
the KVM features I developed recently.=0D
=0D
All 3 patches are for features that are accepted upstream in KVM.=0D
=0D
V2: rebased and fixed patch 2 to compile without kvm=0D
=0D
Best regards,=0D
    Maxim Levitsky=0D
=0D
Maxim Levitsky (3):=0D
  KVM: use KVM_{GET|SET}_SREGS2 when supported.=0D
  gdbstub: implement NOIRQ support for single step on KVM=0D
  KVM: SVM: add migration support for nested TSC scaling=0D
=0D
 accel/kvm/kvm-all.c   |  30 +++++++++++=0D
 gdbstub.c             |  62 +++++++++++++++++----=0D
 include/sysemu/kvm.h  |  19 +++++++=0D
 target/i386/cpu.c     |   5 ++=0D
 target/i386/cpu.h     |   7 +++=0D
 target/i386/kvm/kvm.c | 122 +++++++++++++++++++++++++++++++++++++++++-=0D
 target/i386/machine.c |  52 ++++++++++++++++++=0D
 7 files changed, 284 insertions(+), 13 deletions(-)=0D
=0D
-- =0D
2.26.3=0D
=0D


