Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E87B4FF8F0
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Apr 2022 16:29:48 +0200 (CEST)
Received: from localhost ([::1]:60630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nee0B-0005sO-Ag
	for lists+qemu-devel@lfdr.de; Wed, 13 Apr 2022 10:29:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1nedyN-0004Wp-Se
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 10:27:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1nedyL-0005WA-JO
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 10:27:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649860073;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kWsUuvvSCi9Z8ud4CQNEALUjEDcbrwViXXbGDM0FWSY=;
 b=abrtS1F90N8qXsq6PqhqP44SRGJRrws3xOxvZkPdzmAc5WMr/RK6p64LV4CB+ryi4cajuf
 7v1Fh7KUi/thiPsMp4+xDR4xbgk8SIrHmw65OnJswR+MVYuRIAu0Tv3klqePVDBPlGQ4/w
 gzi7twy+n9+VM4mr10gPs8tP+45RF58=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-136-z-8IbvruOVuaIBMbCVxYvA-1; Wed, 13 Apr 2022 10:27:51 -0400
X-MC-Unique: z-8IbvruOVuaIBMbCVxYvA-1
Received: by mail-yw1-f200.google.com with SMTP id
 00721157ae682-2ec060cffa5so18333727b3.4
 for <qemu-devel@nongnu.org>; Wed, 13 Apr 2022 07:27:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kWsUuvvSCi9Z8ud4CQNEALUjEDcbrwViXXbGDM0FWSY=;
 b=SGabbBDqIsrUTw/HlmG8hebwuLQcENULOadtBAc87+qIU4iSWch6yBQ9vXuqdTHpPW
 wiRErUx+1R/t+CR8TkXJJHATrz7Qfoj+F5303kiNz18PSj3OQyxYKySSKCqqjbpUUVzR
 Od3I9jxLbbpkbp2I/iXva80brPKsl9GJiotuGNUvsZT+G1dEcwi1KoNdnC2O12RUFNn6
 b3kjAqZ2wTU9+U7SLxJrTUto/SZP7zi5ZlzRDb1gLhFKBjgLdjJE9ld1dOfDMxgjF25I
 UkKxooQFpDammvPBR5XYmOm+h2N9jyvynNdIhpp3AfSaxWLtdCZ0JqX6PUCkfflJnxC2
 rkdQ==
X-Gm-Message-State: AOAM533zjxnswza2AuOdrfQVVHU2LjrDrYqYzi4TkaweaK0JtfMFaTRw
 LmTYgfm8b4Ay6li5tbaSy1BUiiVUNl5yGI7d7eQcJBVICSDCgvzHQGbNucrYheWfeZf2zqfP+mF
 +BCdQziXg29ul/a1m2cYZwvXOJxwUx70=
X-Received: by 2002:a25:2e04:0:b0:641:d915:35c7 with SMTP id
 u4-20020a252e04000000b00641d91535c7mr1463051ybu.364.1649860071261; 
 Wed, 13 Apr 2022 07:27:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxglSEg2P/MSGqKmSA8yhdeAfgk1h6bXHVBefs7mS4nd6xf9lPjq5+r+VASLfvNJ8eB2WXcGCGUkTzWVspu4m4=
X-Received: by 2002:a25:2e04:0:b0:641:d915:35c7 with SMTP id
 u4-20020a252e04000000b00641d91535c7mr1463037ybu.364.1649860071081; Wed, 13
 Apr 2022 07:27:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAMUS3ta+RFL1M+esUzy34WpB-MOO4ofKdsPiHOUoPyBXF2GoTw@mail.gmail.com>
 <CAPMcbCoM1UOw8r=mZchbuX9ixoMS3Q4t1xs1GRyWrkmP2c94tQ@mail.gmail.com>
 <CAMUS3tZp4GMjf_b4JNJtzMsU+n=whtqsG+QgYsnRXLjzx1xstw@mail.gmail.com>
 <CAPMcbCqpC-h=1U5kSLaQjeo3U3wKW0uwTjvh83O8UTLNGuG3QQ@mail.gmail.com>
 <CAMUS3tbj_vTP3aPsR5yEh+-PGmsEA=09AE4LooD2ed=CPrjfWw@mail.gmail.com>
In-Reply-To: <CAMUS3tbj_vTP3aPsR5yEh+-PGmsEA=09AE4LooD2ed=CPrjfWw@mail.gmail.com>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Wed, 13 Apr 2022 17:27:39 +0300
Message-ID: <CAPMcbCrXZqioWmqaG7E6ZsoxYG42DcdDtfq3b03c6uh63at41g@mail.gmail.com>
Subject: Re: FSFreeze on Windows VM
To: Shelly Kagan <skagan@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kkostiuk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000775c5c05dc89fbd1"
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

--000000000000775c5c05dc89fbd1
Content-Type: text/plain; charset="UTF-8"

Hi Shelly,

You can use guest-ping commend to check that GA is alive. This command
should work always.

Best Regards,
Konstantin Kostiuk.


On Wed, Apr 13, 2022 at 5:21 PM Shelly Kagan <skagan@redhat.com> wrote:

> Hi Konstantin,
> Thanks for the quick response.
> I will look into getting a newer GA version.
> Regarding the GA not available, is it relevant to the newer versions? Is
> there a way to make sure the GA is available when running the freeze? when
> it is not available it takes a lot of time to get a response back and it
> causes the freeze to delay.
> Best Regards,
> Shelly
>
> On Wed, Apr 13, 2022 at 4:51 PM Konstantin Kostiuk <kkostiuk@redhat.com>
> wrote:
>
>> Hi Shelly,
>>
>> Thanks for your answer. Your version of GuestAgent is too old. The latest
>> version is 103.0.0.
>> Version 100.0.0 has a bug related to wrong error messages. When you try
>> to freeze FS, GA can return an error that the GA is not available.
>>
>> Please try again with the latest version. I think it should work fine. If
>> you still will have problems, will try to debug them.
>>
>> Best Regards,
>> Konstantin Kostiuk.
>>
>>
>> On Wed, Apr 13, 2022 at 10:03 AM Shelly Kagan <skagan@redhat.com> wrote:
>>
>>> Hi Konstantin,
>>>
>>> The Guest Agent version
>>> "guestAgentVersion": "100.0.0",
>>> I'm running with a 2019 windows image which I understand the GA is part
>>> of the virtio drivers.
>>> Don't know if the following info also helps but:
>>>   "hostname": "WIN-CUCKQ65DH6K",
>>>   "os": {
>>>     "name": "Microsoft Windows",
>>>     "kernelRelease": "17763",
>>>     "version": "Microsoft Windows Server 2019",
>>>     "prettyName": "Windows Server 2019 Standard",
>>>     "versionId": "2019",
>>>     "kernelVersion": "10.0",
>>>     "machine": "x86_64",
>>>     "id": "mswindows"
>>>   },
>>>
>>> I think what is more important to me is the GA being not responsive for
>>> the freeze call. I'm using the fsfreeze in a feature I'm implementing, and
>>> since in windows there is a 10sec timeout because of the VSS the fact that
>>> the freeze call returns error that the GA is not available plus that when
>>> its not available it takes much longer for the freeze call to return is
>>> really time sensitive.
>>>
>>> Thanks
>>>
>>> On Wed, Apr 6, 2022 at 2:29 PM Konstantin Kostiuk <kkostiuk@redhat.com>
>>> wrote:
>>>
>>>> Hi Shelly,
>>>>
>>>> Can you provide your version of Guest Agent? Is it built from upstream
>>>> or some VirtIO-Win release?
>>>> Previously we had some issues related to wrong error messages from
>>>> Guest Agent.
>>>>
>>>> Best Regards,
>>>> Konstantin Kostiuk.
>>>>
>>>>
>>>> On Tue, Mar 29, 2022 at 6:24 PM Shelly Kagan <skagan@redhat.com> wrote:
>>>>
>>>>> Hi all,
>>>>> I'm having some weird behavior with fsfreeze in windows VM.
>>>>> I run the fsfreeze and it returns:
>>>>> `error: Guest agent is not responding: Guest agent not available for
>>>>> now`
>>>>>
>>>>> but checking the status returned frozen, rerunning it again returns
>>>>> that the command is not enabled (expected since the freeze occurs)
>>>>>
>>>>> I checked the fsstatus and it keeps returning `frozen` even after 10
>>>>> seconds (from my understanding the freeze in windows vm is limited to 10
>>>>> seconds by default by the VSS. No way to change this default from my
>>>>> understanding, is it true?) Shouldn't the status return thawed if the VSS
>>>>> no longer keeps the freeze state?
>>>>>
>>>>> After a minute I did the thaw and it returned error:
>>>>> `error: internal error: unable to execute QEMU agent command
>>>>> 'guest-fsfreeze-thaw': couldn't hold writes: fsfreeze is limited up to 10
>>>>> seconds:`
>>>>>
>>>>> but the fsstatus changed to thawed after that call.
>>>>>
>>>>> My questions are:
>>>>> 1. Why would the fsfreeze return error about the guest agent but still
>>>>> freeze the fs?
>>>>> 2. Why would the guest agent not respond, is there a way to make sure
>>>>> it is available before the freeze command? (running the fsstatus command
>>>>> before it returned without issues..)
>>>>> 3. Is it expected that the fsstatus will return frozen even if
>>>>> possibly VSS has already thawed? and that the thaw fails but the status do
>>>>> change after to thawed?
>>>>>
>>>>> Thanks for taking the time to respond and help,
>>>>> --
>>>>>
>>>>> Shelly Kagan
>>>>>
>>>>> Senior Software Engineer
>>>>>
>>>>> Red Hat <https://www.redhat.com>
>>>>> <https://www.redhat.com>
>>>>>
>>>>
>>>
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

--000000000000775c5c05dc89fbd1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Shelly,</div><div><br></div><div>You can use <span=
 class=3D"gmail-pl-en">guest-ping commend to check that GA is alive. This c=
ommand should work always.<br></span></div><div><br></div><div><div><div><d=
iv dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"=
><div dir=3D"ltr"><div>Best Regards,</div><div>Konstantin Kostiuk.</div></d=
iv></div></div><br></div></div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Wed, Apr 13, 2022 at 5:21 PM Shelly Kagan=
 &lt;<a href=3D"mailto:skagan@redhat.com">skagan@redhat.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"=
>Hi=C2=A0Konstantin,<div>Thanks for the quick=C2=A0response.</div><div>I wi=
ll look into getting a newer GA version. <br>Regarding the GA not available=
, is it relevant to the newer versions? Is there a way to make sure the GA =
is available when running the freeze? when it is not available=C2=A0it take=
s a lot of time to get a response back and it causes the freeze to delay.</=
div><div>Best Regards,</div><div>Shelly</div></div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 13, 2022 at 4:51 P=
M Konstantin Kostiuk &lt;<a href=3D"mailto:kkostiuk@redhat.com" target=3D"_=
blank">kkostiuk@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><div dir=3D"ltr"><div>Hi Shelly,</div><div><br></=
div><div>Thanks for your answer. Your version of GuestAgent is too old. The=
 latest version is 103.0.0. <br></div><div>Version 100.0.0 has a bug relate=
d to wrong error messages. When you try to freeze FS, GA can return an erro=
r that the GA is not available.</div><div><br></div><div>Please try again w=
ith the latest version. I think it should work fine. If you still will have=
 problems, will try to debug them. <br></div><div><br></div><div><div><div =
dir=3D"ltr"><div dir=3D"ltr"><div>Best Regards,</div><div>Konstantin Kostiu=
k.</div></div></div></div><br></div></div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 13, 2022 at 10:03 AM Shelly=
 Kagan &lt;<a href=3D"mailto:skagan@redhat.com" target=3D"_blank">skagan@re=
dhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex"><div dir=3D"ltr">Hi Konstantin,<div><br></div><div>The Guest Agent =
version=C2=A0</div><div>&quot;guestAgentVersion&quot;: &quot;100.0.0&quot;,=
<br></div><div>I&#39;m running=C2=A0with a 2019 windows image which I under=
stand the GA is part of the virtio drivers.</div><div>Don&#39;t know if the=
 following info also helps but:<br>=C2=A0 &quot;hostname&quot;: &quot;WIN-C=
UCKQ65DH6K&quot;,<br>=C2=A0 &quot;os&quot;: {<br>=C2=A0 =C2=A0 &quot;name&q=
uot;: &quot;Microsoft Windows&quot;,<br>=C2=A0 =C2=A0 &quot;kernelRelease&q=
uot;: &quot;17763&quot;,<br>=C2=A0 =C2=A0 &quot;version&quot;: &quot;Micros=
oft Windows Server 2019&quot;,<br>=C2=A0 =C2=A0 &quot;prettyName&quot;: &qu=
ot;Windows Server 2019 Standard&quot;,<br>=C2=A0 =C2=A0 &quot;versionId&quo=
t;: &quot;2019&quot;,<br>=C2=A0 =C2=A0 &quot;kernelVersion&quot;: &quot;10.=
0&quot;,<br>=C2=A0 =C2=A0 &quot;machine&quot;: &quot;x86_64&quot;,<br>=C2=
=A0 =C2=A0 &quot;id&quot;: &quot;mswindows&quot;<br>=C2=A0 },<br></div><div=
><br></div><div>I think what is more important to me is the GA being not re=
sponsive for the freeze call. I&#39;m using the fsfreeze in a feature I&#39=
;m implementing, and since in windows there is a 10sec=C2=A0timeout because=
 of the VSS the fact that the freeze call returns error that the GA is not =
available plus that when its not available it takes much longer for the fre=
eze call to return is really time sensitive.</div><div><br></div><div>Thank=
s</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Wed, Apr 6, 2022 at 2:29 PM Konstantin Kostiuk &lt;<a href=3D"mai=
lto:kkostiuk@redhat.com" target=3D"_blank">kkostiuk@redhat.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"l=
tr"><div>Hi Shelly,</div><div><br></div><div>Can you provide your version o=
f Guest Agent? Is it built from upstream or some VirtIO-Win release? <br></=
div><div>Previously we had some issues related to wrong error messages from=
 Guest Agent.</div><div><div><div><br></div><div><div><div dir=3D"ltr"><div=
 dir=3D"ltr"><div>Best Regards,</div><div>Konstantin Kostiuk.</div></div></=
div></div><br></div></div></div></div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 29, 2022 at 6:24 PM Shelly Kaga=
n &lt;<a href=3D"mailto:skagan@redhat.com" target=3D"_blank">skagan@redhat.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><div dir=3D"ltr"><div>Hi all,</div><div>I&#39;m having some weird behavi=
or with fsfreeze in windows VM.</div><div>I run the fsfreeze and it returns=
:</div><div>`error: Guest agent is not responding: Guest agent not availabl=
e for now`</div><div><br>but checking the status returned frozen, rerunning=
 it again returns that the command is not enabled (expected since the freez=
e occurs)</div><div><br>I checked the fsstatus and it keeps returning `froz=
en` even after 10 seconds (from my understanding=C2=A0the freeze in windows=
 vm is limited to 10 seconds by default by the VSS. No way to change this d=
efault=C2=A0from my understanding, is it true?) Shouldn&#39;t the status re=
turn thawed if the VSS no longer keeps the freeze state?</div><div><br>Afte=
r a minute I did the thaw and it returned error:</div><div>`error: internal=
 error: unable to execute QEMU agent command &#39;guest-fsfreeze-thaw&#39;:=
 couldn&#39;t hold writes: fsfreeze is limited up to 10 seconds:`</div><div=
><br></div><div>but the fsstatus changed to thawed after that call.<br></di=
v><div><br></div><div>My questions are:</div><div>1. Why would the fsfreeze=
 return error about the guest agent but still freeze the fs?</div><div>2. W=
hy would the guest agent not respond, is there a way to make sure it is ava=
ilable before the freeze command? (running the fsstatus=C2=A0command before=
 it returned without issues..)</div><div>3. Is it expected that the fsstatu=
s will return frozen even if possibly VSS has already thawed? and that the =
thaw fails but the status do change after to thawed?</div><div><br></div><d=
iv>Thanks for taking the time to respond and help,</div>-- <br><div dir=3D"=
ltr"><div dir=3D"ltr"><div>
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

--000000000000775c5c05dc89fbd1--


