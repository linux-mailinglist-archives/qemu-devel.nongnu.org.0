Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E5E680779
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 09:33:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMPZZ-00039l-MV; Mon, 30 Jan 2023 03:31:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1pMPZW-00037m-84
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 03:31:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1pMPZU-0005bY-4U
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 03:31:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675067482;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ppMnTo4juUYnuUuL/r/RYGvf2ZXOXt0nNUNbuqoP4i4=;
 b=YxE1y0tmE+3tfvUa6OoJztoPnNb20sgXtJLQ6sILWgZBr/WDldx1gPPyo0WhgqN+TJ22X4
 QfEIOpFZBlWKp5c+DoRWH7HlRoPo+dZugvQrTIFRloi6BOTbpOxqjxs1nq83y8e5/yem38
 gyBXH8KZzV1C1mHji8WqZ6+32DbCLxA=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-338-tM6v33sPPi6y_1gOsVWVfA-1; Mon, 30 Jan 2023 03:31:20 -0500
X-MC-Unique: tM6v33sPPi6y_1gOsVWVfA-1
Received: by mail-vk1-f199.google.com with SMTP id
 z128-20020a1fe286000000b003e1cb6fe65dso3910577vkg.9
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 00:31:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ppMnTo4juUYnuUuL/r/RYGvf2ZXOXt0nNUNbuqoP4i4=;
 b=gtwqjKxD6FMvN7nKMzZWwgvK9//jM08+ZtiysJQ+qZIdBzMFpdbknxO7DMAjb8JTOW
 8a4cHWtBlSjHhM//Hz9hfMuwv0h+9s2r4/B4d+UOaj+AyRMAHDxj/85UfAofoqZ3IM/V
 VcCUMOu/4JcO1xYBz5hKgh8IVdMmk1rzy28LGLE4hQ2SouRlLUxyFQyShz6lI1wOZdsK
 rcwUUeDrUY+LPIxleTUsBP49cswmOAMYmkz3/rh10h/4IhyGtDkP1ch12w2SKWC1OxRv
 DTzVCeK1JwUITeP7pjrTTC0NAuO4omCIKeKO5TU2cO/o4NJpCQjE5MwT1+TgzyyC0T4X
 cjzA==
X-Gm-Message-State: AO0yUKWn2Hme4RNtl0ZfDmMUVMCFJqaqi7x6+6/+JEDdWfNvqFVQxdF6
 pkI4hFlhqzqOGdGdGZ387fgjruxAd3DNsF9+Da3HHDm+X+2QbnxEwCX+hLXMnGWbjTorsIYb27c
 DaMgPx7eFl4y7/enpTAAn8Hh87XTtbAU=
X-Received: by 2002:a67:e94b:0:b0:3f3:7117:1244 with SMTP id
 p11-20020a67e94b000000b003f371171244mr734033vso.66.1675067480378; 
 Mon, 30 Jan 2023 00:31:20 -0800 (PST)
X-Google-Smtp-Source: AK7set9CeTRP8HNmnHVMbrzZHGXI2t8XKwua1Q6JH9wGvG0ymf9e5rRYNEPrw1dgk7XbcjKyIxx0Qxp9UDMokTErbZQ=
X-Received: by 2002:a67:e94b:0:b0:3f3:7117:1244 with SMTP id
 p11-20020a67e94b000000b003f371171244mr734026vso.66.1675067480088; Mon, 30 Jan
 2023 00:31:20 -0800 (PST)
MIME-Version: 1.0
References: <CAPMcbCp+wRecC+WPTDJyyLLWbybnAO-W40i8rRZFDGqRtBvfdg@mail.gmail.com>
In-Reply-To: <CAPMcbCp+wRecC+WPTDJyyLLWbybnAO-W40i8rRZFDGqRtBvfdg@mail.gmail.com>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Mon, 30 Jan 2023 10:31:09 +0200
Message-ID: <CAPMcbCpfg0+XjS7eDgGAgKpg2eS_ejT7xrsftku3Ad3m6rhz7A@mail.gmail.com>
Subject: Re: Crash in RTC
To: Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: QEMU <qemu-devel@nongnu.org>, Vadim Rozenfeld <vrozenfe@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000020370e05f3770a97"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--00000000000020370e05f3770a97
Content-Type: text/plain; charset="UTF-8"

ping

On Wed, Aug 24, 2022 at 5:37 PM Konstantin Kostiuk <kkostiuk@redhat.com>
wrote:

> Hi Michael and Paolo,
>
> I write to you as maintainers of mc146818rtc.c. I am working on bug
> https://bugzilla.redhat.com/show_bug.cgi?id=2054781
> and reproduced it on the current master branch.
>
> I added some print at line 202 (before assert(lost_clock >= 0),
> https://gitlab.com/qemu-project/qemu/-/blob/master/hw/rtc/mc146818rtc.c#L202)
> and got the following values:
>
> next_periodic_clock, old_period, last_periodic_clock, cur_clock,
> lost_clock, current_time
> 54439076429968, 32, 54439076429936, 54439076430178, 242,
> 1661348768010822000
> 54439076430224, 512, 54439076429712, 54439076430188, 476,
> 1661348768011117000
> 54439076430224, 32, 54439076430192, 54439076429884, -308,
> 1661348768001838000
>
> The current_time value in the last print is lower than in the previous one.
> So, the error occurs because time has gone backward.
>
> I think this is a possible situation during time synchronization.
> My question is what should we do in this case?
>
> Best Regards,
> Konstantin Kostiuk.
>

--00000000000020370e05f3770a97
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">ping<br></div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Wed, Aug 24, 2022 at 5:37 PM Konstantin Kostiuk=
 &lt;<a href=3D"mailto:kkostiuk@redhat.com">kkostiuk@redhat.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"=
ltr">Hi Michael and Paolo,<br><br>I write to you as maintainers of mc146818=
rtc.c. I am working on bug <a href=3D"https://bugzilla.redhat.com/show_bug.=
cgi?id=3D2054781" target=3D"_blank">https://bugzilla.redhat.com/show_bug.cg=
i?id=3D2054781</a><br>and reproduced it on the current master branch.<br><b=
r>I added some print at line 202 (before assert(lost_clock &gt;=3D 0), <a h=
ref=3D"https://gitlab.com/qemu-project/qemu/-/blob/master/hw/rtc/mc146818rt=
c.c#L202" target=3D"_blank">https://gitlab.com/qemu-project/qemu/-/blob/mas=
ter/hw/rtc/mc146818rtc.c#L202</a>) and got the following values:<br><br>nex=
t_periodic_clock, old_period, last_periodic_clock, cur_clock, lost_clock, c=
urrent_time<br>54439076429968, 32, 54439076429936, 54439076430178, 242, 166=
1348768010822000<br>54439076430224, 512, 54439076429712, 54439076430188, 47=
6, 1661348768011117000<br>54439076430224, 32, 54439076430192, 5443907642988=
4, -308, 1661348768001838000<br><br>The current_time value in the last prin=
t is lower than in the previous one.<br>So, the error occurs because time h=
as gone backward.<br><br>I think this is a possible situation during time s=
ynchronization.<br>My question is what should we do in this case?<br><div><=
br></div><div><div dir=3D"ltr"><div dir=3D"ltr"><div>Best Regards,</div><di=
v>Konstantin Kostiuk.</div></div></div></div></div>
</blockquote></div>

--00000000000020370e05f3770a97--


