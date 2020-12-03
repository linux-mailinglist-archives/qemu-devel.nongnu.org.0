Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 684542CDC4B
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 18:23:47 +0100 (CET)
Received: from localhost ([::1]:58588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kksKY-0005ss-GE
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 12:23:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kksDD-00087d-Me
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 12:16:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kksD4-0001H4-PZ
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 12:16:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607015757;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=cR3WCJq9d7LvMDlf7M0tIlYK9KyXcPJkybrgmwJqmcM=;
 b=ESZ2rLiE7RBB4RMYrrPjdRZy1yD4vyl3qnN/WfyYBFRJ0y8te99/ePSTu8VH3XYvZ64OSS
 H9hC6NjNDO/wjyuhMAH4/XAyAxrmaBfuhs5b2CWRGLKoQQArL4xdw+QoS5ccwM8XYVx2Fk
 8QbOpC6Xy9Xcan/GcHWhOVIZ3ugztV4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490-tW323KgXM-6_kPnBfxoCwQ-1; Thu, 03 Dec 2020 12:15:56 -0500
X-MC-Unique: tW323KgXM-6_kPnBfxoCwQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 979AB858180;
 Thu,  3 Dec 2020 17:15:54 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.35.206.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 084AC5D6AC;
 Thu,  3 Dec 2020 17:15:47 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] RFC: Precise TSC migration
Date: Thu,  3 Dec 2020 19:15:44 +0200
Message-Id: <20201203171546.372686-1-mlevitsk@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
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
Cc: Cornelia Huck <cohuck@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Maxim Levitsky <mlevitsk@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Note that to use this feature you need the kernel patches which are=0D
posted to LKML and kvm@vger.kernel.org=0D
=0D
The feature is disabled by default, and can be enabled with=0D
-accel kvm,x-precise-tsc=3Don.=0D
=0D
I changed the TSC and TSC adjust read/write code to go though a special=0D
function kvm_get_tsc/kvm_set_tsc regardless of enablement of this feature.=
=0D
=0D
The side effect of this is that now we upload to the kernel the TSC_ADJUST=
=0D
msr only on KVM_PUT_RESET_STATE reset level.=0D
This shouldn't matter as I don't think that qemu changes this msr on its ow=
n.=0D
=0D
For migration I added a new state field 'cpu/tsc_ns_timestamp',=0D
where I save the TSC nanosecond timestamp, which is the only=0D
new thing that was added to the migration state.=0D
=0D
First patch in this series is temporary and it just updates the kernel=0D
headers to make qemu compile.=0D
=0D
When the feature is merged to the kernel, a kernel header sync will bring=0D
the same changes to the qemu, making this patch unnecessary.=0D
=0D
V2:=0D
=0D
- switched to -accel for enablement=0D
- sync with updated kernel patches=0D
- minor cleanups, renames, etc=0D
=0D
Best regards,=0D
    Maxim Levitsky=0D
=0D
Maxim Levitsky (2):=0D
  Update the kernel headers for 5.10-rc5 + TSC=0D
  Implement support for precise TSC migration=0D
=0D
 accel/kvm/kvm-all.c                         |  28 ++++=0D
 include/standard-headers/asm-x86/kvm_para.h |   1 +=0D
 include/sysemu/kvm.h                        |   1 +=0D
 linux-headers/asm-x86/kvm.h                 |   2 +=0D
 linux-headers/linux/kvm.h                   |  71 +++++++++-=0D
 target/i386/cpu.h                           |   1 +=0D
 target/i386/kvm.c                           | 140 ++++++++++++++++----=0D
 target/i386/machine.c                       |  19 +++=0D
 8 files changed, 234 insertions(+), 29 deletions(-)=0D
=0D
-- =0D
2.26.2=0D
=0D


