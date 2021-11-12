Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A00D744E577
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 12:18:14 +0100 (CET)
Received: from localhost ([::1]:53684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlUZR-0007sz-Og
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 06:18:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mlUWx-0005GM-Hf
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 06:15:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mlUWv-000764-Nm
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 06:15:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636715737;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eFUJuemGpZi+MWRaqnbmU1c3l4SJA2ly6CZz2LQQdSo=;
 b=JTRVBT5nEPADU/nnpu1DUIi5TdVraXLFhbjLG9b68YHLXFiTlNS8njt2D1x+ip4eW4CbBp
 mVGywrvPHgPXbLLlFESQEY50K70neD3Fx+Ih0OjSUdI/9/DayO2O+Krwo9mt4b0GIWAWaA
 57cjuHL35MFz/kmVzPgd7Ao91etCOt8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-201-ka-kWVTcPuyRVq9LfawanA-1; Fri, 12 Nov 2021 06:15:34 -0500
X-MC-Unique: ka-kWVTcPuyRVq9LfawanA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 37EAA875047
 for <qemu-devel@nongnu.org>; Fri, 12 Nov 2021 11:15:33 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.245])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C641577E26;
 Fri, 12 Nov 2021 11:15:29 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1576718003BE; Fri, 12 Nov 2021 12:15:28 +0100 (CET)
Date: Fri, 12 Nov 2021 12:15:28 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 0/6] RfC: try improve native hotplug for pcie root ports
Message-ID: <20211112111528.i43jhiybvwc2eyfz@sirius.home.kraxel.org>
References: <20211011120504.254053-1-kraxel@redhat.com>
 <20211110065942-mutt-send-email-mst@kernel.org>
 <20211111075306.7dvpzewgclsddku6@sirius.home.kraxel.org>
 <20211111031646-mutt-send-email-mst@kernel.org>
 <20211111093425.6x2a37npcnnewdis@sirius.home.kraxel.org>
 <20211111120905.ozy5iucoqjhhoc72@sirius.home.kraxel.org>
 <20211111103354-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20211111103354-mutt-send-email-mst@kernel.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 11, 2021 at 10:39:59AM -0500, Michael S. Tsirkin wrote:
> On Thu, Nov 11, 2021 at 01:09:05PM +0100, Gerd Hoffmann wrote:
> >   Hi,
> > 
> > > When the acpihp driver is used the linux kernel will just call the aml
> > > methods and I suspect the pci device will stay invisible then because
> > > nobody flips the slot power control bit (with native-hotplug=on, for
> > > native-hotplug=off this isn't a problem of course).
> > 
> > Hmm, on a quick smoke test with both patch series (mine + igors) applied
> > everything seems to work fine on a quick glance.  Dunno why.  Maybe the
> > pcieport driver turns on slot power even in case pciehp is not active.

Digged deeper.  Updating power status is handled by the plug() callback,
which is never called in case acpi hotplug is active.  The guest seems
to never touch slot power control either, so it's working fine.  Still
feels a bit fragile though.

> Well power and hotplug capabilities are mostly unrelated, right?

At least they are separate slot capabilities.  The linux pciehp driver
checks whenever the power control is present before using it, so having
PwrCtrl- HotPlug+ seems to be a valid combination.

We even have an option for that: pcie-root-port.power_controller_present

So flipping that to off in case apci hotplug is active should make sure
we never run into trouble with pci devices being powered off.

Igor?  Can you add that to your patch series?

> I feel switching to native so late would be inappropriate, looks more
> like a feature than a bugfix. Given that - we need Igor's patches.
> Given that - would you say I should apply yours?

I think when setting power_controller_present=off for acpi hotplug it is
safe to merge both mine and igor's.

take care,
  Gerd


