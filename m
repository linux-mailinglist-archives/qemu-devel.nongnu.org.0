Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF1B30ADF4
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 18:34:15 +0100 (CET)
Received: from localhost ([::1]:40954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6d5a-0008OE-1p
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 12:34:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cdupontd@redhat.com>)
 id 1l6d0O-0004q2-Ac
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 12:28:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cdupontd@redhat.com>)
 id 1l6d0J-00052q-7n
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 12:28:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612200525;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kLfNp6/58IDLJ+bvgG9yKxxxaihANnEF+4JgBd54F8A=;
 b=DUVTAm/SA3xJoCZkjvYk9tZuwlJjw3KEF0zDmvjsSHUWKnQWobWSSxb9WV+b5dF5FiidoF
 9+1ZI7QXamQQ2UM7Bz4X1C2rE/TSxtV15d6FgPBpLdrCTZKiUxwvMnwXlUjFrqIRk2xV0+
 gclWjXQJUBr+gRKnxHV5IInTDpRkabI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-208-iYkMJG5WPlCGXA9x26T7ZQ-1; Mon, 01 Feb 2021 12:28:42 -0500
X-MC-Unique: iYkMJG5WPlCGXA9x26T7ZQ-1
Received: by mail-wr1-f71.google.com with SMTP id c1so10797865wrx.2
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 09:28:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=JN0K2LmBx5uuJrto1NGImDllyoawcSJTkE3K8eYqF8w=;
 b=CMRQAkiK55k0JgIPuY9HKcpqPv6e+3lkGBWdXVI3ZrI9StHBfDIYy0q7MPPucIPh/A
 3HzvOGFpPTpLeGli8atAhGgnvAMOVzbniPi4Fs7uz1/4/c7PVlEhWh5nbeNeLrlQ38W9
 45dK0+zLZ7bkYrAMdlNjbOyD2kIPPCDccVo/eXEUYhRm8PgFcUyom/fYNgfzPjg5kVRj
 iVCR4gliPT4l/SY7RegT2aPeDoPqJPOMtEjIHLRpJrlFWm4rhOl+j1TfMJRp8K2zNt/u
 Mm7OgsuiHpDHlAXADnTU4xbDKLEo+rP6FR6gON7+XfOKrUDCovGIPRfz6kOwcejTUxFs
 P6pw==
X-Gm-Message-State: AOAM530eJqvIb9IELERttCGPayUx3zdFnP4GiLRt66Pa4XCY4UilzyHg
 /cZpJ8vvAvSfdn/oQ+s3nupEnADZ0LG+MkI5Zt0U5uBV+PeesfXuyx/fye4v0wVV/vfSfYSljOv
 iCg2xASs2iJEC21s=
X-Received: by 2002:a1c:bc46:: with SMTP id m67mr6940991wmf.82.1612200521404; 
 Mon, 01 Feb 2021 09:28:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyOd+N9DVmRTs446RWWVL6WzwIArmcQbh4FJWVhyuS5zEV0XZWjUt5YfmzInGkxpdf9lFVSFQ==
X-Received: by 2002:a1c:bc46:: with SMTP id m67mr6940971wmf.82.1612200521103; 
 Mon, 01 Feb 2021 09:28:41 -0800 (PST)
Received: from ?IPv6:2a01:e0a:466:71c0:f46f:cfeb:afa5:1898?
 ([2a01:e0a:466:71c0:f46f:cfeb:afa5:1898])
 by smtp.gmail.com with ESMTPSA id l14sm27298920wrq.87.2021.02.01.09.28.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 01 Feb 2021 09:28:40 -0800 (PST)
From: Christophe de Dinechin <cdupontd@redhat.com>
Message-Id: <D704948F-96C7-441F-BCA3-F848ABFD8087@redhat.com>
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: vnc clipboard support
Date: Mon, 1 Feb 2021 18:28:38 +0100
In-Reply-To: <20210201165634.GM4131462@redhat.com>
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
 <0C14700F-CF47-4CD1-AB41-AA69BC0DA469@redhat.com>
 <20210201165634.GM4131462@redhat.com>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cdupontd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_D320E534-529B-4EBE-BC9D-C84D58CCB02C"
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

--Apple-Mail=_D320E534-529B-4EBE-BC9D-C84D58CCB02C
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On 1 Feb 2021, at 17:56, Daniel P. Berrang=C3=A9 <berrange@redhat.com> wr=
ote:
>=20
> On Mon, Feb 01, 2021 at 05:31:52PM +0100, Christophe de Dinechin wrote:
>>=20
>>=20
>>> On 1 Feb 2021, at 16:51, Daniel P. Berrang=C3=A9 <berrange@redhat.com> =
wrote:
>>>=20
>>> On Mon, Feb 01, 2021 at 04:27:43PM +0100, Christophe de Dinechin wrote:
>>>>=20
>>>>=20
>>>>> On 29 Jan 2021, at 15:32, Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>>>>>=20
>>>>> On Fri, Jan 29, 2021 at 03:19:45PM +0100, Christophe de Dinechin wrot=
e:
>>>>>>=20
>>>>>>=20
>>>>>>> On 29 Jan 2021, at 12:08, Daniel P. Berrang=C3=A9 <berrange@redhat.=
com> wrote:
>>>>>>>=20
>>>>>>> On Fri, Jan 29, 2021 at 11:50:10AM +0100, Christophe de Dinechin wr=
ote:
>>>>>>>>=20
>>>>>>>>=20
>>>>>>>>> On 29 Jan 2021, at 09:03, Gerd Hoffmann <kraxel@redhat.com> wrote=
:
>>>>>>>>>=20
>>>>>>>>> Hi,
>>>>>>>>>=20
>>>>>>>>>>> (1) Have some guest agent (spice does it that way).
>>>>>>>>>>> Advantage: more flexible, allows more features.
>>>>>>>>>>> Disadvantage: requires agent in the guest.
>>>>>>>>>>=20
>>>>>>>>>> What about running the option to relay data to a VNC server in t=
he
>>>>>>>>>> guest if there is one running? In other words, using an existing
>>>>>>>>>> VNC server as an agent, with the option of having a stripped-dow=
n,
>>>>>>>>>> clipboard only VNC server as a later optimization.
>>>>>>>>>=20
>>>>>>>>> Well, if you run Xvnc in the guest anyway why use the qemu vnc se=
rver
>>>>>>>>> in the first place?
>>>>>>>>=20
>>>>>>>> I assume that if you use the qemu VNC, it's because you you don't =
want to
>>>>>>>> run Xvnc on some external network, or care about accessing the gue=
st
>>>>>>>> before Xvnc can be launched. There can be many reasons.
>>>>>>>>=20
>>>>>>>> Again, I want to make it clear that my suggestion is _not_ simply =
to access
>>>>>>>> the existing Xvnc as is, but rather to stick with some VNC server =
code to handle
>>>>>>>> the clipboard if / when possible.
>>>>>>>>=20
>>>>>>>> Let me try to imagine a scenario, where I'll use a macOS guest int=
entionally
>>>>>>>> to clarify what I was thinking about.
>>>>>>>>=20
>>>>>>>> - During early boot, there is no in-guest VNC server, so to addres=
s that,
>>>>>>>> you connect to the qemu VNC. At this stage, all screen refresh is =
handled
>>>>>>>> by the qemu VNC, and the best you can do if you want to support an=
y
>>>>>>>> kind of copy-paste is to convert it to virtual keystrokes. The sam=
e would
>>>>>>>> be true for Linux on a text console.
>>>>>>>>=20
>>>>>>>> - Then comes up you macOS guest, and it still has no VNC port open=
,
>>>>>>>> so you are stuck with qemu-vnc doing all the work. But now you can
>>>>>>>> enable screen sharing, and that launches the Apple-maintained macO=
S
>>>>>>>> VNC server.
>>>>>>>>=20
>>>>>>>> - Let's assume for illustration that this listens on some private =
network
>>>>>>>> that qemu can access, but that is not visible externally. In this =
case,
>>>>>>>> you could not VNC to the guest, but you can still VNC to qemu.
>>>>>>>>=20
>>>>>>>> - What I'm suggesting is that qemu-vnc could then switch to simply
>>>>>>>> relaying VNC traffic to that in-guest server. You'd get the smart =
update
>>>>>>>> algorithm that Apple has put in place to deal with transparency an=
d the
>>>>>>>> like, as well as a level of guest OS integration that would otherw=
ise be
>>>>>>>> much harder to replicate.
>>>>>>>=20
>>>>>>> IMHO that's an awful lot of complexity to add to the system
>>>>>>> that isn't especially useful and this opens up new attack
>>>>>>> vectors for the guest to exploit the host.
>>>>>>>=20
>>>>>>> If people have VNC/RDP/whatever configured inside their guest
>>>>>>> OS, then there's really little to no reason for them to want
>>>>>>> to connect to the QEMU VNC server, as viewing initial bootup
>>>>>>> phase is not required in normal case. The only time such
>>>>>>> people will need to use the QEMU VNC server is if the guest
>>>>>>> OS has broken in some way before it fully booted and thus failed
>>>>>>> to start the guest VNC server. There is no guest VNC server
>>>>>>> to hand off to in this scenario.
>>>>>>=20
>>>>>> It's a matter of what you want to do with that qemu vnc.
>>>>>>=20
>>>>>> If it's only a backup when there's nothing in the guest to help,
>>>>>> then maybe trying to support copy-paste is not a good idea.
>>>>>>=20
>>>>>> If it's a standard go-to access point for connecting to your
>>>>>> guest, then making it smart is hard, but useful.
>>>>>>=20
>>>>>>>=20
>>>>>>> The value of the QEMU host side VNC server is that it works
>>>>>>> for all possible guest OS, no matter whether they are running
>>>>>>> normally or broken, regardless of what the guest admin has
>>>>>>> configured in terms of guest level remote desktop.
>>>>>>=20
>>>>>> Understood.
>>>>>>=20
>>>>>> The downside is that there are things it can't do. It cannot correct=
ly
>>>>>> determine the keyboard map, because that's controlled in software
>>>>>> in the guest.
>>>>>=20
>>>>> There is no need for the remote desktop server to care about the
>>>>> keymap. The remote client takes scancodes and passes them to the
>>>>> server, which then passes them to the guest.
>>>>=20
>>>> Aren't we talking about pasting clipboard data here?
>>>> I assume that clipboard data is not encoded as scancodes.
>>>=20
>>> The suggestion was that clipboard be sent by injecting key presses
>>> to the guest, so that is scancode based.
>>=20
>> But the VNC clipboard protocol is not scancode based. So where
>> would the clipboard->scancode conversion happen?
>=20
> If using keyboard injection there's not really much point in
> using the VNC clipboard protocol at all. It just complicates
> life since now we have to configure QEMU with a keymap so that
> it can turn text back into scancodes. We went through alot of
> effort precisely to *stop* telling QEMU about keymaps, so that
> is not an viable option.

How do you get rid of keymaps for local input in qemu?

>=20
> IOW, if we want to use keyboard injection to fake the clipboard
> then the VNC Clients should just implemnet this natively and
> use the VNC keyboard protocol messages instead, so scancode
> conversion is client side. It is still painful, because text
> to scancode is inherantly a lossy conversion, but it is better
> than doing it on the QEMU code.

How many brands of VNC clients are there?

What happens if qemu receives clipboard messages from an old client?

Do you plan some new VNC capability to tell the client "I want scancodes"?

What would prevent a client from sending dangerous scancodes,
like Control C or Alt TAB?

How would you prevent the user from typing something in the middle?

How do you rate-limit intelligently to avoid overflowing the guest keyboard=
 buffers?


>=20
>> Also, any idea how to copy from the guest in that case?
>=20
> If using keyboard injection the clipboard will be unidirectional
> only.
>=20
> Bi-directional clipboard needs a guest agent.

OK.

What is the use case for single-directional text-only clipboard?

>=20
>>=20
>>>=20
>>> If you're not doing it using key press injection, then keymapping
>>> and scancodes are irrelevant.
>>=20
>> Indeed, but that requires some guest agent, and Gerd seems to
>> not like that idea.
>>=20
>> BTW, isolating the clipboard sharing protocol from VNC is an
>> old idea, see https://wiki.xenproject.org/wiki/Clipboard_sharing_protoco=
l <https://wiki.xenproject.org/wiki/Clipboard_sharing_protocol><https://wik=
i.xenproject.org/wiki/Clipboard_sharing_protocol <https://wiki.xenproject.o=
rg/wiki/Clipboard_sharing_protocol>>.
>=20
> That's not really isolating it from VNC - that's describing a guest
> agent the host QEMU can use to support its built-in VNC server.
> Confusingly this suggested guest agent happens to use a subset of
> the VNC protocol for transferring clipboard data between QEMU and
> the guest OS. This part is rather crazy since the VNC clipboard
> protocol is incredibly simplistic. Any new guest agent should
> learn from the mistakes of VNC and SPICE wrt clipboard.

Well, to me, the trick is that you got a VNC server in qemu that
receives VNC clipboard data. The question is how you transfer
that to the guest. Indeed, the protocol is simplistic, but you still
need a new data path, e.g. a character device that your in-guest
agent listens to, a bit like the SPICE agent. So the picture becomes:

Normal VNC
Client --> (guest network) --> In-guest VNC server

QEMU VNC:
Client --> (host network) --> qemu-VNC server --> char device --> in-guest =
VNC clipboard server

Only the data path changes, but the protocol can remain
essentially the same.


--Apple-Mail=_D320E534-529B-4EBE-BC9D-C84D58CCB02C
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=3Dutf-8"></head><body style=3D"word-wrap: break-word; -webkit-nbsp-mode: s=
pace; line-break: after-white-space;" class=3D""><br class=3D""><div><br cl=
ass=3D""><blockquote type=3D"cite" class=3D""><div class=3D"">On 1 Feb 2021=
, at 17:56, Daniel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.c=
om" class=3D"">berrange@redhat.com</a>&gt; wrote:</div><br class=3D"Apple-i=
nterchange-newline"><div class=3D""><meta charset=3D"UTF-8" class=3D""><spa=
n style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 18=
px; font-style: normal; font-variant-caps: normal; font-weight: normal; let=
ter-spacing: normal; text-align: start; text-indent: 0px; text-transform: n=
one; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px=
; text-decoration: none; float: none; display: inline !important;" class=3D=
"">On Mon, Feb 01, 2021 at 05:31:52PM +0100, Christophe de Dinechin wrote:<=
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
=3D""><br class=3D""><blockquote type=3D"cite" class=3D"">On 1 Feb 2021, at=
 16:51, Daniel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com" =
class=3D"">berrange@redhat.com</a>&gt; wrote:<br class=3D""><br class=3D"">=
On Mon, Feb 01, 2021 at 04:27:43PM +0100, Christophe de Dinechin wrote:<br =
class=3D""><blockquote type=3D"cite" class=3D""><br class=3D""><br class=3D=
""><blockquote type=3D"cite" class=3D"">On 29 Jan 2021, at 15:32, Daniel P.=
 Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com" class=3D"">berran=
ge@redhat.com</a>&gt; wrote:<br class=3D""><br class=3D"">On Fri, Jan 29, 2=
021 at 03:19:45PM +0100, Christophe de Dinechin wrote:<br class=3D""><block=
quote type=3D"cite" class=3D""><br class=3D""><br class=3D""><blockquote ty=
pe=3D"cite" class=3D"">On 29 Jan 2021, at 12:08, Daniel P. Berrang=C3=A9 &l=
t;<a href=3D"mailto:berrange@redhat.com" class=3D"">berrange@redhat.com</a>=
&gt; wrote:<br class=3D""><br class=3D"">On Fri, Jan 29, 2021 at 11:50:10AM=
 +0100, Christophe de Dinechin wrote:<br class=3D""><blockquote type=3D"cit=
e" class=3D""><br class=3D""><br class=3D""><blockquote type=3D"cite" class=
=3D"">On 29 Jan 2021, at 09:03, Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@=
redhat.com" class=3D"">kraxel@redhat.com</a>&gt; wrote:<br class=3D""><br c=
lass=3D"">Hi,<br class=3D""><br class=3D""><blockquote type=3D"cite" class=
=3D""><blockquote type=3D"cite" class=3D"">(1) Have some guest agent (spice=
 does it that way).<br class=3D"">Advantage: more flexible, allows more fea=
tures.<br class=3D"">Disadvantage: requires agent in the guest.<br class=3D=
""></blockquote><br class=3D"">What about running the option to relay data =
to a VNC server in the<br class=3D"">guest if there is one running? In othe=
r words, using an existing<br class=3D"">VNC server as an agent, with the o=
ption of having a stripped-down,<br class=3D"">clipboard only VNC server as=
 a later optimization.<br class=3D""></blockquote><br class=3D"">Well, if y=
ou run Xvnc in the guest anyway why use the qemu vnc server<br class=3D"">i=
n the first place?<br class=3D""></blockquote><br class=3D"">I assume that =
if you use the qemu VNC, it's because you you don't want to<br class=3D"">r=
un Xvnc on some external network, or care about accessing the guest<br clas=
s=3D"">before Xvnc can be launched. There can be many reasons.<br class=3D"=
"><br class=3D"">Again, I want to make it clear that my suggestion is _not_=
 simply to access<br class=3D"">the existing Xvnc as is, but rather to stic=
k with some VNC server code to handle<br class=3D"">the clipboard if / when=
 possible.<br class=3D""><br class=3D"">Let me try to imagine a scenario, w=
here I'll use a macOS guest intentionally<br class=3D"">to clarify what I w=
as thinking about.<br class=3D""><br class=3D"">- During early boot, there =
is no in-guest VNC server, so to address that,<br class=3D"">you connect to=
 the qemu VNC. At this stage, all screen refresh is handled<br class=3D"">b=
y the qemu VNC, and the best you can do if you want to support any<br class=
=3D"">kind of copy-paste is to convert it to virtual keystrokes. The same w=
ould<br class=3D"">be true for Linux on a text console.<br class=3D""><br c=
lass=3D"">- Then comes up you macOS guest, and it still has no VNC port ope=
n,<br class=3D"">so you are stuck with qemu-vnc doing all the work. But now=
 you can<br class=3D"">enable screen sharing, and that launches the Apple-m=
aintained macOS<br class=3D"">VNC server.<br class=3D""><br class=3D"">- Le=
t's assume for illustration that this listens on some private network<br cl=
ass=3D"">that qemu can access, but that is not visible externally. In this =
case,<br class=3D"">you could not VNC to the guest, but you can still VNC t=
o qemu.<br class=3D""><br class=3D"">- What I'm suggesting is that qemu-vnc=
 could then switch to simply<br class=3D"">relaying VNC traffic to that in-=
guest server. You'd get the smart update<br class=3D"">algorithm that Apple=
 has put in place to deal with transparency and the<br class=3D"">like, as =
well as a level of guest OS integration that would otherwise be<br class=3D=
"">much harder to replicate.<br class=3D""></blockquote><br class=3D"">IMHO=
 that's an awful lot of complexity to add to the system<br class=3D"">that =
isn't especially useful and this opens up new attack<br class=3D"">vectors =
for the guest to exploit the host.<br class=3D""><br class=3D"">If people h=
ave VNC/RDP/whatever configured inside their guest<br class=3D"">OS, then t=
here's really little to no reason for them to want<br class=3D"">to connect=
 to the QEMU VNC server, as viewing initial bootup<br class=3D"">phase is n=
ot required in normal case. The only time such<br class=3D"">people will ne=
ed to use the QEMU VNC server is if the guest<br class=3D"">OS has broken i=
n some way before it fully booted and thus failed<br class=3D"">to start th=
e guest VNC server. There is no guest VNC server<br class=3D"">to hand off =
to in this scenario.<br class=3D""></blockquote><br class=3D"">It's a matte=
r of what you want to do with that qemu vnc.<br class=3D""><br class=3D"">I=
f it's only a backup when there's nothing in the guest to help,<br class=3D=
"">then maybe trying to support copy-paste is not a good idea.<br class=3D"=
"><br class=3D"">If it's a standard go-to access point for connecting to yo=
ur<br class=3D"">guest, then making it smart is hard, but useful.<br class=
=3D""><br class=3D""><blockquote type=3D"cite" class=3D""><br class=3D"">Th=
e value of the QEMU host side VNC server is that it works<br class=3D"">for=
 all possible guest OS, no matter whether they are running<br class=3D"">no=
rmally or broken, regardless of what the guest admin has<br class=3D"">conf=
igured in terms of guest level remote desktop.<br class=3D""></blockquote><=
br class=3D"">Understood.<br class=3D""><br class=3D"">The downside is that=
 there are things it can't do. It cannot correctly<br class=3D"">determine =
the keyboard map, because that's controlled in software<br class=3D"">in th=
e guest.<br class=3D""></blockquote><br class=3D"">There is no need for the=
 remote desktop server to care about the<br class=3D"">keymap. The remote c=
lient takes scancodes and passes them to the<br class=3D"">server, which th=
en passes them to the guest.<br class=3D""></blockquote><br class=3D"">Aren=
't we talking about pasting clipboard data here?<br class=3D"">I assume tha=
t clipboard data is not encoded as scancodes.<br class=3D""></blockquote><b=
r class=3D"">The suggestion was that clipboard be sent by injecting key pre=
sses<br class=3D"">to the guest, so that is scancode based.<br class=3D""><=
/blockquote><br class=3D"">But the VNC clipboard protocol is not scancode b=
ased. So where<br class=3D"">would the clipboard-&gt;scancode conversion ha=
ppen?<br class=3D""></blockquote><br style=3D"caret-color: rgb(0, 0, 0); fo=
nt-family: Helvetica; font-size: 18px; font-style: normal; font-variant-cap=
s: normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; word-spacing: =
0px; -webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><sp=
an style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 1=
8px; font-style: normal; font-variant-caps: normal; font-weight: normal; le=
tter-spacing: normal; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; text-decoration: none; float: none; display: inline !important;" class=
=3D"">If using keyboard injection there's not really much point in</span><b=
r style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 18=
px; font-style: normal; font-variant-caps: normal; font-weight: normal; let=
ter-spacing: normal; text-align: start; text-indent: 0px; text-transform: n=
one; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px=
; text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 18px; font-style: normal; font-varia=
nt-caps: normal; font-weight: normal; letter-spacing: normal; text-align: s=
tart; text-indent: 0px; text-transform: none; white-space: normal; word-spa=
cing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none; float: no=
ne; display: inline !important;" class=3D"">using the VNC clipboard protoco=
l at all. It just complicates</span><br style=3D"caret-color: rgb(0, 0, 0);=
 font-family: Helvetica; font-size: 18px; font-style: normal; font-variant-=
caps: normal; font-weight: normal; letter-spacing: normal; text-align: star=
t; text-indent: 0px; text-transform: none; white-space: normal; word-spacin=
g: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">=
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 18px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">life since now we have to configure QEMU with a keymap so that</span=
><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size:=
 18px; font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; text-align: start; text-indent: 0px; text-transform=
: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: =
0px; text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, =
0, 0); font-family: Helvetica; font-size: 18px; font-style: normal; font-va=
riant-caps: normal; font-weight: normal; letter-spacing: normal; text-align=
: start; text-indent: 0px; text-transform: none; white-space: normal; word-=
spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none; float:=
 none; display: inline !important;" class=3D"">it can turn text back into s=
cancodes. We went through alot of</span><br style=3D"caret-color: rgb(0, 0,=
 0); font-family: Helvetica; font-size: 18px; font-style: normal; font-vari=
ant-caps: normal; font-weight: normal; letter-spacing: normal; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; word-sp=
acing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;" class=
=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; fon=
t-size: 18px; font-style: normal; font-variant-caps: normal; font-weight: n=
ormal; letter-spacing: normal; text-align: start; text-indent: 0px; text-tr=
ansform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-=
width: 0px; text-decoration: none; float: none; display: inline !important;=
" class=3D"">effort precisely to *stop* telling QEMU about keymaps, so that=
</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font=
-size: 18px; font-style: normal; font-variant-caps: normal; font-weight: no=
rmal; letter-spacing: normal; text-align: start; text-indent: 0px; text-tra=
nsform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-w=
idth: 0px; text-decoration: none;" class=3D""><span style=3D"caret-color: r=
gb(0, 0, 0); font-family: Helvetica; font-size: 18px; font-style: normal; f=
ont-variant-caps: normal; font-weight: normal; letter-spacing: normal; text=
-align: start; text-indent: 0px; text-transform: none; white-space: normal;=
 word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none; =
float: none; display: inline !important;" class=3D"">is not an viable optio=
n.</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; fo=
nt-size: 18px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; text-t=
ransform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke=
-width: 0px; text-decoration: none;" class=3D""></div></blockquote><div><br=
 class=3D""></div><div>How do you get rid of keymaps for local input in qem=
u?</div><br class=3D""><blockquote type=3D"cite" class=3D""><div class=3D""=
><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size:=
 18px; font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; text-align: start; text-indent: 0px; text-transform=
: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: =
0px; text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, =
0, 0); font-family: Helvetica; font-size: 18px; font-style: normal; font-va=
riant-caps: normal; font-weight: normal; letter-spacing: normal; text-align=
: start; text-indent: 0px; text-transform: none; white-space: normal; word-=
spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none; float:=
 none; display: inline !important;" class=3D"">IOW, if we want to use keybo=
ard injection to fake the clipboard</span><br style=3D"caret-color: rgb(0, =
0, 0); font-family: Helvetica; font-size: 18px; font-style: normal; font-va=
riant-caps: normal; font-weight: normal; letter-spacing: normal; text-align=
: start; text-indent: 0px; text-transform: none; white-space: normal; word-=
spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;" class=
=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; fon=
t-size: 18px; font-style: normal; font-variant-caps: normal; font-weight: n=
ormal; letter-spacing: normal; text-align: start; text-indent: 0px; text-tr=
ansform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-=
width: 0px; text-decoration: none; float: none; display: inline !important;=
" class=3D"">then the VNC Clients should just implemnet this natively and</=
span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-s=
ize: 18px; font-style: normal; font-variant-caps: normal; font-weight: norm=
al; letter-spacing: normal; text-align: start; text-indent: 0px; text-trans=
form: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-wid=
th: 0px; text-decoration: none;" class=3D""><span style=3D"caret-color: rgb=
(0, 0, 0); font-family: Helvetica; font-size: 18px; font-style: normal; fon=
t-variant-caps: normal; font-weight: normal; letter-spacing: normal; text-a=
lign: start; text-indent: 0px; text-transform: none; white-space: normal; w=
ord-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none; fl=
oat: none; display: inline !important;" class=3D"">use the VNC keyboard pro=
tocol messages instead, so scancode</span><br style=3D"caret-color: rgb(0, =
0, 0); font-family: Helvetica; font-size: 18px; font-style: normal; font-va=
riant-caps: normal; font-weight: normal; letter-spacing: normal; text-align=
: start; text-indent: 0px; text-transform: none; white-space: normal; word-=
spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;" class=
=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; fon=
t-size: 18px; font-style: normal; font-variant-caps: normal; font-weight: n=
ormal; letter-spacing: normal; text-align: start; text-indent: 0px; text-tr=
ansform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-=
width: 0px; text-decoration: none; float: none; display: inline !important;=
" class=3D"">conversion is client side. It is still painful, because text</=
span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-s=
ize: 18px; font-style: normal; font-variant-caps: normal; font-weight: norm=
al; letter-spacing: normal; text-align: start; text-indent: 0px; text-trans=
form: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-wid=
th: 0px; text-decoration: none;" class=3D""><span style=3D"caret-color: rgb=
(0, 0, 0); font-family: Helvetica; font-size: 18px; font-style: normal; fon=
t-variant-caps: normal; font-weight: normal; letter-spacing: normal; text-a=
lign: start; text-indent: 0px; text-transform: none; white-space: normal; w=
ord-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none; fl=
oat: none; display: inline !important;" class=3D"">to scancode is inherantl=
y a lossy conversion, but it is better</span><br style=3D"caret-color: rgb(=
0, 0, 0); font-family: Helvetica; font-size: 18px; font-style: normal; font=
-variant-caps: normal; font-weight: normal; letter-spacing: normal; text-al=
ign: start; text-indent: 0px; text-transform: none; white-space: normal; wo=
rd-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;" cl=
ass=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; =
font-size: 18px; font-style: normal; font-variant-caps: normal; font-weight=
: normal; letter-spacing: normal; text-align: start; text-indent: 0px; text=
-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-stro=
ke-width: 0px; text-decoration: none; float: none; display: inline !importa=
nt;" class=3D"">than doing it on the QEMU code.</span><br style=3D"caret-co=
lor: rgb(0, 0, 0); font-family: Helvetica; font-size: 18px; font-style: nor=
mal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal=
; text-align: start; text-indent: 0px; text-transform: none; white-space: n=
ormal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""></div></blockquote><div><br class=3D""></div><div>How man=
y brands of VNC clients are there?</div><div><br class=3D""></div><div>What=
 happens if qemu receives clipboard messages from an old client?</div><div>=
<br class=3D""></div><div>Do you plan some new VNC capability to tell the c=
lient "I want scancodes"?</div><div><br class=3D""></div><div>What would pr=
event a client from sending dangerous scancodes,</div><div>like Control C o=
r Alt TAB?</div><div><br class=3D""></div><div>How would you prevent the us=
er from typing something in the middle?</div><div><br class=3D""></div><div=
>How do you rate-limit intelligently to avoid overflowing the guest keyboar=
d buffers?</div><div><br class=3D""></div><div><br class=3D""></div><blockq=
uote type=3D"cite" class=3D""><div class=3D""><br style=3D"caret-color: rgb=
(0, 0, 0); font-family: Helvetica; font-size: 18px; font-style: normal; fon=
t-variant-caps: normal; font-weight: normal; letter-spacing: normal; text-a=
lign: start; text-indent: 0px; text-transform: none; white-space: normal; w=
ord-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;" c=
lass=3D""><blockquote type=3D"cite" style=3D"font-family: Helvetica; font-s=
ize: 18px; font-style: normal; font-variant-caps: normal; font-weight: norm=
al; letter-spacing: normal; orphans: auto; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; widows: auto; word-spacing:=
 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-=
decoration: none;" class=3D"">Also, any idea how to copy from the guest in =
that case?<br class=3D""></blockquote><br style=3D"caret-color: rgb(0, 0, 0=
); font-family: Helvetica; font-size: 18px; font-style: normal; font-varian=
t-caps: normal; font-weight: normal; letter-spacing: normal; text-align: st=
art; text-indent: 0px; text-transform: none; white-space: normal; word-spac=
ing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"=
"><span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-si=
ze: 18px; font-style: normal; font-variant-caps: normal; font-weight: norma=
l; letter-spacing: normal; text-align: start; text-indent: 0px; text-transf=
orm: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-widt=
h: 0px; text-decoration: none; float: none; display: inline !important;" cl=
ass=3D"">If using keyboard injection the clipboard will be unidirectional</=
span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-s=
ize: 18px; font-style: normal; font-variant-caps: normal; font-weight: norm=
al; letter-spacing: normal; text-align: start; text-indent: 0px; text-trans=
form: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-wid=
th: 0px; text-decoration: none;" class=3D""><span style=3D"caret-color: rgb=
(0, 0, 0); font-family: Helvetica; font-size: 18px; font-style: normal; fon=
t-variant-caps: normal; font-weight: normal; letter-spacing: normal; text-a=
lign: start; text-indent: 0px; text-transform: none; white-space: normal; w=
ord-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none; fl=
oat: none; display: inline !important;" class=3D"">only.</span></div></bloc=
kquote><blockquote type=3D"cite" class=3D""><div class=3D""><br style=3D"ca=
ret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 18px; font-styl=
e: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; white-sp=
ace: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decora=
tion: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-fami=
ly: Helvetica; font-size: 18px; font-style: normal; font-variant-caps: norm=
al; font-weight: normal; letter-spacing: normal; text-align: start; text-in=
dent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -w=
ebkit-text-stroke-width: 0px; text-decoration: none; float: none; display: =
inline !important;" class=3D"">Bi-directional clipboard needs a guest agent=
.</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; fon=
t-size: 18px; font-style: normal; font-variant-caps: normal; font-weight: n=
ormal; letter-spacing: normal; text-align: start; text-indent: 0px; text-tr=
ansform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-=
width: 0px; text-decoration: none;" class=3D""></div></blockquote><div><br =
class=3D""></div><div>OK.</div><div><br class=3D""></div><div>What is the u=
se case for single-directional text-only clipboard?</div><div><br class=3D"=
"></div><blockquote type=3D"cite" class=3D""><div class=3D""><br style=3D"c=
aret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 18px; font-sty=
le: normal; font-variant-caps: normal; font-weight: normal; letter-spacing:=
 normal; text-align: start; text-indent: 0px; text-transform: none; white-s=
pace: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decor=
ation: none;" class=3D""><blockquote type=3D"cite" style=3D"font-family: He=
lvetica; font-size: 18px; font-style: normal; font-variant-caps: normal; fo=
nt-weight: normal; letter-spacing: normal; orphans: auto; text-align: start=
; text-indent: 0px; text-transform: none; white-space: normal; widows: auto=
; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-wi=
dth: 0px; text-decoration: none;" class=3D""><br class=3D""><blockquote typ=
e=3D"cite" class=3D""><br class=3D"">If you're not doing it using key press=
 injection, then keymapping<br class=3D"">and scancodes are irrelevant.<br =
class=3D""></blockquote><br class=3D"">Indeed, but that requires some guest=
 agent, and Gerd seems to<br class=3D"">not like that idea.<br class=3D""><=
br class=3D"">BTW, isolating the clipboard sharing protocol from VNC is an<=
br class=3D"">old idea, see<span class=3D"Apple-converted-space">&nbsp;</sp=
an><a href=3D"https://wiki.xenproject.org/wiki/Clipboard_sharing_protocol" =
class=3D"">https://wiki.xenproject.org/wiki/Clipboard_sharing_protocol</a>&=
lt;<a href=3D"https://wiki.xenproject.org/wiki/Clipboard_sharing_protocol" =
class=3D"">https://wiki.xenproject.org/wiki/Clipboard_sharing_protocol</a>&=
gt;.<br class=3D""></blockquote><br style=3D"caret-color: rgb(0, 0, 0); fon=
t-family: Helvetica; font-size: 18px; font-style: normal; font-variant-caps=
: normal; font-weight: normal; letter-spacing: normal; text-align: start; t=
ext-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0=
px; -webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><spa=
n style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 18=
px; font-style: normal; font-variant-caps: normal; font-weight: normal; let=
ter-spacing: normal; text-align: start; text-indent: 0px; text-transform: n=
one; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px=
; text-decoration: none; float: none; display: inline !important;" class=3D=
"">That's not really isolating it from VNC - that's describing a guest</spa=
n><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 18px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0,=
 0, 0); font-family: Helvetica; font-size: 18px; font-style: normal; font-v=
ariant-caps: normal; font-weight: normal; letter-spacing: normal; text-alig=
n: start; text-indent: 0px; text-transform: none; white-space: normal; word=
-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none; float=
: none; display: inline !important;" class=3D"">agent the host QEMU can use=
 to support its built-in VNC server.</span><br style=3D"caret-color: rgb(0,=
 0, 0); font-family: Helvetica; font-size: 18px; font-style: normal; font-v=
ariant-caps: normal; font-weight: normal; letter-spacing: normal; text-alig=
n: start; text-indent: 0px; text-transform: none; white-space: normal; word=
-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;" clas=
s=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; fo=
nt-size: 18px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; text-t=
ransform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke=
-width: 0px; text-decoration: none; float: none; display: inline !important=
;" class=3D"">Confusingly this suggested guest agent happens to use a subse=
t of</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; =
font-size: 18px; font-style: normal; font-variant-caps: normal; font-weight=
: normal; letter-spacing: normal; text-align: start; text-indent: 0px; text=
-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-stro=
ke-width: 0px; text-decoration: none;" class=3D""><span style=3D"caret-colo=
r: rgb(0, 0, 0); font-family: Helvetica; font-size: 18px; font-style: norma=
l; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: nor=
mal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: no=
ne; float: none; display: inline !important;" class=3D"">the VNC protocol f=
or transferring clipboard data between QEMU and</span><br style=3D"caret-co=
lor: rgb(0, 0, 0); font-family: Helvetica; font-size: 18px; font-style: nor=
mal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal=
; text-align: start; text-indent: 0px; text-transform: none; white-space: n=
ormal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: He=
lvetica; font-size: 18px; font-style: normal; font-variant-caps: normal; fo=
nt-weight: normal; letter-spacing: normal; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-=
text-stroke-width: 0px; text-decoration: none; float: none; display: inline=
 !important;" class=3D"">the guest OS. This part is rather crazy since the =
VNC clipboard</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: He=
lvetica; font-size: 18px; font-style: normal; font-variant-caps: normal; fo=
nt-weight: normal; letter-spacing: normal; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-=
text-stroke-width: 0px; text-decoration: none;" class=3D""><span style=3D"c=
aret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 18px; font-sty=
le: normal; font-variant-caps: normal; font-weight: normal; letter-spacing:=
 normal; text-align: start; text-indent: 0px; text-transform: none; white-s=
pace: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decor=
ation: none; float: none; display: inline !important;" class=3D"">protocol =
is incredibly simplistic. Any new guest agent should</span><br style=3D"car=
et-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 18px; font-style=
: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: n=
ormal; text-align: start; text-indent: 0px; text-transform: none; white-spa=
ce: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decorat=
ion: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-famil=
y: Helvetica; font-size: 18px; font-style: normal; font-variant-caps: norma=
l; font-weight: normal; letter-spacing: normal; text-align: start; text-ind=
ent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; text-decoration: none; float: none; display: i=
nline !important;" class=3D"">learn from the mistakes of VNC and SPICE wrt =
clipboard.</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helve=
tica; font-size: 18px; font-style: normal; font-variant-caps: normal; font-=
weight: normal; letter-spacing: normal; text-align: start; text-indent: 0px=
; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-tex=
t-stroke-width: 0px; text-decoration: none;" class=3D""></div></blockquote>=
<div><br class=3D""></div><div>Well, to me, the trick is that you got a VNC=
 server in qemu that</div><div>receives VNC clipboard data. The question is=
 how you transfer</div><div>that to the guest. Indeed, the protocol is simp=
listic, but you still</div><div>need a new data path, e.g. a character devi=
ce that your in-guest</div><div>agent listens to, a bit like the SPICE agen=
t. So the picture becomes:</div><div><br class=3D""></div><div>Normal VNC</=
div><div>Client --&gt; (guest network) --&gt; In-guest VNC server</div><div=
><br class=3D""></div><div>QEMU VNC:</div><div>Client --&gt; (host network)=
 --&gt; qemu-VNC server --&gt; char device --&gt; in-guest VNC clipboard se=
rver</div><div><br class=3D""></div><div>Only the data path changes, but th=
e protocol can remain</div><div>essentially the same.</div><div><br class=
=3D""></div></div></body></html>
--Apple-Mail=_D320E534-529B-4EBE-BC9D-C84D58CCB02C--


