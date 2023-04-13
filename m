Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A15D6E1623
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 22:53:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pn3ut-0007pH-0r; Thu, 13 Apr 2023 16:51:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1pn3uQ-0007nY-UL
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 16:51:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1pn3uP-0000OS-0i
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 16:51:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681419065;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HELIOcradUziOLbE51wHFdzxHKxwkt66vhUTuo85GZg=;
 b=WH0hsbfsG+7Yce1PEnAqNvNbmF5fg7saAPpnlBreKHc2VN+7K8OAvsMM7rlkMJMPJ6k9H2
 xBeR5xUoYD06kNQihSvP3yOXhvfKqZlmeAdoMGiQGoV8XIGqd+26fbsHOnP+r64lqbi0Qd
 8pBvDuWAel3SFAECjCPKRVw2U16PzCo=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-612-Blo8N8W4Mjq3_CAgH8YXXg-1; Thu, 13 Apr 2023 16:51:01 -0400
X-MC-Unique: Blo8N8W4Mjq3_CAgH8YXXg-1
Received: by mail-yw1-f200.google.com with SMTP id
 00721157ae682-54fbb2ee579so35417227b3.14
 for <qemu-devel@nongnu.org>; Thu, 13 Apr 2023 13:51:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681419061; x=1684011061;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HELIOcradUziOLbE51wHFdzxHKxwkt66vhUTuo85GZg=;
 b=HpimFtEfjySDG16ouPzhD2XbhUcDe7tNH+J2ziNsDeWC8B5yLJkRqwUXkyYjTHXS93
 rgj5IEEdlA+kfjYp6Tg+30gBefr07492yOVQDzN00jITGw3ZjZxeQvtbFj/RMtQ60FzJ
 qEJojYbw6vL8LL84TgdzzFhlPeuIj7nEt1E7+AQVhijkw7WcwglfjRmb4K2k34KyDz3z
 rsJKERQyZlQjp6DBmkE70eWYjPGg1j1SJycebvO0d/La7N6ZYZmcNKlJWtJ1pP1hGNxd
 RlRzl1M3NjE0I9hNexXCHF44IqJefdvPkD/79EaOedld5sK6eNEGAMcmEFb0FWBQaFqq
 StWA==
X-Gm-Message-State: AAQBX9cjXnwwL3gMnHoyBk7BcwnaX9S+T7njp0aC5eBQPs4tyNS2nmMG
 VbfD8/w5O5NcIp42q2fb7l+rVPuV62xqT6lk/ixskpf0HuJUtGbB7+ReUbEuT3I/7BAKcit/HDL
 l3cVM3dZ8I0Jcsd/kb4QNyFkIns5Lhio=
X-Received: by 2002:a81:4428:0:b0:54f:a542:4b4b with SMTP id
 r40-20020a814428000000b0054fa5424b4bmr2260259ywa.6.1681419060682; 
 Thu, 13 Apr 2023 13:51:00 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZF9oEFd4mYL5ttVP5bT8xAUEWQGw3fcPPsY1FNrVZ+Y8X8wlgy60w/hZrZdczcwvnfAo9W/KkhMN3SATT74dI=
X-Received: by 2002:a81:4428:0:b0:54f:a542:4b4b with SMTP id
 r40-20020a814428000000b0054fa5424b4bmr2260254ywa.6.1681419060364; Thu, 13 Apr
 2023 13:51:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230413203051.2344192-1-mjt@msgid.tls.msk.ru>
In-Reply-To: <20230413203051.2344192-1-mjt@msgid.tls.msk.ru>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Thu, 13 Apr 2023 23:50:49 +0300
Message-ID: <CAPMcbCqDEtMAQdzdryuiwj3afwoj5RCEC+nAhmCi40pF4kG9pw@mail.gmail.com>
Subject: Re: [PATCH 00/21] Patch Round-up for stable 7.2.2,
 freeze on 2023-04-20
To: mjt@tls.msk.ru
Cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000cfd8c305f93de1f4"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--000000000000cfd8c305f93de1f4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Michael,

You cherry-picked one of my patch qga/win32: Remove change action from MSI
installer
but it is part of the CVE fix.

Please cherry-pick one more patch.

Original mail:
https://patchew.org/QEMU/20230303192008.109549-1-kkostiuk@redhat.com/

Best Regards,
Konstantin Kostiuk.


On Thu, Apr 13, 2023 at 11:35=E2=80=AFPM Michael Tokarev <mjt@tls.msk.ru> w=
rote:

> Despite 8.0 release is almost here, I'd love to make another 7.2.x
> release, adding more fixes which has been collected so far.
>
> The following new patches are queued for QEMU stable v7.2.2:
>
>   https://gitlab.com/mjt0k/qemu/-/commits/stable-7.2-staging/
>
> Patch freeze is 2023-04-20, and the release is planned for 2023-04-22.
>
> Please respond here or CC qemu-stable@nongnu.org on any additional patche=
s
> you think should (or shouldn't) be included in the release.
>
> Thanks!
>
> /mjt
>
> ----------------------------------------------------------------
> Bernhard Beschow (1):
>       qemu/osdep: Switch position of "extern" and "G_NORETURN"
>
> C=C3=A9dric Le Goater (1):
>       target/s390x: Fix float_comp_to_cc() prototype
>
> Fiona Ebner (1):
>       hw/net/vmxnet3: allow VMXNET3_MAX_MTU itself as a value
>
> Ilya Leoshkevich (2):
>       target/s390x: Fix EXECUTE of relative long instructions
>       linux-user: Fix unaligned memory access in prlimit64 syscall
>
> Klaus Jensen (1):
>       hw/nvme: fix memory leak in nvme_dsm
>
> Konstantin Kostiuk (1):
>       qga/win32: Remove change action from MSI installer
>
> Lukas Tschoke (1):
>       block/vhdx: fix dynamic VHDX BAT corruption
>
> Marc-Andr=C3=A9 Lureau (1):
>       ui: fix crash on serial reset, during init
>
> Markus Armbruster (2):
>       qga: Drop dangling reference to QERR_QGA_LOGGING_DISABLED
>       hw/arm: do not free machine->fdt in arm_load_dtb()
>
> Mathis Marion (2):
>       linux-user: fix sockaddr_in6 endianness
>       linux-user: fix timerfd read endianness conversion
>
> Nina Schoetterl-Glausch (1):
>       target/s390x: Fix emulation of C(G)HRL
>
> Peter Xu (1):
>       io: tls: Inherit QIO_CHANNEL_FEATURE_SHUTDOWN on server side
>
> Pierrick Bouvier (1):
>       qga/vss-win32: fix warning for clang++-15
>
> Richard Henderson (2):
>       target/s390x: Split out gen_ri2
>       target/arm: Handle m-profile in arm_is_secure
>
> Stefan Hajnoczi (1):
>       aio-posix: fix race between epoll upgrade and aio_set_fd_handler()
>
> Thomas Huth (1):
>       target/s390x/arch_dump: Fix memory corruption in
> s390x_write_elf64_notes()
>
> Yuval Shaia (1):
>       hw/pvrdma: Protect against buggy or malicious guest driver
>
>  block/vhdx-log.c                     |  2 +-
>  hw/arm/boot.c                        |  5 ++++-
>  hw/net/vmxnet3.c                     |  2 +-
>  hw/nvme/ctrl.c                       |  3 +++
>  hw/rdma/vmw/pvrdma_cmd.c             |  6 ++++++
>  include/qemu/osdep.h                 |  2 +-
>  io/channel-tls.c                     |  3 +++
>  linux-user/fd-trans.c                | 10 ++++++---
>  linux-user/fd-trans.h                |  1 +
>  linux-user/generic/target_resource.h |  4 ++--
>  linux-user/syscall.c                 | 21 ++++++++++++------
>  qga/commands.c                       |  5 ++---
>  qga/installer/qemu-ga.wxs            |  1 +
>  qga/vss-win32/install.cpp            |  2 +-
>  target/arm/cpu.h                     |  3 +++
>  target/s390x/arch_dump.c             |  2 +-
>  target/s390x/cpu.h                   |  1 +
>  target/s390x/s390x-internal.h        |  3 ++-
>  target/s390x/tcg/insn-data.h.inc     |  4 ++--
>  target/s390x/tcg/mem_helper.c        |  1 +
>  target/s390x/tcg/translate.c         | 41
> ++++++++++++++++++++++++++++--------
>  ui/gtk.c                             |  4 +++-
>  util/fdmon-epoll.c                   | 25 ++++++++++++++++------
>  23 files changed, 111 insertions(+), 40 deletions(-)
>
>

--000000000000cfd8c305f93de1f4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Michael,</div><div><br></div><div>You cherry-picke=
d one of my patch qga/win32: Remove change action from MSI installer</div><=
div>but it is part of the CVE fix. <br></div><div><br></div><div>Please che=
rry-pick one more patch.<br></div><div><br></div><div>Original mail: <a hre=
f=3D"https://patchew.org/QEMU/20230303192008.109549-1-kkostiuk@redhat.com/"=
>https://patchew.org/QEMU/20230303192008.109549-1-kkostiuk@redhat.com/</a><=
/div><div><br></div><div><div><div><div><div class=3D"gmail_signature" data=
-smartmail=3D"gmail_signature"><div><div>Best Regards,</div><div>Konstantin=
 Kostiuk.</div></div></div></div><br></div></div></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Apr 13, 2023=
 at 11:35=E2=80=AFPM Michael Tokarev &lt;<a href=3D"mailto:mjt@tls.msk.ru">=
mjt@tls.msk.ru</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">Despite 8.0 release is almost here, I&#39;d love to make anot=
her 7.2.x<br>
release, adding more fixes which has been collected so far.<br>
<br>
The following new patches are queued for QEMU stable v7.2.2:<br>
<br>
=C2=A0 <a href=3D"https://gitlab.com/mjt0k/qemu/-/commits/stable-7.2-stagin=
g/" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/mjt0k/qemu/-/co=
mmits/stable-7.2-staging/</a><br>
<br>
Patch freeze is 2023-04-20, and the release is planned for 2023-04-22.<br>
<br>
Please respond here or CC <a href=3D"mailto:qemu-stable@nongnu.org" target=
=3D"_blank">qemu-stable@nongnu.org</a> on any additional patches<br>
you think should (or shouldn&#39;t) be included in the release.<br>
<br>
Thanks!<br>
<br>
/mjt<br>
<br>
----------------------------------------------------------------<br>
Bernhard Beschow (1):<br>
=C2=A0 =C2=A0 =C2=A0 qemu/osdep: Switch position of &quot;extern&quot; and =
&quot;G_NORETURN&quot;<br>
<br>
C=C3=A9dric Le Goater (1):<br>
=C2=A0 =C2=A0 =C2=A0 target/s390x: Fix float_comp_to_cc() prototype<br>
<br>
Fiona Ebner (1):<br>
=C2=A0 =C2=A0 =C2=A0 hw/net/vmxnet3: allow VMXNET3_MAX_MTU itself as a valu=
e<br>
<br>
Ilya Leoshkevich (2):<br>
=C2=A0 =C2=A0 =C2=A0 target/s390x: Fix EXECUTE of relative long instruction=
s<br>
=C2=A0 =C2=A0 =C2=A0 linux-user: Fix unaligned memory access in prlimit64 s=
yscall<br>
<br>
Klaus Jensen (1):<br>
=C2=A0 =C2=A0 =C2=A0 hw/nvme: fix memory leak in nvme_dsm<br>
<br>
Konstantin Kostiuk (1):<br>
=C2=A0 =C2=A0 =C2=A0 qga/win32: Remove change action from MSI installer<br>
<br>
Lukas Tschoke (1):<br>
=C2=A0 =C2=A0 =C2=A0 block/vhdx: fix dynamic VHDX BAT corruption<br>
<br>
Marc-Andr=C3=A9 Lureau (1):<br>
=C2=A0 =C2=A0 =C2=A0 ui: fix crash on serial reset, during init<br>
<br>
Markus Armbruster (2):<br>
=C2=A0 =C2=A0 =C2=A0 qga: Drop dangling reference to QERR_QGA_LOGGING_DISAB=
LED<br>
=C2=A0 =C2=A0 =C2=A0 hw/arm: do not free machine-&gt;fdt in arm_load_dtb()<=
br>
<br>
Mathis Marion (2):<br>
=C2=A0 =C2=A0 =C2=A0 linux-user: fix sockaddr_in6 endianness<br>
=C2=A0 =C2=A0 =C2=A0 linux-user: fix timerfd read endianness conversion<br>
<br>
Nina Schoetterl-Glausch (1):<br>
=C2=A0 =C2=A0 =C2=A0 target/s390x: Fix emulation of C(G)HRL<br>
<br>
Peter Xu (1):<br>
=C2=A0 =C2=A0 =C2=A0 io: tls: Inherit QIO_CHANNEL_FEATURE_SHUTDOWN on serve=
r side<br>
<br>
Pierrick Bouvier (1):<br>
=C2=A0 =C2=A0 =C2=A0 qga/vss-win32: fix warning for clang++-15<br>
<br>
Richard Henderson (2):<br>
=C2=A0 =C2=A0 =C2=A0 target/s390x: Split out gen_ri2<br>
=C2=A0 =C2=A0 =C2=A0 target/arm: Handle m-profile in arm_is_secure<br>
<br>
Stefan Hajnoczi (1):<br>
=C2=A0 =C2=A0 =C2=A0 aio-posix: fix race between epoll upgrade and aio_set_=
fd_handler()<br>
<br>
Thomas Huth (1):<br>
=C2=A0 =C2=A0 =C2=A0 target/s390x/arch_dump: Fix memory corruption in s390x=
_write_elf64_notes()<br>
<br>
Yuval Shaia (1):<br>
=C2=A0 =C2=A0 =C2=A0 hw/pvrdma: Protect against buggy or malicious guest dr=
iver<br>
<br>
=C2=A0block/vhdx-log.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0hw/arm/boot.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 5 ++++-<br>
=C2=A0hw/net/vmxnet3.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0hw/nvme/ctrl.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 3 +++<br>
=C2=A0hw/rdma/vmw/pvrdma_cmd.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 6 ++++++<br>
=C2=A0include/qemu/osdep.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0io/channel-tls.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 3 +++<br>
=C2=A0linux-user/fd-trans.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 | 10 ++++++---<br>
=C2=A0linux-user/fd-trans.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 1 +<br>
=C2=A0linux-user/generic/target_resource.h |=C2=A0 4 ++--<br>
=C2=A0linux-user/syscall.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 21 ++++++++++++------<br>
=C2=A0qga/commands.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 5 ++---<br>
=C2=A0qga/installer/qemu-ga.wxs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 1 +<br>
=C2=A0qga/vss-win32/install.cpp=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 2 +-<br>
=C2=A0target/arm/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 3 +++<br>
=C2=A0target/s390x/arch_dump.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 2 +-<br>
=C2=A0target/s390x/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A0target/s390x/s390x-internal.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 ++=
-<br>
=C2=A0target/s390x/tcg/insn-data.h.inc=C2=A0 =C2=A0 =C2=A0|=C2=A0 4 ++--<br=
>
=C2=A0target/s390x/tcg/mem_helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<=
br>
=C2=A0target/s390x/tcg/translate.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 41 ++=
++++++++++++++++++++++++++--------<br>
=C2=A0ui/gtk.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 +++-<br>
=C2=A0util/fdmon-epoll.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 25 ++++++++++++++++------<br>
=C2=A023 files changed, 111 insertions(+), 40 deletions(-)<br>
<br>
</blockquote></div>

--000000000000cfd8c305f93de1f4--


