Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F106D2C85C1
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 14:41:59 +0100 (CET)
Received: from localhost ([::1]:51086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjjRH-0006NQ-0f
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 08:41:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kjjOO-0005DK-5I
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 08:39:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kjjOL-0008Il-UT
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 08:38:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606743536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=5sWo7oHI2vIdCqH/ZBIudC4hEIMfpuKFF5jtRagIg90=;
 b=MR483c4XTRPtaa1lXunZShYKyoegJ2znJilbCvJOCyEciTussSo/JPM7rmRAphqgE++5UB
 PBMyzbSwgme6Ho3uBk8tLkSr7BBiHhGyvSGlwBq5nck3vXxT6ga4iyW3LDxKVhPXNb7s4V
 yBmUTfCNoLpdEEInp+c85X0h46QxBR0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-324-WK7D0nzVMpySt2bDnigDVA-1; Mon, 30 Nov 2020 08:38:54 -0500
X-MC-Unique: WK7D0nzVMpySt2bDnigDVA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AFCDB805BE0;
 Mon, 30 Nov 2020 13:38:53 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.35.206.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E2D5760867;
 Mon, 30 Nov 2020 13:38:46 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] RFC: Precise TSC migration
Date: Mon, 30 Nov 2020 15:38:43 +0200
Message-Id: <20201130133845.233552-1-mlevitsk@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Marcelo Tosatti <mtosatti@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Maxim Levitsky <mlevitsk@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Note that to use this feature you need the kernel patches which are=0D
posted to LKML and kvm@vger.kernel.org=0D
=0D
Currently the feature is disabled by default, and enabled with=0D
x-precise-tsc cpu feature.=0D
=0D
Also I changed the TSC and TSC adjust read/write code to go though a specia=
l=0D
function kvm_get_tsc/kvm_set_tsc regardless of enablement of this feature.=
=0D
=0D
The side effect of this is that now we upload to the kernel the TSC_ADJUST=
=0D
msr only on KVM_PUT_RESET_STATE reset level.=0D
This shouldn't matter as I don't think that qemu changes this msr on its ow=
n.=0D
=0D
For migration I added new state field 'tsc_nsec_info', where I save the=0D
'nsec since epoch' timestamp, which is the only new thing that was added to=
 the=0D
migration state.=0D
=0D
First patch in this series is temporary and it just updates the kernel=0D
headers to make qemu compile.=0D
=0D
When the feature is merged to the kernel, a kernel header sync will bring=0D
the same changes to the qemu, making this patch unnecessary.=0D
=0D
Best regards,=0D
    Maxim Levitsky=0D
=0D
Maxim Levitsky (2):=0D
  Update the kernel headers for 5.10-rc5 + TSC=0D
  Implement support for precise TSC migration=0D
=0D
 include/standard-headers/asm-x86/kvm_para.h |   1 +=0D
 linux-headers/asm-x86/kvm.h                 |   2 +=0D
 linux-headers/linux/kvm.h                   |  70 +++++++++-=0D
 target/i386/cpu.c                           |   1 +=0D
 target/i386/cpu.h                           |   4 +=0D
 target/i386/kvm.c                           | 141 ++++++++++++++++----=0D
 target/i386/machine.c                       |  20 +++=0D
 7 files changed, 211 insertions(+), 28 deletions(-)=0D
=0D
-- =0D
2.26.2=0D
=0D


