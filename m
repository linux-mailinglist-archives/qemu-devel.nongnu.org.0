Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EAF76979C8
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 11:23:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSEvX-0006vZ-8U; Wed, 15 Feb 2023 05:22:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1pSEvV-0006v5-1y
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 05:22:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1pSEvT-0004Jt-1R
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 05:22:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676456529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WilpOaQPcOt9Wnm4xUcToVGQWlKtIOIi8bA7kbA4eNc=;
 b=YQLTHu/0wmOfbhXk7h5uh/LgidqWqT9lIbyllHY8ix87xg0GSceXl0sF5l3Qi4z/ut4Ojq
 iaFN6qD0E0byE1Qfcxvq8Lbg9U7JWYeitolcHw5ANTfMOeNr9XM/ZMoOWuwy+k8F0n4Vm5
 S3JSOUTMCfY0a3eMjNfYur1TeWDICvE=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-619-qyks5lT2OG2lDgJNVCmT0Q-1; Wed, 15 Feb 2023 05:22:06 -0500
X-MC-Unique: qyks5lT2OG2lDgJNVCmT0Q-1
Received: by mail-vs1-f69.google.com with SMTP id
 o4-20020a67b844000000b004120758a354so2815687vsh.22
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 02:22:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WilpOaQPcOt9Wnm4xUcToVGQWlKtIOIi8bA7kbA4eNc=;
 b=UUo6H4vj1935etZkaf8fJIQfFlwk/raRfvcnZwEzySkvRYjQTaZGiev2oNZZY8N6z6
 RFbPaciiS4PLXvBED0B288ozkF8zUPjxXEIGuVQqSUdkMdPnSaGSMP7NszlusBdR/cp5
 3nQ4N2Jpx0KE0etuOMeELB06EGFfgbKbuMt6o59ApwjjX61RvixSNXiuRypeW7MamH5i
 0HL7Shlm2UNaZySzeDp3g14uM3fCP9cPIuczwyrQ/zqXPyek881mer8zvtJjgpdrbEZM
 Bjon0ESVjOKo2zNuraa2otSEnRmyaifkumH5E91fkJPZcdQWEOaiOT33kpBGzME4D+1x
 FB6A==
X-Gm-Message-State: AO0yUKX877GeS/WdlygJ0QjCrDZ8y6+5/S55JwaFGrAIkKBp9/gPzn0N
 REOzlKKNsc/jmOqNb802Egx6RCZw5BFV8Uq8jjYm/ncu6ifFkvTyw6rm53bUwtzOpen3MC0WL6J
 e/Nq5Wc0n+xQY25fCJXRbtqSm6ynOnKU=
X-Received: by 2002:a1f:a7d7:0:b0:3e9:fd3b:692e with SMTP id
 q206-20020a1fa7d7000000b003e9fd3b692emr237219vke.38.1676456525681; 
 Wed, 15 Feb 2023 02:22:05 -0800 (PST)
X-Google-Smtp-Source: AK7set9FyB8Wo/21KkTZWq//ZoKsjZxc9dhgRrVUIXXFKEr0g1rqSy/xwIrv9kEVbhCEE/N4olkG4d4PKcOoqspjTYs=
X-Received: by 2002:a1f:a7d7:0:b0:3e9:fd3b:692e with SMTP id
 q206-20020a1fa7d7000000b003e9fd3b692emr237213vke.38.1676456525400; Wed, 15
 Feb 2023 02:22:05 -0800 (PST)
MIME-Version: 1.0
References: <20230209085004.2745131-1-kfir@daynix.com>
 <CAPMcbCo+XEXTJKD24vMH8DzYgKJs5jBKNpH1annMthPUGEnazg@mail.gmail.com>
 <CAMxuvaw0Z6YKm5hVF3=eB1nVR1_9rR4Mo_HeD4bfnz91nYfdGg@mail.gmail.com>
In-Reply-To: <CAMxuvaw0Z6YKm5hVF3=eB1nVR1_9rR4Mo_HeD4bfnz91nYfdGg@mail.gmail.com>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Wed, 15 Feb 2023 04:21:54 -0600
Message-ID: <CAPMcbCqQAca01aagME6v7Z3G1zsQGW7wKpqFRBvL5M79mfKbQQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] qga/win/vss: add VSS backup type options
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Cc: qemu-devel@nongnu.org, Michael Roth <michael.roth@amd.com>, 
 Kfir Manor <kfir@daynix.com>, Yan Vugenfirer <yan@daynix.com>
Content-Type: multipart/alternative; boundary="000000000000ada3e605f4ba735a"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kkostiuk@redhat.com;
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

--000000000000ada3e605f4ba735a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 14, 2023 at 3:20 AM Marc-Andr=C3=A9 Lureau <
marcandre.lureau@redhat.com> wrote:

> Hi
>
> On Mon, Feb 13, 2023 at 8:20 PM Konstantin Kostiuk <kkostiuk@redhat.com>
> wrote:
>
>> Hi Marc-Andr=C3=A9,
>>
>> Can you please review this patch set?
>>
>> Best Regards,
>> Konstantin Kostiuk.
>>
>>
>> On Thu, Feb 9, 2023 at 10:50 AM Kfir Manor <kfir@daynix.com> wrote:
>>
>>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/775
>>>
>>> The problem, VSS backup type VSS-FULL (the only available VSS backup
>>> type currently) can break other backups that use VSS-FULL(for example,
>>> Bareos-Fullbackup).
>>>
>>> Fix, add other backup types.
>>>
>>> Implementation, put the desired backup type number inside Regkey value
>>> HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\QEMU Guest Agent V=
SS
>>> Provider\VssOption, so that the program can query the desired backup ty=
pe.
>>>
>>> VSS backup types:
>>> number   type
>>> 1        VSS_BT_FULL
>>> 2        VSS_BT_INCREMENTAL
>>> 3        VSS_BT_DIFFERENTIAL
>>> 4        VSS_BT_LOG
>>> 5        VSS_BT_COPY
>>>
>>> for more information about the different backup types
>>> https://learn.microsoft.com/en-us/windows/win32/vss/vss-backup-state
>>>
>>> Additionally, the program would work as before with VSS-FULL in cases
>>> where VssOption doesn't exist, or VssOption value isn't a known backup =
type.
>>>
>>
> The patch series looks ok (just minor stylistic changes could be made),
> but I do not fully understand the way qga-vss.dll works in details for
> freeze/thaw.
>
> My understanding is that FIFREEZE do not exist on win32, so we call VSS t=
o
> tell (some) apps to flush/freeze pretending a backup is going on, then we
> get notified on completion by our own provider (CommitSnapshots) and wait
> there for thaw (1 min while VM is suspended?).
>
> But I don't understand how this interacts with other providers (real
> backup solutions), and why they are involved/conflict as described in
> https://gitlab.com/qemu-project/qemu/-/issues/775.
>

This is a very good question. To understand the reason for the conflict we
should dig deeper into VSS.
For some reason, MS provides different VSS backup types. Currently, we
don't use other types but we got
a request from the community. I think this is ok, to add more freedom of
configuration if someone wants it.
Anyway, the default behavior is not changed.


>
>
>>
>>> Kfir Manor (3):
>>>   add VssOption to installer
>>>   query VSS backup type
>>>   requester_freeze changes
>>>
>>>  qga/installer/qemu-ga.wxs   |  4 ++++
>>>  qga/vss-win32/requester.cpp | 41 ++++++++++++++++++++++++++++++++++++-
>>>  qga/vss-win32/vss-handles.h |  3 +++
>>>  3 files changed, 47 insertions(+), 1 deletion(-)
>>>
>>> --
>>> 2.38.1
>>>
>>>

--000000000000ada3e605f4ba735a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 14, 2023 at 3:20 AM Marc-=
Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.com">marcan=
dre.lureau@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 13=
, 2023 at 8:20 PM Konstantin Kostiuk &lt;<a href=3D"mailto:kkostiuk@redhat.=
com" target=3D"_blank">kkostiuk@redhat.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>Hi Marc-And=
r=C3=A9,</div><div><br></div><div>Can you please review this patch set?<br>=
</div><div><br></div><div><div><div dir=3D"ltr"><div dir=3D"ltr"><div>Best =
Regards,</div><div>Konstantin Kostiuk.</div></div></div></div><br></div></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On =
Thu, Feb 9, 2023 at 10:50 AM Kfir Manor &lt;<a href=3D"mailto:kfir@daynix.c=
om" target=3D"_blank">kfir@daynix.com</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">Resolves: <a href=3D"https://gitlab.co=
m/qemu-project/qemu/-/issues/775" rel=3D"noreferrer" target=3D"_blank">http=
s://gitlab.com/qemu-project/qemu/-/issues/775</a><br>
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
ribed in <a href=3D"https://gitlab.com/qemu-project/qemu/-/issues/775" targ=
et=3D"_blank">https://gitlab.com/qemu-project/qemu/-/issues/775</a>.</div><=
/div></div></blockquote><div><br></div><div>This is a very good question. T=
o understand the reason for the conflict we should dig deeper into VSS.</di=
v><div>For some reason, MS provides different VSS backup types. Currently, =
we don&#39;t use other types but we got</div><div>a request from the commun=
ity. I think this is ok, to add more freedom of configuration if someone wa=
nts it.</div><div>Anyway, the default behavior is not changed.<br></div><di=
v>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D=
"ltr"><div class=3D"gmail_quote"><div></div><div>=C2=A0<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex"><div class=3D"gmail_quote"><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">
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
</blockquote></div></div>

--000000000000ada3e605f4ba735a--


