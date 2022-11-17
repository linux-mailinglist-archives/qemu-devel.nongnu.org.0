Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7055C62D75F
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 10:46:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovbT2-0001WT-9X; Thu, 17 Nov 2022 04:45:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1ovbSk-0001Ut-UP
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 04:45:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1ovbSh-0001O4-Sr
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 04:45:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668678334;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3YkYbvlE+1kiMJaviTFb4tHXZf+dYDKuklY2iBNzCX4=;
 b=EBoNsjy8uYIfMHv8j11LsIgHewmE+dXw1ZpmGIhnykvg42+KpPfeuguKPK3pw0Z2+YNHhU
 2TpUGqpUwRrzfFmLMKnhJRFIent4tC/nn92U28p0nhOBjmrFyvoBdrunHiyBTEwKUxJ88o
 /LuepZNblREkV47P1hA+F9/NVHUZn88=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-86-UKioKDOZNiCDJ-XjzAY3fQ-1; Thu, 17 Nov 2022 04:45:33 -0500
X-MC-Unique: UKioKDOZNiCDJ-XjzAY3fQ-1
Received: by mail-il1-f199.google.com with SMTP id
 w9-20020a056e021c8900b0030247910269so904151ill.4
 for <qemu-devel@nongnu.org>; Thu, 17 Nov 2022 01:45:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3YkYbvlE+1kiMJaviTFb4tHXZf+dYDKuklY2iBNzCX4=;
 b=C2Rtbev2/DjW+7c7DIauW/ymGciz0zj2ZNVcILlHIgIAdZkxz9MV60BCch8zClDaHF
 cXLz+dZiCPkkC6l6OtD+Q6Hs/OIBJafTo3c/FcwmDxn0EJc41uFT2JP0O7s6zLgfdbev
 4Cl4kAxA51xq0UBcmLjUnU3z5qlM9pjYDSoxPawMivjnFObE9TYy1z4fVHASM5u4wEYI
 JyPdJAaijnPchT9p+kHx0LV+7nagBqiAkODtdVL2LUQc0UJhXgzTMvPGHKFAhb7bvBJj
 yMlnnZm0LGF9LTZcQsD8komb/gIu/43y+5U2jdghuxtrQQvUP5dJJ5ZDiwv7UJ358wbE
 huuQ==
X-Gm-Message-State: ANoB5pntmdF/ojNdFIaqNWG2ejdozyO8MmNSIl47iv+Tca+gpzLXmZgj
 y7MOP+a9ovMNpJEivgY6yI0XzA7Sj+dx60WseIXnvyizAG5XFf2NYiTsiSMzOdxibutL0XyB+6M
 2MDyqY6A0FOn/ZShb1J2r/X5ivKugHQU=
X-Received: by 2002:a5e:aa15:0:b0:6cd:cea6:28af with SMTP id
 s21-20020a5eaa15000000b006cdcea628afmr970990ioe.151.1668678332440; 
 Thu, 17 Nov 2022 01:45:32 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5eWqXcmAqIp107vE6AkWwsjT8VcjymYdqrueques4PBB0zqdenSR9EMOsz70AcHgYTcOm4DC30TnoOBq8NG0Y=
X-Received: by 2002:a5e:aa15:0:b0:6cd:cea6:28af with SMTP id
 s21-20020a5eaa15000000b006cdcea628afmr970981ioe.151.1668678332194; Thu, 17
 Nov 2022 01:45:32 -0800 (PST)
MIME-Version: 1.0
References: <20221110100629.61496-1-akihiko.odaki@daynix.com>
 <20221110100629.61496-2-akihiko.odaki@daynix.com>
In-Reply-To: <20221110100629.61496-2-akihiko.odaki@daynix.com>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Thu, 17 Nov 2022 11:45:21 +0200
Message-ID: <CAPMcbCrGkXzeZex_veDYV8HSMMzH8d=zy1jkf21t4qFekGmDpg@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] qga: Remove platform GUID definitions
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
Content-Type: multipart/alternative; boundary="0000000000003c364405eda773b4"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kkostiuk@redhat.com;
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

--0000000000003c364405eda773b4
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>

Will merge this patch in QGA series

On Thu, Nov 10, 2022 at 12:06 PM Akihiko Odaki <akihiko.odaki@daynix.com>
wrote:

> GUID_DEVINTERFACE_DISK and GUID_DEVINTERFACE_STORAGEPORT are already
> defined by MinGW-w64. They are not only unnecessary, but can lead to
> duplicate definition errors at link time with some unknown condition.
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

--0000000000003c364405eda773b4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Reviewed-by: Konstantin Kostiuk &lt;<a href=3D"mailto=
:kkostiuk@redhat.com" target=3D"_blank">kkostiuk@redhat.com</a>&gt;</div><d=
iv><br></div><div>Will merge this patch in QGA series <br></div></div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Nov=
 10, 2022 at 12:06 PM Akihiko Odaki &lt;<a href=3D"mailto:akihiko.odaki@day=
nix.com">akihiko.odaki@daynix.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">GUID_DEVINTERFACE_DISK and GUID_DEVINTERFA=
CE_STORAGEPORT are already<br>
defined by MinGW-w64. They are not only unnecessary, but can lead to<br>
duplicate definition errors at link time with some unknown condition.<br>
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
</blockquote></div>

--0000000000003c364405eda773b4--


