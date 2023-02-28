Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E32F6A6135
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 22:25:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX7SW-0003Ja-RC; Tue, 28 Feb 2023 16:24:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pX7SV-0003JJ-1V
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 16:24:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pX7ST-00067d-Ci
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 16:24:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677619464;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nYTNjbO/ErbVmboaJhjbHl5qUA3UJ7cYibDqQh5A13s=;
 b=Fx20fSUR8nfa2SNQqvq/Zx7EPG8aHr/J1AvgI8/pOcylgIkoTM3k5imVY4Ssn7+yLHIQqr
 we4UXrjoITsRiJozZ2jmamyTGTFpySM+HQ+LTqOOBwSO98L11cUJd5R/AwYrlxbf/AS2eo
 /Z+AxPnEU5ENPxgN4yLJqwW0ulKxcPQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-606-10EBDqo9PMelpy193QIKXQ-1; Tue, 28 Feb 2023 16:24:22 -0500
X-MC-Unique: 10EBDqo9PMelpy193QIKXQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 ba28-20020a0560001c1c00b002cc6d1f0c06so1108519wrb.17
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 13:24:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677619461;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nYTNjbO/ErbVmboaJhjbHl5qUA3UJ7cYibDqQh5A13s=;
 b=2TNpEyssrTCWrhmEOy6CiKdiozJ8IZO58xvWlo6EDraBzTOJI0hAfxSjtjgmxxOAhY
 1wbiXVSkvU02tt6OsuA/2CVwQlaPkjzfpATZbw8kzdQVuXlGl4c3QWDakWcP9zVjuTrE
 hjGWyTgr3tfdXGY6hF3acWGZnnnSEO1g/L4xx+w2DLkX3yrBtdjHfA2fzKPkzL2dnjaF
 apa+nnndNmfxm+zDrIOHsvVREam6PWv23Xs01vJVWsohg8KIbIxJDydmTGzjCLd5ez1U
 GTwUnSBrIMDX6oyEIC6l9S4WTznOvl8w5ebPEOljtJrT6HgETCHw5jdZ1YoX/0JzYNtI
 AnkQ==
X-Gm-Message-State: AO0yUKVPPVYQhSpNV40PkpZpID/eFYfemPir9gGjJKWxtZBzi9MlVCwb
 QvCAP6XUlUxNak2LBvdhOWYZ16iByaSXu8OpvEu97Mnn8PkYw6XJpT2dJBU4BYVwH0kHj+QwUpL
 eAtP9sFl2ys9CLPI=
X-Received: by 2002:a05:600c:43ca:b0:3da:2a78:d7a4 with SMTP id
 f10-20020a05600c43ca00b003da2a78d7a4mr3135037wmn.21.1677619461169; 
 Tue, 28 Feb 2023 13:24:21 -0800 (PST)
X-Google-Smtp-Source: AK7set92wxQr45uZkmmH4sKNa7aw+qHpcZh4gMAYsGPuFGOHHVYAk9NpKggDElKStjtRFIhmvuK5Qg==
X-Received: by 2002:a05:600c:43ca:b0:3da:2a78:d7a4 with SMTP id
 f10-20020a05600c43ca00b003da2a78d7a4mr3135017wmn.21.1677619460862; 
 Tue, 28 Feb 2023 13:24:20 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 n4-20020a7bcbc4000000b003dc3f3d77e3sm12812199wmi.7.2023.02.28.13.24.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 13:24:20 -0800 (PST)
Date: Tue, 28 Feb 2023 16:24:16 -0500
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
Message-ID: <20230228161602-mutt-send-email-mst@kernel.org>
References: <11593688-7ca4-def3-6212-7c26faa4d1c6@yandex-team.ru>
 <20230222121133-mutt-send-email-mst@kernel.org>
 <a477ca70-8aea-6c16-122e-1ded4af11f49@yandex-team.ru>
 <20230222151814-mutt-send-email-mst@kernel.org>
 <20230223023604-mutt-send-email-mst@kernel.org>
 <Y/fZm12yGIPnwaDX@fedora>
 <20230224034258-mutt-send-email-mst@kernel.org>
 <8611d901-0940-3747-c2cd-9c193c7f24f2@yandex-team.ru>
 <20230228094756-mutt-send-email-mst@kernel.org>
 <f3338868-d43a-a499-5db8-2fb06d244e37@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f3338868-d43a-a499-5db8-2fb06d244e37@yandex-team.ru>
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

On Tue, Feb 28, 2023 at 07:59:54PM +0200, Anton Kuchin wrote:
> On 28/02/2023 16:57, Michael S. Tsirkin wrote:
> > On Tue, Feb 28, 2023 at 04:30:36PM +0200, Anton Kuchin wrote:
> > > I really don't understand why and what do you want to check on
> > > destination.
> > Yes I understand your patch controls source. Let me try to rephrase
> > why I think it's better on destination.
> > Here's my understanding
> > - With vhost-user-fs state lives inside an external daemon.
> > A- If after load you connect to the same daemon you can get migration mostly
> >    for free.
> > B- If you connect to a different daemon then that daemon will need
> >    to pass information from original one.
> > 
> > Is this a fair summary?
> > 
> > Current solution is to set flag on the source meaning "I have an
> > orchestration tool that will make sure that either A or B is correct".
> > 
> > However both A and B can only be known when destination is known.
> > Especially as long as what we are really trying to do is just allow qemu
> > restarts, Checking the flag on load will thus achive it in a cleaner
> > way, in that orchestration tool can reasonably keep the flag
> > clear normally and only set it if restarting qemu locally.
> > 
> > 
> > By comparison, with your approach orchestration tool will have
> > to either always set the flag (risky since then we lose the
> > extra check that we coded) or keep it clear and set before migration
> > (complex).
> > 
> > I hope I explained what and why I want to check.
> > 
> > I am far from a vhost-user-fs expert so maybe I am wrong but
> > I wanted to make sure I got the point across even if other
> > disagree.
> > 
> 
> Thank you for the explanation. Now I understand your concerns.
> 
> You are right about this mechanism being a bit risky if orchestrator is
> not using it properly or clunky if it is used in a safest possible way.
> That's why first attempt of this feature was with migration capability
> to let orchestrator choose behavior right at the moment of migration.
> But it has its own problems.
> 
> We can't move this check only to destination because one of main goals
> was to prevent orchestrators that are unaware of vhost-user-fs specifics
> from accidentally migrating such VMs. We can't rely here entirely on
> destination to block this because if VM is migrated to file and then
> can't be loaded by destination there is no way to fallback and resume
> the source so we need to have some kind of blocker on source by default.

Interesting.  Why is there no way? Just load it back on source? Isn't
this how any other load failure is managed? Because for sure you
need to manage these, they will happen.

> Said that checking on destination would need another flag and the safe
> way of using this feature would require managing two flags instead of one
> making it even more fragile. So I'd prefer not to make it more complex.
>
> In my opinion the best way to use this property by orchestrator is to
> leave default unmigratable behavior at start and just before migration when
> destination is known enumerate all vhost-user-fs devices and set properties
> according to their backends capability with QMP like you mentioned. This
> gives us single point of making the decision for each device and avoids
> guessing future at VM start.

this means that you need to remember what the values were and then
any failure on destination requires you to go back and set them
to original values. With possibility of crashes on the orchestrator
you also need to recall the temporary values in some file ...
This is huge complexity much worse than two flags.

Assuming we need two let's see whether just reload on source is good
enough.

> But allowing setup via command-line is valid too because some backends may
> always be capable of external migration independent of hosts and don't need
> the manipulations with QMP before migration at all.

I am much more worried that the realistic schenario is hard to manage
safely than about theoretical state migrating backends that don't exist.


-- 
MST


