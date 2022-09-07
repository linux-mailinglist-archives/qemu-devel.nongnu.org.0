Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B9B5B0026
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 11:16:06 +0200 (CEST)
Received: from localhost ([::1]:49250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVrAD-0001ci-V6
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 05:16:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oVqun-0006Pi-Vi
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 05:00:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oVqug-0004L8-LZ
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 05:00:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662541201;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ogj31i8gWK7f9Zz/ZHZgMdJjp+V5M0eda1f3riENlG0=;
 b=bPDUooEmU05QMX3YrGZWOdPitDVuz6eWWk8n6PIkgUAQ+J3H+nQtSXl3TWAiDaj23hbRpe
 /73r9N3Uyy6+xF/Me/Hh8wi7TmoWNBZ+QRU05d68Z486pU63LueR+jkQJ0KypyI+TQ0Yjm
 aqcOaPW1E9W5dQo75YUby2Tndpp4Yms=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-358-DoX5M4eGMC6yBTAK6IBsdQ-1; Wed, 07 Sep 2022 04:59:57 -0400
X-MC-Unique: DoX5M4eGMC6yBTAK6IBsdQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 79AD33806706;
 Wed,  7 Sep 2022 08:59:57 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.166])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A278492C3B;
 Wed,  7 Sep 2022 08:59:57 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6DBF521E6900; Wed,  7 Sep 2022 10:59:54 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Claudio Fontana
 <cfontana@suse.de>,  qemu-devel <qemu-devel@nongnu.org>
Subject: Re: sphinx-build is really slow, any way to improve that?
References: <53b94520-f02b-aef5-b372-0460531b566f@suse.de>
 <CAFEAcA_ed-ny6eodA=9fK6Y5WpUaRO0jPfbKHYCB6uLikiyiHQ@mail.gmail.com>
 <Yxb86Fz8XVW3uW1p@redhat.com>
 <CAFEAcA8DZZe2XKntbrg2mOrmWmepPAVvgBKTvO9vMAE2tVq2hg@mail.gmail.com>
Date: Wed, 07 Sep 2022 10:59:54 +0200
In-Reply-To: <CAFEAcA8DZZe2XKntbrg2mOrmWmepPAVvgBKTvO9vMAE2tVq2hg@mail.gmail.com>
 (Peter Maydell's message of "Tue, 6 Sep 2022 14:41:13 +0100")
Message-ID: <87leqvzhit.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Maydell <peter.maydell@linaro.org> writes:

> On Tue, 6 Sept 2022 at 08:55, Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>>
>> On Mon, Sep 05, 2022 at 10:21:55PM +0100, Peter Maydell wrote:
>> > On Mon, 5 Sept 2022 at 20:51, Claudio Fontana <cfontana@suse.de> wrote:
>> > > when I build qemu, there is a lot of time spent at the end of the bu=
ild where one cpu goes 100% on sphinx-build.
>> > >
>> > > Is there some way to parallelize that? It seems it is the current bo=
ttleneck for rebuilds for me..
>> >
>> > It's a big fat python program, so I suspect not, but
>> > maybe I'm wrong.
>>
>> It annoys me too and I've had a look at what it is doing in the past and
>> failed to find an obvious way to improve it. I fear this could be an
>> inherant limitation of the way we use sphinx to build the docs as a
>> complete manual, as compared to say treating each docs source file as
>> a distinct standalone web page.
>
> IIRC sphinx really really wants to process the whole document tree
> in one go. You can see this in the way that for example the
> HTML build process creates HTML files for the top-level rst
> files that are supposed to be only for the manpage -- it will
> suck in and process everything, not just the files reachable
> via whatever top level file you point it at.

How do other projects deal with the resulting slowness?

Could we avoid rerunning sphinx-build when documentation hasn't changed?


