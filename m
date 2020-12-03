Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 558E82CD4C8
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 12:43:07 +0100 (CET)
Received: from localhost ([::1]:44726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkn0s-0000Zw-Dh
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 06:43:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kkmyD-00065W-Ni
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 06:40:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kkmyA-0000fJ-NR
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 06:40:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606995617;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VPX7lG5mBgBlD5Ubax/47v/48H3FYpQ2dw38/rGD7Cs=;
 b=KixfA8/s/9iWtkeyMZtZMygi1GkjM/pCMB+ttH6GSa122FTYypzeJdWVcwGci1n1Y0gtSF
 nR9dk/KkRABYfbqqML7NCUYkoWraw3Sd2hMIcN+iXJmYtOtGCO9xLcSaoZdLrjE+a8y6uM
 sex+6JOyqF3GwG40VSjfTFcwku9rh9Q=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-253-sMSR3ls_M1ekFo3PCoM2Tw-1; Thu, 03 Dec 2020 06:40:16 -0500
X-MC-Unique: sMSR3ls_M1ekFo3PCoM2Tw-1
Received: by mail-wr1-f72.google.com with SMTP id n1so1106688wro.22
 for <qemu-devel@nongnu.org>; Thu, 03 Dec 2020 03:40:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=VPX7lG5mBgBlD5Ubax/47v/48H3FYpQ2dw38/rGD7Cs=;
 b=TNVnqfNiLVJKRJ06+UznUw764G7XJ3e1O56LVgalkBC0DrzPAd+9CEnciXYN2ieL24
 H64y8VQlgEugIxKdOFn1qmSxdkARnhacR2iimixaWQldhcQ17oIivTUUlAITrllBQvc+
 rouCkHpwjj/wGq1yuWNJYB0a6od1Xicbo4jrn0UhRARcL8BQ8AZay7yGNZ05pyVrV+6A
 kWdcrax4jSaWY6fHgFbl1jc21UU1PzooOLPIgZXrdM1zwLfQqVh4EWYopfyKC5xtJX1Y
 GDOutvxYRV3voIic3hY+DXJevOoyL+w2cky7kSvlI3IiD6/ujVOZQ+FYbTJlKRog3v94
 q1eg==
X-Gm-Message-State: AOAM531KIRWsuofycUhxxZyrRsWKWEsKasTC7hKuyVLpMzl6ewFVKdqx
 z6wfmHGFJ8gBUeyP+N9wYj73ygARmS0dFg0Zp+4xHztVbSp2ByVcYaxr4ZpeE4GxB7AxKZtMlr2
 hJMze4D2V7JgnBig=
X-Received: by 2002:a5d:488b:: with SMTP id g11mr3344501wrq.210.1606995614879; 
 Thu, 03 Dec 2020 03:40:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzPBbr0ZMTnTyLm0HpQp3dL7wK2wXT7uzKb2Gn+xAJg3GcW0yTn53nLBxWzPM73l+rMD4at3w==
X-Received: by 2002:a5d:488b:: with SMTP id g11mr3344473wrq.210.1606995614639; 
 Thu, 03 Dec 2020 03:40:14 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id x25sm1108318wmc.3.2020.12.03.03.40.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Dec 2020 03:40:13 -0800 (PST)
Date: Thu, 3 Dec 2020 06:40:11 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH v2 01/27] migration: Network Failover can't work with a
 paused guest
Message-ID: <20201203063452-mutt-send-email-mst@kernel.org>
References: <20201202053111-mutt-send-email-mst@kernel.org>
 <20201202053219-mutt-send-email-mst@kernel.org>
 <87mtywlbvq.fsf@secure.mitica>
 <20201202105515.GD2360260@redhat.com>
 <20201202061641-mutt-send-email-mst@kernel.org>
 <20201202112639.GE2360260@redhat.com>
 <20201202063656-mutt-send-email-mst@kernel.org>
 <20201202120121.GF2360260@redhat.com>
 <20201203061907-mutt-send-email-mst@kernel.org>
 <20201203113253.GD2952498@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201203113253.GD2952498@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 03, 2020 at 11:32:53AM +0000, Daniel P. Berrangé wrote:
> On Thu, Dec 03, 2020 at 06:21:47AM -0500, Michael S. Tsirkin wrote:
> > On Wed, Dec 02, 2020 at 12:01:21PM +0000, Daniel P. Berrangé wrote:
> > > On Wed, Dec 02, 2020 at 06:37:46AM -0500, Michael S. Tsirkin wrote:
> > > > On Wed, Dec 02, 2020 at 11:26:39AM +0000, Daniel P. Berrangé wrote:
> > > > > On Wed, Dec 02, 2020 at 06:19:29AM -0500, Michael S. Tsirkin wrote:
> > > > > > On Wed, Dec 02, 2020 at 10:55:15AM +0000, Daniel P. Berrangé wrote:
> > > > > > > On Wed, Dec 02, 2020 at 11:51:05AM +0100, Juan Quintela wrote:
> > > > > > > > "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > > > > > > > > On Wed, Dec 02, 2020 at 05:31:53AM -0500, Michael S. Tsirkin wrote:
> > > > > > > > >> On Wed, Dec 02, 2020 at 10:27:18AM +0000, Daniel P. BerrangÃƒÂ© wrote:
> > > > > > > > >> > On Wed, Dec 02, 2020 at 05:13:18AM -0500, Michael S. Tsirkin wrote:
> > > > > > > > >> > > On Wed, Nov 18, 2020 at 09:37:22AM +0100, Juan Quintela wrote:
> > > > > > > > >> > > > If we have a paused guest, it can't unplug the network VF device, so
> > > > > > > > >> > > > we wait there forever.  Just change the code to give one error on that
> > > > > > > > >> > > > case.
> > > > > > > > >> > > > 
> > > > > > > > >> > > > Signed-off-by: Juan Quintela <quintela@redhat.com>
> > > > > > > > >> > > 
> > > > > > > > >> > > It's certainly possible but it's management that created
> > > > > > > > >> > > this situation after all - why do we bother to enforce
> > > > > > > > >> > > a policy? It is possible that management will unpause immediately
> > > > > > > > >> > > afterwards and everything will proceed smoothly.
> > > > > > > > >> > > 
> > > > > > > > >> > > Yes migration will not happen until guest is
> > > > > > > > >> > > unpaused but the same it true of e.g. a guest that is stuck
> > > > > > > > >> > > because of a bug.
> > > > > > > > >> > 
> > > > > > > > >> > That's pretty different behaviour from how migration normally handles
> > > > > > > > >> > a paused guest, which is that it is guaranteed to complete the migration
> > > > > > > > >> > in as short a time as network bandwidth allows.
> > > > > > > > >> > 
> > > > > > > > >> > Just ignoring the situation I think will lead to surprise apps / admins,
> > > > > > > > >> > because the person/entity invoking the migration is not likely to have
> > > > > > > > >> > checked wether this particular guest uses net failover or not before
> > > > > > > > >> > invoking - they'll just be expecting a paused migration to run fast and
> > > > > > > > >> > be guaranteed to complete.
> > > > > > > > >> > 
> > > > > > > > >> > Regards,
> > > > > > > > >> > Daniel
> > > > > > > > >> 
> > > > > > > > >> Okay I guess. But then shouldn't we handle the reverse situation too:
> > > > > > > > >> pausing guest after migration started but before device was
> > > > > > > > >> unplugged?
> > > > > > > > >> 
> > > > > > > > >
> > > > > > > > > Thinking of which, I have no idea how we'd handle it - fail
> > > > > > > > > pausing guest until migration is cancelled?
> > > > > > > > >
> > > > > > > > > All this seems heavy handed to me ...
> > > > > > > > 
> > > > > > > > This is the minimal fix that I can think of.
> > > > > > > > 
> > > > > > > > Further solution would be:
> > > > > > > > - Add a new migration parameter: migrate-paused
> > > > > > > > - change libvirt to use the new parameter if it exist
> > > > > > > > - in qemu, when we do start migration (but after we wait for the unplug
> > > > > > > >   device) paused the guest before starting migration and resume it after
> > > > > > > >   migration finish.
> > > > > > > 
> > > > > > > It would also have to handle issuing of paused after migration has
> > > > > > > been started - delay the pause request until the nuplug is complete
> > > > > > > is one answer.
> > > > > > 
> > > > > > Hmm my worry would be that pausing is one way to give cpu
> > > > > > resources back to host. It's problematic if guest can delay
> > > > > > that indefinitely.
> > > > > 
> > > > > hmm, yes, that is awkward.  Perhaps we should just report an explicit
> > > > > error then.
> > > > 
> > > > Report an error in response to which command? Do you mean
> > > > fail migration?
> > > 
> > > If mgt attempt to pause an existing migration that hasn't finished
> > > the PCI unplug stage, then fail the pause request.
> > 
> > Pause guest not migration ...
> > Might be tricky ...
> > 
> > Let me ask this, why not just produce a warning
> > that migration wan't finish until guest actually runs?
> > User will then know and unpause the guest when he wants
> > migration to succeed ...
> 
> A warning is going to be essentally invisible if the pause command
> succeeeds. 
> 
> Regards,
> Daniel

I mean the situation here isn't earth shattering, an admin
created it. Maybe he will unpause shortly
and all will be well ...

How about we make it possible for admin to detect that the
reason for migration not making progress is that it is
waiting for unplug? And maybe that guest is paused too?

I just don't see how we can detect all cases and I am not
sure it is worth it to try and detect only some of them,
making users think they can rely on command failure to
detect them.


> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


