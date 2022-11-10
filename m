Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D36762494C
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 19:23:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otCBN-0007Sx-67; Thu, 10 Nov 2022 13:21:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1otCB9-0007SB-RT
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 13:21:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1otCB7-0003bx-G9
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 13:21:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668104487;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dye2HRqbYklepOdnOZpCyEOOQfq7ul1v9T1uXSZOlaE=;
 b=bO10ywxQA5AKDtm4xsUn6O35W/+70yrMX4SginWXL1V56AtprUAtX6QFxqQcxtNVdki/ZY
 nWchcuAUQOMJoBhEZFOZlFWCwWlAE+hQr/4yGPJKXdZGzROODctzMsKFWBt5nWImLpvKZx
 eaH2xUam6kTpMIxn0Ppddtb8b4PTUTs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-255-EEd0P7xqN1WfI3vY9l1JMg-1; Thu, 10 Nov 2022 13:21:23 -0500
X-MC-Unique: EEd0P7xqN1WfI3vY9l1JMg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E27E7101A54E;
 Thu, 10 Nov 2022 18:21:22 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.115])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CD788C15BA8;
 Thu, 10 Nov 2022 18:21:18 +0000 (UTC)
Date: Thu, 10 Nov 2022 18:21:15 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ani Sinha <ani@anisinha.ca>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Richard W.M. Jones" <rjones@redhat.com>
Subject: Re: [PATCH 0/4] hw: make TCO watchdog actually work by default for Q35
Message-ID: <Y21BGzBD88sfmsQU@redhat.com>
References: <20221031131934.425448-1-berrange@redhat.com>
 <Y1/SoFxe3P2HVV3W@redhat.com>
 <20221031114835-mutt-send-email-mst@kernel.org>
 <20221101135724.7f89868c@fedora> <Y2EZFXOMR7sTDJGf@redhat.com>
 <20221110112700-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221110112700-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Nov 10, 2022 at 11:29:21AM -0500, Michael S. Tsirkin wrote:
> On Tue, Nov 01, 2022 at 01:03:17PM +0000, Daniel P. Berrangé wrote:
> > On Tue, Nov 01, 2022 at 01:57:24PM +0100, Igor Mammedov wrote:
> > > On Mon, 31 Oct 2022 11:48:58 -0400
> > > "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > > 
> > > > On Mon, Oct 31, 2022 at 01:50:24PM +0000, Daniel P. Berrangé wrote:
> > > > > On Mon, Oct 31, 2022 at 01:19:30PM +0000, Daniel P. Berrangé wrote:  
> > > > > > The TCO watchdog is unconditionally integrated into the Q35 machine
> > > > > > type by default, but at the same time is unconditionally disabled
> > > > > > from firing by a host config option that overrides guest OS attempts
> > > > > > to enable it. People have to know to set a magic -global to make
> > > > > > it non-broken  
> > > > > 
> > > > > Incidentally I found that originally the TCO watchdog was not
> > > > > unconditionally enabled. Its exposure to the guest could be
> > > > > turned on/off using
> > > > > 
> > > > >   -global ICH9-LPC.enable_tco=bool
> > > > > 
> > > > > This was implemented for machine type compat, but it also gave
> > > > > apps a way to disable the watchdog functionality. Unfortunately
> > > > > that ability was discarded in this series:
> > > > > 
> > > > >   https://lore.kernel.org/all/1453564933-29638-1-git-send-email-ehabkost@redhat.com/
> > > > > 
> > > > > but the 'enable_tco' property still exists in QOM, but silently
> > > > > ignored.
> > > > > 
> > > > > Seems we should either fix the impl of 'enable_tco', or remove the
> > > > > QOM property entirely, so we don't pretend it can be toggled anymore.
> > > > > 
> > > > > With regards,
> > > > > Daniel  
> > > > 
> > > > i am inclined to say you are right and the fix is to fix the impl.
> > > 
> > > Is there need for users to disable whatchdog at all?
> > > It was always present since then and no one complained, 
> > > so perhaps we should ditch property instead fixing it
> > > to keep it simple.
> > 
> > Thinking about it more, I think we should NOT fix the 'enable_tco' property,
> > because there will be no way for a mgmt appp to tell if they're using a
> > fixed or broken QEMU.
> 
> This is always the case for any bug. We don't as a rule add properties
> for this, it is distro's responsibility to pick bugfixes for
> features users care about.
> 
> What makes this bug different?

It is impossible to safely use the enable_tco property because it
will break ABI across live migrations between old and new QEMU.
If it was a recent bug I'd be ok with just fixing it. Since this
property has been broken for 6 years though, IMHO it just needs
to be deleted entirely.

> > So if they use 'enable_tco' on a broken QEMU and then
> > live migrate, they'll get an guest ABI change. If we did want to support
> > disabling it, then we should have a brand new property that apps can probe
> > for.
> > 
> > In the absence of a request to disable watchdog, I'd say we just delete
> > 'enable_tco' right now. If someone wants it in future, we can add it with
> > a new name.
> 
> I am really stressed about watchdog firing and resetting VMs that previously
> were working fine. Adding this without a safety mechanism to quickly
> disable in case of problems in the field is not wise imho.

We would only toggle the ICH9-LPC.noreboot flag for new machine types, so
wouldn't affect existing VMs, and if anyone has a problem they can explicitly
set ICH9-LPC.noreboot back to true, or pick the older machine type again.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


