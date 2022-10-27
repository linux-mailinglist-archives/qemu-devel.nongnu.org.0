Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ABB160F193
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 09:53:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onxeM-0001jl-3O; Thu, 27 Oct 2022 03:50:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1onxeJ-0001fq-SR
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 03:49:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1onxeI-0006oj-2r
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 03:49:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666856997;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BN7VfIUnlcWHI+M1f0Yxnws7orrNBs/KiKobJ9nDHLs=;
 b=dZDZVUk5nwFYm+IfnbJF2OLojCjYfFODXXs/bFOG2c0QPjbSROn1gvp4XTLZ9P3R5d/L0e
 oBjnxgQ07VbppUTnKZ2uXv1dhdUBero61i7SrzIr2MwXsREk3nEDD/jyedXInVSn1Msw4r
 VMF9vpWX8d7PJZmTVMA+s8XYlRcp6oI=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-594-7xKihwD6ONq3nDm7pvv10w-1; Thu, 27 Oct 2022 03:49:55 -0400
X-MC-Unique: 7xKihwD6ONq3nDm7pvv10w-1
Received: by mail-oi1-f200.google.com with SMTP id
 bh28-20020a056808181c00b0035522358734so463300oib.10
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 00:49:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BN7VfIUnlcWHI+M1f0Yxnws7orrNBs/KiKobJ9nDHLs=;
 b=RAbJ2NtHxVilmzrLjGFuRLiqWciejl5gLIviqtNlpZqcL3e/Xn3QE8MKBlKSr0tr7U
 SmYYTViyISk5WIz538WGotx5iDkMTT3MsyvEIz0nNA+q5o+P5d40Um50w/6KVBysShHb
 Rd5IDm8sIq+KMlYAkfKlIV/c3EEGJ1+jssB4yOsrYVcH7TQZtOMvTZxXYc4Ew7ng8uQU
 FZ5Qhc7bkF+FzL/Jmz/+MQkiYvs7bAbeunA7OvY2DSVLhD2Slhi2RAVMoRa5r/+abaB+
 spPcLkqUgr5u7Q8U4tgss3bLbXOSoksUPuVUKqa1uoMys2S+cptkpacir8rZV7Jn/VGj
 bSyg==
X-Gm-Message-State: ACrzQf044X+0Z6aSKL2hgoUWf/q/KT8mm//F0bAMmZYInDqHZw5qiHTt
 GOMm8CiYMbuhh9jbnYUfMxg3Sr6maD62DvM0eeEaHPZEe6QqEOGAegRUlxyfET+1iSCkIKFoUW2
 /z5xgMeZUCXVvRdTO+dX7PgBLCo9lAqY=
X-Received: by 2002:a05:6808:1386:b0:359:bf47:ed55 with SMTP id
 c6-20020a056808138600b00359bf47ed55mr727290oiw.14.1666856994337; 
 Thu, 27 Oct 2022 00:49:54 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7IEMOfp5Jnz4mPYexuz/fz8St0GwNAxvljltNdRlmGszokvtUZdRstT4yCAy6uPAN7UB64Fxpx1LHNHOU23no=
X-Received: by 2002:a05:6808:1386:b0:359:bf47:ed55 with SMTP id
 c6-20020a056808138600b00359bf47ed55mr727281oiw.14.1666856994054; Thu, 27 Oct
 2022 00:49:54 -0700 (PDT)
MIME-Version: 1.0
References: <CAPMcbCp+wRecC+WPTDJyyLLWbybnAO-W40i8rRZFDGqRtBvfdg@mail.gmail.com>
 <CAPMcbCrySmarW0GPzvSx6ZwknPK5gKJmADM9G6xTJvBHDT4o3Q@mail.gmail.com>
 <CAPMcbCrtGETc-nKmWHHhJGx0hiAO3Yj0Lzo9sVa_W3E8eA45Rg@mail.gmail.com>
 <CAKiOO4unENQQHp7w7MUUdTStyBS7ZFi8wFKWtpe10_GGqg1URQ@mail.gmail.com>
In-Reply-To: <CAKiOO4unENQQHp7w7MUUdTStyBS7ZFi8wFKWtpe10_GGqg1URQ@mail.gmail.com>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Thu, 27 Oct 2022 10:49:43 +0300
Message-ID: <CAPMcbCqz2ev+VMDPQdKCBGSE7HmCF7hmJ-8J1sU=246zxMFcNw@mail.gmail.com>
Subject: Re: Crash in RTC
To: Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: Vadim Rozenfeld <vrozenfe@redhat.com>, QEMU <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="00000000000005b56e05ebff63d4"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--00000000000005b56e05ebff63d4
Content-Type: text/plain; charset="UTF-8"

ping

On Wed, Aug 31, 2022 at 11:33 AM Vadim Rozenfeld <vrozenfe@redhat.com>
wrote:

> Just a bit more info related to this issue.
> Below is a quote from my previous conversation with Yan
>
> </QUOTE>
> QEMU RTC function periodic_timer_update is calling in response
> to Windows HAL calls
> _HalpRtcArmTimer@16
> and
> _HalpRtcStop@4
>
> WIndows can change timer  frequency  dynamically
> (some more info can be found here
> https://bugzilla.redhat.com/show_bug.cgi?id=1610461 )
> but calculation of the frequency is based on the wallclock time (IIRC).
> And if I'm not mistaken, then lost_tick_policy=delay can lead to the
> wallclock time delay,
> which in my understanding can lead to the incorrect frequency calculation.
>
> Another interesting thing is that they don't use Hyper-V enlightenments at
> all.
> Do you know if there is any particular reason for that?  They might try
> switching
> to hv_stimer instead of RTC.
>
> And one more thing, the frequency of the timer can be adjusted by UM
> applications.
> Some of them , like emulators and servers use it quite widely. It worse
> asking them
> if they are running such kinds of apps.
> </QUOTE>
>
>
> Cheers,
> Vadim.
>
> On Wed, Aug 31, 2022 at 5:46 PM Konstantin Kostiuk <kkostiuk@redhat.com>
> wrote:
>
>> CC: Vadim
>>
>> On Wed, Aug 31, 2022 at 10:42 AM Konstantin Kostiuk <kkostiuk@redhat.com>
>> wrote:
>>
>>> ping
>>>
>>> On Wed, Aug 24, 2022 at 5:37 PM Konstantin Kostiuk <kkostiuk@redhat.com>
>>> wrote:
>>>
>>>> Hi Michael and Paolo,
>>>>
>>>> I write to you as maintainers of mc146818rtc.c. I am working on bug
>>>> https://bugzilla.redhat.com/show_bug.cgi?id=2054781
>>>> and reproduced it on the current master branch.
>>>>
>>>> I added some print at line 202 (before assert(lost_clock >= 0),
>>>> https://gitlab.com/qemu-project/qemu/-/blob/master/hw/rtc/mc146818rtc.c#L202)
>>>> and got the following values:
>>>>
>>>> next_periodic_clock, old_period, last_periodic_clock, cur_clock,
>>>> lost_clock, current_time
>>>> 54439076429968, 32, 54439076429936, 54439076430178, 242,
>>>> 1661348768010822000
>>>> 54439076430224, 512, 54439076429712, 54439076430188, 476,
>>>> 1661348768011117000
>>>> 54439076430224, 32, 54439076430192, 54439076429884, -308,
>>>> 1661348768001838000
>>>>
>>>> The current_time value in the last print is lower than in the previous
>>>> one.
>>>> So, the error occurs because time has gone backward.
>>>>
>>>> I think this is a possible situation during time synchronization.
>>>> My question is what should we do in this case?
>>>>
>>>> Best Regards,
>>>> Konstantin Kostiuk.
>>>>
>>>

--00000000000005b56e05ebff63d4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">ping<br></div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Wed, Aug 31, 2022 at 11:33 AM Vadim Rozenfeld &=
lt;<a href=3D"mailto:vrozenfe@redhat.com">vrozenfe@redhat.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"lt=
r"><div>Just a bit more info related to this issue.</div><div>Below is a qu=
ote from my previous conversation with Yan</div><div><br></div><div>&lt;/QU=
OTE&gt;<br></div><div><div>QEMU RTC function periodic_timer_update is calli=
ng in response <br></div><div>to Windows HAL calls</div><div>_HalpRtcArmTim=
er@16</div><div>and <br></div><div>_HalpRtcStop@4</div><div><br></div><div>=
WIndows can change timer=C2=A0 frequency=C2=A0 dynamically <br>(some more i=
nfo can be found here <a href=3D"https://bugzilla.redhat.com/show_bug.cgi?i=
d=3D1610461" target=3D"_blank">https://bugzilla.redhat.com/show_bug.cgi?id=
=3D1610461</a> )</div><div>but calculation of the frequency is based on the=
 wallclock time (IIRC).</div><div>And if I&#39;m not mistaken, then lost_ti=
ck_policy=3Ddelay can lead to the wallclock time delay,</div><div>which in =
my understanding can lead to the incorrect frequency calculation.</div><div=
><br></div><div>Another interesting thing is that they don&#39;t use Hyper-=
V enlightenments at all.</div><div>Do you know if there is any particular r=
eason for that?=C2=A0 They might try switching</div><div>to hv_stimer inste=
ad of RTC.</div><div><br></div><div>And one more thing, the frequency of th=
e timer can be adjusted by UM applications.</div><div>Some of them , like e=
mulators and servers use it quite widely. It worse=C2=A0 asking them</div><=
div>if they are running such kinds of apps.</div><div><div>&lt;/QUOTE&gt;<b=
r></div></div><div><br></div><div><br></div><div>Cheers,</div><div>Vadim.<b=
r></div></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Aug 31, 2022 at 5:46 PM Konstantin Kostiuk &lt;<a h=
ref=3D"mailto:kkostiuk@redhat.com" target=3D"_blank">kkostiuk@redhat.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><di=
v dir=3D"ltr">CC: Vadim<br></div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Wed, Aug 31, 2022 at 10:42 AM Konstantin Kost=
iuk &lt;<a href=3D"mailto:kkostiuk@redhat.com" target=3D"_blank">kkostiuk@r=
edhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"ltr">ping<br></div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 24, 2022 at 5:37 PM Konstan=
tin Kostiuk &lt;<a href=3D"mailto:kkostiuk@redhat.com" target=3D"_blank">kk=
ostiuk@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex"><div dir=3D"ltr">Hi Michael and Paolo,<br><br>I write to y=
ou as maintainers of mc146818rtc.c. I am working on bug <a href=3D"https://=
bugzilla.redhat.com/show_bug.cgi?id=3D2054781" target=3D"_blank">https://bu=
gzilla.redhat.com/show_bug.cgi?id=3D2054781</a><br>and reproduced it on the=
 current master branch.<br><br>I added some print at line 202 (before asser=
t(lost_clock &gt;=3D 0), <a href=3D"https://gitlab.com/qemu-project/qemu/-/=
blob/master/hw/rtc/mc146818rtc.c#L202" target=3D"_blank">https://gitlab.com=
/qemu-project/qemu/-/blob/master/hw/rtc/mc146818rtc.c#L202</a>) and got the=
 following values:<br><br>next_periodic_clock, old_period, last_periodic_cl=
ock, cur_clock, lost_clock, current_time<br>54439076429968, 32, 54439076429=
936, 54439076430178, 242, 1661348768010822000<br>54439076430224, 512, 54439=
076429712, 54439076430188, 476, 1661348768011117000<br>54439076430224, 32, =
54439076430192, 54439076429884, -308, 1661348768001838000<br><br>The curren=
t_time value in the last print is lower than in the previous one.<br>So, th=
e error occurs because time has gone backward.<br><br>I think this is a pos=
sible situation during time synchronization.<br>My question is what should =
we do in this case?<br><div><br></div><div><div dir=3D"ltr"><div dir=3D"ltr=
"><div>Best Regards,</div><div>Konstantin Kostiuk.</div></div></div></div><=
/div>
</blockquote></div>
</blockquote></div>
</blockquote></div>
</blockquote></div>

--00000000000005b56e05ebff63d4--


