Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CB469AA90
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 12:38:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSz3Q-00005v-K9; Fri, 17 Feb 2023 06:37:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pSz3P-00005Z-6Z
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 06:37:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pSz3M-0000g5-Vl
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 06:37:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676633843;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=IG52KKtpVr/Vcwq7DYgeRSUT+dYV2l7bo2Ns1+J1Wqw=;
 b=ENXTzvjulebE1Y+JKEMPu+/y1pNsB8xkLTQ8AzXOyyXv+xKowbKhu2ZSNfQRJC1WlzEg3L
 4b0cY3XabISpBSx3E+BQxT4OS2fty1RxFeZjGhO8gijnhS7ti9KsGVIqPUJg/PTat9kN5W
 ga0OgQToy8KVETUhM3nHs30/XYbI/2I=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-397-0CE_Tq_GM7-IgMrNaX4xtw-1; Fri, 17 Feb 2023 06:37:20 -0500
X-MC-Unique: 0CE_Tq_GM7-IgMrNaX4xtw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2460829ABA08;
 Fri, 17 Feb 2023 11:37:20 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.98])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B63292026D4B;
 Fri, 17 Feb 2023 11:37:16 +0000 (UTC)
Date: Fri, 17 Feb 2023 11:37:14 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Cleber Rosa <crosa@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>
Subject: Proposed way forward Re: [PATCH v2 0/7] Python: Drop support for
 Python 3.6
Message-ID: <Y+9m6g0MAEfFNUYC@redhat.com>
References: <20230210003147.1309376-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230210003147.1309376-1-jsnow@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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

On Thu, Feb 09, 2023 at 07:31:40PM -0500, John Snow wrote:
> Howdy, this series increases our minimum python version to 3.7.

..snip...

So based on the discussion in this thread I see the following as the
key take aways:

 * Use of newer Meson feature

   We need newer meson in order to continue/finish the conversion
   of configure shell script into meson.build file logic. The newer
   meson has python 3.7 as a minimum required.

   The switch to meson was/is a significant strategic goal for
   improving QEMU build system maintainability which is thus
   highly desirable to continue without arbitrary delay.

 * Use of newer python parameter type hinting annotations

   Newer mypy supports a wider range of python type hinting
   annotations. While these ought to only impact the need for
   a new mypy for offline static analysis, in practice they
   also impact the runtime execution of the python code
   breaking compatibility with python 3.6. This unfortunate
   but out of our control.

   The wider use of type hinting in our python code is improving
   its maintainability, because it makes it significantly simpler
   for contributors to understand the behaviour of the code.


 * Use of newer python static analysis tools in general
 
   This applies to thinks like pylint, flak8, mypy (any more?)
   The issues reported by newer versions are not neccessarily
   always a strict superset of issues reports by older versions.
   Thus you can't assume that a passing result from new tools
   implies a passing result from the old tools. As such supporting
   all older versions is a cost/burden with little to no upside.

   With the exception of mypy, these aren't believed to have a
   direct bearing on the minimum python runtime version, but this
   would still technically be a deviation from our current support
   policy.


The first two points feel like pretty decent functional reasons to
justify an increase in the minimum python version. They will both
unlock the use of features that will have a tangible benefit to the
maintainability of QEMU in key areas.

If we do the first two points, then we can justify the 3rd point too
as having negligible additional downside.


The question is how to reconcile this with the platform support policy.
The policy has two goals. First to give us as maintainers a clear rule
as to when it is acceptable to increase minimum versions. The intent
is we don't need to debate the merits of each proposed change, just
validate that it follows our stated support policy. The second goal
is to give consumers of QEMU guidance as to what their platform has
to be able to provide in order to build and deploy QEMU.

The long life enterprise distros are the pain point in unlocking the
new of python features. So the proposal is that, at a minimum, we
augment the current policy with words to the effect that:

  * For long life cycle distributions, QEMU will follow normal
    policy for platform level dependancies / native code. For
    Python modules, QEMU may choose to require a newer versions
    than are available from the distribution package manager.

Potentially we could go further and reserve the right to
mandate newer python versions for any OS distro, because once
we have the facility for doing this with enterprise distros,
that shoudl just work anywhere. Perhaps start with targetted
exception at long life distros though. Either would unblock
our immediate needs wrt droppping python 3.6.

Finally, in terms of putting this into practice

  * If the OS platform doesn't provide the sufficiently new
    python modules, QEMU should default to downloading and
    installing them using pip, into a virtualenv under the
    QEMU build root so we don't impact other stuff the user
    might have in $HOME/.local/lib/python*. IIUC, the use
    of virtualenvs has been desired for a while already.

  * QEMU must provide a mechanism to disable any automatic
    downloading with pip, to allow users to pre-populate the
    addon modules if desired, to cope with scenarios where
    network access isn't available. Should be straightforward.

  * CI should continue to test all features, and be able
    to install the extra pieces with pip, if relevant for
    the distro. This should already be doable with the
    lcitool stuff Paolo has got working, which seemlessly
    uses pip on distros if needed.


So basically I'm suggesting we take a combination of John's series
here, and Paolo's series. John's last patch would change so that our
dockerfiles grab docutils with pip instead of disabling docs build
on centos8. Then look at introducing the use of virtualenvs for auto
installing any python mods the OS doesn't satisfy.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


