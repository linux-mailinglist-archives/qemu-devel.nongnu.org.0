Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97383332632
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 14:13:18 +0100 (CET)
Received: from localhost ([::1]:35412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJcAn-0006at-0Y
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 08:13:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yvugenfi@redhat.com>)
 id 1lJbWw-00047a-SG
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 07:32:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <yvugenfi@redhat.com>)
 id 1lJbWs-0001DA-Ha
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 07:32:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615293121;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UrXVODly6I08ES7WBT26PuHUZBajh3oz/wacL3sMg50=;
 b=LwWx7nqmsdIXnBJ7tv2KRSAxn+heqKyAz22Y/AIRR2Gt/Ju7hWexWJweP0j9Vz0zT1Opys
 iDDcU9TZWMEXszEpjO+Bc/uSfvh5hSDAtG6DQCaGzb2UZ/dxyxvNYjWoWUcBhiqc/623q7
 XgMypO2A8zy/UjAVdLV8DhtN938yc7I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-518-frYdxRxmOYG2UjtjR1okOA-1; Tue, 09 Mar 2021 07:30:43 -0500
X-MC-Unique: frYdxRxmOYG2UjtjR1okOA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 25E2E801814;
 Tue,  9 Mar 2021 12:30:42 +0000 (UTC)
Received: from [10.35.207.23] (unknown [10.35.207.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DFFD86062F;
 Tue,  9 Mar 2021 12:30:39 +0000 (UTC)
From: Yan Vugenfirer <yvugenfi@redhat.com>
Message-Id: <9FFFC757-FD77-4683-8A7F-A39E2337EE2F@redhat.com>
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: [RFC PATCH v3 02/10] net: Pad short frames to minimum size before
 send from SLiRP/TAP
Date: Tue, 9 Mar 2021 14:30:35 +0200
In-Reply-To: <CAFEAcA89xLMogR5-tUH-LW37Lr+py3LXQRgaO9_P8r8w-0gfzA@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210303191205.1656980-1-philmd@redhat.com>
 <20210303191205.1656980-3-philmd@redhat.com>
 <36123f35-06ab-d0da-37d2-6f8324e7f582@redhat.com>
 <CAFEAcA-REYy45Jmean0PhVerG9d_CpqgaFtxuWBMBrGDdyzvdA@mail.gmail.com>
 <edce617c-3591-a172-ad18-3bf138af26e0@redhat.com>
 <CAEUhbmU-KDUBADcX+bZHjH0thhddTSQ=Qtb56GztdRzPKE4Xhw@mail.gmail.com>
 <a26ef919-2e00-ae5b-c016-83e811ea5cdd@redhat.com>
 <CAEUhbmWdn8ZV1vNku_7dQfNg68xL6p3f-BCzq31jj5QAKmjj0w@mail.gmail.com>
 <CAEUhbmUY89OEpBpxCZzya=KKb1U5KBO=rPArn8yre7fmZe1q5A@mail.gmail.com>
 <CAFEAcA89xLMogR5-tUH-LW37Lr+py3LXQRgaO9_P8r8w-0gfzA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=yvugenfi@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_EAD99563-9153-4040-8623-EA6DF6E3C212"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=yvugenfi@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Jason Wang <jasowang@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Bin Meng <bmeng.cn@gmail.com>,
 =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Apple-Mail=_EAD99563-9153-4040-8623-EA6DF6E3C212
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On 9 Mar 2021, at 12:13 PM, Peter Maydell <peter.maydell@linaro.org> wrot=
e:
>=20
> On Tue, 9 Mar 2021 at 09:01, Bin Meng <bmeng.cn@gmail.com <mailto:bmeng.c=
n@gmail.com>> wrote:
>>=20
>> Hi Jason,
>>=20
>> On Tue, Mar 9, 2021 at 5:00 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>>>=20
>>> Hi Jason,
>>>=20
>>> On Tue, Mar 9, 2021 at 4:57 PM Jason Wang <jasowang@redhat.com> wrote:
>>>>=20
>>>>=20
>>>> On 2021/3/9 4:35 =E4=B8=8B=E5=8D=88, Bin Meng wrote:
>>>>> Hi Jason,
>>>>>=20
>>>>> On Tue, Mar 9, 2021 at 4:23 PM Jason Wang <jasowang@redhat.com> wrote=
:
>>>>>>=20
>>>>>> On 2021/3/8 6:22 =E4=B8=8B=E5=8D=88, Peter Maydell wrote:
>>>>>>> I think the key thing we need to do here is make a decision
>>>>>>> and be clear about what we're doing. There are three options
>>>>>>> I can see:
>>>>>>>=20
>>>>>>> (1) we say that the net API demands that backends pad
>>>>>>> packets they emit to the minimum ethernet frame length
>>>>>>> unless they specifically are intending to emit a short frame,
>>>>>>> and we fix any backends that don't comply (or equivalently,
>>>>>>> add support in the core code for a backend to mark itself
>>>>>>> as "I don't pad; please do it for me").
>>>>>>>=20
>>>>>>> (2) we say that the networking subsystem doesn't support
>>>>>>> short packets, and just have the common code always enforce
>>>>>>> padding short frames to the minimum length somewhere between
>>>>>>> when it receives a packet from a backend and passes it to
>>>>>>> a NIC model.
>>>>>>>=20
>>>>>>> (3) we say that it's the job of the NIC models to pad
>>>>>>> short frames as they see them coming in.
>=20
>>>>>> I'm not sure how much value we can gain from (1). So (2) looks bette=
r to me.
>>>>>>=20
>>>>>> Bin or Philippe, want to send a new version?
>>>>>>=20
>>>>> I think this series does what (2) asks for. Or am I missing anything?
>>>>=20
>>>>=20
>>>> It only did the padding for user/TAP.
>>>=20
>>=20
>> (hit send too soon ...)
>>=20
>> Ah, so we want this:
>>=20
>> if (sender->info->type !=3D NET_CLIENT_DRIVER_NIC)
>>=20
>> correct?
>=20
> No, option (2) is "always pad short packets regardless of
> sender->info->type". Even if a NIC driver sends out a short
> packet, we want to pad it, because we might be feeding it to
> something that assumes it does not see short packets.

Some thought on this option - in such case with virtio-net, can we also get=
 an indication from the device that the packet will be padded?
Currently we are padding short packets in Windows driver (this is MS certif=
ication requirement), and it will be nice not do to this in the guest if de=
vice will announce such capability.

Best regards,
Yan.

>=20
> thanks
> -- PMM


--Apple-Mail=_EAD99563-9153-4040-8623-EA6DF6E3C212
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=3Dutf-8"></head><body style=3D"word-wrap: break-word; -webkit-nbsp-mode: s=
pace; line-break: after-white-space;" class=3D""><br class=3D""><div><br cl=
ass=3D""><blockquote type=3D"cite" class=3D""><div class=3D"">On 9 Mar 2021=
, at 12:13 PM, Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org=
" class=3D"">peter.maydell@linaro.org</a>&gt; wrote:</div><br class=3D"Appl=
e-interchange-newline"><div class=3D""><meta charset=3D"UTF-8" class=3D""><=
span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size:=
 14px; font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; text-align: start; text-indent: 0px; text-transform=
: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: =
0px; text-decoration: none; float: none; display: inline !important;" class=
=3D"">On Tue, 9 Mar 2021 at 09:01, Bin Meng &lt;</span><a href=3D"mailto:bm=
eng.cn@gmail.com" style=3D"font-family: Helvetica; font-size: 14px; font-st=
yle: normal; font-variant-caps: normal; font-weight: normal; letter-spacing=
: normal; orphans: auto; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text=
-size-adjust: auto; -webkit-text-stroke-width: 0px;" class=3D"">bmeng.cn@gm=
ail.com</a><span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica=
; font-size: 14px; font-style: normal; font-variant-caps: normal; font-weig=
ht: normal; letter-spacing: normal; text-align: start; text-indent: 0px; te=
xt-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-st=
roke-width: 0px; text-decoration: none; float: none; display: inline !impor=
tant;" class=3D"">&gt; wrote:</span><br style=3D"caret-color: rgb(0, 0, 0);=
 font-family: Helvetica; font-size: 14px; font-style: normal; font-variant-=
caps: normal; font-weight: normal; letter-spacing: normal; text-align: star=
t; text-indent: 0px; text-transform: none; white-space: normal; word-spacin=
g: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">=
<blockquote type=3D"cite" style=3D"font-family: Helvetica; font-size: 14px;=
 font-style: normal; font-variant-caps: normal; font-weight: normal; letter=
-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-=
transform: none; white-space: normal; widows: auto; word-spacing: 0px; -web=
kit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration=
: none;" class=3D""><br class=3D"">Hi Jason,<br class=3D""><br class=3D"">O=
n Tue, Mar 9, 2021 at 5:00 PM Bin Meng &lt;<a href=3D"mailto:bmeng.cn@gmail=
.com" class=3D"">bmeng.cn@gmail.com</a>&gt; wrote:<br class=3D""><blockquot=
e type=3D"cite" class=3D""><br class=3D"">Hi Jason,<br class=3D""><br class=
=3D"">On Tue, Mar 9, 2021 at 4:57 PM Jason Wang &lt;<a href=3D"mailto:jasow=
ang@redhat.com" class=3D"">jasowang@redhat.com</a>&gt; wrote:<br class=3D""=
><blockquote type=3D"cite" class=3D""><br class=3D""><br class=3D"">On 2021=
/3/9 4:35 =E4=B8=8B=E5=8D=88, Bin Meng wrote:<br class=3D""><blockquote typ=
e=3D"cite" class=3D"">Hi Jason,<br class=3D""><br class=3D"">On Tue, Mar 9,=
 2021 at 4:23 PM Jason Wang &lt;<a href=3D"mailto:jasowang@redhat.com" clas=
s=3D"">jasowang@redhat.com</a>&gt; wrote:<br class=3D""><blockquote type=3D=
"cite" class=3D""><br class=3D"">On 2021/3/8 6:22 =E4=B8=8B=E5=8D=88, Peter=
 Maydell wrote:<br class=3D""><blockquote type=3D"cite" class=3D"">I think =
the key thing we need to do here is make a decision<br class=3D"">and be cl=
ear about what we're doing. There are three options<br class=3D"">I can see=
:<br class=3D""><br class=3D"">(1) we say that the net API demands that bac=
kends pad<br class=3D"">packets they emit to the minimum ethernet frame len=
gth<br class=3D"">unless they specifically are intending to emit a short fr=
ame,<br class=3D"">and we fix any backends that don't comply (or equivalent=
ly,<br class=3D"">add support in the core code for a backend to mark itself=
<br class=3D"">as "I don't pad; please do it for me").<br class=3D""><br cl=
ass=3D"">(2) we say that the networking subsystem doesn't support<br class=
=3D"">short packets, and just have the common code always enforce<br class=
=3D"">padding short frames to the minimum length somewhere between<br class=
=3D"">when it receives a packet from a backend and passes it to<br class=3D=
"">a NIC model.<br class=3D""><br class=3D"">(3) we say that it's the job o=
f the NIC models to pad<br class=3D"">short frames as they see them coming =
in.<br class=3D""></blockquote></blockquote></blockquote></blockquote></blo=
ckquote></blockquote><br style=3D"caret-color: rgb(0, 0, 0); font-family: H=
elvetica; font-size: 14px; font-style: normal; font-variant-caps: normal; f=
ont-weight: normal; letter-spacing: normal; text-align: start; text-indent:=
 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit=
-text-stroke-width: 0px; text-decoration: none;" class=3D""><blockquote typ=
e=3D"cite" style=3D"font-family: Helvetica; font-size: 14px; font-style: no=
rmal; font-variant-caps: normal; font-weight: normal; letter-spacing: norma=
l; orphans: auto; text-align: start; text-indent: 0px; text-transform: none=
; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-a=
djust: auto; -webkit-text-stroke-width: 0px; text-decoration: none;" class=
=3D""><blockquote type=3D"cite" class=3D""><blockquote type=3D"cite" class=
=3D""><blockquote type=3D"cite" class=3D""><blockquote type=3D"cite" class=
=3D"">I'm not sure how much value we can gain from (1). So (2) looks better=
 to me.<br class=3D""><br class=3D"">Bin or Philippe, want to send a new ve=
rsion?<br class=3D""><br class=3D""></blockquote>I think this series does w=
hat (2) asks for. Or am I missing anything?<br class=3D""></blockquote><br =
class=3D""><br class=3D"">It only did the padding for user/TAP.<br class=3D=
""></blockquote><br class=3D""></blockquote><br class=3D"">(hit send too so=
on ...)<br class=3D""><br class=3D"">Ah, so we want this:<br class=3D""><br=
 class=3D"">if (sender-&gt;info-&gt;type !=3D NET_CLIENT_DRIVER_NIC)<br cla=
ss=3D""><br class=3D"">correct?<br class=3D""></blockquote><br style=3D"car=
et-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 14px; font-style=
: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: n=
ormal; text-align: start; text-indent: 0px; text-transform: none; white-spa=
ce: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decorat=
ion: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-famil=
y: Helvetica; font-size: 14px; font-style: normal; font-variant-caps: norma=
l; font-weight: normal; letter-spacing: normal; text-align: start; text-ind=
ent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; text-decoration: none; float: none; display: i=
nline !important;" class=3D"">No, option (2) is "always pad short packets r=
egardless of</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Hel=
vetica; font-size: 14px; font-style: normal; font-variant-caps: normal; fon=
t-weight: normal; letter-spacing: normal; text-align: start; text-indent: 0=
px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-t=
ext-stroke-width: 0px; text-decoration: none;" class=3D""><span style=3D"ca=
ret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 14px; font-styl=
e: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; white-sp=
ace: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decora=
tion: none; float: none; display: inline !important;" class=3D"">sender-&gt=
;info-&gt;type". Even if a NIC driver sends out a short</span><br style=3D"=
caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 14px; font-st=
yle: normal; font-variant-caps: normal; font-weight: normal; letter-spacing=
: normal; text-align: start; text-indent: 0px; text-transform: none; white-=
space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-deco=
ration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-fa=
mily: Helvetica; font-size: 14px; font-style: normal; font-variant-caps: no=
rmal; font-weight: normal; letter-spacing: normal; text-align: start; text-=
indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; display=
: inline !important;" class=3D"">packet, we want to pad it, because we migh=
t be feeding it to</span><br style=3D"caret-color: rgb(0, 0, 0); font-famil=
y: Helvetica; font-size: 14px; font-style: normal; font-variant-caps: norma=
l; font-weight: normal; letter-spacing: normal; text-align: start; text-ind=
ent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span style=
=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 14px; fon=
t-style: normal; font-variant-caps: normal; font-weight: normal; letter-spa=
cing: normal; text-align: start; text-indent: 0px; text-transform: none; wh=
ite-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-=
decoration: none; float: none; display: inline !important;" class=3D"">some=
thing that assumes it does not see short packets.</span><br style=3D"caret-=
color: rgb(0, 0, 0); font-family: Helvetica; font-size: 14px; font-style: n=
ormal; font-variant-caps: normal; font-weight: normal; letter-spacing: norm=
al; text-align: start; text-indent: 0px; text-transform: none; white-space:=
 normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration=
: none;" class=3D""></div></blockquote><div><br class=3D""></div>Some thoug=
ht on this option - in such case with virtio-net, can we also get an indica=
tion from the device that the packet will be padded?</div><div>Currently we=
 are padding short packets in Windows driver (this is MS certification requ=
irement), and it will be nice not do to this in the guest if device will an=
nounce such capability.</div><div><br class=3D""></div><div>Best regards,</=
div><div>Yan.</div><div><br class=3D""><blockquote type=3D"cite" class=3D""=
><div class=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helve=
tica; font-size: 14px; font-style: normal; font-variant-caps: normal; font-=
weight: normal; letter-spacing: normal; text-align: start; text-indent: 0px=
; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-tex=
t-stroke-width: 0px; text-decoration: none;" class=3D""><span style=3D"care=
t-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 14px; font-style:=
 normal; font-variant-caps: normal; font-weight: normal; letter-spacing: no=
rmal; text-align: start; text-indent: 0px; text-transform: none; white-spac=
e: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decorati=
on: none; float: none; display: inline !important;" class=3D"">thanks</span=
><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size:=
 14px; font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; text-align: start; text-indent: 0px; text-transform=
: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: =
0px; text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, =
0, 0); font-family: Helvetica; font-size: 14px; font-style: normal; font-va=
riant-caps: normal; font-weight: normal; letter-spacing: normal; text-align=
: start; text-indent: 0px; text-transform: none; white-space: normal; word-=
spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none; float:=
 none; display: inline !important;" class=3D"">-- PMM</span></div></blockqu=
ote></div><br class=3D""></body></html>
--Apple-Mail=_EAD99563-9153-4040-8623-EA6DF6E3C212--


