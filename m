Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2802D328D
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 20:11:08 +0100 (CET)
Received: from localhost ([::1]:48004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmiOA-0004pT-Dk
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 14:11:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmhmt-0000w0-MX
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:32:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmhmq-0001LT-LV
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:32:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607452349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M1hhxrr4PhwggSCmhyzl8L9AkvOnb7YDH8hsG/P0K88=;
 b=Zj/lq0/ioOfEtmhwIIqn5/EP5gFN2zpT6nUGrOURxtltbzHqOjoNnFlRs5v9hoCNPBABA6
 wL9KChqF4om9PeDvwUAtMihZQHEq3iiRQLTAxH4bjlr6g+eng3uF6zGg0ylTZwqfUWuclf
 yX0Dpd3wY+JIuRYr8T1olZyj9x9V9Ic=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-OxrDgrIxP6OhdexVmoOVKQ-1; Tue, 08 Dec 2020 13:32:24 -0500
X-MC-Unique: OxrDgrIxP6OhdexVmoOVKQ-1
Received: by mail-wr1-f70.google.com with SMTP id p18so6480192wro.9
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 10:32:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=M1hhxrr4PhwggSCmhyzl8L9AkvOnb7YDH8hsG/P0K88=;
 b=sj6I3uVKpOL45Ky9Dh06q6Z7LLlOBYFgCXyZlLeZBicgay5aCLavJ4Uiqr/gaKjrwp
 24B9j62gLpkV8VkRJq9e+xCLG+bF5FEVY3RLzJieSLn1GsEMx2EkSuZr2dTOXna78138
 sGJRFuOG7e3iFB4ZkycVMamN+Wvr2VOzuAoXzhvLkln+Yn3oUzY8nRVmau1vhsk1iAH0
 ODcwUgcX00pYfYsYVhUMxQOmute+zg+CEeNHsdp2bHWVbIURB2F/c/Hdol8QgQwSdW24
 KiMv5/tWm2xRL0NiXq82LDfgaz4cb3PMd0QiXGTJ4eFAhisDdGPOM/SAXExFpTVIptcC
 WW2Q==
X-Gm-Message-State: AOAM533eX48jY6vaaGeQD9nyHQlBAP6sVD2Z9Jr5vlH5qoUFGgAkLsj8
 SF95/ELGnXbjctVDEdc4VOadFSuFogeOSlut6VNLmNnEOAn5P1C9WakGh2cO+RFcRsxbP5q2hta
 +5kqOviIgkLEzTcw=
X-Received: by 2002:a05:6000:90:: with SMTP id
 m16mr14078029wrx.165.1607452343613; 
 Tue, 08 Dec 2020 10:32:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwoxxozQOxxKcxZfwZBNijuobbTLINZ8UuocniZedNyrgPXDj5PLjWxY3Q0Q2+x0Z09GXfZ5w==
X-Received: by 2002:a05:6000:90:: with SMTP id
 m16mr14078013wrx.165.1607452343409; 
 Tue, 08 Dec 2020 10:32:23 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id a65sm4756346wmc.35.2020.12.08.10.32.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 10:32:22 -0800 (PST)
Date: Tue, 8 Dec 2020 13:32:19 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH v2 01/27] migration: Network Failover can't work with a
 paused guest
Message-ID: <20201208133139-mutt-send-email-mst@kernel.org>
References: <20201202050918-mutt-send-email-mst@kernel.org>
 <20201202102718.GA2360260@redhat.com>
 <20201202053111-mutt-send-email-mst@kernel.org>
 <20201202053219-mutt-send-email-mst@kernel.org>
 <87mtywlbvq.fsf@secure.mitica>
 <20201202105515.GD2360260@redhat.com>
 <20201202061641-mutt-send-email-mst@kernel.org>
 <20201202112639.GE2360260@redhat.com>
 <20201202063656-mutt-send-email-mst@kernel.org>
 <20201202120121.GF2360260@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201202120121.GF2360260@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

On Wed, Dec 02, 2020 at 12:01:21PM +0000, Daniel P. Berrangé wrote:
> On Wed, Dec 02, 2020 at 06:37:46AM -0500, Michael S. Tsirkin wrote:
> > On Wed, Dec 02, 2020 at 11:26:39AM +0000, Daniel P. Berrangé wrote:
> > > On Wed, Dec 02, 2020 at 06:19:29AM -0500, Michael S. Tsirkin wrote:
> > > > On Wed, Dec 02, 2020 at 10:55:15AM +0000, Daniel P. Berrangé wrote:
> > > > > On Wed, Dec 02, 2020 at 11:51:05AM +0100, Juan Quintela wrote:
> > > > > > "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > > > > > > On Wed, Dec 02, 2020 at 05:31:53AM -0500, Michael S. Tsirkin wrote:
> > > > > > >> On Wed, Dec 02, 2020 at 10:27:18AM +0000, Daniel P. BerrangÃƒÂ© wrote:
> > > > > > >> > On Wed, Dec 02, 2020 at 05:13:18AM -0500, Michael S. Tsirkin wrote:
> > > > > > >> > > On Wed, Nov 18, 2020 at 09:37:22AM +0100, Juan Quintela wrote:
> > > > > > >> > > > If we have a paused guest, it can't unplug the network VF device, so
> > > > > > >> > > > we wait there forever.  Just change the code to give one error on that
> > > > > > >> > > > case.
> > > > > > >> > > > 
> > > > > > >> > > > Signed-off-by: Juan Quintela <quintela@redhat.com>
> > > > > > >> > > 
> > > > > > >> > > It's certainly possible but it's management that created
> > > > > > >> > > this situation after all - why do we bother to enforce
> > > > > > >> > > a policy? It is possible that management will unpause immediately
> > > > > > >> > > afterwards and everything will proceed smoothly.
> > > > > > >> > > 
> > > > > > >> > > Yes migration will not happen until guest is
> > > > > > >> > > unpaused but the same it true of e.g. a guest that is stuck
> > > > > > >> > > because of a bug.
> > > > > > >> > 
> > > > > > >> > That's pretty different behaviour from how migration normally handles
> > > > > > >> > a paused guest, which is that it is guaranteed to complete the migration
> > > > > > >> > in as short a time as network bandwidth allows.
> > > > > > >> > 
> > > > > > >> > Just ignoring the situation I think will lead to surprise apps / admins,
> > > > > > >> > because the person/entity invoking the migration is not likely to have
> > > > > > >> > checked wether this particular guest uses net failover or not before
> > > > > > >> > invoking - they'll just be expecting a paused migration to run fast and
> > > > > > >> > be guaranteed to complete.
> > > > > > >> > 
> > > > > > >> > Regards,
> > > > > > >> > Daniel
> > > > > > >> 
> > > > > > >> Okay I guess. But then shouldn't we handle the reverse situation too:
> > > > > > >> pausing guest after migration started but before device was
> > > > > > >> unplugged?
> > > > > > >> 
> > > > > > >
> > > > > > > Thinking of which, I have no idea how we'd handle it - fail
> > > > > > > pausing guest until migration is cancelled?
> > > > > > >
> > > > > > > All this seems heavy handed to me ...
> > > > > > 
> > > > > > This is the minimal fix that I can think of.
> > > > > > 
> > > > > > Further solution would be:
> > > > > > - Add a new migration parameter: migrate-paused
> > > > > > - change libvirt to use the new parameter if it exist
> > > > > > - in qemu, when we do start migration (but after we wait for the unplug
> > > > > >   device) paused the guest before starting migration and resume it after
> > > > > >   migration finish.
> > > > > 
> > > > > It would also have to handle issuing of paused after migration has
> > > > > been started - delay the pause request until the nuplug is complete
> > > > > is one answer.
> > > > 
> > > > Hmm my worry would be that pausing is one way to give cpu
> > > > resources back to host. It's problematic if guest can delay
> > > > that indefinitely.
> > > 
> > > hmm, yes, that is awkward.  Perhaps we should just report an explicit
> > > error then.
> > 
> > Report an error in response to which command? Do you mean
> > fail migration?
> 
> If mgt attempt to pause an existing migration that hasn't finished
> the PCI unplug stage, then fail the pause request.

OK so I guess I'll apply the rest of the patchset, and let's see
a complete patch that makes pause and migrate mutually exclusive?


> > 
> > > In normal cases this won't happen, as unplug will have
> > > easily completed before the mgmt app pauses the running migration.
> > > In broken/malicious guest cases, this at least ives mgmt a heads up
> > > that something is wrong and they might then decide to cancel the
> > > migration.
> 
> Regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


