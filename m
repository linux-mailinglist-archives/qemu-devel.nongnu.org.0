Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D1F6A71EC
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 18:17:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXQ5F-00052c-Jv; Wed, 01 Mar 2023 12:17:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXQ5D-00052N-Dl
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 12:17:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXQ5B-0003HD-9l
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 12:17:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677691056;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Lw1QbLu74yM4juS3aJgUS/zR9DLozHRNIMLczHoFqbU=;
 b=RebWFy3svhW5pW7Z6HsbCLOlnBCyYHIQ9czwsDk0meM5xc3IrRzu7yxvZB/lp/A5UhGutj
 /bxbtxzYwkO/6EWTkoIUg7eeK+4yiyhztoiOHOZCaA0w6mf46rFFlX0xUagkrGni+zUYKL
 gQFlVQt6ohNw9pH8sz29YwTEYth+fJM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-606-JnhJxXEfPX2MyJEVPl1Yzg-1; Wed, 01 Mar 2023 12:17:34 -0500
X-MC-Unique: JnhJxXEfPX2MyJEVPl1Yzg-1
Received: by mail-wm1-f71.google.com with SMTP id
 j6-20020a05600c1c0600b003eaf882cb85so5579080wms.9
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 09:17:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677691053;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Lw1QbLu74yM4juS3aJgUS/zR9DLozHRNIMLczHoFqbU=;
 b=Ez/3rr1VZGlsYP0fngizrnk9aK9N4I8IwGDSFDXkgj48JMVqktJMQIn20h1DCTztvq
 HyNjQXk3ZPnpIRF0J1MWE4NL+h/xuS4oakiHsoQWIn09Ir1FcABB2pFSp7VztmZvraHj
 WtpqtyDDR8sOU1HdFKAy4JkStc3ufNUB0FJyACPC4dXzt29VbAjsuTs6dkZk230WcA2b
 ofXq7KT679nbFx+chgkekOPACP7WfloHD4oXZfpODg5VYZKYnEtfyXu8ybvlNVxTsbi/
 RwPKoFGHsCCImtohXhMJ0FJt7f1AX7Ic6rIS7Ev/oFcQ+juxqKTsdAQDNClEUdUY+1CJ
 Lubg==
X-Gm-Message-State: AO0yUKVoXgcgCXKqo3GtyisRSUymkzrIOaV/zIgTVQMdFHwgtkIFgA78
 VtOTDmdXsy2BkN7KRX3CBranI1ui7Q2WlLB/eCUu+uJ+e0YDPDBp4EUMGrllyiJLhmkLAwUiJDq
 bN/dPvRNlvkm4du4=
X-Received: by 2002:adf:f34e:0:b0:2c3:dd81:49ad with SMTP id
 e14-20020adff34e000000b002c3dd8149admr5390036wrp.33.1677691053350; 
 Wed, 01 Mar 2023 09:17:33 -0800 (PST)
X-Google-Smtp-Source: AK7set8jVPYec7j6zNCWYB5+/CTmkoQN6BIdDz6eH79vyPmdNGabbOAlIDNJiK0FrD0v+36vPduVMQ==
X-Received: by 2002:adf:f34e:0:b0:2c3:dd81:49ad with SMTP id
 e14-20020adff34e000000b002c3dd8149admr5390017wrp.33.1677691052947; 
 Wed, 01 Mar 2023 09:17:32 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 l3-20020a05600012c300b002c5694aef92sm13052422wrx.21.2023.03.01.09.17.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 09:17:32 -0800 (PST)
Date: Wed, 1 Mar 2023 12:17:27 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Anton Kuchin <antonkuchin@yandex-team.ru>
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-devel@nongnu.org, yc-core@yandex-team.ru,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, virtio-fs@redhat.com,
 Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v3 1/1] vhost-user-fs: add migration type property
Message-ID: <20230301121224-mutt-send-email-mst@kernel.org>
References: <20230223023604-mutt-send-email-mst@kernel.org>
 <Y/fZm12yGIPnwaDX@fedora>
 <20230224034258-mutt-send-email-mst@kernel.org>
 <8611d901-0940-3747-c2cd-9c193c7f24f2@yandex-team.ru>
 <20230228094756-mutt-send-email-mst@kernel.org>
 <f3338868-d43a-a499-5db8-2fb06d244e37@yandex-team.ru>
 <20230228161602-mutt-send-email-mst@kernel.org>
 <8c3c140a-3c11-ba21-0c53-9cf25928bad0@yandex-team.ru>
 <20230301101212-mutt-send-email-mst@kernel.org>
 <78299aea-4049-991b-fe89-de0d1845bdff@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <78299aea-4049-991b-fe89-de0d1845bdff@yandex-team.ru>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Mar 01, 2023 at 06:04:31PM +0200, Anton Kuchin wrote:
> On 01/03/2023 17:24, Michael S. Tsirkin wrote:
> > On Wed, Mar 01, 2023 at 05:07:28PM +0200, Anton Kuchin wrote:
> > > On 28/02/2023 23:24, Michael S. Tsirkin wrote:
> > > > On Tue, Feb 28, 2023 at 07:59:54PM +0200, Anton Kuchin wrote:
> > > > > On 28/02/2023 16:57, Michael S. Tsirkin wrote:
> > > > > > On Tue, Feb 28, 2023 at 04:30:36PM +0200, Anton Kuchin wrote:
> > > > > > > I really don't understand why and what do you want to check on
> > > > > > > destination.
> > > > > > Yes I understand your patch controls source. Let me try to rephrase
> > > > > > why I think it's better on destination.
> > > > > > Here's my understanding
> > > > > > - With vhost-user-fs state lives inside an external daemon.
> > > > > > A- If after load you connect to the same daemon you can get migration mostly
> > > > > >      for free.
> > > > > > B- If you connect to a different daemon then that daemon will need
> > > > > >      to pass information from original one.
> > > > > > 
> > > > > > Is this a fair summary?
> > > > > > 
> > > > > > Current solution is to set flag on the source meaning "I have an
> > > > > > orchestration tool that will make sure that either A or B is correct".
> > > > > > 
> > > > > > However both A and B can only be known when destination is known.
> > > > > > Especially as long as what we are really trying to do is just allow qemu
> > > > > > restarts, Checking the flag on load will thus achive it in a cleaner
> > > > > > way, in that orchestration tool can reasonably keep the flag
> > > > > > clear normally and only set it if restarting qemu locally.
> > > > > > 
> > > > > > 
> > > > > > By comparison, with your approach orchestration tool will have
> > > > > > to either always set the flag (risky since then we lose the
> > > > > > extra check that we coded) or keep it clear and set before migration
> > > > > > (complex).
> > > > > > 
> > > > > > I hope I explained what and why I want to check.
> > > > > > 
> > > > > > I am far from a vhost-user-fs expert so maybe I am wrong but
> > > > > > I wanted to make sure I got the point across even if other
> > > > > > disagree.
> > > > > > 
> > > > > Thank you for the explanation. Now I understand your concerns.
> > > > > 
> > > > > You are right about this mechanism being a bit risky if orchestrator is
> > > > > not using it properly or clunky if it is used in a safest possible way.
> > > > > That's why first attempt of this feature was with migration capability
> > > > > to let orchestrator choose behavior right at the moment of migration.
> > > > > But it has its own problems.
> > > > > 
> > > > > We can't move this check only to destination because one of main goals
> > > > > was to prevent orchestrators that are unaware of vhost-user-fs specifics
> > > > > from accidentally migrating such VMs. We can't rely here entirely on
> > > > > destination to block this because if VM is migrated to file and then
> > > > > can't be loaded by destination there is no way to fallback and resume
> > > > > the source so we need to have some kind of blocker on source by default.
> > > > Interesting.  Why is there no way? Just load it back on source? Isn't
> > > > this how any other load failure is managed? Because for sure you
> > > > need to manage these, they will happen.
> > > Because source can be already terminated
> > So start it again.
> 
> What is the difference between restarting the source and restarting
> the destination to retry migration? If stream is correct it can be
> loaded by destination if it is broken it won't be accepted at source too.

No.  First, destination has a different qemu version. Second file
can be corrupted in transfer. Third transfer can fail. Etc ...



> > > and if load is not supported by
> > > orchestrator and backend stream can't be loaded on source too.
> > How can an orchestrator not support load but support migration?
> 
> I was talking about orchestrators that rely on old device behavior
> of blocking migration. They could attempt migration anyway and check if
> it was blocked that is far from ideal but was OK and safe, and now this
> becomes dangerous because state can be lost and VM becomes unloadable.
> 
> > 
> > > So we need to
> > > ensure that only orchestrators that know what they are doing explicitly
> > > enable
> > > the feature are allowed to start migration.
> > that seems par for the course - if you want to use a feature you better
> > have an idea about how to do it.
> > 
> > If orchestrator is doing things like migrating to file
> > then scp that file, then it better be prepared to
> > restart VM on source because sometimes it will fail
> > on destination.
> > 
> > And an orchestrator that is not clever enough to do it, then it
> > just should not come up with funky ways to do migration.
> > 
> > 
> > > > > Said that checking on destination would need another flag and the safe
> > > > > way of using this feature would require managing two flags instead of one
> > > > > making it even more fragile. So I'd prefer not to make it more complex.
> > > > > 
> > > > > In my opinion the best way to use this property by orchestrator is to
> > > > > leave default unmigratable behavior at start and just before migration when
> > > > > destination is known enumerate all vhost-user-fs devices and set properties
> > > > > according to their backends capability with QMP like you mentioned. This
> > > > > gives us single point of making the decision for each device and avoids
> > > > > guessing future at VM start.
> > > > this means that you need to remember what the values were and then
> > > > any failure on destination requires you to go back and set them
> > > > to original values. With possibility of crashes on the orchestrator
> > > > you also need to recall the temporary values in some file ...
> > > > This is huge complexity much worse than two flags.
> > > > 
> > > > Assuming we need two let's see whether just reload on source is good
> > > > enough.
> > > Reload on source can't be guaranteed to work too. And even if we could
> > > guarantee it to work then we would also need to setup its incoming migration
> > > type in case outgoing migration fails.
> > Since it's local you naturally just set it to allow load. It's trivial - just
> > a command line property no games with QOM and no state.
> 
> It is not too hard but it adds complexity
> 
> > 
> > > If orchestrator crashes and restarts it can revert flags for all devices
> > revert to what?
> 
> To default migration=none, and set correct value before next migration
> attempt.
> 
> > > or can rely on next migration code to setup them correctly because they have
> > > no effect between migrations anyway.
> > but the whole reason we have this stuff is to protect against
> > an orchestrator that forgets to do it.
> 
> No, it is to protect orchestrators that doesn't even know this feature
> exists.
> 
> > > Reverting migration that failed on destination is not an easy task too.
> > > It seems to be much more complicated than refusing to migrate on source.
> > It is only more complicated because you do not consider that
> > migration can fail even if QEMU allows it.
> > 
> > Imagine that you start playing with features through QOM.
> > Now you start migration, it fails for some reason (e.g. a network
> > issue), and you are left with a misconfigured feature.
> > 
> > Your answer is basically that we don't need this protection at all,
> > we can trust orchestrators to do the right thing.
> > In that case just drop the blocker and be done with it.
> 
> Yes, we don't need to protect from orchestrators. But we need to protect
> unaware orchestrators.

Right. You just trust orchestrators to do the right thing more than I do :)
I feel they will blindly set flag and then we are back to square one.
I feel it's less likely with load because load already has a slightly
different command line.


In fact, if we wanted to we could fail qemu if the property is set
but VM is started and not migrated.




> > 
> > > I believe we should perform sanity checks if we have data but engineering
> > > additional checks and putting extra restrictions just to prevent
> > > orchestrator
> > > from doing wrong things is an overkill.
> > Exactly. The check on source is such an overkill - your problem
> > is not on source, source has no issue sending the VM. Your problem is
> > on destination - it can not get the data from daemon since the daemon
> > is not local.
> > 
> > 
> > > > > But allowing setup via command-line is valid too because some backends may
> > > > > always be capable of external migration independent of hosts and don't need
> > > > > the manipulations with QMP before migration at all.
> > > > I am much more worried that the realistic schenario is hard to manage
> > > > safely than about theoretical state migrating backends that don't exist.
> > > > 
> > > > 


