Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4FAE62A18E
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 19:48:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ov0yo-00022M-04; Tue, 15 Nov 2022 13:48:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ov0yd-0001zd-2z
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 13:48:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ov0yb-00082I-3p
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 13:48:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668538084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=flpb4Qr2aU4JPju1FKOHL09MBqlDw2hNSJSJkrkD/lE=;
 b=hv6tunuqqQg8XyERlO1DeF7pd2+MxbiCMHktmKlhv4UPaVwjmFOkTztbybA16EOXha8zwa
 lR1MfaCvEodFjheizKOw9kV1xG+1FKsj8i69jTxH+JpsHTUqW0NlN9tXc7X4le2ierL5AP
 luvlwlfeNFOnE8qup1YcUbgEyhAx6h4=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-437-FPZe5R4mN8m4DAnm5jkn5Q-1; Tue, 15 Nov 2022 13:47:58 -0500
X-MC-Unique: FPZe5R4mN8m4DAnm5jkn5Q-1
Received: by mail-lf1-f72.google.com with SMTP id
 13-20020ac2484d000000b004a22f42201eso4410529lfy.17
 for <qemu-devel@nongnu.org>; Tue, 15 Nov 2022 10:47:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=flpb4Qr2aU4JPju1FKOHL09MBqlDw2hNSJSJkrkD/lE=;
 b=zzvCCw0k0J70e3oN3rDqUQABtq2vG6sf6V9OiEuGfGdzNeqbgPSIDtZKQC0sAMj92d
 cvLnTded0DzVq2SCikL/6PvkbNUP/4wRRSaLg3v/4cq3Q5AYn5DqbwiSHw5N1jO0z7ar
 nLDdXOKGUQXKPpcTqALBKa5CZq60hefkoo/NNlGHHerCZKPCNRdtBKmD0ulVGuNwl024
 X1/WFkriRxXd55OASJGlBmR6EA/8uTA586F68BoIlW6EfYQdpOsCYdXBcVVrqAVWA17s
 CUKq+uuIuIDceOCKnRYcBCe7AIERZQkDehJ3wh6+/2Mpvb+PiFdnOCo9fVyjYYtUEmCK
 sFIQ==
X-Gm-Message-State: ANoB5pmNxyhFQbadfvYlDG2dTB3EKWVxawK5ytECSeX2bf9GHcFl8ewS
 wQZvQOIuaU4cZUbKIPWxQfUPyKbnhncjNjH7Wgf5TVb8c+MuzxJDHbU3/rKLt3gtpID0xjbIeyj
 m+0cnr0t+WE0qhe4t4kS4hW45fgoXdCY=
X-Received: by 2002:ac2:5ca4:0:b0:494:6b75:2c1b with SMTP id
 e4-20020ac25ca4000000b004946b752c1bmr6946992lfq.478.1668538077333; 
 Tue, 15 Nov 2022 10:47:57 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5u1XJHbXeaZmpo5TyaPHcg/nCAf9rv7flbv1Ni4nKS/KLLl/E+HpvDEyhFgkChbMqSXhzknjg1pFFCOGxTOIU=
X-Received: by 2002:ac2:5ca4:0:b0:494:6b75:2c1b with SMTP id
 e4-20020ac25ca4000000b004946b752c1bmr6946987lfq.478.1668538077044; Tue, 15
 Nov 2022 10:47:57 -0800 (PST)
MIME-Version: 1.0
References: <CAFn=p-YFQdO+ZfAYVw+T1b16kA2jBVZB7Tpy7J68XYbqgT7UZw@mail.gmail.com>
 <CAARzgwyzQ-k5Ek-kpFfvLdgD=TLe2EsW6XcBKJqNvUNYN5Qq=g@mail.gmail.com>
 <CAFn=p-ZP8_mZa4nmTFFas8pJUsCqvh+VoWWYFHVXRUBm1HZrOA@mail.gmail.com>
 <CAARzgwxBu+FnM49Mg5Vq+E-VSjvPZTY+i3QP-WbD4oOLzTViPw@mail.gmail.com>
 <CAARzgwzwv3u22jaBroHPFQfCvS5ohekiqBqM6dEBX17LX=fV1g@mail.gmail.com>
 <CAARzgwxx186T2vS0vhZcMH+4A4DMhH+EVJLkYv7UunucFwT=rw@mail.gmail.com>
In-Reply-To: <CAARzgwxx186T2vS0vhZcMH+4A4DMhH+EVJLkYv7UunucFwT=rw@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 15 Nov 2022 13:47:44 -0500
Message-ID: <CAFn=p-bN0hPemrgS6jTgqHurP=jGKHOx2z7_qzaoPOjL=AMZNA@mail.gmail.com>
Subject: Re: biosbits test failing on origin/master
To: Ani Sinha <ani@anisinha.ca>
Cc: qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Tue, Nov 15, 2022 at 9:31 AM Ani Sinha <ani@anisinha.ca> wrote:
>
> On Tue, Nov 15, 2022 at 3:36 PM Ani Sinha <ani@anisinha.ca> wrote:
> >
> > On Tue, Nov 15, 2022 at 9:07 AM Ani Sinha <ani@anisinha.ca> wrote:
> > >
> > > On Tue, Nov 15, 2022 at 5:13 AM John Snow <jsnow@redhat.com> wrote:
> > > >
> > > > On Thu, Nov 10, 2022 at 11:22 PM Ani Sinha <ani@anisinha.ca> wrote:
> > > > >
> > > > > On Thu, Nov 10, 2022 at 11:37 PM John Snow <jsnow@redhat.com> wrote:
> > > > > >
> > > > > > Hiya, on today's origin/master
> > > > > > (2ccad61746ca7de5dd3e25146062264387e43bd4) I'm finding that "make
> > > > > > check-avocado" is failing on the new biosbits test on my local
> > > > > > development machine:
> > > > > >
> > > > > >  (001/193) tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smbios_bits:
> > > > > > FAIL: True is not false : The VM seems to have failed to shutdown in
> > > > > > time (83.65 s)
> > > > > >
> > > > > > Is this a known issue, or should I begin to investigate it?
> > > > >
> > > > > In my test environment it does pass.
> > > > >
> > > > > $ ./tests/venv/bin/avocado run -t acpi tests/avocado
> > > > > Fetching asset from
> > > > > tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smbios_bits
> > > > > JOB ID     : 35726df7d3c2e0f41847822620c78195ba45b9b9
> > > > > JOB LOG    : /home/anisinha/avocado/job-results/job-2022-11-11T09.42-35726df/job.log
> > > > >  (1/1) tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smbios_bits:
> > > > > PASS (57.57 s)
> > > > > RESULTS    : PASS 1 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0
> > > > > | CANCEL 0
> > > > > JOB TIME   : 63.82 s
> > > > >
> > > > > However, I have seen that on certain slower test machines or when run
> > > > > within a virtual machine, the test can take longer to complete and 60
> > > > > secs may not always be enough. In those cases raising the maximum
> > > > > completion time to 90 secs helps. Perhaps you can try this and let me
> > > > > know if it helps:
> > > >
> > > > Hmm - I'm running on a fairly modern machine and not in a VM. Do you
> > > > have an invocation to share that exists outside of the avocado
> > > > machinery
> > >
> > > If you pass V=1 in the environment then it dumps the QEMU command line
> > > that was used to run the test. You also need to comment out the line
> > > > shutil.rmtree(self._workDir)
> > > in tearDown() so that the iso is not cleaned up.
> >
> > Maybe I will send out this patch once we have figured out what is
> > going on with your environment:
> > https://gitlab.com/anisinha/qemu/-/commit/5e8c629fdecc7cb650e4acaad8a8fcc2b248434e
> >
> > I ran the test on another box sitting in my office running centos7.9
> > and it passed as well.
>
> For the records,
> I ran make check-avocado on my Ubuntu 222.04 laptop:
> https://pastebin.com/0ZKEEQds
> On a separate centos 7.9 box (fairly new) : https://pastebin.com/QWLGDbp4

As a question: Is it necessary to implement your own timeout here?
What's wrong with relying on Avocado's timeout?
My hunch is that you'll get greater flexibility by leaning into the
tool suite's configuration instead of hardcoding your own...

For what it's worth, I am now trying to run this test manually by doing:

> time ./qemu-system-x86_64 -cdrom /var/tmp/acpi-bits-b_br0ch8.tmp/bits-2020.iso -icount auto

This is not a quick test:

________________________________________________________
Executed in   86.50 secs    fish           external
   usr time   86.57 secs    0.00 micros   86.57 secs
   sys time    0.30 secs  903.00 micros    0.29 secs


This isn't the *most* cutting edge machine, but it's a Intel(R)
Core(TM) i7-9850H CPU @ 2.60GHz with 32GB of memory and NVME storage.
Is your machine really passing this test in under 60 seconds flat?


--js


