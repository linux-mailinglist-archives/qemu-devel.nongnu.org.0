Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD992192D2
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jul 2020 23:49:35 +0200 (CEST)
Received: from localhost ([::1]:46072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jtHwc-000701-Oh
	for lists+qemu-devel@lfdr.de; Wed, 08 Jul 2020 17:49:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jtHcn-0001tt-1G
 for qemu-devel@nongnu.org; Wed, 08 Jul 2020 17:29:05 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:50093
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jtHck-0002Dw-VZ
 for qemu-devel@nongnu.org; Wed, 08 Jul 2020 17:29:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594243742;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=ZyzIDNY4Nu4V8KRrDsUwGSVG/honpTANn9xBf5AA7bA=;
 b=VgzCLr8fKtpvyWWDotBEFKRbGBeBsqwKDsFl8L/wYF8QK6ZxyG9zn4SP/Wup/K8e3H2zNi
 WEcKinTpwrFnydfg9jG4N1ABlaSjEsCc6FlaNQap0wTTIs/F5azZ43je+jUhiRoFTI6z4E
 CYXeQ12d99ON+6nQPY0c37vin0JgJR8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-TleON2iKOAab0dmPomP5JQ-1; Wed, 08 Jul 2020 13:27:13 -0400
X-MC-Unique: TleON2iKOAab0dmPomP5JQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 001EC107B7C4;
 Wed,  8 Jul 2020 17:27:12 +0000 (UTC)
Received: from redhat.com (unknown [10.36.110.36])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7EE5C724A0;
 Wed,  8 Jul 2020 17:26:56 +0000 (UTC)
Date: Wed, 8 Jul 2020 18:26:53 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH 2/2] x86/cpu: Handle GUEST_MAXPHYADDR < HOST_MAXPHYADDR
 for hosts that don't support it
Message-ID: <20200708172653.GL3229307@redhat.com>
References: <20200619155344.79579-1-mgamal@redhat.com>
 <20200619155344.79579-3-mgamal@redhat.com>
 <20200708171621.GA780932@habkost.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200708171621.GA780932@habkost.net>
User-Agent: Mutt/1.14.3 (2020-06-14)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Received-SPF: pass client-ip=207.211.31.81; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/07 17:25:09
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: mtosatti@redhat.com, Pedro Principeza <pedro.principeza@canonical.com>,
 kvm@vger.kernel.org, libvir-list@redhat.com,
 Dann Frazier <dann.frazier@canonical.com>,
 Guilherme Piccoli <gpiccoli@canonical.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Christian Ehrhardt <christian.ehrhardt@canonical.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, pbonzini@redhat.com,
 Mohammed Gamal <mgamal@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 fw@gpiccoli.net, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 08, 2020 at 01:16:21PM -0400, Eduardo Habkost wrote:
> (CCing libvir-list, and people who were included in the OVMF
> thread[1])
> 
> [1] https://lore.kernel.org/qemu-devel/99779e9c-f05f-501b-b4be-ff719f140a88@canonical.com/
> 
> On Fri, Jun 19, 2020 at 05:53:44PM +0200, Mohammed Gamal wrote:
> > If the CPU doesn't support GUEST_MAXPHYADDR < HOST_MAXPHYADDR we
> > let QEMU choose to use the host MAXPHYADDR and print a warning to the
> > user.
> > 
> > Signed-off-by: Mohammed Gamal <mgamal@redhat.com>
> > ---
> >  target/i386/cpu.c | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> > 
> > diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> > index b1b311baa2..91c57117ce 100644
> > --- a/target/i386/cpu.c
> > +++ b/target/i386/cpu.c
> > @@ -6589,6 +6589,17 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
> >              uint32_t host_phys_bits = x86_host_phys_bits();
> >              static bool warned;
> >  
> > +	    /*
> > +	     * If host doesn't support setting physical bits on the guest,
> > +	     * report it and return
> > +	     */
> > +	    if (cpu->phys_bits < host_phys_bits &&
> > +		!kvm_has_smaller_maxphyaddr()) {
> > +		warn_report("Host doesn't support setting smaller phys-bits."
> > +			    " Using host phys-bits\n");
> > +		cpu->phys_bits = host_phys_bits;
> > +	    }
> > +
> 
> This looks like a regression from existing behavior.  Today,
> using smaller phys-bits doesn't crash most guests, and still
> allows live migration to smaller hosts.  I agree using the host
> phys-bits is probably a better default, but we shouldn't override
> options set explicitly in the command line.

Yeah, this looks like it would cause a behaviour change / regression
so looks questionable.

> Also, it's important that we work with libvirt and management
> software to ensure they have appropriate APIs to choose what to
> do when a cluster has hosts with different MAXPHYADDR.

There's been so many complex discussions that it is hard to have any
understanding of what we should be doing going forward. There's enough
problems wrt phys bits, that I think we would benefit from a doc that
outlines the big picture expectation for how to handle this in the
virt stack.

As mentioned in the thread quoted above, using host_phys_bits is a
obvious thing to do when the user requested "-cpu host".

The harder issue is how to handle other CPU models. I had suggested
we should try associating a phys bits value with them, which would
probably involve creating Client/Server variants for all our CPU
models which don't currently have it. I still think that's worth
exploring as a strategy and with versioned CPU models we should
be ok wrt back compatibility with that approach.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


