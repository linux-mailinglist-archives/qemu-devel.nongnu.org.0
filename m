Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9ED2CBB72
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 12:21:27 +0100 (CET)
Received: from localhost ([::1]:33642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkQCM-0003kk-7l
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 06:21:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kkQAf-0002PW-P6
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 06:19:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kkQAc-0000Ka-K0
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 06:19:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606907976;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6CoXM2pakNYyeJ42p0zgsVuRPL3cNcew9e+cosZFFks=;
 b=QgvsO5GkiYFyFx1P1qrgAPDrSOE2Z+VpkmdDNRu4nBmlwSJTQZVDCzkSCLgFnYJx0c0hrx
 vptWnG9OvovyPBJtf6zLR2gaFE/vbjLwZV4EqaJnV0lGLAvQ+Ougn0nu+UkDaYLnCT2gEI
 dpZ4FhdweGdGQ3G8wVowUQ155OFsE3g=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-feOSSCGYPX2G0CrA3i1N2g-1; Wed, 02 Dec 2020 06:19:34 -0500
X-MC-Unique: feOSSCGYPX2G0CrA3i1N2g-1
Received: by mail-wr1-f72.google.com with SMTP id b12so3400365wru.15
 for <qemu-devel@nongnu.org>; Wed, 02 Dec 2020 03:19:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=6CoXM2pakNYyeJ42p0zgsVuRPL3cNcew9e+cosZFFks=;
 b=QBYRbeXKw+xX8rrsQ0rVoEdbWBR6UPFbNTI4GuZa1yzi6uYYCxAIcYXrGL0mJsgqgq
 e5diUb9Nq88bTEkte9FqH/K3UmHpqyI9VmUAXcrJ69Op6pq5bM2Aop4/+H+j0moyp7Ca
 sYeWN9veBBDzxJSkIBodAam6+Vv3WJ4oZlbKCKt/N63r1dW3XeZfEEdogd6DcBRT7oWD
 hrlsNITxdKiGKXohs/0ODgk2IwjJ1CBCVC9HggURUj+v2b52FfktzVsZF9skc/dXGvTY
 6CDl7rFq2vD5nwd18zl0KRg1qMlE+bK/+ywjeJGEZAZN3w1St5Cryp3q+BmVCocgczvE
 jviw==
X-Gm-Message-State: AOAM532XiKrEBJdzD2I8DM25YhAUT9LzoGwFtcxOS/1vwSs3cxUARgDv
 DhKwpn/SEM0yN6Zcjis3PIS2r0C3MC1W6vcW2JrgVBaoIA1Mswrr2ddf5CAgMsAzIQRVS0220qY
 /HtxLdllZLhN+Bk4=
X-Received: by 2002:a1c:f311:: with SMTP id q17mr2591310wmq.28.1606907973208; 
 Wed, 02 Dec 2020 03:19:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyu8Dfe00d0U76l17niHZay0khb3IRNHj5ND9t6EvievPSZZku5L/2h4oriOry6HE3CVwHY+A==
X-Received: by 2002:a1c:f311:: with SMTP id q17mr2591285wmq.28.1606907972993; 
 Wed, 02 Dec 2020 03:19:32 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id y20sm1700261wma.15.2020.12.02.03.19.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Dec 2020 03:19:32 -0800 (PST)
Date: Wed, 2 Dec 2020 06:19:29 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH v2 01/27] migration: Network Failover can't work with a
 paused guest
Message-ID: <20201202061641-mutt-send-email-mst@kernel.org>
References: <20201118083748.1328-1-quintela@redhat.com>
 <20201118083748.1328-2-quintela@redhat.com>
 <20201202050918-mutt-send-email-mst@kernel.org>
 <20201202102718.GA2360260@redhat.com>
 <20201202053111-mutt-send-email-mst@kernel.org>
 <20201202053219-mutt-send-email-mst@kernel.org>
 <87mtywlbvq.fsf@secure.mitica>
 <20201202105515.GD2360260@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201202105515.GD2360260@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Jason Wang <jasowang@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 02, 2020 at 10:55:15AM +0000, Daniel P. Berrangé wrote:
> On Wed, Dec 02, 2020 at 11:51:05AM +0100, Juan Quintela wrote:
> > "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > > On Wed, Dec 02, 2020 at 05:31:53AM -0500, Michael S. Tsirkin wrote:
> > >> On Wed, Dec 02, 2020 at 10:27:18AM +0000, Daniel P. BerrangÃƒÂ© wrote:
> > >> > On Wed, Dec 02, 2020 at 05:13:18AM -0500, Michael S. Tsirkin wrote:
> > >> > > On Wed, Nov 18, 2020 at 09:37:22AM +0100, Juan Quintela wrote:
> > >> > > > If we have a paused guest, it can't unplug the network VF device, so
> > >> > > > we wait there forever.  Just change the code to give one error on that
> > >> > > > case.
> > >> > > > 
> > >> > > > Signed-off-by: Juan Quintela <quintela@redhat.com>
> > >> > > 
> > >> > > It's certainly possible but it's management that created
> > >> > > this situation after all - why do we bother to enforce
> > >> > > a policy? It is possible that management will unpause immediately
> > >> > > afterwards and everything will proceed smoothly.
> > >> > > 
> > >> > > Yes migration will not happen until guest is
> > >> > > unpaused but the same it true of e.g. a guest that is stuck
> > >> > > because of a bug.
> > >> > 
> > >> > That's pretty different behaviour from how migration normally handles
> > >> > a paused guest, which is that it is guaranteed to complete the migration
> > >> > in as short a time as network bandwidth allows.
> > >> > 
> > >> > Just ignoring the situation I think will lead to surprise apps / admins,
> > >> > because the person/entity invoking the migration is not likely to have
> > >> > checked wether this particular guest uses net failover or not before
> > >> > invoking - they'll just be expecting a paused migration to run fast and
> > >> > be guaranteed to complete.
> > >> > 
> > >> > Regards,
> > >> > Daniel
> > >> 
> > >> Okay I guess. But then shouldn't we handle the reverse situation too:
> > >> pausing guest after migration started but before device was
> > >> unplugged?
> > >> 
> > >
> > > Thinking of which, I have no idea how we'd handle it - fail
> > > pausing guest until migration is cancelled?
> > >
> > > All this seems heavy handed to me ...
> > 
> > This is the minimal fix that I can think of.
> > 
> > Further solution would be:
> > - Add a new migration parameter: migrate-paused
> > - change libvirt to use the new parameter if it exist
> > - in qemu, when we do start migration (but after we wait for the unplug
> >   device) paused the guest before starting migration and resume it after
> >   migration finish.
> 
> It would also have to handle issuing of paused after migration has
> been started - delay the pause request until the nuplug is complete
> is one answer.

Hmm my worry would be that pausing is one way to give cpu
resources back to host. It's problematic if guest can delay
that indefinitely.

> > My understanding talking with Laine is that they use this functionality
> > by default for migration, saving, etc, i.e. it is not an isolated case.
> 
> Yep,  save-to-disk always runs in the paused state, and migration is
> also paused by default unless the mgmt app explicitl asks for live
> migration.
> 
> Regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


