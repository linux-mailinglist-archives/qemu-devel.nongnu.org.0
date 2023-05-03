Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4B76F591B
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 15:33:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puCaE-0001IA-4c; Wed, 03 May 2023 09:31:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1puCYN-0006kX-U1
 for qemu-devel@nongnu.org; Wed, 03 May 2023 09:29:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1puCY8-0004Gl-O5
 for qemu-devel@nongnu.org; Wed, 03 May 2023 09:29:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683120579;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jMyufwcr7qO+WHneVDbEBpe6MTZ+dr/EGsvEJnJL3nI=;
 b=h+7j9R6IulWJluRC88hfbwL4m3W6pvdqgMTGDwlOGyR7L9Sarm35f/qhz+qMUuBpLNIz/Y
 wZjrZzHEANCtH9622ywKYK3D3t2RxSIHs/LUVWUogxE7AvKR18y76FkDL6zFLXXRvYqY9j
 J2ViUreNkGN2G/0f0w/u+Xl1g78lxyY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-142-55YmrM1POKG8IuEQ9t6tBA-1; Wed, 03 May 2023 09:29:38 -0400
X-MC-Unique: 55YmrM1POKG8IuEQ9t6tBA-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-2ff4bc7a6a3so3146076f8f.3
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 06:29:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683120576; x=1685712576;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jMyufwcr7qO+WHneVDbEBpe6MTZ+dr/EGsvEJnJL3nI=;
 b=eV42gPB5ylIvJ5xQuKNnPUO2A4s1IKUQMiasayme9QEzvVDRdtKyXQJd71R9saOCcM
 5383py+STF7S0JNRsvGiuYk7gUPqDyxoNlUOgbWY1Y8gVHOykiUmJ9P5eBavxlF0T8CY
 uTsKSHr9a0wtkSkccOvoPdAuur4oUzlZt6kQyKZwCdK7r+9iv87dBRQWzScpFraJdtRs
 IIIOrbm7Eim0+4pautgPsSsU6l77ofClrcHGbOoPBxVvF0exHRwh5pB2UwhupoV6zM4p
 jPNwhUwv5WnHg/DAziwcSXQxNtAOtmG4gftcxwcrvU8HYUX4W2WROjwJPuLR4CQKQQvB
 bzXw==
X-Gm-Message-State: AC+VfDwLCQaCTLjr1fbPXHyIBPfr4bdEuqyh1yKxjYbjR79xZUm6e0Q3
 JNnOyv2WW+5KNTGQMS51EeO/iqQqZs2jZo5D/TqyK/5mnmUwoGxyH269IWMK7QXVW1VffqG2ouA
 luDgTU14Acjy0dDE=
X-Received: by 2002:adf:ee45:0:b0:306:302a:3f66 with SMTP id
 w5-20020adfee45000000b00306302a3f66mr34614wro.69.1683120576485; 
 Wed, 03 May 2023 06:29:36 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4h1rzc2G+xsl/92L0/k6S5mbMFIG1HZ6ZiO4I1VW4PeJhz+Hvkw3hsrs5Uw/r3ydVAa3hbQQ==
X-Received: by 2002:adf:ee45:0:b0:306:302a:3f66 with SMTP id
 w5-20020adfee45000000b00306302a3f66mr34594wro.69.1683120576111; 
 Wed, 03 May 2023 06:29:36 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 k5-20020adff5c5000000b002f103ca90cdsm33748615wrp.101.2023.05.03.06.29.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 06:29:35 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org,  Leonardo Bras <leobras@redhat.com>,  Thomas Huth
 <thuth@redhat.com>,  Laurent Vivier <lvivier@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Peter Xu <peterx@redhat.com>,  Lukas Straub
 <lukasstraub2@web.de>,  "Daniel P. Berrange" <berrange@redhat.com>
Subject: Re: [PULL 00/21] Migration 20230428 patches
In-Reply-To: <CAFEAcA-gu1Xxp49wOdtpif-C04fFd3nFrC+qNa8NizmPq9HGLQ@mail.gmail.com>
 (Peter Maydell's message of "Wed, 3 May 2023 13:57:55 +0100")
References: <20230428191203.39520-1-quintela@redhat.com>
 <5f76c54c-b300-8597-1b4e-fd29b3603d35@linaro.org>
 <87jzxrt3u7.fsf@secure.mitica>
 <CAFEAcA_G734ap+L-YfLt5Pd65VXFm2xcx_SFwD_ke8B7pcQGbQ@mail.gmail.com>
 <87lei5sriq.fsf@secure.mitica>
 <CAFEAcA-gu1Xxp49wOdtpif-C04fFd3nFrC+qNa8NizmPq9HGLQ@mail.gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 03 May 2023 15:29:34 +0200
Message-ID: <87ttwtr1a9.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Peter Maydell <peter.maydell@linaro.org> wrote:
> On Wed, 3 May 2023 at 10:17, Juan Quintela <quintela@redhat.com> wrote:
>>
>> Peter Maydell <peter.maydell@linaro.org> wrote:
>> > On Tue, 2 May 2023 at 11:39, Juan Quintela <quintela@redhat.com> wrote:
>> >> Richard, once that we are here, one of the problem that we are having=
 is
>> >> that the test is exiting with an abort, so we have no clue what is
>> >> happening.  Is there a way to get a backtrace, or at least the number
>> >
>> > This has been consistently an issue with the migration tests.
>> > As the owner of the tests, if they are not providing you with
>> > the level of detail that you need to diagnose failures, I
>> > think that is something that is in your court to address:
>> > the CI system is always going to only be able to provide
>> > you with what your tests are outputting to the logs.
>>
>> Right now I would be happy just to see what test it is failing at.
>>
>> I am doing something wrong, or from the links that I see on richard
>> email, I am not able to reach anywhere where I can see the full logs.
>>
>> > For the specific case of backtraces from assertion failures,
>> > I think Dan was looking at whether we could put something
>> > together for that. It won't help with segfaults and the like, though.
>>
>> I am waiting for that O:-)
>>
>> > You should be able to at least get the number of the subtest out of
>> > the logs (either directly in the logs of the job, or else
>> > from the more detailed log file that gets stored as a
>> > job artefact in most cases).
>>
>> Also note that the test is stopping in an abort, with no diagnostic
>> message that I can see.  But I don't see where the abort cames from:
>
> So, as an example I took the check-system-opensuse log:
> https://gitlab.com/qemu-project/qemu/-/jobs/4201998342
>
> Use your browser's "search in web page" to look for "SIGABRT":
> it'll show you the two errors (as well as the summary at
> the bottom of the page which just says the tests aborted).
> Here's one:
>
> 5/351 qemu:qtest+qtest-x86_64 / qtest-x86_64/migration-test ERROR
> 246.12s killed by signal 6 SIGABRT
>>>> QTEST_QEMU_BINARY=3D./qemu-system-x86_64 QTEST_QEMU_IMG=3D./qemu-img
>>> MALLOC_PERTURB_=3D48
>>> QTEST_QEMU_STORAGE_DAEMON_BINARY=3D./storage-daemon/qemu-storage-daemon
>>> G_TEST_DBUS_DAEMON=3D/builds/qemu-project/qemu/tests/dbus-vmstate-daemo=
n.sh
>>> /builds/qemu-project/qemu/build/tests/qtest/migration-test --tap -k
> =E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95 =E2=9C=80 =E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95
> stderr:
> Could not access KVM kernel module: No such file or directory
> Could not access KVM kernel module: No such file or directory
> Could not access KVM kernel module: No such file or directory
> Could not access KVM kernel module: No such file or directory
> Could not access KVM kernel module: No such file or directory
> Could not access KVM kernel module: No such file or directory
> Could not access KVM kernel module: No such file or directory
> Could not access KVM kernel module: No such file or directory
> Could not access KVM kernel module: No such file or directory
> Could not access KVM kernel module: No such file or directory
> **
> ERROR:../tests/qtest/migration-helpers.c:205:wait_for_migration_status:
> assertion failed: (g_test_timer_elapsed() <
> MIGRATION_STATUS_WAIT_TIMEOUT)
> (test program exited with status code -6)
> =E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95
> =E2=96=B6 6/351 ERROR:../tests/qtest/migration-helpers.c:205:wait_for_mig=
ration_status:
> assertion failed: (g_test_timer_elapsed() <
> MIGRATION_STATUS_WAIT_TIMEOUT) ERROR
> 6/351 qemu:qtest+qtest-aarch64 / qtest-aarch64/migration-test ERROR
> 221.18s killed by signal 6 SIGABRT
>
> Looks like it failed on a timeout in the test code.

Thanks.

> I think there ought to be artefacts from the job which have a
> copy of the full log, but I can't find them: not sure if this
> is just because the gitlab UI is terrible, or if they really
> didn't get generated.

So now we are between a rock and a hard place.

We have slowed down the bandwidth for migration test because on non
loaded machines, migration was too fast to need more than one pass.

And we slowed it so much than now we hit the timer that was set at 120
seconds.

So .....

It is going to be interesting.

BTW, what procesor speed do that aarch64 machines have? Or are they so
loaded that they are efectively trashing?

2minutes for a pass looks a bit too much.

Will give a try to get this test done changing when we detect that we
don't move to the completion stage.

Thanks for the explanation on where to find the data.  The other issue
is that whan I really want is to know what test failed.  I can't see a
way to get that info.  According to Daniel answer, we don't upload that
files for tests that fail.

Later, Juan.


