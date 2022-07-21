Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5ED57D33F
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 20:27:11 +0200 (CEST)
Received: from localhost ([::1]:43148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEatB-0006O8-PM
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 14:27:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oEaqv-0003fI-Rn
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 14:24:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oEaqs-0000P0-05
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 14:24:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658427883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4OBMgaw5hGWuRebVd9BfhuOJyNpl84DT3/pCT0t2mXo=;
 b=hBBB1FQRRKgLFvHxqeS8jdJTKdeMqWSfC9hAMPk7Vn0g9fYJ0IXNRrkzfH2Ip+jd8FAscs
 viYecplRHIvxQnQTnvpduxSbIeYYpB8WFKtAL2wx0t09CXB7vqkztpp/pJJ/0TIDwamBKN
 wL6nXkSVy/F/nIv7NKw4DlQLrN3ReLU=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-665-12JO-_8fPq6img2uv-sleg-1; Thu, 21 Jul 2022 14:24:42 -0400
X-MC-Unique: 12JO-_8fPq6img2uv-sleg-1
Received: by mail-qk1-f198.google.com with SMTP id
 k190-20020a37bac7000000b006af6d953751so1912054qkf.13
 for <qemu-devel@nongnu.org>; Thu, 21 Jul 2022 11:24:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=4OBMgaw5hGWuRebVd9BfhuOJyNpl84DT3/pCT0t2mXo=;
 b=Ph6/lBkyB5qEZNGt60ffKwwgZGwjHrJV0enxuOIflwykUa4MejQGSqPJFx4fkkWG6T
 OrndkA9yW3mgx8KuVWw4H6eyqAgG1jd4V7TRwnI84BKEsvoDHrFHITppyK3Pzl8pIV7g
 vHkPrdtr/7Mw5wm+3SDmYskLbxKAv9CQi4610vX0lr1scf9EmNGHiYlqET87grlJ6TiT
 S643tnXwWQOkllT6AAOJvW6bRjb2b6FiGTJVQZlujfVypsZHdr9enTIWhwaZ0+6H6dUp
 O6hosegJK2oFn6yulV58v/6kseL45iXrDadd79Dc9QqrXFcNhanVC2ROEU5AWliWC4Ud
 P+yA==
X-Gm-Message-State: AJIora+izE10F1tftHK5xxAhYXg2yOxv6DPkfDhIzUC5TkNeIMyN/aOB
 mm4VhDSLP1lBVPMUIv3FmDjyg3jkSnW7J9Xy6gev5DapcaqyTYHngyrem+mt4urXFL7JyB8FTyu
 aZJ3EP2wniioqFc0=
X-Received: by 2002:a05:620a:2904:b0:6b6:250b:fee3 with SMTP id
 m4-20020a05620a290400b006b6250bfee3mr2111299qkp.471.1658427881740; 
 Thu, 21 Jul 2022 11:24:41 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vZ/Rs2bJEyk0hys7mn7azJU7zFXRIZwW+dS4lI8jbO5xDGbO+iq/1hzThlsror1ikcwcmsqQ==
X-Received: by 2002:a05:620a:2904:b0:6b6:250b:fee3 with SMTP id
 m4-20020a05620a290400b006b6250bfee3mr2111288qkp.471.1658427881503; 
 Thu, 21 Jul 2022 11:24:41 -0700 (PDT)
Received: from xz-m1.local
 (bras-base-aurron9127w-grc-35-70-27-3-10.dsl.bell.ca. [70.27.3.10])
 by smtp.gmail.com with ESMTPSA id
 bq20-20020a05622a1c1400b00304efba3d84sm1579886qtb.25.2022.07.21.11.24.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jul 2022 11:24:40 -0700 (PDT)
Date: Thu, 21 Jul 2022 14:24:39 -0400
From: Peter Xu <peterx@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH] tests: migration-test: Allow test to run without uffd
Message-ID: <YtmZ58pcnuZvrYxF@xz-m1.local>
References: <20220707184600.24164-1-peterx@redhat.com>
 <bcd9b961-d1b5-e334-5bb1-7ee56be29725@redhat.com>
 <YtWxHSjpORK31aLs@xz-m1.local>
 <4ebe2d62-b627-3d2b-3c3e-73701fbf7be5@redhat.com>
 <YtaJg0zU8Fo3p2NB@redhat.com>
 <9240083d-ef58-466a-14c1-1c858f67e1d4@redhat.com>
 <YtgR9LL2znac2dsQ@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YtgR9LL2znac2dsQ@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 20, 2022 at 03:32:20PM +0100, Daniel P. Berrangé wrote:
> On Wed, Jul 20, 2022 at 04:11:43PM +0200, Thomas Huth wrote:
> > On 19/07/2022 12.37, Daniel P. Berrangé wrote:
> > > On Tue, Jul 19, 2022 at 12:28:24PM +0200, Thomas Huth wrote:
> > > > On 18/07/2022 21.14, Peter Xu wrote:
> > > > > Hi, Thomas,
> > > > > 
> > > > > On Mon, Jul 18, 2022 at 08:23:26PM +0200, Thomas Huth wrote:
> > > > > > On 07/07/2022 20.46, Peter Xu wrote:
> > > > > > > We used to stop running all tests if uffd is not detected.  However
> > > > > > > logically that's only needed for postcopy not the rest of tests.
> > > > > > > 
> > > > > > > Keep running the rest when still possible.
> > > > > > > 
> > > > > > > Signed-off-by: Peter Xu <peterx@redhat.com>
> > > > > > > ---
> > > > > > >     tests/qtest/migration-test.c | 11 +++++------
> > > > > > >     1 file changed, 5 insertions(+), 6 deletions(-)
> > > > > > 
> > > > > > Did you test your patch in the gitlab-CI? I just added it to my testing-next
> > > > > > branch and the the test is failing reproducibly on macOS here:
> > > > > > 
> > > > > >    https://gitlab.com/thuth/qemu/-/jobs/2736260861#L6275
> > > > > >    https://gitlab.com/thuth/qemu/-/jobs/2736623914#L6275
> > > > > > 
> > > > > > (without your patch the whole test is skipped instead)
> > > > > 
> > > > > Thanks for reporting this.
> > > > > 
> > > > > Is it easy to figure out which test was failing on your side?  I cannot
> > > > > easily reproduce this here on a MacOS with M1.
> > > > 
> > > > I've modified the yml file to only run the migration test in verbose mode
> > > > and got this:
> > > > 
> > > > ...
> > > > ok 5 /x86_64/migration/validate_uuid_src_not_set
> > > > # starting QEMU: exec ./qemu-system-x86_64 -qtest unix:/tmp/qtest-58011.sock
> > > > -qtest-log /dev/null -chardev socket,path=/tmp/qtest-58011.qmp,id=char0 -mon
> > > > chardev=char0,mode=control -display none -accel kvm -accel tcg -name
> > > > source,debug-threads=on -m 150M -serial
> > > > file:/tmp/migration-test-ef2fMr/src_serial -drive
> > > > file=/tmp/migration-test-ef2fMr/bootsect,format=raw  -uuid
> > > > 11111111-1111-1111-1111-111111111111 2>/dev/null -accel qtest
> > > > # starting QEMU: exec ./qemu-system-x86_64 -qtest unix:/tmp/qtest-58011.sock
> > > > -qtest-log /dev/null -chardev socket,path=/tmp/qtest-58011.qmp,id=char0 -mon
> > > > chardev=char0,mode=control -display none -accel kvm -accel tcg -name
> > > > target,debug-threads=on -m 150M -serial
> > > > file:/tmp/migration-test-ef2fMr/dest_serial -incoming
> > > > unix:/tmp/migration-test-ef2fMr/migsocket -drive
> > > > file=/tmp/migration-test-ef2fMr/bootsect,format=raw   2>/dev/null -accel
> > > > qtest
> > > > ok 6 /x86_64/migration/validate_uuid_dst_not_set
> > > > # starting QEMU: exec ./qemu-system-x86_64 -qtest unix:/tmp/qtest-58011.sock
> > > > -qtest-log /dev/null -chardev socket,path=/tmp/qtest-58011.qmp,id=char0 -mon
> > > > chardev=char0,mode=control -display none -accel kvm -accel tcg -name
> > > > source,debug-threads=on -m 150M -serial
> > > > file:/tmp/migration-test-ef2fMr/src_serial -drive
> > > > file=/tmp/migration-test-ef2fMr/bootsect,format=raw    -accel qtest
> > > > # starting QEMU: exec ./qemu-system-x86_64 -qtest unix:/tmp/qtest-58011.sock
> > > > -qtest-log /dev/null -chardev socket,path=/tmp/qtest-58011.qmp,id=char0 -mon
> > > > chardev=char0,mode=control -display none -accel kvm -accel tcg -name
> > > > target,debug-threads=on -m 150M -serial
> > > > file:/tmp/migration-test-ef2fMr/dest_serial -incoming
> > > > unix:/tmp/migration-test-ef2fMr/migsocket -drive
> > > > file=/tmp/migration-test-ef2fMr/bootsect,format=raw    -accel qtest
> > > > **
> > > > ERROR:../tests/qtest/migration-helpers.c:181:wait_for_migration_status:
> > > > assertion failed: (g_test_timer_elapsed() < MIGRATION_STATUS_WAIT_TIMEOUT)
> > > > Bail out!
> > > > ERROR:../tests/qtest/migration-helpers.c:181:wait_for_migration_status:
> > > > assertion failed: (g_test_timer_elapsed() < MIGRATION_STATUS_WAIT_TIMEOUT)
> > > 
> > > This is the safety net we put it to catch case where the test has
> > > got stuck. It is set at 2 minutes.
> > > 
> > > There's a chance that is too short, so one first step might be to
> > > increase to 10 minutes and see if the tests pass. If it still fails,
> > > then its likely a genuine bug
> > 
> > I tried to increase it to 5 minutes first, but that did not help. In a
> > second try, I increased it to 10 minutes, and then the test was passing,
> > indeed:
> > 
> > https://cirrus-ci.com/task/5819072351830016?logs=build#L7208
> > 
> > Could it maybe be accelerated, e.g. by tweaking the downtime limit again?
> 
> Oh when I tweaked convergance tunables i missed the auto-converge
> case as its code looks a bit different.
> 
> Possibly change test_migrate_auto_converge
> 
>     /* Now, when we tested that throttling works, let it converge */
>     migrate_set_parameter_int(from, "downtime-limit", downtime_limit);
>     migrate_set_parameter_int(from, "max-bandwidth", max_bandwidth);
> 
> to
> 
>     migrate_ensure_converge(from);

Sounds good to me.

Thomas, would that work for you too?  I'm wondering whether you'd like to
post a patch for that.

I could have reposted both patches (including what Dan suggested) but I
still have no good way to kick that macos test so I cannot verify it.  Let
me know if you want me to post those, I can do it (and test as much as I
could) but I may need some help on kicking a test to verify it.

Thanks!

-- 
Peter Xu


