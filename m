Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9859E400056
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 15:17:49 +0200 (CEST)
Received: from localhost ([::1]:47570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM94m-0005j4-KS
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 09:17:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mM8w1-0007L5-6n
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 09:08:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mM8vu-0001Oj-Gh
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 09:08:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630674517;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zto7ADVC32Re5cfOuKZp3J+9L+hQoKZVLaqw8ZKMeVE=;
 b=Ga/PRmh0fgR24wUglt1vLwr3iXz5I7akAJYZ49qHzWHF9BRRJFYW3i7rUdim8V363Gyk1i
 7RK0IdRejfjxCA2QmCTJhJPHraFnZCjggDP0I3rugAMbrU1ZL1mTvQyXis3/ulRz2xITM1
 6TmJykz+CXStsXmKBGoxj/LXYMn2c2s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499-RHapTXDLPDePnkFR6nPcKg-1; Fri, 03 Sep 2021 09:08:34 -0400
X-MC-Unique: RHapTXDLPDePnkFR6nPcKg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E62F107ACE3;
 Fri,  3 Sep 2021 13:08:33 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-13.ams2.redhat.com
 [10.36.112.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AD3F95C1C5;
 Fri,  3 Sep 2021 13:08:32 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A445C11326A9; Thu,  2 Sep 2021 18:06:58 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Yuri Benditovich <yuri.benditovich@daynix.com>
Subject: Re: [PATCH 5/5] qmp: Added qemu-ebpf-rss-path command.
References: <20210713153758.323614-1-andrew@daynix.com>
 <20210713153758.323614-6-andrew@daynix.com>
 <87y29dct4m.fsf@dusky.pond.sub.org>
 <CABcq3pE3vAh=Cs=VjjkioooEbbPjgNEtCEZGwtoxaCn0OCRQkg@mail.gmail.com>
 <877dgbpco1.fsf@dusky.pond.sub.org>
 <CAOEp5OcyvQ9Y2onyHuJnwjtWK+Tx9QxYXUePd1kJ=V9+H9wraw@mail.gmail.com>
 <87v93n8nu3.fsf@dusky.pond.sub.org>
 <CAOEp5Of0C4yUhwbgFmu4roiEmNXZ8qiNMUA3CCBE8Zwu=OWhtQ@mail.gmail.com>
 <87a6kz8i4g.fsf@dusky.pond.sub.org>
 <CAOEp5OfxM+YyZFMUxDrcOw6eKRhyhouJ3q+UnAx3x7sXhQQvHQ@mail.gmail.com>
Date: Thu, 02 Sep 2021 18:06:58 +0200
In-Reply-To: <CAOEp5OfxM+YyZFMUxDrcOw6eKRhyhouJ3q+UnAx3x7sXhQQvHQ@mail.gmail.com>
 (Yuri Benditovich's message of "Mon, 30 Aug 2021 19:56:03 +0300")
Message-ID: <87a6kv6jx9.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIMWL_WL_HIGH=-0.392, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Andrew Melnichenko <andrew@daynix.com>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Yan Vugenfirer <yan@daynix.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Yuri Benditovich <yuri.benditovich@daynix.com> writes:

> On Mon, Aug 30, 2021 at 11:14 AM Markus Armbruster <armbru@redhat.com> wrote:
>>
>> Yuri Benditovich <yuri.benditovich@daynix.com> writes:
>>
>> > On Mon, Aug 30, 2021 at 9:10 AM Markus Armbruster <armbru@redhat.com> wrote:
>> >>
>> >> Yuri Benditovich <yuri.benditovich@daynix.com> writes:
>> >>
>> >> > On Tue, Aug 24, 2021 at 9:41 AM Markus Armbruster <armbru@redhat.com> wrote:
>> >> >>
>> >> >> Andrew Melnichenko <andrew@daynix.com> writes:
>> >> >>
>> >> >> > Hi,
>> >> >> >
>> >> >> >> The helper may or may not be installed at the path compiled into QEMU.
>> >> >> >>
>> >> >> > Yes, so the helper will not be called - QEMU will try to initiate eBPF RSS
>> >> >> > or use "in-qemu" RSS.
>> >> >>
>> >> >> My point is: the proposed command's mission is to help the management
>> >> >> application run the right helper.  However, its advice is *unreliable*.
>> >> >> It may point to the wrong helper, or to nothing at all.  The right
>> >> >> helper may still exist elsewhere.
>> >> >
>> >> > Hi Markus,
>> >> > Indeed the intention of this command is to return the proper helper.
>> >> > Especially in the case of RSS helper this is *reliable* advice and it
>> >> > points to the helper that was built together with QEMU, i.e. with the
>> >> > same headers.

In my testing, the patch fails at providing reliable advice.

I did a "git fetch https://github.com/daynix/qemu HelperEBPFv3", rebased
the result to master, build the thing, ran qemu-system-x86_64 right from
the build tree, tried query-helper-paths and got

    {"return": [
        {"name": "qemu-bridge-helper",
         "path": "/work/armbru/tmp/inst-qemu/libexec/qemu-bridge-helper"},
        {"name": "qemu-pr-helper",
         "path": "/work/armbru/tmp/inst-qemu/libexec/qemu-pr-helper"},
        {"name": "qemu-ebpf-rss-helper",
         "path": "/work/armbru/qemu/bld-x86/qemu-ebpf-rss-helper"}]}

Ther first two are bogus.  /work/armbru/tmp/inst-qemu/... is where "make
install" would put things.  I last ran "make install" almost three
months ago.

The last one is accurate in this particular scenario.  More on why
below.

It won't be in a deployment where the actual installation paths do not
match the ones we told configure at build time.  Yes, people do that.
Please read my entire reply before you comment on this paragraph.

>> >> > This was discussed earlier, for example in
>> >> > https://lists.nongnu.org/archive/html/qemu-devel/2021-06/msg02248.html
>> >> >
>> >> >>
>> >> >> I suspect you're trying to address the problem at the wrong level.
>> >> >
>> >> > What is the proper solution for the problem from your point of view?
>> >>
>> >> I'll explain in more detail, but first I'd like you to answer my
>> >> question below.
>> >>
>> >> >> Similar versioning issues exist with other helpers.  We've been doing
>> >> >> fine without QEMU providing unreliable advice on where they might sit in
>> >> >> the file system.  What makes this one different?
>> >> >
>> >> > This one is required to be *fully synchronized* with the existing build of QEMU.
>> >> > Other helpers are probably less restrictive and do not have common
>> >> > structures definitions with the QEMU, otherwise they would face the
>> >> > same problem.
>> >> >
>> >> >>
>> >> >> >> What happens when you use the wrong helper?
>> >> >
>> >> > Our intention is that libvirt should never use the wrong RSS helper.
>> >> > But it does not have any ability to check which helper is compatible
>> >> > with the QEMU.
>> >> > QEMU can easily recognize the correct one.
>> >>
>> >> You did not actually answer my question :)
>> >>
>> >> So let's try again: if libvirt does use the wrong RSS helper, how does
>> >> the system behave?
>> >
>> > The receive-side scaling may work incorrectly, i.e. finally may move
>> > incoming packets to a virtqueue different than expected one.
>>
>> Then I'm confused about the purpose of "the stamp" mentioned below.  Can
>> you enlighten me?
>
> The stamp is a string (common for qemu executable and RSS helper
> executable during build) that qemu can later retrieve from the helper
> in run-time and ensure this helper is fully compatible with this build
> of qemu (in terms of eBPF operation). The helper is built with the
> same C headers (related to ebpf operation) as the qemu, the qemu is
> able to receive file descriptors created by the helper (of ebpf
> program and ebpf data structure's maps) from libvirt and deal with
> them as if it has created them.

query-helper-paths looks for the helper a number of locations, and
reports the first one.  This is fundamentally unrealiable.

For qemu-ebpf-rss-helper, it additionally searches for a stamp symbol in
the ELF symbol table.  That's what makes it reliable in the sense of
"won't report crap".  It's still unreliable in the sense of "may not
find the helper", see above.

Searching the ELF symbol table requires ELF.  I suspect your meson.build
doesn't reflect that.

It also requires the symbol table to be present.  Statically linked
programs don't have one, if I remember correctly.

>> >> >> >>
>> >> >> > UB - in most cases, eBPF program will work with wrong configurations.
>> >> >> > That's why the stamp was added.
>> >> >> >
>> >> >> > query-helper-paths checks the stamp only for RSS helper.
>> >> >>
>> >> >> I have no idea what you're talking about :)
>> >> >>
>> >> >> My best guess is that you're trying to tell me that attempting to work
>> >> >> with the wrong helper will fail cleanly due to some stamp check.  That
>> >> >> would be nice.

Looks like my best guess was correct.

Let's take a step back.

Management applications run qemu-system-FOO and helpers.  They know
where to find qemu-system-FOO.  It stands to reason that they also know
where to find the matching helpers.  I fail to see why they need help
from qemu-system-FOO via QMP.  Even if they need help, qemu-system-FOO
can't give it, because it cannot know for sure.  It is wherever the
system administrator / distro put it.

When the system administrator / distro put stuff in unusual places, they
get to configure the programs that use it.  In this case, that's the
management application.

How QEMU may be able to help is refuse to run with the wrong helper.

If qemu-system-FOO talks directly to the helper, you can have the helper
present the stamp for qemu-system-FOO to accept or reject.  Or vice
versa, doesn't matter.

Or you can provide means for the management application to retrieve a
stamp from all programs involved, so it can fail unless they match.
There are much easier ways for that than searching through ELF symbol
tables.  Have a command line option to print it.  For qemu-system-FOO,
you can also have a QMP command to query it.


