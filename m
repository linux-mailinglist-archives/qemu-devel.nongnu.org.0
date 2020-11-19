Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 160B72B9030
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 11:36:20 +0100 (CET)
Received: from localhost ([::1]:43412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfhIZ-000589-53
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 05:36:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1kfhEu-0000rT-1R
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 05:32:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1kfhEq-0007Wd-K0
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 05:32:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605781947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=hIlpr7vm63CPnV+lx8HgQPyTRN+r0z7k9dsGUOjcxrM=;
 b=R9sYH4loNw2hEE/yRhtdHmP81quk2XXSJ/qFZGCYgrSyJ9RWotS/EVfCJ+f7VIYFCVa9nD
 WDe/g+ceQEZVVBOQYvKZyGZ+/mkW96B1veh0Wx82OzTOxxDURxSKRj49bFXbEXyNgIwZUt
 2EtQVWQw8T6yZ9p72nwp25GCgKUjY3A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-567-l9HTdcWtMza6U1UAtXBt5w-1; Thu, 19 Nov 2020 05:32:24 -0500
X-MC-Unique: l9HTdcWtMza6U1UAtXBt5w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 036F7814411
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 10:32:24 +0000 (UTC)
Received: from vitty.brq.redhat.com (unknown [10.40.193.186])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A661060854;
 Thu, 19 Nov 2020 10:32:22 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/5] i386: simplify Hyper-V enlightenments enablement
Date: Thu, 19 Nov 2020 11:32:16 +0100
Message-Id: <20201119103221.1665171-1-vkuznets@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/19 03:44:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

This series is a part of the previously sent "[PATCH RFC v3 00/23] i386:
KVM: expand Hyper-V features early":
https://lists.gnu.org/archive/html/qemu-devel/2020-10/msg02443.html

We're not ready to merge the full patch set yet because the required
KVM capability is only queued for 5.11. We can, however, extract the
part providing 'hyperv=on' option to x86 machine types which is valuable
on its own. Picking up four other patches from the original RFC to
minimize the code churn in future (x86_cpu_realizefn()).

Changes since RFCv3:
- Rename 'hyperv_features' to 'default_hyperv_features' in X86MachineClass
  [Eduardo]
- Move x86_cpu_hyperv_realize() invocation after x86_cpu_expand_features()/
  x86_cpu_filter_features() as we need to reference cpu_has_vmx().

Vitaly Kuznetsov (5):
  i386: move hyperv_vendor_id initialization to x86_cpu_realizefn()
  i386: move hyperv_interface_id initialization to x86_cpu_realizefn()
  i386: move hyperv_version_id initialization to x86_cpu_realizefn()
  i386: move hyperv_limits initialization to x86_cpu_realizefn()
  i386: provide simple 'hyperv=on' option to x86 machine types

 docs/hyperv.txt       |  8 +++++
 hw/i386/x86.c         | 30 +++++++++++++++++++
 include/hw/i386/x86.h |  7 +++++
 target/i386/cpu.c     | 52 +++++++++++++++++++++++++++++++-
 target/i386/cpu.h     |  6 +++-
 target/i386/kvm.c     | 70 ++++++++++++++++++++++++++++---------------
 6 files changed, 147 insertions(+), 26 deletions(-)

-- 
2.26.2


