Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E384F5C28
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 13:31:57 +0200 (CEST)
Received: from localhost ([::1]:59112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nc3tE-00025E-BY
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 07:31:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1nc3qg-00018c-2E
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 07:29:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1nc3qc-0005Xe-Qa
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 07:29:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649244553;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SKBCNV6qHDiN2Osb5Wo5iOZLR9u9eTq0gipwLKgnU6Q=;
 b=bNj+2XxtMM2mAD0xI4xX6d3K3bz2KFA7nGbo4Y7IHfj1l+CgWGRJ7aVHY6/1c8ocjEL0Is
 edGz3yfViuR3QT4LZT823yDr5QcYDyM1RIA+z+QFqLdtKy2tDWTmXFunTAl0fOjto7Sp+o
 wL6DckIWqkrCFGCccEg6PRvcebCt0XI=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-519-XwT7lHAsMjaa2HhhP0D3Sg-1; Wed, 06 Apr 2022 07:29:12 -0400
X-MC-Unique: XwT7lHAsMjaa2HhhP0D3Sg-1
Received: by mail-yb1-f198.google.com with SMTP id
 a143-20020a25ca95000000b0063d8415a03dso1494666ybg.23
 for <qemu-devel@nongnu.org>; Wed, 06 Apr 2022 04:29:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SKBCNV6qHDiN2Osb5Wo5iOZLR9u9eTq0gipwLKgnU6Q=;
 b=msWhV4RZNv4cIX5uzmrgLWSpdwxhhIrxu/ilWORxa+nQmv+R5b8+qBhiDn93t/H+CN
 dwW6waVXD5UsRP+s3jsWnkeriKxfNSH2/LH4dzgsmAYerIVcy92dWRlgqy8/kRRw3JMv
 4wquCf14okht7D+XoAWVozSfZc5Je6aF2zQJ6mbStjt08g/OUL/ZNfR+Ew5J2AENV9ex
 sa+N6890db5ZLYuwAvYbtG6Q/1201V2XWFx3Ab/ndIIC8nm+GC8VfX1ZgqIA5de30bMT
 kebYxZFMi+GOXwAcRyh6+hxVoqWut708WwWggYNSnyocs5p2D7LsVy8JCFxZidL/JbaU
 DtZA==
X-Gm-Message-State: AOAM5315ocPTmJslS3PkRTNJCBR1J6oC13IaWJjak1Bny+fPopfla1QW
 Oj1uivE1++fc/tEFXaRzH6Fpba0OE+QdFNOyHsG5cS+aulFeSbUyuwDbKkpRvf7wDnjrLXF04aP
 gA7aDmLSoziITIubzVAZPkgZrF0dxQ50=
X-Received: by 2002:a81:1743:0:b0:2ea:9ba:c36e with SMTP id
 64-20020a811743000000b002ea09bac36emr6907204ywx.49.1649244551660; 
 Wed, 06 Apr 2022 04:29:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxiFm6HHg6Gpy8Zijs+HIcT4oXBhxg1vxlWJoCGDTUxNTYQy+PBPtgeShbn1Ryo1mdL2BKpusXwGCSdWLXO6Bg=
X-Received: by 2002:a81:1743:0:b0:2ea:9ba:c36e with SMTP id
 64-20020a811743000000b002ea09bac36emr6907193ywx.49.1649244551479; Wed, 06 Apr
 2022 04:29:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAMUS3ta+RFL1M+esUzy34WpB-MOO4ofKdsPiHOUoPyBXF2GoTw@mail.gmail.com>
In-Reply-To: <CAMUS3ta+RFL1M+esUzy34WpB-MOO4ofKdsPiHOUoPyBXF2GoTw@mail.gmail.com>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Wed, 6 Apr 2022 14:29:00 +0300
Message-ID: <CAPMcbCoM1UOw8r=mZchbuX9ixoMS3Q4t1xs1GRyWrkmP2c94tQ@mail.gmail.com>
Subject: Re: FSFreeze on Windows VM
To: Shelly Kagan <skagan@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kkostiuk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000a3972805dbfaab2a"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kkostiuk@redhat.com;
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

--000000000000a3972805dbfaab2a
Content-Type: text/plain; charset="UTF-8"

Hi Shelly,

Can you provide your version of Guest Agent? Is it built from upstream or
some VirtIO-Win release?
Previously we had some issues related to wrong error messages from Guest
Agent.

Best Regards,
Konstantin Kostiuk.


On Tue, Mar 29, 2022 at 6:24 PM Shelly Kagan <skagan@redhat.com> wrote:

> Hi all,
> I'm having some weird behavior with fsfreeze in windows VM.
> I run the fsfreeze and it returns:
> `error: Guest agent is not responding: Guest agent not available for now`
>
> but checking the status returned frozen, rerunning it again returns that
> the command is not enabled (expected since the freeze occurs)
>
> I checked the fsstatus and it keeps returning `frozen` even after 10
> seconds (from my understanding the freeze in windows vm is limited to 10
> seconds by default by the VSS. No way to change this default from my
> understanding, is it true?) Shouldn't the status return thawed if the VSS
> no longer keeps the freeze state?
>
> After a minute I did the thaw and it returned error:
> `error: internal error: unable to execute QEMU agent command
> 'guest-fsfreeze-thaw': couldn't hold writes: fsfreeze is limited up to 10
> seconds:`
>
> but the fsstatus changed to thawed after that call.
>
> My questions are:
> 1. Why would the fsfreeze return error about the guest agent but still
> freeze the fs?
> 2. Why would the guest agent not respond, is there a way to make sure it
> is available before the freeze command? (running the fsstatus command
> before it returned without issues..)
> 3. Is it expected that the fsstatus will return frozen even if possibly
> VSS has already thawed? and that the thaw fails but the status do change
> after to thawed?
>
> Thanks for taking the time to respond and help,
> --
>
> Shelly Kagan
>
> Senior Software Engineer
>
> Red Hat <https://www.redhat.com>
> <https://www.redhat.com>
>

--000000000000a3972805dbfaab2a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Shelly,</div><div><br></div><div>Can you provide y=
our version of Guest Agent? Is it built from upstream or some VirtIO-Win re=
lease? <br></div><div>Previously we had some issues related to wrong error =
messages from Guest Agent.</div><div><div><div><br></div><div><div><div dir=
=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div =
dir=3D"ltr"><div>Best Regards,</div><div>Konstantin Kostiuk.</div></div></d=
iv></div><br></div></div></div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Tue, Mar 29, 2022 at 6:24 PM Shelly Kagan=
 &lt;<a href=3D"mailto:skagan@redhat.com">skagan@redhat.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"=
><div>Hi all,</div><div>I&#39;m having some weird behavior with fsfreeze in=
 windows VM.</div><div>I run the fsfreeze and it returns:</div><div>`error:=
 Guest agent is not responding: Guest agent not available for now`</div><di=
v><br>but checking the status returned frozen, rerunning it again returns t=
hat the command is not enabled (expected since the freeze occurs)</div><div=
><br>I checked the fsstatus and it keeps returning `frozen` even after 10 s=
econds (from my understanding=C2=A0the freeze in windows vm is limited to 1=
0 seconds by default by the VSS. No way to change this default=C2=A0from my=
 understanding, is it true?) Shouldn&#39;t the status return thawed if the =
VSS no longer keeps the freeze state?</div><div><br>After a minute I did th=
e thaw and it returned error:</div><div>`error: internal error: unable to e=
xecute QEMU agent command &#39;guest-fsfreeze-thaw&#39;: couldn&#39;t hold =
writes: fsfreeze is limited up to 10 seconds:`</div><div><br></div><div>but=
 the fsstatus changed to thawed after that call.<br></div><div><br></div><d=
iv>My questions are:</div><div>1. Why would the fsfreeze return error about=
 the guest agent but still freeze the fs?</div><div>2. Why would the guest =
agent not respond, is there a way to make sure it is available before the f=
reeze command? (running the fsstatus=C2=A0command before it returned withou=
t issues..)</div><div>3. Is it expected that the fsstatus will return froze=
n even if possibly VSS has already thawed? and that the thaw fails but the =
status do change after to thawed?</div><div><br></div><div>Thanks for takin=
g the time to respond and help,</div>-- <br><div dir=3D"ltr"><div dir=3D"lt=
r"><div>
        <p style=3D"font-weight:bold;margin:0px;padding:0px;font-size:14px;=
font-family:&quot;RedHatText&quot;,sans-serif">
          <span>Shelly</span> <span>Kagan</span><span style=3D"color:rgb(17=
0,170,170);margin:0px"></span>
        </p>
       =20
        <p style=3D"font-weight:normal;font-size:12px;margin:0px;font-famil=
y:&quot;RedHatText&quot;,sans-serif">
          <span>Senior Software Engineer</span>
        </p>
        <p style=3D"font-weight:normal;margin:0px 0px 4px;font-size:12px;fo=
nt-family:&quot;RedHatText&quot;,sans-serif">
          <a style=3D"color:rgb(0,136,206);font-size:12px;margin:0px;text-d=
ecoration:none;font-family:&quot;RedHatText&quot;,sans-serif" href=3D"https=
://www.redhat.com" target=3D"_blank">Red Hat <span></span></a>
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

--000000000000a3972805dbfaab2a--


