Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2813E4DC14C
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 09:32:41 +0100 (CET)
Received: from localhost ([::1]:35522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUlYl-00016o-VZ
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 04:32:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nUlWo-0007aB-Mq
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 04:30:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nUlWl-0006il-LY
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 04:30:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647505834;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Jke/scKdjiBil7qA+d/tW4wGYc2fvQpIoCwycmqXhps=;
 b=c0lZHyxCT/Q3V96AAMF4HknRnAhnEWM7OSlruVLWjLkKT8vRH/YWe/7gWmVQAqp8ZN8sRg
 IotNeaMPagrYWUAXhzvnnN0alyVYtHMYg3ggHs3CgDwSXXDkBRJkPJe9maE4nffKj4D9/i
 hzwieSmsE1EuW6XutObS5896gduDEjA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-608-PZMW_T2rOYKu-UHZBP2X-A-1; Thu, 17 Mar 2022 04:30:32 -0400
X-MC-Unique: PZMW_T2rOYKu-UHZBP2X-A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 09810299E756;
 Thu, 17 Mar 2022 08:30:32 +0000 (UTC)
Received: from thuth.com (dhcp-192-232.str.redhat.com [10.33.192.232])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2AE6B76EE;
 Thu, 17 Mar 2022 08:30:28 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/3] Fix crash when adding a second ISA VGA device
Date: Thu, 17 Mar 2022 09:30:23 +0100
Message-Id: <20220317083027.16688-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QEMU currently abort()s if the user tries to add a second ISA VGA
device, for example:

$ ./qemu-system-x86_64 -device isa-vga -device isa-vga
RAMBlock "vga.vram" already registered, abort!
Aborted (core dumped)
$ ./qemu-system-x86_64 -device isa-cirrus-vga -device isa-cirrus-vga
RAMBlock "vga.vram" already registered, abort!
Aborted (core dumped)

Such a crash should never happen just because of giving bad parameters
at the command line, we should give a proper error message instead
and exit gracefully.

Note: There have been previous attempts to fix this problem, but the
first committed solution had bad side effects and got reverted
(https://gitlab.com/qemu-project/qemu/-/issues/733). There was another
idea to fix it by QOM'ifying the related devices (see the commits around
23f6e3b11be74abae), but after having another close look at the problem,
I think this doesn't work either: For getting unique names in the
vmstate_register_ram() function, the devices need to return unique names
from the qdev_get_dev_path() function, and those ISA VGA devices don't
support that there (unlike PCI, ISA devices don't have a slot id ...
they could be distinguished by their I/O port base address, but all the
ISA VGA cards currently use the same address there, so that doesn't
work either). ==> So the very original idea of checking for the availability
of the "vga.vram" memory region still seems the only usable approach to
me right now. While the original patch by Jose R. Ziviani only fixed the
issue for the isa-vga device, I'm taking a more general approach now by
adding the fix in the vga_common_init() function, so that it works for
the isa-cirrus-vga device, too.

v2: Rework error handling in 2nd patch, vga_common_init() returns bool now

Thomas Huth (3):
  hw/display/cirrus_vga: Clean up indentation in
    pci_cirrus_vga_realize()
  hw/display: Allow vga_common_init() to return errors
  hw/display/vga: Report a proper error when adding a 2nd ISA VGA

 hw/display/vga_int.h        |  2 +-
 hw/display/ati.c            |  4 ++-
 hw/display/cirrus_vga.c     | 59 +++++++++++++++++++------------------
 hw/display/cirrus_vga_isa.c |  4 ++-
 hw/display/qxl.c            |  6 +++-
 hw/display/vga-isa.c        |  5 +++-
 hw/display/vga-mmio.c       |  5 +++-
 hw/display/vga-pci.c        |  8 +++--
 hw/display/vga.c            | 17 +++++++++--
 hw/display/virtio-vga.c     |  4 ++-
 hw/display/vmware_vga.c     |  2 +-
 11 files changed, 76 insertions(+), 40 deletions(-)

-- 
2.27.0


