Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD5A3FEEFB
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 15:51:09 +0200 (CEST)
Received: from localhost ([::1]:47980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLn7U-0004h8-FJ
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 09:51:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mLmiG-00038H-Qu
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 09:25:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mLmiE-0006XZ-OH
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 09:25:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630589101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=v4Jbh+4fjHjtYBoOuuCaEmI197aO0/0GFQdhnYMmgwk=;
 b=TnJao2X1AfL5kfgOxvM4QhxUelAkD6kL8zU2B8yrjFBT1PE04q6Z3GumLgr8om+9H7/03L
 uMRSJEVMM5lb8K12CLyvbOpM8poz2pSzAcXekwqFryzeRvhfBsiwKDoO/3Ksh/5N3pfd7B
 O7AYrYsomIzckr1FufOypDZzv0Ae/Pw=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-FbPevQRoMCC-whVWcWsbVA-1; Thu, 02 Sep 2021 09:24:39 -0400
X-MC-Unique: FbPevQRoMCC-whVWcWsbVA-1
Received: by mail-pj1-f71.google.com with SMTP id
 c17-20020a17090abf1100b001963ea0ab75so1047608pjs.4
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 06:24:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v4Jbh+4fjHjtYBoOuuCaEmI197aO0/0GFQdhnYMmgwk=;
 b=Lo6cvpGqG4NeHqe8tmU0U/kgY+lp8grm6sw/jCkPwSaGkUfpSQikqHCEELdhjHqQez
 vOrBnG2cT/rUGbj8acTr8WcmemHh1XU7KuG4oh3i69OVlnRRuUTfRHnJZwelucahVfSG
 BhqUwu8oM+oT5I4OgVEPwwmo19Aj+8fSS1KopI9JyEN8QerIHXJKAQ0/CJJGiRsAkWEa
 xLKF9ozmXk143SvjjgXTsMoDwAtEPMCwVd6l6y9A/FARYKJ2Vnkxk/87pEFjCWL7mS5K
 vdmodvvQ+UFPTdsCpsKBLNz4WniUrorHtIPWNCJv8n0seSIWpKWKNr0mD2ChI/11lTnT
 qKmw==
X-Gm-Message-State: AOAM532YM1Iw6cTGaAdQF+ZswSZBRrVn+B0P6Ok0IxHlind7mQeX7mgT
 Zu+0XMI9F/hmfM5UP0FSPGWwoNBAQ0xm1l4FSwNgQuREKkmq09lXDQm3LFyXlAu2zV1ZJVfXt1D
 LtjJUEXUI6dAYr0lvEtS3W/L5IyyM5XA=
X-Received: by 2002:a17:90a:fe8e:: with SMTP id
 co14mr3856398pjb.200.1630589078314; 
 Thu, 02 Sep 2021 06:24:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJIYJ7/aNdCkFzjr/TZ//fIkt5/1zozqSwudgmRdcUHnVkh3rnL2+2JSCSS9ASHJXNqMboG8Na0nIl71sN+fg=
X-Received: by 2002:a17:90a:fe8e:: with SMTP id
 co14mr3856367pjb.200.1630589077977; 
 Thu, 02 Sep 2021 06:24:37 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ28CFSFEatxgfvUE3gvnFBVX7GrqMwk0+t1foFfNzDu7bwv3A@mail.gmail.com>
In-Reply-To: <CAJ28CFSFEatxgfvUE3gvnFBVX7GrqMwk0+t1foFfNzDu7bwv3A@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Thu, 2 Sep 2021 17:24:27 +0400
Message-ID: <CAMxuvawBoZpUVwM6dSYpa=5=iNGj9BaA3B+j4Wn_3oxvF6A5Sw@mail.gmail.com>
Subject: Re: Guest Agent issue with 'guest-get-osinfo' command on Windows
To: Konstantin Kostiuk <konstantin@daynix.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000c4974105cb031ad8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Michael Roth <michael.roth@amd.com>, Developers <qemu-devel@nongnu.org>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Tomas Golembiovsky <tgolembi@redhat.com>, Yan Vugenfirer <yan@daynix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000c4974105cb031ad8
Content-Type: text/plain; charset="UTF-8"

Hi

On Thu, Sep 2, 2021 at 4:36 PM Konstantin Kostiuk <konstantin@daynix.com>
wrote:

> Hi Team,
>
> We have several bugs related to 'guest-get-osinfo' command in Windows
> Guest Agent:
> https://bugzilla.redhat.com/show_bug.cgi?id=1998919
> https://bugzilla.redhat.com/show_bug.cgi?id=1972070
>
> This command returns the following data:
> {
> "name": "Microsoft Windows",
> "kernel-release": "20344",
> "version": "N/A",
> "variant": "server",
> "pretty-name": "Windows Server 2022 Datacenter",
> "version-id": "N/A",
> "variant-id": "server",
> "kernel-version": "10.0",
> "machine": "x86_64",
> "id": "mswindows"
> }
>
> The problem is with "version" and "pretty-name". Windows Server
> 2016/2019/2022 and Windows 11 have the same MajorVersion ("kernel-version")
> = 10, so to get pretty-name the guest agent uses a conversion matrix
> between Windows build and name (
> https://github.com/qemu/qemu/blob/59a89510b62ec23dbeab8b02fa4e3526e353d8b6/qga/commands-win32.c#L2170
> ).
>
> This solution has several problems: need to update the conversion matrix
> for each Windows build, one Windows name can have different build numbers.
> For example, Windows Server 2022 (preview) build number is 20344, Windows
> Server 2022 build number is 20348.
>
> There are two possible solutions:
> 1. Use build number range instead of one number. Known implementation
> issue: Microsoft provides a table (
> https://docs.microsoft.com/en-Us/windows-server/get-started/windows-server-release-info)
> only with stable build numbers. So, we exactly don't know the build number
> range.
>
> 2. We can read this string from the registry
> (HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion). Known
> implementation issues: ProductName value is localized (in a Russian version
> of Windows, the word "Microsoft' is translated), so we should ignore it.
> ReleaseId value does not equal to Windows Server version (for Windows
> Server 2019, ReleaseId is 1809)
>
> In conclusion, I have the next questions:
> What solution we should implement to get the Windows release name?
>


Have you checked the glib implementation?
https://gitlab.gnome.org/GNOME/glib/-/blob/main/glib/gutils.c#L1291

We should probably teach qemu-ga to use g_get_os_info() with glib >= 2.64,
and be consistent with what glib implements (patch it there when necessary)



> Does someone know how end-users use this information? Should it be English
> only or it can be localized? Should we have exactly the same output as now?
> What should we do with the 'Standard' server edition? Currently, the guest
> agent always returns 'Datacenter'.
>
>

--000000000000c4974105cb031ad8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 2, 2021 at 4:36 PM Kons=
tantin Kostiuk &lt;<a href=3D"mailto:konstantin@daynix.com">konstantin@dayn=
ix.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div>Hi Team,<br></div><div><br></d=
iv><div>We have several bugs related to &#39;guest-get-osinfo&#39; command =
in Windows Guest Agent: <br></div><div><a href=3D"https://bugzilla.redhat.c=
om/show_bug.cgi?id=3D1998919" target=3D"_blank">https://bugzilla.redhat.com=
/show_bug.cgi?id=3D1998919</a></div><div><a href=3D"https://bugzilla.redhat=
.com/show_bug.cgi?id=3D1972070" target=3D"_blank">https://bugzilla.redhat.c=
om/show_bug.cgi?id=3D1972070</a></div><div><br></div><div>This command retu=
rns the following data:</div><div>{</div><div>&quot;name&quot;: &quot;Micro=
soft Windows&quot;,</div><div>&quot;kernel-release&quot;: &quot;20344&quot;=
,</div><div>&quot;version&quot;: &quot;N/A&quot;,</div><div>&quot;variant&q=
uot;: &quot;server&quot;, <br></div><div>&quot;pretty-name&quot;: &quot;Win=
dows Server 2022 Datacenter&quot;,</div><div>&quot;version-id&quot;: &quot;=
N/A&quot;,</div><div>&quot;variant-id&quot;: &quot;server&quot;,</div><div>=
&quot;kernel-version&quot;: &quot;10.0&quot;,</div><div>&quot;machine&quot;=
: &quot;x86_64&quot;,</div><div>&quot;id&quot;: &quot;mswindows&quot;</div>=
<div>}</div><div><br></div><div>The
 problem is with &quot;version&quot; and &quot;pretty-name&quot;. Windows S=
erver=20
2016/2019/2022 and Windows 11 have the same MajorVersion=20
(&quot;kernel-version&quot;) =3D 10, so to get pretty-name the guest agent =
uses a=20
conversion matrix between Windows build and name (<a href=3D"https://github=
.com/qemu/qemu/blob/59a89510b62ec23dbeab8b02fa4e3526e353d8b6/qga/commands-w=
in32.c#L2170" target=3D"_blank">https://github.com/qemu/qemu/blob/59a89510b=
62ec23dbeab8b02fa4e3526e353d8b6/qga/commands-win32.c#L2170</a>).<br></div><=
div><br></div><div><span lang=3D"en"><span><span>This solution has several =
problems</span></span></span>:
 need to update the conversion matrix for each Windows build, one=20
Windows name can have different build numbers. For example, Windows=20
Server 2022 (preview) build number is 20344, Windows Server 2022 build numb=
er is 20348.</div><div><br></div><div>There are two possible solutions:</di=
v><div>1. Use build number range instead of one number. Known implementatio=
n issue: Microsoft provides a table (<a href=3D"https://docs.microsoft.com/=
en-Us/windows-server/get-started/windows-server-release-info" target=3D"_bl=
ank">https://docs.microsoft.com/en-Us/windows-server/get-started/windows-se=
rver-release-info</a>) only with stable build numbers. So, we exactly don&#=
39;t know the build number range.</div><div><br></div><div>2. We can read t=
his string from the registry (HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows
 NT\CurrentVersion). Known implementation issues: ProductName value is loca=
lized (in a Russian version of Windows, the word &quot;Microsoft&#39; is tr=
anslated), so we should ignore it. ReleaseId value does not equal to=20
Windows Server version (for Windows Server 2019, ReleaseId is 1809)</div><d=
iv><br></div><div>In conclusion, I have the next questions: <br></div><div>=
What solution we should implement to get the Windows release name?</div></d=
iv></div></blockquote><div><br></div><div><div><br></div><div>Have you chec=
ked the glib implementation? <a href=3D"https://gitlab.gnome.org/GNOME/glib=
/-/blob/main/glib/gutils.c#L1291">https://gitlab.gnome.org/GNOME/glib/-/blo=
b/main/glib/gutils.c#L1291</a></div><div><br></div><div>We should probably =
teach qemu-ga to use g_get_os_info() with glib &gt;=3D 2.64, and be consist=
ent with what glib implements (patch it there when necessary)<br></div><div=
><br></div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><d=
iv dir=3D"ltr"><div dir=3D"ltr"><div>Does someone know how end-users use th=
is information? Should it be English only or it can be localized? Should we=
 have exactly the same output as now? <br></div><div>What should we do with=
 the &#39;Standard&#39; server edition? Currently, the guest agent always r=
eturns &#39;Datacenter&#39;.</div><br></div></div></blockquote><br></div></=
div>

--000000000000c4974105cb031ad8--


