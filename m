Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F12447C36
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 09:47:33 +0100 (CET)
Received: from localhost ([::1]:49106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk0JQ-0000Up-Am
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 03:47:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mk0IQ-0008Dz-4o
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 03:46:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48298)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mk0IN-0002dO-Pf
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 03:46:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636361186;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9iAU7JpiZOBmZq7WRxevU+7V5w9znqXseLwXt0Xvdkc=;
 b=HS5abZOPPRFNaHgDLUzaOyyBPnZsw432xkkgr5R6jA5ea7SKKLc1e9yEofG6mGuUCxwIS7
 kr3gT1rwnxlwVd/Kb6SV9CKXlQ1HMLYsEtjmbDh9q6SxOgKREZ7DcO2quJadWGgZPYFI9Y
 t5nHlutZunTcjoIaIB/G5TmuXi3zV6c=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-N5ifANHcOFqrn6pT6Wx4_Q-1; Mon, 08 Nov 2021 03:46:25 -0500
X-MC-Unique: N5ifANHcOFqrn6pT6Wx4_Q-1
Received: by mail-pf1-f198.google.com with SMTP id
 s22-20020a056a0008d600b00480fea2e96cso10295499pfu.7
 for <qemu-devel@nongnu.org>; Mon, 08 Nov 2021 00:46:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9iAU7JpiZOBmZq7WRxevU+7V5w9znqXseLwXt0Xvdkc=;
 b=6I+V/YV1CDF4/AGB/I3XqSzCvhkhgGe+yIQGr6YunG4Zm+1Ke60b7827DN725//WJJ
 I6PSSa56M8Wfw7FeT8EdsFl4dMe1PNCdkmJBHlOthZoM2g087KqNbFZHoOgwXP6HO5rg
 LzFtGYN+gchljoqSYGpduPgmhuI8hLu/cvzDrDNGUCgrUGldmwQmlR6A9dfwiRcv+j1Y
 lRSMCFs55B+MG0z3Wm54NaDRTxpUPoZP9Nwf1GJZT1HuBFMtVH2U8HpCM5xEowsKwubD
 8Pdb8tsNo39H7Z9h5swzmlDxhIR+LnJTDb2gVnttiq1rE9isdVXsJRUynEebWDP9rQEf
 RsAQ==
X-Gm-Message-State: AOAM532VjFxQ6bEv9tqByTRE6Avpc+qBpeGr0N25zFokCdBe3JtsDmEy
 onPTysyI5lMBy1nhYr0s9Bj8tIjT/X/DCNXBb6eoiQyUDsi37bIgOC+QRfj5xnD9ULtiwIdctpn
 RoXu4PZ9wPCtqDGfxlb92NewqIc1SP/c=
X-Received: by 2002:a17:902:bf43:b0:142:41bb:a6f with SMTP id
 u3-20020a170902bf4300b0014241bb0a6fmr23659499pls.22.1636361184243; 
 Mon, 08 Nov 2021 00:46:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy2kkR0xHVKHVZuULBEVPEd8HcrI1AK0Qgl4fvnXUBcpsMa8YyyB2MuDYmjFKwe8N/krVQf8zxuVV81uJY66Hk=
X-Received: by 2002:a17:902:bf43:b0:142:41bb:a6f with SMTP id
 u3-20020a170902bf4300b0014241bb0a6fmr23659476pls.22.1636361183911; Mon, 08
 Nov 2021 00:46:23 -0800 (PST)
MIME-Version: 1.0
References: <tencent_C7CEA36B3AB3971A278DFD71F2BBCFF88906@qq.com>
In-Reply-To: <tencent_C7CEA36B3AB3971A278DFD71F2BBCFF88906@qq.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Mon, 8 Nov 2021 12:46:13 +0400
Message-ID: <CAMxuvaw1+x0FmG_0aW2YCL2pUPFuO=VC=0nv0QA43MkKnMM7fQ@mail.gmail.com>
Subject: Re: Chardev: delete the QemuOpts reserved in vm_config_groups
To: =?UTF-8?B?44G36aOO6L+H5peg55eVPz8=?= <787738581@qq.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Sat, Nov 6, 2021 at 10:41 PM =E3=81=B7=E9=A3=8E=E8=BF=87=E6=97=A0=E7=97=
=95?? <787738581@qq.com> wrote:
>
> We have found that qemu cannot plug in the previously unplugged device.
>         start qemu with the following command:
> ./qemu-system-x86_64 -enable-kvm -m 8192 -smp 16 \
>    -object memory-backend-file,id=3Dmem,size=3D8192M,mem-path=3D/dev/huge=
pages,share=3Don \
>    -numa node,memdev=3Dmem -mem-prealloc \
>    ...
>    -chardev socket,id=3Ddrive-virtio-disk1,path=3D/var/run/spdk/vhost_blk=
_socket-30dcf467-486a-45cf-b754-093bf5cf24d1,reconnect=3D10 \
>    -device vhost-user-blk-pci,chardev=3Ddrive-virtio-disk1,num-queues=3D1=
,bus=3Dpci.0,addr=3D0x5,id=3Dvirtio-disk1 \
>    ...
>
> (qemu) info chardev
> serial0: filename=3Dpty:/dev/pts/0
> drive-virtio-disk1: filename=3Dunix:
> charmonitor:
> filename=3Dunix:/usr/local/var/lib/libvirt/qemu/domain-55-e59039db-d576-4=
0db-a/monitor.sock,server
> (qemu) device_del virtio-disk1
> (qemu) chardev-remove drive-virtio-disk1
> (qemu) info chardev
> serial0: filename=3Dpty:/dev/pts/0
> charmonitor:
> filename=3Dunix:/usr/local/var/lib/libvirt/qemu/domain-55-e59039db-d576-4=
0db-a/monitor.sock,server
> (qemu) chardev-add socket,id=3Ddrive-virtio-disk1,path=3D/var/run/spdk/vh=
ost_blk_socket-30dcf467-486a-45cf-b754-093bf5cf24d1,reconnect=3D10
> device failed: Duplicate ID 'drive-virtio-disk1' for chardev Error: Parsi=
ng chardev args failed
>
> The root cause of this issue is that the QemuOpts is still reserved in vm=
_config_groups list,
> so qemu_opts_create will fail with the error above. So the QemuOpts shoul=
d be removed when
> invoking qmp_chardev_remove.
>
>
> Signed-off-by: Zhoujian Yu <windyu@tencent.com>
> Reviewed-by: Lei Wang <kaierwang@tencent.com>
> Reviewed-by: Xun Ni <richardni@tencent.com>
> Reviewed-by: Zhigang Lu <tonnylu@tencent.com>
> ---
>  chardev/char.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/chardev/char.c b/chardev/char.c
> index 398f09d..d2087bd 100644
> --- a/chardev/char.c
> +++ b/chardev/char.c
> @@ -37,6 +37,7 @@
>  #include "qemu/help_option.h"
>  #include "qemu/module.h"
>  #include "qemu/option.h"
> +#include "qemu/option_int.h"
>  #include "qemu/id.h"
>  #include "qemu/coroutine.h"
>  #include "qemu/yank.h"
> @@ -1159,6 +1160,7 @@ ChardevReturn *qmp_chardev_change(const char *id, C=
hardevBackend *backend,
>  void qmp_chardev_remove(const char *id, Error **errp)
>  {
>      Chardev *chr;
> +   QemuOpts *opts;
>
>      chr =3D qemu_chr_find(id);
>      if (chr =3D=3D NULL) {
> @@ -1175,6 +1177,10 @@ void qmp_chardev_remove(const char *id, Error **er=
rp)
>          return;
>      }
>      object_unparent(OBJECT(chr));
> +    /* delete the opts reserved in vm_config_groups list.  */
> +    opts =3D qemu_opts_find(qemu_find_opts("chardev"), id);
> +    if (opts)
> +        qemu_opts_del(opts);

That seems reasonable to me,
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

>  }
>
>  void qmp_chardev_send_break(const char *id, Error **errp)
> --
> 1.8.3.1


