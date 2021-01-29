Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E2A308980
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 15:21:47 +0100 (CET)
Received: from localhost ([::1]:56870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Ueg-0005fv-KT
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 09:21:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cdupontd@redhat.com>)
 id 1l5Ucu-0004rs-Rl
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 09:19:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53284)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cdupontd@redhat.com>)
 id 1l5Ucs-0006Tj-HC
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 09:19:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611929993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ugptNDrAHvincwgwWOXRzYr/MfEMQEDsXOOn3budy0s=;
 b=Dw//SzaID1gPhpj4B2voNc2aUHPBrcYOKHBg8hAOWpBEkyphCIwkhgtbG6waDyeSIp+SiG
 Jz26G6Y7Hay2CUyEhipMbW01itzy0VqtU3nGRfP1IoeGsDQrXYkszNO93y6Bjo5b6lmqc+
 ykYF60cievlZBDpLZzFelp5K12ATMkQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-4-iSRGINF4OIOHHmnO-hnAGA-1; Fri, 29 Jan 2021 09:19:50 -0500
X-MC-Unique: iSRGINF4OIOHHmnO-hnAGA-1
Received: by mail-wr1-f72.google.com with SMTP id n15so5207149wrv.20
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 06:19:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=UwbUVRtdlvkwGmsnOelrmgbyBhI3Pzf/jdfCTwxbZ+g=;
 b=mi65rBevB+lJLdyb3y04rQly4wE4jIifGfUuOGpfKsOo1sq3I928uU+IiMongiNnj3
 DXGEIz7SHrduaGyTFX9ZgA+3XepHQ/moYs8enJUIKonSbj5e97QXnAhoDhu3MfQhuChA
 daJwS5wF8TYvT/8iGWet2h4ysGE4HXruuNwNFZO/8GT7kb0aVzgc402WOyy5PLAug9CR
 RqQuXn8ibKkBo0Z2fv7Z5e1dDx3aaZ3uuxWn7tLvxn4oJxeIYxhzjANO1LDD66fuVhGE
 NnUP2DiwHkFVLRr4EYPoWVgmxqhe5EHZ/stoIk0Tx9bpTs+jTCHWBapIct82GBkjqEsk
 fTNw==
X-Gm-Message-State: AOAM53288DqW3pobss+NKuyWZPlQI/tfvYXjaCXEsF1YvPJHFnmHXQXh
 cZnOKU/LhHzNcinN2SGxtibhGaBgCndEfl1BM+4WdGVWNi8a5cWAj36XKZBW8HwhetTrCYsGc5b
 VakU30ATptPJRbCY=
X-Received: by 2002:a1c:1f58:: with SMTP id f85mr3787823wmf.82.1611929988954; 
 Fri, 29 Jan 2021 06:19:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxfjYmBb67BIlzc3X0PXuMUggCd9sv/vmfrZHI9PN6KGYm4MTQsXVfLTZGAo9MBl8TaZA+t1g==
X-Received: by 2002:a1c:1f58:: with SMTP id f85mr3787806wmf.82.1611929988675; 
 Fri, 29 Jan 2021 06:19:48 -0800 (PST)
Received: from ?IPv6:2a01:e0a:466:71c0:b806:f900:b9dc:9b2b?
 ([2a01:e0a:466:71c0:b806:f900:b9dc:9b2b])
 by smtp.gmail.com with ESMTPSA id n5sm8857343wmq.7.2021.01.29.06.19.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 29 Jan 2021 06:19:47 -0800 (PST)
From: Christophe de Dinechin <cdupontd@redhat.com>
Message-Id: <0F802343-19F8-487C-8BBE-5BBE2014BA1C@redhat.com>
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: vnc clipboard support
Date: Fri, 29 Jan 2021 15:19:45 +0100
In-Reply-To: <20210129110814.GF4001740@redhat.com>
To: =?utf-8?B?IkRhbmllbCBQLiBCZXJyYW5nw6ki?= <berrange@redhat.com>
References: <20210128171224.exbklnwtyb232oe2@sirius.home.kraxel.org>
 <C26A91E6-A5AE-4258-A470-91B6B5BC7C7F@redhat.com>
 <20210129080323.xuvokq5kytoomx6j@sirius.home.kraxel.org>
 <8E05F8C9-A60D-45A9-AFCB-79D866F57660@redhat.com>
 <20210129110814.GF4001740@redhat.com>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cdupontd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_409A7FEA-59A1-4B26-8B47-7E30A71E670F"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cdupontd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

--Apple-Mail=_409A7FEA-59A1-4B26-8B47-7E30A71E670F
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On 29 Jan 2021, at 12:08, Daniel P. Berrang=C3=A9 <berrange@redhat.com> w=
rote:
>=20
> On Fri, Jan 29, 2021 at 11:50:10AM +0100, Christophe de Dinechin wrote:
>>=20
>>=20
>>> On 29 Jan 2021, at 09:03, Gerd Hoffmann <kraxel@redhat.com> wrote:
>>>=20
>>> Hi,
>>>=20
>>>>> (1) Have some guest agent (spice does it that way).
>>>>>    Advantage: more flexible, allows more features.
>>>>>    Disadvantage: requires agent in the guest.
>>>>=20
>>>> What about running the option to relay data to a VNC server in the
>>>> guest if there is one running? In other words, using an existing
>>>> VNC server as an agent, with the option of having a stripped-down,
>>>> clipboard only VNC server as a later optimization.
>>>=20
>>> Well, if you run Xvnc in the guest anyway why use the qemu vnc server
>>> in the first place?
>>=20
>> I assume that if you use the qemu VNC, it's because you you don't want t=
o
>> run Xvnc on some external network, or care about accessing the guest
>> before Xvnc can be launched. There can be many reasons.
>>=20
>> Again, I want to make it clear that my suggestion is _not_ simply to acc=
ess
>> the existing Xvnc as is, but rather to stick with some VNC server code t=
o handle
>> the clipboard if / when possible.
>>=20
>> Let me try to imagine a scenario, where I'll use a macOS guest intention=
ally
>> to clarify what I was thinking about.
>>=20
>> - During early boot, there is no in-guest VNC server, so to address that=
,
>> you connect to the qemu VNC. At this stage, all screen refresh is handle=
d
>> by the qemu VNC, and the best you can do if you want to support any
>> kind of copy-paste is to convert it to virtual keystrokes. The same woul=
d
>> be true for Linux on a text console.
>>=20
>> - Then comes up you macOS guest, and it still has no VNC port open,
>> so you are stuck with qemu-vnc doing all the work. But now you can
>> enable screen sharing, and that launches the Apple-maintained macOS
>> VNC server.
>>=20
>> - Let's assume for illustration that this listens on some private networ=
k
>> that qemu can access, but that is not visible externally. In this case,
>> you could not VNC to the guest, but you can still VNC to qemu.
>>=20
>> - What I'm suggesting is that qemu-vnc could then switch to simply
>> relaying VNC traffic to that in-guest server. You'd get the smart update
>> algorithm that Apple has put in place to deal with transparency and the
>> like, as well as a level of guest OS integration that would otherwise be
>> much harder to replicate.
>=20
> IMHO that's an awful lot of complexity to add to the system
> that isn't especially useful and this opens up new attack
> vectors for the guest to exploit the host.
>=20
> If people have VNC/RDP/whatever configured inside their guest
> OS, then there's really little to no reason for them to want
> to connect to the QEMU VNC server, as viewing initial bootup
> phase is not required in normal case. The only time such
> people will need to use the QEMU VNC server is if the guest
> OS has broken in some way before it fully booted and thus failed
> to start the guest VNC server. There is no guest VNC server
> to hand off to in this scenario.

It's a matter of what you want to do with that qemu vnc.

If it's only a backup when there's nothing in the guest to help,
then maybe trying to support copy-paste is not a good idea.

If it's a standard go-to access point for connecting to your
guest, then making it smart is hard, but useful.

>=20
> The value of the QEMU host side VNC server is that it works
> for all possible guest OS, no matter whether they are running
> normally or broken, regardless of what the guest admin has
> configured in terms of guest level remote desktop.

Understood.

The downside is that there are things it can't do. It cannot correctly
determine the keyboard map, because that's controlled in software
in the guest.

Unless we para-virtualize the keyboard?

>=20
> IOW, if you have a guest remote desktop solution you'll just
> use that 99% of the time. If you don't have that, then you'll
> use QEMU VNC/SPICE server, and there won't be anything in the
> guest for that to proxy to/from.

If really the assumption is there is nothing in the guest to help
us, then I'd say "paste" should come up with a warning "do you want
me to try and translate that into keystrokes", and I don't see how to
implement copy from a graphical display without OCR=E2=80=A6


Cheers
Christophe


--Apple-Mail=_409A7FEA-59A1-4B26-8B47-7E30A71E670F
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=3Dutf-8"></head><body style=3D"word-wrap: break-word; -webkit-nbsp-mode: s=
pace; line-break: after-white-space;" class=3D""><br class=3D""><div><br cl=
ass=3D""><blockquote type=3D"cite" class=3D""><div class=3D"">On 29 Jan 202=
1, at 12:08, Daniel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.=
com" class=3D"">berrange@redhat.com</a>&gt; wrote:</div><br class=3D"Apple-=
interchange-newline"><div class=3D""><meta charset=3D"UTF-8" class=3D""><sp=
an style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 1=
8px; font-style: normal; font-variant-caps: normal; font-weight: normal; le=
tter-spacing: normal; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; text-decoration: none; float: none; display: inline !important;" class=
=3D"">On Fri, Jan 29, 2021 at 11:50:10AM +0100, Christophe de Dinechin wrot=
e:</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; fo=
nt-size: 18px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; text-t=
ransform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke=
-width: 0px; text-decoration: none;" class=3D""><blockquote type=3D"cite" s=
tyle=3D"font-family: Helvetica; font-size: 18px; font-style: normal; font-v=
ariant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: =
auto; text-align: start; text-indent: 0px; text-transform: none; white-spac=
e: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto;=
 -webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><br cla=
ss=3D""><br class=3D""><blockquote type=3D"cite" class=3D"">On 29 Jan 2021,=
 at 09:03, Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com" class=3D"=
">kraxel@redhat.com</a>&gt; wrote:<br class=3D""><br class=3D"">Hi,<br clas=
s=3D""><br class=3D""><blockquote type=3D"cite" class=3D""><blockquote type=
=3D"cite" class=3D"">(1) Have some guest agent (spice does it that way).<br=
 class=3D"">&nbsp;&nbsp;&nbsp;Advantage: more flexible, allows more feature=
s.<br class=3D"">&nbsp;&nbsp;&nbsp;Disadvantage: requires agent in the gues=
t.<br class=3D""></blockquote><br class=3D"">What about running the option =
to relay data to a VNC server in the<br class=3D"">guest if there is one ru=
nning? In other words, using an existing<br class=3D"">VNC server as an age=
nt, with the option of having a stripped-down,<br class=3D"">clipboard only=
 VNC server as a later optimization.<br class=3D""></blockquote><br class=
=3D"">Well, if you run Xvnc in the guest anyway why use the qemu vnc server=
<br class=3D"">in the first place?<br class=3D""></blockquote><br class=3D"=
">I assume that if you use the qemu VNC, it's because you you don't want to=
<br class=3D"">run Xvnc on some external network, or care about accessing t=
he guest<br class=3D"">before Xvnc can be launched. There can be many reaso=
ns.<br class=3D""><br class=3D"">Again, I want to make it clear that my sug=
gestion is _not_ simply to access<br class=3D"">the existing Xvnc as is, bu=
t rather to stick with some VNC server code to handle<br class=3D"">the cli=
pboard if / when possible.<br class=3D""><br class=3D"">Let me try to imagi=
ne a scenario, where I'll use a macOS guest intentionally<br class=3D"">to =
clarify what I was thinking about.<br class=3D""><br class=3D"">- During ea=
rly boot, there is no in-guest VNC server, so to address that,<br class=3D"=
">you connect to the qemu VNC. At this stage, all screen refresh is handled=
<br class=3D"">by the qemu VNC, and the best you can do if you want to supp=
ort any<br class=3D"">kind of copy-paste is to convert it to virtual keystr=
okes. The same would<br class=3D"">be true for Linux on a text console.<br =
class=3D""><br class=3D"">- Then comes up you macOS guest, and it still has=
 no VNC port open,<br class=3D"">so you are stuck with qemu-vnc doing all t=
he work. But now you can<br class=3D"">enable screen sharing, and that laun=
ches the Apple-maintained macOS<br class=3D"">VNC server.<br class=3D""><br=
 class=3D"">- Let's assume for illustration that this listens on some priva=
te network<br class=3D"">that qemu can access, but that is not visible exte=
rnally. In this case,<br class=3D"">you could not VNC to the guest, but you=
 can still VNC to qemu.<br class=3D""><br class=3D"">- What I'm suggesting =
is that qemu-vnc could then switch to simply<br class=3D"">relaying VNC tra=
ffic to that in-guest server. You'd get the smart update<br class=3D"">algo=
rithm that Apple has put in place to deal with transparency and the<br clas=
s=3D"">like, as well as a level of guest OS integration that would otherwis=
e be<br class=3D"">much harder to replicate.<br class=3D""></blockquote><br=
 style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 18p=
x; font-style: normal; font-variant-caps: normal; font-weight: normal; lett=
er-spacing: normal; text-align: start; text-indent: 0px; text-transform: no=
ne; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;=
 text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0=
); font-family: Helvetica; font-size: 18px; font-style: normal; font-varian=
t-caps: normal; font-weight: normal; letter-spacing: normal; text-align: st=
art; text-indent: 0px; text-transform: none; white-space: normal; word-spac=
ing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none; float: non=
e; display: inline !important;" class=3D"">IMHO that's an awful lot of comp=
lexity to add to the system</span><br style=3D"caret-color: rgb(0, 0, 0); f=
ont-family: Helvetica; font-size: 18px; font-style: normal; font-variant-ca=
ps: normal; font-weight: normal; letter-spacing: normal; text-align: start;=
 text-indent: 0px; text-transform: none; white-space: normal; word-spacing:=
 0px; -webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><s=
pan style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
18px; font-style: normal; font-variant-caps: normal; font-weight: normal; l=
etter-spacing: normal; text-align: start; text-indent: 0px; text-transform:=
 none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0=
px; text-decoration: none; float: none; display: inline !important;" class=
=3D"">that isn't especially useful and this opens up new attack</span><br s=
tyle=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 18px;=
 font-style: normal; font-variant-caps: normal; font-weight: normal; letter=
-spacing: normal; text-align: start; text-indent: 0px; text-transform: none=
; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; t=
ext-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0);=
 font-family: Helvetica; font-size: 18px; font-style: normal; font-variant-=
caps: normal; font-weight: normal; letter-spacing: normal; text-align: star=
t; text-indent: 0px; text-transform: none; white-space: normal; word-spacin=
g: 0px; -webkit-text-stroke-width: 0px; text-decoration: none; float: none;=
 display: inline !important;" class=3D"">vectors for the guest to exploit t=
he host.</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helveti=
ca; font-size: 18px; font-style: normal; font-variant-caps: normal; font-we=
ight: normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-=
stroke-width: 0px; text-decoration: none;" class=3D""><br style=3D"caret-co=
lor: rgb(0, 0, 0); font-family: Helvetica; font-size: 18px; font-style: nor=
mal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal=
; text-align: start; text-indent: 0px; text-transform: none; white-space: n=
ormal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: He=
lvetica; font-size: 18px; font-style: normal; font-variant-caps: normal; fo=
nt-weight: normal; letter-spacing: normal; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-=
text-stroke-width: 0px; text-decoration: none; float: none; display: inline=
 !important;" class=3D"">If people have VNC/RDP/whatever configured inside =
their guest</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helv=
etica; font-size: 18px; font-style: normal; font-variant-caps: normal; font=
-weight: normal; letter-spacing: normal; text-align: start; text-indent: 0p=
x; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-te=
xt-stroke-width: 0px; text-decoration: none;" class=3D""><span style=3D"car=
et-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 18px; font-style=
: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: n=
ormal; text-align: start; text-indent: 0px; text-transform: none; white-spa=
ce: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decorat=
ion: none; float: none; display: inline !important;" class=3D"">OS, then th=
ere's really little to no reason for them to want</span><br style=3D"caret-=
color: rgb(0, 0, 0); font-family: Helvetica; font-size: 18px; font-style: n=
ormal; font-variant-caps: normal; font-weight: normal; letter-spacing: norm=
al; text-align: start; text-indent: 0px; text-transform: none; white-space:=
 normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration=
: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 18px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; text-indent=
: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webki=
t-text-stroke-width: 0px; text-decoration: none; float: none; display: inli=
ne !important;" class=3D"">to connect to the QEMU VNC server, as viewing in=
itial bootup</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Hel=
vetica; font-size: 18px; font-style: normal; font-variant-caps: normal; fon=
t-weight: normal; letter-spacing: normal; text-align: start; text-indent: 0=
px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-t=
ext-stroke-width: 0px; text-decoration: none;" class=3D""><span style=3D"ca=
ret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 18px; font-styl=
e: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; white-sp=
ace: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decora=
tion: none; float: none; display: inline !important;" class=3D"">phase is n=
ot required in normal case. The only time such</span><br style=3D"caret-col=
or: rgb(0, 0, 0); font-family: Helvetica; font-size: 18px; font-style: norm=
al; font-variant-caps: normal; font-weight: normal; letter-spacing: normal;=
 text-align: start; text-indent: 0px; text-transform: none; white-space: no=
rmal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: n=
one;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: Hel=
vetica; font-size: 18px; font-style: normal; font-variant-caps: normal; fon=
t-weight: normal; letter-spacing: normal; text-align: start; text-indent: 0=
px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-t=
ext-stroke-width: 0px; text-decoration: none; float: none; display: inline =
!important;" class=3D"">people will need to use the QEMU VNC server is if t=
he guest</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helveti=
ca; font-size: 18px; font-style: normal; font-variant-caps: normal; font-we=
ight: normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-=
stroke-width: 0px; text-decoration: none;" class=3D""><span style=3D"caret-=
color: rgb(0, 0, 0); font-family: Helvetica; font-size: 18px; font-style: n=
ormal; font-variant-caps: normal; font-weight: normal; letter-spacing: norm=
al; text-align: start; text-indent: 0px; text-transform: none; white-space:=
 normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration=
: none; float: none; display: inline !important;" class=3D"">OS has broken =
in some way before it fully booted and thus failed</span><br style=3D"caret=
-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 18px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: nor=
mal; text-align: start; text-indent: 0px; text-transform: none; white-space=
: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoratio=
n: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family:=
 Helvetica; font-size: 18px; font-style: normal; font-variant-caps: normal;=
 font-weight: normal; letter-spacing: normal; text-align: start; text-inden=
t: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webk=
it-text-stroke-width: 0px; text-decoration: none; float: none; display: inl=
ine !important;" class=3D"">to start the guest VNC server. There is no gues=
t VNC server</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Hel=
vetica; font-size: 18px; font-style: normal; font-variant-caps: normal; fon=
t-weight: normal; letter-spacing: normal; text-align: start; text-indent: 0=
px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-t=
ext-stroke-width: 0px; text-decoration: none;" class=3D""><span style=3D"ca=
ret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 18px; font-styl=
e: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; white-sp=
ace: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decora=
tion: none; float: none; display: inline !important;" class=3D"">to hand of=
f to in this scenario.</span><br style=3D"caret-color: rgb(0, 0, 0); font-f=
amily: Helvetica; font-size: 18px; font-style: normal; font-variant-caps: n=
ormal; font-weight: normal; letter-spacing: normal; text-align: start; text=
-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px;=
 -webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""></div><=
/blockquote><div><br class=3D""></div>It's a matter of what you want to do =
with that qemu vnc.</div><div><br class=3D""></div><div>If it's only a back=
up when there's nothing in the guest to help,</div><div>then maybe trying t=
o support copy-paste is not a good idea.<br class=3D""><div><br class=3D"">=
</div><div>If it's a standard go-to access point for connecting to your</di=
v><div>guest, then making it smart is hard, but useful.</div><div><br class=
=3D""></div><blockquote type=3D"cite" class=3D""><div class=3D""><br style=
=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 18px; fon=
t-style: normal; font-variant-caps: normal; font-weight: normal; letter-spa=
cing: normal; text-align: start; text-indent: 0px; text-transform: none; wh=
ite-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-=
decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); fon=
t-family: Helvetica; font-size: 18px; font-style: normal; font-variant-caps=
: normal; font-weight: normal; letter-spacing: normal; text-align: start; t=
ext-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0=
px; -webkit-text-stroke-width: 0px; text-decoration: none; float: none; dis=
play: inline !important;" class=3D"">The value of the QEMU host side VNC se=
rver is that it works</span><br style=3D"caret-color: rgb(0, 0, 0); font-fa=
mily: Helvetica; font-size: 18px; font-style: normal; font-variant-caps: no=
rmal; font-weight: normal; letter-spacing: normal; text-align: start; text-=
indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span st=
yle=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 18px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; letter-=
spacing: normal; text-align: start; text-indent: 0px; text-transform: none;=
 white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; te=
xt-decoration: none; float: none; display: inline !important;" class=3D"">f=
or all possible guest OS, no matter whether they are running</span><br styl=
e=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 18px; fo=
nt-style: normal; font-variant-caps: normal; font-weight: normal; letter-sp=
acing: normal; text-align: start; text-indent: 0px; text-transform: none; w=
hite-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text=
-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); fo=
nt-family: Helvetica; font-size: 18px; font-style: normal; font-variant-cap=
s: normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; word-spacing: =
0px; -webkit-text-stroke-width: 0px; text-decoration: none; float: none; di=
splay: inline !important;" class=3D"">normally or broken, regardless of wha=
t the guest admin has</span><br style=3D"caret-color: rgb(0, 0, 0); font-fa=
mily: Helvetica; font-size: 18px; font-style: normal; font-variant-caps: no=
rmal; font-weight: normal; letter-spacing: normal; text-align: start; text-=
indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span st=
yle=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 18px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; letter-=
spacing: normal; text-align: start; text-indent: 0px; text-transform: none;=
 white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; te=
xt-decoration: none; float: none; display: inline !important;" class=3D"">c=
onfigured in terms of guest level remote desktop.</span><br style=3D"caret-=
color: rgb(0, 0, 0); font-family: Helvetica; font-size: 18px; font-style: n=
ormal; font-variant-caps: normal; font-weight: normal; letter-spacing: norm=
al; text-align: start; text-indent: 0px; text-transform: none; white-space:=
 normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration=
: none;" class=3D""></div></blockquote><div><br class=3D""></div><div>Under=
stood.</div><div><br class=3D""></div><div>The downside is that there are t=
hings it can't do. It cannot correctly</div><div>determine the keyboard map=
, because that's controlled in software</div><div>in the guest.</div><div><=
br class=3D""></div><div>Unless we para-virtualize the keyboard?</div><div>=
<br class=3D""></div><blockquote type=3D"cite" class=3D""><div class=3D""><=
br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 1=
8px; font-style: normal; font-variant-caps: normal; font-weight: normal; le=
tter-spacing: normal; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0,=
 0); font-family: Helvetica; font-size: 18px; font-style: normal; font-vari=
ant-caps: normal; font-weight: normal; letter-spacing: normal; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; word-sp=
acing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none; float: n=
one; display: inline !important;" class=3D"">IOW, if you have a guest remot=
e desktop solution you'll just</span><br style=3D"caret-color: rgb(0, 0, 0)=
; font-family: Helvetica; font-size: 18px; font-style: normal; font-variant=
-caps: normal; font-weight: normal; letter-spacing: normal; text-align: sta=
rt; text-indent: 0px; text-transform: none; white-space: normal; word-spaci=
ng: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""=
><span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-siz=
e: 18px; font-style: normal; font-variant-caps: normal; font-weight: normal=
; letter-spacing: normal; text-align: start; text-indent: 0px; text-transfo=
rm: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width=
: 0px; text-decoration: none; float: none; display: inline !important;" cla=
ss=3D"">use that 99% of the time. If you don't have that, then you'll</span=
><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size:=
 18px; font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; text-align: start; text-indent: 0px; text-transform=
: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: =
0px; text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, =
0, 0); font-family: Helvetica; font-size: 18px; font-style: normal; font-va=
riant-caps: normal; font-weight: normal; letter-spacing: normal; text-align=
: start; text-indent: 0px; text-transform: none; white-space: normal; word-=
spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none; float:=
 none; display: inline !important;" class=3D"">use QEMU VNC/SPICE server, a=
nd there won't be anything in the</span><br style=3D"caret-color: rgb(0, 0,=
 0); font-family: Helvetica; font-size: 18px; font-style: normal; font-vari=
ant-caps: normal; font-weight: normal; letter-spacing: normal; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; word-sp=
acing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;" class=
=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; fon=
t-size: 18px; font-style: normal; font-variant-caps: normal; font-weight: n=
ormal; letter-spacing: normal; text-align: start; text-indent: 0px; text-tr=
ansform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-=
width: 0px; text-decoration: none; float: none; display: inline !important;=
" class=3D"">guest for that to proxy to/from.</span><br style=3D"caret-colo=
r: rgb(0, 0, 0); font-family: Helvetica; font-size: 18px; font-style: norma=
l; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: nor=
mal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: no=
ne;" class=3D""></div></blockquote><div><br class=3D""></div><div>If really=
 the assumption is there is nothing in the guest to help</div><div>us, then=
 I'd say "paste" should come up with a warning "do you want</div><div>me to=
 try and translate that into keystrokes", and I don't see how to</div><div>=
implement copy from a graphical display without OCR=E2=80=A6</div><div><br =
class=3D""></div><div><br class=3D""></div><div>Cheers</div><div>Christophe=
</div><div><br class=3D""></div></div></body></html>
--Apple-Mail=_409A7FEA-59A1-4B26-8B47-7E30A71E670F--


