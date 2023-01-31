Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D50682FF2
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 15:58:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMrg5-00052f-An; Tue, 31 Jan 2023 09:32:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1pMrfz-0004zX-Rq
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 09:31:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1pMrfx-0000xG-N3
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 09:31:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675175514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aLa60uyAprgcpRGcySoQxmRuMo+xNKMcS9ALxIqdci4=;
 b=CYJPKn107Vj08teIB5ixzBmJ4EinYv0sFJtokGyZrfkIJWG83eXrvWApF2gw9Ij1I2c3Pu
 9aO3vTqU82LiaQsJ7relnwYe8DmQArojYAobzdIw46fNwm69E6/bMgn+GaJq3yLapVOjZL
 VfVTWFAp7LeSc0Sg3BUzPTiiZaEuMCY=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-182-Y353f_OHP6mXPrkx7nuISQ-1; Tue, 31 Jan 2023 09:31:52 -0500
X-MC-Unique: Y353f_OHP6mXPrkx7nuISQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 w16-20020a056402129000b004a1f1a2e79dso8566319edv.23
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 06:31:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aLa60uyAprgcpRGcySoQxmRuMo+xNKMcS9ALxIqdci4=;
 b=JP0GMDR6Lee5dRf/OGOvA8yNnWEIQCQyF+sSoTCkxXzSYMf22GFSRbngwEZNZ+G4NC
 /xgKCnNAiv4G6VnB1WgSUh48zaqFL6LYeADpJiRH8XpMQQXHB2vPAg21JfrdsTfdLRaM
 QWPGLaOXxyMzZZbrSzIp6CquNMLhS2RVBj6nLovd5Ko8LwtEApWPg3aF3AJ+1LvV/dH0
 AVWbvp8Tsqkv8qBT+fA8Uj8YI30ctnszCXE+YFmzzwluzrCH5Na23KB7lyrHDmG7NhNc
 3l5KVs10Oo696qGoUM3H0HysG0USrVJ0pLb4FwZqfSz066FeLNFLyHxB0q/iDKPqwCYP
 hjZg==
X-Gm-Message-State: AFqh2kqDiqFjd2OuJBkxc9y6MGForY0CT5kHDxnxJZGv34PvbNm33LV5
 ESMcB3JThvi4HobTCmAWVc/o3lavqBkVUnaoQCnwCREuW4e7WxzdwTwVX38XZq6okH9En9kxucV
 cf5KiKwegilQZI1YsyDKcIrsaQX4oULs=
X-Received: by 2002:a17:906:4f98:b0:871:be7:c98c with SMTP id
 o24-20020a1709064f9800b008710be7c98cmr8886273eju.47.1675175511279; 
 Tue, 31 Jan 2023 06:31:51 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtATtcHmgQy9295V/IR6V1AjrPqr5HgT5UdsUHzoKBjWLeRlBuooRJk2s+Ld/GC3a+adhxvDU845rMWMjelLOg=
X-Received: by 2002:a17:906:4f98:b0:871:be7:c98c with SMTP id
 o24-20020a1709064f9800b008710be7c98cmr8886264eju.47.1675175511087; Tue, 31
 Jan 2023 06:31:51 -0800 (PST)
MIME-Version: 1.0
References: <20230130095202.2773186-1-bin.meng@windriver.com>
In-Reply-To: <20230130095202.2773186-1-bin.meng@windriver.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 31 Jan 2023 18:31:39 +0400
Message-ID: <CAMxuvayW7mzQcVLrB8v-adoKXVKgq-pGCf6uT-cURcmDW51bFQ@mail.gmail.com>
Subject: Re: [PATCH v4 00/16] hw/9pfs: Add 9pfs support for Windows
To: Bin Meng <bin.meng@windriver.com>
Cc: Greg Kurz <groug@kaod.org>, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 qemu-devel@nongnu.org, Guohuai Shi <guohuai.shi@windriver.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Thomas Huth <thuth@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000046760d05f390318e"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
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

--00000000000046760d05f390318e
Content-Type: text/plain; charset="UTF-8"

Hi

On Mon, Jan 30, 2023 at 1:52 PM Bin Meng <bin.meng@windriver.com> wrote:

> At present there is no Windows support for 9p file system.
> This series adds initial Windows support for 9p file system.
>
> 'local' file system backend driver is supported on Windows,
> including open, read, write, close, rename, remove, etc.
> All security models are supported. The mapped (mapped-xattr)
> security model is implemented using NTFS Alternate Data Stream
> (ADS) so the 9p export path shall be on an NTFS partition.
>
> 'synth' driver is adapted for Windows too so that we can now
> run qtests on Windows for 9p related regression testing.
>
> Example command line to test:
>
>   "-fsdev local,path=c:\msys64,security_model=mapped,id=p9 -device
> virtio-9p-pci,fsdev=p9,mount_tag=p9fs"
>
> Base-commit: 13356edb87506c148b163b8c7eb0695647d00c2a
>
> Changes in v4:
> - Fixed 9pfs mounted as read-only issue on Windows host, adding a
>   win32_error_to_posix() to translate Windows native API error to
>   POSIX one.
> - Fixed errors of handling symbolic links
> - Added forward declaration to avoid using 'void *'
> - Implemented Windows specific xxxdir() APIs for safe directory access
>
>
Sorry to look a bit late at this series, I don't know what was discussed
previously.

My general feeling is that a lot of this FS portability work would be
better handled by using GIO (even though this may add some extra
dependency). GIO lacks some features on win32 (for example xattributes on
win32), but they could have been proposed there too and benefiting other
apps.

Btw, I would not count on mingw adding support for flags/API (S_IFLNK etc),
that do not make sense on win32. Did you request them?

I suppose the 9pfs maintainers (Greg, Christian) will have to decide. I can
take a deeper look if the overall approach is approved, and as needed.

Bin Meng (2):
>   hw/9pfs: Update helper qemu_stat_rdev()
>   hw/9pfs: Add a helper qemu_stat_blksize()
>
> Guohuai Shi (14):
>   hw/9pfs: Add missing definitions for Windows
>   hw/9pfs: Implement Windows specific utilities functions for 9pfs
>   hw/9pfs: Replace the direct call to xxxdir() APIs with a wrapper
>   hw/9pfs: Implement Windows specific xxxdir() APIs
>   hw/9pfs: Update the local fs driver to support Windows
>   hw/9pfs: Support getting current directory offset for Windows
>   hw/9pfs: Disable unsupported flags and features for Windows
>   hw/9pfs: Update v9fs_set_fd_limit() for Windows
>   hw/9pfs: Add Linux error number definition
>   hw/9pfs: Translate Windows errno to Linux value
>   fsdev: Disable proxy fs driver on Windows
>   hw/9pfs: Update synth fs driver for Windows
>   tests/qtest: virtio-9p-test: Adapt the case for win32
>   meson.build: Turn on virtfs for Windows
>
>  meson.build                           |   10 +-
>  fsdev/file-op-9p.h                    |   33 +
>  hw/9pfs/9p-linux-errno.h              |  151 +++
>  hw/9pfs/9p-local.h                    |    8 +
>  hw/9pfs/9p-util.h                     |  139 ++-
>  hw/9pfs/9p.h                          |   43 +
>  tests/qtest/libqos/virtio-9p-client.h |    7 +
>  fsdev/qemu-fsdev.c                    |    2 +
>  hw/9pfs/9p-local.c                    |  269 ++++-
>  hw/9pfs/9p-synth.c                    |    5 +-
>  hw/9pfs/9p-util-win32.c               | 1305 +++++++++++++++++++++++++
>  hw/9pfs/9p.c                          |   90 +-
>  hw/9pfs/codir.c                       |    2 +-
>  fsdev/meson.build                     |    1 +
>  hw/9pfs/meson.build                   |    8 +-
>  15 files changed, 2008 insertions(+), 65 deletions(-)
>  create mode 100644 hw/9pfs/9p-linux-errno.h
>  create mode 100644 hw/9pfs/9p-util-win32.c
>
> --
> 2.25.1
>
>

--00000000000046760d05f390318e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jan 30, 2023 at 1:52 PM Bin=
 Meng &lt;<a href=3D"mailto:bin.meng@windriver.com">bin.meng@windriver.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">A=
t present there is no Windows support for 9p file system.<br>
This series adds initial Windows support for 9p file system.<br>
<br>
&#39;local&#39; file system backend driver is supported on Windows,<br>
including open, read, write, close, rename, remove, etc.<br>
All security models are supported. The mapped (mapped-xattr)<br>
security model is implemented using NTFS Alternate Data Stream<br>
(ADS) so the 9p export path shall be on an NTFS partition.<br>
<br>
&#39;synth&#39; driver is adapted for Windows too so that we can now<br>
run qtests on Windows for 9p related regression testing.<br>
<br>
Example command line to test:<br>
<br>
=C2=A0 &quot;-fsdev local,path=3Dc:\msys64,security_model=3Dmapped,id=3Dp9 =
-device virtio-9p-pci,fsdev=3Dp9,mount_tag=3Dp9fs&quot;<br>
<br>
Base-commit: 13356edb87506c148b163b8c7eb0695647d00c2a<br>
<br>
Changes in v4:<br>
- Fixed 9pfs mounted as read-only issue on Windows host, adding a<br>
=C2=A0 win32_error_to_posix() to translate Windows native API error to<br>
=C2=A0 POSIX one.<br>
- Fixed errors of handling symbolic links<br>
- Added forward declaration to avoid using &#39;void *&#39;<br>
- Implemented Windows specific xxxdir() APIs for safe directory access<br>
<br></blockquote><div><br></div><div>Sorry to look a bit late at this serie=
s, I don&#39;t know what was discussed previously.</div><div><br></div><div=
>My general feeling is that a lot of this FS portability work would be bett=
er handled by using GIO (even though this may add some extra dependency). G=
IO lacks some features on win32 (for example xattributes on win32), but the=
y could have been proposed there too and benefiting other apps.</div><div><=
br></div><div>Btw, I would not count on mingw adding support for flags/API =
(S_IFLNK etc), that do not make sense on win32. Did you request them?<br></=
div><div>=C2=A0</div><div>I suppose the 9pfs maintainers (Greg, Christian) =
will have to decide. I can take a deeper look if the overall approach is ap=
proved, and as needed.<br></div><div><br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">
Bin Meng (2):<br>
=C2=A0 hw/9pfs: Update helper qemu_stat_rdev()<br>
=C2=A0 hw/9pfs: Add a helper qemu_stat_blksize()<br>
<br>
Guohuai Shi (14):<br>
=C2=A0 hw/9pfs: Add missing definitions for Windows<br>
=C2=A0 hw/9pfs: Implement Windows specific utilities functions for 9pfs<br>
=C2=A0 hw/9pfs: Replace the direct call to xxxdir() APIs with a wrapper<br>
=C2=A0 hw/9pfs: Implement Windows specific xxxdir() APIs<br>
=C2=A0 hw/9pfs: Update the local fs driver to support Windows<br>
=C2=A0 hw/9pfs: Support getting current directory offset for Windows<br>
=C2=A0 hw/9pfs: Disable unsupported flags and features for Windows<br>
=C2=A0 hw/9pfs: Update v9fs_set_fd_limit() for Windows<br>
=C2=A0 hw/9pfs: Add Linux error number definition<br>
=C2=A0 hw/9pfs: Translate Windows errno to Linux value<br>
=C2=A0 fsdev: Disable proxy fs driver on Windows<br>
=C2=A0 hw/9pfs: Update synth fs driver for Windows<br>
=C2=A0 tests/qtest: virtio-9p-test: Adapt the case for win32<br>
=C2=A0 meson.build: Turn on virtfs for Windows<br>
<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A010 +-<br>
=C2=A0fsdev/file-op-9p.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A033 +<br>
=C2=A0hw/9pfs/9p-linux-errno.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 151 +++<br>
=C2=A0hw/9pfs/9p-local.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 8 +<br>
=C2=A0hw/9pfs/9p-util.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 139 ++-<br>
=C2=A0hw/9pfs/9p.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A043 +<br>
=C2=A0tests/qtest/libqos/virtio-9p-client.h |=C2=A0 =C2=A0 7 +<br>
=C2=A0fsdev/qemu-fsdev.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 2 +<br>
=C2=A0hw/9pfs/9p-local.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 269 ++++-<br>
=C2=A0hw/9pfs/9p-synth.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 5 +-<br>
=C2=A0hw/9pfs/9p-util-win32.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 1305 +++++++++++++++++++++++++<br>
=C2=A0hw/9pfs/9p.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A090 +-<br>
=C2=A0hw/9pfs/codir.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 2 +-<br>
=C2=A0fsdev/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 1 +<br>
=C2=A0hw/9pfs/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 8 +-<br>
=C2=A015 files changed, 2008 insertions(+), 65 deletions(-)<br>
=C2=A0create mode 100644 hw/9pfs/9p-linux-errno.h<br>
=C2=A0create mode 100644 hw/9pfs/9p-util-win32.c<br>
<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--00000000000046760d05f390318e--


