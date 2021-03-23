Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AEC8346772
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 19:21:24 +0100 (CET)
Received: from localhost ([::1]:37414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOled-0007bv-AZ
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 14:21:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lOkTx-0006u7-GW
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 13:06:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lOkTv-0001JE-8v
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 13:06:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616519172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lxVNBOYuJhjKpcc6/yymbwLjPqHXeb5xp2XND5KhKxA=;
 b=c9u7UKIyAqFaxqoZ5QliITtvoiHLKDD9eiJvwn8ymxTE7E3NPisJpvYAc9NeAYcEzWohRa
 ZZKYkoBGPPacWVe2ML2ItzAlZvjitdYm2OjhXSUOcPw4XozV+ogOFGYCuum3EQvAkF5qwW
 yCFuDV/EfK/8uw4zDyFt0z23o+/5Jek=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-fU_iqnyANXGiiSoWfwk_QQ-1; Tue, 23 Mar 2021 13:06:10 -0400
X-MC-Unique: fU_iqnyANXGiiSoWfwk_QQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 345EB107AFF7;
 Tue, 23 Mar 2021 17:06:09 +0000 (UTC)
Received: from localhost (unknown [10.40.208.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 712831972B;
 Tue, 23 Mar 2021 17:06:04 +0000 (UTC)
Date: Tue, 23 Mar 2021 18:06:02 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PULL 00/20] pc,virtio,pci: fixes, features
Message-ID: <20210323180602.5bb8a7b9@redhat.com>
In-Reply-To: <20210323101325-mutt-send-email-mst@kernel.org>
References: <20210322154417.524229-1-mst@redhat.com>
 <CAFEAcA9xniNP73rbFLc_eUB2vi2N71vM2xKRMzqGWjXLEeLVag@mail.gmail.com>
 <CAFEAcA81p5aDj9CzuihLchX3QQB27Z7Jd6cNF9uo-2rh7EXx=w@mail.gmail.com>
 <20210322185502-mutt-send-email-mst@kernel.org>
 <CAFEAcA-Kzt+y8r-6sms6Q6N3GHuDhpfc3cWL0gDoSej3bP5z-A@mail.gmail.com>
 <20210323101325-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
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
Cc: Isaku Yamahata <isaku.yamahata@intel.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 23 Mar 2021 10:13:58 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

CCing Philippe,

maybe he has an idea how to fix it from mips side.

> On Tue, Mar 23, 2021 at 10:50:05AM +0000, Peter Maydell wrote:
> > On Mon, 22 Mar 2021 at 22:56, Michael S. Tsirkin <mst@redhat.com> wrote:  
> > > On Mon, Mar 22, 2021 at 06:46:06PM +0000, Peter Maydell wrote:  
> > > > This happens because pm_update_sci() calls pci_irq_handler(),
> > > > which calls pci_intx(pci_dev), which returns -1, which is not
> > > > a valid interrupt number to call pci_irq_handler() with.
> > > >
> > > > Q: given that pci_irq_handler() says it must only be called with
> > > > an irqnum in [0..3], shouldn't pci_set_irq() be a bit more
> > > > cautious than to pull a byte directly out of PCI_INTERRUPT_PIN
> > > > and assume it's valid? (Is this guest-writable, or is it read-only?)  
> > >
> > > It's read-only.  
> > 
> > Ah, so if a device model (a) doesn't set the value to a correct
> > interrupt number and then (b) triggers an interrupt for itself,
> > then that's a device model bug ? It might be worth assert()ing
> > that the irqnum is valid, just to catch this kind of bug a bit
> > more obviously.
> > 
> > thanks
> > -- PMM  
> 
> Sure, we can do this. Patch?
> 


