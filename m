Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6E9429DFB
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 08:49:16 +0200 (CEST)
Received: from localhost ([::1]:37632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maBb8-0005tr-7R
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 02:49:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1maBYi-0003rX-LX
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 02:46:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1maBYh-0005bP-4A
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 02:46:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634021202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=t5xlvLfXsSxxADozr+p/jByUUV4wSsA9ZgVNKxJMvn8=;
 b=Ifc1DnprAfWZLdsnatmXIxrTcwOSiL9z5/CgFYbtwOwgEmMlcj2eEkYmEdbwJGDNeZ8AyB
 JUVj52Dy6eVDQo6Lyg0lLBnERZbkr6z32EMUmV489mL3UoLN7qFs+tHAGDgOOGTeLmLm99
 NanlF0R92k9IiwLmUmra/geprhLuPsc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-49-niHkzppkM8y03R9HExkFew-1; Tue, 12 Oct 2021 02:46:41 -0400
X-MC-Unique: niHkzppkM8y03R9HExkFew-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2C67E100C628;
 Tue, 12 Oct 2021 06:46:40 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E9B6060877;
 Tue, 12 Oct 2021 06:46:39 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3EAB01800393; Tue, 12 Oct 2021 08:46:38 +0200 (CEST)
Date: Tue, 12 Oct 2021 08:46:38 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 5/6] pcie: fast unplug when slot power is off
Message-ID: <20211012064638.6xxdoa6zk62u4gwu@sirius.home.kraxel.org>
References: <20211011120504.254053-1-kraxel@redhat.com>
 <20211011120504.254053-6-kraxel@redhat.com>
 <20211012014700-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20211012014700-mutt-send-email-mst@kernel.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 12, 2021 at 01:56:31AM -0400, Michael S. Tsirkin wrote:
> On Mon, Oct 11, 2021 at 02:05:03PM +0200, Gerd Hoffmann wrote:
> > In case the slot is powered off (and the power indicator turned off too)
> > we can unplug right away, without round-trip to the guest.
> > 
> > Also clear pending attention button press, there is nothing to care
> > about any more.
> > 
> > Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> > ---
> >  hw/pci/pcie.c | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> > 
> > diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
> > index 70fc11ba4c7d..f3ac04399969 100644
> > --- a/hw/pci/pcie.c
> > +++ b/hw/pci/pcie.c
> > @@ -561,6 +561,16 @@ void pcie_cap_slot_unplug_request_cb(HotplugHandler *hotplug_dev,
> >          return;
> >      }
> >  
> > +    if (((sltctl & PCI_EXP_SLTCTL_PIC) == PCI_EXP_SLTCTL_PWR_IND_OFF) &&
> > +        ((sltctl & PCI_EXP_SLTCTL_PCC) == PCI_EXP_SLTCTL_PWR_OFF)) {
> > +        /* slot is powered off -> unplug without round-trip to the guest */
> > +        pcie_cap_slot_do_unplug(hotplug_pdev);
> > +        hotplug_event_notify(hotplug_pdev);
> > +        pci_word_test_and_clear_mask(exp_cap + PCI_EXP_SLTSTA,
> > +                                     PCI_EXP_SLTSTA_ABP);
> 
> Does this handle all the things including link status etc btw?
> I don't remember off-hand.

Yes.  See patch #4 which moves the relevant code to the new
pcie_cap_slot_do_unplug() helper.

take care,
  Gerd


