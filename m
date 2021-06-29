Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A703B7AD1
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 01:53:11 +0200 (CEST)
Received: from localhost ([::1]:59918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyNXR-0003vI-VL
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 19:53:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lyNWc-0003Ep-7S
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 19:52:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lyNWZ-0008BS-DS
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 19:52:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625010733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5w/vAlWe6dZvZBp5+5m4InDdy6kVjow0ROyMNc7q20g=;
 b=hxVEKNrjCC2CKphbRbzBtXlpcd/uaVFuKxwnN1mlGfIjWJutzw+uyHc6f4J4zBu83jMUPp
 FP/5baVHwrU6NhngebB/MsgvqB4pdSLYm1SRdHh1XEFDhb9iZuW55VXHuHrqiUZdboBQma
 YyULG3ZULItRSYSDgper1j35/fAxBQY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-507-JAQUWoDDPCKh4Dw2Oz7OSw-1; Tue, 29 Jun 2021 19:52:11 -0400
X-MC-Unique: JAQUWoDDPCKh4Dw2Oz7OSw-1
Received: by mail-ed1-f71.google.com with SMTP id
 n13-20020a05640206cdb029039589a2a771so203329edy.5
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 16:52:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5w/vAlWe6dZvZBp5+5m4InDdy6kVjow0ROyMNc7q20g=;
 b=a+ye1nDek6jQRuEmDdu+5j7ISUYllSDrWNtTfFij4i/Ok7cq/a8bAt5Mszbl6YaSLk
 +sHqgSN2OUe0vA4J4lGUEFKDYmW9yYHcUgQ9cAPYEJ41jbJcp9VTiVLdMFgvQo5ceEy1
 UIYK0rOngXHHUMgB207Rw1KuxTNpP2DIO6PE2ZNHTumdyvDY9UtgqEIrz8Fc1yeg1xYk
 knBzU7d5ApWc7Z+8k1CgYbWYMnstmXQW0nrZuoRCXt5z+Fr/aMaOX4pcVQKfLF4NuXGs
 WhZPfrlNM4UfptVJFGIADWz3EoMYzqUJoKc4+19viD4vKNRSZGQFRwruKOcNqq1aw5sT
 LfRg==
X-Gm-Message-State: AOAM530e9D+9MdD8DO36vm7JjqTrSKdC6NhNEzBoGvW51jFUcHGJQRji
 CJtiAx14hsaCSBc6euQO04K5QOHFMWFJCcvaMkuQdNBy6S+J5WAMjEfbmMcnxtyejH5ed9jrFvZ
 cHRp7q57Pdnr1E/sC+H7E78FqW9A3/bE=
X-Received: by 2002:aa7:dcd5:: with SMTP id w21mr42156142edu.144.1625010729987; 
 Tue, 29 Jun 2021 16:52:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyviBJFbc18uUo3p9A64vMenqEjhhmErsYrQfi/ijjvJtM2/6ayXdVUG4rUE3uIWc9iIkkhzYE8jOn/GFifNiQ=
X-Received: by 2002:aa7:dcd5:: with SMTP id w21mr42156116edu.144.1625010729729; 
 Tue, 29 Jun 2021 16:52:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210608031425.833536-1-crosa@redhat.com>
 <20210608031425.833536-4-crosa@redhat.com>
 <4a79972b-9fe3-cb1b-6bd0-0b73f3797dbc@redhat.com>
In-Reply-To: <4a79972b-9fe3-cb1b-6bd0-0b73f3797dbc@redhat.com>
From: Cleber Rosa <crosa@redhat.com>
Date: Tue, 29 Jun 2021 19:51:58 -0400
Message-ID: <CA+bd_6+EPk033D8VuB6Bi3x2vz8eHVhvyyh=8aTVSKG47w-0Kw@mail.gmail.com>
Subject: Re: [PATCH v6 3/4] Jobs based on custom runners: docs and
 gitlab-runner setup playbook
To: Wainer dos Santos Moschetta <wainersm@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 8, 2021 at 3:04 PM Wainer dos Santos Moschetta
<wainersm@redhat.com> wrote:
>
> Hi,
>
> On 6/8/21 12:14 AM, Cleber Rosa wrote:
> > To have the jobs dispatched to custom runners, gitlab-runner must
> > be installed, active as a service and properly configured.  The
> > variables file and playbook introduced here should help with those
> > steps.
> >
> > The playbook introduced here covers the Linux distributions and
> > has been primarily tested on OS/machines that the QEMU project
> > has available to act as runners, namely:
> >
> >   * Ubuntu 20.04 on aarch64
> >   * Ubuntu 18.04 on s390x
> >
> > But, it should work on all other Linux distributions.  Earlier
> > versions were tested on FreeBSD too, so chances of success are
> > high.
> >
> > Signed-off-by: Cleber Rosa <crosa@redhat.com>
> > ---
> >   docs/devel/ci.rst                  | 57 ++++++++++++++++++++++++++++
> >   scripts/ci/setup/.gitignore        |  1 +
> >   scripts/ci/setup/gitlab-runner.yml | 61 ++++++++++++++++++++++++++++++
> >   scripts/ci/setup/vars.yml.template | 12 ++++++
> >   4 files changed, 131 insertions(+)
> >   create mode 100644 scripts/ci/setup/.gitignore
> >   create mode 100644 scripts/ci/setup/gitlab-runner.yml
> >   create mode 100644 scripts/ci/setup/vars.yml.template
> >
> > diff --git a/docs/devel/ci.rst b/docs/devel/ci.rst
> > index 35c6b5e269..bbd89e54d7 100644
> > --- a/docs/devel/ci.rst
> > +++ b/docs/devel/ci.rst
> > @@ -56,3 +56,60 @@ To run the playbook, execute::
> >
> >     cd scripts/ci/setup
> >     ansible-playbook -i inventory build-environment.yml
> > +
> > +gitlab-runner setup and registration
> > +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > +
> > +The gitlab-runner agent needs to be installed on each machine that
> > +will run jobs.  The association between a machine and a GitLab project
> > +happens with a registration token.  To find the registration token for
> > +your repository/project, navigate on GitLab's web UI to:
> > +
> > + * Settings (the gears like icon), then
> > + * CI/CD, then
> > + * Runners, and click on the "Expand" button, then
> > + * Under "Set up a specific Runner manually", look for the value under
> > +   "Use the following registration token during setup"
> > +
> > +Copy the ``scripts/ci/setup/vars.yml.template`` file to
> > +``scripts/ci/setup/vars.yml``.  Then, set the
> > +``gitlab_runner_registration_token`` variable to the value obtained
> > +earlier.
> > +
> > +.. note:: gitlab-runner is not available from the standard location
> > +          for all OS and architectures combinations.  For some systems,
> > +          a custom build may be necessary.  Some builds are avaiable
> > +          at https://cleber.fedorapeople.org/gitlab-runner/ and this
> > +          URI may be used as a value on ``vars.yml``
> I think you can remove the information about the gitlab-running being
> not available for some systems.

Good catch!

> > +
> > +To run the playbook, execute::
> > +
> > +  cd scripts/ci/setup
> > +  ansible-playbook -i inventory gitlab-runner.yml
> > +
> > +Following the registration, it's necessary to configure the runner tags,
> > +and optionally other configurations on the GitLab UI.  Navigate to:
> > +
> > + * Settings (the gears like icon), then
> > + * CI/CD, then
> > + * Runners, and click on the "Expand" button, then
> > + * "Runners activated for this project", then
> > + * Click on the "Edit" icon (next to the "Lock" Icon)
> > +
> > +Under tags, add values matching the jobs a runner should run.  For a
> > +Ubuntu 20.04 aarch64 system, the tags should be set as::
> > +
> > +  ubuntu_20.04,aarch64
>
> Also users no longer need manually create the tags.
>

Of course.  But, given that this is a general rule, and there may be
OS/architectures for which Ansible may produce tag names one would not
expect, I'll ask the user to double check the tags. The text I'm
proposing on v7 is:

Tags are very important as they are used to route specific jobs to
specific types of runners, so it's a good idea to double check that
the automatically created tags are consistent with the OS and
architecture.  For instance, an Ubuntu 20.04 aarch64 system should
have tags set as::

  ubuntu_20.04,aarch64


> Remaining of the file looks good to me.
>

Thanks a lot!
- Cleber.


