Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC17E57A78B
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 21:54:50 +0200 (CEST)
Received: from localhost ([::1]:35958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDtIu-00089C-QA
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 15:54:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oDtHo-0006nu-RD
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 15:53:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oDtHk-0002Lb-OR
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 15:53:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658260413;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dCIm//mrVzSgwSVB2lNLBMDixGKXm6mMH5KhomgLZXo=;
 b=dQTvBBWkwejpL+7vqc1e9RqZVNFLKiVzOobXUnnKsj4L99McRXFDuA5ej4mowhWICCZiOi
 5egwh9f1bCVybGV9a4mjs7MiEWCeW7P3nJnSLr+VgUl/zeVApiwsJU+TFDKBczVMcw3+My
 qNVOFNGwCKtOXx8U09HHZpwNHdN9zTo=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-sQBzg0oxOSaE2qubJT8J4Q-1; Tue, 19 Jul 2022 15:53:32 -0400
X-MC-Unique: sQBzg0oxOSaE2qubJT8J4Q-1
Received: by mail-qt1-f198.google.com with SMTP id
 r5-20020ac85c85000000b0031ecf611c64so10969569qta.23
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 12:53:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=dCIm//mrVzSgwSVB2lNLBMDixGKXm6mMH5KhomgLZXo=;
 b=WeKy3AWI+HbVDbSMeqChcX4hlU9CrhtDt3R7omUsXQk36XQJ6M6/GSl8pwow+MpAfr
 brS1J9vketJo7eSoFEeMnCmpVVWBTkpFytPdFbpbiXNV70wlIw/hM0asUpoADDBiYMtq
 cV5QWchrGiBp5zM54pcgA1fMwg9amdm1MEPu/Wwn/znE1+re1Y0eNl8Jm5frC7zrtQ1W
 Xy6wyihfSknnLnfOpjuAKa67TBYzyn3gYX9Ik6XIpvLXteZUsdy8PZGf2pTt+VBu03uq
 gDVciK9++ZxEtsPlXOhppy0kYQlqDtOHYX+x7r9meREvTl412KsP2IVhgRpVY0IQnDlS
 YraQ==
X-Gm-Message-State: AJIora9C7k2bew4UyG1Ns+1OrGfer7r9Genvl3XTyDaoD7Dt/v9fUddV
 ykZBBJD8xFkG3GPk2O0QN9LliX88k6AbZlV7OJZy+c5+faW3BJvEGsi0A0+06/xaZ4X5+YcKLuf
 nQcz1PmvXBZenb6M=
X-Received: by 2002:a05:6214:c88:b0:473:6384:6504 with SMTP id
 r8-20020a0562140c8800b0047363846504mr27091470qvr.33.1658260411009; 
 Tue, 19 Jul 2022 12:53:31 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tJYkVPjd0zE/Ivc/ttkGup9VxrgRO+DPWfOHEya+EGDnC//t1gBf+aQ8t3ncKc8gh2pkL9Sw==
X-Received: by 2002:a05:6214:c88:b0:473:6384:6504 with SMTP id
 r8-20020a0562140c8800b0047363846504mr27091458qvr.33.1658260410778; 
 Tue, 19 Jul 2022 12:53:30 -0700 (PDT)
Received: from xz-m1.local
 (bras-base-aurron9127w-grc-37-74-12-30-48.dsl.bell.ca. [74.12.30.48])
 by smtp.gmail.com with ESMTPSA id
 j18-20020ac86652000000b00304fc3d144esm11071361qtp.1.2022.07.19.12.53.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 12:53:30 -0700 (PDT)
Date: Tue, 19 Jul 2022 15:53:29 -0400
From: Peter Xu <peterx@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH] tests: migration-test: Allow test to run without uffd
Message-ID: <YtcLucZuvELrFC0f@xz-m1.local>
References: <20220707184600.24164-1-peterx@redhat.com>
 <bcd9b961-d1b5-e334-5bb1-7ee56be29725@redhat.com>
 <YtWxHSjpORK31aLs@xz-m1.local>
 <4ebe2d62-b627-3d2b-3c3e-73701fbf7be5@redhat.com>
 <YtaJg0zU8Fo3p2NB@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YtaJg0zU8Fo3p2NB@redhat.com>
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

On Tue, Jul 19, 2022 at 11:37:55AM +0100, Daniel P. Berrangé wrote:
> On Tue, Jul 19, 2022 at 12:28:24PM +0200, Thomas Huth wrote:
> > On 18/07/2022 21.14, Peter Xu wrote:
> > > Hi, Thomas,
> > > 
> > > On Mon, Jul 18, 2022 at 08:23:26PM +0200, Thomas Huth wrote:
> > > > On 07/07/2022 20.46, Peter Xu wrote:
> > > > > We used to stop running all tests if uffd is not detected.  However
> > > > > logically that's only needed for postcopy not the rest of tests.
> > > > > 
> > > > > Keep running the rest when still possible.
> > > > > 
> > > > > Signed-off-by: Peter Xu <peterx@redhat.com>
> > > > > ---
> > > > >    tests/qtest/migration-test.c | 11 +++++------
> > > > >    1 file changed, 5 insertions(+), 6 deletions(-)
> > > > 
> > > > Did you test your patch in the gitlab-CI? I just added it to my testing-next
> > > > branch and the the test is failing reproducibly on macOS here:
> > > > 
> > > >   https://gitlab.com/thuth/qemu/-/jobs/2736260861#L6275
> > > >   https://gitlab.com/thuth/qemu/-/jobs/2736623914#L6275
> > > > 
> > > > (without your patch the whole test is skipped instead)
> > > 
> > > Thanks for reporting this.
> > > 
> > > Is it easy to figure out which test was failing on your side?  I cannot
> > > easily reproduce this here on a MacOS with M1.
> > 
> > I've modified the yml file to only run the migration test in verbose mode
> > and got this:
> > 
> > ...
> > ok 5 /x86_64/migration/validate_uuid_src_not_set
> > # starting QEMU: exec ./qemu-system-x86_64 -qtest unix:/tmp/qtest-58011.sock
> > -qtest-log /dev/null -chardev socket,path=/tmp/qtest-58011.qmp,id=char0 -mon
> > chardev=char0,mode=control -display none -accel kvm -accel tcg -name
> > source,debug-threads=on -m 150M -serial
> > file:/tmp/migration-test-ef2fMr/src_serial -drive
> > file=/tmp/migration-test-ef2fMr/bootsect,format=raw  -uuid
> > 11111111-1111-1111-1111-111111111111 2>/dev/null -accel qtest
> > # starting QEMU: exec ./qemu-system-x86_64 -qtest unix:/tmp/qtest-58011.sock
> > -qtest-log /dev/null -chardev socket,path=/tmp/qtest-58011.qmp,id=char0 -mon
> > chardev=char0,mode=control -display none -accel kvm -accel tcg -name
> > target,debug-threads=on -m 150M -serial
> > file:/tmp/migration-test-ef2fMr/dest_serial -incoming
> > unix:/tmp/migration-test-ef2fMr/migsocket -drive
> > file=/tmp/migration-test-ef2fMr/bootsect,format=raw   2>/dev/null -accel
> > qtest
> > ok 6 /x86_64/migration/validate_uuid_dst_not_set
> > # starting QEMU: exec ./qemu-system-x86_64 -qtest unix:/tmp/qtest-58011.sock
> > -qtest-log /dev/null -chardev socket,path=/tmp/qtest-58011.qmp,id=char0 -mon
> > chardev=char0,mode=control -display none -accel kvm -accel tcg -name
> > source,debug-threads=on -m 150M -serial
> > file:/tmp/migration-test-ef2fMr/src_serial -drive
> > file=/tmp/migration-test-ef2fMr/bootsect,format=raw    -accel qtest
> > # starting QEMU: exec ./qemu-system-x86_64 -qtest unix:/tmp/qtest-58011.sock
> > -qtest-log /dev/null -chardev socket,path=/tmp/qtest-58011.qmp,id=char0 -mon
> > chardev=char0,mode=control -display none -accel kvm -accel tcg -name
> > target,debug-threads=on -m 150M -serial
> > file:/tmp/migration-test-ef2fMr/dest_serial -incoming
> > unix:/tmp/migration-test-ef2fMr/migsocket -drive
> > file=/tmp/migration-test-ef2fMr/bootsect,format=raw    -accel qtest
> > **
> > ERROR:../tests/qtest/migration-helpers.c:181:wait_for_migration_status:
> > assertion failed: (g_test_timer_elapsed() < MIGRATION_STATUS_WAIT_TIMEOUT)
> > Bail out!
> > ERROR:../tests/qtest/migration-helpers.c:181:wait_for_migration_status:
> > assertion failed: (g_test_timer_elapsed() < MIGRATION_STATUS_WAIT_TIMEOUT)
> 
> This is the safety net we put it to catch case where the test has
> got stuck. It is set at 2 minutes.
> 
> There's a chance that is too short, so one first step might be to
> increase to 10 minutes and see if the tests pass. If it still fails,
> then its likely a genuine bug

Agreed, it worths another try.

Thanks both for your answers on CI.  I wanted to go through the setup of
Cirrus CI and kick it myself, but I got stuck at the step on generating the
API token for Cirrus.

It seems the button to generate API token just didn't have a respond for me
until I refresh the page (then I can see some token generated), however I
still haven't figured out a way to see the initial 6 letters since they'll
be always masked out..  Changing browser didn't work for me either. :(

-- 
Peter Xu


