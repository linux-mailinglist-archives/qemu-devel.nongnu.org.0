Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8784C30ACB3
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 17:34:38 +0100 (CET)
Received: from localhost ([::1]:52796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6c9t-0000x8-Ff
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 11:34:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cdupontd@redhat.com>)
 id 1l6c7S-000857-1u
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 11:32:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cdupontd@redhat.com>)
 id 1l6c7L-0002QG-Kh
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 11:32:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612197118;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EBiYxwSBtq8Ao5ggRW/+wdBKNGkNXmWp6dxYgq9617s=;
 b=J7ZqjyTTbtBXejc9ZcDqQxthe6SfBvbRfiFA9htfUjD6xBjm5UjlNYcZoEos0uPeH/INQU
 2UbUzsTf+z3l/oTzHnqUsKMci2VaetsnsoUeq5KDpAZp6gI6gKk/21sqV85D745Og8GpsG
 1zJABingbHMkyiyiWN3ZC8Ke7QM62SU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-MRV8zLkTMfyfVc8i3pgtYQ-1; Mon, 01 Feb 2021 11:31:55 -0500
X-MC-Unique: MRV8zLkTMfyfVc8i3pgtYQ-1
Received: by mail-wm1-f70.google.com with SMTP id z25so152119wml.0
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 08:31:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=WgxjJJ1kp7hrrAISzWD3d0zPxM4Wk/OI0bZ7ewsWQQM=;
 b=sEFNU6z8spDgmcJHtjbEAjXTutj+obmXU/StBxKmor2RglinUxuL2gSnFJ2CVOsj5o
 AdIqgSrkUO8NWinOWywk67WTirty8JskNyMcVHKyyJeLni2u0pCgt4IMhWiF+/sZsM/F
 KCmo8m+wPkhTtIKvaTTrjFyZK212kSiRBMaXYjWOMxzScpNWdYWPimtUj4DOwVAaM8Ko
 /v8IeRTTu/r0YeFxp3kj8ifI39RsWzQAMsqzC5oKZM5pBNRx272vEgCggWzHbpkawhxk
 60J/0g9P0rYD5eqFVVwu0Byq1fuaO8Cyf05YD5ZDzeBg1dfXw45ODtvgt+2u7JlPwh6R
 au3Q==
X-Gm-Message-State: AOAM530Kx6HAzaSgwqq7T46w7C09uesNZr2EoxnHdAlBpc4OJ3rGNKQt
 Z8WBprCzni4CPgTGbN5RT5AH4nsp6AYvhiHFWl6hZvrP/zCwINWl/hVu8tJm/yzAR4LE6D/1wn0
 2Lts7R26HnUhWabY=
X-Received: by 2002:a5d:414f:: with SMTP id c15mr19182525wrq.42.1612197114330; 
 Mon, 01 Feb 2021 08:31:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyN8cssNk9VAHT0skeg5f4rhuTNBUnPkE6aU7G7QV9z+/Mn1EU1jUrhrUhe5Vq+2yTbOH9POA==
X-Received: by 2002:a5d:414f:: with SMTP id c15mr19182499wrq.42.1612197114032; 
 Mon, 01 Feb 2021 08:31:54 -0800 (PST)
Received: from ?IPv6:2a01:e0a:466:71c0:4dc8:c97f:f933:8921?
 ([2a01:e0a:466:71c0:4dc8:c97f:f933:8921])
 by smtp.gmail.com with ESMTPSA id i7sm3309306wru.49.2021.02.01.08.31.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 01 Feb 2021 08:31:53 -0800 (PST)
From: Christophe de Dinechin <cdupontd@redhat.com>
Message-Id: <0C14700F-CF47-4CD1-AB41-AA69BC0DA469@redhat.com>
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: vnc clipboard support
Date: Mon, 1 Feb 2021 17:31:52 +0100
In-Reply-To: <20210201155116.GL4131462@redhat.com>
To: =?utf-8?B?IkRhbmllbCBQLiBCZXJyYW5nw6ki?= <berrange@redhat.com>
References: <20210128171224.exbklnwtyb232oe2@sirius.home.kraxel.org>
 <C26A91E6-A5AE-4258-A470-91B6B5BC7C7F@redhat.com>
 <20210129080323.xuvokq5kytoomx6j@sirius.home.kraxel.org>
 <8E05F8C9-A60D-45A9-AFCB-79D866F57660@redhat.com>
 <20210129110814.GF4001740@redhat.com>
 <0F802343-19F8-487C-8BBE-5BBE2014BA1C@redhat.com>
 <20210129143252.GE4008275@redhat.com>
 <05C58667-D9BA-49E2-897D-2286B243E802@redhat.com>
 <20210201155116.GL4131462@redhat.com>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cdupontd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_36FDF335-3AFF-4DFE-98DB-11570DE2B149"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cdupontd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Apple-Mail=_36FDF335-3AFF-4DFE-98DB-11570DE2B149
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On 1 Feb 2021, at 16:51, Daniel P. Berrang=C3=A9 <berrange@redhat.com> wr=
ote:
>=20
> On Mon, Feb 01, 2021 at 04:27:43PM +0100, Christophe de Dinechin wrote:
>>=20
>>=20
>>> On 29 Jan 2021, at 15:32, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
>>>=20
>>> On Fri, Jan 29, 2021 at 03:19:45PM +0100, Christophe de Dinechin wrote:
>>>>=20
>>>>=20
>>>>> On 29 Jan 2021, at 12:08, Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>>>>>=20
>>>>> On Fri, Jan 29, 2021 at 11:50:10AM +0100, Christophe de Dinechin wrot=
e:
>>>>>>=20
>>>>>>=20
>>>>>>> On 29 Jan 2021, at 09:03, Gerd Hoffmann <kraxel@redhat.com> wrote:
>>>>>>>=20
>>>>>>> Hi,
>>>>>>>=20
>>>>>>>>> (1) Have some guest agent (spice does it that way).
>>>>>>>>>  Advantage: more flexible, allows more features.
>>>>>>>>>  Disadvantage: requires agent in the guest.
>>>>>>>>=20
>>>>>>>> What about running the option to relay data to a VNC server in the
>>>>>>>> guest if there is one running? In other words, using an existing
>>>>>>>> VNC server as an agent, with the option of having a stripped-down,
>>>>>>>> clipboard only VNC server as a later optimization.
>>>>>>>=20
>>>>>>> Well, if you run Xvnc in the guest anyway why use the qemu vnc serv=
er
>>>>>>> in the first place?
>>>>>>=20
>>>>>> I assume that if you use the qemu VNC, it's because you you don't wa=
nt to
>>>>>> run Xvnc on some external network, or care about accessing the guest
>>>>>> before Xvnc can be launched. There can be many reasons.
>>>>>>=20
>>>>>> Again, I want to make it clear that my suggestion is _not_ simply to=
 access
>>>>>> the existing Xvnc as is, but rather to stick with some VNC server co=
de to handle
>>>>>> the clipboard if / when possible.
>>>>>>=20
>>>>>> Let me try to imagine a scenario, where I'll use a macOS guest inten=
tionally
>>>>>> to clarify what I was thinking about.
>>>>>>=20
>>>>>> - During early boot, there is no in-guest VNC server, so to address =
that,
>>>>>> you connect to the qemu VNC. At this stage, all screen refresh is ha=
ndled
>>>>>> by the qemu VNC, and the best you can do if you want to support any
>>>>>> kind of copy-paste is to convert it to virtual keystrokes. The same =
would
>>>>>> be true for Linux on a text console.
>>>>>>=20
>>>>>> - Then comes up you macOS guest, and it still has no VNC port open,
>>>>>> so you are stuck with qemu-vnc doing all the work. But now you can
>>>>>> enable screen sharing, and that launches the Apple-maintained macOS
>>>>>> VNC server.
>>>>>>=20
>>>>>> - Let's assume for illustration that this listens on some private ne=
twork
>>>>>> that qemu can access, but that is not visible externally. In this ca=
se,
>>>>>> you could not VNC to the guest, but you can still VNC to qemu.
>>>>>>=20
>>>>>> - What I'm suggesting is that qemu-vnc could then switch to simply
>>>>>> relaying VNC traffic to that in-guest server. You'd get the smart up=
date
>>>>>> algorithm that Apple has put in place to deal with transparency and =
the
>>>>>> like, as well as a level of guest OS integration that would otherwis=
e be
>>>>>> much harder to replicate.
>>>>>=20
>>>>> IMHO that's an awful lot of complexity to add to the system
>>>>> that isn't especially useful and this opens up new attack
>>>>> vectors for the guest to exploit the host.
>>>>>=20
>>>>> If people have VNC/RDP/whatever configured inside their guest
>>>>> OS, then there's really little to no reason for them to want
>>>>> to connect to the QEMU VNC server, as viewing initial bootup
>>>>> phase is not required in normal case. The only time such
>>>>> people will need to use the QEMU VNC server is if the guest
>>>>> OS has broken in some way before it fully booted and thus failed
>>>>> to start the guest VNC server. There is no guest VNC server
>>>>> to hand off to in this scenario.
>>>>=20
>>>> It's a matter of what you want to do with that qemu vnc.
>>>>=20
>>>> If it's only a backup when there's nothing in the guest to help,
>>>> then maybe trying to support copy-paste is not a good idea.
>>>>=20
>>>> If it's a standard go-to access point for connecting to your
>>>> guest, then making it smart is hard, but useful.
>>>>=20
>>>>>=20
>>>>> The value of the QEMU host side VNC server is that it works
>>>>> for all possible guest OS, no matter whether they are running
>>>>> normally or broken, regardless of what the guest admin has
>>>>> configured in terms of guest level remote desktop.
>>>>=20
>>>> Understood.
>>>>=20
>>>> The downside is that there are things it can't do. It cannot correctly
>>>> determine the keyboard map, because that's controlled in software
>>>> in the guest.
>>>=20
>>> There is no need for the remote desktop server to care about the
>>> keymap. The remote client takes scancodes and passes them to the
>>> server, which then passes them to the guest.
>>=20
>> Aren't we talking about pasting clipboard data here?
>> I assume that clipboard data is not encoded as scancodes.
>=20
> The suggestion was that clipboard be sent by injecting key presses
> to the guest, so that is scancode based.

But the VNC clipboard protocol is not scancode based. So where
would the clipboard->scancode conversion happen?

Also, any idea how to copy from the guest in that case?

>=20
> If you're not doing it using key press injection, then keymapping
> and scancodes are irrelevant.

Indeed, but that requires some guest agent, and Gerd seems to
not like that idea.

BTW, isolating the clipboard sharing protocol from VNC is an
old idea, see https://wiki.xenproject.org/wiki/Clipboard_sharing_protocol <=
https://wiki.xenproject.org/wiki/Clipboard_sharing_protocol>.




--Apple-Mail=_36FDF335-3AFF-4DFE-98DB-11570DE2B149
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=3Dutf-8"></head><body style=3D"word-wrap: break-word; -webkit-nbsp-mode: s=
pace; line-break: after-white-space;" class=3D""><br class=3D""><div><br cl=
ass=3D""><blockquote type=3D"cite" class=3D""><div class=3D"">On 1 Feb 2021=
, at 16:51, Daniel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.c=
om" class=3D"">berrange@redhat.com</a>&gt; wrote:</div><br class=3D"Apple-i=
nterchange-newline"><div class=3D""><meta charset=3D"UTF-8" class=3D""><spa=
n style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 18=
px; font-style: normal; font-variant-caps: normal; font-weight: normal; let=
ter-spacing: normal; text-align: start; text-indent: 0px; text-transform: n=
one; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px=
; text-decoration: none; float: none; display: inline !important;" class=3D=
"">On Mon, Feb 01, 2021 at 04:27:43PM +0100, Christophe de Dinechin wrote:<=
/span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-=
size: 18px; font-style: normal; font-variant-caps: normal; font-weight: nor=
mal; letter-spacing: normal; text-align: start; text-indent: 0px; text-tran=
sform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-wi=
dth: 0px; text-decoration: none;" class=3D""><blockquote type=3D"cite" styl=
e=3D"font-family: Helvetica; font-size: 18px; font-style: normal; font-vari=
ant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: aut=
o; text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -w=
ebkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><br class=
=3D""><br class=3D""><blockquote type=3D"cite" class=3D"">On 29 Jan 2021, a=
t 15:32, Daniel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com"=
 class=3D"">berrange@redhat.com</a>&gt; wrote:<br class=3D""><br class=3D""=
>On Fri, Jan 29, 2021 at 03:19:45PM +0100, Christophe de Dinechin wrote:<br=
 class=3D""><blockquote type=3D"cite" class=3D""><br class=3D""><br class=
=3D""><blockquote type=3D"cite" class=3D"">On 29 Jan 2021, at 12:08, Daniel=
 P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com" class=3D"">ber=
range@redhat.com</a>&gt; wrote:<br class=3D""><br class=3D"">On Fri, Jan 29=
, 2021 at 11:50:10AM +0100, Christophe de Dinechin wrote:<br class=3D""><bl=
ockquote type=3D"cite" class=3D""><br class=3D""><br class=3D""><blockquote=
 type=3D"cite" class=3D"">On 29 Jan 2021, at 09:03, Gerd Hoffmann &lt;<a hr=
ef=3D"mailto:kraxel@redhat.com" class=3D"">kraxel@redhat.com</a>&gt; wrote:=
<br class=3D""><br class=3D"">Hi,<br class=3D""><br class=3D""><blockquote =
type=3D"cite" class=3D""><blockquote type=3D"cite" class=3D"">(1) Have some=
 guest agent (spice does it that way).<br class=3D"">&nbsp;Advantage: more =
flexible, allows more features.<br class=3D"">&nbsp;Disadvantage: requires =
agent in the guest.<br class=3D""></blockquote><br class=3D"">What about ru=
nning the option to relay data to a VNC server in the<br class=3D"">guest i=
f there is one running? In other words, using an existing<br class=3D"">VNC=
 server as an agent, with the option of having a stripped-down,<br class=3D=
"">clipboard only VNC server as a later optimization.<br class=3D""></block=
quote><br class=3D"">Well, if you run Xvnc in the guest anyway why use the =
qemu vnc server<br class=3D"">in the first place?<br class=3D""></blockquot=
e><br class=3D"">I assume that if you use the qemu VNC, it's because you yo=
u don't want to<br class=3D"">run Xvnc on some external network, or care ab=
out accessing the guest<br class=3D"">before Xvnc can be launched. There ca=
n be many reasons.<br class=3D""><br class=3D"">Again, I want to make it cl=
ear that my suggestion is _not_ simply to access<br class=3D"">the existing=
 Xvnc as is, but rather to stick with some VNC server code to handle<br cla=
ss=3D"">the clipboard if / when possible.<br class=3D""><br class=3D"">Let =
me try to imagine a scenario, where I'll use a macOS guest intentionally<br=
 class=3D"">to clarify what I was thinking about.<br class=3D""><br class=
=3D"">- During early boot, there is no in-guest VNC server, so to address t=
hat,<br class=3D"">you connect to the qemu VNC. At this stage, all screen r=
efresh is handled<br class=3D"">by the qemu VNC, and the best you can do if=
 you want to support any<br class=3D"">kind of copy-paste is to convert it =
to virtual keystrokes. The same would<br class=3D"">be true for Linux on a =
text console.<br class=3D""><br class=3D"">- Then comes up you macOS guest,=
 and it still has no VNC port open,<br class=3D"">so you are stuck with qem=
u-vnc doing all the work. But now you can<br class=3D"">enable screen shari=
ng, and that launches the Apple-maintained macOS<br class=3D"">VNC server.<=
br class=3D""><br class=3D"">- Let's assume for illustration that this list=
ens on some private network<br class=3D"">that qemu can access, but that is=
 not visible externally. In this case,<br class=3D"">you could not VNC to t=
he guest, but you can still VNC to qemu.<br class=3D""><br class=3D"">- Wha=
t I'm suggesting is that qemu-vnc could then switch to simply<br class=3D""=
>relaying VNC traffic to that in-guest server. You'd get the smart update<b=
r class=3D"">algorithm that Apple has put in place to deal with transparenc=
y and the<br class=3D"">like, as well as a level of guest OS integration th=
at would otherwise be<br class=3D"">much harder to replicate.<br class=3D""=
></blockquote><br class=3D"">IMHO that's an awful lot of complexity to add =
to the system<br class=3D"">that isn't especially useful and this opens up =
new attack<br class=3D"">vectors for the guest to exploit the host.<br clas=
s=3D""><br class=3D"">If people have VNC/RDP/whatever configured inside the=
ir guest<br class=3D"">OS, then there's really little to no reason for them=
 to want<br class=3D"">to connect to the QEMU VNC server, as viewing initia=
l bootup<br class=3D"">phase is not required in normal case. The only time =
such<br class=3D"">people will need to use the QEMU VNC server is if the gu=
est<br class=3D"">OS has broken in some way before it fully booted and thus=
 failed<br class=3D"">to start the guest VNC server. There is no guest VNC =
server<br class=3D"">to hand off to in this scenario.<br class=3D""></block=
quote><br class=3D"">It's a matter of what you want to do with that qemu vn=
c.<br class=3D""><br class=3D"">If it's only a backup when there's nothing =
in the guest to help,<br class=3D"">then maybe trying to support copy-paste=
 is not a good idea.<br class=3D""><br class=3D"">If it's a standard go-to =
access point for connecting to your<br class=3D"">guest, then making it sma=
rt is hard, but useful.<br class=3D""><br class=3D""><blockquote type=3D"ci=
te" class=3D""><br class=3D"">The value of the QEMU host side VNC server is=
 that it works<br class=3D"">for all possible guest OS, no matter whether t=
hey are running<br class=3D"">normally or broken, regardless of what the gu=
est admin has<br class=3D"">configured in terms of guest level remote deskt=
op.<br class=3D""></blockquote><br class=3D"">Understood.<br class=3D""><br=
 class=3D"">The downside is that there are things it can't do. It cannot co=
rrectly<br class=3D"">determine the keyboard map, because that's controlled=
 in software<br class=3D"">in the guest.<br class=3D""></blockquote><br cla=
ss=3D"">There is no need for the remote desktop server to care about the<br=
 class=3D"">keymap. The remote client takes scancodes and passes them to th=
e<br class=3D"">server, which then passes them to the guest.<br class=3D"">=
</blockquote><br class=3D"">Aren't we talking about pasting clipboard data =
here?<br class=3D"">I assume that clipboard data is not encoded as scancode=
s.<br class=3D""></blockquote><br style=3D"caret-color: rgb(0, 0, 0); font-=
family: Helvetica; font-size: 18px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; tex=
t-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px=
; -webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 18px=
; font-style: normal; font-variant-caps: normal; font-weight: normal; lette=
r-spacing: normal; text-align: start; text-indent: 0px; text-transform: non=
e; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" class=3D""=
>The suggestion was that clipboard be sent by injecting key presses</span><=
br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 1=
8px; font-style: normal; font-variant-caps: normal; font-weight: normal; le=
tter-spacing: normal; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0,=
 0); font-family: Helvetica; font-size: 18px; font-style: normal; font-vari=
ant-caps: normal; font-weight: normal; letter-spacing: normal; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; word-sp=
acing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none; float: n=
one; display: inline !important;" class=3D"">to the guest, so that is scanc=
ode based.</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helve=
tica; font-size: 18px; font-style: normal; font-variant-caps: normal; font-=
weight: normal; letter-spacing: normal; text-align: start; text-indent: 0px=
; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-tex=
t-stroke-width: 0px; text-decoration: none;" class=3D""></div></blockquote>=
<div><br class=3D""></div><div>But the VNC clipboard protocol is not scanco=
de based. So where</div><div>would the clipboard-&gt;scancode conversion ha=
ppen?</div><div><br class=3D""></div><div>Also, any idea how to copy from t=
he guest in that case?</div><div><br class=3D""></div><blockquote type=3D"c=
ite" class=3D""><div class=3D""><br style=3D"caret-color: rgb(0, 0, 0); fon=
t-family: Helvetica; font-size: 18px; font-style: normal; font-variant-caps=
: normal; font-weight: normal; letter-spacing: normal; text-align: start; t=
ext-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0=
px; -webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><spa=
n style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 18=
px; font-style: normal; font-variant-caps: normal; font-weight: normal; let=
ter-spacing: normal; text-align: start; text-indent: 0px; text-transform: n=
one; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px=
; text-decoration: none; float: none; display: inline !important;" class=3D=
"">If you're not doing it using key press injection, then keymapping</span>=
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
18px; font-style: normal; font-variant-caps: normal; font-weight: normal; l=
etter-spacing: normal; text-align: start; text-indent: 0px; text-transform:=
 none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0=
px; text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0=
, 0); font-family: Helvetica; font-size: 18px; font-style: normal; font-var=
iant-caps: normal; font-weight: normal; letter-spacing: normal; text-align:=
 start; text-indent: 0px; text-transform: none; white-space: normal; word-s=
pacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none; float: =
none; display: inline !important;" class=3D"">and scancodes are irrelevant.=
</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font=
-size: 18px; font-style: normal; font-variant-caps: normal; font-weight: no=
rmal; letter-spacing: normal; text-align: start; text-indent: 0px; text-tra=
nsform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-w=
idth: 0px; text-decoration: none;" class=3D""></div></blockquote><div><br c=
lass=3D""></div><div>Indeed, but that requires some guest agent, and Gerd s=
eems to</div><div>not like that idea.</div><div><br class=3D""></div><div>B=
TW, isolating the clipboard sharing protocol from VNC is an</div><div>old i=
dea, see&nbsp;<a href=3D"https://wiki.xenproject.org/wiki/Clipboard_sharing=
_protocol" class=3D"">https://wiki.xenproject.org/wiki/Clipboard_sharing_pr=
otocol</a>.</div><div><br class=3D""></div><div><br class=3D""></div><div><=
br class=3D""></div></div></body></html>
--Apple-Mail=_36FDF335-3AFF-4DFE-98DB-11570DE2B149--


