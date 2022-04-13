Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F934FF05F
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Apr 2022 09:10:57 +0200 (CEST)
Received: from localhost ([::1]:46162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neX9U-00056o-Eq
	for lists+qemu-devel@lfdr.de; Wed, 13 Apr 2022 03:10:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <skagan@redhat.com>) id 1neX2d-0003WD-IK
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 03:03:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <skagan@redhat.com>) id 1neX2X-0005D2-Mc
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 03:03:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649833422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UUDe5tKVvIYdb0MNYF2RZuvrI5+TcJ4qwJs2zeGIEAE=;
 b=WRL9MkbN9ssNhNSMN8j2upR5FLybbIQs8PEtdOSchJC8n3ErekQatmmQa7YC2Xv3nuGyCC
 Q0amemY9j25VRtFuARX4EuZDJRu+Ul+65l2varW5iWY9pROoOsyP74Rs1a+y5VHptzkRQn
 57ZAGHT88xJc/TPtmddiieA0bSdTIeE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-97-TKtqjt0pObi5IR09vUjidQ-1; Wed, 13 Apr 2022 03:03:39 -0400
X-MC-Unique: TKtqjt0pObi5IR09vUjidQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 f12-20020a05600c154c00b0038ea9ed0a4aso476361wmg.1
 for <qemu-devel@nongnu.org>; Wed, 13 Apr 2022 00:03:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UUDe5tKVvIYdb0MNYF2RZuvrI5+TcJ4qwJs2zeGIEAE=;
 b=8JLHdrPi4opkdwvKDB+wqfF7B+EXArsHoYG1ZGoaeRr1Cuqeg+2f8XnnjwQ+bwhSG3
 IL2GmtJsp1WuTa08I1dfZyl7MVpsqdD61DZxUX1hVxzH3WyiRMGT7wDAzQCnBn2qjBuS
 aoS8xZKIrjCpS7fg5pQUaokrb6NMkvlOZmXcsshAb572A46NQQyoUm8gUK2huV1T2KxN
 UFCAiTk5sQuohoODYPCA54sk7JxArW0Mjvw9B9Sy4Oul+nRHPQQuPd3s5JW6KxdtAjsr
 0asnZZVX1ps1t2xD5IBHIe7SN9v3OPsTcgYSAuYn3XqAXEWs/PLp50EjlKMfQsPLC40S
 qhpA==
X-Gm-Message-State: AOAM531BHrJnR5Iz+xXwqltBq66mwj1OLLXb/BcDi9vlhaYTSUYuajpK
 Puyc9l9zeOuK2QXLkAVnjVfMkl6cEukgHngQ9F8WADjh5iDftnO08IYb8YRZqp3pdhIgX/Mt+TZ
 CKZqjaEsaE8TwLRDUH/ehe40sohW37S0=
X-Received: by 2002:a05:600c:1909:b0:38c:e8f3:8e3d with SMTP id
 j9-20020a05600c190900b0038ce8f38e3dmr7222181wmq.152.1649833418490; 
 Wed, 13 Apr 2022 00:03:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy+BiZmqK8gskJLlaKQj2ZVohoF+AdEbhKUd9Kpknx7cF1joEEiS3a59V9mMCstM0xwySjG71n8A3Wwqi6MfKc=
X-Received: by 2002:a05:600c:1909:b0:38c:e8f3:8e3d with SMTP id
 j9-20020a05600c190900b0038ce8f38e3dmr7222166wmq.152.1649833418226; Wed, 13
 Apr 2022 00:03:38 -0700 (PDT)
MIME-Version: 1.0
References: <CAMUS3ta+RFL1M+esUzy34WpB-MOO4ofKdsPiHOUoPyBXF2GoTw@mail.gmail.com>
 <CAPMcbCoM1UOw8r=mZchbuX9ixoMS3Q4t1xs1GRyWrkmP2c94tQ@mail.gmail.com>
In-Reply-To: <CAPMcbCoM1UOw8r=mZchbuX9ixoMS3Q4t1xs1GRyWrkmP2c94tQ@mail.gmail.com>
From: Shelly Kagan <skagan@redhat.com>
Date: Wed, 13 Apr 2022 10:03:27 +0300
Message-ID: <CAMUS3tZp4GMjf_b4JNJtzMsU+n=whtqsG+QgYsnRXLjzx1xstw@mail.gmail.com>
Subject: Re: FSFreeze on Windows VM
To: Konstantin Kostiuk <kkostiuk@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=skagan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000d5106905dc83c688"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=skagan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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

--000000000000d5106905dc83c688
Content-Type: text/plain; charset="UTF-8"

Hi Konstantin,

The Guest Agent version
"guestAgentVersion": "100.0.0",
I'm running with a 2019 windows image which I understand the GA is part of
the virtio drivers.
Don't know if the following info also helps but:
  "hostname": "WIN-CUCKQ65DH6K",
  "os": {
    "name": "Microsoft Windows",
    "kernelRelease": "17763",
    "version": "Microsoft Windows Server 2019",
    "prettyName": "Windows Server 2019 Standard",
    "versionId": "2019",
    "kernelVersion": "10.0",
    "machine": "x86_64",
    "id": "mswindows"
  },

I think what is more important to me is the GA being not responsive for the
freeze call. I'm using the fsfreeze in a feature I'm implementing, and
since in windows there is a 10sec timeout because of the VSS the fact that
the freeze call returns error that the GA is not available plus that when
its not available it takes much longer for the freeze call to return is
really time sensitive.

Thanks

On Wed, Apr 6, 2022 at 2:29 PM Konstantin Kostiuk <kkostiuk@redhat.com>
wrote:

> Hi Shelly,
>
> Can you provide your version of Guest Agent? Is it built from upstream or
> some VirtIO-Win release?
> Previously we had some issues related to wrong error messages from Guest
> Agent.
>
> Best Regards,
> Konstantin Kostiuk.
>
>
> On Tue, Mar 29, 2022 at 6:24 PM Shelly Kagan <skagan@redhat.com> wrote:
>
>> Hi all,
>> I'm having some weird behavior with fsfreeze in windows VM.
>> I run the fsfreeze and it returns:
>> `error: Guest agent is not responding: Guest agent not available for now`
>>
>> but checking the status returned frozen, rerunning it again returns that
>> the command is not enabled (expected since the freeze occurs)
>>
>> I checked the fsstatus and it keeps returning `frozen` even after 10
>> seconds (from my understanding the freeze in windows vm is limited to 10
>> seconds by default by the VSS. No way to change this default from my
>> understanding, is it true?) Shouldn't the status return thawed if the VSS
>> no longer keeps the freeze state?
>>
>> After a minute I did the thaw and it returned error:
>> `error: internal error: unable to execute QEMU agent command
>> 'guest-fsfreeze-thaw': couldn't hold writes: fsfreeze is limited up to 10
>> seconds:`
>>
>> but the fsstatus changed to thawed after that call.
>>
>> My questions are:
>> 1. Why would the fsfreeze return error about the guest agent but still
>> freeze the fs?
>> 2. Why would the guest agent not respond, is there a way to make sure it
>> is available before the freeze command? (running the fsstatus command
>> before it returned without issues..)
>> 3. Is it expected that the fsstatus will return frozen even if possibly
>> VSS has already thawed? and that the thaw fails but the status do change
>> after to thawed?
>>
>> Thanks for taking the time to respond and help,
>> --
>>
>> Shelly Kagan
>>
>> Senior Software Engineer
>>
>> Red Hat <https://www.redhat.com>
>> <https://www.redhat.com>
>>
>

-- 

Shelly Kagan

Senior Software Engineer

Red Hat <https://www.redhat.com>
<https://www.redhat.com>

--000000000000d5106905dc83c688
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Konstantin,<div><br></div><div>The Guest Agent version=
=C2=A0</div><div>&quot;guestAgentVersion&quot;: &quot;100.0.0&quot;,<br></d=
iv><div>I&#39;m running=C2=A0with a 2019 windows image which I understand t=
he GA is part of the virtio drivers.</div><div>Don&#39;t know if the follow=
ing info also helps but:<br>=C2=A0 &quot;hostname&quot;: &quot;WIN-CUCKQ65D=
H6K&quot;,<br>=C2=A0 &quot;os&quot;: {<br>=C2=A0 =C2=A0 &quot;name&quot;: &=
quot;Microsoft Windows&quot;,<br>=C2=A0 =C2=A0 &quot;kernelRelease&quot;: &=
quot;17763&quot;,<br>=C2=A0 =C2=A0 &quot;version&quot;: &quot;Microsoft Win=
dows Server 2019&quot;,<br>=C2=A0 =C2=A0 &quot;prettyName&quot;: &quot;Wind=
ows Server 2019 Standard&quot;,<br>=C2=A0 =C2=A0 &quot;versionId&quot;: &qu=
ot;2019&quot;,<br>=C2=A0 =C2=A0 &quot;kernelVersion&quot;: &quot;10.0&quot;=
,<br>=C2=A0 =C2=A0 &quot;machine&quot;: &quot;x86_64&quot;,<br>=C2=A0 =C2=
=A0 &quot;id&quot;: &quot;mswindows&quot;<br>=C2=A0 },<br></div><div><br></=
div><div>I think what is more important to me is the GA being not responsiv=
e for the freeze call. I&#39;m using the fsfreeze in a feature I&#39;m impl=
ementing, and since in windows there is a 10sec=C2=A0timeout because of the=
 VSS the fact that the freeze call returns error that the GA is not availab=
le plus that when its not available it takes much longer for the freeze cal=
l to return is really time sensitive.</div><div><br></div><div>Thanks</div>=
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Wed, Apr 6, 2022 at 2:29 PM Konstantin Kostiuk &lt;<a href=3D"mailto:kko=
stiuk@redhat.com" target=3D"_blank">kkostiuk@redhat.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><di=
v>Hi Shelly,</div><div><br></div><div>Can you provide your version of Guest=
 Agent? Is it built from upstream or some VirtIO-Win release? <br></div><di=
v>Previously we had some issues related to wrong error messages from Guest =
Agent.</div><div><div><div><br></div><div><div><div dir=3D"ltr"><div dir=3D=
"ltr"><div>Best Regards,</div><div>Konstantin Kostiuk.</div></div></div></d=
iv><br></div></div></div></div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Tue, Mar 29, 2022 at 6:24 PM Shelly Kagan &lt;<=
a href=3D"mailto:skagan@redhat.com" target=3D"_blank">skagan@redhat.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div=
 dir=3D"ltr"><div>Hi all,</div><div>I&#39;m having some weird behavior with=
 fsfreeze in windows VM.</div><div>I run the fsfreeze and it returns:</div>=
<div>`error: Guest agent is not responding: Guest agent not available for n=
ow`</div><div><br>but checking the status returned frozen, rerunning it aga=
in returns that the command is not enabled (expected since the freeze occur=
s)</div><div><br>I checked the fsstatus and it keeps returning `frozen` eve=
n after 10 seconds (from my understanding=C2=A0the freeze in windows vm is =
limited to 10 seconds by default by the VSS. No way to change this default=
=C2=A0from my understanding, is it true?) Shouldn&#39;t the status return t=
hawed if the VSS no longer keeps the freeze state?</div><div><br>After a mi=
nute I did the thaw and it returned error:</div><div>`error: internal error=
: unable to execute QEMU agent command &#39;guest-fsfreeze-thaw&#39;: could=
n&#39;t hold writes: fsfreeze is limited up to 10 seconds:`</div><div><br><=
/div><div>but the fsstatus changed to thawed after that call.<br></div><div=
><br></div><div>My questions are:</div><div>1. Why would the fsfreeze retur=
n error about the guest agent but still freeze the fs?</div><div>2. Why wou=
ld the guest agent not respond, is there a way to make sure it is available=
 before the freeze command? (running the fsstatus=C2=A0command before it re=
turned without issues..)</div><div>3. Is it expected that the fsstatus will=
 return frozen even if possibly VSS has already thawed? and that the thaw f=
ails but the status do change after to thawed?</div><div><br></div><div>Tha=
nks for taking the time to respond and help,</div>-- <br><div dir=3D"ltr"><=
div dir=3D"ltr"><div>
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

--000000000000d5106905dc83c688--


