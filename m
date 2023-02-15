Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6999E697A0A
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 11:39:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSFBp-00056Y-WA; Wed, 15 Feb 2023 05:39:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pSFBo-000517-Eg
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 05:39:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pSFBm-0007v1-JW
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 05:39:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676457532;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6biIQeB3UT8e5er5jruc4OV2eUNwSVbVifTYxEFkNqs=;
 b=R39Mp3NVCQamahHym1b5MsNsgTNkEjtkXRSfAX9KB5qJD370Byfp1+HusVAOWZCab0Vf30
 y611EdIv5Lc0JytBzwVgTp37nAGn9EAqyK25bBODnmxHYPadfOZNDLqp+6dWZ+ssyG8kjw
 7TK8+P/8wASyv61zmsBvbjfm/KIFzqg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-645-dwqHeb3eMPWk77hSvS1xyw-1; Wed, 15 Feb 2023 05:38:49 -0500
X-MC-Unique: dwqHeb3eMPWk77hSvS1xyw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6CFE9280BCA2;
 Wed, 15 Feb 2023 10:38:48 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.224])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 66212C15BAD;
 Wed, 15 Feb 2023 10:38:46 +0000 (UTC)
Date: Wed, 15 Feb 2023 11:38:45 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 John Snow <jsnow@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, Hanna Reitz <hreitz@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH v2 6/7] CI: Stop building docs on centos8
Message-ID: <Y+y2NTyianqKUXeK@redhat.com>
References: <20230210003147.1309376-7-jsnow@redhat.com>
 <CAFEAcA-c5y0TR8vYg_FYEmGv3mOOmBgeD0cyb+mVotsP=r-Dsw@mail.gmail.com>
 <CAFn=p-aDV9=vG6hjTWRE6c52TpYSjDBU22nthTuejDCv_XrYMQ@mail.gmail.com>
 <CAFEAcA_eGvz_BQVLhVWtedRh2mcBuMEhv0RKF+6DW4t+9FdPAw@mail.gmail.com>
 <Y+Z2Kcq17HGWuoTV@redhat.com> <87cz6cpue3.fsf@pond.sub.org>
 <Y+t1J72iMsLWXHne@redhat.com>
 <CABgObfb-_upmc=36_bnxLMCB+0KqWoZNK62rnD5KpBKhW4N+hw@mail.gmail.com>
 <Y+vEKTgwoPtj86Z1@redhat.com>
 <CABgObfbsoOGU5v-xw3LzsnknS_TFJWZBA3LGCAmOOF-uBcXziQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABgObfbsoOGU5v-xw3LzsnknS_TFJWZBA3LGCAmOOF-uBcXziQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 14.02.2023 um 21:52 hat Paolo Bonzini geschrieben:
> Il mar 14 feb 2023, 18:26 Kevin Wolf <kwolf@redhat.com> ha scritto:
> 
> > Am 14.02.2023 um 15:03 hat Paolo Bonzini geschrieben:
> > > In the case of Python the issue is not the interpreter per se, though
> > > there are a couple new feature in Python 3.7 that are quite nice (for
> > > example improved data classes[1] or context variables[2]). The main
> > > problem as far as I understood (and have seen in my experience) is
> > > linting tools. New versions fix bugs that caused false positives, but
> > > also become more strict at the same time. The newer versions at the
> > > same time are very quick at dropping support for old versions of
> > > Python; while older versions sometimes throw deprecation warnings on
> > > new versions of Python. This makes it very hard to support a single
> > > version of, say, mypy that works on all versions from RHEL8 and SLE15
> > > to Fedora 38 and Ubuntu 23.04.
> >
> > Why do we have to support a single version of mypy? What is wrong with
> > running an old mypy version with old Python version, and a newer mypy
> > with newer Python versions?
> >
> > Sure, they will complain about different things, but it doesn't feel
> > that different from supporting multiple C compilers in various versions.
> >
> 
> It's more like having to support only C++03 on RHEL 8 and only C++20 in
> Fedora 37, without even being able to use a preprocessor.
> 
> For example old versions might not understand some type annotations and
> will fail mypy altogether, therefore even with newer versions you can't
> annotate the whole source and have to fall back to non-strict mode.

Sure, using old versions restricts which features can be used. But I
suppose C++03 is (for the most part) a subset of C++20, and annotations
understood by old mypy are a subset of annotation understood by new
mypy? Which would make it something for the "shiny new feature"
department.

Don't get me wrong, I was among the first people advocating for using
mypy and I still think any improvement in type checking is something we
should take when we can. But while it may a very desirable new feature,
it still is one.

So I assume the real problem sits somewhere else? Or do we get lots of
places where new mypy requires something that old mypy complains about
and vice versa?

Kevin


