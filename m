Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D76804FF83A
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Apr 2022 15:52:45 +0200 (CEST)
Received: from localhost ([::1]:35152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nedQK-0002WD-ML
	for lists+qemu-devel@lfdr.de; Wed, 13 Apr 2022 09:52:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1nedPA-0001l6-Vp
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 09:51:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1nedP8-0005GP-Cf
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 09:51:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649857889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3+RN/O7KZtERaUHZOw2MGP7mxeGDEJvz2CkBuzzrofI=;
 b=ZbBZyNoJ+Jtlk467C7rbtYcluAyfGQO6iNtibEtiZ8qGMHyDaEnG7KMs/tw3YX/6fsBosY
 SpVkPy634dyd9uo1VkhnPbXHi9e2wip9L0WA142mQ4Z8Ls/eE4p0cOjm7GCXv8Rr6jxGE8
 AAJSGUCZvjS1CNzRetyNBOWcZJuLsCQ=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-568-s5sYfxYVP3e35RsZtDK8zA-1; Wed, 13 Apr 2022 09:51:28 -0400
X-MC-Unique: s5sYfxYVP3e35RsZtDK8zA-1
Received: by mail-yw1-f200.google.com with SMTP id
 00721157ae682-2e644c76556so17142667b3.15
 for <qemu-devel@nongnu.org>; Wed, 13 Apr 2022 06:51:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3+RN/O7KZtERaUHZOw2MGP7mxeGDEJvz2CkBuzzrofI=;
 b=247C/XQRjcGsCf0hr8TsrlpKy5dQTrppi1QM/A9nPPc2szIDIgajZuP0byEX4izgLY
 vcblza4I+8E96CmeCbBdz5Hxz0IF3brzQIX0DV29Lye+SxinzLRzhJlYw2X6/Xv2hwSR
 pFc5VgUj0AJ1K5mdRrhM0+SwFcjD595wY/EiSprpcqg3Z98hWE+n3z9uE1cDjFHrrpjL
 UXB0ZkSem9l87tynNIzFzWleQgvSO2oTakfKJdV5zxgG+hEKwH85VrOOvyvwapgRasIJ
 Ef2yCDj6xl0Sck9iU/DR7zjcx2hoqx2tLwmCTgHlUF2mqw/p28fc9W/HxgftobiQiKDB
 VDmg==
X-Gm-Message-State: AOAM533hidKCFu9PII1G14B1G21MQlzglwWNyqr97tC7f4tCdq2VqyC6
 f/RBmJzZ5hpk49IJp+HaynVvVdNwOooXRcNuv4LbhKf4cR389qziRAeegGKywhAA77TXeOPiuL7
 T2pHd1JAI4X1Jg+ICTo3AXriuGrTV2vY=
X-Received: by 2002:a81:170d:0:b0:2eb:ef66:a9f2 with SMTP id
 13-20020a81170d000000b002ebef66a9f2mr19821230ywx.402.1649857887778; 
 Wed, 13 Apr 2022 06:51:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwmyThTjEUgVkk1+Fzngoep7bI5UXi/umFWP5a/Ib371rGFt9yUY1ebn5S/JwfZgTS7miIzctJVWdVa46aZX9o=
X-Received: by 2002:a81:170d:0:b0:2eb:ef66:a9f2 with SMTP id
 13-20020a81170d000000b002ebef66a9f2mr19821219ywx.402.1649857887600; Wed, 13
 Apr 2022 06:51:27 -0700 (PDT)
MIME-Version: 1.0
References: <CAMUS3ta+RFL1M+esUzy34WpB-MOO4ofKdsPiHOUoPyBXF2GoTw@mail.gmail.com>
 <CAPMcbCoM1UOw8r=mZchbuX9ixoMS3Q4t1xs1GRyWrkmP2c94tQ@mail.gmail.com>
 <CAMUS3tZp4GMjf_b4JNJtzMsU+n=whtqsG+QgYsnRXLjzx1xstw@mail.gmail.com>
In-Reply-To: <CAMUS3tZp4GMjf_b4JNJtzMsU+n=whtqsG+QgYsnRXLjzx1xstw@mail.gmail.com>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Wed, 13 Apr 2022 16:51:16 +0300
Message-ID: <CAPMcbCqpC-h=1U5kSLaQjeo3U3wKW0uwTjvh83O8UTLNGuG3QQ@mail.gmail.com>
Subject: Re: FSFreeze on Windows VM
To: Shelly Kagan <skagan@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kkostiuk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000005216b705dc8979ae"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_REMOTE_IMAGE=0.01,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Yan Vugenfirer <yvugenfi@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000005216b705dc8979ae
Content-Type: text/plain; charset="UTF-8"

Hi Shelly,

Thanks for your answer. Your version of GuestAgent is too old. The latest
version is 103.0.0.
Version 100.0.0 has a bug related to wrong error messages. When you try to
freeze FS, GA can return an error that the GA is not available.

Please try again with the latest version. I think it should work fine. If
you still will have problems, will try to debug them.

Best Regards,
Konstantin Kostiuk.


On Wed, Apr 13, 2022 at 10:03 AM Shelly Kagan <skagan@redhat.com> wrote:

> Hi Konstantin,
>
> The Guest Agent version
> "guestAgentVersion": "100.0.0",
> I'm running with a 2019 windows image which I understand the GA is part of
> the virtio drivers.
> Don't know if the following info also helps but:
>   "hostname": "WIN-CUCKQ65DH6K",
>   "os": {
>     "name": "Microsoft Windows",
>     "kernelRelease": "17763",
>     "version": "Microsoft Windows Server 2019",
>     "prettyName": "Windows Server 2019 Standard",
>     "versionId": "2019",
>     "kernelVersion": "10.0",
>     "machine": "x86_64",
>     "id": "mswindows"
>   },
>
> I think what is more important to me is the GA being not responsive for
> the freeze call. I'm using the fsfreeze in a feature I'm implementing, and
> since in windows there is a 10sec timeout because of the VSS the fact that
> the freeze call returns error that the GA is not available plus that when
> its not available it takes much longer for the freeze call to return is
> really time sensitive.
>
> Thanks
>
> On Wed, Apr 6, 2022 at 2:29 PM Konstantin Kostiuk <kkostiuk@redhat.com>
> wrote:
>
>> Hi Shelly,
>>
>> Can you provide your version of Guest Agent? Is it built from upstream or
>> some VirtIO-Win release?
>> Previously we had some issues related to wrong error messages from Guest
>> Agent.
>>
>> Best Regards,
>> Konstantin Kostiuk.
>>
>>
>> On Tue, Mar 29, 2022 at 6:24 PM Shelly Kagan <skagan@redhat.com> wrote:
>>
>>> Hi all,
>>> I'm having some weird behavior with fsfreeze in windows VM.
>>> I run the fsfreeze and it returns:
>>> `error: Guest agent is not responding: Guest agent not available for now`
>>>
>>> but checking the status returned frozen, rerunning it again returns that
>>> the command is not enabled (expected since the freeze occurs)
>>>
>>> I checked the fsstatus and it keeps returning `frozen` even after 10
>>> seconds (from my understanding the freeze in windows vm is limited to 10
>>> seconds by default by the VSS. No way to change this default from my
>>> understanding, is it true?) Shouldn't the status return thawed if the VSS
>>> no longer keeps the freeze state?
>>>
>>> After a minute I did the thaw and it returned error:
>>> `error: internal error: unable to execute QEMU agent command
>>> 'guest-fsfreeze-thaw': couldn't hold writes: fsfreeze is limited up to 10
>>> seconds:`
>>>
>>> but the fsstatus changed to thawed after that call.
>>>
>>> My questions are:
>>> 1. Why would the fsfreeze return error about the guest agent but still
>>> freeze the fs?
>>> 2. Why would the guest agent not respond, is there a way to make sure it
>>> is available before the freeze command? (running the fsstatus command
>>> before it returned without issues..)
>>> 3. Is it expected that the fsstatus will return frozen even if possibly
>>> VSS has already thawed? and that the thaw fails but the status do change
>>> after to thawed?
>>>
>>> Thanks for taking the time to respond and help,
>>> --
>>>
>>> Shelly Kagan
>>>
>>> Senior Software Engineer
>>>
>>> Red Hat <https://www.redhat.com>
>>> <https://www.redhat.com>
>>>
>>
>
> --
>
> Shelly Kagan
>
> Senior Software Engineer
>
> Red Hat <https://www.redhat.com>
> <https://www.redhat.com>
>

--0000000000005216b705dc8979ae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Shelly,</div><div><br></div><div>Thanks for your a=
nswer. Your version of GuestAgent is too old. The latest version is 103.0.0=
. <br></div><div>Version 100.0.0 has a bug related to wrong error messages.=
 When you try to freeze FS, GA can return an error that the GA is not avail=
able.</div><div><br></div><div>Please try again with the latest version. I =
think it should work fine. If you still will have problems, will try to deb=
ug them. <br></div><div><br></div><div><div><div dir=3D"ltr" class=3D"gmail=
_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div>Best R=
egards,</div><div>Konstantin Kostiuk.</div></div></div></div><br></div></di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On W=
ed, Apr 13, 2022 at 10:03 AM Shelly Kagan &lt;<a href=3D"mailto:skagan@redh=
at.com">skagan@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex"><div dir=3D"ltr">Hi Konstantin,<div><br></div><div=
>The Guest Agent version=C2=A0</div><div>&quot;guestAgentVersion&quot;: &qu=
ot;100.0.0&quot;,<br></div><div>I&#39;m running=C2=A0with a 2019 windows im=
age which I understand the GA is part of the virtio drivers.</div><div>Don&=
#39;t know if the following info also helps but:<br>=C2=A0 &quot;hostname&q=
uot;: &quot;WIN-CUCKQ65DH6K&quot;,<br>=C2=A0 &quot;os&quot;: {<br>=C2=A0 =
=C2=A0 &quot;name&quot;: &quot;Microsoft Windows&quot;,<br>=C2=A0 =C2=A0 &q=
uot;kernelRelease&quot;: &quot;17763&quot;,<br>=C2=A0 =C2=A0 &quot;version&=
quot;: &quot;Microsoft Windows Server 2019&quot;,<br>=C2=A0 =C2=A0 &quot;pr=
ettyName&quot;: &quot;Windows Server 2019 Standard&quot;,<br>=C2=A0 =C2=A0 =
&quot;versionId&quot;: &quot;2019&quot;,<br>=C2=A0 =C2=A0 &quot;kernelVersi=
on&quot;: &quot;10.0&quot;,<br>=C2=A0 =C2=A0 &quot;machine&quot;: &quot;x86=
_64&quot;,<br>=C2=A0 =C2=A0 &quot;id&quot;: &quot;mswindows&quot;<br>=C2=A0=
 },<br></div><div><br></div><div>I think what is more important to me is th=
e GA being not responsive for the freeze call. I&#39;m using the fsfreeze i=
n a feature I&#39;m implementing, and since in windows there is a 10sec=C2=
=A0timeout because of the VSS the fact that the freeze call returns error t=
hat the GA is not available plus that when its not available it takes much =
longer for the freeze call to return is really time sensitive.</div><div><b=
r></div><div>Thanks</div></div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Wed, Apr 6, 2022 at 2:29 PM Konstantin Kostiuk =
&lt;<a href=3D"mailto:kkostiuk@redhat.com" target=3D"_blank">kkostiuk@redha=
t.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex"><div dir=3D"ltr"><div>Hi Shelly,</div><div><br></div><div>Can you prov=
ide your version of Guest Agent? Is it built from upstream or some VirtIO-W=
in release? <br></div><div>Previously we had some issues related to wrong e=
rror messages from Guest Agent.</div><div><div><div><br></div><div><div><di=
v dir=3D"ltr"><div dir=3D"ltr"><div>Best Regards,</div><div>Konstantin Kost=
iuk.</div></div></div></div><br></div></div></div></div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 29, 2022 at 6=
:24 PM Shelly Kagan &lt;<a href=3D"mailto:skagan@redhat.com" target=3D"_bla=
nk">skagan@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex"><div dir=3D"ltr"><div>Hi all,</div><div>I&#39;m having=
 some weird behavior with fsfreeze in windows VM.</div><div>I run the fsfre=
eze and it returns:</div><div>`error: Guest agent is not responding: Guest =
agent not available for now`</div><div><br>but checking the status returned=
 frozen, rerunning it again returns that the command is not enabled (expect=
ed since the freeze occurs)</div><div><br>I checked the fsstatus and it kee=
ps returning `frozen` even after 10 seconds (from my understanding=C2=A0the=
 freeze in windows vm is limited to 10 seconds by default by the VSS. No wa=
y to change this default=C2=A0from my understanding, is it true?) Shouldn&#=
39;t the status return thawed if the VSS no longer keeps the freeze state?<=
/div><div><br>After a minute I did the thaw and it returned error:</div><di=
v>`error: internal error: unable to execute QEMU agent command &#39;guest-f=
sfreeze-thaw&#39;: couldn&#39;t hold writes: fsfreeze is limited up to 10 s=
econds:`</div><div><br></div><div>but the fsstatus changed to thawed after =
that call.<br></div><div><br></div><div>My questions are:</div><div>1. Why =
would the fsfreeze return error about the guest agent but still freeze the =
fs?</div><div>2. Why would the guest agent not respond, is there a way to m=
ake sure it is available before the freeze command? (running the fsstatus=
=C2=A0command before it returned without issues..)</div><div>3. Is it expec=
ted that the fsstatus will return frozen even if possibly VSS has already t=
hawed? and that the thaw fails but the status do change after to thawed?</d=
iv><div><br></div><div>Thanks for taking the time to respond and help,</div=
>-- <br><div dir=3D"ltr"><div dir=3D"ltr"><div>
        <p style=3D"font-weight:bold;margin:0px;padding:0px;font-size:14px;=
font-family:RedHatText,sans-serif">
          <span>Shelly</span> <span>Kagan</span><span style=3D"color:rgb(17=
0,170,170);margin:0px"></span>
        </p>
       =20
        <p style=3D"font-weight:normal;font-size:12px;margin:0px;font-famil=
y:RedHatText,sans-serif">
          <span>Senior Software Engineer</span>
        </p>
        <p style=3D"font-weight:normal;margin:0px 0px 4px;font-size:12px;fo=
nt-family:RedHatText,sans-serif">
          <a style=3D"color:rgb(0,136,206);font-size:12px;margin:0px;text-d=
ecoration:none;font-family:RedHatText,sans-serif" href=3D"https://www.redha=
t.com" target=3D"_blank">Red Hat <span></span></a>
        </p>
    <div style=3D"margin-bottom:4px">
     =20
     =20
    </div>
   =20
   =20

    =20

   =20

    <div style=3D"margin-top:12px">
      <table border=3D"0">
        <tbody><tr>
          <td width=3D"100px"><a href=3D"https://www.redhat.com" target=3D"=
_blank"> <img src=3D"https://static.redhat.com/libs/redhat/brand-assets/2/c=
orp/logo--200.png" width=3D"90" height=3D"auto"></a> </td>
         =20
        </tr>
      </tbody></table>
    </div>

  </div></div></div></div>
</blockquote></div>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr"><div>
        <p style=3D"font-weight:bold;margin:0px;padding:0px;font-size:14px;=
font-family:RedHatText,sans-serif">
          <span>Shelly</span> <span>Kagan</span><span style=3D"color:rgb(17=
0,170,170);margin:0px"></span>
        </p>
       =20
        <p style=3D"font-weight:normal;font-size:12px;margin:0px;font-famil=
y:RedHatText,sans-serif">
          <span>Senior Software Engineer</span>
        </p>
        <p style=3D"font-weight:normal;margin:0px 0px 4px;font-size:12px;fo=
nt-family:RedHatText,sans-serif">
          <a style=3D"color:rgb(0,136,206);font-size:12px;margin:0px;text-d=
ecoration:none;font-family:RedHatText,sans-serif" href=3D"https://www.redha=
t.com" target=3D"_blank">Red Hat <span></span></a>
        </p>
    <div style=3D"margin-bottom:4px">
     =20
     =20
    </div>
   =20
   =20

    =20

   =20

    <div style=3D"margin-top:12px">
      <table border=3D"0">
        <tbody><tr>
          <td width=3D"100px"><a href=3D"https://www.redhat.com" target=3D"=
_blank"> <img src=3D"https://static.redhat.com/libs/redhat/brand-assets/2/c=
orp/logo--200.png" width=3D"90" height=3D"auto"></a> </td>
         =20
        </tr>
      </tbody></table>
    </div>

  </div></div></div>
</blockquote></div>

--0000000000005216b705dc8979ae--


