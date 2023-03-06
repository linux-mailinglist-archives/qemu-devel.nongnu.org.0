Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6D86AC1B5
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 14:45:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZB90-0007sb-V4; Mon, 06 Mar 2023 08:44:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pZB8x-0007s9-0I
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 08:44:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pZB8u-0002JU-NZ
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 08:44:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678110283;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/bjN8gy4ob0i5jaHoXQeB/kjCj4xMpnLdM6pIicILGU=;
 b=Aw4lDmBYCoS+IDDl8lxAZ8/M5IR6LqRsSc6XLHhWmf664VI4W4/9pcdWN4BdkiZ7MtLUp9
 4emdV4+mPRt4LJIkrSZcY2tWJ4C30IhZLXqMAKC8yfoZDtoHtvNU+XwvTESBo4o4B5NzXD
 bE0lTF2IPVxXxSdVOBl7CZWWpUUOxa4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-111-9tZRxL3ANOWXbf9SD8W99Q-1; Mon, 06 Mar 2023 08:44:42 -0500
X-MC-Unique: 9tZRxL3ANOWXbf9SD8W99Q-1
Received: by mail-wr1-f72.google.com with SMTP id
 l14-20020a5d526e000000b002cd851d79b2so1473254wrc.5
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 05:44:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678110281;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/bjN8gy4ob0i5jaHoXQeB/kjCj4xMpnLdM6pIicILGU=;
 b=UgeM7ZHqFFBI4rk2t9p+xV0dyQcvxwgf6O/Pty6AT6/svkaI7P+VDQjAyKkdcbXCKY
 PohMMNlcA9TQeG2VorOp+3fq30AC1wA7pErMPqNcruwNmt9T49bTM28WnfnNFjNPGhno
 t9YG2L5ygf6dac+pTUegqRF24BhrHAaRIcJyZIwZo2kJzNExlomYs0o6wzyJoC6Xd9nf
 u6Fwph6MTUBlt0dS08VgOuBTIybI3qEYOzlGq/Z1eSKoTGvEbvu+XOMl8IsubIO/a4Zx
 KH61A8T58iEZJGbIr22ZWn6AzaqKFwprgvNVagAv8jIlfLQSBixd0y8SK1PYUxaRFTUH
 UkEw==
X-Gm-Message-State: AO0yUKUbk8WAb5TSflVTcUx3JHBVIy8BJMT0/uzj/YEdm5LRJF9piEtp
 tfLDASYBDej6xzsdfHFqBpOguthvfUXag6yjyIQgNDrYW+J2uL48/MKDCJvWzN9+NDH2JQGkOY+
 Tp9zgdGxPlALJYi0=
X-Received: by 2002:adf:f04a:0:b0:2ca:e8c2:6d25 with SMTP id
 t10-20020adff04a000000b002cae8c26d25mr6959249wro.60.1678110281289; 
 Mon, 06 Mar 2023 05:44:41 -0800 (PST)
X-Google-Smtp-Source: AK7set9MPi3TYZgxEeKUP6Nb5Wq06OggHReKEaMPeSb9wJJdXdCTbCgWGRUijzy1YXNDOr6yQIqyjA==
X-Received: by 2002:adf:f04a:0:b0:2ca:e8c2:6d25 with SMTP id
 t10-20020adff04a000000b002cae8c26d25mr6959239wro.60.1678110280985; 
 Mon, 06 Mar 2023 05:44:40 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 m14-20020adffe4e000000b002c54c8e70b1sm10142871wrs.9.2023.03.06.05.44.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 05:44:40 -0800 (PST)
Date: Mon, 6 Mar 2023 13:44:38 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, quintela@redhat.com,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH] tests/qtest/migration-test: Disable
 migration/multifd/tcp/plain/cancel
Message-ID: <ZAXuRp4p7heAbFtF@work-vm>
References: <20230302172211.4146376-1-peter.maydell@linaro.org>
 <ZADeLNaltLAZ9BU8@redhat.com> <87edq6i4jf.fsf@secure.mitica>
 <CAFEAcA8aKkFse_nfoKSPA--QdQnB1xVZyMQoQWfqpf4yyxtzDA@mail.gmail.com>
 <188bd1ff-4ea2-6d92-2b6e-6f19af3df232@redhat.com>
 <CAFEAcA-U568vrLKHegfKQWu1RfUCRjdOKZQMoFXSde1yk4V3Wg@mail.gmail.com>
 <53ca67e4-fb2f-17ac-2087-9faa7aba5187@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <53ca67e4-fb2f-17ac-2087-9faa7aba5187@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
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

* Thomas Huth (thuth@redhat.com) wrote:
> On 03/03/2023 13.05, Peter Maydell wrote:
> > On Fri, 3 Mar 2023 at 11:29, Thomas Huth <thuth@redhat.com> wrote:
> > > 
> > > On 03/03/2023 12.18, Peter Maydell wrote:
> > > > On Fri, 3 Mar 2023 at 09:10, Juan Quintela <quintela@redhat.com> wrote:
> > > > > 
> > > > > Daniel P. Berrangé <berrange@redhat.com> wrote:
> > > > > > On Thu, Mar 02, 2023 at 05:22:11PM +0000, Peter Maydell wrote:
> > > > > > > migration-test has been flaky for a long time, both in CI and
> > > > > > > otherwise:
> > > > > > > 
> > > > > > > https://gitlab.com/qemu-project/qemu/-/jobs/3806090216
> > > > > > > (a FreeBSD job)
> > > > > > >     32/648 ERROR:../tests/qtest/migration-helpers.c:205:wait_for_migration_status: assertion failed: (g_test_timer_elapsed() < MIGRATION_STATUS_WAIT_TIMEOUT) ERROR
> > > > > > > 
> > > > > > > on a local macos x86 box:
> > > > 
> > > > 
> > > > 
> > > > > What is really weird with this failure is that:
> > > > > - it only happens on non-x86
> > > > 
> > > > No, I have seen it on x86 macos, and x86 OpenBSD
> > > > 
> > > > > - on code that is not arch dependent
> > > > > - on cancel, what we really do there is close fd's for the multifd
> > > > >     channel threads to get out of the recv, i.e. again, nothing that
> > > > >     should be arch dependent.
> > > > 
> > > > I'm pretty sure that it tends to happen when the machine that's
> > > > running the test is heavily loaded. You probably have a race condition.
> > > 
> > > I think I can second that. IIRC I've seen it a couple of times on my x86
> > > laptop when running "make check -j$(nproc) SPEED=slow" here.
> > 
> > And another on-x86 failure case, just now, on the FreeBSD x86 CI job:
> > https://gitlab.com/qemu-project/qemu/-/jobs/3870165180
> 
> And FWIW, I just saw this while doing "make vm-build-netbsd J=4":
> 
> ▶  31/645 ERROR:../src/tests/qtest/migration-test.c:1841:test_migrate_auto_converge: 'got_stop' should be FALSE ERROR

That one is kind of interesting; this is an auto converge test - so it
tries to setup migration so it won't finish, to check that the auto
converge kicks in.  Except in this case the migration *did* finish
without the autoconverge (significantly) kicking in.

So I guess any of:
  a) The CPU thread never got much CPU time so not much dirtying
happened.
  b) The bandwidth calculations might be bad enough/course enough
that it's passing the (very low) bandwidth limit due to bad
approximation at bandwidth needed.
  c) The autoconverge jump happens fast enough for that loop
to hit the got_stop in the loop time of that loop.

I guess we could:
  i) Reduce the usleep in test_migrate_auto_converge
    (So it is more likely to correctly drop out of that loop
    as soon as autoconverge kicks in)
  ii) Reduce inc_pct so that autoconverge kicks in slower
  iii) Reduce max-bandwidth in migrate_ensure_non_converge
     even further.

Dave

>  31/645 qemu:qtest+qtest-i386 / qtest-i386/migration-test                                  ERROR          25.21s   killed by signal 6 SIGABRT
> > > > QTEST_QEMU_BINARY=./qemu-system-i386 MALLOC_PERTURB_=35 G_TEST_DBUS_DAEMON=/home/qemu/qemu-test.fYHKFz/src/tests/dbus-vmstate-daemon.sh QTEST_QEMU_IMG=./qemu-img /home/qemu/qemu-test.fYHKFz/build/tests/qtest/migration-test --tap -k
> ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― ✀  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
> stderr:
> qemu: thread naming not supported on this host
> qemu: thread naming not supported on this host
> qemu: thread naming not supported on this host
> qemu: thread naming not supported on this host
> qemu: thread naming not supported on this host
> qemu: thread naming not supported on this host
> **
> ERROR:../src/tests/qtest/migration-test.c:1841:test_migrate_auto_converge: 'got_stop' should be FALSE
> 
> (test program exited with status code -6)
> 
>  Thomas
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


