Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 458343F4BC7
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 15:36:35 +0200 (CEST)
Received: from localhost ([::1]:50646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIA7k-000157-6P
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 09:36:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mIA6l-0000If-4y
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 09:35:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mIA6i-0001pJ-Ji
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 09:35:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629725719;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ne4Ip6WS3LAOGjVDAKZbBeZT7LXeg8mARLCTka3qBbM=;
 b=ABXprEX/RT6NU5+5aU+B+wCV6XOw0I/ceUbaNfpdOb4EaHM5lnAER1kI7s9oZPmZlapLnB
 KLqnLcYoZ18FQSRccxJGTdYXiAVpvvRo3QBR17dpq95lYfEbCzHfsfsRiI87g8gLieD2En
 hoS4mO7PDQk+FnTjZNvGAKyK3h+a0+0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-436-l-Y-W3G2Me2XP94Utr9QIw-1; Mon, 23 Aug 2021 09:35:18 -0400
X-MC-Unique: l-Y-W3G2Me2XP94Utr9QIw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1067A87D544;
 Mon, 23 Aug 2021 13:35:17 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-4.ams2.redhat.com [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7769B1042A42;
 Mon, 23 Aug 2021 13:35:16 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0A24A11380A9; Mon, 23 Aug 2021 15:35:15 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH v12] qapi: introduce 'query-x86-cpuid' QMP command.
References: <20210728125402.2496-1-valeriy.vdovin@virtuozzo.com>
 <87eeb59vwt.fsf@dusky.pond.sub.org>
 <20210810185644.iyqt3iao2qdqd5jk@habkost.net>
 <2191952f-6989-771a-1f0a-ece58262d141@redhat.com>
 <CAOpTY_qbsqh9Tf8LB3EOOi_gkREotdpUyuF3-d_sBFsof3-9KQ@mail.gmail.com>
 <97ce9800-ff69-46cd-b6ab-c7645ee10d2c@redhat.com>
 <CAOpTY_rv4nZib1Eymm9ZVcLf=v=-QjpUm24U7FtS-1pUqS_6VQ@mail.gmail.com>
Date: Mon, 23 Aug 2021 15:35:14 +0200
In-Reply-To: <CAOpTY_rv4nZib1Eymm9ZVcLf=v=-QjpUm24U7FtS-1pUqS_6VQ@mail.gmail.com>
 (Eduardo Habkost's message of "Wed, 11 Aug 2021 09:58:19 -0400")
Message-ID: <87lf4scmi5.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, kvm@vger.kernel.org,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Valeriy Vdovin <valeriy.vdovin@virtuozzo.com>, Denis Lunev <den@openvz.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eduardo Habkost <ehabkost@redhat.com> writes:

> On Wed, Aug 11, 2021 at 9:44 AM Thomas Huth <thuth@redhat.com> wrote:
>>
>> On 11/08/2021 15.40, Eduardo Habkost wrote:
>> > On Wed, Aug 11, 2021 at 2:10 AM Thomas Huth <thuth@redhat.com> wrote:
>> >>
>> >> On 10/08/2021 20.56, Eduardo Habkost wrote:
>> >>> On Sat, Aug 07, 2021 at 04:22:42PM +0200, Markus Armbruster wrote:
>> >>>> Is this intended to be a stable interface?  Interfaces intended jus=
t for
>> >>>> debugging usually aren't.
>> >>>
>> >>> I don't think we need to make it a stable interface, but I won't
>> >>> mind if we declare it stable.
>> >>
>> >> If we don't feel 100% certain yet, it's maybe better to introduce thi=
s with
>> >> a "x-" prefix first, isn't it? I.e. "x-query-x86-cpuid" ... then it's=
 clear
>> >> that this is only experimental/debugging/not-stable yet. Just my 0.02=
 =E2=82=AC.
>> >
>> > That would be my expectation. Is this a documented policy?
>> >
>>
>> According to docs/interop/qmp-spec.txt :
>>
>>   Any command or member name beginning with "x-" is deemed
>>   experimental, and may be withdrawn or changed in an incompatible
>>   manner in a future release.
>
> Thanks! I had looked at other QMP docs, but not qmp-spec.txt.
>
> In my reply above, please read "make it a stable interface" as
> "declare it as supported by not using the 'x-' prefix".
>
> I don't think we have to make it stable, but I won't argue against it
> if the current proposal is deemed acceptable by other maintainers.
>
> Personally, I'm still frustrated by the complexity of the current
> proposal, but I don't want to block it just because of my frustration.

Is this a case of "there must be a simpler way", or did you actually
propose a simpler way?  I don't remember...


