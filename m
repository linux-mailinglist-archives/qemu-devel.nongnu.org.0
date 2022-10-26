Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3AB560E998
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 21:50:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onmKe-0005n7-0p; Wed, 26 Oct 2022 15:44:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1onmKb-0005Ua-Ar
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 15:44:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1onmKZ-0006QF-Hn
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 15:44:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666813490;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rXqJBh2kfK7PGAuTpSd6xe8FQ0EdS2OYplNnMmHyBJc=;
 b=PhdgpBJJo0ryIUuZNO2W5kY2lm3QB4wmKSrmbGtHSsa1HP0xXcvVenaCJbxxnZXUlc0HEu
 2e99QgQ52Cdu/2jN3HOeuDyl3Xbn07ivvPJ5hJf69HKAVj+9WKFxutT03dB10R3OfDmfUa
 kRIByGULlMXFYECHlbV04DHaVxfMbWs=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-358-OdZTRMoXORWEI6WwH26vPg-1; Wed, 26 Oct 2022 15:44:49 -0400
X-MC-Unique: OdZTRMoXORWEI6WwH26vPg-1
Received: by mail-il1-f200.google.com with SMTP id
 f15-20020a056e020b4f00b002fa34db70f0so14046406ilu.2
 for <qemu-devel@nongnu.org>; Wed, 26 Oct 2022 12:44:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rXqJBh2kfK7PGAuTpSd6xe8FQ0EdS2OYplNnMmHyBJc=;
 b=WSHet9X3XW/5pbHqBwnR7pzLAauvVQBOzf5KxKn9ZVaq+abtitRVzeqAGtLL4/Ny9T
 COQ/3aSPFOWCKBTw3AIXRYzBsx4n8LrzvW9f1J1NxWp9Y1UARllfN9w4S3QlzOy/vBhb
 bXqtuoAiL+y8RX9YYyPHSAoanCpMnrLk58HceFON2xocWe4fgsffIXRztJbcwir8Xo2/
 wb90AytdZTLl6oOnJ/CEkA/q34zkh3ZdnMHmeEZYwobt1jYbnEOU57XicZG3Kps2LbKw
 mcGHOkXIj3c4Et9HbuuqoMl8f9P6gpnH2llBDK/exTH3i0hmpOlJdnDovNA0mUnnTFs1
 +IzQ==
X-Gm-Message-State: ACrzQf3ve6BqWFyNsTELg9m45ZNbwNQxhdW0qqmfPz+Ei5/2EfS24EWu
 GKoDPV1o7gLO32C94ePZZgSbcCqvBXWROdHU9P+NY+Aq73/s9lIJLtRTxkY+kuLU0nm7ZCRsBXq
 r5fgr0hxFgDGj14fAXcO+bqS96p0rWGU=
X-Received: by 2002:a05:6638:2484:b0:363:acbf:7945 with SMTP id
 x4-20020a056638248400b00363acbf7945mr30088653jat.175.1666813488227; 
 Wed, 26 Oct 2022 12:44:48 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM65BcMwZLlJ6VcLrLY8UH5Cp/Bqb7fIqrDFg2QCjyeyw63Xn8KDeehhCehwpesSaTHwLvi754wcY/dCjeeBODA=
X-Received: by 2002:a05:6638:2484:b0:363:acbf:7945 with SMTP id
 x4-20020a056638248400b00363acbf7945mr30088607jat.175.1666813487765; Wed, 26
 Oct 2022 12:44:47 -0700 (PDT)
MIME-Version: 1.0
References: <20221026085540.254253-1-marcandre.lureau@redhat.com>
In-Reply-To: <20221026085540.254253-1-marcandre.lureau@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 26 Oct 2022 23:44:35 +0400
Message-ID: <CAMxuvawAy_4sZq8dRDWdDJ2WP_SqjciAJQa0WVhjJPpN9T9_Cg@mail.gmail.com>
Subject: Re: [PULL v3 00/11] Dump patches
To: qemu-devel@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>, Halil Pasic <pasic@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, 
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000d86f4b05ebf54169"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--000000000000d86f4b05ebf54169
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Oct 26, 2022 at 12:55 PM <marcandre.lureau@redhat.com> wrote:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> The following changes since commit
> e750a7ace492f0b450653d4ad368a77d6f660fb8:
>
>   Merge tag 'pull-9p-20221024' of https://github.com/cschoenebeck/qemu
> into staging (2022-10-24 14:27:12 -0400)
>
> are available in the Git repository at:
>
>   https://gitlab.com/marcandre.lureau/qemu.git tags/dump-pull-request
>
> for you to fetch changes up to e38c24cb580735883769558801d9e2f2ba9f04c1:
>
>   dump/win_dump: limit number of processed PRCBs (2022-10-26 12:55:00
> +0400)
>
> ----------------------------------------------------------------
> dump queue
>
> Hi
>
> The "dump" queue, with:
> - [PATCH v3/v4 0/9] dump: Cleanup and consolidation
> - [PATCH v4 0/4] dump: add 32-bit guest Windows support
>


Hmm git-publish, what have you done?

In v1, it was:

- [PATCH v6/v7 00/10] dump: Add arch section and s390x PV dump
- [PATCH] dump/win_dump: limit number of processed PRCBs


And then v2 for some reason picked the old "dump" branch message :( I'll
try to reproduce and file a bug.


> ----------------------------------------------------------------
>
> Janosch Frank (10):
>   dump: Use a buffer for ELF section data and headers
>   dump: Write ELF section headers right after ELF header
>   dump: Reorder struct DumpState
>   dump: Reintroduce memory_offset and section_offset
>   dump: Add architecture section and section string table support
>   s390x: Add protected dump cap
>   s390x: Introduce PV query interface
>   include/elf.h: add s390x note types
>   s390x: Add KVM PV dump interface
>   s390x: pv: Add dump support
>
> Viktor Prutyanov (1):
>   dump/win_dump: limit number of processed PRCBs
>
>  include/elf.h                |   2 +
>  include/hw/s390x/pv.h        |  19 +++
>  include/sysemu/dump-arch.h   |   3 +
>  include/sysemu/dump.h        |  26 +++-
>  target/s390x/kvm/kvm_s390x.h |   1 +
>  dump/dump.c                  | 288 +++++++++++++++++++++++++++--------
>  dump/win_dump.c              |   7 +
>  hw/s390x/pv.c                | 112 ++++++++++++++
>  hw/s390x/s390-virtio-ccw.c   |   6 +
>  target/s390x/arch_dump.c     | 262 +++++++++++++++++++++++++++----
>  target/s390x/kvm/kvm.c       |   7 +
>  target/s390x/kvm/stubs.c     |  12 ++
>  target/s390x/kvm/meson.build |   2 +
>  13 files changed, 649 insertions(+), 98 deletions(-)
>  create mode 100644 target/s390x/kvm/stubs.c
>
> --
> 2.37.3
>
>

--000000000000d86f4b05ebf54169
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 26, 2022 at 12:55 PM &l=
t;<a href=3D"mailto:marcandre.lureau@redhat.com">marcandre.lureau@redhat.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat=
.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
<br>
The following changes since commit e750a7ace492f0b450653d4ad368a77d6f660fb8=
:<br>
<br>
=C2=A0 Merge tag &#39;pull-9p-20221024&#39; of <a href=3D"https://github.co=
m/cschoenebeck/qemu" rel=3D"noreferrer" target=3D"_blank">https://github.co=
m/cschoenebeck/qemu</a> into staging (2022-10-24 14:27:12 -0400)<br>
<br>
are available in the Git repository at:<br>
<br>
=C2=A0 <a href=3D"https://gitlab.com/marcandre.lureau/qemu.git" rel=3D"nore=
ferrer" target=3D"_blank">https://gitlab.com/marcandre.lureau/qemu.git</a> =
tags/dump-pull-request<br>
<br>
for you to fetch changes up to e38c24cb580735883769558801d9e2f2ba9f04c1:<br=
>
<br>
=C2=A0 dump/win_dump: limit number of processed PRCBs (2022-10-26 12:55:00 =
+0400)<br>
<br>
----------------------------------------------------------------<br>
dump queue<br>
<br>
Hi<br>
<br>
The &quot;dump&quot; queue, with:<br>
- [PATCH v3/v4 0/9] dump: Cleanup and consolidation<br>
- [PATCH v4 0/4] dump: add 32-bit guest Windows support<br></blockquote><di=
v><br></div><div><br></div><div>Hmm git-publish, what have you done?</div><=
br>In v1, it was:<br><br>- [PATCH v6/v7 00/10] dump: Add arch section and s=
390x PV dump<br>- [PATCH] dump/win_dump: limit number of processed PRCBs=C2=
=A0<div><br></div><div><br></div><div>And then v2 for some reason picked th=
e old &quot;dump&quot; branch message :( I&#39;ll try to reproduce and file=
 a bug.<br></div><div><br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
<br>
----------------------------------------------------------------<br>
<br>
Janosch Frank (10):<br>
=C2=A0 dump: Use a buffer for ELF section data and headers<br>
=C2=A0 dump: Write ELF section headers right after ELF header<br>
=C2=A0 dump: Reorder struct DumpState<br>
=C2=A0 dump: Reintroduce memory_offset and section_offset<br>
=C2=A0 dump: Add architecture section and section string table support<br>
=C2=A0 s390x: Add protected dump cap<br>
=C2=A0 s390x: Introduce PV query interface<br>
=C2=A0 include/elf.h: add s390x note types<br>
=C2=A0 s390x: Add KVM PV dump interface<br>
=C2=A0 s390x: pv: Add dump support<br>
<br>
Viktor Prutyanov (1):<br>
=C2=A0 dump/win_dump: limit number of processed PRCBs<br>
<br>
=C2=A0include/elf.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 =C2=A02 +<br>
=C2=A0include/hw/s390x/pv.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 19 +++<br>
=C2=A0include/sysemu/dump-arch.h=C2=A0 =C2=A0|=C2=A0 =C2=A03 +<br>
=C2=A0include/sysemu/dump.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 26 +++-<br>
=C2=A0target/s390x/kvm/kvm_s390x.h |=C2=A0 =C2=A01 +<br>
=C2=A0dump/dump.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 288 +++++++++++++++++++++++++++--------<br>
=C2=A0dump/win_dump.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A07 +<br>
=C2=A0hw/s390x/pv.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
| 112 ++++++++++++++<br>
=C2=A0hw/s390x/s390-virtio-ccw.c=C2=A0 =C2=A0|=C2=A0 =C2=A06 +<br>
=C2=A0target/s390x/arch_dump.c=C2=A0 =C2=A0 =C2=A0| 262 +++++++++++++++++++=
++++++++----<br>
=C2=A0target/s390x/kvm/kvm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A07 +<br=
>
=C2=A0target/s390x/kvm/stubs.c=C2=A0 =C2=A0 =C2=A0|=C2=A0 12 ++<br>
=C2=A0target/s390x/kvm/meson.build |=C2=A0 =C2=A02 +<br>
=C2=A013 files changed, 649 insertions(+), 98 deletions(-)<br>
=C2=A0create mode 100644 target/s390x/kvm/stubs.c<br>
<br>
-- <br>
2.37.3<br>
<br>
</blockquote></div></div>

--000000000000d86f4b05ebf54169--


