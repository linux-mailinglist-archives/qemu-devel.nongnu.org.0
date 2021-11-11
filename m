Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67AF944D42B
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 10:38:23 +0100 (CET)
Received: from localhost ([::1]:47594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml6XF-0001tf-Hf
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 04:38:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ml6VP-0000ve-IT
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 04:36:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ml6VN-0005yz-IJ
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 04:36:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636623384;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=160JE9bA83uJnldDIUwa+cG1X5X3zgQ0q5li8+afg90=;
 b=IuQHF/ViKLdNMfRoN0NcApTQgreRNtjh94D07UguhvdkXgLEKq7AH6e4B9vnuFxE33+Toh
 vtEo+OVhUPgA8IQ6ObiFgEAj9VQvfx/I0bI/IWFqHPIgkeu/eAJGeVFBd8fl9Ws9WRKiou
 EqRL85W647BalLnPy2eHIXWjIgtlvhQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-10-JUR-1TVDNHyshW6fg--6ZQ-1; Thu, 11 Nov 2021 04:36:23 -0500
X-MC-Unique: JUR-1TVDNHyshW6fg--6ZQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3B9151006AA0;
 Thu, 11 Nov 2021 09:36:22 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.115])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6753B19C59;
 Thu, 11 Nov 2021 09:35:39 +0000 (UTC)
Date: Thu, 11 Nov 2021 09:35:37 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 0/6] RfC: try improve native hotplug for pcie root ports
Message-ID: <YYzj6Yizd+ESnoOE@redhat.com>
References: <20211011120504.254053-1-kraxel@redhat.com>
 <20211110065942-mutt-send-email-mst@kernel.org>
 <20211111075306.7dvpzewgclsddku6@sirius.home.kraxel.org>
 <20211111031646-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20211111031646-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
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
> 
> > I'd suggest to just revert to pcie native hotplug for 6.2.
> 
> Hmm that kind of change seems even riskier to me. I think I'll try with
> Igor's patches.

Why would it be risky ? PCIE native hotplug is what we've used in
QEMU for years & years, until 6.1 enabled the buggy ACPI hotplug.
The behaviour of the current PCIE native hotplug impl is a known
quantity.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


