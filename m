Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E8D2CBBA0
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 12:39:51 +0100 (CET)
Received: from localhost ([::1]:36340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkQUA-0001lV-Km
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 06:39:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kkQSL-0000sB-Ra
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 06:37:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kkQSI-0006ci-KU
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 06:37:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606909072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JstTK4N7RqodNkvWxzkgOBlmJrX31/tcjZbubtOZL/Q=;
 b=WemYDPjdVXY3+mC4fhM6POy4gHk0B95F5QTxss3FcH83EY6KtL72H4LbOSX0rvisYe9Xt5
 VYbv3tFhLAPttTqheZ/Vk1ckABZR7QHWbQtXEAOEcwVvQGRtEoczJaOQwJpDcjhxV8Aymi
 59uzD5cmcm7NHPy2HNC8tlnLkbY4xIg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-138-gohKv1lNOUqZXgvGtJejrA-1; Wed, 02 Dec 2020 06:37:50 -0500
X-MC-Unique: gohKv1lNOUqZXgvGtJejrA-1
Received: by mail-wm1-f70.google.com with SMTP id g198so3261274wme.7
 for <qemu-devel@nongnu.org>; Wed, 02 Dec 2020 03:37:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=JstTK4N7RqodNkvWxzkgOBlmJrX31/tcjZbubtOZL/Q=;
 b=MhHw31JAtf1VWDEETHFM5uEot9DWe0/Emzezq3H18r6PbvQjCbxqTzj7kZ8er8cDry
 M2ro5I2yNZktfscIa6XQwj1WNxhKuTnK0/fusyLpxkgNxVAAHpSDEXjWquOYVjGUG/fi
 ii0+wkoZRePIzp3ytDn7w4Uk+X2X5HmsIlJulktHJpGjHsVefbvrGY2Di6tK0pyjEtDw
 Kk/YsVojoDgUj8nouYusjZzPc0dTVIOOPVIUGgVqS4A/hz3tes2CIeJuFaMazCC3EQdm
 M0ziKSCrADdnrgy4Ciic23qJ4YnQuWXeA63ORVlu3zLTDxfolggd18a9WkTfDGzra7+z
 4wbg==
X-Gm-Message-State: AOAM531r0fhrEugFNa9k15abFuVXxmAWH/rjrPx70BAw3VXLdixxWJDy
 6KHFfnT0pbIgYTX6Lhw4f15ltxFe5Lp48uplpebJj72Mrb8LJmBsIVEqS9MfWZ+HVdPwIyGaRBO
 HZlE25U0slp1scWY=
X-Received: by 2002:a1c:e084:: with SMTP id x126mr2670939wmg.109.1606909069587; 
 Wed, 02 Dec 2020 03:37:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxYp/pZ8xwTRGh1zwmisZKEnKX1IDohK37TTHcDGSmKHgJ+5m2T4zGygZcwBwcLpzXzBoepLg==
X-Received: by 2002:a1c:e084:: with SMTP id x126mr2670915wmg.109.1606909069275; 
 Wed, 02 Dec 2020 03:37:49 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id d8sm1673885wmb.11.2020.12.02.03.37.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Dec 2020 03:37:48 -0800 (PST)
Date: Wed, 2 Dec 2020 06:37:46 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH v2 01/27] migration: Network Failover can't work with a
 paused guest
Message-ID: <20201202063656-mutt-send-email-mst@kernel.org>
References: <20201118083748.1328-1-quintela@redhat.com>
 <20201118083748.1328-2-quintela@redhat.com>
 <20201202050918-mutt-send-email-mst@kernel.org>
 <20201202102718.GA2360260@redhat.com>
 <20201202053111-mutt-send-email-mst@kernel.org>
 <20201202053219-mutt-send-email-mst@kernel.org>
 <87mtywlbvq.fsf@secure.mitica>
 <20201202105515.GD2360260@redhat.com>
 <20201202061641-mutt-send-email-mst@kernel.org>
 <20201202112639.GE2360260@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201202112639.GE2360260@redhat.com>
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

On Wed, Dec 02, 2020 at 11:26:39AM +0000, Daniel P. Berrangé wrote:
> On Wed, Dec 02, 2020 at 06:19:29AM -0500, Michael S. Tsirkin wrote:
> > On Wed, Dec 02, 2020 at 10:55:15AM +0000, Daniel P. Berrangé wrote:
> > > On Wed, Dec 02, 2020 at 11:51:05AM +0100, Juan Quintela wrote:
> > > > "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > > > > On Wed, Dec 02, 2020 at 05:31:53AM -0500, Michael S. Tsirkin wrote:
> > > > >> On Wed, Dec 02, 2020 at 10:27:18AM +0000, Daniel P. BerrangÃƒÂ© wrote:
> > > > >> > On Wed, Dec 02, 2020 at 05:13:18AM -0500, Michael S. Tsirkin wrote:
> > > > >> > > On Wed, Nov 18, 2020 at 09:37:22AM +0100, Juan Quintela wrote:
> > > > >> > > > If we have a paused guest, it can't unplug the network VF device, so
> > > > >> > > > we wait there forever.  Just change the code to give one error on that
> > > > >> > > > case.
> > > > >> > > > 
> > > > >> > > > Signed-off-by: Juan Quintela <quintela@redhat.com>
> > > > >> > > 
> > > > >> > > It's certainly possible but it's management that created
> > > > >> > > this situation after all - why do we bother to enforce
> > > > >> > > a policy? It is possible that management will unpause immediately
> > > > >> > > afterwards and everything will proceed smoothly.
> > > > >> > > 
> > > > >> > > Yes migration will not happen until guest is
> > > > >> > > unpaused but the same it true of e.g. a guest that is stuck
> > > > >> > > because of a bug.
> > > > >> > 
> > > > >> > That's pretty different behaviour from how migration normally handles
> > > > >> > a paused guest, which is that it is guaranteed to complete the migration
> > > > >> > in as short a time as network bandwidth allows.
> > > > >> > 
> > > > >> > Just ignoring the situation I think will lead to surprise apps / admins,
> > > > >> > because the person/entity invoking the migration is not likely to have
> > > > >> > checked wether this particular guest uses net failover or not before
> > > > >> > invoking - they'll just be expecting a paused migration to run fast and
> > > > >> > be guaranteed to complete.
> > > > >> > 
> > > > >> > Regards,
> > > > >> > Daniel
> > > > >> 
> > > > >> Okay I guess. But then shouldn't we handle the reverse situation too:
> > > > >> pausing guest after migration started but before device was
> > > > >> unplugged?
> > > > >> 
> > > > >
> > > > > Thinking of which, I have no idea how we'd handle it - fail
> > > > > pausing guest until migration is cancelled?
> > > > >
> > > > > All this seems heavy handed to me ...
> > > > 
> > > > This is the minimal fix that I can think of.
> > > > 
> > > > Further solution would be:
> > > > - Add a new migration parameter: migrate-paused
> > > > - change libvirt to use the new parameter if it exist
> > > > - in qemu, when we do start migration (but after we wait for the unplug
> > > >   device) paused the guest before starting migration and resume it after
> > > >   migration finish.
> > > 
> > > It would also have to handle issuing of paused after migration has
> > > been started - delay the pause request until the nuplug is complete
> > > is one answer.
> > 
> > Hmm my worry would be that pausing is one way to give cpu
> > resources back to host. It's problematic if guest can delay
> > that indefinitely.
> 
> hmm, yes, that is awkward.  Perhaps we should just report an explicit
> error then.

Report an error in response to which command? Do you mean
fail migration?

> In normal cases this won't happen, as unplug will have
> easily completed before the mgmt app pauses the running migration.
> In broken/malicious guest cases, this at least ives mgmt a heads up
> that something is wrong and they might then decide to cancel the
> migration.
> 
> 
> Regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


