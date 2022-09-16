Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9155F5BA99A
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Sep 2022 11:42:04 +0200 (CEST)
Received: from localhost ([::1]:55978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZ7rH-00066u-HA
	for lists+qemu-devel@lfdr.de; Fri, 16 Sep 2022 05:42:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oZ7lI-0003Gh-MC
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 05:35:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oZ7lE-0004CS-Ft
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 05:35:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663320946;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lzT/Q7oACC0xhlN/tJ0jDRdSu0qSwDh3E/xC/hcfPWY=;
 b=GPN1Ktuqw8dboB5S2rbAKVb14KJ2E4qNyy69/dlBepQWbqi8Je5+I9iJ54q8qo8oWtQojX
 TUGMlTWSL48zmo9pxn3uhx99jHlDysAtGrMQ0WLo3d2pE9+ic5VaApKlG8XwoUNPum9egD
 37XjeIkb/NWYMQQXY0oPxX3vdhxPA8s=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-376-pQuzFqoxP0qVFCUrMKHNWQ-1; Fri, 16 Sep 2022 05:35:43 -0400
X-MC-Unique: pQuzFqoxP0qVFCUrMKHNWQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 52C393C01E1A;
 Fri, 16 Sep 2022 09:35:43 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C51A2086F60;
 Fri, 16 Sep 2022 09:35:43 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BCD2021E6900; Fri, 16 Sep 2022 11:35:40 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Cc: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Igor Mammedov
 <imammedo@redhat.com>,  "Michael S . Tsirkin" <mst@redhat.com>,
 eblake@redhat.com,  jsnow@redhat.com,  michael.roth@amd.com,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 06/27] qapi acpi: Elide redundant has_FOO in generated C
References: <20220915204317.3766007-1-armbru@redhat.com>
 <20220915204317.3766007-7-armbru@redhat.com>
 <CAARzgwyZK9EuKKj0UpUxC8BYEUBDwRYG==eTfndgNmKOE_FgKA@mail.gmail.com>
 <87illnenpv.fsf@pond.sub.org>
 <CAARzgwx8x0kW4tknikPzscm59cCDBRw_+z__tm_Rb=1EmYF=kQ@mail.gmail.com>
 <YyQ147txe78shJnc@redhat.com>
 <CAARzgwyTKe=bV0ScO1VP6yx9-Th0vd4ML5oFDuYOsVqq+VnRag@mail.gmail.com>
Date: Fri, 16 Sep 2022 11:35:40 +0200
In-Reply-To: <CAARzgwyTKe=bV0ScO1VP6yx9-Th0vd4ML5oFDuYOsVqq+VnRag@mail.gmail.com>
 (Ani Sinha's message of "Fri, 16 Sep 2022 14:15:24 +0530")
Message-ID: <87r10bd5lf.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ani Sinha <ani@anisinha.ca> writes:

> On Fri, Sep 16, 2022 at 14:08 Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m>
> wrote:
>
>> On Fri, Sep 16, 2022 at 01:51:14PM +0530, Ani Sinha wrote:
>> > On Fri, Sep 16, 2022 at 1:48 PM Markus Armbruster <armbru@redhat.com> =
wrote:
>> > >
>> > > Ani Sinha <ani@anisinha.ca> writes:
>> > >
>> > > > On Fri, Sep 16, 2022 at 2:13 AM Markus Armbruster <armbru@redhat.c=
om> wrote:
>> > > >>
>> > > >> The has_FOO for pointer-valued FOO are redundant, except for arra=
ys.
>> > > >> They are also a nuisance to work with.  Recent commit "qapi: Star=
t to
>> > > >> elide redundant has_FOO in generated C"
>> > > >
>> > > > Commit is referenced using <commit hash 13 chars min> ("commit hea=
der")
>> > >
>> > > Apply my patches in your tree, and your hashes will differ from mine.
>> > > Hashes can serve as stable reference only when we git-fetch patches,=
 not
>> > > when we git-send-email then.
>> >
>> > Has the referenced patch not been pushed upstream already? I thought
>> > it was and hence was asking for the reference.
>>
>> Err, it is just a few patches earlier in this very series you're
>> looking at.
>
>
> Hmm ok. It=E2=80=99s missing from my inbox. Probably was not CC=E2=80=99d=
 to me.

Yes.  I'm sorry for the confusion!


