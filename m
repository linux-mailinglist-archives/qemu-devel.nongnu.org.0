Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B27E45EF3EE
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 13:07:08 +0200 (CEST)
Received: from localhost ([::1]:33520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odrNh-000269-VY
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 07:07:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1odrCb-0005BB-LH
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 06:55:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1odrCV-0007mz-Bd
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 06:55:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664448930;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=v28foEUMrAROtC9/y0SB2k5VMFBg/xOpiGtaNn5oDrg=;
 b=V5UTTZo2jaLFk6hQB5WJ7a3eU6KABpo5yUJWbLJnWFKkWaqtRp1et6ddiYcjVtcY+Xsgl/
 CCw8vneUfCMBwPM1b+kFEf0iSMZAeWlmAFG7GYnFKEPWLK2Br7ekoL8OWoCk/6FqvFhy6J
 YG/QwRd4VfB1j3gTvN/+x7EmXJ8eYAU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-391-L7jz6NaYMtepiD1FePAZcQ-1; Thu, 29 Sep 2022 06:55:26 -0400
X-MC-Unique: L7jz6NaYMtepiD1FePAZcQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C6EDD800186;
 Thu, 29 Sep 2022 10:55:25 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A41149BB61;
 Thu, 29 Sep 2022 10:55:25 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2BC4621E691D; Thu, 29 Sep 2022 12:55:22 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org,  qemu-block@nongnu.org,  qemu-arm@nongnu.org,
 Alex Williamson <alex.williamson@redhat.com>,  "Michael S. Tsirkin"
 <mst@redhat.com>,  Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,  Gerd
 Hoffmann <kraxel@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,  Eduardo Habkost
 <eduardo@habkost.net>,  John Snow <jsnow@redhat.com>,  Dmitry Fleytman
 <dmitry.fleytman@gmail.com>,  Jason Wang <jasowang@redhat.com>,  Stefan
 Weil <sw@weilnetz.de>,  Keith Busch <kbusch@kernel.org>,  Klaus Jensen
 <its@irrelevant.dk>,  Peter Maydell <peter.maydell@linaro.org>,  Andrey
 Smirnov <andrew.smirnov@gmail.com>,  Paul Burton <paulburton@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Subject: Re: [PATCH v2] pci: Assert that capabilities never overlap
References: <20220831013236.32937-1-akihiko.odaki@daynix.com>
 <87tu5qulay.fsf@pond.sub.org>
 <CAE=JJXdg=Miisek8WeqQ12NqL8obzmuyzD0mbv1SfiJTyVBLuw@mail.gmail.com>
 <875yi2mat1.fsf@pond.sub.org>
 <CAE=JJXcRH-0TuM7WgbM35Nb=Ud94K-LUcdzjoyJDMEuK9o=uFw@mail.gmail.com>
Date: Thu, 29 Sep 2022 12:55:22 +0200
In-Reply-To: <CAE=JJXcRH-0TuM7WgbM35Nb=Ud94K-LUcdzjoyJDMEuK9o=uFw@mail.gmail.com>
 (Akihiko Odaki's message of "Mon, 5 Sep 2022 19:11:59 +0900")
Message-ID: <87mtaitpph.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.08,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Akihiko Odaki <akihiko.odaki@daynix.com> writes:

> On Mon, Sep 5, 2022 at 6:26 PM Markus Armbruster <armbru@redhat.com> wrote:
>>
>> Akihiko Odaki <akihiko.odaki@daynix.com> writes:
>>
>> > On Fri, Sep 2, 2022 at 7:23 PM Markus Armbruster <armbru@redhat.com> wrote:
>> >>
>> >> Akihiko Odaki <akihiko.odaki@daynix.com> writes:
>> >>
>> >> > pci_add_capability appears most PCI devices. Its error handling required
>> >> > lots of code, and led to inconsistent behaviors such as:
>> >> > - passing error_abort
>> >> > - passing error_fatal
>> >> > - asserting the returned value
>> >> > - propagating the error to the caller
>> >> > - skipping the rest of the function
>> >> > - just ignoring
>> >> >
>> >> > The code generating errors in pci_add_capability had a comment which
>> >> > says:
>> >> >> Verify that capabilities don't overlap.  Note: device assignment
>> >> >> depends on this check to verify that the device is not broken.
>> >> >> Should never trigger for emulated devices, but it's helpful for
>> >> >> debugging these.
>> >> >
>> >> > Indeed vfio has some code that passes capability offsets and sizes from
>> >> > a physical device, but it explicitly pays attention so that the
>> >> > capabilities never overlap.
>> >>
>> >> I can't see that at a glance.  Can you give me a clue?
>> >>
>> >> >                             Therefore, we can always assert that
>> >> > capabilities never overlap when pci_add_capability is called, resolving
>> >> > these inconsistencies.
>> >> >
>> >> > Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>> >>
>> >
>> > Looking at vfio_add_std_cap(), and vfio_add_ext_cap() it seems that
>> > they are clipping the size of capabilities so that they do not
>> > overlap, if I read it correctly.
>>
>> If we want to deal gracefully with buggy physical devices, we need to
>> treat pdev->config[] as untrusted input.
>>
>> As far as I can tell:
>>
>> * vfio_add_capabilities() replicates the physical device's capabilities
>>   (starting at pdev->config[PCI_CAPABILITY_LIST]) in the virtual device.
>>
>> * vfio_add_std_cap() is a helper to add the tail starting at
>>   pdev->config[pos].
>>
>> Could the physical device's capabilities overlap?  If yes, what would
>> happen before and after your series?
>>
>
> When the capabilities overlap, vfio_std_cap_max_size() and
> vfio_ext_cap_max_size(), called by vfio_add_std_cap(),
> vfio_add_ext_cap() should clip the size of capabilities. Comments in
> vfio_add_std_cap() and vfio_add_ext_cap() say: "Since QEMU doesn't
> actually handle many of the config accesses, exact size doesn't seem
> worthwhile."

Weird :)

Back to your patch.  Its core is dumbing down of pci_add_capability() so
it can't fail anymore.  Instead it aborts on overlapping capabilities.
Note that it already aborts when running out of PCI config space.

The remainder of the patch simplifies callers accordingly.  Some callers
ignore the error before the patch, some abort on error, and some pass it
on to their callers.  Too much for me to review in detail.  We can talk
about ways to split it up if that's desired.

My one concern is device assignment, which should treat the device's
capabilities as untrusted input.  If you're right in that such
capabilities get truncated before they reach pci_add_capability(), then
your change from failure to abort is okay.

I'd like to leave checking your correctness argument to actual PCI
experts.


