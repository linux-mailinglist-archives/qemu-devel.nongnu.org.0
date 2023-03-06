Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD6B6AC4A3
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 16:18:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZCaw-0002Nu-Cx; Mon, 06 Mar 2023 10:17:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pZCat-0002FF-Er
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 10:17:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pZCar-0006u0-DN
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 10:17:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678115860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+xC3BPfy/X5CcjNFKPFn3eUtCx3zupeD+xmlNl152Bs=;
 b=Yhk5mi8s5wlHYMvoFaAwlovMEikQ8b9JfHmu9ja8T6CK9cOOLl4AdE6c7buA40Cz+iSbBv
 WlalnXcjMaxJXhVhNOYhpqcxDZwBMbOeIwwo+pXa3sovZUioeEeyIdu2xYkntFY2nczNco
 zJMbZg94bt773IFzQQFiiABNf3jmYqw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-310-QxTOu3qQPV6dZEjXAnNNvg-1; Mon, 06 Mar 2023 10:17:37 -0500
X-MC-Unique: QxTOu3qQPV6dZEjXAnNNvg-1
Received: by mail-wm1-f70.google.com with SMTP id
 e22-20020a05600c219600b003e000facbb1so6866798wme.9
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 07:17:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678115856;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+xC3BPfy/X5CcjNFKPFn3eUtCx3zupeD+xmlNl152Bs=;
 b=OWCaQChTN57ifvcRa9Xe5dRYMM7ah0wKTSLXWv5kNeqGANuyzwAN2zlq75yt3FETpa
 rH0es/BH3lVdp/PpgczB4l5cck1IkySx27oI5nhMwY6ouCpLGiQIrB2vfAV/7H4yb5do
 vc6MFAAbOklIwVquHWwsq42+qmdKmAx6Dtb8fIjYxjakySx2CywtsodpXZOqfFqeLxcF
 t05wqXNpDdktY/leOqsfnAuWedLQqSfXlemoRjVnuwuX6d0BPucoU2Y6MeiHsq1X0jvP
 oAvbTMgEOc/+ad/tAGhvUFFBpOjXOYWx0D13VIrfuicyeoGVByDy5TqMfx5UdLnG9lHI
 6HxA==
X-Gm-Message-State: AO0yUKWHcnfC46ybFObR4RsjSzfSVR6c7ZLIaPzrk6RQGAQA1qq05QSK
 qchSMvbzN5DSXieKUTyMb8jGSR8SkqI8oeH7taQA5pQLW3Bbi6sMJNKotwa32kNpvXJESbDHf/T
 f/yVojU4dn9ejOHg=
X-Received: by 2002:a05:600c:4ecf:b0:3eb:399d:ab1a with SMTP id
 g15-20020a05600c4ecf00b003eb399dab1amr9131339wmq.21.1678115855854; 
 Mon, 06 Mar 2023 07:17:35 -0800 (PST)
X-Google-Smtp-Source: AK7set+wFMgWrF3cYBlKLMWL75eNncwPHd0fnChJwYBNUWLP2mjh5RW1j/Z823X0eNFc9zTjY5DhCw==
X-Received: by 2002:a05:600c:4ecf:b0:3eb:399d:ab1a with SMTP id
 g15-20020a05600c4ecf00b003eb399dab1amr9131327wmq.21.1678115855583; 
 Mon, 06 Mar 2023 07:17:35 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 l3-20020a5d4103000000b002c55521903bsm10043552wrp.51.2023.03.06.07.17.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 07:17:35 -0800 (PST)
Date: Mon, 6 Mar 2023 15:17:32 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, quintela@redhat.com,
 qemu-devel@nongnu.org,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH] tests/qtest/migration-test: Disable
 migration/multifd/tcp/plain/cancel
Message-ID: <ZAYEDBpoXp29IqBK@work-vm>
References: <20230302172211.4146376-1-peter.maydell@linaro.org>
 <ZADeLNaltLAZ9BU8@redhat.com> <87edq6i4jf.fsf@secure.mitica>
 <CAFEAcA8aKkFse_nfoKSPA--QdQnB1xVZyMQoQWfqpf4yyxtzDA@mail.gmail.com>
 <188bd1ff-4ea2-6d92-2b6e-6f19af3df232@redhat.com>
 <CAFEAcA-U568vrLKHegfKQWu1RfUCRjdOKZQMoFXSde1yk4V3Wg@mail.gmail.com>
 <53ca67e4-fb2f-17ac-2087-9faa7aba5187@redhat.com>
 <ZAXuRp4p7heAbFtF@work-vm> <ZAXx5VerHrVQbSwU@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZAXx5VerHrVQbSwU@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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

* Daniel P. Berrangé (berrange@redhat.com) wrote:
> On Mon, Mar 06, 2023 at 01:44:38PM +0000, Dr. David Alan Gilbert wrote:
> > * Thomas Huth (thuth@redhat.com) wrote:
> > > On 03/03/2023 13.05, Peter Maydell wrote:
> > > > On Fri, 3 Mar 2023 at 11:29, Thomas Huth <thuth@redhat.com> wrote:
> > > > > 
> > > > > On 03/03/2023 12.18, Peter Maydell wrote:
> > > > > > On Fri, 3 Mar 2023 at 09:10, Juan Quintela <quintela@redhat.com> wrote:
> > > > > > > 
> > > > > > > Daniel P. Berrangé <berrange@redhat.com> wrote:
> > > > > > > > On Thu, Mar 02, 2023 at 05:22:11PM +0000, Peter Maydell wrote:
> > > > > > > > > migration-test has been flaky for a long time, both in CI and
> > > > > > > > > otherwise:
> > > > > > > > > 
> > > > > > > > > https://gitlab.com/qemu-project/qemu/-/jobs/3806090216
> > > > > > > > > (a FreeBSD job)
> > > > > > > > >     32/648 ERROR:../tests/qtest/migration-helpers.c:205:wait_for_migration_status: assertion failed: (g_test_timer_elapsed() < MIGRATION_STATUS_WAIT_TIMEOUT) ERROR
> > > > > > > > > 
> > > > > > > > > on a local macos x86 box:
> > > > > > 
> > > > > > 
> > > > > > 
> > > > > > > What is really weird with this failure is that:
> > > > > > > - it only happens on non-x86
> > > > > > 
> > > > > > No, I have seen it on x86 macos, and x86 OpenBSD
> > > > > > 
> > > > > > > - on code that is not arch dependent
> > > > > > > - on cancel, what we really do there is close fd's for the multifd
> > > > > > >     channel threads to get out of the recv, i.e. again, nothing that
> > > > > > >     should be arch dependent.
> > > > > > 
> > > > > > I'm pretty sure that it tends to happen when the machine that's
> > > > > > running the test is heavily loaded. You probably have a race condition.
> > > > > 
> > > > > I think I can second that. IIRC I've seen it a couple of times on my x86
> > > > > laptop when running "make check -j$(nproc) SPEED=slow" here.
> > > > 
> > > > And another on-x86 failure case, just now, on the FreeBSD x86 CI job:
> > > > https://gitlab.com/qemu-project/qemu/-/jobs/3870165180
> > > 
> > > And FWIW, I just saw this while doing "make vm-build-netbsd J=4":
> > > 
> > > ▶  31/645 ERROR:../src/tests/qtest/migration-test.c:1841:test_migrate_auto_converge: 'got_stop' should be FALSE ERROR
> > 
> > That one is kind of interesting; this is an auto converge test - so it
> > tries to setup migration so it won't finish, to check that the auto
> > converge kicks in.  Except in this case the migration *did* finish
> > without the autoconverge (significantly) kicking in.
> > 
> > So I guess any of:
> >   a) The CPU thread never got much CPU time so not much dirtying
> > happened.
> >   b) The bandwidth calculations might be bad enough/course enough
> > that it's passing the (very low) bandwidth limit due to bad
> > approximation at bandwidth needed.
> >   c) The autoconverge jump happens fast enough for that loop
> > to hit the got_stop in the loop time of that loop.
> > 
> > I guess we could:
> >   i) Reduce the usleep in test_migrate_auto_converge
> >     (So it is more likely to correctly drop out of that loop
> >     as soon as autoconverge kicks in)
> 
> The CPU time spent by the dirtying guest CPUs should dominate
> here, so we can afford to reduce that timeout down a bit to
> be more responsive.
> 
> >   ii) Reduce inc_pct so that autoconverge kicks in slower
> >   iii) Reduce max-bandwidth in migrate_ensure_non_converge
> >      even further.
> 
> migrate_ensure_non_converge is trying to guarantee non-convergance,
> but obviously we're only achieving a probibalistic chance of
> non-converage. To get the probably closer to 100% we should make
> it massively smaller, say 100kbs instead of 30mbs.

Interestingly that doesn't work; I've not quite worked out why yet; I
pushed it to 30kbps and it got stuck in the basic fd test.  My guess is
that it's starving something so it never makes any forward progress.

Dave

> With regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


