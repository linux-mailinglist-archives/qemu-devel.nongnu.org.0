Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14AEA66DB67
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 11:44:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHjSD-00030J-Lc; Tue, 17 Jan 2023 05:44:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pHjSB-000309-UF
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 05:44:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pHjSA-0006mc-8g
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 05:44:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673952269;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ASlWPCWPray7wz1nsh41TlYkzk8FODthHp+3kEiarrI=;
 b=BGEmLOa/ZqcvQL/xey3zqGWiQOyfqduqQRgIOerT9rgibW6120DSAjZo95sLYUHx17OD4W
 FTl8fmgBpFzE7cb2J5TwsL2U3GNajWkYm6aK+mleDM4AOBl5diBnM5JwJFYJhNInsXyei5
 ffFqZHymr4TstSvOvSg94ZX9MEoSH3s=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-213-tTHAegRKPj2RO46i3eLdRQ-1; Tue, 17 Jan 2023 05:44:28 -0500
X-MC-Unique: tTHAegRKPj2RO46i3eLdRQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AC48529AA389;
 Tue, 17 Jan 2023 10:44:27 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.69])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B59F91121318;
 Tue, 17 Jan 2023 10:44:26 +0000 (UTC)
Date: Tue, 17 Jan 2023 10:44:24 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH v2] tests/qtest/qom-test: Do not print tested properties
 by default
Message-ID: <Y8Z8CJoFyxB9uHqU@redhat.com>
References: <20221215153036.422362-1-thuth@redhat.com>
 <CAFEAcA_EUNGFzLh8d9631WZR+-bR8oVynBs6=FV_kmLWNx2bSg@mail.gmail.com>
 <CAFEAcA80=+dXd5uDfSd8-sAPwbrYMqaPKhLGt7w8vh3MiQwLCQ@mail.gmail.com>
 <43415e4f-c6bf-31c6-3a2e-cea86c511223@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <43415e4f-c6bf-31c6-3a2e-cea86c511223@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Jan 17, 2023 at 11:32:42AM +0100, Thomas Huth wrote:
> On 17/01/2023 11.23, Peter Maydell wrote:
> > On Mon, 16 Jan 2023 at 16:55, Peter Maydell <peter.maydell@linaro.org> wrote:
> > > 
> > > On Thu, 15 Dec 2022 at 15:30, Thomas Huth <thuth@redhat.com> wrote:
> > > > 
> > > > We're still running into the problem that some logs are cut in the
> > > > gitlab-CI since they got too big. The biggest part of the log is
> > > > still the output of the qom-test. Let's stop printing the properties
> > > > by default to get to a saner size here. The full output can still
> > > > be enabled by setting V=2 (or higher) in the environment.
> > > > 
> > > > Signed-off-by: Thomas Huth <thuth@redhat.com>
> > > > ---
> > > >   v2: Use atoi() to do proper checking of the verbosity level
> > > 
> > > Applied to master in the hope of improving the CI logs; thanks.
> > 
> > Looks like we can still hit the gitlab log limit in some
> > cases, even with this patch; here's an example job:
> > https://gitlab.com/qemu-project/qemu/-/jobs/3610621992
> 
> Ok, too bad ... three ideas to improve this situation further:
> 
> - We could shut up those "Obtaining properties of" lines by
>   default

Yes, they add little value in debugging test results from CI.

There's plenty of other largely useless junk printed too

Pages and pages of:

Looking for expected file 'tests/data/acpi/q35/FACP.memhp'
Looking for expected file 'tests/data/acpi/q35/FACP'
Using expected file 'tests/data/acpi/q35/FACP'
Looking for expected file 'tests/data/acpi/q35/APIC.memhp'
Looking for expected file 'tests/data/acpi/q35/APIC'
...

Something random that looks like bad text data

▶ 166/619 /ptimer/oneshot policy=no_immediate_����������������������������������������������������������������...snip....�������������


And what i think is test float being overly verbose

  >> Testing f16_le_quiet

  46464 tests total.

    10000
    20000
    30000
    40000
  46464 tests performed.

Could be written as

  >> Testing f16_le_quiet: 46464 tests total .... OK

(one '.' for each 10,000 tests run, before final 'OK' is printed)

> - Stop running the tests with "V=1"

Definitely not, the info about individual test cases being
executed is absolutely critical when a test hangs, so we can
narrow down what was running when it hung.

I think the key is that when we pass 'V=1' to tests, we want to
see lists of individual test cases being run, but we don't want
to see adhoc debugging output. The latter should either be deleted
if useless, or hidden by a getenv("QEMU_TESTS_DEBUG") check

> - Instead of doing "cat meson-logs/testlog.txt" in the CI
>   scripts, we switch to "tail -n 1000 meson-logs/testlog.txt"
>   instead

Tail requires that it has consumed the entire doc before it prints
anything. This in turn implies that the test suite has finished.
IOW, we'll get zero output if it hangs IIUC.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


