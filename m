Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7574462A48A
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 22:54:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ov3rI-0002E1-Re; Tue, 15 Nov 2022 16:52:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ov3rA-0002CF-Rv
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 16:52:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ov3r4-0006Nf-Gw
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 16:52:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668549149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eSqt1xtKeAe6xRubfq3RULZIpfu/i87Yih+p2pOwZcY=;
 b=gshOg7cx4VSIjv0UbuQ8RIrO6FKeZ05GtBNMkYg5Hgl6ynGPdURMc2fGJmizk65OA5T9TH
 9MIVRCZCukp5BFwzI6sP6ukv2lkZs7xC32E2sQQhNRMEyfvHnsvAZItFaRvUuO1ddEDdkh
 TKNZFmeuRt6AKK6TuYc8AJG6MMOvDpo=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-615-TOM6-bnOMmOCSnc3LWeufQ-1; Tue, 15 Nov 2022 16:52:27 -0500
X-MC-Unique: TOM6-bnOMmOCSnc3LWeufQ-1
Received: by mail-vk1-f199.google.com with SMTP id
 j141-20020a1fa093000000b003b82d87020bso3535702vke.23
 for <qemu-devel@nongnu.org>; Tue, 15 Nov 2022 13:52:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eSqt1xtKeAe6xRubfq3RULZIpfu/i87Yih+p2pOwZcY=;
 b=1s00qZIc9ZuSFlOSeWJBuYcEDeAv21adIwYxuH8NIewta41IP+m4SWtYLpnqMjcNH4
 cFQAIgog4N/HhifM1UdSlcR2YI0KdRwgRwZFCOibEaC5bZQpNled9A7UMYtH8xwn55we
 2TO63mP8oJN/TF8Sy7tFUNrx9bZLEM6Y7DjyLaKYU7e5uloJ64s6+9WgmxPjtOO95kVy
 X1TWE3dcpCzefN4NJ1A2+PMqpO6DHIGhcREUmT6mwBDbl0jKvbApzJO1upEq4odRd37p
 HSdDdPLfv1hNji8ybRluylcClSO/khlT2pHJElUqgl82Ack05MILl9I+TKW2p1viCd9o
 kTiQ==
X-Gm-Message-State: ANoB5pl2a1DLSBnCD4vbbeMc32Fk+bpFCgozDrfSjRxc9I1rVnhyIZ1V
 TtzAvdNSSPa57xd/JnqmqF7PwSgO/iCP0h+W1b4Dn4eA5x/2/gef89YIdKddCReYZPsslpwSVSW
 eGxpNz2pi4RQi1xinwBWoj63ce/3NQLU=
X-Received: by 2002:a67:ef94:0:b0:3a6:5b26:2388 with SMTP id
 r20-20020a67ef94000000b003a65b262388mr10249059vsp.56.1668549147193; 
 Tue, 15 Nov 2022 13:52:27 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5CpiWF1TzjmB2JwjxrRvuH7Zjuhg8nQTPZ4oM8KeTBLOJSPHphy6mxEInC9KQNsQUXrlCSkElLQVupPy1Ofts=
X-Received: by 2002:a67:ef94:0:b0:3a6:5b26:2388 with SMTP id
 r20-20020a67ef94000000b003a65b262388mr10249045vsp.56.1668549146893; Tue, 15
 Nov 2022 13:52:26 -0800 (PST)
MIME-Version: 1.0
References: <CAFn=p-YFQdO+ZfAYVw+T1b16kA2jBVZB7Tpy7J68XYbqgT7UZw@mail.gmail.com>
 <CAARzgwyzQ-k5Ek-kpFfvLdgD=TLe2EsW6XcBKJqNvUNYN5Qq=g@mail.gmail.com>
 <CAFn=p-ZP8_mZa4nmTFFas8pJUsCqvh+VoWWYFHVXRUBm1HZrOA@mail.gmail.com>
 <CAARzgwxBu+FnM49Mg5Vq+E-VSjvPZTY+i3QP-WbD4oOLzTViPw@mail.gmail.com>
 <CAARzgwzwv3u22jaBroHPFQfCvS5ohekiqBqM6dEBX17LX=fV1g@mail.gmail.com>
 <CAARzgwxx186T2vS0vhZcMH+4A4DMhH+EVJLkYv7UunucFwT=rw@mail.gmail.com>
 <CAFn=p-bN0hPemrgS6jTgqHurP=jGKHOx2z7_qzaoPOjL=AMZNA@mail.gmail.com>
In-Reply-To: <CAFn=p-bN0hPemrgS6jTgqHurP=jGKHOx2z7_qzaoPOjL=AMZNA@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 15 Nov 2022 16:52:11 -0500
Message-ID: <CAFn=p-ZZxO+Cot0WC_zt+g9G2VYTm+Wbj=HZO9aWYjUHs8VcPA@mail.gmail.com>
Subject: Re: biosbits test failing on origin/master
To: Ani Sinha <ani@anisinha.ca>
Cc: qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
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

On Tue, Nov 15, 2022 at 1:47 PM John Snow <jsnow@redhat.com> wrote:
>
> On Tue, Nov 15, 2022 at 9:31 AM Ani Sinha <ani@anisinha.ca> wrote:
> >
> > On Tue, Nov 15, 2022 at 3:36 PM Ani Sinha <ani@anisinha.ca> wrote:
> > >
> > > On Tue, Nov 15, 2022 at 9:07 AM Ani Sinha <ani@anisinha.ca> wrote:
> > > >
> > > > On Tue, Nov 15, 2022 at 5:13 AM John Snow <jsnow@redhat.com> wrote:
> > > > >
> > > > > On Thu, Nov 10, 2022 at 11:22 PM Ani Sinha <ani@anisinha.ca> wrote:
> > > > > >
> > > > > > On Thu, Nov 10, 2022 at 11:37 PM John Snow <jsnow@redhat.com> wrote:
> > > > > > >
> > > > > > > Hiya, on today's origin/master
> > > > > > > (2ccad61746ca7de5dd3e25146062264387e43bd4) I'm finding that "make
> > > > > > > check-avocado" is failing on the new biosbits test on my local
> > > > > > > development machine:
> > > > > > >
> > > > > > >  (001/193) tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smbios_bits:
> > > > > > > FAIL: True is not false : The VM seems to have failed to shutdown in
> > > > > > > time (83.65 s)
> > > > > > >
> > > > > > > Is this a known issue, or should I begin to investigate it?
> > > > > >
> > > > > > In my test environment it does pass.
> > > > > >
> > > > > > $ ./tests/venv/bin/avocado run -t acpi tests/avocado
> > > > > > Fetching asset from
> > > > > > tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smbios_bits
> > > > > > JOB ID     : 35726df7d3c2e0f41847822620c78195ba45b9b9
> > > > > > JOB LOG    : /home/anisinha/avocado/job-results/job-2022-11-11T09.42-35726df/job.log
> > > > > >  (1/1) tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smbios_bits:
> > > > > > PASS (57.57 s)
> > > > > > RESULTS    : PASS 1 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0
> > > > > > | CANCEL 0
> > > > > > JOB TIME   : 63.82 s
> > > > > >
> > > > > > However, I have seen that on certain slower test machines or when run
> > > > > > within a virtual machine, the test can take longer to complete and 60
> > > > > > secs may not always be enough. In those cases raising the maximum
> > > > > > completion time to 90 secs helps. Perhaps you can try this and let me
> > > > > > know if it helps:
> > > > >
> > > > > Hmm - I'm running on a fairly modern machine and not in a VM. Do you
> > > > > have an invocation to share that exists outside of the avocado
> > > > > machinery
> > > >
> > > > If you pass V=1 in the environment then it dumps the QEMU command line
> > > > that was used to run the test. You also need to comment out the line
> > > > > shutil.rmtree(self._workDir)
> > > > in tearDown() so that the iso is not cleaned up.
> > >
> > > Maybe I will send out this patch once we have figured out what is
> > > going on with your environment:
> > > https://gitlab.com/anisinha/qemu/-/commit/5e8c629fdecc7cb650e4acaad8a8fcc2b248434e
> > >
> > > I ran the test on another box sitting in my office running centos7.9
> > > and it passed as well.
> >
> > For the records,
> > I ran make check-avocado on my Ubuntu 222.04 laptop:
> > https://pastebin.com/0ZKEEQds
> > On a separate centos 7.9 box (fairly new) : https://pastebin.com/QWLGDbp4
>
> As a question: Is it necessary to implement your own timeout here?
> What's wrong with relying on Avocado's timeout?
> My hunch is that you'll get greater flexibility by leaning into the
> tool suite's configuration instead of hardcoding your own...
>
> For what it's worth, I am now trying to run this test manually by doing:
>
> > time ./qemu-system-x86_64 -cdrom /var/tmp/acpi-bits-b_br0ch8.tmp/bits-2020.iso -icount auto
>
> This is not a quick test:
>
> ________________________________________________________
> Executed in   86.50 secs    fish           external
>    usr time   86.57 secs    0.00 micros   86.57 secs
>    sys time    0.30 secs  903.00 micros    0.29 secs
>
>
> This isn't the *most* cutting edge machine, but it's a Intel(R)
> Core(TM) i7-9850H CPU @ 2.60GHz with 32GB of memory and NVME storage.
> Is your machine really passing this test in under 60 seconds flat?
>

FWIW, I sent a patch to just disable the test-specific timeout. I
figure you had a good reason for putting it there, but I suppose
you'll tell me tomorrow what that reason was :)

I couldn't get the test to finish in under 60 seconds on this machine,
but I did manage to get it to finish in under 60 on my ... 16 core AMD
5950X. Just needed some very heavy firepower, I guess!

--js


