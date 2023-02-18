Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A40D69B91A
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Feb 2023 10:28:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pTJUx-0004Wg-8N; Sat, 18 Feb 2023 04:27:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pTJUu-0004WI-Iv
 for qemu-devel@nongnu.org; Sat, 18 Feb 2023 04:27:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pTJUs-00080h-Ci
 for qemu-devel@nongnu.org; Sat, 18 Feb 2023 04:27:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676712429;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gcNEQf5cz/ncO1PnHwrsasxGimYWG1aL1Ey8i//t1ZI=;
 b=iYi20SoGx3sMUZKxIN3590F0G6LfQk+MKBt3dtw6zdQ6Q3zm954mas3pbu1jBzfR8Z+FPi
 6xgD2rx9t89ghDsdrdbwxJDcxZ7IhtEF3jbJatc13BShT7mB9wiGFA04wwa0U8MA6rMJXI
 YQf63T9tDp9vYjvMeXQ33097ZL9EsFA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-640-YG14EKJtMxKSNqVLl5u0fg-1; Sat, 18 Feb 2023 04:27:05 -0500
X-MC-Unique: YG14EKJtMxKSNqVLl5u0fg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6E05A3C01E17;
 Sat, 18 Feb 2023 09:27:05 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F1822166B30;
 Sat, 18 Feb 2023 09:27:05 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2716821E6A1F; Sat, 18 Feb 2023 10:27:04 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,  qemu-devel@nongnu.org,  Peter
 Maydell <peter.maydell@linaro.org>,  John Snow <jsnow@redhat.com>,  Kevin
 Wolf <kwolf@redhat.com>
Subject: Re: [RFC PATCH] docs: build-platforms: refine requirements on
 Python build dependencies
References: <20230217124150.205012-1-pbonzini@redhat.com>
 <Y++dVjax+6GdtEr1@redhat.com>
Date: Sat, 18 Feb 2023 10:27:04 +0100
In-Reply-To: <Y++dVjax+6GdtEr1@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Fri, 17 Feb 2023 15:29:26 +0000")
Message-ID: <87cz67493r.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Fri, Feb 17, 2023 at 01:41:50PM +0100, Paolo Bonzini wrote:

[...]

>> This proposed update to the support policy chooses the last of these
>> possibilities.  It does by modifying two aspects of the support policy:
>>=20
>> * it introduces different support periods for *native* vs. *non-native*
>>   dependencies.  Non-native dependencies are currently Python ones only,
>>   and for simplicity the policy only mentions Python; however, the conce=
pt
>>   generalizes to other languages with a well-known upstream package
>>   manager, that users of older distributions can fetch dependencies from;
>
> I guess this would mean its applicable to perl/ruby/etc, but really
> we should be exclusively using Python for our scripting needs, except
> for legacy stuff we already have. So in practice non-native =3D=3D python.
>
> Potentially if we want to use Rust, we'd want vendoring of deps needed
> by Rust code, and that's native deps arguably, rather than non-native.
>
> Still I think it is unlikely we would replace existing working code in
> qemu.git with a rust impl, while discarding the original impl. More
> likely we'd have a Rust impl in parallel, or use Rust only for a brand
> new feature, where we don't need to support all possible old platforms.

I'm not sure.  However, there's no real need to anticipate right now how
we will use Rust; we can update our support policy when we know.

>> * it limits the support period for non-native dependencies to a fixed
>>   amount of 4 years.  This is intended to be close to the Python 5-year
>>   lifecycle while accounting for the time between a distro's feature fre=
eze
>>   and the day it's released.  This limit applies to all distro versions,
>>   not just the previous one, in order to cater for the delay of SLE 16.
>>=20
>> The 4 year cutoff in practice means that QEMU will be able to drop Python
>> 3.6 support for QEMU 7.1 (RHEL8 becomes 4 year old next May, while SLE
>> is already over the threshold).
>
> So the 4 year timeframe enables us to move off 3.6, but it is still
> potentially limiting.
>
> That doesn't explicitly allow for the case where we decide we want
> to increae min version of flake8/pylint/mypy to one that is merly
> 1 year old. As noted, covering multiple versions of these linting
> tools is a burden, as the issues reported from new versions are
> not always a superset of the old version. So it is somewhat
> desirable to fixate on a specific release, or a narrow range of
> releases.

Concur.

> I guess we can argue that any optional build time components that
> only affect testing don't need to be constrained by our platform
> policy in the first, since they are optional and don't affect the
> ability to build QEMU. Still if I'm a distro maintainer, and
> backporting patches I like to run all static analysis tools to
> catch silly python mistake that happen when cherry-picking.

Yes, but you want to run the static analysis tools required by the QEMU
you're backporting to, not the one you're backporting from (unless
you're backporting the patches needed to make the newer linters happy,
and then bump the dependencies).

> Equally if I'm a contributor working on QEMU I would like to
> run all the static linting tests available.

This one is valid.  Still, it's a "want", not a "must have".  If it was
a hard "must have", then CentOS 8 support would be in trouble: no mypy
out of the box, as far as I can tell.

We can rely on CI to find the lint.  Delays the feedback, which not
ideal, but also not unlike how we use CI to keep the build working on
all hosts (because not every developer has access to all hosts) and in a
multitude of configurations (requiring all developers to test all
configurations at all times would be impractical, so we don't).

Let's consider the special case mypy.  Right now, you have to run it
manually, but John has been working on integrating it into the build
process.  Now compare two extremes:

(A) Commit to keeping mypy happy for all versions of mypy provided by
    any supported build host

    The build runs mypy if the build host provides it.  Immediate
    feedback then, but only from a single mypy version.

    Developers still have to run all the mypy versions somehow, or else
    punt to maintainers, who may in turn punt to CI.  Delayed feedback
    from all mypy versions but one.

    We operate with the intersection of mypy features and the union of
    mypy bugs, which is bound to complicate the typing job, and may well
    limit typing power.

(B) Pick a single mypy version

    Developers have to run this mypy version, or else punt to
    maintainers.  We'll naturally pick a mypy version the maintainers
    are happy to run, so no need for them to punt to CI.  We can exploit
    the full typing power of that mypy version.  We don't have to work
    around issues older versions may have.

    Developers unable to run this mypy version locally get delayed
    feedback.  Affects the intersection of "people working on Python
    code we check with mypy" and "people developing exclusively on older
    hosts".  If we further intersect with "people doing so on a somewhat
    regular basis", I posit we get the empty set.

I think (A) is pretty much all downsides.  I like (B), but could be too
rigid in practice.  We could also

(C) Pick a narrow range range of mypy versions

> Implicit in the 4 year timeframe is that it is actually easy to
> cope with the fallout, because the long life distros support many
> newer python runtime versions. The only impact is on the need to
> use pip to grab extra pieces.
>
> So a different way of expressing this is to not limit ourselves
> by time. Instead declare that we reserve the right to bump the
> python runtime version, provided the new version is available
> from the disto as an optional alternative to the default python
> version.
>
> This would mean we would have had the option to adopt python
> 3.8 a year ago (or whenever it first became an option in RHEL
> /SLES). Today 4 years would suit our immediate needs, but John
> probably would have liked to have bumped the version last year
> already if it weren't for our support policy, and 4 year cut
> off wouldn't have helped last year.

Good points.

> Basically if it is acceptable to require a non-default python
> version, it should be ok to require that are more or less
> any time, as long as the version is available from the OS
> vendor officially.
>
>> Note that all "non-native" packages are currently build dependencies.
>> If in the future some non-native packages became runtime dependencies for
>> parts of QEMU, it would still be possible to choose any of the first
>> three possibilities for them.
>>=20
>> Another possible future change is to the way that these dependencies
>> have to be obtained by the person building QEMU.  Right now they have to
>> run pip before the build; it may be desirable for configure to set up a
>> virtual environment and download them in the same way that it populates
>> git submodules.  Just like with submodules, this would make things
>> easier for people that can afford accessing the network in their build
>> environment; the option to populate the build environment manually with
>> pip would remain for people whose build machines lack network access.
>> The change to the support policy neither requires nor forbids this chang=
e.
>>=20
>> [Thanks to Daniel P. Berrang=C3=A9, Peter Maydell and others for discuss=
ions
>>  that were copied or summarized in the above commit message]
>>=20
>> Cc: Markus Armbruster <armbru@redhat.com>
>> Cc: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>> Cc: Peter Maydell <peter.maydell@linaro.org>
>> Cc: John Snow <jsnow@redhat.com>
>> Cc: Kevin Wolf <kwolf@redhat.com>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>>  docs/about/build-platforms.rst | 19 +++++++++++++++++++
>>  1 file changed, 19 insertions(+)
>>=20
>> diff --git a/docs/about/build-platforms.rst b/docs/about/build-platforms=
.rst
>> index 1c1e7b9e11c3..e1ea09789107 100644
>> --- a/docs/about/build-platforms.rst
>> +++ b/docs/about/build-platforms.rst
>> @@ -86,6 +86,25 @@ respective ports repository, while NetBSD will use th=
e pkgsrc repository.
>>  For macOS, `Homebrew`_ will be used, although `MacPorts`_ is expected t=
o carry
>>  similar versions.
>>=20=20
>> +Python build dependencies
>> +~~~~~~~~~~~~~~~~~~~~~~~~~
>> +
>> +The minimum supported version of Python is currently 3.6.
>> +
>> +Distributions with long-term support often provide multiple
>> +versions of the Python runtime.  QEMU aims to support the default
>> +Python runtime for 4 years after the initial release of a new version.
>> +Afterwards, you may have to point QEMU to a newer version of the Python
>> +runtime using the ``--python`` command line option of the ``configure``
>> +script.
>
> My counter proposal is to remove the 4 year marker, and give us
> more flexibility:
>
>  Distributions with long-term support often provide multiple
>  versions of the Python runtime.  QEMU will initially aim to
>  support the default python runtime. QEMU reserves the right
>  to increase its minimum version to any newer python that is
>  available as an option from the vendor.

Sounds good to me.

>> +
>> +Some of QEMU's build dependencies are written in Python and available
>> +through the Python Package Index (PyPI).  QEMU aims to be compatible
>> +with the versions packaged by common Linux distributions for the first
>> +4 years after the major release of the distribution.  After 4 years,
>> +you may have to use ``pip`` to install some of these build dependencies.
>
> And for this I'd say
>
>   If QEMU bumps its minimum python version to a non-default version,
>   then it may be neccessary to fetch python modules from 'pip' to
>   build or test QEMU.

Likewise.


