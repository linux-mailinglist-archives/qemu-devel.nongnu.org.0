Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBEAA6831E
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jul 2019 07:10:51 +0200 (CEST)
Received: from localhost ([::1]:35186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hmtGD-0006kJ-LV
	for lists+qemu-devel@lfdr.de; Mon, 15 Jul 2019 01:10:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57171)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <armbru@redhat.com>) id 1hmtG0-0006KK-Mr
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 01:10:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1hmtFz-0004qW-M0
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 01:10:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60048)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1hmtFz-0004q3-Ga
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 01:10:35 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id DD1023083391;
 Mon, 15 Jul 2019 05:10:33 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-111.ams2.redhat.com
 [10.36.116.111])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 801F95B681;
 Mon, 15 Jul 2019 05:10:33 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0F52F1138648; Mon, 15 Jul 2019 07:10:32 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
References: <030a439f-bb17-8232-bd1c-3585905e8feb@weilnetz.de>
 <CAFEAcA-ZEsX2nf7OmLmBE+v3VLHYQo60m8Vay28o7VNVgcn_ig@mail.gmail.com>
 <63d96e86-3823-2586-eb25-44beff91f8f2@weilnetz.de>
Date: Mon, 15 Jul 2019 07:10:32 +0200
In-Reply-To: <63d96e86-3823-2586-eb25-44beff91f8f2@weilnetz.de> (Stefan Weil's
 message of "Sun, 14 Jul 2019 19:44:55 +0200")
Message-ID: <87tvbnzxvb.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Mon, 15 Jul 2019 05:10:33 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [BUG] 216 Alerts reported by LGTM for QEMU (some
 might be release critical)
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Stefan Weil <sw@weilnetz.de> writes:

> Am 14.07.2019 um 19:30 schrieb Peter Maydell:
> [...]
>> "Analyzer thinks this multiply can overflow
>> but in fact it's not possible" is quite a common false
>> positive cause...
>
>
> The analysers don't complain because a multiply can overflow.
>
> They complain because the code indicates that a larger result is
> expected, for example uint64_t = uint32_t * uint32_t. They would not
> complain for the same multiplication if it were assigned to a uint32_t.

I agree this is an anti-pattern.

> So there is a simple solution to write the code in a way which avoids
> false positives...

You wrote elsewhere in this thread:

    Either the assigned value should use the same data type as the
    factors (possible when there is never an overflow, avoids a size
    extension), or the multiplication could use the larger data type by
    adding a type cast to one of the factors (then an overflow cannot
    happen, static code analysers and human reviewers have an easier
    job, but the multiplication costs more time).

Makes sense to me.

