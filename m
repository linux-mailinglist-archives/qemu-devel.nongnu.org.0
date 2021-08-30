Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69BFC3FB248
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 10:15:08 +0200 (CEST)
Received: from localhost ([::1]:50482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKcRe-0000i5-Vc
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 04:15:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mKcQg-0008To-GR
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 04:14:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mKcQc-0005DN-RK
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 04:14:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630311241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=V8Bxz6+AbOwVNXLSYeWV5ry1a1amWMY8ZYsxlZfP2Kk=;
 b=E0TK0x+N95QGocgHkpSVaCoWhAMSuJ5zlVacabfAbkFhWRjMZ90Squ8Nj+xbHk4kYCOpW2
 KnFxIJfED4AdI5M1BgZ519Z8XxEqPg4sKO/qRK+8PqGNJk8Wa0jl33VDgeYdO7f0eeILOw
 vLy57cThCkJeEkpuLAnRgjhPWGlgypQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-315-vAmyhEDANCK1TSHNr-sGeg-1; Mon, 30 Aug 2021 04:13:57 -0400
X-MC-Unique: vAmyhEDANCK1TSHNr-sGeg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 92C7A800FEF;
 Mon, 30 Aug 2021 08:13:56 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-4.ams2.redhat.com [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 81EF212C82;
 Mon, 30 Aug 2021 08:13:53 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0102911380A9; Mon, 30 Aug 2021 10:13:51 +0200 (CEST)
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
Date: Mon, 30 Aug 2021 10:13:51 +0200
In-Reply-To: <CAOEp5Of0C4yUhwbgFmu4roiEmNXZ8qiNMUA3CCBE8Zwu=OWhtQ@mail.gmail.com>
 (Yuri Benditovich's message of "Mon, 30 Aug 2021 10:51:54 +0300")
Message-ID: <87a6kz8i4g.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Andrew Melnichenko <andrew@daynix.com>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Yan Vugenfirer <yan@daynix.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Yuri Benditovich <yuri.benditovich@daynix.com> writes:

> On Mon, Aug 30, 2021 at 9:10 AM Markus Armbruster <armbru@redhat.com> wrote:
>>
>> Yuri Benditovich <yuri.benditovich@daynix.com> writes:
>>
>> > On Tue, Aug 24, 2021 at 9:41 AM Markus Armbruster <armbru@redhat.com> wrote:
>> >>
>> >> Andrew Melnichenko <andrew@daynix.com> writes:
>> >>
>> >> > Hi,
>> >> >
>> >> >> The helper may or may not be installed at the path compiled into QEMU.
>> >> >>
>> >> > Yes, so the helper will not be called - QEMU will try to initiate eBPF RSS
>> >> > or use "in-qemu" RSS.
>> >>
>> >> My point is: the proposed command's mission is to help the management
>> >> application run the right helper.  However, its advice is *unreliable*.
>> >> It may point to the wrong helper, or to nothing at all.  The right
>> >> helper may still exist elsewhere.
>> >
>> > Hi Markus,
>> > Indeed the intention of this command is to return the proper helper.
>> > Especially in the case of RSS helper this is *reliable* advice and it
>> > points to the helper that was built together with QEMU, i.e. with the
>> > same headers.
>> > This was discussed earlier, for example in
>> > https://lists.nongnu.org/archive/html/qemu-devel/2021-06/msg02248.html
>> >
>> >>
>> >> I suspect you're trying to address the problem at the wrong level.
>> >
>> > What is the proper solution for the problem from your point of view?
>>
>> I'll explain in more detail, but first I'd like you to answer my
>> question below.
>>
>> >> Similar versioning issues exist with other helpers.  We've been doing
>> >> fine without QEMU providing unreliable advice on where they might sit in
>> >> the file system.  What makes this one different?
>> >
>> > This one is required to be *fully synchronized* with the existing build of QEMU.
>> > Other helpers are probably less restrictive and do not have common
>> > structures definitions with the QEMU, otherwise they would face the
>> > same problem.
>> >
>> >>
>> >> >> What happens when you use the wrong helper?
>> >
>> > Our intention is that libvirt should never use the wrong RSS helper.
>> > But it does not have any ability to check which helper is compatible
>> > with the QEMU.
>> > QEMU can easily recognize the correct one.
>>
>> You did not actually answer my question :)
>>
>> So let's try again: if libvirt does use the wrong RSS helper, how does
>> the system behave?
>
> The receive-side scaling may work incorrectly, i.e. finally may move
> incoming packets to a virtqueue different than expected one.

Then I'm confused about the purpose of "the stamp" mentioned below.  Can
you enlighten me?

>
>>
>> >> >>
>> >> > UB - in most cases, eBPF program will work with wrong configurations.
>> >> > That's why the stamp was added.
>> >> >
>> >> > query-helper-paths checks the stamp only for RSS helper.
>> >>
>> >> I have no idea what you're talking about :)
>> >>
>> >> My best guess is that you're trying to tell me that attempting to work
>> >> with the wrong helper will fail cleanly due to some stamp check.  That
>> >> would be nice.


