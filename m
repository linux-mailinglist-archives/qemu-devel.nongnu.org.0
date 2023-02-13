Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7CB694C5B
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 17:21:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRbZ9-0004Oo-3i; Mon, 13 Feb 2023 11:20:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1pRbZ6-0004OB-CI
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 11:20:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1pRbZ4-0007jL-5b
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 11:20:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676305224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mGBVcs+uPMV1E2ywIk63+Q0gjOOmGZqr9e7le6+NDGE=;
 b=TRg+e9rNg0Vd54qfnZsoOKsPfwEIs2jPF8uI1V8bqrgbeouCGuXF3onaXWcg/vG0GylO3W
 6mLx2EqrzRiypqPaPCK5FbKZ5a2tbzy3Z/jU8TMSKpWj/rm5mZ53ArbavYTloJ4qCPt7t2
 CH+azn7HlOraYvgaRLhrJOYKzdYMmxo=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-67-de5tdK7dPqqDBhNqQRMxXQ-1; Mon, 13 Feb 2023 11:20:21 -0500
X-MC-Unique: de5tdK7dPqqDBhNqQRMxXQ-1
Received: by mail-ua1-f70.google.com with SMTP id
 d39-20020ab014aa000000b0068887f32c88so3944465uae.17
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 08:20:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mGBVcs+uPMV1E2ywIk63+Q0gjOOmGZqr9e7le6+NDGE=;
 b=Ivz8AYFLN39Ym7jMU0dGVEzQlxlhG5QvFQusFHLJbU/1XkAZ38mvZSkLPjQVxk0idK
 iS1bfaBu3kLKm5gl5HQG6BPBf07IYVgIpTNZrd8Z92R4RHj7Cuv1Qx+bzITg2rja7gJC
 OfRkFaAMWzQkMbjKJ3tTjjrC8StxSrzHQAKszddsgYfHUO7JiG0YnmQeCgdzdaOnuJo3
 bUjewTG5pmBqNKfjwCYUJ52tHKbR0Mx0m2iHnIXx7MEWFR+n3nalcYElAQa7jSj5/dUF
 doNDC2RwZfOiYdNbHJjWvnKizWPPMcK+wrFThnSv4yAy3g3CPymSqaSO0EN7+W0UDXJZ
 hdrg==
X-Gm-Message-State: AO0yUKWvlzbRbag4EBYffBMRsKlWiP7BCLuEqs2A7FqI7Z3We0eDPTxV
 0zdqiT5ylKQa42n0DZVCgJI3aYdx5LX+uSbLvVI84aUI8mFa+OhTZuD+COOUndUsKsgLuVFI/L7
 zeQBKK8KA8HMWTQaLuny8DXh6ihJaYsnAdS7o
X-Received: by 2002:ab0:631a:0:b0:65c:9a4b:d390 with SMTP id
 a26-20020ab0631a000000b0065c9a4bd390mr4204296uap.62.1676305219628; 
 Mon, 13 Feb 2023 08:20:19 -0800 (PST)
X-Google-Smtp-Source: AK7set/zwSUWyxFDgz6BtyxTrmuubOOsn9YdF0C7e/IraoXJqxHp4hqFklkbXQfAYjKAh+CZRmQLuQ9YNko9QmiSwCo=
X-Received: by 2002:ab0:631a:0:b0:65c:9a4b:d390 with SMTP id
 a26-20020ab0631a000000b0065c9a4bd390mr4204288uap.62.1676305218808; Mon, 13
 Feb 2023 08:20:18 -0800 (PST)
MIME-Version: 1.0
References: <20230209085004.2745131-1-kfir@daynix.com>
In-Reply-To: <20230209085004.2745131-1-kfir@daynix.com>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Mon, 13 Feb 2023 18:20:07 +0200
Message-ID: <CAPMcbCo+XEXTJKD24vMH8DzYgKJs5jBKNpH1annMthPUGEnazg@mail.gmail.com>
Subject: Re: [PATCH 0/3] qga/win/vss: add VSS backup type options
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Cc: qemu-devel@nongnu.org, Michael Roth <michael.roth@amd.com>, 
 Kfir Manor <kfir@daynix.com>, Yan Vugenfirer <yan@daynix.com>
Content-Type: multipart/alternative; boundary="0000000000001a45cd05f49739e3"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--0000000000001a45cd05f49739e3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Marc-Andr=C3=A9,

Can you please review this patch set?

Best Regards,
Konstantin Kostiuk.


On Thu, Feb 9, 2023 at 10:50 AM Kfir Manor <kfir@daynix.com> wrote:

> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/775
>
> The problem, VSS backup type VSS-FULL (the only available VSS backup type
> currently) can break other backups that use VSS-FULL(for example,
> Bareos-Fullbackup).
>
> Fix, add other backup types.
>
> Implementation, put the desired backup type number inside Regkey value
> HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\QEMU Guest Agent VSS
> Provider\VssOption, so that the program can query the desired backup type=
.
>
> VSS backup types:
> number   type
> 1        VSS_BT_FULL
> 2        VSS_BT_INCREMENTAL
> 3        VSS_BT_DIFFERENTIAL
> 4        VSS_BT_LOG
> 5        VSS_BT_COPY
>
> for more information about the different backup types
> https://learn.microsoft.com/en-us/windows/win32/vss/vss-backup-state
>
> Additionally, the program would work as before with VSS-FULL in cases
> where VssOption doesn't exist, or VssOption value isn't a known backup ty=
pe.
>
> Kfir Manor (3):
>   add VssOption to installer
>   query VSS backup type
>   requester_freeze changes
>
>  qga/installer/qemu-ga.wxs   |  4 ++++
>  qga/vss-win32/requester.cpp | 41 ++++++++++++++++++++++++++++++++++++-
>  qga/vss-win32/vss-handles.h |  3 +++
>  3 files changed, 47 insertions(+), 1 deletion(-)
>
> --
> 2.38.1
>
>

--0000000000001a45cd05f49739e3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Marc-Andr=C3=A9,</div><div><br></div><div>Can you =
please review this patch set?<br></div><div><br></div><div><div><div dir=3D=
"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=
=3D"ltr"><div>Best Regards,</div><div>Konstantin Kostiuk.</div></div></div>=
</div><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Feb 9, 2023 at 10:50 AM Kfir Manor &lt;<a href=3D"m=
ailto:kfir@daynix.com">kfir@daynix.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">Resolves: <a href=3D"https://gitlab.c=
om/qemu-project/qemu/-/issues/775" rel=3D"noreferrer" target=3D"_blank">htt=
ps://gitlab.com/qemu-project/qemu/-/issues/775</a><br>
<br>
The problem, VSS backup type VSS-FULL (the only available VSS backup type c=
urrently) can break other backups that use VSS-FULL(for example, Bareos-Ful=
lbackup).<br>
<br>
Fix, add other backup types.<br>
<br>
Implementation, put the desired backup type number inside Regkey value HKEY=
_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\QEMU Guest Agent VSS Provi=
der\VssOption, so that the program can query the desired backup type.<br>
<br>
VSS backup types:<br>
number=C2=A0 =C2=A0type<br>
1=C2=A0 =C2=A0 =C2=A0 =C2=A0 VSS_BT_FULL<br>
2=C2=A0 =C2=A0 =C2=A0 =C2=A0 VSS_BT_INCREMENTAL<br>
3=C2=A0 =C2=A0 =C2=A0 =C2=A0 VSS_BT_DIFFERENTIAL<br>
4=C2=A0 =C2=A0 =C2=A0 =C2=A0 VSS_BT_LOG<br>
5=C2=A0 =C2=A0 =C2=A0 =C2=A0 VSS_BT_COPY<br>
<br>
for more information about the different backup types <a href=3D"https://le=
arn.microsoft.com/en-us/windows/win32/vss/vss-backup-state" rel=3D"noreferr=
er" target=3D"_blank">https://learn.microsoft.com/en-us/windows/win32/vss/v=
ss-backup-state</a><br>
<br>
Additionally, the program would work as before with VSS-FULL in cases where=
 VssOption doesn&#39;t exist, or VssOption value isn&#39;t a known backup t=
ype.<br>
<br>
Kfir Manor (3):<br>
=C2=A0 add VssOption to installer<br>
=C2=A0 query VSS backup type<br>
=C2=A0 requester_freeze changes<br>
<br>
=C2=A0qga/installer/qemu-ga.wxs=C2=A0 =C2=A0|=C2=A0 4 ++++<br>
=C2=A0qga/vss-win32/requester.cpp | 41 ++++++++++++++++++++++++++++++++++++=
-<br>
=C2=A0qga/vss-win32/vss-handles.h |=C2=A0 3 +++<br>
=C2=A03 files changed, 47 insertions(+), 1 deletion(-)<br>
<br>
-- <br>
2.38.1<br>
<br>
</blockquote></div>

--0000000000001a45cd05f49739e3--


