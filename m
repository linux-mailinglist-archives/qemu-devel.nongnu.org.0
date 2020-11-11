Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDDD82AF746
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 18:18:18 +0100 (CET)
Received: from localhost ([::1]:59526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kctlB-000416-Sc
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 12:18:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kctjh-0002fR-8H
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 12:16:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kctja-0003XE-P5
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 12:16:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605114997;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=neAIYOiDAdAd61bwSE3GTcHWrRpH4Y2jS9HtvcVeHVM=;
 b=CqdLI56LgHcjeYW2DJhso0dxaCZa3cU611afNydZL5Wh6p1uDCbq4jyBtPus71ZxoHaLNI
 FtVsASl8diPiksT90sdfSf4bTGgbKkPQ4yluHQorQO8ShJrM5Fp9UL4kqa2higbUG/0eov
 EQ3y3qV1AvSx2/fi8zriPNSwgSLNGIU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-1-l_ictddIPaObHfTWmA3udw-1; Wed, 11 Nov 2020 12:16:33 -0500
X-MC-Unique: l_ictddIPaObHfTWmA3udw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5645A184217D;
 Wed, 11 Nov 2020 17:16:32 +0000 (UTC)
Received: from work-vm (ovpn-113-88.ams2.redhat.com [10.36.113.88])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 042F010013C0;
 Wed, 11 Nov 2020 17:16:24 +0000 (UTC)
Date: Wed, 11 Nov 2020 17:16:22 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: kraxel@redhat.com, sai.pavan.boddu@xilinx.com, marcandre.lureau@redhat.com
Subject: nec-usb-xhci migration breakage
Message-ID: <20201111171622.GI3232@work-vm>
MIME-Version: 1.0
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:49:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,
  Somewhere between 5.1.0 and 5.2.0-rc1 there's a migration breakage
on the nec-usb-xhci device:

[dgilbert@dgilbert-t580 try]$ ./x86_64-softmmu/qemu-system-x86_64 -M pc-q35-5.1 -device nec-usb-xhci -nographic -incoming tcp::4444
qemu-system-x86_64: get_pci_config_device: Bad config data: i=0x72 read: 88 device: 80 cmask: ff wmask: 71 w1cmask:0
qemu-system-x86_64: Failed to load PCIDevice:config
qemu-system-x86_64: Failed to load xhci:parent_obj
qemu-system-x86_64: error while loading state for instance 0x0 of device '0000:00:03.0/xhci'
qemu-system-x86_64: load of migration failed: Invalid argument

lspci is showing the MSI count ifferent, but I'm not sure if that's the
only problem or not:

5.1.0 showing:
[root@localhost ~]# lspci -v -s 00:03.0 -v
00:03.0 USB controller: NEC Corporation uPD720200 USB 3.0 Host Controller (rev 03) (prog-if 30 [XHCI])
        Subsystem: Red Hat, Inc. QEMU Virtual Machine
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR+ FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 23
        Region 0: Memory at febd4000 (64-bit, non-prefetchable) [size=16K]
        Capabilities: [90] MSI-X: Enable+ Count=16 Masked-
                Vector table: BAR=0 offset=00003000
                PBA: BAR=0 offset=00003800
        Capabilities: [a0] Express (v2) Root Complex Integrated Endpoint, MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0
                        ExtTag- RBE+
                DevCtl: CorrErr- NonFatalErr- FatalErr- UnsupReq-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
                        MaxPayload 128 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr- TransPend-
                DevCap2: Completion Timeout: Not Supported, TimeoutDis-, LTR-, OBFF Not Supported
                         AtomicOpsCap: 32bit- 64bit- 128bitCAS-
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR-, OBFF Disabled
                         AtomicOpsCtl: ReqEn-
        Capabilities: [70] MSI: Enable- Count=1/16 Maskable- 64bit+
                Address: 0000000000000000  Data: 0000
        Kernel driver in use: xhci_hcd
 
5.2.0rc1 showing
[root@localhost ~]# lspci -v -s 00:03.0 -v
00:03.0 USB controller: NEC Corporation uPD720200 USB 3.0 Host Controller (rev 03) (prog-if 30 [XHCI])
        Subsystem: Red Hat, Inc. QEMU Virtual Machine
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR+ FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 23
        Region 0: Memory at febd4000 (64-bit, non-prefetchable) [size=16K]
        Capabilities: [90] MSI-X: Enable+ Count=1 Masked-
                Vector table: BAR=0 offset=00003000
                PBA: BAR=0 offset=00003800
        Capabilities: [a0] Express (v2) Root Complex Integrated Endpoint, MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0
                        ExtTag- RBE+
                DevCtl: CorrErr- NonFatalErr- FatalErr- UnsupReq-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
                        MaxPayload 128 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr- TransPend-
                DevCap2: Completion Timeout: Not Supported, TimeoutDis-, LTR-, OBFF Not Supported
                         AtomicOpsCap: 32bit- 64bit- 128bitCAS-
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR-, OBFF Disabled
                         AtomicOpsCtl: ReqEn-
        Capabilities: [70] MSI: Enable- Count=1/1 Maskable- 64bit+
                Address: 0000000000000000  Data: 0000
        Kernel driver in use: xhci_hcd

I see there's quite a few differences in the output of info qtree for
the device.

Dave

-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


