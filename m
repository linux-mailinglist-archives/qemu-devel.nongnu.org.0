Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8562DD1B6
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 13:51:52 +0100 (CET)
Received: from localhost ([::1]:44552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpsl5-0001Ot-Sl
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 07:51:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1kpsjU-0008Iy-GP
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 07:50:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1kpsjS-0005dw-H6
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 07:50:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608209409;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=lw2bowT3fZoKthP/GE2EVsgI7RYSXfYNEsUapVFIW/o=;
 b=ipgBP8ii711abspAeYWac60uVseYKayem38bupCAilG6EJI5KY3uv5t3Zxyio5JsLvZ1/L
 MxOuU8jQqrxXzmUsoqa9Wf5zOAnkzIxSZ6EyXYfVPqLiGgq45CQuWSZiQdZkW87l3dYyUh
 Kmm1oWdkjIj+AkLLuQyxJ1LGxCAxdhs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-28-dwjATBexMniyJ0g2mYCyRA-1; Thu, 17 Dec 2020 07:50:07 -0500
X-MC-Unique: dwjATBexMniyJ0g2mYCyRA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C833515720
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 12:50:06 +0000 (UTC)
Received: from vitty.brq.redhat.com (ovpn-116-238.ams2.redhat.com
 [10.36.116.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 345635D9C0;
 Thu, 17 Dec 2020 12:50:01 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] i386: simplify Hyper-V enlightenments enablement
Date: Thu, 17 Dec 2020 13:49:57 +0100
Message-Id: <20201217124959.262639-1-vkuznets@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Changes since v1:
- Moved X86MachineClass related setup to x86_cpu_pre_plug [Eduardo],
  introduced kvm_hv_evmcs_available() to support the change.
- Droped PATCHes0-4 from v1 as x86_cpu_hyperv_realize() is not
  needed for the purpose of this series. I'll be sending them out
  as part of "KVM: expand Hyper-V features early" series after 5.11-rc1
  Linux release.

Original description:

This series is a part of the previously sent "[PATCH RFC v3 00/23] i386:
KVM: expand Hyper-V features early":
https://lists.gnu.org/archive/html/qemu-devel/2020-10/msg02443.html

We're not ready to merge the full patch set yet because the required
KVM capability is only queued for 5.11. We can, however, extract the
part providing 'hyperv=on' option to x86 machine types which is valuable
on its own.

Vitaly Kuznetsov (2):
  i386: introduce kvm_hv_evmcs_available()
  i386: provide simple 'hyperv=on' option to x86 machine types

 docs/hyperv.txt        |  8 ++++++++
 hw/i386/x86.c          | 42 ++++++++++++++++++++++++++++++++++++++++++
 include/hw/i386/x86.h  |  7 +++++++
 target/i386/kvm-stub.c |  5 +++++
 target/i386/kvm.c      |  8 ++++++++
 target/i386/kvm_i386.h |  1 +
 6 files changed, 71 insertions(+)

-- 
2.29.2


