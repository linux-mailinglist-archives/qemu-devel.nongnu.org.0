Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88ED850FBDA
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 13:19:10 +0200 (CEST)
Received: from localhost ([::1]:42426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njJDp-0007WD-KF
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 07:19:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1njJ9R-0002kZ-6F
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 07:14:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1njJ9M-0006kq-Sw
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 07:14:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650971672;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xhXmZG5iZwTn6+1S5FYN5Jbjka1XBNynfo9Fvu3C/hI=;
 b=hqTGIjdChRoQG0KgvCGgdOtqINWxkQlXcJ2iiL1Dv6JtdONAaHAymQasV1eCSs0hj1ysxk
 Box8jFUePgybsGhvqSwrLlj63yXn7uLF7DaH20AA8bs0P8ddD5d3zB6P4rUCQdSEpDJdIW
 q8uq/TDI/tIBcavgO8rvRtMj4Vy7QDo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-155-53eJRkoOMYapuML_bQyzWw-1; Tue, 26 Apr 2022 07:14:30 -0400
X-MC-Unique: 53eJRkoOMYapuML_bQyzWw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 68B1586B8A0
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 11:14:30 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D443463DF7;
 Tue, 26 Apr 2022 11:14:30 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0643B21E6A1F; Tue, 26 Apr 2022 13:14:29 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Victor Toso <victortoso@redhat.com>
Subject: Re: [RFC PATCH v1 0/8] qapi: add generator for Golang interface
References: <20220401224104.145961-1-victortoso@redhat.com>
Date: Tue, 26 Apr 2022 13:14:28 +0200
In-Reply-To: <20220401224104.145961-1-victortoso@redhat.com> (Victor Toso's
 message of "Sat, 2 Apr 2022 00:40:56 +0200")
Message-ID: <87bkwonlkb.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: John Snow <jsnow@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-devel@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Victor Toso <victortoso@redhat.com> writes:

> Hi,
>
> Happy 1st April. Not a joke :) /* ugh, took me too long to send */
>
> This series is about adding a generator in scripts/qapi to produce
> Go data structures that can be used to communicate with QEMU over
> QMP.
>
>
> * Why Go?
>
> There are quite a few Go projects that interact with QEMU over QMP
> and they endup using a mix of different libraries with their own
> code.
>
>
> ** Which projects?
>
> The ones I've found so far:
>
> - podman machine
>   https://github.com/containers/podman/tree/main/pkg/machine/qemu
>
> - kata-containers (govmm)
>   https://github.com/kata-containers/kata-containers/tree/main/src/runtime/pkg/govmm
>
> - lxd
>   https://github.com/lxc/lxd/tree/master/lxd/instance/drivers
>
> - kubevirt (plain json strings)
>   https://github.com/kubevirt/kubevirt
>
> (let me know if you know others)
>
>
> * But Why?
>
> I'm particularly interested in 3 out of 4 of the projects above and
> only Kubevirt uses libvirt to handle QEMU. That means that every
> QEMU releases where a QMP command, event or other data struct is
> added, removed or changed, those projects need to check what changed
> in QEMU and then address those changes in their projects, if needed.
>
> The idea behind generating Go data structures is that we can keep a
> Go module which can have releases that follow QEMU releases.

We need to look at "following the QEMU releases" a bit more closely.

Merging your patches gives us the capability to generate a Go interface
to HEAD's version of QMP.

The obvious way for an out-of-tree Go program to use this generated Go
interface is to build with a specific version of it.  It can then talk
QMP to any compatible QEMU version.

Compatibility with older QEMUs is not assured: stuff added since is
present on the Go QMP client end, but not on the QEMU QMP server end.

Compatibility with newer QEMUs is subject to our deprecation policy:

    In general features are intended to be supported indefinitely once
    introduced into QEMU.  In the event that a feature needs to be
    removed, it will be listed in this section.  The feature will remain
    functional for the release in which it was deprecated and one
    further release.  After these two releases, the feature is liable to
    be removed.

So, if you stay away from deprecated stuff, you're good for two more
releases at least.

Does this work for the projects you have in mind?

Aside: graceful degradation in case of incompatibility seems desirable.

> The project that uses this Go module, only need to bump the module
> version and it shall receive all the changes in their own vendored
> code base.

Ideally, incompatible changes that affect the Go program show up as
compile errors.  Do they?

> * Status
>
> There are a few rough edges to work on but this is usable. The major
> thing I forgot to add is handling Error from Commands. It'll be the
> first thing I'll work on next week.
>
> If you want to start using this Today you can fetch it in at
>
>     https://gitlab.com/victortoso/qapi-go/
>
> There are quite a few tests that I took from the examples in the
> qapi schema. Coverage using go's cover tool is giving `28.6% of
> statements`
>
> I've uploaded the a static generated godoc output of the above Go
> module here:
>
>     https://fedorapeople.org/~victortoso/qapi-go/rfc/victortoso.com/qapi-go/pkg/qapi/
>
>
> * License
>
> While the generator (golang.py in this series) is GPL v2, the

I'd make it v2+, just to express my displeasure with the decision to
make the initial QAPI generator v2 only for no good reason at all.

> generated code needs to be compatible with other Golang projects,
> such as the ones mentioned above. My intention is to keep a Go
> module with a MIT license.

Meh.  Can't be helped, I guess.

> * Disclaimer to reviewers
>
> This is my first serious python project so there'll be lots of
> suggetions that I'll be happy to take and learn from.
>
>
> Thanks for taking a look, let me know if you have questions, ideas
> or suggestions.
>
> Cheers,
> Victor


