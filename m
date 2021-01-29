Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3BE3086C8
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 09:02:14 +0100 (CET)
Received: from localhost ([::1]:35888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5OjN-0000mo-G2
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 03:02:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cdupontd@redhat.com>)
 id 1l5Ogw-0008D2-7f
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 02:59:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cdupontd@redhat.com>)
 id 1l5Ogs-0004h5-SR
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 02:59:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611907177;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5IXtwFKILnVZEaaWMVp3yBQjatLM9x5LxdRtU/kBN3s=;
 b=T340oo0swjHpZ14dAX0fOihGdlU5wtrNMmOgSnzmXCXEOYyTsaptwpQHetxOo7I3ETt1MP
 fdu+gZ/FVOv8uCIQZNStCrHLx23BG0riS+D+Mse+hNRAMK0ngIZIpPkETMEEYLj3wFQ1aQ
 jXspn9VG+IWyZT09YFlLLZ+n6H9BwbQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-314-xCGqJV0POlmgd2qbBjVBAw-1; Fri, 29 Jan 2021 02:59:34 -0500
X-MC-Unique: xCGqJV0POlmgd2qbBjVBAw-1
Received: by mail-wr1-f71.google.com with SMTP id j8so4593434wrx.17
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 23:59:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:subject:mime-version
 :from:in-reply-to:cc:date:message-id:references:to;
 bh=3gKCi4HfA7O+I/hMAu7e4hZBX4eZgFeNVLuI4tc7mGo=;
 b=ObDUUG5CVL+tXU7FBn+3NIFMmnV1mMmLavUgRgCNA+ByL2A2mzy52bogvfbsSpkfiG
 /Hg3SR7Ll8ZPUBmX7vUfC/qjA+AMxJNVF7HAvyhvjLYdHaLRnnSzREz19/kNne7o3F9B
 JzFOkVelUar9cXDBTyFJ0pb4GOlvRToUf2/FoP7fbD6beKx3uww1Rev4Ms3P8kJ5/5w7
 WJSm9bKNgGzAlIbM1CoG1hAXRVviqSsagVv8Emv4t9u5N/+hsUCHtjuWB07fJMce2bI9
 Dg1jddqt7iBcMNT+9APV3w4sBPY8UqVEMfEwNM7/PDpAIRHgrt/+LTHG1+rWfKnOMw1V
 y12A==
X-Gm-Message-State: AOAM532k5mznayyaIPryWUKQ/y1nlGTqur32mqgm1pz82AMtg7PrvYhm
 eSgvG8xFpVr7yAX41dgOTpUF8KnepqgrpbPO8Ecs9cGMHywNt+JZoR+htLGSumoGJKD8D0nAYKD
 amOmfYRZpcn7UiSk=
X-Received: by 2002:adf:f909:: with SMTP id b9mr3127732wrr.111.1611907172765; 
 Thu, 28 Jan 2021 23:59:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzIOIxI6FMTbpfK+cPA3IwYUSZHjzq2iaMhd33Ld8DxKwoldDvAAJVykxKvbevB89l4INzyPg==
X-Received: by 2002:adf:f909:: with SMTP id b9mr3127710wrr.111.1611907172505; 
 Thu, 28 Jan 2021 23:59:32 -0800 (PST)
Received: from [10.83.36.161] ([37.164.110.89])
 by smtp.gmail.com with ESMTPSA id w4sm8702039wmc.13.2021.01.28.23.59.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jan 2021 23:59:31 -0800 (PST)
Subject: Re: vnc clipboard support
Mime-Version: 1.0 (1.0)
X-Apple-Notify-Thread: NO
X-Universally-Unique-Identifier: 7130E460-42F6-4EB0-9ABE-A16CD37ECBD4
From: Christophe de Dinechin <cdupontd@redhat.com>
In-Reply-To: <CAJ+F1CJvJM0Vjdz1nU92H+x00+NdbqfoJ9TA--9-BuQ8SNmoFg@mail.gmail.com>
Date: Fri, 29 Jan 2021 08:59:01 +0100
X-Apple-Message-Smime-Encrypt: NO
Message-Id: <F37DF7C7-22DB-4ED1-BFDA-EB35C4851B8C@redhat.com>
References: <CAJ+F1CJvJM0Vjdz1nU92H+x00+NdbqfoJ9TA--9-BuQ8SNmoFg@mail.gmail.com>
To: =?utf-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@gmail.com>
X-Mailer: iPhone Mail (18C66)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cdupontd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative;
 boundary=Apple-Mail-F94A07E4-D082-497C-B557-89484518E36D
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cdupontd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Apple-Mail-F94A07E4-D082-497C-B557-89484518E36D
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable



Christophe
(Typos are from my iPhone)

> Le 28 janv. 2021 =C3=A0 21:24, Marc-Andr=C3=A9 Lureau <marcandre.lureau@g=
mail.com> a =C3=A9crit :
>=20
> =EF=BB=BF
> Hi
>=20
>> On Thu, Jan 28, 2021 at 9:14 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>>   Hi folks,
>>=20
>> I'm looking for a good way to implement cut+paste support for vnc.
>>=20
>> The vnc core protocol has support for text/plain cut+paste, and there
>> is an extension adding support for other formats.  That'll cover one
>> part of the problem, exchanging cut+paste data between vnc client and
>> qemu vnc server.
>>=20
>> The tricky part is the second: the guest <=3D> qemu communication.
>> I see basically two possible approaches here:
>>=20
>>   (1) Have some guest agent (spice does it that way).
>>       Advantage: more flexible, allows more features.
>>       Disadvantage: requires agent in the guest.
>>=20
>>   (2) Send text as key events.
>>       Advantage: no guest agent needed.
>>       Disadvantage: is translated by guests keyboard map, so qemu
>>       needs to know the map for proper char -> key event translation.
>>       Only works for text/plain and only for chars you can easily
>>       type, anything needing input methods (emoji =F0=9F=98=8A for examp=
le)
>>       isn't going to fly.
>>=20
>> I think that (1) is clearly the better way.  Given that the agent
>> would need to run in user wayland/xorg session context the existing
>> qemu-guest-agent will not work.  Also linking against some UI library
>> like gtk3 for clipboard handling is not something we want for the
>> qemu-guest-agent.  So we need another one, I'll name it
>> qemu-clipboard-agent for the rest of this mail.  And we need a
>> communication channel.
>>=20
>> I'd tend to model the qemu-clipboard-agent simliar to the
>> qemu-guest-agent, i.e. have some stream as communication path and run
>> some stream protocol over it.
>>=20
>> Stream options I see are (in order of personal preference):
>>=20
>>   (1) New virtio-serial port.  virtio-serial likely is there anyway
>>       for the qemu-guest-agent ...
>>=20
>>   (2) Have qemu-clipboard-agent and qemu-guest-agent share the agent
>>       channel, i.e. qemu-clipboard-agent will proxy everything through
>>       qemu-guest-agent (spice does it that way).
>>=20
>> Protocol options I see are (not sure yet which to prefer, need to have
>> a closer look at the candidates):
>>=20
>>   (1) Add clipboard commands to QMP and use these.
>>=20
>>   (2) Reuse the clipboard bits of the vnc protocol (forward
>>       VNC_MSG_CLIENT_CUT_TEXT messages to the guest agent)
>>=20
>>   (3) Reuse the clipboard bits of the spice-agent protocol.
>>=20
>>   (4) Reuse the clipboard bits of the wayland protocol.
>>=20
>> Once we have sorted the qemu <-> guest communication path it should be
>> possible to also hook up other UIs (specifically gtk) without too much
>> effort.  Which probably makes (2) a rather poor choice.
>>=20
>> Comments?
>> Suggestions?
>> Other ideas?
>=20
>=20
>=20
> I also had recently some thoughts about how to implement clipboard sharin=
g in a more general way for QEMU.
>=20
> I admit I like Christophe's suggestion ("it's somebody else problem"), bu=
t it falls short to me as I don't know of a common open-source remoting sol=
ution for various operating systems, and I don't see how it could integrate=
 well with our UI and remote protocols. Or look at reusing some VirtualBox =
code perhaps?

Just to clarify, I did not think of my suggestion as =E2=80=9CSEP=E2=80=9D =
but more as a way to leverage existing knowledge regarding guest OS clipboa=
rd. More a =E2=80=9Cwhat should we steal=E2=80=9D approach.=20

>=20
> Some things I keep in mind:
> - the spice protocol had a number of iterations to fix some races. It wou=
ld be great not to repeat the same mistakes, and I don't know if VNC have t=
he same flaws or not.
> - the spice agent design isn't great: the system agent proxies messages t=
o the active session. It would be nice if the new solution didn't have such=
 a middle-man.
> - with wayland, clipboard sharing isn't really possible. Or not in a seam=
less way at least. Today it kinda works with some X11 compatibility extensi=
ons, but this will eventually go away or change behaviour.
> - the GNOME desktop is working on remoting using RDP, and they are implem=
enting a DBus interface for it (https://gitlab.gnome.org/jadahl/mutter/-/co=
mmits/wip/remote-desktop-clipboard)
> - it's not just about clipboard. We would also want to have some kind of =
drag and drop (even if limited to files like Spice atm). We may want some w=
indowing integration. We may also want to have access to some desktop servi=
ces: apps, documents etc.. And what's not.
>=20
> That leads me to think that virtio-serial is not very well suited, as it =
doesn't allow various services / processes to come and go. I see vsock as a=
 much better alternative. (I also wonder if it handles control flow any bet=
ter btw)
>=20
> I think we shoud work on getting the free desktops our best-class support=
. To me, this means we need to speak the lingua franca, which is DBus. The =
great thing is that DBus is also equipped to handle services that come and =
go, handling discovery, introspection etc. Various services are already ava=
ilable. As mentioned earlier, that's what the GNOME desktop will offer for =
clipboard sharing. There are good chances other desktops will follow if tha=
t design works, as it should be easy for them to implement the same service=
. That means good reuse of existing desktop code. Speaking DBus on Windows,=
 MacOS or Android isn't an issue. However, vsock support may be a bit trick=
y atm.
>=20
> Fwiw, DBus doesn't yet officially support vsock connections: https://gitl=
ab.freedesktop.org/dbus/dbus/-/merge_requests/200. This a minor detail, as =
once you give it a fd for transport, it doesn't really care (I also took ca=
re of glib!1892 and Rust zbus)
>=20
> Oh and of course, since this is a new daemon, it would be really a shame =
not to write it in a modern language (hint! ;-).
>=20
> Hope that helps,
>=20
> --=20
> Marc-Andr=C3=A9 Lureau

--Apple-Mail-F94A07E4-D082-497C-B557-89484518E36D
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=
=3Dutf-8"></head><body dir=3D"auto"><br><br><div dir=3D"ltr"><span style=3D=
"font-size: 13pt;">Christophe</span><div><span style=3D"font-size: 13pt;">(=
</span><span style=3D"background-color: rgba(255, 255, 255, 0);">Typos are =
from my iPhone)</span></div></div><div dir=3D"ltr"><br><blockquote type=3D"=
cite">Le 28 janv. 2021 =C3=A0 21:24, Marc-Andr=C3=A9 Lureau &lt;marcandre.l=
ureau@gmail.com&gt; a =C3=A9crit&nbsp;:<br><br></blockquote></div><blockquo=
te type=3D"cite"><div dir=3D"ltr">=EF=BB=BF<div dir=3D"ltr"><div dir=3D"ltr=
">Hi<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmai=
l_attr">On Thu, Jan 28, 2021 at 9:14 PM Gerd Hoffmann &lt;<a href=3D"mailto=
:kraxel@redhat.com">kraxel@redhat.com</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">&nbsp; Hi folks,<br>
<br>
I'm looking for a good way to implement cut+paste support for vnc.<br>
<br>
The vnc core protocol has support for text/plain cut+paste, and there<br>
is an extension adding support for other formats.&nbsp; That'll cover one<b=
r>
part of the problem, exchanging cut+paste data between vnc client and<br>
qemu vnc server.<br>
<br>
The tricky part is the second: the guest &lt;=3D&gt; qemu communication.<br=
>
I see basically two possible approaches here:<br>
<br>
&nbsp; (1) Have some guest agent (spice does it that way).<br>
&nbsp; &nbsp; &nbsp; Advantage: more flexible, allows more features.<br>
&nbsp; &nbsp; &nbsp; Disadvantage: requires agent in the guest.<br>
<br>
&nbsp; (2) Send text as key events.<br>
&nbsp; &nbsp; &nbsp; Advantage: no guest agent needed.<br>
&nbsp; &nbsp; &nbsp; Disadvantage: is translated by guests keyboard map, so=
 qemu<br>
&nbsp; &nbsp; &nbsp; needs to know the map for proper char -&gt; key event =
translation.<br>
&nbsp; &nbsp; &nbsp; Only works for text/plain and only for chars you can e=
asily<br>
&nbsp; &nbsp; &nbsp; type, anything needing input methods (emoji =F0=9F=98=
=8A for example)<br>
&nbsp; &nbsp; &nbsp; isn't going to fly.<br>
<br>
I think that (1) is clearly the better way.&nbsp; Given that the agent<br>
would need to run in user wayland/xorg session context the existing<br>
qemu-guest-agent will not work.&nbsp; Also linking against some UI library<=
br>
like gtk3 for clipboard handling is not something we want for the<br>
qemu-guest-agent.&nbsp; So we need another one, I'll name it<br>
qemu-clipboard-agent for the rest of this mail.&nbsp; And we need a<br>
communication channel.<br>
<br>
I'd tend to model the qemu-clipboard-agent simliar to the<br>
qemu-guest-agent, i.e. have some stream as communication path and run<br>
some stream protocol over it.<br>
<br>
Stream options I see are (in order of personal preference):<br>
<br>
&nbsp; (1) New virtio-serial port.&nbsp; virtio-serial likely is there anyw=
ay<br>
&nbsp; &nbsp; &nbsp; for the qemu-guest-agent ...<br>
<br>
&nbsp; (2) Have qemu-clipboard-agent and qemu-guest-agent share the agent<b=
r>
&nbsp; &nbsp; &nbsp; channel, i.e. qemu-clipboard-agent will proxy everythi=
ng through<br>
&nbsp; &nbsp; &nbsp; qemu-guest-agent (spice does it that way).<br>
<br>
Protocol options I see are (not sure yet which to prefer, need to have<br>
a closer look at the candidates):<br>
<br>
&nbsp; (1) Add clipboard commands to QMP and use these.<br>
<br>
&nbsp; (2) Reuse the clipboard bits of the vnc protocol (forward<br>
&nbsp; &nbsp; &nbsp; VNC_MSG_CLIENT_CUT_TEXT messages to the guest agent)<b=
r>
<br>
&nbsp; (3) Reuse the clipboard bits of the spice-agent protocol.<br>
<br>
&nbsp; (4) Reuse the clipboard bits of the wayland protocol.<br>
<br>
Once we have sorted the qemu &lt;-&gt; guest communication path it should b=
e<br>
possible to also hook up other UIs (specifically gtk) without too much<br>
effort.&nbsp; Which probably makes (2) a rather poor choice.<br>
<br>
Comments?<br>
Suggestions?<br>
Other ideas?<br>
</blockquote></div><div><br></div><div><br></div><div>I also had recently s=
ome thoughts about how to implement clipboard sharing in a more general way=
 for QEMU.</div><div><br></div><div>I admit I like Christophe's suggestion =
("it's somebody else problem"), but it falls short to me as I don't know of=
 a common open-source remoting solution for various operating systems, and =
I don't see how it could integrate well with our UI and remote protocols. O=
r look at reusing some VirtualBox code perhaps?<br></div></div></div></bloc=
kquote><div><br></div><div>Just to clarify, I did not think of my suggestio=
n as =E2=80=9CSEP=E2=80=9D but more as a way to leverage existing knowledge=
 regarding guest OS clipboard. More a =E2=80=9Cwhat should we steal=E2=80=
=9D approach.&nbsp;</div><br><blockquote type=3D"cite"><div dir=3D"ltr"><di=
v dir=3D"ltr"><div><br></div><div>Some things I keep in mind:</div><div>- t=
he spice protocol had a number of iterations to fix some races. It would be=
 great not to repeat the same mistakes, and I don't know if VNC have the sa=
me flaws or not.</div><div>- the spice agent design isn't great: the system=
 agent proxies messages to the active session. It would be nice if the new =
solution didn't have such a middle-man.<br></div><div>- with wayland, clipb=
oard sharing isn't really possible. Or not in a seamless way at least. Toda=
y it kinda works with some X11 compatibility extensions, but this will even=
tually go away or change behaviour.</div><div>- the GNOME desktop is workin=
g on remoting using RDP, and they are implementing a DBus interface for it =
(<a href=3D"https://gitlab.gnome.org/jadahl/mutter/-/commits/wip/remote-des=
ktop-clipboard">https://gitlab.gnome.org/jadahl/mutter/-/commits/wip/remote=
-desktop-clipboard</a>)</div><div>- it's not just about clipboard. We would=
 also want to have some kind of drag and drop (even if limited to files lik=
e Spice atm). We may want some windowing integration. We may also want to h=
ave access to some desktop services: apps, documents etc.. And what's not.<=
/div><div><br></div><div>That leads me to think that virtio-serial is not v=
ery well suited, as it doesn't allow various services / processes to come a=
nd go. I see vsock as a much better alternative. (I also wonder if it handl=
es control flow any better btw)</div><div><br></div><div>I think we shoud w=
ork on getting the free desktops our best-class support. To me, this means =
we need to speak the lingua franca, which is DBus. The great thing is that =
DBus is also equipped to handle services that come and go, handling discove=
ry, introspection etc. Various services are already available. As mentioned=
 earlier, that's what the GNOME desktop will offer for clipboard sharing. T=
here are good chances other desktops will follow if that design works, as i=
t should be easy for them to implement the same service. That means good re=
use of existing desktop code. Speaking DBus on Windows, MacOS or Android is=
n't an issue. However, vsock support may be a bit tricky atm.</div><div><br=
></div><div>Fwiw, DBus doesn't yet officially support vsock connections: <a=
 href=3D"https://gitlab.freedesktop.org/dbus/dbus/-/merge_requests/200">htt=
ps://gitlab.freedesktop.org/dbus/dbus/-/merge_requests/200</a>. This a mino=
r detail, as once you give it a fd for transport, it doesn't really care (I=
 also took care of glib!1892 and Rust zbus)<br></div><div><br></div><div>Oh=
 and of course, since this is a new daemon, it would be really a shame not =
to write it in a modern language (hint! ;-).</div><div><br></div><div>Hope =
that helps,</div><div><br></div><div>-- <br><div dir=3D"ltr" class=3D"gmail=
_signature">Marc-Andr=C3=A9 Lureau<br></div></div></div>
</div></blockquote></body></html>
--Apple-Mail-F94A07E4-D082-497C-B557-89484518E36D--


