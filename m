Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF75663242
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 22:08:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEzLr-0006tP-9E; Mon, 09 Jan 2023 16:06:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pEzLn-0006sH-Qo
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 16:06:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pEzLl-0007k8-E6
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 16:06:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673298392;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pxTGpzqbR46LUVcCqxi0RD72ksLcjVab7BpPXgRkIug=;
 b=Zgi232NZUTvj6BsXNnpM83lPPn8YwpzRWy2aok3TyuZymbYHvwvQ9myhdZydWOWnOVLY4A
 oeKN3fcmxyUqji3dF/EVjLq9T97Dy2z3toyPz8UWxMZfwBRnwbvtjDynJpB8rL7n4hmmlO
 lLJ+DO9XGEblOBPDRCK3amGTSg+0S1A=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-641-0HZpX8mmNl-kuLEK71MxYw-1; Mon, 09 Jan 2023 16:06:31 -0500
X-MC-Unique: 0HZpX8mmNl-kuLEK71MxYw-1
Received: by mail-lf1-f71.google.com with SMTP id
 x12-20020a056512130c00b004cc7af49b05so2144876lfu.10
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 13:06:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pxTGpzqbR46LUVcCqxi0RD72ksLcjVab7BpPXgRkIug=;
 b=a0Jym/GwzU0Iuwl3QClAN1QZiWgbU5uZuN49C1o9RsBEf4ujltD8DT4L8XlaFk86Yk
 nyqVa20lgBerlF+TDWcCGUUrGK/+I0eXl8ftWGHnR0BEI+PhcttErVmPCy3Mmv0fX0il
 QNHcDjpRcULCwf8KSNahwqGoo9vZLXMcPkBbbPXj1Hlbg2cQdF+qVGRHGQ38YeFBQylg
 19GaFAZy5UZ5TSRkR/VyroJxcPMmoEzEHLCXTcKYm2lc+AfeTGWXnQp2aEX6qN/tk2Aq
 3kIc1eI3/QfkwamcNPytaZIQj6a20t2fLZwRankMF6ICNhBg6AvNXKRK0QBTsPw6CvH+
 GE2w==
X-Gm-Message-State: AFqh2koiYwi0p1gpa1blDtTPgI9X/BDktmv0KdTPABtCqsCwFVqNI3/B
 30IODGanIqd0vZavlDSfMyPrYnXx+3yHkH85jvphqzEkXgqZc71YCnsz9Qar3meOTqsLYOK6uUY
 wrxU3eBglj+TTBUlPasVY3pfoGm4Dc78=
X-Received: by 2002:ac2:5e78:0:b0:4b4:c06b:243b with SMTP id
 a24-20020ac25e78000000b004b4c06b243bmr3249424lfr.280.1673298389816; 
 Mon, 09 Jan 2023 13:06:29 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt7K+R1vtf/5ZnQoafru/Ya0i6DOVBzIVOZgTNIjTLophglF/uql3iev+bC75JAlj16pwNXzdEDH73uUbzwbJU=
X-Received: by 2002:ac2:5e78:0:b0:4b4:c06b:243b with SMTP id
 a24-20020ac25e78000000b004b4c06b243bmr3249417lfr.280.1673298389569; Mon, 09
 Jan 2023 13:06:29 -0800 (PST)
MIME-Version: 1.0
References: <20220630123419.1019367-1-marcandre.lureau@redhat.com>
 <CAFn=p-Z1JqriE2iD26pYFycNBZhkxK3wqOcz6KzD-CegFP+qKQ@mail.gmail.com>
 <CAJ+F1C+NEqp-P9BAzT5ADkxVP_pZyvtZPAOVz3R_Xq0w7tCmpg@mail.gmail.com>
In-Reply-To: <CAJ+F1C+NEqp-P9BAzT5ADkxVP_pZyvtZPAOVz3R_Xq0w7tCmpg@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Date: Mon, 9 Jan 2023 16:06:17 -0500
Message-ID: <CAFn=p-b-hXVGZJruWa7zY+-pXiqMCEN17FTSpHGNHWPPKMik2A@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] python/qemu/machine: fix potential hang in QMP
 accept
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
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

On Mon, Jul 25, 2022 at 7:23 AM Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
>
> Hi
>
> On Fri, Jul 1, 2022 at 2:51 AM John Snow <jsnow@redhat.com> wrote:
>>
>> On Thu, Jun 30, 2022 at 8:34 AM <marcandre.lureau@redhat.com> wrote:
>> >
>> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>> >
>> > Hi,
>> >
>> > As reported earlier by Richard Henderson ("virgl avocado hang" thread)=
, avocado
>> > tests may hang when QEMU exits before the QMP connection is establishe=
d.
>> >
>> > v2:
>> >  - use a socketpair() for QMP (instead of async concurrent code from v=
1) as
>> >    suggested by Daniel Berrange.
>> >  - should not regress (hopefully)
>> >
>> > Marc-Andr=C3=A9 Lureau (3):
>> >   python/qmp/protocol: add open_with_socket()
>> >   python/qmp/legacy: make QEMUMonitorProtocol accept a socket
>> >   python/qemu/machine: use socketpair() for QMP by default
>> >
>> >  python/qemu/machine/machine.py | 24 ++++++++++++++++--------
>> >  python/qemu/qmp/legacy.py      | 18 +++++++++++++++---
>> >  python/qemu/qmp/protocol.py    | 25 ++++++++++++++++++++-----
>> >  3 files changed, 51 insertions(+), 16 deletions(-)
>> >
>> > --
>> > 2.37.0.rc0
>> >
>>
>> For anything that touches python/qemu/qmp/*, may I please ask that you
>> submit them to https://gitlab.com/qemu-project/python-qemu-qmp ?
>>
>
> Ok
>
>>
>> (I'll review them in the meantime on-list just in the interest of
>> moving things along.)
>
>
> I was waiting for a review before updating the patches / moving to python=
-qemu-qmp.
>

Fair enough - can I kindly ask you to resend, though? My apologies and
Happy New Year!

--js


