Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C98A3A1AA7
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 18:16:35 +0200 (CEST)
Received: from localhost ([::1]:41014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr0sc-0006PA-AG
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 12:16:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lr0qY-0004pN-QU
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 12:14:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lr0qX-0005OS-0G
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 12:14:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623255264;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=k+qE8koPX5JptQYWO+IGESKAbsKZwSiXCfPrOWEtlYQ=;
 b=iTsV+aT5i5bFmUMLOifnapW41wlTJJE5a2ZJR7ImdU/pIkuIOIPC/IYMLDe7qJMEoJeBLf
 TcxoH0GS1AstvDFgvOlTYUKZNtOZZps1+nFs5xOJv4l2UCHCruGpyDpqgW3reXqbGi2qp5
 lTg5lIrjc10dPQKo8+CWegruPA7wyGw=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-V8OCNzVvMxWaisceY54ZYw-1; Wed, 09 Jun 2021 12:14:23 -0400
X-MC-Unique: V8OCNzVvMxWaisceY54ZYw-1
Received: by mail-ua1-f71.google.com with SMTP id
 78-20020a9f26540000b02902426fc5ddd3so133795uag.16
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 09:14:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k+qE8koPX5JptQYWO+IGESKAbsKZwSiXCfPrOWEtlYQ=;
 b=ZymBMlsxtxwSGLEwWQQYTjPMsreC3hW15ECZKFYAlpZu1gtihfgjSy5a9qNKYCMXTu
 j7L2TM0cVviBPijFdSM6tIHn/Isv4AqV7bVFQv2Mb/XWilGfPaZutlUKH1OhPJZE2JhT
 HrIgkKb/08d9QJxG089fUUraz5dvlfMl7V9gKfvsFIlDXkOx0X4HlE8uc8HsVMZzR4du
 SGbLJzVjeU/JqrZQY0Mva0bFPcBME1JdPKOHMQMpkUoAI/LVmclhVC1wVZmHDkEo6d40
 jt0+XfWUa6W27Cxw0axIzUGincvoJG/TRZfHcfhhGTAKz9Gw2Uy+ShY4B57xyA3d3p2b
 nQEA==
X-Gm-Message-State: AOAM532dUOwNfw+SKxh99rTfF1Qbi1dwcwrIDptvI5jGUbF4bZsIxUxV
 WhwQhipmgspA1M0tCj+dM+QRIeoFmdOhaOReYt2y8gQ+k99NBN+PcG3D/VtjIlikI9TDzSZ/7bI
 Z32pxvCYiFuAC4eQM3PNstmmXXinokWo=
X-Received: by 2002:ab0:60c5:: with SMTP id g5mr592053uam.5.1623255262019;
 Wed, 09 Jun 2021 09:14:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzNXmtM7IoxUkwlZCjTzoLvhws3dLdos3wdzXw0oZdjJa5+J/HD/azKJA00KIWaPjp39xObb2BwyB57WM2OsBk=
X-Received: by 2002:ab0:60c5:: with SMTP id g5mr592005uam.5.1623255261765;
 Wed, 09 Jun 2021 09:14:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210608031425.833536-1-crosa@redhat.com>
 <20210608031425.833536-3-crosa@redhat.com>
 <eee53288-6f8e-1d33-68a1-83a5f78316d1@redhat.com>
In-Reply-To: <eee53288-6f8e-1d33-68a1-83a5f78316d1@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 9 Jun 2021 13:13:55 -0300
Message-ID: <CAKJDGDZaHshf_1VhKNg4Su94Au+sQznTpvpskHChtN+HzEYkqg@mail.gmail.com>
Subject: Re: [PATCH v6 2/4] Jobs based on custom runners: build environment
 docs and playbook
To: Wainer Moschetta <wainersm@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Erik Skultety <eskultet@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel <qemu-devel@nongnu.org>, Andrea Bolognani <abologna@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 8, 2021 at 3:48 PM Wainer dos Santos Moschetta
<wainersm@redhat.com> wrote:
>
> Hi,
>
> On 6/8/21 12:14 AM, Cleber Rosa wrote:
> > To run basic jobs on custom runners, the environment needs to be
> > properly set up.  The most common requirement is having the right
> > packages installed.
> >
> > The playbook introduced here covers the QEMU's project s390x and
> > aarch64 machines.  At the time this is being proposed, those machines
> > have already had this playbook applied to them.
> >
> > Signed-off-by: Cleber Rosa <crosa@redhat.com>
> > ---
> >   docs/devel/ci.rst                      | 30 ++++++++
> >   scripts/ci/setup/build-environment.yml | 98 ++++++++++++++++++++++++++
> >   scripts/ci/setup/inventory.template    |  1 +
> >   3 files changed, 129 insertions(+)
> >   create mode 100644 scripts/ci/setup/build-environment.yml
> >   create mode 100644 scripts/ci/setup/inventory.template
> >
> > diff --git a/docs/devel/ci.rst b/docs/devel/ci.rst
> > index 585b7bf4b8..35c6b5e269 100644
> > --- a/docs/devel/ci.rst
> > +++ b/docs/devel/ci.rst
> > @@ -26,3 +26,33 @@ gitlab-runner, is called a "custom runner".
> >   The GitLab CI jobs definition for the custom runners are located under::
> >
> >     .gitlab-ci.d/custom-runners.yml
> > +
> > +Machine Setup Howto
> > +-------------------
> > +
> > +For all Linux based systems, the setup can be mostly automated by the
> > +execution of two Ansible playbooks.  Create an ``inventory`` file
> > +under ``scripts/ci/setup``, such as this::
> Missing to mention the template file.
> > +
> > +  fully.qualified.domain
> > +  other.machine.hostname
> > +
> > +You may need to set some variables in the inventory file itself.  One
> > +very common need is to tell Ansible to use a Python 3 interpreter on
> > +those hosts.  This would look like::
> > +
> > +  fully.qualified.domain ansible_python_interpreter=/usr/bin/python3
> > +  other.machine.hostname ansible_python_interpreter=/usr/bin/python3
> > +
> > +Build environment
> > +~~~~~~~~~~~~~~~~~
> > +
> > +The ``scripts/ci/setup/build-environment.yml`` Ansible playbook will
> > +set up machines with the environment needed to perform builds and run
> > +QEMU tests.  It covers a number of different Linux distributions and
> > +FreeBSD.
> > +
> > +To run the playbook, execute::
> > +
> > +  cd scripts/ci/setup
> > +  ansible-playbook -i inventory build-environment.yml
> > diff --git a/scripts/ci/setup/build-environment.yml b/scripts/ci/setup/build-environment.yml
> > new file mode 100644
> > index 0000000000..664f2f0519
> > --- /dev/null
> > +++ b/scripts/ci/setup/build-environment.yml
> > @@ -0,0 +1,98 @@
> > +---
> > +- name: Installation of basic packages to build QEMU
> > +  hosts: all
>
> You will need to "become: yes" if the login user is not privileged, right?
>
> Or mention on the documentation how the user should configure the
> connection for privileged login.

As this will vary from system to system, I think it is worth
mentioning in the documentation it can be configured in the inventory
file, adding the variable ansible_become=yes and
ansible_become_password= if password is needed to sudo.


