Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A9140330E
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 05:46:35 +0200 (CEST)
Received: from localhost ([::1]:34514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNoXi-0007rP-Fr
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 23:46:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mNoWe-000763-GJ
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 23:45:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mNoWb-0003yL-48
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 23:45:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631072723;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=371P1Fs6s5y/Sc/nGnCU7G917ApD8GsRLotGVIDEUQc=;
 b=cBnsQtNeAnawfhFXwg+bmWDZSKynT/1FwcivFGugwgDe+tvFp/wl5Ag7o2CGK0vy0e54Xp
 rOkyumVZtG5llHxoF039C8vp4KGa+MhcPfXSnSTm+JOmYU624aravRThmU3Xb4GxiV/ArY
 qAVfNDgAFi9zBS7BDaP0+sjD4ZFbJgQ=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-RbFX3AUdMcSxr5LjbuK5Og-1; Tue, 07 Sep 2021 23:45:19 -0400
X-MC-Unique: RbFX3AUdMcSxr5LjbuK5Og-1
Received: by mail-yb1-f197.google.com with SMTP id
 f83-20020a25cf56000000b005a0445377e8so854817ybg.20
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 20:45:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=371P1Fs6s5y/Sc/nGnCU7G917ApD8GsRLotGVIDEUQc=;
 b=Piwi6uw5iBOy0VLLP16F7yhFc1F+bnVorRNmLt6m95BohK2rK7Vbu7fmBLcYaI36hN
 JaD5z87fXl7v3WwUOJSMsngTDRxlGtgrKgnkvonMc5FlXVqrZLLIZy3ooB3E+L1p0/fO
 9EmLNM6IJupVxoCbuONVBVVPS0G8U6OrdedLGs/J4Rmogq9XY/5yLNh0SOAZg0ujtN7R
 Kd2fWNJs6TPlgKLPcK8EhhrXuSp/yJVjdvhx7VnXpSXlzocchi//jnkbGLLRg8/FKUA4
 8YgI9dxNeeoThEHnvT7PDd9Mr4DgsU3B2AqV38ufwa94O1Ec4zBejfJfBo7/4H1wCoZc
 4Vrw==
X-Gm-Message-State: AOAM530lOSr3wzX1GSjESuzPk+NieydyGl6PZVwa3k1uYOiBJnHqKjbl
 eH1DjIsT9uWPTEzrQMFZjmCYFyHEvUCeVShKOVFv3py+I30s66G2J/Az7Sh3d3Cby45RIdVdZUK
 hqHi+hLdt00CeODOZhbJgyuGZt7Qs3RM=
X-Received: by 2002:a25:b98b:: with SMTP id r11mr2170271ybg.189.1631072719032; 
 Tue, 07 Sep 2021 20:45:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJypaC2jfKV611IJAZIYgFdLrofCZMgF2hjsVhN3Ij/C9F4qT8M+riq+obPiyi/A8dtOTTTrPYtawass4B9DXoc=
X-Received: by 2002:a25:b98b:: with SMTP id r11mr2170244ybg.189.1631072718728; 
 Tue, 07 Sep 2021 20:45:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210713153758.323614-1-andrew@daynix.com>
 <20210713153758.323614-5-andrew@daynix.com>
 <e73ce649-a04e-5200-8258-487a565c7e20@redhat.com>
 <CAOEp5OekBjFfwPEJ3JU-x0_wrwO9szApOk=kR3e7AKhiLqa9-w@mail.gmail.com>
 <38ea6b36-b968-02bf-b3a8-3d6393df31a5@redhat.com>
 <CAOEp5OcrwBJh=89wQ-eA0Z1MZpprYtLVvJSF1YrNPhu2kzqzCA@mail.gmail.com>
In-Reply-To: <CAOEp5OcrwBJh=89wQ-eA0Z1MZpprYtLVvJSF1YrNPhu2kzqzCA@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 8 Sep 2021 11:45:07 +0800
Message-ID: <CACGkMEua49tvtz8xv63umSbjS1nSZy6dFhrfu13ytps4socVPw@mail.gmail.com>
Subject: Re: [PATCH 4/5] ebpf_rss_helper: Added helper for eBPF RSS.
To: Yuri Benditovich <yuri.benditovich@daynix.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Andrew Melnychenko <andrew@daynix.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Yan Vugenfirer <yan@daynix.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 7, 2021 at 6:40 PM Yuri Benditovich
<yuri.benditovich@daynix.com> wrote:
>
> On Wed, Sep 1, 2021 at 9:42 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> >
> > =E5=9C=A8 2021/8/31 =E4=B8=8A=E5=8D=881:07, Yuri Benditovich =E5=86=99=
=E9=81=93:
> > > On Fri, Aug 20, 2021 at 6:41 AM Jason Wang <jasowang@redhat.com> wrot=
e:
> > >>
> > >> =E5=9C=A8 2021/7/13 =E4=B8=8B=E5=8D=8811:37, Andrew Melnychenko =E5=
=86=99=E9=81=93:
> > >>> Helper program. Loads eBPF RSS program and maps and passes them thr=
ough unix socket.
> > >>> Libvirt may launch this helper and pass eBPF fds to qemu virtio-net=
.
> > >>
> > >> I wonder if this can be done as helper for TAP/bridge.
> > >>
> > >> E.g it's the qemu to launch those helper with set-uid.
> > >>
> > >> Then libvirt won't even need to care about that?
> > >>
> > > There are pros and cons for such a solution with set-uid.
> > >  From my point of view one of the cons is that set-uid is efficient
> > > only at install time so the coexistence of different qemu builds (and
> > > different helpers for each one) is kind of problematic.
> > > With the current solution this does not present any problem: the
> > > developer can have several different builds, each one automatically
> > > has its own helper and there is no conflict between these builds and
> > > between these builds and installed qemu package. Changing the
> > > 'emulator' in the libvirt profile automatically brings the proper
> > > helper to work.
> >
> >
> > I'm not sure I get you here. We can still have default/sample helper to
> > make sure it works for different builds.
> >
> > If we can avoid the involvement of libvirt, that would be better.
>
> Hi Jason,
>
> Indeed I did not get the idea, can you please explain it in more
> details (as detailed as possible to avoid future misunderstanding),
> especially how exactly we can use the set-uid and what is the 'default' h=
elper.
> We also would prefer to do everything from qemu but we do not see how
> we can do that.


Something like:

1) -netdev tap,rss_helper=3D/path/to/name
2) having a sample/default helper implemented in Qemu
3) we can introduce something special path like "default", then if
-netdev tap,rss_helper=3D"default" is specified, qemu will use the
sample helper

So we have:
1) set set-uid for the helper
2) libvirt may just choose to launch the default helper

>
> Our main points (what should be addressed):
> - qemu should be able to load ebpf and use the maps when it runs from
> libvirt (without special caps) and standalone (with caps)

This is solved by leaving the privileged operations to the helper with set-=
uid.

> - it is possible that there are different qemu builds on the machine,
> one of them might be installed, their ebpf's might be different and
> the interface between qemu and ebpf (exact content of maps and number
> of maps)

We can use different helpers in this way.

> - qemu configures the RSS dynamically according to the commands
> provided by the guest

Consider we decided to use mmap() based maps, this is not an issue.

Or am I missing something?

Thanks

>
> Thanks in advance
> Yuri
>
> >
> > Thanks
> >
> >
> > >
> > >>> Also, libbpf dependency now exclusively for Linux.
> > >>> Libbpf is used for eBPF RSS steering, which is supported only by Li=
nux TAP.
> > >>> There is no reason yet to build eBPF loader and helper for non Linu=
x systems,
> > >>> even if libbpf is present.
> > >>>
> > >>> Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
> > >>> ---
> > >>>    ebpf/qemu-ebpf-rss-helper.c | 130 ++++++++++++++++++++++++++++++=
++++++
> > >>>    meson.build                 |  37 ++++++----
> > >>>    2 files changed, 154 insertions(+), 13 deletions(-)
> > >>>    create mode 100644 ebpf/qemu-ebpf-rss-helper.c
> > >>>
> > >>> diff --git a/ebpf/qemu-ebpf-rss-helper.c b/ebpf/qemu-ebpf-rss-helpe=
r.c
> > >>> new file mode 100644
> > >>> index 0000000000..fe68758f57
> > >>> --- /dev/null
> > >>> +++ b/ebpf/qemu-ebpf-rss-helper.c
> > >>> @@ -0,0 +1,130 @@
> > >>> +/*
> > >>> + * eBPF RSS Helper
> > >>> + *
> > >>> + * Developed by Daynix Computing LTD (http://www.daynix.com)
> > >>> + *
> > >>> + * Authors:
> > >>> + *  Andrew Melnychenko <andrew@daynix.com>
> > >>> + *
> > >>> + * This work is licensed under the terms of the GNU GPL, version 2=
.  See
> > >>> + * the COPYING file in the top-level directory.
> > >>> + *
> > >>> + * Description: This is helper program for libvirtd.
> > >>> + *              It loads eBPF RSS program and passes fds through u=
nix socket.
> > >>> + *              Built by meson, target - 'qemu-ebpf-rss-helper'.
> > >>> + */
> > >>> +
> > >>> +#include <stdio.h>
> > >>> +#include <stdint.h>
> > >>> +#include <stdlib.h>
> > >>> +#include <stdbool.h>
> > >>> +#include <getopt.h>
> > >>> +#include <memory.h>
> > >>> +#include <errno.h>
> > >>> +#include <sys/socket.h>
> > >>> +
> > >>> +#include "ebpf_rss.h"
> > >>> +
> > >>> +#include "qemu-helper-stamp.h"
> > >>> +
> > >>> +void QEMU_HELPER_STAMP(void) {}
> > >>> +
> > >>> +static int send_fds(int socket, int *fds, int n)
> > >>> +{
> > >>> +    struct msghdr msg =3D {};
> > >>> +    struct cmsghdr *cmsg =3D NULL;
> > >>> +    char buf[CMSG_SPACE(n * sizeof(int))];
> > >>> +    char dummy_buffer =3D 0;
> > >>> +    struct iovec io =3D { .iov_base =3D &dummy_buffer,
> > >>> +                        .iov_len =3D sizeof(dummy_buffer) };
> > >>> +
> > >>> +    memset(buf, 0, sizeof(buf));
> > >>> +
> > >>> +    msg.msg_iov =3D &io;
> > >>> +    msg.msg_iovlen =3D 1;
> > >>> +    msg.msg_control =3D buf;
> > >>> +    msg.msg_controllen =3D sizeof(buf);
> > >>> +
> > >>> +    cmsg =3D CMSG_FIRSTHDR(&msg);
> > >>> +    cmsg->cmsg_level =3D SOL_SOCKET;
> > >>> +    cmsg->cmsg_type =3D SCM_RIGHTS;
> > >>> +    cmsg->cmsg_len =3D CMSG_LEN(n * sizeof(int));
> > >>> +
> > >>> +    memcpy(CMSG_DATA(cmsg), fds, n * sizeof(int));
> > >>> +
> > >>> +    return sendmsg(socket, &msg, 0);
> > >>> +}
> > >>> +
> > >>> +static void print_help_and_exit(const char *prog, int exitcode)
> > >>> +{
> > >>> +    fprintf(stderr, "%s - load eBPF RSS program for qemu and pass =
eBPF fds"
> > >>> +            " through unix socket.\n", prog);
> > >>> +    fprintf(stderr, "\t--fd <num>, -f <num> - unix socket file des=
criptor"
> > >>> +            " used to pass eBPF fds.\n");
> > >>> +    fprintf(stderr, "\t--help, -h - this help.\n");
> > >>> +    exit(exitcode);
> > >>> +}
> > >>> +
> > >>> +int main(int argc, char **argv)
> > >>> +{
> > >>> +    char *fd_string =3D NULL;
> > >>> +    int unix_fd =3D 0;
> > >>> +    struct EBPFRSSContext ctx =3D {};
> > >>> +    int fds[EBPF_RSS_MAX_FDS] =3D {};
> > >>> +    int ret =3D -1;
> > >>> +
> > >>> +    for (;;) {
> > >>> +        int c;
> > >>> +        static struct option long_options[] =3D {
> > >>> +                {"help",  no_argument, 0, 'h'},
> > >>> +                {"fd",  required_argument, 0, 'f'},
> > >>> +                {0, 0, 0, 0}
> > >>> +        };
> > >>> +        c =3D getopt_long(argc, argv, "hf:",
> > >>> +                long_options, NULL);
> > >>> +
> > >>> +        if (c =3D=3D -1) {
> > >>> +            break;
> > >>> +        }
> > >>> +
> > >>> +        switch (c) {
> > >>> +        case 'f':
> > >>> +            fd_string =3D optarg;
> > >>> +            break;
> > >>> +        case 'h':
> > >>> +        default:
> > >>> +            print_help_and_exit(argv[0],
> > >>> +                    c =3D=3D 'h' ? EXIT_SUCCESS : EXIT_FAILURE);
> > >>> +        }
> > >>> +    }
> > >>> +
> > >>> +    if (!fd_string) {
> > >>> +        fprintf(stderr, "Unix file descriptor not present.\n");
> > >>> +        print_help_and_exit(argv[0], EXIT_FAILURE);
> > >>> +    }
> > >>> +
> > >>> +    unix_fd =3D atoi(fd_string);
> > >>> +
> > >>> +    if (!unix_fd) {
> > >>> +        fprintf(stderr, "Unix file descriptor is invalid.\n");
> > >>> +        return EXIT_FAILURE;
> > >>> +    }
> > >>> +
> > >>> +    ebpf_rss_init(&ctx);
> > >>> +    if (!ebpf_rss_load(&ctx)) {
> > >>> +        fprintf(stderr, "Can't load ebpf.\n");
> > >>> +        return EXIT_FAILURE;
> > >>> +    }
> > >>> +    fds[0] =3D ctx.program_fd;
> > >>> +    fds[1] =3D ctx.map_configuration;
> > >>> +
> > >>> +    ret =3D send_fds(unix_fd, fds, EBPF_RSS_MAX_FDS);
> > >>> +    if (ret < 0) {
> > >>> +        fprintf(stderr, "Issue while sending fds: %s.\n", strerror=
(errno));
> > >>> +    }
> > >>> +
> > >>> +    ebpf_rss_unload(&ctx);
> > >>> +
> > >>> +    return ret < 0 ? EXIT_FAILURE : EXIT_SUCCESS;
> > >>> +}
> > >>> +
> > >>> diff --git a/meson.build b/meson.build
> > >>> index 257e51d91b..913aa1fee5 100644
> > >>> --- a/meson.build
> > >>> +++ b/meson.build
> > >>> @@ -1033,19 +1033,22 @@ if not get_option('fuse_lseek').disabled()
> > >>>    endif
> > >>>
> > >>>    # libbpf
> > >>> -libbpf =3D dependency('libbpf', required: get_option('bpf'), metho=
d: 'pkg-config')
> > >>> -if libbpf.found() and not cc.links('''
> > >>> -   #include <bpf/libbpf.h>
> > >>> -   int main(void)
> > >>> -   {
> > >>> -     bpf_object__destroy_skeleton(NULL);
> > >>> -     return 0;
> > >>> -   }''', dependencies: libbpf)
> > >>> -  libbpf =3D not_found
> > >>> -  if get_option('bpf').enabled()
> > >>> -    error('libbpf skeleton test failed')
> > >>> -  else
> > >>> -    warning('libbpf skeleton test failed, disabling')
> > >>> +libbpf =3D not_found
> > >>> +if targetos =3D=3D 'linux'
> > >>> +  libbpf =3D dependency('libbpf', required: get_option('bpf'), met=
hod: 'pkg-config')
> > >>> +  if libbpf.found() and not cc.links('''
> > >>> +    #include <bpf/libbpf.h>
> > >>> +    int main(void)
> > >>> +    {
> > >>> +      bpf_object__destroy_skeleton(NULL);
> > >>
> > >> Do we need to test whether the bpf can do mmap() here?
> > >>
> > >> Thanks
> > >>
> > >>
> > >>> +      return 0;
> > >>> +    }''', dependencies: libbpf)
> > >>> +    libbpf =3D not_found
> > >>> +    if get_option('bpf').enabled()
> > >>> +      error('libbpf skeleton test failed')
> > >>> +    else
> > >>> +      warning('libbpf skeleton test failed, disabling')
> > >>> +    endif
> > >>>      endif
> > >>>    endif
> > >>>
> > >>> @@ -2423,6 +2426,14 @@ if have_tools
> > >>>                   dependencies: [authz, crypto, io, qom, qemuutil,
> > >>>                                  libcap_ng, mpathpersist],
> > >>>                   install: true)
> > >>> +
> > >>> +    if libbpf.found()
> > >>> +        executable('qemu-ebpf-rss-helper', files(
> > >>> +                   'ebpf/qemu-ebpf-rss-helper.c', 'ebpf/ebpf_rss.c=
'),
> > >>> +                   dependencies: [qemuutil, libbpf, glib],
> > >>> +                   install: true,
> > >>> +                   install_dir: get_option('libexecdir'))
> > >>> +    endif
> > >>>      endif
> > >>>
> > >>>      if 'CONFIG_IVSHMEM' in config_host
> >
>


