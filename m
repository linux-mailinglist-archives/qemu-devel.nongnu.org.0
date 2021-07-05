Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 538DC3BBF60
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 17:29:42 +0200 (CEST)
Received: from localhost ([::1]:48696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0QXV-000559-Ap
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 11:29:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0QVM-0003Nb-8F
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 11:27:29 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:40903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0QVJ-0007xw-LV
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 11:27:27 -0400
Received: by mail-wr1-x42e.google.com with SMTP id l5so5791268wrv.7
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 08:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=rFIGOj4rMZWj/zNZ60ZFtdFaKXpKJJFPQ70S8SXQJKg=;
 b=xlX150h0Z1TGnctxKFYlUzaufNMHTwieW4pcvh4MQ2L677TUIZegeG+rmBcYlWMfdr
 aCsEfANVBMDit0BV0AK3b9b3jrQXQhitGPBnneBSBEH9SorxjwQsq9jmINvlFPYLGh9w
 CNEzhqqYE+iYvWs8mztjM0yWXLuZvRguHcfi1+IlvtBXzW+O7pGuZyW2Nn08IvS8opWV
 +P9wiqiq6DfmkhJm0ncwSHqS27Md3fm8A904egThicDzLKy1pcUSj4IprjGCCZl1+yvT
 6ZbLxq0KpYfTNF9UpEBsWkeMwraupUlBS8gI2hc6PvKzvfrqeGDuuRGBomO94LyzJOan
 2+ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=rFIGOj4rMZWj/zNZ60ZFtdFaKXpKJJFPQ70S8SXQJKg=;
 b=EDel5Kd+3a0j88S40KkXQEqlE2d1kNdPTlah5IFk+LCRhUA4wrSfkpa9B3sIfriRds
 mXxsX2a4WFR3iqbJwsCGrJi2vLCddb/BmtUNkGzgSXrDigyAkGcOQYexjZ0JklC/Jz4c
 BSqT5flWwESBfg75wBDqSJsWMyah7U1k3C16o2X2T3YhdZc56YvMw2GSYoy3zGOdNEzU
 7y9c98u8Q+hMLJvfsEajBsUKKujo1ZQHTX6VfJih5IeyvSePJ7ZO4urWGX5S4/Yn4rlH
 meOuYYhHy7oSmBMeTmIhO9Vkt7uZwGHc49r+h5q/ha13tSy4Km3AbxvTQqbKuS66w7zR
 YDzw==
X-Gm-Message-State: AOAM530JYmBluum+SF+SWW6IGeN4LrvNHaz75dM5Kg/E5SjQ23cqKjWL
 O06jkmaAQi/zuT9D2t1jEzMolw==
X-Google-Smtp-Source: ABdhPJyOmAIeWjrk251Z8eWocHFsH37P5imKoQp0WJmLGaJt9zkCuCQnmnsX6CY/xSQ3zS+L2QPPgA==
X-Received: by 2002:a5d:4911:: with SMTP id x17mr16384364wrq.328.1625498844064; 
 Mon, 05 Jul 2021 08:27:24 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y23sm5381493wmi.28.2021.07.05.08.27.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 08:27:23 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8A88A1FF7E;
 Mon,  5 Jul 2021 16:27:22 +0100 (BST)
References: <20210623142245.307776-1-berrange@redhat.com>
 <20210623142245.307776-17-berrange@redhat.com> <87wnq43m89.fsf@linaro.org>
 <YOMdgZzikE82O290@redhat.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH v4 16/22] tests/docker: add script for automating
 container refresh
Date: Mon, 05 Jul 2021 16:26:38 +0100
In-reply-to: <YOMdgZzikE82O290@redhat.com>
Message-ID: <87lf6k3hnp.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Mon, Jul 05, 2021 at 02:44:34PM +0100, Alex Benn=C3=A9e wrote:
>>=20
>> Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
>>=20
>> > This introduces
>> >
>> >   https://gitlab.com/libvirt/libvirt-ci
>> >
>> > as a git submodule at tests/docker/libvirt-ci
>> >
>> > This submodule only needs to be checked out when needing to re-generate
>> > the files in tests/docker/dockerfiles.
>> >
>> > When a new build pre-requisite is needed for QEMU, it should be added =
to
>> > the libvirt-ci project 'qemu.yml' file, and the submodule updated to t=
he
>> > new commit.
>>=20
>> It seems a bit weird to have the canonical description of QEMU
>> dependencies live in another project does it not?
>
> Yes, this is something I've been struggling with, since there
> are varying use cases here.
>
> The "lcitool" command was originally written to automate the
> provisioning of virtual machines, suitable to act as runners
> for a CI tool.
>
> The VMs would be suitable for building a variety of projects,
> so would need to be installed with the dependancies of all
> projects. It makes sense to have the list of dependancies
> in one central place. If you have them kept in each respective
> project's git repo, then you have to checkout 20 git repos to
> get their dependancies, before you can provision the VM.
>
> It still supports VM provisioning, but now also supports
> the Dockerfile generation too in parallel. With the
> dockerfiles, you still have a need to access the dependancy
> information from outside the main project. For example,
> when building libvirt-perl.git, it wants to know the
> dependancies needed by libvirt.git, so that it can do
> a chained build of the two.
>
> Potentially libvirt would also want to build qemu.git
> first, so it can then test libvirt with latest QEMU.
>
> So these things all end up driving towards the idea of
> storing the build dependancies separate from the project.
>
> It is definitely sub-optimal though, in that it introduces
> a synchronization problem between the 2 respective git
> repos for changes.
>
> For libvirt we've mostly just accepted that pain of needing
> to merge stuff in lock-step, but I think it is worse when
> dealing with QEMU becasue the subsystem maintainer model
> means stuff merges in 2 phases, so there's not a ideal
> synchronization point.
>
>> > The 'make docker-refresh' target will then re-create all the
>> > dockerfiles with updated package lists. This ensures that all the
>> > containers get exactly the same build pre-requisite packages installed.
>> >
>> > It also facilitates the addition of containers targetting new distros
>> > or updating existing containers to new versions of the same distro,
>> > where packages might have been renamed.
>> >
>> > Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>> > ---
>> >  docs/devel/testing.rst              | 34 ++++++++++++++++--
>> >  tests/docker/Makefile.include       | 12 +++++++
>> >  tests/docker/dockerfiles-refresh.py | 56 +++++++++++++++++++++++++++++
>> >  3 files changed, 100 insertions(+), 2 deletions(-)
>> >  create mode 100755 tests/docker/dockerfiles-refresh.py
>> >
>> > diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
>> > index 4e42392810..7882db85d4 100644
>> > --- a/docs/devel/testing.rst
>> > +++ b/docs/devel/testing.rst
>> > @@ -372,8 +372,38 @@ Along with many other images, the ``centos8`` ima=
ge is defined in a Dockerfile
>> >  in ``tests/docker/dockerfiles/``, called ``centos8.docker``. ``make d=
ocker-help``
>> >  command will list all the available images.
>> >=20=20
>> > -To add a new image, simply create a new ``.docker`` file under the
>> > -``tests/docker/dockerfiles/`` directory.
>> > +Most of the existing Dockerfiles were written by hand, simply by crea=
ting a
>> > +a new ``.docker`` file under the ``tests/docker/dockerfiles/`` direct=
ory.
>> > +This has led to an inconsistent set of packages being present across =
the
>> > +different containers.
>> > +
>> > +Thus going forward, QEMU is aiming to automatically generate the Dock=
erfiles
>> > +using the ``lcitool`` program provided by the ``libvirt-ci`` project:
>> > +
>> > +  https://gitlab.com/libvirt/libvirt-ci
>> > +
>> > +In that project, there is a ``qemu.yml`` file defining the list of bu=
ild
>> > +pre-requisites needed by QEMU. This is processed together with the
>> > +``mappings.yml`` file to compute the distro specific list of package =
names.
>> > +The package names are then fed into a generator which emits a well st=
ructured
>> > +dockerfile. The set of dockerfiles which are auto-generated is define=
d in
>> > +the ``tests/docker/dockerfiles-refresh.py`` script.
>> > +
>> > +When preparing a patch series that changes dockerfiles managed by ``l=
ibvirt-ci``
>> > +tools, the following steps should be takenL
>> > +
>> > + * Fork the ``libvirt-ci`` project on gitlab
>> > +
>> > + * Prepare changes to its ``qemu.yml`` file and optionally ``mappings=
.yml``
>> > +   to define the packages to be added to QEMU's dockerfiles.
>> > +
>> > + * In QEMU run ``make docker-refresh LCITOOL=3D/path/to/libvirt-ci/lc=
itool``
>> > +   to re-create the dockerfiles in ``tests/docker/dockerfiles``
>>=20
>> If lcitool could be a pre-requisite (even as a developer only one)
>> should we consider having a submodule and QEMU mirror of it?
>
> I did have a submodule in the previous posting, but that creates its
> own pain, because there's a chicken and egg problem to updates. Stuff
> won't want to be merged into libvirt-ci.git until it is accepted by
> a QEMU maintainer, but we need the submodule update ready before
> it can be accepted by the QEMU maintainer. There's no nice way to
> break that cycle without introducing a bit of manual work and
> synchoronization at time of merge to master, which is not desirable
> for QEMU IMHO

Can't lcitool be improved to accept out-of-its-tree metadata?=20

>> > + * Submit your changes to QEMU in the normal manner
>> > +
>> > + * Submit ``libvirt-ci`` changes as a merge request, linking to the
>> > +   QEMU patch series that uses them.
>>=20
>> This just seems clunky and likely to therefor not get used. I would
>> prefer keeping the meta-data within the project, maybe with a check that
>> ensures the dockerfiles have not gone out of sync with their "idealised"
>> form.
>
>
> Regards,
> Daniel


--=20
Alex Benn=C3=A9e

