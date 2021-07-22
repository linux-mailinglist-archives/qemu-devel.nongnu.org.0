Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 454BA3D1FE8
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 10:39:19 +0200 (CEST)
Received: from localhost ([::1]:54764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6UEg-0000Ez-93
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 04:39:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1m6UDa-0007gR-1f
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 04:38:10 -0400
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335]:35351)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1m6UDX-0006Lm-1m
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 04:38:09 -0400
Received: by mail-ot1-x335.google.com with SMTP id
 b18-20020a0568303112b02904cf73f54f4bso1605004ots.2
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 01:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kdEU9vuJjlmQDLZ8bfQ3tyA2BnuPvHH3Pmg/+zuUGuQ=;
 b=YNnRGFYyekvwnrkOPPtPuj6CRUfEM7bhnmwfpufm+YWgzIyg0JnNqWDLOcXjFy8ODu
 6lCLNaTEQA5RkNGfk+ExGfesERRjX1jOdqQPJnoomYxyHYmblD5cVimiNcIBHyN2VNby
 bk1EwuQLGpr3PlfMbKsw3EWA0RBV14KA+vnqvTYRBJ0qNp3Ctz/akCkcpVQO9wg0d+cb
 ZxvRW0y49RPUF04xx0vUNkjenAN7WM4NlgPe/i97mShXSETh4hctcpKItT8Rx3GIny+e
 xRgaBpVm5Vz+hMI8c+tNwktiuGUFOldfjSST/n8SD1Jd4/emeRCpcqx4LaeJyUf3VxaW
 ZYvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kdEU9vuJjlmQDLZ8bfQ3tyA2BnuPvHH3Pmg/+zuUGuQ=;
 b=LoBPBeYipXHDEXUYtgE8crKND6i2vHMsHmKX4v5ovHK/TtoUfICU4zlqlEDmC9wCA9
 eKpKQazZUmAmaMglOrz7JghEwgHPX7oti1hXiP5e+ntrpSGFmxLa4B8XkOtA20BlXDzZ
 jn7y0SywS9Q+N1CuF5i8He4TpF9J6Y9bO3QCWTi55OymmRQlCwbXUv8F3q84nvC2GYMs
 j3bJzc6RCqBYnHfYI7PimYk20U6+Z/BSaEjs98n4yWKOGpXZ7pamG3NwTD7beP6DZYuN
 Uib70IfTBssknaNP7czgz2cZSMAY5S5Nl4xgHAxxgn47m/MIyQzE6XMhW6Obn7GYnA3A
 q+XQ==
X-Gm-Message-State: AOAM530ccZOsoyB3al56XzVSpEpOlaQVSfRNBqMGyHOVjiGdFDBqpbAi
 l/aUrix4KNtF0LyZgLLaOgacmtTHiRcy31gCORtvWw==
X-Google-Smtp-Source: ABdhPJy7wjSFPrDg77XLVYpgyJINmRFisebo2qo/D1Jb7N8l9ZpNQ0o8oszh8fpi7gs1FpqdW1ebg5vi1tnScgd7drQ=
X-Received: by 2002:a9d:4798:: with SMTP id b24mr28329342otf.67.1626943084536; 
 Thu, 22 Jul 2021 01:38:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210713153758.323614-1-andrew@daynix.com>
In-Reply-To: <20210713153758.323614-1-andrew@daynix.com>
From: Andrew Melnichenko <andrew@daynix.com>
Date: Thu, 22 Jul 2021 11:37:53 +0300
Message-ID: <CABcq3pE=n4iPB-9cX7bRMhz=O2csAtTeYtbA1_sBnC9Fh8Pihg@mail.gmail.com>
Subject: Re: [PATCH 0/5] ebpf: Added ebpf helper for libvirtd.
To: "Michael S. Tsirkin" <mst@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>, 
 Jason Wang <jasowang@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000009fb3c505c7b23491"
Received-SPF: none client-ip=2607:f8b0:4864:20::335;
 envelope-from=andrew@daynix.com; helo=mail-ot1-x335.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Yan Vugenfirer <yan@daynix.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000009fb3c505c7b23491
Content-Type: text/plain; charset="UTF-8"

ping

On Tue, Jul 13, 2021 at 6:38 PM Andrew Melnychenko <andrew@daynix.com>
wrote:

> Libvirt usually launches qemu with strict permissions.
> To enable eBPF RSS steering, qemu-ebpf-rss-helper was added.
>
> Added property "ebpf_rss_fds" for "virtio-net" that allows to
> initialize eBPF RSS context with passed program & maps fds.
>
> Added qemu-ebpf-rss-helper - simple helper that loads eBPF
> context and passes fds through unix socket.
> Libvirt should call the helper and pass fds to qemu through
> "ebpf_rss_fds" property.
>
> Added explicit target OS check for libbpf dependency in meson.
> eBPF RSS works only with Linux TAP, so there is no reason to
> build eBPF loader/helper for non-Linux.
>
> Changed Qemu updates eBPF maps to array mmaping. Mmaping allows
> bypassing unprivileged BPF map update. Also, instead of 3 maps
> (config, key and indirection table) there is one map that
> combines everything.
>
> Added helper stamp. To check that helper was build with qemu,
> qemu would check helper symbols that should contain the stamp.
> It was done similar to qemu modules, but checking was performed
> by the helper's ELF parsing.
>
> Overall, libvirt process should not be aware of the "interface"
> of eBPF RSS, it will not be aware of eBPF maps/program "type" and
> their quantity. That's why qemu and the helper should be from
> the same build and be "synchronized". Technically each qemu may
> have its own helper. That's why "query-helper-paths" qmp command
> was added. Qemu should return the path to the helper that suits
> and libvirt should use "that" helper for "that" emulator.
>
> qmp sample:
> C: { "execute": "query-helper-paths" }
> S: { "return": [
>      {
>        "name": "qemu-ebpf-rss-helper",
>        "path": "/usr/local/libexec/qemu-ebpf-rss-helper"
>      }
>     ]
>    }
>
> Changes since v1:
> * Mmap() used instead if bpf_map_update_elem().
> * Added helper stamp.
>
> Andrew Melnychenko (5):
>   ebpf: Added eBPF initialization by fds and map update.
>   virtio-net: Added property to load eBPF RSS with fds.
>   qmp: Added the helper stamp check.
>   ebpf_rss_helper: Added helper for eBPF RSS.
>   qmp: Added qemu-ebpf-rss-path command.
>
>  ebpf/ebpf_rss-stub.c              |   6 +
>  ebpf/ebpf_rss.c                   | 120 ++++---
>  ebpf/ebpf_rss.h                   |   8 +-
>  ebpf/qemu-ebpf-rss-helper.c       | 130 +++++++
>  ebpf/rss.bpf.skeleton.h           | 557 +++++++++++++++---------------
>  hw/net/virtio-net.c               |  77 ++++-
>  include/hw/virtio/virtio-net.h    |   1 +
>  meson.build                       |  47 ++-
>  monitor/meson.build               |   1 +
>  monitor/qemu-helper-stamp-utils.c | 297 ++++++++++++++++
>  monitor/qemu-helper-stamp-utils.h |  24 ++
>  monitor/qmp-cmds.c                |  32 ++
>  qapi/misc.json                    |  33 ++
>  tools/ebpf/rss.bpf.c              |  67 ++--
>  14 files changed, 990 insertions(+), 410 deletions(-)
>  create mode 100644 ebpf/qemu-ebpf-rss-helper.c
>  create mode 100644 monitor/qemu-helper-stamp-utils.c
>  create mode 100644 monitor/qemu-helper-stamp-utils.h
>
> --
> 2.31.1
>
>

--0000000000009fb3c505c7b23491
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">ping<br></div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Tue, Jul 13, 2021 at 6:38 PM Andrew Melnychenko=
 &lt;<a href=3D"mailto:andrew@daynix.com">andrew@daynix.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">Libvirt usually =
launches qemu with strict permissions.<br>
To enable eBPF RSS steering, qemu-ebpf-rss-helper was added.<br>
<br>
Added property &quot;ebpf_rss_fds&quot; for &quot;virtio-net&quot; that all=
ows to<br>
initialize eBPF RSS context with passed program &amp; maps fds.<br>
<br>
Added qemu-ebpf-rss-helper - simple helper that loads eBPF<br>
context and passes fds through unix socket.<br>
Libvirt should call the helper and pass fds to qemu through<br>
&quot;ebpf_rss_fds&quot; property.<br>
<br>
Added explicit target OS check for libbpf dependency in meson.<br>
eBPF RSS works only with Linux TAP, so there is no reason to<br>
build eBPF loader/helper for non-Linux.<br>
<br>
Changed Qemu updates eBPF maps to array mmaping. Mmaping allows<br>
bypassing unprivileged BPF map update. Also, instead of 3 maps<br>
(config, key and indirection table) there is one map that<br>
combines everything.<br>
<br>
Added helper stamp. To check that helper was build with qemu,<br>
qemu would check helper symbols that should contain the stamp.<br>
It was done similar to qemu modules, but checking was performed<br>
by the helper&#39;s ELF parsing.<br>
<br>
Overall, libvirt process should not be aware of the &quot;interface&quot;<b=
r>
of eBPF RSS, it will not be aware of eBPF maps/program &quot;type&quot; and=
<br>
their quantity. That&#39;s why qemu and the helper should be from<br>
the same build and be &quot;synchronized&quot;. Technically each qemu may<b=
r>
have its own helper. That&#39;s why &quot;query-helper-paths&quot; qmp comm=
and<br>
was added. Qemu should return the path to the helper that suits<br>
and libvirt should use &quot;that&quot; helper for &quot;that&quot; emulato=
r.<br>
<br>
qmp sample:<br>
C: { &quot;execute&quot;: &quot;query-helper-paths&quot; }<br>
S: { &quot;return&quot;: [<br>
=C2=A0 =C2=A0 =C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;name&quot;: &quot;qemu-ebpf-rss-helper&quo=
t;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;path&quot;: &quot;/usr/local/libexec/qemu-=
ebpf-rss-helper&quot;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 ]<br>
=C2=A0 =C2=A0}<br>
<br>
Changes since v1:<br>
* Mmap() used instead if bpf_map_update_elem().<br>
* Added helper stamp.<br>
<br>
Andrew Melnychenko (5):<br>
=C2=A0 ebpf: Added eBPF initialization by fds and map update.<br>
=C2=A0 virtio-net: Added property to load eBPF RSS with fds.<br>
=C2=A0 qmp: Added the helper stamp check.<br>
=C2=A0 ebpf_rss_helper: Added helper for eBPF RSS.<br>
=C2=A0 qmp: Added qemu-ebpf-rss-path command.<br>
<br>
=C2=A0ebpf/ebpf_rss-stub.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 =C2=A06 +<br>
=C2=A0ebpf/ebpf_rss.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 120 ++++---<br>
=C2=A0ebpf/ebpf_rss.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A08 +-<br>
=C2=A0ebpf/qemu-ebpf-rss-helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 130 +++++++<b=
r>
=C2=A0ebpf/rss.bpf.skeleton.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 557=
 +++++++++++++++---------------<br>
=C2=A0hw/net/virtio-net.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 77 ++++-<br>
=C2=A0include/hw/virtio/virtio-net.h=C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 47 ++-<br>
=C2=A0monitor/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0monitor/qemu-helper-stamp-utils.c | 297 ++++++++++++++++<br>
=C2=A0monitor/qemu-helper-stamp-utils.h |=C2=A0 24 ++<br>
=C2=A0monitor/qmp-cmds.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 32 ++<br>
=C2=A0qapi/misc.json=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 |=C2=A0 33 ++<br>
=C2=A0tools/ebpf/rss.bpf.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 67 ++--<br>
=C2=A014 files changed, 990 insertions(+), 410 deletions(-)<br>
=C2=A0create mode 100644 ebpf/qemu-ebpf-rss-helper.c<br>
=C2=A0create mode 100644 monitor/qemu-helper-stamp-utils.c<br>
=C2=A0create mode 100644 monitor/qemu-helper-stamp-utils.h<br>
<br>
-- <br>
2.31.1<br>
<br>
</blockquote></div>

--0000000000009fb3c505c7b23491--

