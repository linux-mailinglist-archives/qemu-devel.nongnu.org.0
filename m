Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FCF92F32D2
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 15:21:01 +0100 (CET)
Received: from localhost ([::1]:60218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzKXb-0000MU-Vo
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 09:21:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kzKUt-0007b4-Dk
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 09:18:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kzKUm-0000A2-Vf
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 09:18:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610461082;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IhiW+x5HaC5gYdlWPYqdmCuBe9NBIDdAbjcqZaz4f8I=;
 b=QBbQO5tHiktSVGj0EDibllgqFiqiyEZTAstr6Dsy7cwo5J5kFow7xfYqAJwNs+hXxtbTm+
 9J5SqSn4GW5Aa+SbUB+LcG2nikQULkoLzbeE9aahZlzxvJfsRHa7Jx88DqzuWWJd6vKTde
 /vIkwOcKbvXnPTuhPCwuM+9kHFu2GCE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-594-4BPhp1hmNLSdIjLIQjxtQg-1; Tue, 12 Jan 2021 09:17:59 -0500
X-MC-Unique: 4BPhp1hmNLSdIjLIQjxtQg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 524A11081B27;
 Tue, 12 Jan 2021 14:17:58 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-172.ams2.redhat.com
 [10.36.112.172])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1805260BFA;
 Tue, 12 Jan 2021 14:17:58 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A08E811386A7; Tue, 12 Jan 2021 15:17:56 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: [PATCH v14 1/7] Introduce yank feature
References: <cover.1609167865.git.lukasstraub2@web.de>
 <69934ceacfd33a7dfe53db145ecc630ad39ee47c.1609167865.git.lukasstraub2@web.de>
 <CAJ+F1CLLiHca4Lf_nL7p2+Q3MT5JA0Qn9W6g14q0MYtYoROOdA@mail.gmail.com>
 <87ft374myk.fsf@dusky.pond.sub.org>
 <CAJ+F1C+osNqR_7FBVoVh2Fg65axrQVWoOVbbuRtjiNysj=k+HQ@mail.gmail.com>
Date: Tue, 12 Jan 2021 15:17:56 +0100
In-Reply-To: <CAJ+F1C+osNqR_7FBVoVh2Fg65axrQVWoOVbbuRtjiNysj=k+HQ@mail.gmail.com>
 (=?utf-8?Q?=22Marc-Andr=C3=A9?= Lureau"'s message of "Mon, 11 Jan 2021
 18:09:45 +0400")
Message-ID: <87pn2ansrv.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Lukas Straub <lukasstraub2@web.de>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9=5C?=" <berrange@redhat.com>,
 qemu-block <qemu-block@nongnu.org>, Juan Quintela <quintela@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Marc-Andr=C3=A9 Lureau <marcandre.lureau@gmail.com> writes:

> On Mon, Jan 11, 2021 at 5:34 PM Markus Armbruster <armbru@redhat.com> wro=
te:
>
>> Marc-Andr=C3=A9 Lureau <marcandre.lureau@gmail.com> writes:
>>
>> > Hi
>> >
>> > On Mon, Dec 28, 2020 at 7:08 PM Lukas Straub <lukasstraub2@web.de>
>> wrote:
>> >
>> >> The yank feature allows to recover from hanging qemu by "yanking"
>> >> at various parts. Other qemu systems can register themselves and
>> >> multiple yank functions. Then all yank functions for selected
>> >> instances can be called by the 'yank' out-of-band qmp command.
>> >> Available instances can be queried by a 'query-yank' oob command.
>> >>
>> >
>> > Looking at the changes and API usage, I wonder if it wouldn't have bee=
n
>> > simpler to associate the yank function directly with the YankInstance
>> > (removing the need for register/unregister functions - tracking the st=
ate
>> > left to the callback). Have you tried that approach? If not, I could
>> check
>> > if this idea would work.
>>
>> Considering we're at v14...  would it make sense to commit the current
>> approach, then explore the alternative approach on top?
>>
>>
> works for me
>
>> If yes, is v14 committable as is?
>>
>>
> Acked-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

Thanks!  Does your ACK apply to the series, or just to PATCH 1?


