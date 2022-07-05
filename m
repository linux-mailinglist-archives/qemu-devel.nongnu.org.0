Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B620566226
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 06:16:20 +0200 (CEST)
Received: from localhost ([::1]:51594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8Zz0-0006Ru-Sh
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 00:16:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o8ZxA-0004w7-7x
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 00:14:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o8Zx6-0001uJ-V9
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 00:14:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656994459;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tiiaeLQXQIsHhmZtkqhyKTSgi3R8keRv4xeWaIFoS94=;
 b=A0V0zOc2yRME0/eWGGliHGgtUzbeQcGKtmaJRu8uZeYTR3os94z0pUjV7/0k/d7Bbx7LPV
 nFY194SJJoAmiiSaDmZLKRXFTtBLka1zjtBbYKD7RfYwVsXHDjkgPIoed9QbfIEIL4DosK
 6u2zE+GB8IqhXBkVEKkkW67mwJKv5H4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-466-YMGmQpcPM5G4zuZ_X1tzfg-1; Tue, 05 Jul 2022 00:14:16 -0400
X-MC-Unique: YMGmQpcPM5G4zuZ_X1tzfg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AE76C3C0CD39
 for <qemu-devel@nongnu.org>; Tue,  5 Jul 2022 04:14:16 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.112])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 73D0C4010FA6;
 Tue,  5 Jul 2022 04:14:16 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3C76E21E690D; Tue,  5 Jul 2022 06:14:15 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Leonardo =?utf-8?Q?Br=C3=A1s?= <leobras@redhat.com>
Cc: "Daniel P." =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Markus
 Armbruster
 <armbru@redhat.com>,  "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>,  Eric Blake <eblake@redhat.com>,
 Peter Xu <peterx@redhat.com>,  qemu-devel@nongnu.org
Subject: Re: [PATCH v2 2/3] Add zero-copy-copied migration stat
References: <20220701155935.482503-1-leobras@redhat.com>
 <20220701155935.482503-3-leobras@redhat.com>
 <877d4tz9gx.fsf@pond.sub.org> <YsKtm2O8+d5d0p/N@redhat.com>
 <YsLRmYjFpdGw0AjK@work-vm> <87k08tw0bq.fsf@pond.sub.org>
 <YsLaEWcn51z3m52e@redhat.com> <87czelvxrt.fsf@pond.sub.org>
 <YsLnrgIGu5y88ZTu@redhat.com>
 <97f75348557212d32bb38c20b6800208219e4aa8.camel@redhat.com>
Date: Tue, 05 Jul 2022 06:14:15 +0200
In-Reply-To: <97f75348557212d32bb38c20b6800208219e4aa8.camel@redhat.com>
 ("Leonardo =?utf-8?Q?Br=C3=A1s=22's?= message of "Mon, 04 Jul 2022 15:13:08
 -0300")
Message-ID: <87o7y4tcvc.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Leonardo Br=C3=A1s <leobras@redhat.com> writes:

> Thanks Daniel, Markus and Dave for the feedback!
>
> On Mon, 2022-07-04 at 14:14 +0100, Daniel P. Berrang=C3=A9 wrote:
>> On Mon, Jul 04, 2022 at 02:59:50PM +0200, Markus Armbruster wrote:
>> > Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
>> >=20
>> > > On Mon, Jul 04, 2022 at 02:04:41PM +0200, Markus Armbruster wrote:
>> >=20
> [...]
>
>>=20
>> since 7.1, unless you're planning for really tortuous review :)
>>=20
>
> Ok, updated :)
>
>> > [...]
>> >=20
>> > > > Please rephrase the documentation of @zero-copy-copied in terms of
>> > > > @dirty-sync-count.=C2=A0 Here's my attempt.
>> > > >=20
>> > > > # @zero-copy-copied: Number of times dirty RAM synchronization cou=
ld not
>> > > > #=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 avoid copying zero page=
s.=C2=A0 This is between 0 and
>> > > > #=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 @dirty-sync-count.=C2=
=A0 (since 7.1)
>
> That's a great description! And it's almost 100% correct.

That's why we do patch review :)

> IIUC dirty-sync-count increments on migration_bitmap_sync() once after ea=
ch full
> dirty-bitmap scan, and even with multifd syncing at the same point, it co=
uld
> potentially have a increment per multifd channel.
>
> The only change would be having:
> # This is between 0 and @dirty-sync-count * @multifd-channel.

Makes sense to me.

[...]


