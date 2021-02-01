Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D72CD30AB4B
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 16:29:40 +0100 (CET)
Received: from localhost ([::1]:57256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6b91-0006Yk-U6
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 10:29:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cdupontd@redhat.com>)
 id 1l6b7P-0004yw-Fp
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 10:28:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cdupontd@redhat.com>)
 id 1l6b7K-0006Sy-Un
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 10:27:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612193272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+0ilT53hkZpySuFB+rwGxLMi9hVHWVmpfYC0UqC1vFI=;
 b=MfadR0CJylvnv8d1ASjkmDNq4+qtvN9QbxPkXOXYs4T4r2VBqJRskCtdVM2+2ZlJxSVjvK
 +wWQgS8cjsEX2nlcJ2IdzFD9g8wxcgpGXsqBa/w9ScREdy4qmY/Bx+dJojBsYVO7PnU71H
 CxRCwpdpgv8g1zgUbdlFadsc6HlBi8o=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336--i98PW7zMw6iD-Ucrq8xYQ-1; Mon, 01 Feb 2021 10:27:47 -0500
X-MC-Unique: -i98PW7zMw6iD-Ucrq8xYQ-1
Received: by mail-wm1-f70.google.com with SMTP id r13so801488wmq.9
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 07:27:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=txJeRMsHhQRGpcSbMyTjj6TxuH17zGi6S/lK4IEkkXs=;
 b=mdItSZurqUmsx7fjkfS05zyahbSLYebxVd5PfYZA+kCFIb/M5uDn8r1uiF7wzUCKtu
 Fpp2MSyMoqOk1BYG0GNDtTWMn8mOdr/YeYJUqeNQvOcEpKbV/0fvXC2V6C90E0K1KLzz
 X34yShcIzPNJSzLjtdcwq5txaYjcpMFTzOey2xDBm9J1wrWz5Cx2ucv394HKwxVlOH3k
 DakYvilwR4Y0Ag0pPXs1rRNsDLUzDFGJ8r1GV1soMA3B7VhA4PYL7jPUuPwlzuzGvkpq
 rs2z5q21xIC/SUgqhpnNDefRYC24TWtYZRmoqpYmeDrwuQrimyWJInw23b/Z1KgYcic+
 Il7Q==
X-Gm-Message-State: AOAM531mXeXR4l6yH1VKItLOmzn89jdY68kFl09QW6IHiyDUQz7kukZO
 nCllRSOde+9RV3DyKCOYbZb01Ndm1M+uP1ZAAXQ6X5khKgPZ8WhzGimXynrf9T3ovXbmUkbw9Cg
 pJiOb0zF8oC4/8Cw=
X-Received: by 2002:a5d:5502:: with SMTP id b2mr18840563wrv.245.1612193266005; 
 Mon, 01 Feb 2021 07:27:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwJWWWzzhrzhYwSezkd+J0BeEHhA6cHmxpZ7VZX0FXUzE2nYqWhH6mS7OIX+gSANuw/M7H8VQ==
X-Received: by 2002:a5d:5502:: with SMTP id b2mr18840540wrv.245.1612193265725; 
 Mon, 01 Feb 2021 07:27:45 -0800 (PST)
Received: from ?IPv6:2a01:e0a:466:71c0:4dc8:c97f:f933:8921?
 ([2a01:e0a:466:71c0:4dc8:c97f:f933:8921])
 by smtp.gmail.com with ESMTPSA id n9sm27574326wrq.41.2021.02.01.07.27.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 01 Feb 2021 07:27:44 -0800 (PST)
From: Christophe de Dinechin <cdupontd@redhat.com>
Message-Id: <05C58667-D9BA-49E2-897D-2286B243E802@redhat.com>
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: vnc clipboard support
Date: Mon, 1 Feb 2021 16:27:43 +0100
In-Reply-To: <20210129143252.GE4008275@redhat.com>
To: =?utf-8?B?IkRhbmllbCBQLiBCZXJyYW5nw6ki?= <berrange@redhat.com>
References: <20210128171224.exbklnwtyb232oe2@sirius.home.kraxel.org>
 <C26A91E6-A5AE-4258-A470-91B6B5BC7C7F@redhat.com>
 <20210129080323.xuvokq5kytoomx6j@sirius.home.kraxel.org>
 <8E05F8C9-A60D-45A9-AFCB-79D866F57660@redhat.com>
 <20210129110814.GF4001740@redhat.com>
 <0F802343-19F8-487C-8BBE-5BBE2014BA1C@redhat.com>
 <20210129143252.GE4008275@redhat.com>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cdupontd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_C6BA6564-9519-4CFA-90F1-B945BD456A65"
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

--Apple-Mail=_C6BA6564-9519-4CFA-90F1-B945BD456A65
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On 29 Jan 2021, at 15:32, Daniel P. Berrang=C3=A9 <berrange@redhat.com> w=
rote:
>=20
> On Fri, Jan 29, 2021 at 03:19:45PM +0100, Christophe de Dinechin wrote:
>>=20
>>=20
>>> On 29 Jan 2021, at 12:08, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
>>>=20
>>> On Fri, Jan 29, 2021 at 11:50:10AM +0100, Christophe de Dinechin wrote:
>>>>=20
>>>>=20
>>>>> On 29 Jan 2021, at 09:03, Gerd Hoffmann <kraxel@redhat.com> wrote:
>>>>>=20
>>>>> Hi,
>>>>>=20
>>>>>>> (1) Have some guest agent (spice does it that way).
>>>>>>>   Advantage: more flexible, allows more features.
>>>>>>>   Disadvantage: requires agent in the guest.
>>>>>>=20
>>>>>> What about running the option to relay data to a VNC server in the
>>>>>> guest if there is one running? In other words, using an existing
>>>>>> VNC server as an agent, with the option of having a stripped-down,
>>>>>> clipboard only VNC server as a later optimization.
>>>>>=20
>>>>> Well, if you run Xvnc in the guest anyway why use the qemu vnc server
>>>>> in the first place?
>>>>=20
>>>> I assume that if you use the qemu VNC, it's because you you don't want=
 to
>>>> run Xvnc on some external network, or care about accessing the guest
>>>> before Xvnc can be launched. There can be many reasons.
>>>>=20
>>>> Again, I want to make it clear that my suggestion is _not_ simply to a=
ccess
>>>> the existing Xvnc as is, but rather to stick with some VNC server code=
 to handle
>>>> the clipboard if / when possible.
>>>>=20
>>>> Let me try to imagine a scenario, where I'll use a macOS guest intenti=
onally
>>>> to clarify what I was thinking about.
>>>>=20
>>>> - During early boot, there is no in-guest VNC server, so to address th=
at,
>>>> you connect to the qemu VNC. At this stage, all screen refresh is hand=
led
>>>> by the qemu VNC, and the best you can do if you want to support any
>>>> kind of copy-paste is to convert it to virtual keystrokes. The same wo=
uld
>>>> be true for Linux on a text console.
>>>>=20
>>>> - Then comes up you macOS guest, and it still has no VNC port open,
>>>> so you are stuck with qemu-vnc doing all the work. But now you can
>>>> enable screen sharing, and that launches the Apple-maintained macOS
>>>> VNC server.
>>>>=20
>>>> - Let's assume for illustration that this listens on some private netw=
ork
>>>> that qemu can access, but that is not visible externally. In this case=
,
>>>> you could not VNC to the guest, but you can still VNC to qemu.
>>>>=20
>>>> - What I'm suggesting is that qemu-vnc could then switch to simply
>>>> relaying VNC traffic to that in-guest server. You'd get the smart upda=
te
>>>> algorithm that Apple has put in place to deal with transparency and th=
e
>>>> like, as well as a level of guest OS integration that would otherwise =
be
>>>> much harder to replicate.
>>>=20
>>> IMHO that's an awful lot of complexity to add to the system
>>> that isn't especially useful and this opens up new attack
>>> vectors for the guest to exploit the host.
>>>=20
>>> If people have VNC/RDP/whatever configured inside their guest
>>> OS, then there's really little to no reason for them to want
>>> to connect to the QEMU VNC server, as viewing initial bootup
>>> phase is not required in normal case. The only time such
>>> people will need to use the QEMU VNC server is if the guest
>>> OS has broken in some way before it fully booted and thus failed
>>> to start the guest VNC server. There is no guest VNC server
>>> to hand off to in this scenario.
>>=20
>> It's a matter of what you want to do with that qemu vnc.
>>=20
>> If it's only a backup when there's nothing in the guest to help,
>> then maybe trying to support copy-paste is not a good idea.
>>=20
>> If it's a standard go-to access point for connecting to your
>> guest, then making it smart is hard, but useful.
>>=20
>>>=20
>>> The value of the QEMU host side VNC server is that it works
>>> for all possible guest OS, no matter whether they are running
>>> normally or broken, regardless of what the guest admin has
>>> configured in terms of guest level remote desktop.
>>=20
>> Understood.
>>=20
>> The downside is that there are things it can't do. It cannot correctly
>> determine the keyboard map, because that's controlled in software
>> in the guest.
>=20
> There is no need for the remote desktop server to care about the
> keymap. The remote client takes scancodes and passes them to the
> server, which then passes them to the guest.

Aren't we talking about pasting clipboard data here?
I assume that clipboard data is not encoded as scancodes.


>=20
> The person connected to the remote server simply has to configure
> their guest OS keymap to match the physical keyboard they currently
> have plugged in.
>=20
> The only reason a remote server would need to know the keymap is
> if it was trying to translate from keycodes back into scancodes.
> This is what VNC protocol had to do originally, but VNC was since
> extended to pass raw scancodes instead of keycodes, precisely to
> avoid needing to care about keymaps.
>=20
>>> IOW, if you have a guest remote desktop solution you'll just
>>> use that 99% of the time. If you don't have that, then you'll
>>> use QEMU VNC/SPICE server, and there won't be anything in the
>>> guest for that to proxy to/from.
>>=20
>> If really the assumption is there is nothing in the guest to help
>> us, then I'd say "paste" should come up with a warning "do you want
>> me to try and translate that into keystrokes", and I don't see how to
>> implement copy from a graphical display without OCR=E2=80=A6
>=20
> I'm not saying we can't use stuff in the guest, just that we should be
> pragmatic about what we interact with in the guest and degrade nicely.
> I don't think that proxying from a host VNC server to a guest VNC server
> is sensible, but making use of a guest agent of some kind is not
> unreasonable, especially if we can use one that already exists.
>=20
>=20
> Regards,
> Daniel
> --=20
> |: https://berrange.com <https://berrange.com/>      -o-    https://www.f=
lickr.com/photos/dberrange <https://www.flickr.com/photos/dberrange> :|
> |: https://libvirt.org <https://libvirt.org/>         -o-            http=
s://fstop138.berrange.com <https://fstop138.berrange.com/> :|
> |: https://entangle-photo.org <https://entangle-photo.org/>    -o-    htt=
ps://www.instagram.com/dberrange <https://www.instagram.com/dberrange> :|


--Apple-Mail=_C6BA6564-9519-4CFA-90F1-B945BD456A65
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=3Dutf-8"></head><body style=3D"word-wrap: break-word; -webkit-nbsp-mode: s=
pace; line-break: after-white-space;" class=3D""><br class=3D""><div><br cl=
ass=3D""><blockquote type=3D"cite" class=3D""><div class=3D"">On 29 Jan 202=
1, at 15:32, Daniel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.=
com" class=3D"">berrange@redhat.com</a>&gt; wrote:</div><br class=3D"Apple-=
interchange-newline"><div class=3D""><meta charset=3D"UTF-8" class=3D""><sp=
an style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 1=
8px; font-style: normal; font-variant-caps: normal; font-weight: normal; le=
tter-spacing: normal; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; text-decoration: none; float: none; display: inline !important;" class=
=3D"">On Fri, Jan 29, 2021 at 03:19:45PM +0100, Christophe de Dinechin wrot=
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
 at 12:08, Daniel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.co=
m" class=3D"">berrange@redhat.com</a>&gt; wrote:<br class=3D""><br class=3D=
"">On Fri, Jan 29, 2021 at 11:50:10AM +0100, Christophe de Dinechin wrote:<=
br class=3D""><blockquote type=3D"cite" class=3D""><br class=3D""><br class=
=3D""><blockquote type=3D"cite" class=3D"">On 29 Jan 2021, at 09:03, Gerd H=
offmann &lt;<a href=3D"mailto:kraxel@redhat.com" class=3D"">kraxel@redhat.c=
om</a>&gt; wrote:<br class=3D""><br class=3D"">Hi,<br class=3D""><br class=
=3D""><blockquote type=3D"cite" class=3D""><blockquote type=3D"cite" class=
=3D"">(1) Have some guest agent (spice does it that way).<br class=3D"">&nb=
sp;&nbsp;Advantage: more flexible, allows more features.<br class=3D"">&nbs=
p;&nbsp;Disadvantage: requires agent in the guest.<br class=3D""></blockquo=
te><br class=3D"">What about running the option to relay data to a VNC serv=
er in the<br class=3D"">guest if there is one running? In other words, usin=
g an existing<br class=3D"">VNC server as an agent, with the option of havi=
ng a stripped-down,<br class=3D"">clipboard only VNC server as a later opti=
mization.<br class=3D""></blockquote><br class=3D"">Well, if you run Xvnc i=
n the guest anyway why use the qemu vnc server<br class=3D"">in the first p=
lace?<br class=3D""></blockquote><br class=3D"">I assume that if you use th=
e qemu VNC, it's because you you don't want to<br class=3D"">run Xvnc on so=
me external network, or care about accessing the guest<br class=3D"">before=
 Xvnc can be launched. There can be many reasons.<br class=3D""><br class=
=3D"">Again, I want to make it clear that my suggestion is _not_ simply to =
access<br class=3D"">the existing Xvnc as is, but rather to stick with some=
 VNC server code to handle<br class=3D"">the clipboard if / when possible.<=
br class=3D""><br class=3D"">Let me try to imagine a scenario, where I'll u=
se a macOS guest intentionally<br class=3D"">to clarify what I was thinking=
 about.<br class=3D""><br class=3D"">- During early boot, there is no in-gu=
est VNC server, so to address that,<br class=3D"">you connect to the qemu V=
NC. At this stage, all screen refresh is handled<br class=3D"">by the qemu =
VNC, and the best you can do if you want to support any<br class=3D"">kind =
of copy-paste is to convert it to virtual keystrokes. The same would<br cla=
ss=3D"">be true for Linux on a text console.<br class=3D""><br class=3D"">-=
 Then comes up you macOS guest, and it still has no VNC port open,<br class=
=3D"">so you are stuck with qemu-vnc doing all the work. But now you can<br=
 class=3D"">enable screen sharing, and that launches the Apple-maintained m=
acOS<br class=3D"">VNC server.<br class=3D""><br class=3D"">- Let's assume =
for illustration that this listens on some private network<br class=3D"">th=
at qemu can access, but that is not visible externally. In this case,<br cl=
ass=3D"">you could not VNC to the guest, but you can still VNC to qemu.<br =
class=3D""><br class=3D"">- What I'm suggesting is that qemu-vnc could then=
 switch to simply<br class=3D"">relaying VNC traffic to that in-guest serve=
r. You'd get the smart update<br class=3D"">algorithm that Apple has put in=
 place to deal with transparency and the<br class=3D"">like, as well as a l=
evel of guest OS integration that would otherwise be<br class=3D"">much har=
der to replicate.<br class=3D""></blockquote><br class=3D"">IMHO that's an =
awful lot of complexity to add to the system<br class=3D"">that isn't espec=
ially useful and this opens up new attack<br class=3D"">vectors for the gue=
st to exploit the host.<br class=3D""><br class=3D"">If people have VNC/RDP=
/whatever configured inside their guest<br class=3D"">OS, then there's real=
ly little to no reason for them to want<br class=3D"">to connect to the QEM=
U VNC server, as viewing initial bootup<br class=3D"">phase is not required=
 in normal case. The only time such<br class=3D"">people will need to use t=
he QEMU VNC server is if the guest<br class=3D"">OS has broken in some way =
before it fully booted and thus failed<br class=3D"">to start the guest VNC=
 server. There is no guest VNC server<br class=3D"">to hand off to in this =
scenario.<br class=3D""></blockquote><br class=3D"">It's a matter of what y=
ou want to do with that qemu vnc.<br class=3D""><br class=3D"">If it's only=
 a backup when there's nothing in the guest to help,<br class=3D"">then may=
be trying to support copy-paste is not a good idea.<br class=3D""><br class=
=3D"">If it's a standard go-to access point for connecting to your<br class=
=3D"">guest, then making it smart is hard, but useful.<br class=3D""><br cl=
ass=3D""><blockquote type=3D"cite" class=3D""><br class=3D"">The value of t=
he QEMU host side VNC server is that it works<br class=3D"">for all possibl=
e guest OS, no matter whether they are running<br class=3D"">normally or br=
oken, regardless of what the guest admin has<br class=3D"">configured in te=
rms of guest level remote desktop.<br class=3D""></blockquote><br class=3D"=
">Understood.<br class=3D""><br class=3D"">The downside is that there are t=
hings it can't do. It cannot correctly<br class=3D"">determine the keyboard=
 map, because that's controlled in software<br class=3D"">in the guest.<br =
class=3D""></blockquote><br style=3D"caret-color: rgb(0, 0, 0); font-family=
: Helvetica; font-size: 18px; font-style: normal; font-variant-caps: normal=
; font-weight: normal; letter-spacing: normal; text-align: start; text-inde=
nt: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -web=
kit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span style=
=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 18px; fon=
t-style: normal; font-variant-caps: normal; font-weight: normal; letter-spa=
cing: normal; text-align: start; text-indent: 0px; text-transform: none; wh=
ite-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-=
decoration: none; float: none; display: inline !important;" class=3D"">Ther=
e is no need for the remote desktop server to care about the</span><br styl=
e=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 18px; fo=
nt-style: normal; font-variant-caps: normal; font-weight: normal; letter-sp=
acing: normal; text-align: start; text-indent: 0px; text-transform: none; w=
hite-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text=
-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); fo=
nt-family: Helvetica; font-size: 18px; font-style: normal; font-variant-cap=
s: normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; word-spacing: =
0px; -webkit-text-stroke-width: 0px; text-decoration: none; float: none; di=
splay: inline !important;" class=3D"">keymap. The remote client takes scanc=
odes and passes them to the</span><br style=3D"caret-color: rgb(0, 0, 0); f=
ont-family: Helvetica; font-size: 18px; font-style: normal; font-variant-ca=
ps: normal; font-weight: normal; letter-spacing: normal; text-align: start;=
 text-indent: 0px; text-transform: none; white-space: normal; word-spacing:=
 0px; -webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><s=
pan style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
18px; font-style: normal; font-variant-caps: normal; font-weight: normal; l=
etter-spacing: normal; text-align: start; text-indent: 0px; text-transform:=
 none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0=
px; text-decoration: none; float: none; display: inline !important;" class=
=3D"">server, which then passes them to the guest.</span><br style=3D"caret=
-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 18px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: nor=
mal; text-align: start; text-indent: 0px; text-transform: none; white-space=
: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoratio=
n: none;" class=3D""></div></blockquote><div><br class=3D""></div><div>Aren=
't we talking about pasting clipboard data here?</div><div>I assume that cl=
ipboard data is not encoded as scancodes.</div><div><br class=3D""></div><d=
iv><br class=3D""></div><blockquote type=3D"cite" class=3D""><div class=3D"=
"><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 18px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0,=
 0, 0); font-family: Helvetica; font-size: 18px; font-style: normal; font-v=
ariant-caps: normal; font-weight: normal; letter-spacing: normal; text-alig=
n: start; text-indent: 0px; text-transform: none; white-space: normal; word=
-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none; float=
: none; display: inline !important;" class=3D"">The person connected to the=
 remote server simply has to configure</span><br style=3D"caret-color: rgb(=
0, 0, 0); font-family: Helvetica; font-size: 18px; font-style: normal; font=
-variant-caps: normal; font-weight: normal; letter-spacing: normal; text-al=
ign: start; text-indent: 0px; text-transform: none; white-space: normal; wo=
rd-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;" cl=
ass=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; =
font-size: 18px; font-style: normal; font-variant-caps: normal; font-weight=
: normal; letter-spacing: normal; text-align: start; text-indent: 0px; text=
-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-stro=
ke-width: 0px; text-decoration: none; float: none; display: inline !importa=
nt;" class=3D"">their guest OS keymap to match the physical keyboard they c=
urrently</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helveti=
ca; font-size: 18px; font-style: normal; font-variant-caps: normal; font-we=
ight: normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-=
stroke-width: 0px; text-decoration: none;" class=3D""><span style=3D"caret-=
color: rgb(0, 0, 0); font-family: Helvetica; font-size: 18px; font-style: n=
ormal; font-variant-caps: normal; font-weight: normal; letter-spacing: norm=
al; text-align: start; text-indent: 0px; text-transform: none; white-space:=
 normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration=
: none; float: none; display: inline !important;" class=3D"">have plugged i=
n.</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; fo=
nt-size: 18px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; text-t=
ransform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke=
-width: 0px; text-decoration: none;" class=3D""><br style=3D"caret-color: r=
gb(0, 0, 0); font-family: Helvetica; font-size: 18px; font-style: normal; f=
ont-variant-caps: normal; font-weight: normal; letter-spacing: normal; text=
-align: start; text-indent: 0px; text-transform: none; white-space: normal;=
 word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;"=
 class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetic=
a; font-size: 18px; font-style: normal; font-variant-caps: normal; font-wei=
ght: normal; letter-spacing: normal; text-align: start; text-indent: 0px; t=
ext-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-s=
troke-width: 0px; text-decoration: none; float: none; display: inline !impo=
rtant;" class=3D"">The only reason a remote server would need to know the k=
eymap is</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helveti=
ca; font-size: 18px; font-style: normal; font-variant-caps: normal; font-we=
ight: normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-=
stroke-width: 0px; text-decoration: none;" class=3D""><span style=3D"caret-=
color: rgb(0, 0, 0); font-family: Helvetica; font-size: 18px; font-style: n=
ormal; font-variant-caps: normal; font-weight: normal; letter-spacing: norm=
al; text-align: start; text-indent: 0px; text-transform: none; white-space:=
 normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration=
: none; float: none; display: inline !important;" class=3D"">if it was tryi=
ng to translate from keycodes back into scancodes.</span><br style=3D"caret=
-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 18px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: nor=
mal; text-align: start; text-indent: 0px; text-transform: none; white-space=
: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoratio=
n: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family:=
 Helvetica; font-size: 18px; font-style: normal; font-variant-caps: normal;=
 font-weight: normal; letter-spacing: normal; text-align: start; text-inden=
t: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webk=
it-text-stroke-width: 0px; text-decoration: none; float: none; display: inl=
ine !important;" class=3D"">This is what VNC protocol had to do originally,=
 but VNC was since</span><br style=3D"caret-color: rgb(0, 0, 0); font-famil=
y: Helvetica; font-size: 18px; font-style: normal; font-variant-caps: norma=
l; font-weight: normal; letter-spacing: normal; text-align: start; text-ind=
ent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span style=
=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 18px; fon=
t-style: normal; font-variant-caps: normal; font-weight: normal; letter-spa=
cing: normal; text-align: start; text-indent: 0px; text-transform: none; wh=
ite-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-=
decoration: none; float: none; display: inline !important;" class=3D"">exte=
nded to pass raw scancodes instead of keycodes, precisely to</span><br styl=
e=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 18px; fo=
nt-style: normal; font-variant-caps: normal; font-weight: normal; letter-sp=
acing: normal; text-align: start; text-indent: 0px; text-transform: none; w=
hite-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text=
-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); fo=
nt-family: Helvetica; font-size: 18px; font-style: normal; font-variant-cap=
s: normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; word-spacing: =
0px; -webkit-text-stroke-width: 0px; text-decoration: none; float: none; di=
splay: inline !important;" class=3D"">avoid needing to care about keymaps.<=
/span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-=
size: 18px; font-style: normal; font-variant-caps: normal; font-weight: nor=
mal; letter-spacing: normal; text-align: start; text-indent: 0px; text-tran=
sform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-wi=
dth: 0px; text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(=
0, 0, 0); font-family: Helvetica; font-size: 18px; font-style: normal; font=
-variant-caps: normal; font-weight: normal; letter-spacing: normal; text-al=
ign: start; text-indent: 0px; text-transform: none; white-space: normal; wo=
rd-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;" cl=
ass=3D""><blockquote type=3D"cite" style=3D"font-family: Helvetica; font-si=
ze: 18px; font-style: normal; font-variant-caps: normal; font-weight: norma=
l; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0=
px; text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-d=
ecoration: none;" class=3D""><blockquote type=3D"cite" class=3D"">IOW, if y=
ou have a guest remote desktop solution you'll just<br class=3D"">use that =
99% of the time. If you don't have that, then you'll<br class=3D"">use QEMU=
 VNC/SPICE server, and there won't be anything in the<br class=3D"">guest f=
or that to proxy to/from.<br class=3D""></blockquote><br class=3D"">If real=
ly the assumption is there is nothing in the guest to help<br class=3D"">us=
, then I'd say "paste" should come up with a warning "do you want<br class=
=3D"">me to try and translate that into keystrokes", and I don't see how to=
<br class=3D"">implement copy from a graphical display without OCR=E2=80=A6=
<br class=3D""></blockquote><br style=3D"caret-color: rgb(0, 0, 0); font-fa=
mily: Helvetica; font-size: 18px; font-style: normal; font-variant-caps: no=
rmal; font-weight: normal; letter-spacing: normal; text-align: start; text-=
indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span st=
yle=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 18px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; letter-=
spacing: normal; text-align: start; text-indent: 0px; text-transform: none;=
 white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; te=
xt-decoration: none; float: none; display: inline !important;" class=3D"">I=
'm not saying we can't use stuff in the guest, just that we should be</span=
><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size:=
 18px; font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; text-align: start; text-indent: 0px; text-transform=
: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: =
0px; text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, =
0, 0); font-family: Helvetica; font-size: 18px; font-style: normal; font-va=
riant-caps: normal; font-weight: normal; letter-spacing: normal; text-align=
: start; text-indent: 0px; text-transform: none; white-space: normal; word-=
spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none; float:=
 none; display: inline !important;" class=3D"">pragmatic about what we inte=
ract with in the guest and degrade nicely.</span><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 18px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; tex=
t-align: start; text-indent: 0px; text-transform: none; white-space: normal=
; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;=
" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: Helveti=
ca; font-size: 18px; font-style: normal; font-variant-caps: normal; font-we=
ight: normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-=
stroke-width: 0px; text-decoration: none; float: none; display: inline !imp=
ortant;" class=3D"">I don't think that proxying from a host VNC server to a=
 guest VNC server</span><br style=3D"caret-color: rgb(0, 0, 0); font-family=
: Helvetica; font-size: 18px; font-style: normal; font-variant-caps: normal=
; font-weight: normal; letter-spacing: normal; text-align: start; text-inde=
nt: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -web=
kit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span style=
=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 18px; fon=
t-style: normal; font-variant-caps: normal; font-weight: normal; letter-spa=
cing: normal; text-align: start; text-indent: 0px; text-transform: none; wh=
ite-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-=
decoration: none; float: none; display: inline !important;" class=3D"">is s=
ensible, but making use of a guest agent of some kind is not</span><br styl=
e=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 18px; fo=
nt-style: normal; font-variant-caps: normal; font-weight: normal; letter-sp=
acing: normal; text-align: start; text-indent: 0px; text-transform: none; w=
hite-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text=
-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); fo=
nt-family: Helvetica; font-size: 18px; font-style: normal; font-variant-cap=
s: normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; word-spacing: =
0px; -webkit-text-stroke-width: 0px; text-decoration: none; float: none; di=
splay: inline !important;" class=3D"">unreasonable, especially if we can us=
e one that already exists.</span><br style=3D"caret-color: rgb(0, 0, 0); fo=
nt-family: Helvetica; font-size: 18px; font-style: normal; font-variant-cap=
s: normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; word-spacing: =
0px; -webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><br=
 style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 18p=
x; font-style: normal; font-variant-caps: normal; font-weight: normal; lett=
er-spacing: normal; text-align: start; text-indent: 0px; text-transform: no=
ne; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;=
 text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, 0);=
 font-family: Helvetica; font-size: 18px; font-style: normal; font-variant-=
caps: normal; font-weight: normal; letter-spacing: normal; text-align: star=
t; text-indent: 0px; text-transform: none; white-space: normal; word-spacin=
g: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">=
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 18px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">Regards,</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 18px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; text-indent=
: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webki=
t-text-stroke-width: 0px; text-decoration: none;" class=3D""><span style=3D=
"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 18px; font-s=
tyle: normal; font-variant-caps: normal; font-weight: normal; letter-spacin=
g: normal; text-align: start; text-indent: 0px; text-transform: none; white=
-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-dec=
oration: none; float: none; display: inline !important;" class=3D"">Daniel<=
/span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-=
size: 18px; font-style: normal; font-variant-caps: normal; font-weight: nor=
mal; letter-spacing: normal; text-align: start; text-indent: 0px; text-tran=
sform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-wi=
dth: 0px; text-decoration: none;" class=3D""><span style=3D"caret-color: rg=
b(0, 0, 0); font-family: Helvetica; font-size: 18px; font-style: normal; fo=
nt-variant-caps: normal; font-weight: normal; letter-spacing: normal; text-=
align: start; text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none; f=
loat: none; display: inline !important;" class=3D"">--<span class=3D"Apple-=
converted-space">&nbsp;</span></span><br style=3D"caret-color: rgb(0, 0, 0)=
; font-family: Helvetica; font-size: 18px; font-style: normal; font-variant=
-caps: normal; font-weight: normal; letter-spacing: normal; text-align: sta=
rt; text-indent: 0px; text-transform: none; white-space: normal; word-spaci=
ng: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""=
><span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-siz=
e: 18px; font-style: normal; font-variant-caps: normal; font-weight: normal=
; letter-spacing: normal; text-align: start; text-indent: 0px; text-transfo=
rm: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width=
: 0px; text-decoration: none; float: none; display: inline !important;" cla=
ss=3D"">|:<span class=3D"Apple-converted-space">&nbsp;</span></span><a href=
=3D"https://berrange.com/" style=3D"font-family: Helvetica; font-size: 18px=
; font-style: normal; font-variant-caps: normal; font-weight: normal; lette=
r-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text=
-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -we=
bkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;" class=3D"">ht=
tps://berrange.com</a><span style=3D"caret-color: rgb(0, 0, 0); font-family=
: Helvetica; font-size: 18px; font-style: normal; font-variant-caps: normal=
; font-weight: normal; letter-spacing: normal; text-align: start; text-inde=
nt: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -web=
kit-text-stroke-width: 0px; text-decoration: none; float: none; display: in=
line !important;" class=3D""><span class=3D"Apple-converted-space">&nbsp;</=
span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-o- &nbsp;&nbsp;&nbsp;</span><a href=3D"=
https://www.flickr.com/photos/dberrange" style=3D"font-family: Helvetica; f=
ont-size: 18px; font-style: normal; font-variant-caps: normal; font-weight:=
 normal; letter-spacing: normal; orphans: auto; text-align: start; text-ind=
ent: 0px; text-transform: none; white-space: normal; widows: auto; word-spa=
cing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;"=
 class=3D"">https://www.flickr.com/photos/dberrange</a><span style=3D"caret=
-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 18px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: nor=
mal; text-align: start; text-indent: 0px; text-transform: none; white-space=
: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoratio=
n: none; float: none; display: inline !important;" class=3D""><span class=
=3D"Apple-converted-space">&nbsp;</span>:|</span><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 18px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; tex=
t-align: start; text-indent: 0px; text-transform: none; white-space: normal=
; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;=
" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: Helveti=
ca; font-size: 18px; font-style: normal; font-variant-caps: normal; font-we=
ight: normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-=
stroke-width: 0px; text-decoration: none; float: none; display: inline !imp=
ortant;" class=3D"">|:<span class=3D"Apple-converted-space">&nbsp;</span></=
span><a href=3D"https://libvirt.org/" style=3D"font-family: Helvetica; font=
-size: 18px; font-style: normal; font-variant-caps: normal; font-weight: no=
rmal; letter-spacing: normal; orphans: auto; text-align: start; text-indent=
: 0px; text-transform: none; white-space: normal; widows: auto; word-spacin=
g: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;" cl=
ass=3D"">https://libvirt.org</a><span style=3D"caret-color: rgb(0, 0, 0); f=
ont-family: Helvetica; font-size: 18px; font-style: normal; font-variant-ca=
ps: normal; font-weight: normal; letter-spacing: normal; text-align: start;=
 text-indent: 0px; text-transform: none; white-space: normal; word-spacing:=
 0px; -webkit-text-stroke-width: 0px; text-decoration: none; float: none; d=
isplay: inline !important;" class=3D""><span class=3D"Apple-converted-space=
">&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-o- &nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><a href=3D=
"https://fstop138.berrange.com/" style=3D"font-family: Helvetica; font-size=
: 18px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px=
; text-transform: none; white-space: normal; widows: auto; word-spacing: 0p=
x; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;" class=
=3D"">https://fstop138.berrange.com</a><span style=3D"caret-color: rgb(0, 0=
, 0); font-family: Helvetica; font-size: 18px; font-style: normal; font-var=
iant-caps: normal; font-weight: normal; letter-spacing: normal; text-align:=
 start; text-indent: 0px; text-transform: none; white-space: normal; word-s=
pacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none; float: =
none; display: inline !important;" class=3D""><span class=3D"Apple-converte=
d-space">&nbsp;</span>:|</span><br style=3D"caret-color: rgb(0, 0, 0); font=
-family: Helvetica; font-size: 18px; font-style: normal; font-variant-caps:=
 normal; font-weight: normal; letter-spacing: normal; text-align: start; te=
xt-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0p=
x; -webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span=
 style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 18p=
x; font-style: normal; font-variant-caps: normal; font-weight: normal; lett=
er-spacing: normal; text-align: start; text-indent: 0px; text-transform: no=
ne; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;=
 text-decoration: none; float: none; display: inline !important;" class=3D"=
">|:<span class=3D"Apple-converted-space">&nbsp;</span></span><a href=3D"ht=
tps://entangle-photo.org/" style=3D"font-family: Helvetica; font-size: 18px=
; font-style: normal; font-variant-caps: normal; font-weight: normal; lette=
r-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text=
-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -we=
bkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;" class=3D"">ht=
tps://entangle-photo.org</a><span style=3D"caret-color: rgb(0, 0, 0); font-=
family: Helvetica; font-size: 18px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; tex=
t-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px=
; -webkit-text-stroke-width: 0px; text-decoration: none; float: none; displ=
ay: inline !important;" class=3D""><span class=3D"Apple-converted-space">&n=
bsp;</span>&nbsp;&nbsp;&nbsp;-o- &nbsp;&nbsp;&nbsp;</span><a href=3D"https:=
//www.instagram.com/dberrange" style=3D"font-family: Helvetica; font-size: =
18px; font-style: normal; font-variant-caps: normal; font-weight: normal; l=
etter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: 0px;=
 -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;" class=3D"=
">https://www.instagram.com/dberrange</a><span style=3D"caret-color: rgb(0,=
 0, 0); font-family: Helvetica; font-size: 18px; font-style: normal; font-v=
ariant-caps: normal; font-weight: normal; letter-spacing: normal; text-alig=
n: start; text-indent: 0px; text-transform: none; white-space: normal; word=
-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none; float=
: none; display: inline !important;" class=3D""><span class=3D"Apple-conver=
ted-space">&nbsp;</span>:|</span></div></blockquote></div><br class=3D""></=
body></html>
--Apple-Mail=_C6BA6564-9519-4CFA-90F1-B945BD456A65--


