Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A244C628E59
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 01:30:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouj6u-0004YT-Mh; Mon, 14 Nov 2022 18:43:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ouj6s-0004Vl-4c
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:43:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ouj6q-0007bv-DO
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:43:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668469403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6jLtWp479JyXUUdNWzyr1uqSbNu5h5ZUXKoTNebt/S0=;
 b=hEBJUfp4SyUVN5iwanuHypTCiNvvkDVH/0fTBwEs9cmT752wo1eyGqfN35wyvhR512uUvF
 1Noec7mQmSxmI3SeLBG9MiQVooh10gL6iLTNI3mrfmk6zp6aLgrvANXRgCTcKOxxRfbkdG
 zOlVK9/t1tTksWC836up/QnLpvJG5tw=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-314-wPVNbUd9P3KvQy5y1Jt8Ag-1; Mon, 14 Nov 2022 18:43:21 -0500
X-MC-Unique: wPVNbUd9P3KvQy5y1Jt8Ag-1
Received: by mail-lj1-f200.google.com with SMTP id
 g3-20020a2e9cc3000000b0027760138bb9so4609927ljj.23
 for <qemu-devel@nongnu.org>; Mon, 14 Nov 2022 15:43:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6jLtWp479JyXUUdNWzyr1uqSbNu5h5ZUXKoTNebt/S0=;
 b=tgHGVgbsKk4SVPo+zgGJppzYwxt5u2jNRWaZDzMpWpvq6wcNYXTHtOJQpU6ZWHZqzE
 Ymg9ieaKc+2NYDAom4MVoBFFJiMLbJ1/Hp8KVki5g4Pftewszw/OGrxWp42gPO5eMiEO
 G+D2G2skLffAdTSm586xeVejLOc9VY/CYnqfN+2PRvlqJlUdvI3PtS/1U9gqnw+MjPvE
 sFUSNQqYCtPIVvRu7dNz9CcWhy/qQcLcPliSUe65T1ihX43fsHTdUFc+FONfKDgbelPu
 ux8cT+9tUjAP+Qf2AQFPNluvm8dU8SgvilZdCroAeHa2bzpJ2YTfaU+RAFE+OOMM86gZ
 fYFA==
X-Gm-Message-State: ANoB5pmL3oKaEDL5HT2lhtW5BMzRhcdAo9xK+v6vUnhoiFjESNgE+RYW
 yfvoxOqg2jtOuAK/OFP8kP5S362Bt952Yh9rXWcFYs2INZdMWZiGnY3iRog6n2qQmz6UuQiHpdx
 cqrkxjugclc8E9bAWfvH9wdskEaGBgOM=
X-Received: by 2002:a05:651c:14f:b0:277:31b0:8ba3 with SMTP id
 c15-20020a05651c014f00b0027731b08ba3mr5491598ljd.290.1668469399804; 
 Mon, 14 Nov 2022 15:43:19 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7PNKNw28pLjV+Oj77D0mFU04jahQ5bZk4n7G7Kv5VmMM90A4xg7xjzSX7o0mmeDwxwwQfgte4N7UCqPNm6mOM=
X-Received: by 2002:a05:651c:14f:b0:277:31b0:8ba3 with SMTP id
 c15-20020a05651c014f00b0027731b08ba3mr5491593ljd.290.1668469399532; Mon, 14
 Nov 2022 15:43:19 -0800 (PST)
MIME-Version: 1.0
References: <CAFn=p-YFQdO+ZfAYVw+T1b16kA2jBVZB7Tpy7J68XYbqgT7UZw@mail.gmail.com>
 <CAARzgwyzQ-k5Ek-kpFfvLdgD=TLe2EsW6XcBKJqNvUNYN5Qq=g@mail.gmail.com>
In-Reply-To: <CAARzgwyzQ-k5Ek-kpFfvLdgD=TLe2EsW6XcBKJqNvUNYN5Qq=g@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Date: Mon, 14 Nov 2022 18:43:07 -0500
Message-ID: <CAFn=p-ZP8_mZa4nmTFFas8pJUsCqvh+VoWWYFHVXRUBm1HZrOA@mail.gmail.com>
Subject: Re: biosbits test failing on origin/master
To: Ani Sinha <ani@anisinha.ca>
Cc: qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
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

On Thu, Nov 10, 2022 at 11:22 PM Ani Sinha <ani@anisinha.ca> wrote:
>
> On Thu, Nov 10, 2022 at 11:37 PM John Snow <jsnow@redhat.com> wrote:
> >
> > Hiya, on today's origin/master
> > (2ccad61746ca7de5dd3e25146062264387e43bd4) I'm finding that "make
> > check-avocado" is failing on the new biosbits test on my local
> > development machine:
> >
> >  (001/193) tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smbios_bits:
> > FAIL: True is not false : The VM seems to have failed to shutdown in
> > time (83.65 s)
> >
> > Is this a known issue, or should I begin to investigate it?
>
> In my test environment it does pass.
>
> $ ./tests/venv/bin/avocado run -t acpi tests/avocado
> Fetching asset from
> tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smbios_bits
> JOB ID     : 35726df7d3c2e0f41847822620c78195ba45b9b9
> JOB LOG    : /home/anisinha/avocado/job-results/job-2022-11-11T09.42-35726df/job.log
>  (1/1) tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smbios_bits:
> PASS (57.57 s)
> RESULTS    : PASS 1 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0
> | CANCEL 0
> JOB TIME   : 63.82 s
>
> However, I have seen that on certain slower test machines or when run
> within a virtual machine, the test can take longer to complete and 60
> secs may not always be enough. In those cases raising the maximum
> completion time to 90 secs helps. Perhaps you can try this and let me
> know if it helps:

Hmm - I'm running on a fairly modern machine and not in a VM. Do you
have an invocation to share that exists outside of the avocado
machinery where I could test this individually and see how long it
might take to complete if I just let it run? I am worried that it's
getting wedged instead of just taking a long time, but it's hard to
tell.

--js

>
> diff --git a/tests/avocado/acpi-bits.py b/tests/avocado/acpi-bits.py
> index 8745a58a76..b11fe39350 100644
> --- a/tests/avocado/acpi-bits.py
> +++ b/tests/avocado/acpi-bits.py
> @@ -385,8 +385,9 @@ def test_acpi_smbios_bits(self):
>          self._vm.launch()
>          # biosbits has been configured to run all the specified test suites
>          # in batch mode and then automatically initiate a vm shutdown.
> -        # sleep for maximum of one minute
> -        max_sleep_time = time.monotonic() + 60
> +        # sleep for a maximum of one and half minutes to accommodate
> running this
> +        # even on slower machines.
> +        max_sleep_time = time.monotonic() + 90
>          while self._vm.is_running() and time.monotonic() < max_sleep_time:
>              time.sleep(1)
>


