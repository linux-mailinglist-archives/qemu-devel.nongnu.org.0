Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9E136B2A5
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 14:00:20 +0200 (CEST)
Received: from localhost ([::1]:38886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lazuV-0006Sh-Ba
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 08:00:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1laztI-0005g0-Bv
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 07:59:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1laztG-0005HL-I1
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 07:59:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619438341;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+nCk6Ve+TN+8pnIdsqGxzK6u1TVgQuTIbmRV1IvBlv8=;
 b=MLt9On/LAWCJncKMlgsLcSB7rK0qQshn/bINTN6F1fHLsqtEfU4NwB/l6vVMSF9dK2IRZm
 IwRE0+VRx3Wvblz6AXEaSBwKAvdyECa+LEds1gmY5wP2UrWte4Q2yXMTTWUfPAx2hfiYcO
 QfVTBpfv+ePFlvSfcP/zSEqmq20luyU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-352-wMXs2KOMPeWxPCW9ha64fQ-1; Mon, 26 Apr 2021 07:58:58 -0400
X-MC-Unique: wMXs2KOMPeWxPCW9ha64fQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 170135F9FF;
 Mon, 26 Apr 2021 11:58:58 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.40.192.73])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E85F960855;
 Mon, 26 Apr 2021 11:58:51 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] kvm: use KVM_{GET|SET}_SREGS2 when available
Date: Mon, 26 Apr 2021 14:58:48 +0300
Message-Id: <20210426115850.1003501-1-mlevitsk@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
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
Cc: Cornelia Huck <cohuck@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Maxim Levitsky <mlevitsk@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This implements support for using these new=0D
IOCTLS to migrate PDPTRS.=0D
=0D
Best regards,=0D
	Maxim Levitsky=0D
=0D
Maxim Levitsky (2):=0D
  kvm: update kernel headers for KVM_{GET|SET}_SREGS2=0D
  KVM: use KVM_{GET|SET}_SREGS2 when supported.=0D
=0D
 accel/kvm/kvm-all.c         |   5 ++=0D
 include/sysemu/kvm.h        |   4 ++=0D
 linux-headers/asm-x86/kvm.h |  13 +++++=0D
 linux-headers/linux/kvm.h   |   5 ++=0D
 target/i386/cpu.h           |   3 +=0D
 target/i386/kvm/kvm.c       | 107 +++++++++++++++++++++++++++++++++++-=0D
 target/i386/machine.c       |  30 ++++++++++=0D
 7 files changed, 165 insertions(+), 2 deletions(-)=0D
=0D
-- =0D
2.26.2=0D
=0D


