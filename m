Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 659C638F3EE
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 21:57:48 +0200 (CEST)
Received: from localhost ([::1]:56716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llGhv-0005S9-1J
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 15:57:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=771b08666=sidcha@amazon.de>)
 id 1llGfj-0003Zk-FU
 for qemu-devel@nongnu.org; Mon, 24 May 2021 15:55:31 -0400
Received: from smtp-fw-2101.amazon.com ([72.21.196.25]:26578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=771b08666=sidcha@amazon.de>)
 id 1llGfh-0001SV-8F
 for qemu-devel@nongnu.org; Mon, 24 May 2021 15:55:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1621886129; x=1653422129;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=RnjgERzwsTvZMNSKxKoybCX6U1tec5pVi0tZHHfXmPE=;
 b=LGE0NGqtZq/zDIq0EL3ljTEacEGRlaWd5cy5AtrcimKm6WgZoGFuGM+V
 AWK/aoNMvICqxWaYypLcIVg9gdptuqrOoUAiYJF9OqD1DoOB3Zpokm0qX
 Ul2RTW/bVz3pDazSyMpNSGYOoV7FIlgspqPrXkUWSE0bNs8lKm38i065n s=;
X-IronPort-AV: E=Sophos;i="5.82,325,1613433600"; d="scan'208";a="111398490"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-1d-38ae4ad2.us-east-1.amazon.com) ([10.43.8.2])
 by smtp-border-fw-2101.iad2.amazon.com with ESMTP; 24 May 2021 19:55:19 +0000
Received: from EX13D28EUC003.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
 by email-inbound-relay-1d-38ae4ad2.us-east-1.amazon.com (Postfix) with ESMTPS
 id CF734A22AC; Mon, 24 May 2021 19:55:18 +0000 (UTC)
Received: from uc8bbc9586ea454.ant.amazon.com (10.43.161.253) by
 EX13D28EUC003.ant.amazon.com (10.43.164.43) with Microsoft SMTP Server (TLS)
 id 15.0.1497.18; Mon, 24 May 2021 19:55:14 +0000
From: Siddharth Chandrasekaran <sidcha@amazon.de>
To: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>
CC: Siddharth Chandrasekaran <sidcha@amazon.de>, Siddharth Chandrasekaran
 <sidcha.dev@gmail.com>, Alexander Graf <graf@amazon.com>, Evgeny Iakovlev
 <eyakovl@amazon.de>, Liran Alon <liran@amazon.com>, Ioannis Aslanidis
 <iaslan@amazon.de>, <qemu-devel@nongnu.org>, <kvm@vger.kernel.org>
Subject: [PATCH 0/6] Handle hypercall code overlay page in userspace
Date: Mon, 24 May 2021 21:54:03 +0200
Message-ID: <cover.1621885749.git.sidcha@amazon.de>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.43.161.253]
X-ClientProxiedBy: EX13D10UWB004.ant.amazon.com (10.43.161.121) To
 EX13D28EUC003.ant.amazon.com (10.43.164.43)
Precedence: Bulk
Received-SPF: pass client-ip=72.21.196.25;
 envelope-from=prvs=771b08666=sidcha@amazon.de; helo=smtp-fw-2101.amazon.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hyprcall code page is specified in the Hyper-V TLFS to be an overlay
page, ie., guest chooses a GPA and the host _places_ a page at that
location, making it visible to the guest and the existing page becomes
inaccessible. Similarly when disabled, the host should _remove_ the
overlay and the old page should become visible to the guest.

Now, KVM directly patches the instructions into the guest chosen GPA for
the hypercall code page. Strictly speaking this is guest memory
corruption as the hyper-v TLFS specifies that the underlying page should
be preserved. Since the guest seldom moves the hypercall code page
around, it didn't see any problems till now. When trying to implement
VSM API, we are seeing some exotic use of overlay pages which start
expecting the underlying page to be intact. To handle those cases, we
need a more generic approach handling these primitives.

This patchset tries build an infrastructure for handling overlay pages
in general by using the new user space MSR filtering feature of KVM to
filter out writes to overlay MSRs, handle them in user space and then
forward those writes back to KVM so it gets an opportunity to write
contents into the page that was overlaid here. Additionally it does some
housekeeping here and there.

P.S. This is a follow up to the my initial approach of handling this in
kernel, see [1] for discussions.

~ Sid.

[1]: https://lore.kernel.org/kvm/20210423090333.21910-1-sidcha@amazon.de/

Siddharth Chandrasekaran (6):
  hyper-v: Overlay abstraction for synic event and msg pages
  hyper-v: Use -1 as invalid overlay address
  kvm/i386: Stop using cpu->kvm_msr_buf in kvm_put_one_msr()
  kvm/i386: Avoid multiple calls to check_extension(KVM_CAP_HYPERV)
  kvm/i386: Add support for user space MSR filtering
  hyper-v: Handle hypercall code page as an overlay page

 hw/hyperv/hyperv.c         | 116 +++++++++++++++++++++----------------
 include/hw/hyperv/hyperv.h |  15 +++++
 target/i386/kvm/hyperv.c   |  94 ++++++++++++++++++++++++++++--
 target/i386/kvm/hyperv.h   |   4 ++
 target/i386/kvm/kvm.c      | 113 ++++++++++++++++++++++++++++++++++--
 target/i386/kvm/kvm_i386.h |   1 +
 6 files changed, 282 insertions(+), 61 deletions(-)

-- 
2.17.1



Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879




