Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2A9486BAF
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 22:12:31 +0100 (CET)
Received: from localhost ([::1]:60714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5a3i-0000tb-Db
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 16:12:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pefoley@google.com>)
 id 1n5YqY-000329-90
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 14:54:50 -0500
Received: from [2607:f8b0:4864:20::d2f] (port=37803
 helo=mail-io1-xd2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pefoley@google.com>)
 id 1n5YqV-0001zC-Cz
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 14:54:49 -0500
Received: by mail-io1-xd2f.google.com with SMTP id 19so4468805ioz.4
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 11:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kxPLrxmi0+61vuum5Pr4pf9TDvl6V2FUfsvtU4EgOiA=;
 b=CRPqUnM5C10yaOCq29YN6Y+JwXMxARh6iNttz3Cdl12fTaD3z0rtwDIuK3Tjn9N7Le
 YgDLR/0Ykpt6mkTpS0dfimW/DnQyGRgDXF0XJ+THhGGwH93NQYi3Q/d8q7QISLooLmve
 U7TpulkPt//q1LJ0fySvuY4pODiXUtVEaC8/lEhIOMQMVceJBAn2TKcyh62OyCQ6PfH/
 e5r8C27l7J2k/9bMYVLqB6q6sV1EN9nERuNLhp3horhTfGequiiqrdPoJ9x/qx/MESRo
 eZg6ckqfUa80AIguw7zHjLKQ9kxpfswn2p/46o/880ZqIpcZwiqv30VlWB3OsZFU5Qhv
 Fdcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kxPLrxmi0+61vuum5Pr4pf9TDvl6V2FUfsvtU4EgOiA=;
 b=M9gSW8fugmZosrlm/gvomrgWOwo5xM8x64j67s8uxYXIA0bLDWImstm5pLfxR2N1Dz
 1CdFRYKCOMx5g9MUnP4Ji945C8Vy08JZ/PsAQw2MI6c96j4VhqYOPaote2/8r4CFPsbn
 9JPlb2dIqTLIz5PkgkghvgZViNFXkyDIvkKGKNi5u4ev0LMyg2iPE5A61qWFF6zWVMB9
 43m2a7+Q1YZ+/MhpOMhNpme5l0FOdvBERLRLYc55CmPxbQcubJODS3+Pek/1xnJniNMM
 MRTY53mLDwtixZdrAfNb7tAUWz6rQgNF+iF/iNALc/d41xW5qi39RLqrLfHB+PSsAUgL
 1VQA==
X-Gm-Message-State: AOAM5309/H0ffQi5HbP9L6KgvNVIn44NgXUi3m+Zj04SpzJ7p6DyzDMj
 w91CgV+MZ1nCXp+0qFaXNMDT9+tVyDC2eDISdyPI8Q==
X-Google-Smtp-Source: ABdhPJxJ10teKfD1PFCjdqAKMJk27f93b/ubpbogKo6qf41QxBvNrty5mYbFbur67hjuTpnbJIpueyd1Jb+1UnC632c=
X-Received: by 2002:a05:6638:2615:: with SMTP id
 m21mr26748307jat.271.1641498884583; 
 Thu, 06 Jan 2022 11:54:44 -0800 (PST)
MIME-Version: 1.0
References: <20220106182851.3583896-1-venture@google.com>
 <051681aa-5a02-d096-f5e2-be828407face@amsat.org>
In-Reply-To: <051681aa-5a02-d096-f5e2-be828407face@amsat.org>
From: Peter Foley <pefoley@google.com>
Date: Thu, 6 Jan 2022 14:54:34 -0500
Message-ID: <CAAAKUPPLsu_z04ospHCe+F8+kJQHogOz06Od1QvriO9=S5r9kw@mail.gmail.com>
Subject: Re: [PATCH] net: Fix uninitialized data usage
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Patrick Venture <venture@google.com>, jasowang@redhat.com,
 qemu-devel@nongnu.org, Hao Wu <wuhaotsh@google.com>
Content-Type: multipart/alternative; boundary="000000000000ea983e05d4ef3d16"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=pefoley@google.com; helo=mail-io1-xd2f.google.com
X-Spam_score_int: -167
X-Spam_score: -16.8
X-Spam_bar: ----------------
X-Spam_report: (-16.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 06 Jan 2022 16:06:01 -0500
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ea983e05d4ef3d16
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yeah, but this same pattern is used elsewhere in the file, so I went with
being consistent.

On Thu, Jan 6, 2022, 2:44 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:

> On 6/1/22 19:28, Patrick Venture wrote:
> > From: Peter Foley <pefoley@google.com>
> >
> > e.g.
> > 1109 15:16:20.151506 Uninitialized bytes in ioctl_common_pre at offset =
0
> inside [0x7ffc516af9b8, 4)
> >   1109 15:16:20.151659 =3D=3D588974=3D=3DWARNING: MemorySanitizer:
> use-of-uninitialized-value
> >   1109 15:16:20.312923     #0 0x5639b88acb21 in tap_probe_vnet_hdr_len
> third_party/qemu/net/tap-linux.c:183:9
> >   1109 15:16:20.312952     #1 0x5639b88afd66 in net_tap_fd_init
> third_party/qemu/net/tap.c:409:9
> >   1109 15:16:20.312954     #2 0x5639b88b2d1b in net_init_tap_one
> third_party/qemu/net/tap.c:681:19
> >   1109 15:16:20.312956     #3 0x5639b88b16a8 in net_init_tap
> third_party/qemu/net/tap.c:912:13
> >   1109 15:16:20.312957     #4 0x5639b8890175 in net_client_init1
> third_party/qemu/net/net.c:1110:9
> >   1109 15:16:20.312958     #5 0x5639b888f912 in net_client_init
> third_party/qemu/net/net.c:1208:15
> >   1109 15:16:20.312960     #6 0x5639b8894aa5 in net_param_nic
> third_party/qemu/net/net.c:1588:11
> >   1109 15:16:20.312961     #7 0x5639b900cd18 in qemu_opts_foreach
> third_party/qemu/util/qemu-option.c:1135:14
> >   1109 15:16:20.312962     #8 0x5639b889393c in net_init_clients
> third_party/qemu/net/net.c:1612:9
> >   1109 15:16:20.312964     #9 0x5639b717aaf3 in
> qemu_create_late_backends third_party/qemu/softmmu/vl.c:1962:5
> >   1109 15:16:20.312965     #10 0x5639b717aaf3 in qemu_init
> third_party/qemu/softmmu/vl.c:3694:5
> >   1109 15:16:20.312967     #11 0x5639b71083b8 in main
> third_party/qemu/softmmu/main.c:49:5
> >   1109 15:16:20.312968     #12 0x7f464de1d8d2 in __libc_start_main
> (/usr/grte/v5/lib64/libc.so.6+0x628d2)
> >   1109 15:16:20.312969     #13 0x5639b6bbd389 in _start
> /usr/grte/v5/debug-src/src/csu/../sysdeps/x86_64/start.S:120
> >   1109 15:16:20.312970
> >   1109 15:16:20.312975   Uninitialized value was stored to memory at
> >   1109 15:16:20.313393     #0 0x5639b88acbee in tap_probe_vnet_hdr_len
> third_party/qemu/net/tap-linux.c
> >   1109 15:16:20.313396     #1 0x5639b88afd66 in net_tap_fd_init
> third_party/qemu/net/tap.c:409:9
> >   1109 15:16:20.313398     #2 0x5639b88b2d1b in net_init_tap_one
> third_party/qemu/net/tap.c:681:19
> >   1109 15:16:20.313399     #3 0x5639b88b16a8 in net_init_tap
> third_party/qemu/net/tap.c:912:13
> >   1109 15:16:20.313400     #4 0x5639b8890175 in net_client_init1
> third_party/qemu/net/net.c:1110:9
> >   1109 15:16:20.313401     #5 0x5639b888f912 in net_client_init
> third_party/qemu/net/net.c:1208:15
> >   1109 15:16:20.313403     #6 0x5639b8894aa5 in net_param_nic
> third_party/qemu/net/net.c:1588:11
> >   1109 15:16:20.313404     #7 0x5639b900cd18 in qemu_opts_foreach
> third_party/qemu/util/qemu-option.c:1135:14
> >   1109 15:16:20.313405     #8 0x5639b889393c in net_init_clients
> third_party/qemu/net/net.c:1612:9
> >   1109 15:16:20.313407     #9 0x5639b717aaf3 in
> qemu_create_late_backends third_party/qemu/softmmu/vl.c:1962:5
> >   1109 15:16:20.313408     #10 0x5639b717aaf3 in qemu_init
> third_party/qemu/softmmu/vl.c:3694:5
> >   1109 15:16:20.313409     #11 0x5639b71083b8 in main
> third_party/qemu/softmmu/main.c:49:5
> >   1109 15:16:20.313410     #12 0x7f464de1d8d2 in __libc_start_main
> (/usr/grte/v5/lib64/libc.so.6+0x628d2)
> >   1109 15:16:20.313412     #13 0x5639b6bbd389 in _start
> /usr/grte/v5/debug-src/src/csu/../sysdeps/x86_64/start.S:120
> >   1109 15:16:20.313413
> >   1109 15:16:20.313417   Uninitialized value was stored to memory at
> >   1109 15:16:20.313791     #0 0x5639b88affbd in net_tap_fd_init
> third_party/qemu/net/tap.c:400:26
> >   1109 15:16:20.313826     #1 0x5639b88b2d1b in net_init_tap_one
> third_party/qemu/net/tap.c:681:19
> >   1109 15:16:20.313829     #2 0x5639b88b16a8 in net_init_tap
> third_party/qemu/net/tap.c:912:13
> >   1109 15:16:20.313831     #3 0x5639b8890175 in net_client_init1
> third_party/qemu/net/net.c:1110:9
> >   1109 15:16:20.313836     #4 0x5639b888f912 in net_client_init
> third_party/qemu/net/net.c:1208:15
> >   1109 15:16:20.313838     #5 0x5639b8894aa5 in net_param_nic
> third_party/qemu/net/net.c:1588:11
> >   1109 15:16:20.313839     #6 0x5639b900cd18 in qemu_opts_foreach
> third_party/qemu/util/qemu-option.c:1135:14
> >   1109 15:16:20.313841     #7 0x5639b889393c in net_init_clients
> third_party/qemu/net/net.c:1612:9
> >   1109 15:16:20.313843     #8 0x5639b717aaf3 in
> qemu_create_late_backends third_party/qemu/softmmu/vl.c:1962:5
> >   1109 15:16:20.313844     #9 0x5639b717aaf3 in qemu_init
> third_party/qemu/softmmu/vl.c:3694:5
> >   1109 15:16:20.313845     #10 0x5639b71083b8 in main
> third_party/qemu/softmmu/main.c:49:5
> >   1109 15:16:20.313846     #11 0x7f464de1d8d2 in __libc_start_main
> (/usr/grte/v5/lib64/libc.so.6+0x628d2)
> >   1109 15:16:20.313847     #12 0x5639b6bbd389 in _start
> /usr/grte/v5/debug-src/src/csu/../sysdeps/x86_64/start.S:120
> >   1109 15:16:20.313849
> >   1109 15:16:20.313851   Uninitialized value was created by an
> allocation of 'ifr' in the stack frame of function 'tap_probe_vnet_hdr'
> >   1109 15:16:20.313855     #0 0x5639b88ac680 in tap_probe_vnet_hdr
> third_party/qemu/net/tap-linux.c:151
> >   1109 15:16:20.313856
> >   1109 15:16:20.313878 SUMMARY: MemorySanitizer:
> use-of-uninitialized-value third_party/qemu/net/tap-linux.c:183:9 in
> tap_probe_vnet_hdr_len
> >
> > Fixes: dc69004c7d8 ("net: move tap_probe_vnet_hdr() to tap-linux.c")
> > Reviewed-by: Hao Wu <wuhaotsh@google.com>
> > Reviewed-by: Patrick Venture <venture@google.com>
> > Signed-off-by: Peter Foley <pefoley@google.com>
> > ---
> >   net/tap-linux.c | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/net/tap-linux.c b/net/tap-linux.c
> > index 9584769740..5e70b93037 100644
> > --- a/net/tap-linux.c
> > +++ b/net/tap-linux.c
> > @@ -150,6 +150,7 @@ void tap_set_sndbuf(int fd, const NetdevTapOptions
> *tap, Error **errp)
> >   int tap_probe_vnet_hdr(int fd, Error **errp)
> >   {
> >       struct ifreq ifr;
> > +    memset(&ifr, 0, sizeof(ifr));
>
> Or:
>
>         struct ifreq ifr =3D { };
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> >
> >       if (ioctl(fd, TUNGETIFF, &ifr) !=3D 0) {
> >           /* TUNGETIFF is available since kernel v2.6.27 */
>
>

--000000000000ea983e05d4ef3d16
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Yeah, but this same pattern is used elsewhere in the file=
, so I went with being consistent.</div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 6, 2022, 2:44 PM Philippe Mat=
hieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.org</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">On 6/1/22 19:28, Patrick=
 Venture wrote:<br>
&gt; From: Peter Foley &lt;<a href=3D"mailto:pefoley@google.com" target=3D"=
_blank" rel=3D"noreferrer">pefoley@google.com</a>&gt;<br>
&gt; <br>
&gt; e.g.<br>
&gt; 1109 15:16:20.151506 Uninitialized bytes in ioctl_common_pre at offset=
 0 inside [0x7ffc516af9b8, 4)<br>
&gt;=C2=A0 =C2=A01109 15:16:20.151659 =3D=3D588974=3D=3DWARNING: MemorySani=
tizer: use-of-uninitialized-value<br>
&gt;=C2=A0 =C2=A01109 15:16:20.312923=C2=A0 =C2=A0 =C2=A0#0 0x5639b88acb21 =
in tap_probe_vnet_hdr_len third_party/qemu/net/tap-linux.c:183:9<br>
&gt;=C2=A0 =C2=A01109 15:16:20.312952=C2=A0 =C2=A0 =C2=A0#1 0x5639b88afd66 =
in net_tap_fd_init third_party/qemu/net/tap.c:409:9<br>
&gt;=C2=A0 =C2=A01109 15:16:20.312954=C2=A0 =C2=A0 =C2=A0#2 0x5639b88b2d1b =
in net_init_tap_one third_party/qemu/net/tap.c:681:19<br>
&gt;=C2=A0 =C2=A01109 15:16:20.312956=C2=A0 =C2=A0 =C2=A0#3 0x5639b88b16a8 =
in net_init_tap third_party/qemu/net/tap.c:912:13<br>
&gt;=C2=A0 =C2=A01109 15:16:20.312957=C2=A0 =C2=A0 =C2=A0#4 0x5639b8890175 =
in net_client_init1 third_party/qemu/net/net.c:1110:9<br>
&gt;=C2=A0 =C2=A01109 15:16:20.312958=C2=A0 =C2=A0 =C2=A0#5 0x5639b888f912 =
in net_client_init third_party/qemu/net/net.c:1208:15<br>
&gt;=C2=A0 =C2=A01109 15:16:20.312960=C2=A0 =C2=A0 =C2=A0#6 0x5639b8894aa5 =
in net_param_nic third_party/qemu/net/net.c:1588:11<br>
&gt;=C2=A0 =C2=A01109 15:16:20.312961=C2=A0 =C2=A0 =C2=A0#7 0x5639b900cd18 =
in qemu_opts_foreach third_party/qemu/util/qemu-option.c:1135:14<br>
&gt;=C2=A0 =C2=A01109 15:16:20.312962=C2=A0 =C2=A0 =C2=A0#8 0x5639b889393c =
in net_init_clients third_party/qemu/net/net.c:1612:9<br>
&gt;=C2=A0 =C2=A01109 15:16:20.312964=C2=A0 =C2=A0 =C2=A0#9 0x5639b717aaf3 =
in qemu_create_late_backends third_party/qemu/softmmu/vl.c:1962:5<br>
&gt;=C2=A0 =C2=A01109 15:16:20.312965=C2=A0 =C2=A0 =C2=A0#10 0x5639b717aaf3=
 in qemu_init third_party/qemu/softmmu/vl.c:3694:5<br>
&gt;=C2=A0 =C2=A01109 15:16:20.312967=C2=A0 =C2=A0 =C2=A0#11 0x5639b71083b8=
 in main third_party/qemu/softmmu/main.c:49:5<br>
&gt;=C2=A0 =C2=A01109 15:16:20.312968=C2=A0 =C2=A0 =C2=A0#12 0x7f464de1d8d2=
 in __libc_start_main (/usr/grte/v5/lib64/libc.so.6+0x628d2)<br>
&gt;=C2=A0 =C2=A01109 15:16:20.312969=C2=A0 =C2=A0 =C2=A0#13 0x5639b6bbd389=
 in _start /usr/grte/v5/debug-src/src/csu/../sysdeps/x86_64/start.S:120<br>
&gt;=C2=A0 =C2=A01109 15:16:20.312970<br>
&gt;=C2=A0 =C2=A01109 15:16:20.312975=C2=A0 =C2=A0Uninitialized value was s=
tored to memory at<br>
&gt;=C2=A0 =C2=A01109 15:16:20.313393=C2=A0 =C2=A0 =C2=A0#0 0x5639b88acbee =
in tap_probe_vnet_hdr_len third_party/qemu/net/tap-linux.c<br>
&gt;=C2=A0 =C2=A01109 15:16:20.313396=C2=A0 =C2=A0 =C2=A0#1 0x5639b88afd66 =
in net_tap_fd_init third_party/qemu/net/tap.c:409:9<br>
&gt;=C2=A0 =C2=A01109 15:16:20.313398=C2=A0 =C2=A0 =C2=A0#2 0x5639b88b2d1b =
in net_init_tap_one third_party/qemu/net/tap.c:681:19<br>
&gt;=C2=A0 =C2=A01109 15:16:20.313399=C2=A0 =C2=A0 =C2=A0#3 0x5639b88b16a8 =
in net_init_tap third_party/qemu/net/tap.c:912:13<br>
&gt;=C2=A0 =C2=A01109 15:16:20.313400=C2=A0 =C2=A0 =C2=A0#4 0x5639b8890175 =
in net_client_init1 third_party/qemu/net/net.c:1110:9<br>
&gt;=C2=A0 =C2=A01109 15:16:20.313401=C2=A0 =C2=A0 =C2=A0#5 0x5639b888f912 =
in net_client_init third_party/qemu/net/net.c:1208:15<br>
&gt;=C2=A0 =C2=A01109 15:16:20.313403=C2=A0 =C2=A0 =C2=A0#6 0x5639b8894aa5 =
in net_param_nic third_party/qemu/net/net.c:1588:11<br>
&gt;=C2=A0 =C2=A01109 15:16:20.313404=C2=A0 =C2=A0 =C2=A0#7 0x5639b900cd18 =
in qemu_opts_foreach third_party/qemu/util/qemu-option.c:1135:14<br>
&gt;=C2=A0 =C2=A01109 15:16:20.313405=C2=A0 =C2=A0 =C2=A0#8 0x5639b889393c =
in net_init_clients third_party/qemu/net/net.c:1612:9<br>
&gt;=C2=A0 =C2=A01109 15:16:20.313407=C2=A0 =C2=A0 =C2=A0#9 0x5639b717aaf3 =
in qemu_create_late_backends third_party/qemu/softmmu/vl.c:1962:5<br>
&gt;=C2=A0 =C2=A01109 15:16:20.313408=C2=A0 =C2=A0 =C2=A0#10 0x5639b717aaf3=
 in qemu_init third_party/qemu/softmmu/vl.c:3694:5<br>
&gt;=C2=A0 =C2=A01109 15:16:20.313409=C2=A0 =C2=A0 =C2=A0#11 0x5639b71083b8=
 in main third_party/qemu/softmmu/main.c:49:5<br>
&gt;=C2=A0 =C2=A01109 15:16:20.313410=C2=A0 =C2=A0 =C2=A0#12 0x7f464de1d8d2=
 in __libc_start_main (/usr/grte/v5/lib64/libc.so.6+0x628d2)<br>
&gt;=C2=A0 =C2=A01109 15:16:20.313412=C2=A0 =C2=A0 =C2=A0#13 0x5639b6bbd389=
 in _start /usr/grte/v5/debug-src/src/csu/../sysdeps/x86_64/start.S:120<br>
&gt;=C2=A0 =C2=A01109 15:16:20.313413<br>
&gt;=C2=A0 =C2=A01109 15:16:20.313417=C2=A0 =C2=A0Uninitialized value was s=
tored to memory at<br>
&gt;=C2=A0 =C2=A01109 15:16:20.313791=C2=A0 =C2=A0 =C2=A0#0 0x5639b88affbd =
in net_tap_fd_init third_party/qemu/net/tap.c:400:26<br>
&gt;=C2=A0 =C2=A01109 15:16:20.313826=C2=A0 =C2=A0 =C2=A0#1 0x5639b88b2d1b =
in net_init_tap_one third_party/qemu/net/tap.c:681:19<br>
&gt;=C2=A0 =C2=A01109 15:16:20.313829=C2=A0 =C2=A0 =C2=A0#2 0x5639b88b16a8 =
in net_init_tap third_party/qemu/net/tap.c:912:13<br>
&gt;=C2=A0 =C2=A01109 15:16:20.313831=C2=A0 =C2=A0 =C2=A0#3 0x5639b8890175 =
in net_client_init1 third_party/qemu/net/net.c:1110:9<br>
&gt;=C2=A0 =C2=A01109 15:16:20.313836=C2=A0 =C2=A0 =C2=A0#4 0x5639b888f912 =
in net_client_init third_party/qemu/net/net.c:1208:15<br>
&gt;=C2=A0 =C2=A01109 15:16:20.313838=C2=A0 =C2=A0 =C2=A0#5 0x5639b8894aa5 =
in net_param_nic third_party/qemu/net/net.c:1588:11<br>
&gt;=C2=A0 =C2=A01109 15:16:20.313839=C2=A0 =C2=A0 =C2=A0#6 0x5639b900cd18 =
in qemu_opts_foreach third_party/qemu/util/qemu-option.c:1135:14<br>
&gt;=C2=A0 =C2=A01109 15:16:20.313841=C2=A0 =C2=A0 =C2=A0#7 0x5639b889393c =
in net_init_clients third_party/qemu/net/net.c:1612:9<br>
&gt;=C2=A0 =C2=A01109 15:16:20.313843=C2=A0 =C2=A0 =C2=A0#8 0x5639b717aaf3 =
in qemu_create_late_backends third_party/qemu/softmmu/vl.c:1962:5<br>
&gt;=C2=A0 =C2=A01109 15:16:20.313844=C2=A0 =C2=A0 =C2=A0#9 0x5639b717aaf3 =
in qemu_init third_party/qemu/softmmu/vl.c:3694:5<br>
&gt;=C2=A0 =C2=A01109 15:16:20.313845=C2=A0 =C2=A0 =C2=A0#10 0x5639b71083b8=
 in main third_party/qemu/softmmu/main.c:49:5<br>
&gt;=C2=A0 =C2=A01109 15:16:20.313846=C2=A0 =C2=A0 =C2=A0#11 0x7f464de1d8d2=
 in __libc_start_main (/usr/grte/v5/lib64/libc.so.6+0x628d2)<br>
&gt;=C2=A0 =C2=A01109 15:16:20.313847=C2=A0 =C2=A0 =C2=A0#12 0x5639b6bbd389=
 in _start /usr/grte/v5/debug-src/src/csu/../sysdeps/x86_64/start.S:120<br>
&gt;=C2=A0 =C2=A01109 15:16:20.313849<br>
&gt;=C2=A0 =C2=A01109 15:16:20.313851=C2=A0 =C2=A0Uninitialized value was c=
reated by an allocation of &#39;ifr&#39; in the stack frame of function &#3=
9;tap_probe_vnet_hdr&#39;<br>
&gt;=C2=A0 =C2=A01109 15:16:20.313855=C2=A0 =C2=A0 =C2=A0#0 0x5639b88ac680 =
in tap_probe_vnet_hdr third_party/qemu/net/tap-linux.c:151<br>
&gt;=C2=A0 =C2=A01109 15:16:20.313856<br>
&gt;=C2=A0 =C2=A01109 15:16:20.313878 SUMMARY: MemorySanitizer: use-of-unin=
itialized-value third_party/qemu/net/tap-linux.c:183:9 in tap_probe_vnet_hd=
r_len<br>
&gt; <br>
&gt; Fixes: dc69004c7d8 (&quot;net: move tap_probe_vnet_hdr() to tap-linux.=
c&quot;)<br>
&gt; Reviewed-by: Hao Wu &lt;<a href=3D"mailto:wuhaotsh@google.com" target=
=3D"_blank" rel=3D"noreferrer">wuhaotsh@google.com</a>&gt;<br>
&gt; Reviewed-by: Patrick Venture &lt;<a href=3D"mailto:venture@google.com"=
 target=3D"_blank" rel=3D"noreferrer">venture@google.com</a>&gt;<br>
&gt; Signed-off-by: Peter Foley &lt;<a href=3D"mailto:pefoley@google.com" t=
arget=3D"_blank" rel=3D"noreferrer">pefoley@google.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0net/tap-linux.c | 1 +<br>
&gt;=C2=A0 =C2=A01 file changed, 1 insertion(+)<br>
&gt; <br>
&gt; diff --git a/net/tap-linux.c b/net/tap-linux.c<br>
&gt; index 9584769740..5e70b93037 100644<br>
&gt; --- a/net/tap-linux.c<br>
&gt; +++ b/net/tap-linux.c<br>
&gt; @@ -150,6 +150,7 @@ void tap_set_sndbuf(int fd, const NetdevTapOptions=
 *tap, Error **errp)<br>
&gt;=C2=A0 =C2=A0int tap_probe_vnet_hdr(int fd, Error **errp)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct ifreq ifr;<br>
&gt; +=C2=A0 =C2=A0 memset(&amp;ifr, 0, sizeof(ifr));<br>
<br>
Or:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct ifreq ifr =3D { };<br>
<br>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.=
org" target=3D"_blank" rel=3D"noreferrer">f4bug@amsat.org</a>&gt;<br>
<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ioctl(fd, TUNGETIFF, &amp;ifr) !=3D 0) {=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* TUNGETIFF is available sinc=
e kernel v2.6.27 */<br>
<br>
</blockquote></div>

--000000000000ea983e05d4ef3d16--

