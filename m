Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11354900AF
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Aug 2019 13:25:44 +0200 (CEST)
Received: from localhost ([::1]:54066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hyaMZ-0000ew-6o
	for lists+qemu-devel@lfdr.de; Fri, 16 Aug 2019 07:25:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47908)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1hyaLA-0008Cv-CM
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 07:24:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1hyaL9-0008DR-Bt
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 07:24:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37290)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1hyaL9-0008Ci-6t
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 07:24:15 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 699E9308212F;
 Fri, 16 Aug 2019 11:24:14 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3A12A43FF3;
 Fri, 16 Aug 2019 11:24:12 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 16 Aug 2019 07:24:05 -0400
Message-Id: <20190816112407.28180-1-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Fri, 16 Aug 2019 11:24:14 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [POC QEMU PATCH 0/2] CPU hotplug: use dedicated SMRAM
 at 0x30000 in SMM address space
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
Cc: "Chen, Yingwen" <yingwen.chen@intel.com>,
 edk2-devel-groups-io <devel@edk2.groups.io>,
 Phillip Goerl <phillip.goerl@oracle.com>, "Yao, Jiewen" <jiewen.yao@intel.com>,
 "Nakajima, Jun" <jun.nakajima@intel.com>, pbonzini@redhat.com,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 edk2-rfc-groups-io <rfc@edk2.groups.io>, Laszlo Ersek <lersek@redhat.com>,
 Joao Marcal Lemos Martins <joao.m.martins@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


It's just a quick hack together with Seabios to show
that normal RAM at 0x30000 is not affected by SMM relocation
and dedicated SMRAM could be used for relocation without need to
care about untrusted RAM content at 0x30000.


CC: "Chen,  Yingwen" <yingwen.chen@intel.com>
CC: edk2-devel-groups-io <devel@edk2.groups.io>
CC: Phillip Goerl <phillip.goerl@oracle.com>
CC: qemu devel list <qemu-devel@nongnu.org>
CC: "Yao, Jiewen" <jiewen.yao@intel.com>
CC: "Nakajima, Jun" <jun.nakajima@intel.com>
CC: Boris Ostrovsky <boris.ostrovsky@oracle.com>
CC: edk2-rfc-groups-io <rfc@edk2.groups.io>
CC: Laszlo Ersek <lersek@redhat.com>
CC: Joao Marcal Lemos Martins <joao.m.martins@oracle.com>
CC: pbonzini@redhat.com

 include/hw/pci-host/q35.h |  1 +
 hw/pci-host/q35.c         | 10 ++++++++++
 2 files changed, 11 insertions(+)

-- 
2.18.1


