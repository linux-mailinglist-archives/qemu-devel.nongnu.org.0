Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE7A623D17
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 09:05:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot2X4-0007vX-Nx; Thu, 10 Nov 2022 03:03:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1ot2X2-0007ux-9e
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 03:03:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1ot2X0-0005qE-LH
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 03:03:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668067405;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Moil2DmWizFYkuyppYeY80fcZVz9zP9MjRuRdybJtCc=;
 b=RWq+I2kQHwM5KaWFQVX2KyzNpJnq5w7vnkr4gGhzxGFQehk6w+rjb3AysZb1qS/+xhoqW2
 0ynR6d+hRgJWbro5KhKg3ZL2EWRU5k1g9x7RfEr33EuFEYRzpbMg0w+/kGebGX4JUR7/dL
 j0T6I++UV5nVlQ0iNl8VGwvdFx9qWFY=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-625-Bj0ez8ECNGeX0DL8ClrmBQ-1; Thu, 10 Nov 2022 03:03:24 -0500
X-MC-Unique: Bj0ez8ECNGeX0DL8ClrmBQ-1
Received: by mail-oo1-f70.google.com with SMTP id
 v15-20020a4a244f000000b0049f177710abso400910oov.16
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 00:03:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Moil2DmWizFYkuyppYeY80fcZVz9zP9MjRuRdybJtCc=;
 b=kENDFu9NSF7fr2QBxNyFUlKnvW6PDdqJkOidxK6KrEmS+aFpXDoD5je41wwkp1iIyp
 DsGU77wCkRfn27gk9hv5HZNxxPBMyxwcedgJcbOBh+7p9r//J63FlyBOQuwVv7nv9sQA
 ri7rlTSsmIGQS5lXt+YpSs+Az7Eewyv97WNUl3yOg7j3gXJ3PCihhjHbJCayCBxWnBtv
 stZRJXEpfeX5H4uKWTkJrXkqQSp7BZSTu/bWK0k4mjZfK+BWrNK4G9oowjVFel19h41t
 UG6ZTBlseQI6Y4IHlAgwinqa3ZOnnXZYlRZM4yZct7KKQLe8hdT0N0Lj9S2Uixnfn2Hw
 yVsA==
X-Gm-Message-State: ACrzQf0VPDdTlTZ2US5ct7E9aXLb6lFgGCbwJsGNrTbZ4Wk25Q42DLMn
 9aSdrZgmMcDASOuTM4ehH7L+L3xMqgWQIioQHXwXQ2vl9pnXlXwb6l3nMD8lqvVk9IP4PcOBKwO
 fKn84jcJaLmNjD2U0h5Pq7Etis2DC+3o=
X-Received: by 2002:a05:6870:1f13:b0:13b:d898:8aa7 with SMTP id
 pd19-20020a0568701f1300b0013bd8988aa7mr1189948oab.14.1668067403546; 
 Thu, 10 Nov 2022 00:03:23 -0800 (PST)
X-Google-Smtp-Source: AMsMyM7yziXLChOqiW6Ma6pJok+jpz2EsMbIBLbeb9vhzf1oiOkXafkD/F81lEbOaQXmn5rsvaKqRarVk3vntlGFhM0=
X-Received: by 2002:a05:6870:1f13:b0:13b:d898:8aa7 with SMTP id
 pd19-20020a0568701f1300b0013bd8988aa7mr1189931oab.14.1668067403299; Thu, 10
 Nov 2022 00:03:23 -0800 (PST)
MIME-Version: 1.0
References: <20221110062329.13363-1-akihiko.odaki@daynix.com>
 <20221110062329.13363-2-akihiko.odaki@daynix.com>
In-Reply-To: <20221110062329.13363-2-akihiko.odaki@daynix.com>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Thu, 10 Nov 2022 10:03:12 +0200
Message-ID: <CAPMcbCr9xs2iTnN7Be8HUH4FF8uBkJff8Gs+7XzWzUaPJNh6ZQ@mail.gmail.com>
Subject: Re: [PATCH 01/10] qga: Remove platform GUID definitions
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, virtio-fs@redhat.com, 
 Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Michael Roth <michael.roth@amd.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, 
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Yan Vugenfirer <yan@daynix.com>
Content-Type: multipart/alternative; boundary="00000000000009137a05ed193518"
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

--00000000000009137a05ed193518
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 10, 2022 at 8:25 AM Akihiko Odaki <akihiko.odaki@daynix.com>
wrote:

> GUID_DEVINTERFACE_DISK and GUID_DEVINTERFACE_STORAGEPORT are already
> defined by MinGW-w64. They are not only unnecessary, but can lead to
> duplicate definition errors at link time with some unknown condition.
>

What version of MinGW-w64 do you use? We have a compilation problem
in CI and CentOS Stream without this.


>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>  qga/commands-win32.c | 7 -------
>  1 file changed, 7 deletions(-)
>
> diff --git a/qga/commands-win32.c b/qga/commands-win32.c
> index ec9f55b453..dde5d401bb 100644
> --- a/qga/commands-win32.c
> +++ b/qga/commands-win32.c
> @@ -506,13 +506,6 @@ static GuestDiskBusType
> find_bus_type(STORAGE_BUS_TYPE bus)
>      return win2qemu[(int)bus];
>  }
>
> -DEFINE_GUID(GUID_DEVINTERFACE_DISK,
> -        0x53f56307L, 0xb6bf, 0x11d0, 0x94, 0xf2,
> -        0x00, 0xa0, 0xc9, 0x1e, 0xfb, 0x8b);
> -DEFINE_GUID(GUID_DEVINTERFACE_STORAGEPORT,
> -        0x2accfe60L, 0xc130, 0x11d2, 0xb0, 0x82,
> -        0x00, 0xa0, 0xc9, 0x1e, 0xfb, 0x8b);
> -
>  static void get_pci_address_for_device(GuestPCIAddress *pci,
>                                         HDEVINFO dev_info)
>  {
> --
> 2.38.1
>
>

--00000000000009137a05ed193518
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Nov 10, 2022 at 8:25 AM Akihi=
ko Odaki &lt;<a href=3D"mailto:akihiko.odaki@daynix.com">akihiko.odaki@dayn=
ix.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">GUID_DEVINTERFACE_DISK and GUID_DEVINTERFACE_STORAGEPORT are already<=
br>
defined by MinGW-w64. They are not only unnecessary, but can lead to<br>
duplicate definition errors at link time with some unknown condition.<br></=
blockquote><div><br></div><div>What version of MinGW-w64 do you use? We hav=
e a compilation problem</div><div>in CI and CentOS Stream without this.<br>=
</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Signed-off-by: Akihiko Odaki &lt;<a href=3D"mailto:akihiko.odaki@daynix.com=
" target=3D"_blank">akihiko.odaki@daynix.com</a>&gt;<br>
---<br>
=C2=A0qga/commands-win32.c | 7 -------<br>
=C2=A01 file changed, 7 deletions(-)<br>
<br>
diff --git a/qga/commands-win32.c b/qga/commands-win32.c<br>
index ec9f55b453..dde5d401bb 100644<br>
--- a/qga/commands-win32.c<br>
+++ b/qga/commands-win32.c<br>
@@ -506,13 +506,6 @@ static GuestDiskBusType find_bus_type(STORAGE_BUS_TYPE=
 bus)<br>
=C2=A0 =C2=A0 =C2=A0return win2qemu[(int)bus];<br>
=C2=A0}<br>
<br>
-DEFINE_GUID(GUID_DEVINTERFACE_DISK,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x53f56307L, 0xb6bf, 0x11d0, 0x94, 0xf2,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x00, 0xa0, 0xc9, 0x1e, 0xfb, 0x8b);<br>
-DEFINE_GUID(GUID_DEVINTERFACE_STORAGEPORT,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x2accfe60L, 0xc130, 0x11d2, 0xb0, 0x82,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x00, 0xa0, 0xc9, 0x1e, 0xfb, 0x8b);<br>
-<br>
=C2=A0static void get_pci_address_for_device(GuestPCIAddress *pci,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 HDEVINFO=
 dev_info)<br>
=C2=A0{<br>
-- <br>
2.38.1<br>
<br>
</blockquote></div></div>

--00000000000009137a05ed193518--


