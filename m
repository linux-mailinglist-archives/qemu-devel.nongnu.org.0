Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F30B6AD998
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 09:52:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZT32-0000RE-KL; Tue, 07 Mar 2023 03:51:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pZT2y-0000Qq-72
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 03:51:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pZT2w-0004n1-E1
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 03:51:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678179105;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wDPluqgeEMQKa/eH98upjdcBj4DBsvHn3cgF7zyD3TU=;
 b=TDtb3YL2qWOqWnzzR8lgTdKtn5dK+t0gGxQslLuj6tR3ZMGPLzdrBLM3pAhXu9+Qc6ZkWv
 Z4USFJEWg6ddecpVbmMXBVErYMqvJOakmXpPAM2fZjj1Ou/mc408raq/VIx1nZaVZ5e4su
 Q+CFyiiBwr+qu49G11UiE1ct9jcZZYs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-602-v9nfZ0SBMciYklBSq7vUBg-1; Tue, 07 Mar 2023 03:51:42 -0500
X-MC-Unique: v9nfZ0SBMciYklBSq7vUBg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4CC283C18340;
 Tue,  7 Mar 2023 08:51:42 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.92])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2183118EC6;
 Tue,  7 Mar 2023 08:51:42 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DE4D021E6A1F; Tue,  7 Mar 2023 09:51:40 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 qemu-devel@nongnu.org,
 Thomas Huth <thuth@redhat.com>,  Gerd Hoffmann <kraxel@redhat.com>,  Alex
 =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,  Michael Roth
 <michael.roth@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>,  Laurent Vivier
 <lvivier@redhat.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
 Beraldo Leal <bleal@redhat.com>,  Wainer dos Santos Moschetta
 <wainersm@redhat.com>,  Stefan Weil <sw@weilnetz.de>,  Daniel P.
 =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  Eric Blake <eblake@redhat.com>,  "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v4 07/11] qapi/gen: run C code through clang-format, if
 possible
References: <20230306122751.2355515-1-marcandre.lureau@redhat.com>
 <20230306122751.2355515-8-marcandre.lureau@redhat.com>
 <CAFEAcA9eFm6oT6SzDS6wCgVcCfyZb4kk4zBeqm8AE7ovGMW+1g@mail.gmail.com>
 <CAJ+F1CJYK5N1iH4d=6odmP59+m-P6UTLJ9hbpE47KLga5rufcQ@mail.gmail.com>
 <CAFEAcA9ODuOc0i7_iMwCgk3_8hDruNGMbUADF6ymWhxfjuWrsw@mail.gmail.com>
Date: Tue, 07 Mar 2023 09:51:40 +0100
In-Reply-To: <CAFEAcA9ODuOc0i7_iMwCgk3_8hDruNGMbUADF6ymWhxfjuWrsw@mail.gmail.com>
 (Peter Maydell's message of "Mon, 6 Mar 2023 18:39:05 +0000")
Message-ID: <87a60pc5b7.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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

Peter Maydell <peter.maydell@linaro.org> writes:

> On Mon, 6 Mar 2023 at 18:29, Marc-Andr=C3=A9 Lureau
> <marcandre.lureau@gmail.com> wrote:
>>
>> Hi
>>
>> On Mon, Mar 6, 2023 at 8:06 PM Peter Maydell <peter.maydell@linaro.org> =
wrote:
>> >
>> > On Mon, 6 Mar 2023 at 12:33, <marcandre.lureau@redhat.com> wrote:
>> > >
>> > > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>> > >
>> > > Make the resulting code even prettier, if possible.
>> >
>> > This seems to be a bit short on rationale. This is generated
>> > code, so in general nobody is going to be reading it, and
>> > running clang-format on it every time we generate code feels
>> > like it would be a bit of a waste of cycles...
>>
>> With this reasoning, why do we care about indentation of generated code =
at all?
>>
>> I think it still makes sense, because you have many reasons to read
>> through it eventually, and making it a bit more friendly helps.
>
> Yeah, sometimes you have to read through it, so not printing

I have to read it frequently enough to make ugly code painful.

> it all one one long line is helpful. But it's a tradeoff --
> "make it basically kinda readable by tracking indent level" is
> easy and quick; running the whole output through a pretty-printer
> is more expensive and doesn't improve the output by very much
> over what we already have. (If I'm wrong about that last part,
> it would be useful for the commit message to give an example
> of currently unreadable output that clang-format makes more usable.)

Tracking indent level is certainly quick, but it can take a bit of
effort.  In review of v3, I asked for more effort, and Marc-Andr=C3=A9
floated the idea of leaving the job to readily available clang-format
instead:

    ok, I improved the indentation a bit.

    However, I think it would be simpler, and better, if we piped the
    generated code to clang-format (when available). I made a simple patch
    for that too.

My reply was

    Piping through indent or clang-format may well give us neater results
    for less effort.

    We might want to dumb down generator code then.

Message-ID: <87356yq9rs.fsf@pond.sub.org>
https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg06311.html

v4 no longer contains the indentation issue that triggered this
exchange.  Let's treat this patch as if it was separate, so it doesn't
delay the remainder of the series.

You're certainly right to ask for an assessment of costs and benefits.

Costs:

* Yet another dependency, albeit optional

* Running the indenter (not sure it's noticable, but numbers wanted)

Benefits:

* Result is maybe tidier (examples wanted)

* Not in this patch: we could dumb down the code generator some (the
  dependency becomes de facto mandatory for serious QAPI developers
  then)

We may choose to shelve this patch until the next time decent formatting
takes us effort.


