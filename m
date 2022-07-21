Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 846BC57D163
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 18:21:51 +0200 (CEST)
Received: from localhost ([::1]:39622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEYvu-0003Gw-3q
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 12:21:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oEYmf-0008H6-3j
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 12:12:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oEYmY-0002T4-U1
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 12:12:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658419929;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sMss3eXyf/u8yhq4Lv5ncQwVaareB7wwCo/6e9I5p4E=;
 b=Fn/HmokaJ4lr/PwTGkYI/dUNFMZ7TYfpukyXAQPec6oOS7GxN3EtGikEVvwRlQGvf/0zPO
 BM+OAlaE9+MDqiXbqWn9OLTsh3pdSDsI72TlC3532Rec1qpFEXByvX/bkHQA0Yq080B5MW
 px3UbXier3s03Emwkf6MlACq+IzsafM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-513-FomhUODUMumVXOqTBfPZCw-1; Thu, 21 Jul 2022 12:12:06 -0400
X-MC-Unique: FomhUODUMumVXOqTBfPZCw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3B7CC1C05EAA;
 Thu, 21 Jul 2022 16:12:06 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D30682026D64;
 Thu, 21 Jul 2022 16:12:04 +0000 (UTC)
Date: Thu, 21 Jul 2022 17:12:02 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: Roman Kagan <rvkagan@yandex-team.ru>, qemu-devel@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 yc-core@yandex-team.ru, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v3] hw/pci/pci_bridge: ensure PCIe slots have only one slot
Message-ID: <Ytl60qIaIIW5ngh8@redhat.com>
References: <20220720102555.874394-1-rvkagan@yandex-team.ru>
 <Ytfcivbtj8+JnLfz@redhat.com> <YtfgQN+BQ8Egn0ha@rvkaganb>
 <5bc2fcee-2c5d-c400-5992-e2b4ce828477@ilande.co.uk>
 <Ytlii7t0rERVJBXo@rvkaganb>
 <f85ae904-4a31-141d-17dd-43c5a27d9b07@ilande.co.uk>
 <Ytl3SKpbnp8Twtkq@redhat.com>
 <9a3f311e-398e-c36f-a1d2-33c23aa163dc@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9a3f311e-398e-c36f-a1d2-33c23aa163dc@ilande.co.uk>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 21, 2022 at 05:05:38PM +0100, Mark Cave-Ayland wrote:
> On 21/07/2022 16:56, Daniel P. Berrangé wrote:
> 
> > On Thu, Jul 21, 2022 at 04:51:51PM +0100, Mark Cave-Ayland wrote:
> > > On 21/07/2022 15:28, Roman Kagan wrote:
> > > 
> > > (lots cut)
> > > 
> > > > In the guest (Fedora 34):
> > > > 
> > > > [root@test ~]# lspci -tv
> > > > -[0000:00]-+-00.0  Intel Corporation 82G33/G31/P35/P31 Express DRAM Controller
> > > >              +-01.0  Device 1234:1111
> > > >              +-02.0  Red Hat, Inc. QEMU XHCI Host Controller
> > > >              +-05.0-[01]----00.0  Red Hat, Inc. Virtio block device
> > > >              +-05.1-[02]----00.0  Red Hat, Inc. Virtio network device
> > > >              +-05.2-[03]--
> > > >              +-05.3-[04]--
> > > >              +-1f.0  Intel Corporation 82801IB (ICH9) LPC Interface Controller
> > > >              \-1f.3  Intel Corporation 82801I (ICH9 Family) SMBus Controller
> > > > 
> > > > Changing addr of the second disk from 4 to 0 makes it appear in the
> > > > guest.
> > > > 
> > > > What exactly do you find odd?
> > > 
> > > Thanks for this, the part I wasn't sure about was whether the device ids in
> > > the command line matched the primary PCI bus or the secondary PCI bus.
> > > 
> > > In that case I suspect that the enumeration of non-zero PCIe devices fails
> > > in Linux because of the logic here:
> > > https://github.com/torvalds/linux/blob/master/drivers/pci/probe.c#L2622.
> > 
> > Just above that though is logic that handles 'pci=pcie_scan_all'
> > kernel parameter, to make it look for non-zero devices.
> > 
> > > I don't have a copy of the PCIe specification, but assuming the comment is
> > > true then your patch looks correct to me. I think it would be worth adding a
> > > similar comment and reference to your patch to explain why the logic is
> > > required, which should also help the PCI maintainers during review.
> > 
> > The docs above with the pci=pcie_scan_all suggest it is unusual but not
> > forbidden.
> 
> That's interesting as I read it completely the other way around, i.e. PCIe
> downstream ports should only have device 0 and the PCI_SCAN_ALL_PCIE_DEVS
> flag is there for broken/exotic hardware :)

If someone wants to test their guest OS on exotic hardware configs,
shouldn't QEMU let them make such a configuration ? Reproducing
unsual hardware configs when you don't have physical access to real
hardware is one of the benefits of having QEMU available.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


