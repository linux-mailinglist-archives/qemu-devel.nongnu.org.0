Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5B3695EDD
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 10:21:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRrUo-00058M-Ma; Tue, 14 Feb 2023 04:21:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1pRrUf-000575-6M
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 04:20:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1pRrUc-0004Cu-SA
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 04:20:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676366454;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rsvEQx14y2hlP0UBOC1q70ynk27WDos/OmVtY7TzTrk=;
 b=bcl/PETTs2KxttUk3ULqvptW3xLtDWrRuxMDAh0d8mY19mLbRl/bDRK3nh3anzqNK0Onis
 qAFvgxlzEg3D1j/WsuA3SqF0JXCAbqPUMKuhLt9SsmNriWe+JXVXRtX0WbOILSJkIk92ns
 XovmDs9cLUXFN/5HkeR7pAFK0Qlfrlc=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-169-Li35EFtoMM2suNuDH0EEqA-1; Tue, 14 Feb 2023 04:20:52 -0500
X-MC-Unique: Li35EFtoMM2suNuDH0EEqA-1
Received: by mail-ej1-f70.google.com with SMTP id
 o5-20020a170906774500b008b1293861cdso1475358ejn.3
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 01:20:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rsvEQx14y2hlP0UBOC1q70ynk27WDos/OmVtY7TzTrk=;
 b=e3PRIojLY5Ic14xCCl51HGSlwx10nRTrASH/a+7NBEmTdb4PTd+g0yRQo+tCIX9W/Y
 OiHEwPPcP+lfndrQ7Z9LnhIgpvUnhKXG89WSD81P7Uk0efC9n/7936XUH/e+Y7acJYV0
 pr/z59NNZUpQhOPYfajrHHR8cC8FqLzvgEwIXUmma+g8Nl8v4jvAQcdcx2/CRXH7YH94
 Sw1euj0u0OcIjMkLcmr822LOCXljmEMEtnKt/w3WPEBNEfo/69506uNfAwYC18/0xI0g
 oEIafcDQ8Ukl69jhU4furqL/i7fbMYNHB0CbnqZOyQHFcWN/8EFQZgWmsK2gBfI8DXG9
 e0VA==
X-Gm-Message-State: AO0yUKUDvMGRv93LqOD9P7VOMBzXnSFz2r0P6/iPE884OM0ecAh1dmqG
 mhHfiWuKXB0saY+zM8kiH1xFuo9YeY/rbTL+zBbXxtE7LLkxRIbZsXn6GNOJRz7xEZT95lY22Qq
 WNtnsFMVAfqZuZmgOlALXb1Hu6EtoI3k=
X-Received: by 2002:a17:907:119a:b0:897:2774:b31d with SMTP id
 uz26-20020a170907119a00b008972774b31dmr958004ejb.2.1676366451183; 
 Tue, 14 Feb 2023 01:20:51 -0800 (PST)
X-Google-Smtp-Source: AK7set/MOAncogXXSIjI3tF9GCKJPBgIAQqy02fzcP0v57X/8T3hU6/JsDtUpBuREqwt1RHx3o7qcphF7lbxgbE1dT0=
X-Received: by 2002:a17:907:119a:b0:897:2774:b31d with SMTP id
 uz26-20020a170907119a00b008972774b31dmr957989ejb.2.1676366450902; Tue, 14 Feb
 2023 01:20:50 -0800 (PST)
MIME-Version: 1.0
References: <20230209085004.2745131-1-kfir@daynix.com>
 <CAPMcbCo+XEXTJKD24vMH8DzYgKJs5jBKNpH1annMthPUGEnazg@mail.gmail.com>
In-Reply-To: <CAPMcbCo+XEXTJKD24vMH8DzYgKJs5jBKNpH1annMthPUGEnazg@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 14 Feb 2023 13:20:39 +0400
Message-ID: <CAMxuvaw0Z6YKm5hVF3=eB1nVR1_9rR4Mo_HeD4bfnz91nYfdGg@mail.gmail.com>
Subject: Re: [PATCH 0/3] qga/win/vss: add VSS backup type options
To: Konstantin Kostiuk <kkostiuk@redhat.com>
Cc: qemu-devel@nongnu.org, Michael Roth <michael.roth@amd.com>, 
 Kfir Manor <kfir@daynix.com>, Yan Vugenfirer <yan@daynix.com>
Content-Type: multipart/alternative; boundary="000000000000d1d76305f4a57a12"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
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

--000000000000d1d76305f4a57a12
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, Feb 13, 2023 at 8:20 PM Konstantin Kostiuk <kkostiuk@redhat.com>
wrote:

> Hi Marc-Andr=C3=A9,
>
> Can you please review this patch set?
>
> Best Regards,
> Konstantin Kostiuk.
>
>
> On Thu, Feb 9, 2023 at 10:50 AM Kfir Manor <kfir@daynix.com> wrote:
>
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/775
>>
>> The problem, VSS backup type VSS-FULL (the only available VSS backup typ=
e
>> currently) can break other backups that use VSS-FULL(for example,
>> Bareos-Fullbackup).
>>
>> Fix, add other backup types.
>>
>> Implementation, put the desired backup type number inside Regkey value
>> HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\QEMU Guest Agent VS=
S
>> Provider\VssOption, so that the program can query the desired backup typ=
e.
>>
>> VSS backup types:
>> number   type
>> 1        VSS_BT_FULL
>> 2        VSS_BT_INCREMENTAL
>> 3        VSS_BT_DIFFERENTIAL
>> 4        VSS_BT_LOG
>> 5        VSS_BT_COPY
>>
>> for more information about the different backup types
>> https://learn.microsoft.com/en-us/windows/win32/vss/vss-backup-state
>>
>> Additionally, the program would work as before with VSS-FULL in cases
>> where VssOption doesn't exist, or VssOption value isn't a known backup t=
ype.
>>
>
The patch series looks ok (just minor stylistic changes could be made), but
I do not fully understand the way qga-vss.dll works in details for
freeze/thaw.

My understanding is that FIFREEZE do not exist on win32, so we call VSS to
tell (some) apps to flush/freeze pretending a backup is going on, then we
get notified on completion by our own provider (CommitSnapshots) and wait
there for thaw (1 min while VM is suspended?).

But I don't understand how this interacts with other providers (real backup
solutions), and why they are involved/conflict as described in
https://gitlab.com/qemu-project/qemu/-/issues/775.




>
>> Kfir Manor (3):
>>   add VssOption to installer
>>   query VSS backup type
>>   requester_freeze changes
>>
>>  qga/installer/qemu-ga.wxs   |  4 ++++
>>  qga/vss-win32/requester.cpp | 41 ++++++++++++++++++++++++++++++++++++-
>>  qga/vss-win32/vss-handles.h |  3 +++
>>  3 files changed, 47 insertions(+), 1 deletion(-)
>>
>> --
>> 2.38.1
>>
>>

--000000000000d1d76305f4a57a12
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 13, 2023 at 8:20 PM Kon=
stantin Kostiuk &lt;<a href=3D"mailto:kkostiuk@redhat.com">kkostiuk@redhat.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><div dir=3D"ltr"><div>Hi Marc-Andr=C3=A9,</div><div><br></div><div>Can y=
ou please review this patch set?<br></div><div><br></div><div><div><div dir=
=3D"ltr"><div dir=3D"ltr"><div>Best Regards,</div><div>Konstantin Kostiuk.<=
/div></div></div></div><br></div></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 9, 2023 at 10:50 AM Kfir Manor=
 &lt;<a href=3D"mailto:kfir@daynix.com" target=3D"_blank">kfir@daynix.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Re=
solves: <a href=3D"https://gitlab.com/qemu-project/qemu/-/issues/775" rel=
=3D"noreferrer" target=3D"_blank">https://gitlab.com/qemu-project/qemu/-/is=
sues/775</a><br>
<br>
The problem, VSS backup type VSS-FULL (the only available VSS backup type c=
urrently) can break other backups that use VSS-FULL(for example, Bareos-Ful=
lbackup).<br>
<br>
Fix, add other backup types.<br>
<br>
Implementation, put the desired backup type number inside Regkey value HKEY=
_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\QEMU Guest Agent VSS Provi=
der\VssOption, so that the program can query the desired backup type.<br>
<br>
VSS backup types:<br>
number=C2=A0 =C2=A0type<br>
1=C2=A0 =C2=A0 =C2=A0 =C2=A0 VSS_BT_FULL<br>
2=C2=A0 =C2=A0 =C2=A0 =C2=A0 VSS_BT_INCREMENTAL<br>
3=C2=A0 =C2=A0 =C2=A0 =C2=A0 VSS_BT_DIFFERENTIAL<br>
4=C2=A0 =C2=A0 =C2=A0 =C2=A0 VSS_BT_LOG<br>
5=C2=A0 =C2=A0 =C2=A0 =C2=A0 VSS_BT_COPY<br>
<br>
for more information about the different backup types <a href=3D"https://le=
arn.microsoft.com/en-us/windows/win32/vss/vss-backup-state" rel=3D"noreferr=
er" target=3D"_blank">https://learn.microsoft.com/en-us/windows/win32/vss/v=
ss-backup-state</a><br>
<br>
Additionally, the program would work as before with VSS-FULL in cases where=
 VssOption doesn&#39;t exist, or VssOption value isn&#39;t a known backup t=
ype.<br></blockquote></div></blockquote><div><br></div><div>The patch serie=
s looks ok (just minor stylistic changes could be made), but I do not fully=
 understand the way qga-vss.dll works in details for freeze/thaw.</div><div=
><br></div><div>My understanding is that FIFREEZE do not exist on win32, so=
 we call VSS to tell (some) apps to flush/freeze pretending a backup is goi=
ng on, then we get notified on completion by our own provider (CommitSnapsh=
ots) and wait there for thaw (1 min while VM is suspended?). <br></div><div=
><br></div><div>But I don&#39;t understand how this interacts with other pr=
oviders (real backup solutions), and why they are involved/conflict as desc=
ribed in <a href=3D"https://gitlab.com/qemu-project/qemu/-/issues/775">http=
s://gitlab.com/qemu-project/qemu/-/issues/775</a>.</div><div><br></div><div=
><br></div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
Kfir Manor (3):<br>
=C2=A0 add VssOption to installer<br>
=C2=A0 query VSS backup type<br>
=C2=A0 requester_freeze changes<br>
<br>
=C2=A0qga/installer/qemu-ga.wxs=C2=A0 =C2=A0|=C2=A0 4 ++++<br>
=C2=A0qga/vss-win32/requester.cpp | 41 ++++++++++++++++++++++++++++++++++++=
-<br>
=C2=A0qga/vss-win32/vss-handles.h |=C2=A0 3 +++<br>
=C2=A03 files changed, 47 insertions(+), 1 deletion(-)<br>
<br>
-- <br>
2.38.1<br>
<br>
</blockquote></div>
</blockquote></div></div>

--000000000000d1d76305f4a57a12--


