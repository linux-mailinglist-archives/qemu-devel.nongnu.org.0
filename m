Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF586453F9
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 07:27:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2nsd-0000Eo-FV; Wed, 07 Dec 2022 01:26:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p2nsZ-0000EO-Pp
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 01:26:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p2nsW-0007oU-Sc
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 01:26:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670394354;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=Jj8Oc0Szx7ALqYTY8A992XdeKUZWjmeL+c28vmxqbSI=;
 b=houo/a0rgSX7b03HtZRgu3WMsKHIMQu5AtriA0K4tw6HwpMTHosldMCDwHJrwiep3B6w2G
 KZUjerLPC3rrGNc0+DbQgYxzejQ1redj79JYuMM0Nrcd08NzfABFhVle2DdQVXvoTkh7qF
 3+1RGA8Thkn6owB7gkd8UH06e6lgm/U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-668-MzQrzynTP4ewXlsMpdZrMw-1; Wed, 07 Dec 2022 01:25:53 -0500
X-MC-Unique: MzQrzynTP4ewXlsMpdZrMw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F2C54811E75
 for <qemu-devel@nongnu.org>; Wed,  7 Dec 2022 06:25:52 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.144])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C4BCB1415102;
 Wed,  7 Dec 2022 06:25:52 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B0CAD21E6921; Wed,  7 Dec 2022 07:25:49 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Marcel Apfelbaum <marcel@redhat.com>
Subject: How to best make include/hw/pci/pcie_sriov.h self-contained
Date: Wed, 07 Dec 2022 07:25:49 +0100
Message-ID: <87bkofivbm.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

pcie_sriov.h needs PCI_NUM_REGIONS from pci.h, but doesn't include it.
pci.h must be included before pcie_sriov.h or else compile fails.

Adding #include "pci/pci.h" to pcie_sriov would be wrong, because it
would close an inclusion loop: pci.h includes pcie.h (for
PCIExpressDevice) includes pcie_sriov.h (for PCIESriovPF) includes pci.h
(for PCI_NUM_REGIONS).

The obvious solution is to move PCI_NUM_REGIONS pci.h somewhere
pcie_sriov.h can include without creating a loop.

We already have a few headers that don't include anything: pci_ids.h,
pci_regs.h (includes include/standard-headers/linux/pci_regs.h, which
doesn't count), pcie_regs.h.  Moving PCI_NUM_REGIONS to one of these
would work, but it doesn't feel right.

We could create a new one, say pci_defs.h.  Just for PCI_NUM_REGIONS
feels silly.  So, what else should move there?

Any other ideas?

In case you wonder why I bother you with this...

Back in 2016, we discussed[1] rules for headers, and these were
generally liked:

1. Have a carefully curated header that's included everywhere first.  We
   got that already thanks to Peter: osdep.h.

2. Headers should normally include everything they need beyond osdep.h.
   If exceptions are needed for some reason, they must be documented in
   the header.  If all that's needed from a header is typedefs, put
   those into qemu/typedefs.h instead of including the header.

3. Cyclic inclusion is forbidden.

I'm working on patches to get include/ closer to obeying 2.

[1] Message-ID: <87h9g8j57d.fsf@blackfin.pond.sub.org>
    https://lists.nongnu.org/archive/html/qemu-devel/2016-03/msg03345.html


