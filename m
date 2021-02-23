Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA980322D51
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 16:20:31 +0100 (CET)
Received: from localhost ([::1]:60540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEZUE-0008Ct-W1
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 10:20:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lEZTD-0007BA-HO
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 10:19:27 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:35354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lEZTB-0007jW-Jr
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 10:19:27 -0500
Received: by mail-wr1-x42b.google.com with SMTP id l12so22946706wry.2
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 07:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=jOCIDo7lXqBLfeakmS3tH81H46nrC2TXmH2s+e9BuY4=;
 b=g62gsBbUAd2/QVTwVtYLR+6an9IVntnEikg83Gq0kS6ibw8EEVXR+MeVi6IFGUdS2L
 We7ZAOTeSagAkdNVXsrtIM39RDNrRhS4LgfFyGVEGJiGoa5Kw8YOdNwriLgVb3+FNHo2
 icYvVtlaN1fXwTRxzTi1YBbjXh4ja3fJqzFqD1LRvbAesfqvSSRZCAMxfRnpGGhepq13
 UEO6eUUe0ZWxxei+y6JVosSW5TkRQdd4A5AsfFqH0oZmIDT3crf8xW/5rrgU27x1hI0p
 z4snpQ5EG+sA5NoEOyOPeO/VADpQkhrf+kPxSAuRv/NfJw7NopaNY1fxLJITOzqy4ooD
 +dEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=jOCIDo7lXqBLfeakmS3tH81H46nrC2TXmH2s+e9BuY4=;
 b=fP/vO9rfZEKmizmkNrfDfzxgk+chiBumcQ5MPsvAmy4BQf1wclyOwWVHyDggH9priR
 8KLOHWc4UVH8XRKYHKVdJzBdU5EUzRTvw5QxjsC5z0ouetbwVKuJK91XOIr7ZZZ4xuVw
 5eTu74Xr3yi+xKyLwPIQu/yPrXoZDdQZ1fesb+s3de6pe/e81JSnrpDACJTNMPZJjLfT
 tC3DRe+WeSBHa6BTuVV/q6H1XaPCT70i/QWgHdaaftNhVW7rbfesN0y0jtSCjJU6uSGa
 cEdGQajV0HaQTeBOwWL5lKNzBnhyVBXpARhk/RgMUSeFfjWEvEHoMrBzSYmR5KOkTtWP
 CoSg==
X-Gm-Message-State: AOAM533KlpipKUhRS3fmpdJhvGh+VCpXGjvggmTvoDglsFEXky5ECIIg
 Ok5is//EMXE7ID5AF/gArcvQLA==
X-Google-Smtp-Source: ABdhPJxy1wVEmbQuN3jdKZTcZFZAT4xAgg3u3BnPdLEodcH1SHF49rKLQkkV8sZs2wVUcO+uamrMAQ==
X-Received: by 2002:adf:81f7:: with SMTP id 110mr26855968wra.35.1614093564030; 
 Tue, 23 Feb 2021 07:19:24 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c12sm21499035wru.71.2021.02.23.07.19.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Feb 2021 07:19:23 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 753E71FF7E;
 Tue, 23 Feb 2021 15:19:22 +0000 (GMT)
References: <20210219215838.752547-1-crosa@redhat.com>
 <20210219215838.752547-3-crosa@redhat.com> <87im6i4znx.fsf@linaro.org>
 <YDUWdeTcyf0Fwn/w@nautilus.local>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Erik Skultety <eskultet@redhat.com>
Subject: Re: [PATCH v5 2/4] Jobs based on custom runners: build environment
 docs and playbook
Date: Tue, 23 Feb 2021 15:17:24 +0000
In-reply-to: <YDUWdeTcyf0Fwn/w@nautilus.local>
Message-ID: <87a6ru4xs5.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>,
 Andrea Bolognani <abologna@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Erik Skultety <eskultet@redhat.com> writes:

> On Tue, Feb 23, 2021 at 02:01:53PM +0000, Alex Benn=C3=A9e wrote:
>>=20
>> Cleber Rosa <crosa@redhat.com> writes:
>>=20
>> > To run basic jobs on custom runners, the environment needs to be
>> > properly set up.  The most common requirement is having the right
>> > packages installed.
>> >
>> > The playbook introduced here covers the QEMU's project s390x and
>> > aarch64 machines.  At the time this is being proposed, those machines
>> > have already had this playbook applied to them.
>> >
>> > Signed-off-by: Cleber Rosa <crosa@redhat.com>
>> > ---
>> >  docs/devel/ci.rst                      | 30 ++++++++++
>> >  scripts/ci/setup/build-environment.yml | 76 ++++++++++++++++++++++++++
>> >  scripts/ci/setup/inventory             |  1 +
>> >  3 files changed, 107 insertions(+)
>> >  create mode 100644 scripts/ci/setup/build-environment.yml
>> >  create mode 100644 scripts/ci/setup/inventory
>> >
>> > diff --git a/docs/devel/ci.rst b/docs/devel/ci.rst
>> > index 585b7bf4b8..a556558435 100644
>> > --- a/docs/devel/ci.rst
>> > +++ b/docs/devel/ci.rst
>> > @@ -26,3 +26,33 @@ gitlab-runner, is called a "custom runner".
>> >  The GitLab CI jobs definition for the custom runners are located unde=
r::
>> >=20=20
>> >    .gitlab-ci.d/custom-runners.yml
>> > +
>> > +Machine Setup Howto
>> > +-------------------
>> > +
>> > +For all Linux based systems, the setup can be mostly automated by the
>> > +execution of two Ansible playbooks.  Start by adding your machines to
>> > +the ``inventory`` file under ``scripts/ci/setup``, such as this::
>> > +
>> > +  fully.qualified.domain
>> > +  other.machine.hostname
>>=20
>> Is this really needed? Can't the host list be passed in the command
>> line? I find it off to imagine users wanting to configure whole fleets
>> of runners.
>
> Why not support both, since the playbook execution is not wrapped by anyt=
hing,
> giving the option of using either and inventory or direct cmdline invocat=
ion
> seems like the proper way to do it.

Sure - and I dare say people used to managing fleets of servers will
want to do it properly but in the first instance lets provide the simple
command line option so a user can get up and running without also
ensuring files are in the correct format.

>
>>=20
>> > +
>> > +You may need to set some variables in the inventory file itself.  One
>> > +very common need is to tell Ansible to use a Python 3 interpreter on
>> > +those hosts.  This would look like::
>> > +
>> > +  fully.qualified.domain ansible_python_interpreter=3D/usr/bin/python3
>> > +  other.machine.hostname ansible_python_interpreter=3D/usr/bin/python3
>> > +
>> > +Build environment
>> > +~~~~~~~~~~~~~~~~~
>> > +
>> > +The ``scripts/ci/setup/build-environment.yml`` Ansible playbook will
>> > +set up machines with the environment needed to perform builds and run
>> > +QEMU tests.  It covers a number of different Linux distributions and
>> > +FreeBSD.
>> > +
>> > +To run the playbook, execute::
>> > +
>> > +  cd scripts/ci/setup
>> > +  ansible-playbook -i inventory build-environment.yml
>>=20
>> So I got somewhat there with a direct command line invocation:
>>=20
>>   ansible-playbook -u root -i 192.168.122.24,192.168.122.45 scripts/ci/s=
etup/build-environment.yml -e 'ansible_python_interpreter=3D/usr/bin/python=
3'
>>=20
>> although for some reason a single host -i fails...
>
> The trick is to end it with a ',' like "-i host1,"

Ahh found it thanks.

--=20
Alex Benn=C3=A9e

