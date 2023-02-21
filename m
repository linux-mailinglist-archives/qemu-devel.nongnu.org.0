Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED97B69DADC
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 08:02:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUMeK-0005nU-UQ; Tue, 21 Feb 2023 02:01:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pUMeE-0005kq-DN
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 02:01:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pUMe7-0001Mb-Ac
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 02:01:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676962862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ekMcyI0hMS1ONrI4LF9Rc5sRp9CWcAmvKxREI8QMpFs=;
 b=AwKTobVH0Vdq9SFWESER5LU1WvXCWX84VVm7BoQS9qGlMNUN7ZVaq2sHT0g6h1nP8pYTai
 aAE7ZVqv7p2dgnwTt3CiHi8P054AKTc5e/wawY+b0QhVCFB+tdhYitxSca9QWQ46Nk91qV
 bBgDiaI3v17ArxVCvYpvTusRprc9Suk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-591-04UDUvBOPPaakuNyR53w6Q-1; Tue, 21 Feb 2023 02:00:59 -0500
X-MC-Unique: 04UDUvBOPPaakuNyR53w6Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8A086802C16;
 Tue, 21 Feb 2023 07:00:58 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 65DD840B4138;
 Tue, 21 Feb 2023 07:00:58 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 63FBE21E6A1F; Tue, 21 Feb 2023 08:00:57 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel@nongnu.org,  Michael Roth <michael.roth@amd.com>,  Thomas
 Huth <thuth@redhat.com>,  qemu-block@nongnu.org,  Cleber Rosa
 <crosa@redhat.com>,  Markus Armbruster <armbru@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,  Beraldo Leal
 <bleal@redhat.com>,  Kevin Wolf <kwolf@redhat.com>,  Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Hanna Reitz
 <hreitz@redhat.com>,  Alex
 =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,  Daniel Berrange
 <berrange@redhat.com>
Subject: Re: [PATCH v3 0/6] Python: Drop support for Python 3.6
References: <20230221012456.2607692-1-jsnow@redhat.com>
Date: Tue, 21 Feb 2023 08:00:57 +0100
In-Reply-To: <20230221012456.2607692-1-jsnow@redhat.com> (John Snow's message
 of "Mon, 20 Feb 2023 20:24:50 -0500")
Message-ID: <87h6vfzemu.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

John Snow <jsnow@redhat.com> writes:

> CI: https://gitlab.com/jsnow/qemu/-/pipelines/783612696
>     [Updated for v3, still all green.]
> GL: https://gitlab.com/jsnow/qemu/-/commits/python-require-37
>
> Hi, discussion about this series is ongoing. This series (v3) is not
> meant to address all of that discussion, but rather is an updated
> baseline for what we are capable of right now, today, without much
> additional engineering. It's meant to serve as a reference for further
> discussion.

Misses the RFC tag then :)

> To my knowledge, the inconveniences caused by this patchset as currently
> written are:
>
> (1) Users of CentOS 8 and OpenSUSE 15.4 would need to install an
>     additional python package that will exist side-by-side with their
>     base platform's Python 3.6 package.
>
>     "zypper install python39" or "dnf install python38" is enough;
>     configure will do the rest of the work.
>
>     It's my understanding that this is largely a non-issue.
>
> (2) Due to our Sphinx plugin that imports QAPI code from the tree,

I can read this as "Due to our Sphinx plugin (which by the way imports
some QAPI code)" or as "Due to out Sphinx plugin importing QAPI code".
The former is more accurate.  We need a newer Sphinx because we use a
plugin, the plugin is written in Python, so our new Python requirement
applies.  Fine print: the code the plugin imports from QAPI is going to
break first.

>     distro-provided versions of Sphinx that are installed and tied to
>     Python 3.6 will no longer be suitable. Users may forego building
>     docs or install a suitable sphinx using "pip".
>
>     It's my understanding that this one is "kind of a bummer".
>
> I feel that the inconvenience caused by (1) is minimized as is possible;
> the inconvenience caused by (2) is slightly worse and I concede the
> workaround has some complexities that I would otherwise seek to avoid.
>
> As far as I am aware, the way forward is to work with Paolo to implement
> a proper venv solution for the build tree that will help mitigate the
> fallout from (2) by automating the use of a pip-provided Sphinx in the
> cases where the distro-provided version is insufficient.

So, your current plan is to rebase this series less its DO-NOT-MERGE
parts, on top of Paolo's.  Correct?

> OK, seeya later!


