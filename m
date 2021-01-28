Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 421553075BC
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 13:17:48 +0100 (CET)
Received: from localhost ([::1]:34146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l56F9-0005K2-B5
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 07:17:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1l55yY-00007n-4J
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 07:00:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1l55yU-0003tB-HA
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 07:00:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611835233;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9gxxm3tKnylHSdVTHaL6QFhTxk/HCsvtJb/WWvjB5l4=;
 b=fj7lIpecUCfwJgGrbqgbZmKGmnxqekms5m6y/lih7Kyt+7AHWKd0ynbcHAA8kWOnGuJ1n0
 +9yEK5UiO1LNvQVqXcgx0JjYsZWSAODXHYUoxcsJW46c7Xe8yuSPnf1Pu4iKpinz52gPxX
 KsokmIFmDSxKT1sT4xH5rscQUTSZCaE=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-tYBtTGstNwqXOZsoxA-Dpg-1; Thu, 28 Jan 2021 07:00:31 -0500
X-MC-Unique: tYBtTGstNwqXOZsoxA-Dpg-1
Received: by mail-il1-f199.google.com with SMTP id j5so4351707ila.13
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 04:00:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9gxxm3tKnylHSdVTHaL6QFhTxk/HCsvtJb/WWvjB5l4=;
 b=OUBLC82db/O8vZyCHx+X7VBG+GPe5s7l0wn5PwK7m7rYb/tW9o7MajAuvq8oWkjQ/h
 ThafQYSulIiFWN6yIBvYd/vevWthaKCC4/pF2JQjzkb7CfTYTP94uHAIAvo0O1y7vQSs
 qJyZIqg5lKTCAEOxRMkFAeoP1ajs2EDPKbRXnfCoJSm40IDthBkdVVSEklWX9YXiWDc7
 QLUazKR7KUTR5xxjViVcMXCUumB1vdrwzZRJGfb4hetai9e35WZ5QxqQHoMPUmEP3vYn
 ewCXj+D3R6UpFCLlagXbQTp+NxfWXdv89zKBLEEVUbNJCZL5/L834AjoGgksHLoN6FjG
 GVAg==
X-Gm-Message-State: AOAM531Yj4pJR8hIEmNI0VNkPKMaYeQmAtSze3z+QC2Izg/MsMtFyZ/m
 4+g/SO1tZrZ6kcQz5YxPTeh/xyeUJD3QX7z94GUO1vEQMSXldP3cYgBHmmOseCpTnUodRH7eSVG
 ogaGjTyhPXiRrSduVVjhEx7RII+24AlQ=
X-Received: by 2002:a02:704e:: with SMTP id f75mr12567503jac.71.1611835231196; 
 Thu, 28 Jan 2021 04:00:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwkWUeQ0xIuqZps9HXveRX18Drbdin5b9rEezi7W40hfx+V/1ZkgsizVVwxXTC6YNR4V+dlXVO4eZ00FGF53/U=
X-Received: by 2002:a02:704e:: with SMTP id f75mr12567494jac.71.1611835231037; 
 Thu, 28 Jan 2021 04:00:31 -0800 (PST)
MIME-Version: 1.0
References: <20210128111319.329755-1-marcandre.lureau@redhat.com>
 <20210128114352.tvwnx435qbqcv4a4@sirius.home.kraxel.org>
 <CAMxuvazAToFV_uD3Q7whGymoY07eiq-hErToDPB41F2T9ZY7hg@mail.gmail.com>
In-Reply-To: <CAMxuvazAToFV_uD3Q7whGymoY07eiq-hErToDPB41F2T9ZY7hg@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Thu, 28 Jan 2021 16:00:20 +0400
Message-ID: <CAMxuvazChfKDHyjP2o1ipfgquawMab9zc4p8J5wnNnmVMmJ1yw@mail.gmail.com>
Subject: Re: [PATCH] spice: delay starting until display are initialized
To: Gerd Hoffmann <kraxel@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000006201bf05b9f4a25d"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
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
Cc: "Bonzini, Paolo" <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000006201bf05b9f4a25d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Jan 28, 2021 at 3:57 PM Marc-Andr=C3=A9 Lureau <
marcandre.lureau@redhat.com> wrote:

> Hi
>
> On Thu, Jan 28, 2021 at 3:44 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
>>   Hi,
>>
>> > diff --git a/ui/spice-display.c b/ui/spice-display.c
>> > index 0178d5766d..3d3e3bcb22 100644
>> > --- a/ui/spice-display.c
>> > +++ b/ui/spice-display.c
>> > @@ -1188,4 +1188,6 @@ void qemu_spice_display_init(void)
>> >          }
>> >          qemu_spice_display_init_one(con);
>> >      }
>>
>>        if (runstate_is_running()) {
>>             qemu_spice_display_start();
>>        }
>>
>> Isn't that enough?
>>
>
> That should be fine too, I'll update the patch. thanks
>

Actually no, we still need to prevent the initial
qemu_spice_display_start(), and do a single call when everything is ready
(since spice server doesn't handle adding interfaces dynamically when
running).

--0000000000006201bf05b9f4a25d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 28, 2021 at 3:57 PM Mar=
c-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.com">marc=
andre.lureau@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan =
28, 2021 at 3:44 PM Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com" =
target=3D"_blank">kraxel@redhat.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">=C2=A0 Hi,<br>
<br>
&gt; diff --git a/ui/spice-display.c b/ui/spice-display.c<br>
&gt; index 0178d5766d..3d3e3bcb22 100644<br>
&gt; --- a/ui/spice-display.c<br>
&gt; +++ b/ui/spice-display.c<br>
&gt; @@ -1188,4 +1188,6 @@ void qemu_spice_display_init(void)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_spice_display_init_one(con);<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0if (runstate_is_running()) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_spice_display_start();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
Isn&#39;t that enough?<br></blockquote><div><br></div><div>That should be f=
ine too, I&#39;ll update the patch. thanks</div></div></div></blockquote><d=
iv><br></div><div>Actually no, we still need to prevent the initial qemu_sp=
ice_display_start(), and do a single call when everything is ready (since s=
pice server doesn&#39;t handle adding interfaces dynamically when running).=
 <br></div></div></div>

--0000000000006201bf05b9f4a25d--


