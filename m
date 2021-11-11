Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDCE944D425
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 10:36:06 +0100 (CET)
Received: from localhost ([::1]:45036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml6V4-0008WS-2O
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 04:36:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ml6Tc-000788-MM
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 04:34:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ml6Ta-0005dN-9Y
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 04:34:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636623273;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/A0e8sqTTVqXs19t0B6uw2o9ZNG04kn7VsmlRaQILFk=;
 b=D6oGl22ugxigifeoV4AA2/4AJhrWIn77mIhByTJh13Zi2v8Hl1NQY2cyCZkGcNdGKFoNFq
 pfoOv+GT/JL3Nh88Nv6PlWktwLjKTot5DrWWkjL+a7c3SOzeK1bvPr7Do8mJrGxu8BfRMB
 YjfpSSvDGBDr2N4cCsjcweCIi4+wvtA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-126-oxdhNOCyPEmKbUqDzafy_A-1; Thu, 11 Nov 2021 04:34:30 -0500
X-MC-Unique: oxdhNOCyPEmKbUqDzafy_A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C84E21023F4F;
 Thu, 11 Nov 2021 09:34:29 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.245])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 22BA65D6D7;
 Thu, 11 Nov 2021 09:34:27 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 639B41800925; Thu, 11 Nov 2021 10:34:25 +0100 (CET)
Date: Thu, 11 Nov 2021 10:34:25 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 0/6] RfC: try improve native hotplug for pcie root ports
Message-ID: <20211111093425.6x2a37npcnnewdis@sirius.home.kraxel.org>
References: <20211011120504.254053-1-kraxel@redhat.com>
 <20211110065942-mutt-send-email-mst@kernel.org>
 <20211111075306.7dvpzewgclsddku6@sirius.home.kraxel.org>
 <20211111031646-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20211111031646-mutt-send-email-mst@kernel.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 11, 2021 at 03:20:07AM -0500, Michael S. Tsirkin wrote:
> On Thu, Nov 11, 2021 at 08:53:06AM +0100, Gerd Hoffmann wrote:
> >   Hi,
> > 
> > > Given it's a bugfix, and given that I hear through internal channels
> > > that QE results so far have been encouraging, I am inclined to bite the
> > > bullet and merge this for -rc1.
> > 
> > Fine with me.
> > 
> > > I don't think this conflicts with Julia's patches as users can still
> > > disable ACPI hotplug into bridges.  Gerd, agree?  Worth the risk?
> > 
> > Combining this with Julia's patches looks a bit risky to me and surely
> > needs testing.  I expect the problematic case is both native and acpi
> > hotplug being enabled.
> >  When the guest uses acpi hotplug nobody will
> > turn on slot power on the pcie root port ...
> 
> I'm not sure I understand what the situation is, and how to trigger it.
> Could you clarify pls?

My patch series implements proper slot power emulation for pcie root
ports, i.e. the pci device plugged into the slot is only visible to
the guest when slot power is enabled.

When the pciehp driver is used the linux kernel will enable slot power
of course.

When the acpihp driver is used the linux kernel will just call the aml
methods and I suspect the pci device will stay invisible then because
nobody flips the slot power control bit (with native-hotplug=on, for
native-hotplug=off this isn't a problem of course).

> > I'd suggest to just revert to pcie native hotplug for 6.2.
> 
> Hmm that kind of change seems even riskier to me.

It's not clear to me why you consider that riskier.  It should fix the
qemu 6.1 regressions.  Given QE has found no problems so far it should
not be worse than qemu 6.0 was.  Most likely it will work better than
qemu 6.0.

Going with a new approach (enable both native and acpi hotplug) after
freeze looks risky to me, even without considering the conflict outlined
above.  Last-minute changes with the chance to repeat the 6.1 disaster,
only with a different set of bugs ...

take care,
  Gerd


