Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB86567254
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 17:17:59 +0200 (CEST)
Received: from localhost ([::1]:53278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8kJJ-0005ND-BA
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 11:17:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o8kGi-00037f-J8
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 11:15:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21279)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o8kGf-0003sN-If
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 11:15:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657034112;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xLgSOm0lLrf1jYOAO6tmJTIa1RJ9jPBYBfuBFJfxERg=;
 b=daYNC+A1UU9E43Oq1AuoQi76MIzk/II1by7orfa3JX9RU2CzkISNCb53Oco4TOkvRiheE6
 P7O0CGSHgpXoboJmW6fwfKU12xV4ICrTmjnucNtRsMT8htbtWkJyGN+CIrSgZFXEblS+8k
 jcrAkQm0mOZuKUFqzLTpk0UALTvmHM0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-646-UaRf09pxOgu21ldVVrNvDA-1; Tue, 05 Jul 2022 11:15:03 -0400
X-MC-Unique: UaRf09pxOgu21ldVVrNvDA-1
Received: by mail-wm1-f72.google.com with SMTP id
 i5-20020a1c3b05000000b003a02b027e53so8993621wma.7
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 08:15:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xLgSOm0lLrf1jYOAO6tmJTIa1RJ9jPBYBfuBFJfxERg=;
 b=VrVRXvR/bxpFjOTbbwEeF4tkyjUOg/TcvmuuUy9/SrqIc37H0/vFGwKolh8hTStKqO
 l/ICeaWAIYm2HV0ovFYORYhrBBktZw61dT/A5o/DPn6h9KZiBrflepeCdfQHdQyjF1Vt
 pcT1Pug7odFf/VgInTORJi4spcAdW763fS90fSx1MccnsjXpwqM5O+voTRKO+BThmiQi
 qJ21yhZqq6tCDswapo5ZYZSuERl9+ekXjScTabRvFi9J4pH0GxeZPBwWn0vVWR6gyQzn
 /mOdOgKKQbGNpA/gSYUQvsQ71X270xlfvjYTNyuZS7lRBB9Jvmsy7B0TVbLOMyJdTDRY
 Nwqg==
X-Gm-Message-State: AJIora+PfLOIxmukPz4pZgLK7ltoNk//GGBT2cGjRNquL4EwT2wWaOGE
 B3wdQozIQghPwD28qC7w/ytm54DfmQUjyPQMj6EK/TX7+GQ4WkcfnPSToUEzmckqk8tYD2ukB51
 JDSwLAD2XZWZx8g0=
X-Received: by 2002:a05:600c:1548:b0:3a1:95fc:aa42 with SMTP id
 f8-20020a05600c154800b003a195fcaa42mr19149534wmg.189.1657034101647; 
 Tue, 05 Jul 2022 08:15:01 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vaD2bVE1hyhcceD0ICZ8hGH7zqK+8cGBaTFhtkKlk7ucxUx/e7VIxtoQJedMvelXkVSZQMWw==
X-Received: by 2002:a05:600c:1548:b0:3a1:95fc:aa42 with SMTP id
 f8-20020a05600c154800b003a195fcaa42mr19149506wmg.189.1657034101442; 
 Tue, 05 Jul 2022 08:15:01 -0700 (PDT)
Received: from localhost (static-110-87-86-188.ipcom.comunitel.net.
 [188.86.87.110]) by smtp.gmail.com with ESMTPSA id
 t8-20020a7bc3c8000000b003a050a391e8sm23004702wmj.38.2022.07.05.08.15.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jul 2022 08:15:01 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: Leonardo Bras <leobras@redhat.com>,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Eric Blake <eblake@redhat.com>,  Markus Armbruster
 <armbru@redhat.com>,  Peter Xu <peterx@redhat.com>,  qemu-devel@nongnu.org
Subject: Re: [PATCH v3 1/3] QIOChannelSocket: Fix zero-copy flush returning
 code 1 when nothing sent
In-Reply-To: <YsPwk34cMoontYo8@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Tue, 5 Jul 2022 09:04:35 +0100")
References: <20220704202315.507145-1-leobras@redhat.com>
 <20220704202315.507145-2-leobras@redhat.com>
 <YsPwk34cMoontYo8@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Tue, 05 Jul 2022 17:15:00 +0200
Message-ID: <87tu7vzj4b.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
> On Mon, Jul 04, 2022 at 05:23:13PM -0300, Leonardo Bras wrote:
>> If flush is called when no buffer was sent with MSG_ZEROCOPY, it current=
ly
>> returns 1. This return code should be used only when Linux fails to use
>> MSG_ZEROCOPY on a lot of sendmsg().
>>=20
>> Fix this by returning early from flush if no sendmsg(...,MSG_ZEROCOPY)
>> was attempted.
>>=20
>> Fixes: 2bc58ffc2926 ("QIOChannelSocket: Implement io_writev zero copy fl=
ag & io_flush for CONFIG_LINUX")
>> Signed-off-by: Leonardo Bras <leobras@redhat.com>
>> ---
>>  io/channel-socket.c | 8 +++++++-
>>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>
> And if this merges via migration maintainers' tree
>
> Acked-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

I will add this on the next PULLL request.

Thanks.


>>=20
>> diff --git a/io/channel-socket.c b/io/channel-socket.c
>> index 4466bb1cd4..698c086b70 100644
>> --- a/io/channel-socket.c
>> +++ b/io/channel-socket.c
>> @@ -716,12 +716,18 @@ static int qio_channel_socket_flush(QIOChannel *io=
c,
>>      struct cmsghdr *cm;
>>      char control[CMSG_SPACE(sizeof(*serr))];
>>      int received;
>> -    int ret =3D 1;
>> +    int ret;
>> +
>> +    if (!sioc->zero_copy_queued) {
>> +        return 0;
>> +    }
>>=20=20
>>      msg.msg_control =3D control;
>>      msg.msg_controllen =3D sizeof(control);
>>      memset(control, 0, sizeof(control));
>>=20=20
>> +    ret =3D 1;
>> +
>>      while (sioc->zero_copy_sent < sioc->zero_copy_queued) {
>>          received =3D recvmsg(sioc->fd, &msg, MSG_ERRQUEUE);
>>          if (received < 0) {
>> --=20
>> 2.36.1
>>=20
>
> With regards,
> Daniel


