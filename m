Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A6F143165
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jan 2020 19:23:27 +0100 (CET)
Received: from localhost ([::1]:42526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itbhu-0008Ey-3E
	for lists+qemu-devel@lfdr.de; Mon, 20 Jan 2020 13:23:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56578)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1itbgT-0006qV-VY
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 13:22:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1itbgN-0008Ey-Bm
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 13:21:56 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:26080
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1itbgN-0008EK-8U
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 13:21:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579544510;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ebsMQGyB1nQjz/eiqJtQuehQUSO4FAIoQyXOQvuOV3M=;
 b=R+ofTYdOWQ80i4Qg0NO7UG3orC3c+XEr4GNIqTQ7YEEbcyXNh6oR8oewpxPDz3UTnyM8Wj
 Mo0DbpXezD2nAEkDGCL//1dE3qXtheVVD+TQCck6bDzFuf/r8O0AJc8EuCClg/YNXwKSRI
 zrAEIqKJUFrtcoPZ3XC+poT/sJ1Bbtw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-baG_e7g6Nd2yp5PfIDMpcA-1; Mon, 20 Jan 2020 13:21:48 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B4EAB14E4;
 Mon, 20 Jan 2020 18:21:47 +0000 (UTC)
Received: from 640k.localdomain.com (unknown [10.36.112.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B7D2F60BF7;
 Mon, 20 Jan 2020 18:21:46 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] target/i386: early MSR initialization + pass down host
 microcode revision for "-cpu host"
Date: Mon, 20 Jan 2020 19:21:41 +0100
Message-Id: <1579544504-3616-1-git-send-email-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: baG_e7g6Nd2yp5PfIDMpcA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: vkuznets@redhat.com, liran.alon@oracle.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As part of this, patch 1 moves feature MSR initialization to
kvm_arch_init_vcpu, which also fixes a problem related to the ordering
of kvm_put_msrs and kvm_put_nested_state.  Patch 2 adds a customizable
ucode-rev property that is supported by both TCG and HVF.  Finally patch 3
adds the KVM support, including getting the host version via KVM_GET_MSRS
and passing it back to the guest for "-cpu host" only.

Paolo Bonzini (3):
  target/i386: kvm: initialize feature MSRs very early
  target/i386: add a ucode-rev property
  target/i386: kvm: initialize microcode revision from KVM

 target/i386/cpu.c         | 14 ++++++++
 target/i386/cpu.h         |  3 ++
 target/i386/hvf/x86_emu.c |  4 +--
 target/i386/kvm.c         | 86 +++++++++++++++++++++++++++++--------------=
----
 target/i386/kvm_i386.h    |  1 +
 target/i386/misc_helper.c |  4 +++
 6 files changed, 76 insertions(+), 36 deletions(-)

--=20
1.8.3.1


