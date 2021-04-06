Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C6D355BEE
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 21:04:16 +0200 (CEST)
Received: from localhost ([::1]:48144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTqzn-0000AU-Ex
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 15:04:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lTqyZ-0007o5-72
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 15:02:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lTqyW-00026z-CO
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 15:02:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617735775;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wmVtymWynnbJvO/wgGLXDI0g2WBDxhlqZBgUykBm9S0=;
 b=GxeSXCxVJghXcHTOOUMshAmX3PC8c6spfjrJoX240BykvCLuEH8/dJIIRKO0aT7QOI1Ajz
 iJY3SFGnRmFY3ZFs5+sh5vf/Vi5z29d8U7XbyXYDtrJ3L2dJmw2hPQmWZ64q1/qRZrSWf9
 n29gBtFi+vCKJr8vzEl05j7Wnpkkqd0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-WQGBMV42NE21m9VxziJ8CQ-1; Tue, 06 Apr 2021 15:02:52 -0400
X-MC-Unique: WQGBMV42NE21m9VxziJ8CQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 664641008541;
 Tue,  6 Apr 2021 19:02:51 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.193.185])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D9EF150A98;
 Tue,  6 Apr 2021 19:02:46 +0000 (UTC)
Date: Tue, 6 Apr 2021 21:02:44 +0200
From: Andrew Jones <drjones@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v3] hw/smbios: support for type 41 (onboard devices
 extended information)
Message-ID: <20210406190244.ti4rrzkxx77ciu2a@kamzik.brq.redhat.com>
References: <20210401122658.37842-1-vincent@bernat.ch>
 <20210401225846.411ebd76@redhat.com> <m37dllk939.fsf@bernat.ch>
 <20210401233225.16e572e4@redhat.com>
 <20210406074250.hsmm5yrzhfxdwjs4@kamzik.brq.redhat.com>
 <20210406203613.01cdf294@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210406203613.01cdf294@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Vincent Bernat <vincent@bernat.ch>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 06, 2021 at 08:36:13PM +0200, Igor Mammedov wrote:
> On Tue, 6 Apr 2021 09:42:50 +0200
> Andrew Jones <drjones@redhat.com> wrote:
> 
> > On Thu, Apr 01, 2021 at 11:32:25PM +0200, Igor Mammedov wrote:
> > > On Thu, 01 Apr 2021 23:07:06 +0200
> > > Vincent Bernat <vincent@bernat.ch> wrote:
> > >   
> > > >  ❦  1 avril 2021 22:58 +02, Igor Mammedov:
> > > >   
> > > > >> This can be invoked with:
> > > > >> 
> > > > >>     $QEMU -netdev user,id=internet
> > > > >>           -device virtio-net-pci,mac=50:54:00:00:00:42,netdev=internet,id=internet-dev \
> > > > >>           -smbios type=41,designation='Onboard LAN',instance=1,kind=ethernet,pcidev=internet-dev    
> > > > >
> > > > > an ACPI alternative was merged recently (current master).
> > > > > assigning 'designation=' wasn't implemented there, but important part
> > > > > of giving users control over PCI devices 'eno' index is implemented.
> > > > >
> > > > > When I looked into the issue, smbios way was a bit over-kill for the task
> > > > > and didn't really work if hotplug were used.
> > > > >
> > > > > See, for example how to use new feature:
> > > > >  https://www.mail-archive.com/qemu-devel@nongnu.org/msg794164.html    
> > > > 
> > > > It seems simpler this way. I don't think my patch is needed then.  
> > > 
> > > SMBIOS ways is fine for static configs where no hot-plug is involved.
> > > Also potentially SMBIOS way may be used by arm/virt board,
> > > since acpi-index shares a lot with ACPI PCI hotplug infrastructure
> > > and we haven't ported that to arm/virt impl. yet.
> > > 
> > > It also won't work for Q35 at the moment, but Julia is working
> > > on adding support for ACPI PCI hotplug to it, and once it arrives
> > > acpi-index will become available there.
> > > 
> > > Perhaps we should also add support for ACPI PCI hotplug to virt/arm,
> > > along with Q35.
> > >  
> > 
> > What's required of the guest kernel for ACPI PCI hotplug? If there are
> > arch-specific aspects to that, then do we know if Linux for AArch64
> > has the support?
> 
> I could only guess, it could be just a matter turning on HOTPLUG_PCI_ACPI
> in Kconfig.

Thanks for the pointer. It looks like it might be worth experimenting with
that


commit 23237ef3725de6e4f6f68cf11ae7cb52f8a5d60e
Author: Timur Tabi <timur@codeaurora.org>
Date:   Wed Jun 21 12:30:43 2017 -0500

    arm64: defconfig: enable support for PCIe hotplug
    
    Some ARM64 server systems support PCIe hotplug, so enable the options
    for that.
    
    Signed-off-by: Timur Tabi <timur@codeaurora.org>
    Signed-off-by: Arnd Bergmann <arnd@arndb.de>

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 71d77d2d69e0..41f827393651 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -61,7 +61,10 @@ CONFIG_ARCH_XGENE=y
 CONFIG_ARCH_ZX=y
 CONFIG_ARCH_ZYNQMP=y
 CONFIG_PCI=y
+CONFIG_HOTPLUG_PCI_PCIE=y
 CONFIG_PCI_IOV=y
+CONFIG_HOTPLUG_PCI=y
+CONFIG_HOTPLUG_PCI_ACPI=y
 CONFIG_PCI_LAYERSCAPE=y
 CONFIG_PCI_HISI=y
 CONFIG_PCIE_QCOM=y


