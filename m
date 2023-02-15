Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2F1697A44
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 11:54:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSFQ8-0003CA-Vk; Wed, 15 Feb 2023 05:53:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pSFQ6-0003BS-UF
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 05:53:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pSFQ5-0007zh-5G
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 05:53:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676458427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cZbm6fiCPw4mTY8SuT47yYIMvoLbHRVUdq/cpNUBwVc=;
 b=SIlgIkiZwbGluDMDYx+l9BPOxrVyZ++GbwURZqI2mJO0VDl6Zl0eqFsBJP2wUab92RVJkx
 RlDi0kC+bOkERKACx7GV6X1tCszFjxvcMdyakvrc3tqM9MouWZO2YiCNqGF1LznBM0bvHt
 GQn2aQQYauict6Sj2JEz9lmLVfSSSGU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-261-423BCKxNP3yP4EdmlSQGAA-1; Wed, 15 Feb 2023 05:53:43 -0500
X-MC-Unique: 423BCKxNP3yP4EdmlSQGAA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2312929A9CB4;
 Wed, 15 Feb 2023 10:53:43 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.224])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E9EF492B0E;
 Wed, 15 Feb 2023 10:53:41 +0000 (UTC)
Date: Wed, 15 Feb 2023 11:53:39 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Cleber Rosa <crosa@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH v2 0/7] Python: Drop support for Python 3.6
Message-ID: <Y+y5szjbOR0rc1MV@redhat.com>
References: <20230210003147.1309376-1-jsnow@redhat.com>
 <CAFn=p-YHKm-Cx56bnZxSGuux_r4jELiOtxKgLbfFu+=3mmpDpA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFn=p-YHKm-Cx56bnZxSGuux_r4jELiOtxKgLbfFu+=3mmpDpA@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
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

Am 14.02.2023 um 19:35 hat John Snow geschrieben:
> On Thu, Feb 9, 2023 at 7:31 PM John Snow <jsnow@redhat.com> wrote:
> >
> > Howdy, this series increases our minimum python version to 3.7.
> >
> > CI: https://gitlab.com/jsnow/qemu/-/pipelines/771780626
> >     (All green!)
> > GL: https://gitlab.com/jsnow/qemu/-/commits/python-require-37
> >
> > Patches 1 and 2 are loose pre-requisites; I'd like to merge them into
> > qemu.git within the week whether or not we take this series. I'd
> > appreciate an "ACK" on those specifically. They're just riding along
> > here because they make this series a bit nicer.
> >
> > Patches 3-6 are the hard pre-requisites, and 7 does the dirty work.
> >
> > The motivation for this series is that Python 3.6 was EOL at the end of
> > 2021; upstream tools are beginning to drop support for it, including
> > setuptools, pylint, mypy, etc. As time goes by, it becomes more
> > difficult to support and test against the full range of Python versions
> > that QEMU supports. The closer we get to Python 3.12, the harder it will
> > be to cover that full spread of versions.
> >
> > The qemu.qmp library and the avocado testing framework both have
> > motivations for dropping 3.6 support, but are committed to not doing so
> > until QEMU drops support.
> >
> > So, I'd like to talk about doing it.
> >
> > V2:
> > - Added R-Bs to patch 1
> > - Updated commit message for patch 7 with explicit version info
> > - Added DO-NOT-MERGE to patch 5's title
> > - Tested tests/vm/freebsd, netbsd, and openbsd in addition to full CI
> >
> > RFC:
> >  - Patch 5 is just a proof-of-concept; we need to update lcitool instead.
> >  - Cleber, I need to update your ansible scripts. How do I test them?
> >
> > Thanks!
> > --js
> >
> > John Snow (7):
> >   python: support pylint 2.16
> >   python: drop pipenv
> 
> Hi, I've staged these first two patches to my Python branch.
> 
> (Kevin, Hanna; is that acceptable? I touch some iotests to do some
> trivial linting whack-a-mole.)

Yes, of course.

Kevin


