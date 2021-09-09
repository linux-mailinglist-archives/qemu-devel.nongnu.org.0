Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC804042B5
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 03:17:51 +0200 (CEST)
Received: from localhost ([::1]:40594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mO8hK-0003IH-E0
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 21:17:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mO8gN-0002ca-E9
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 21:16:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mO8gL-0004g1-29
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 21:16:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631150208;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fv4EHKXGiqfokvcCnmpq93AuUOXnWFZLy6ehM1EqT5M=;
 b=eK1boHyUO+EMjAd07B1NmtyNb68u3X2Tadxy0guKcVthXnpOhVQGWA2hUs2OhxT7xIT837
 hLwI+qtB0TzhJ2YhTqSU9paR1OQ6fnhSeBOEuD1MQa9hvmV0OkRsQOas+io9dwiZPYuR8N
 6hAmXrXPoFzYx/3cH6dxqVGJ0E1klXA=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-123-zqrhvF8tN2WYqF0u8RZ3ng-1; Wed, 08 Sep 2021 21:16:44 -0400
X-MC-Unique: zqrhvF8tN2WYqF0u8RZ3ng-1
Received: by mail-lf1-f71.google.com with SMTP id
 b15-20020a056512024f00b003e776206456so27184lfo.16
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 18:16:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fv4EHKXGiqfokvcCnmpq93AuUOXnWFZLy6ehM1EqT5M=;
 b=fAKD1IfwRpgXFHJdiAZW6jWJLW+0TVrbhsPoliOKg6zSH4u/m7YmtnFF/NcFIxR42q
 AfQg9RUtk72LpNvNiJbgPUgCgCoDqz+9FAcPsl1JzkqdNp9vEXHP12yK863EazEuHnRx
 0+RXAR/E9XcBRatWJWbd/Q5iKW0whqg+GNXR/Z4vL+ZGOcD33K3I25wnEyJzKkcBzS5i
 O0QiWNTwkJFSB4hkj2ABhUHxgW3N3kqCCtA4gZHDVM582gOXDDKd9SPktAYc6KtCB0jU
 YMsg5XeECB8Wv18qvoHuVxtWwERI0ob7sP0giX7QjNHnMP5RQfpVWjGwj71+wHuNDm69
 RAxg==
X-Gm-Message-State: AOAM532LvaBC6cCuC4hNZ2FLuuOATe4bIvsXO6Yqn83yiUtpwTzeLE8h
 Pj7jyoBptyYjOrdGezjnrjlTj2V/agndiuEr33VE6KYlgF4DT0NBKmFGPdX/eAyhqgC5IFq2VZj
 5GyAkZJ1hNeAZzYqXYEGDl31frj0Q0zA=
X-Received: by 2002:a05:651c:54c:: with SMTP id
 q12mr210077ljp.369.1631150203086; 
 Wed, 08 Sep 2021 18:16:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxGoXjJNVwxVVK8VsSYCQm28roK9wETGxBRWKYSynK6zEEc7C/kBc3wfY96lLB2RG/1GugLw2Km1AeFXv6GsKg=
X-Received: by 2002:a05:651c:54c:: with SMTP id
 q12mr210061ljp.369.1631150202701; 
 Wed, 08 Sep 2021 18:16:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210713153758.323614-1-andrew@daynix.com>
 <20210713153758.323614-5-andrew@daynix.com>
 <e73ce649-a04e-5200-8258-487a565c7e20@redhat.com>
 <CAOEp5OekBjFfwPEJ3JU-x0_wrwO9szApOk=kR3e7AKhiLqa9-w@mail.gmail.com>
 <38ea6b36-b968-02bf-b3a8-3d6393df31a5@redhat.com>
 <CAOEp5OcrwBJh=89wQ-eA0Z1MZpprYtLVvJSF1YrNPhu2kzqzCA@mail.gmail.com>
 <CACGkMEua49tvtz8xv63umSbjS1nSZy6dFhrfu13ytps4socVPw@mail.gmail.com>
 <CAOEp5Ocxuroqb2Ku74z+iBHEjGbot9wvrMSwxP7wAKOPWnPSJg@mail.gmail.com>
In-Reply-To: <CAOEp5Ocxuroqb2Ku74z+iBHEjGbot9wvrMSwxP7wAKOPWnPSJg@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 9 Sep 2021 09:16:31 +0800
Message-ID: <CACGkMEtK-XzC-jfPtV-fffRGeSFD9AbEhUu9VSdF+J+Ne_yhew@mail.gmail.com>
Subject: Re: [PATCH 4/5] ebpf_rss_helper: Added helper for eBPF RSS.
To: Yuri Benditovich <yuri.benditovich@daynix.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
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

On Thu, Sep 9, 2021 at 8:00 AM Yuri Benditovich
<yuri.benditovich@daynix.com> wrote:
>
> On Wed, Sep 8, 2021 at 6:45 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> > On Tue, Sep 7, 2021 at 6:40 PM Yuri Benditovich
> > <yuri.benditovich@daynix.com> wrote:
> > >
> > > On Wed, Sep 1, 2021 at 9:42 AM Jason Wang <jasowang@redhat.com> wrote=
:
> > > >
> > > >
> > > > =E5=9C=A8 2021/8/31 =E4=B8=8A=E5=8D=881:07, Yuri Benditovich =E5=86=
=99=E9=81=93:
> > > > > On Fri, Aug 20, 2021 at 6:41 AM Jason Wang <jasowang@redhat.com> =
wrote:
> > > > >>
> > > > >> =E5=9C=A8 2021/7/13 =E4=B8=8B=E5=8D=8811:37, Andrew Melnychenko =
=E5=86=99=E9=81=93:
> > > > >>> Helper program. Loads eBPF RSS program and maps and passes them=
 through unix socket.
> > > > >>> Libvirt may launch this helper and pass eBPF fds to qemu virtio=
-net.
> > > > >>
> > > > >> I wonder if this can be done as helper for TAP/bridge.
> > > > >>
> > > > >> E.g it's the qemu to launch those helper with set-uid.
> > > > >>
> > > > >> Then libvirt won't even need to care about that?
> > > > >>
> > > > > There are pros and cons for such a solution with set-uid.
> > > > >  From my point of view one of the cons is that set-uid is efficie=
nt
> > > > > only at install time so the coexistence of different qemu builds =
(and
> > > > > different helpers for each one) is kind of problematic.
> > > > > With the current solution this does not present any problem: the
> > > > > developer can have several different builds, each one automatical=
ly
> > > > > has its own helper and there is no conflict between these builds =
and
> > > > > between these builds and installed qemu package. Changing the
> > > > > 'emulator' in the libvirt profile automatically brings the proper
> > > > > helper to work.
> > > >
> > > >
> > > > I'm not sure I get you here. We can still have default/sample helpe=
r to
> > > > make sure it works for different builds.
> > > >
> > > > If we can avoid the involvement of libvirt, that would be better.
> > >
> > > Hi Jason,
> > >
> > > Indeed I did not get the idea, can you please explain it in more
> > > details (as detailed as possible to avoid future misunderstanding),
> > > especially how exactly we can use the set-uid and what is the 'defaul=
t' helper.
> > > We also would prefer to do everything from qemu but we do not see how
> > > we can do that.
> >
> >
> Some more questions to understand the idea better:
> > Something like:
> >
> > 1) -netdev tap,rss_helper=3D/path/to/name
>
> So, on each editing of 'emulator' in the xml  the helper path should
> be set manually or be default?

It could done manually, or we can have a default path.

>
> > 2) having a sample/default helper implemented in Qemu
>
> Does it mean the default helper is the code in the qemu (without
> running additional executable, like it does today)

Yes.

 or this is qemu
> itself with dedicated command line?
> As far as I remember Daniel had strong objections of ever running qemu
> with capabilities

Qemu won't run with capabilities but the helper.

>
> > 3) we can introduce something special path like "default", then if
> > -netdev tap,rss_helper=3D"default" is specified, qemu will use the
> > sample helper
>
> Probably this is not so important but the rss helper and rss in
> general has no relation to netdev, much more they are related to
> virtio-net

So I think the reason for this is that we currently only support
eBPF/RSS for tap.

>
> >
> > So we have:
> > 1) set set-uid for the helper
> Who and when does set-uid to the helper binary? Only installer or
> libvirt can do that, correct?

Yes, it could be done the installer, or other system provision tools.

>
> > 2) libvirt may just choose to launch the default helper
> All this discussion is to avoid launching the helper from libvirt, correc=
t?

Sorry, it's a typo. I meant, libvirt launch qemu, and then qemu will
launch the helper.

Thanks

>
> >
> > >
> > > Our main points (what should be addressed):
> > > - qemu should be able to load ebpf and use the maps when it runs from
> > > libvirt (without special caps) and standalone (with caps)
> >
> > This is solved by leaving the privileged operations to the helper with =
set-uid.
> >
> > > - it is possible that there are different qemu builds on the machine,
> > > one of them might be installed, their ebpf's might be different and
> > > the interface between qemu and ebpf (exact content of maps and number
> > > of maps)
> >
> > We can use different helpers in this way.
> >
> > > - qemu configures the RSS dynamically according to the commands
> > > provided by the guest
> >
> > Consider we decided to use mmap() based maps, this is not an issue.
> >
> > Or am I missing something?
> >
> > Thanks
> >
> > >
> > > Thanks in advance
> > > Yuri
> > >
> > > >
> > > > Thanks
> > > >
> > > >
> > > > >
> > > > >>> Also, libbpf dependency now exclusively for Linux.
> > > > >>> Libbpf is used for eBPF RSS steering, which is supported only b=
y Linux TAP.
> > > > >>> There is no reason yet to build eBPF loader and helper for non =
Linux systems,
> > > > >>> even if libbpf is present.
> > > > >>>
> > > > >>> Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
> > > > >>> ---
> > > > >>>    ebpf/qemu-ebpf-rss-helper.c | 130 ++++++++++++++++++++++++++=
++++++++++
> > > > >>>    meson.build                 |  37 ++++++----
> > > > >>>    2 files changed, 154 insertions(+), 13 deletions(-)
> > > > >>>    create mode 100644 ebpf/qemu-ebpf-rss-helper.c
> > > > >>>
> > > > >>> diff --git a/ebpf/qemu-ebpf-rss-helper.c b/ebpf/qemu-ebpf-rss-h=
elper.c
> > > > >>> new file mode 100644
> > > > >>> index 0000000000..fe68758f57
> > > > >>> --- /dev/null
> > > > >>> +++ b/ebpf/qemu-ebpf-rss-helper.c
> > > > >>> @@ -0,0 +1,130 @@
> > > > >>> +/*
> > > > >>> + * eBPF RSS Helper
> > > > >>> + *
> > > > >>> + * Developed by Daynix Computing LTD (http://www.daynix.com)
> > > > >>> + *
> > > > >>> + * Authors:
> > > > >>> + *  Andrew Melnychenko <andrew@daynix.com>
> > > > >>> + *
> > > > >>> + * This work is licensed under the terms of the GNU GPL, versi=
on 2.  See
> > > > >>> + * the COPYING file in the top-level directory.
> > > > >>> + *
> > > > >>> + * Description: This is helper program for libvirtd.
> > > > >>> + *              It loads eBPF RSS program and passes fds throu=
gh unix socket.
> > > > >>> + *              Built by meson, target - 'qemu-ebpf-rss-helper=
'.
> > > > >>> + */
> > > > >>> +
> > > > >>> +#include <stdio.h>
> > > > >>> +#include <stdint.h>
> > > > >>> +#include <stdlib.h>
> > > > >>> +#include <stdbool.h>
> > > > >>> +#include <getopt.h>
> > > > >>> +#include <memory.h>
> > > > >>> +#include <errno.h>
> > > > >>> +#include <sys/socket.h>
> > > > >>> +
> > > > >>> +#include "ebpf_rss.h"
> > > > >>> +
> > > > >>> +#include "qemu-helper-stamp.h"
> > > > >>> +
> > > > >>> +void QEMU_HELPER_STAMP(void) {}
> > > > >>> +
> > > > >>> +static int send_fds(int socket, int *fds, int n)
> > > > >>> +{
> > > > >>> +    struct msghdr msg =3D {};
> > > > >>> +    struct cmsghdr *cmsg =3D NULL;
> > > > >>> +    char buf[CMSG_SPACE(n * sizeof(int))];
> > > > >>> +    char dummy_buffer =3D 0;
> > > > >>> +    struct iovec io =3D { .iov_base =3D &dummy_buffer,
> > > > >>> +                        .iov_len =3D sizeof(dummy_buffer) };
> > > > >>> +
> > > > >>> +    memset(buf, 0, sizeof(buf));
> > > > >>> +
> > > > >>> +    msg.msg_iov =3D &io;
> > > > >>> +    msg.msg_iovlen =3D 1;
> > > > >>> +    msg.msg_control =3D buf;
> > > > >>> +    msg.msg_controllen =3D sizeof(buf);
> > > > >>> +
> > > > >>> +    cmsg =3D CMSG_FIRSTHDR(&msg);
> > > > >>> +    cmsg->cmsg_level =3D SOL_SOCKET;
> > > > >>> +    cmsg->cmsg_type =3D SCM_RIGHTS;
> > > > >>> +    cmsg->cmsg_len =3D CMSG_LEN(n * sizeof(int));
> > > > >>> +
> > > > >>> +    memcpy(CMSG_DATA(cmsg), fds, n * sizeof(int));
> > > > >>> +
> > > > >>> +    return sendmsg(socket, &msg, 0);
> > > > >>> +}
> > > > >>> +
> > > > >>> +static void print_help_and_exit(const char *prog, int exitcode=
)
> > > > >>> +{
> > > > >>> +    fprintf(stderr, "%s - load eBPF RSS program for qemu and p=
ass eBPF fds"
> > > > >>> +            " through unix socket.\n", prog);
> > > > >>> +    fprintf(stderr, "\t--fd <num>, -f <num> - unix socket file=
 descriptor"
> > > > >>> +            " used to pass eBPF fds.\n");
> > > > >>> +    fprintf(stderr, "\t--help, -h - this help.\n");
> > > > >>> +    exit(exitcode);
> > > > >>> +}
> > > > >>> +
> > > > >>> +int main(int argc, char **argv)
> > > > >>> +{
> > > > >>> +    char *fd_string =3D NULL;
> > > > >>> +    int unix_fd =3D 0;
> > > > >>> +    struct EBPFRSSContext ctx =3D {};
> > > > >>> +    int fds[EBPF_RSS_MAX_FDS] =3D {};
> > > > >>> +    int ret =3D -1;
> > > > >>> +
> > > > >>> +    for (;;) {
> > > > >>> +        int c;
> > > > >>> +        static struct option long_options[] =3D {
> > > > >>> +                {"help",  no_argument, 0, 'h'},
> > > > >>> +                {"fd",  required_argument, 0, 'f'},
> > > > >>> +                {0, 0, 0, 0}
> > > > >>> +        };
> > > > >>> +        c =3D getopt_long(argc, argv, "hf:",
> > > > >>> +                long_options, NULL);
> > > > >>> +
> > > > >>> +        if (c =3D=3D -1) {
> > > > >>> +            break;
> > > > >>> +        }
> > > > >>> +
> > > > >>> +        switch (c) {
> > > > >>> +        case 'f':
> > > > >>> +            fd_string =3D optarg;
> > > > >>> +            break;
> > > > >>> +        case 'h':
> > > > >>> +        default:
> > > > >>> +            print_help_and_exit(argv[0],
> > > > >>> +                    c =3D=3D 'h' ? EXIT_SUCCESS : EXIT_FAILURE=
);
> > > > >>> +        }
> > > > >>> +    }
> > > > >>> +
> > > > >>> +    if (!fd_string) {
> > > > >>> +        fprintf(stderr, "Unix file descriptor not present.\n")=
;
> > > > >>> +        print_help_and_exit(argv[0], EXIT_FAILURE);
> > > > >>> +    }
> > > > >>> +
> > > > >>> +    unix_fd =3D atoi(fd_string);
> > > > >>> +
> > > > >>> +    if (!unix_fd) {
> > > > >>> +        fprintf(stderr, "Unix file descriptor is invalid.\n");
> > > > >>> +        return EXIT_FAILURE;
> > > > >>> +    }
> > > > >>> +
> > > > >>> +    ebpf_rss_init(&ctx);
> > > > >>> +    if (!ebpf_rss_load(&ctx)) {
> > > > >>> +        fprintf(stderr, "Can't load ebpf.\n");
> > > > >>> +        return EXIT_FAILURE;
> > > > >>> +    }
> > > > >>> +    fds[0] =3D ctx.program_fd;
> > > > >>> +    fds[1] =3D ctx.map_configuration;
> > > > >>> +
> > > > >>> +    ret =3D send_fds(unix_fd, fds, EBPF_RSS_MAX_FDS);
> > > > >>> +    if (ret < 0) {
> > > > >>> +        fprintf(stderr, "Issue while sending fds: %s.\n", stre=
rror(errno));
> > > > >>> +    }
> > > > >>> +
> > > > >>> +    ebpf_rss_unload(&ctx);
> > > > >>> +
> > > > >>> +    return ret < 0 ? EXIT_FAILURE : EXIT_SUCCESS;
> > > > >>> +}
> > > > >>> +
> > > > >>> diff --git a/meson.build b/meson.build
> > > > >>> index 257e51d91b..913aa1fee5 100644
> > > > >>> --- a/meson.build
> > > > >>> +++ b/meson.build
> > > > >>> @@ -1033,19 +1033,22 @@ if not get_option('fuse_lseek').disable=
d()
> > > > >>>    endif
> > > > >>>
> > > > >>>    # libbpf
> > > > >>> -libbpf =3D dependency('libbpf', required: get_option('bpf'), m=
ethod: 'pkg-config')
> > > > >>> -if libbpf.found() and not cc.links('''
> > > > >>> -   #include <bpf/libbpf.h>
> > > > >>> -   int main(void)
> > > > >>> -   {
> > > > >>> -     bpf_object__destroy_skeleton(NULL);
> > > > >>> -     return 0;
> > > > >>> -   }''', dependencies: libbpf)
> > > > >>> -  libbpf =3D not_found
> > > > >>> -  if get_option('bpf').enabled()
> > > > >>> -    error('libbpf skeleton test failed')
> > > > >>> -  else
> > > > >>> -    warning('libbpf skeleton test failed, disabling')
> > > > >>> +libbpf =3D not_found
> > > > >>> +if targetos =3D=3D 'linux'
> > > > >>> +  libbpf =3D dependency('libbpf', required: get_option('bpf'),=
 method: 'pkg-config')
> > > > >>> +  if libbpf.found() and not cc.links('''
> > > > >>> +    #include <bpf/libbpf.h>
> > > > >>> +    int main(void)
> > > > >>> +    {
> > > > >>> +      bpf_object__destroy_skeleton(NULL);
> > > > >>
> > > > >> Do we need to test whether the bpf can do mmap() here?
> > > > >>
> > > > >> Thanks
> > > > >>
> > > > >>
> > > > >>> +      return 0;
> > > > >>> +    }''', dependencies: libbpf)
> > > > >>> +    libbpf =3D not_found
> > > > >>> +    if get_option('bpf').enabled()
> > > > >>> +      error('libbpf skeleton test failed')
> > > > >>> +    else
> > > > >>> +      warning('libbpf skeleton test failed, disabling')
> > > > >>> +    endif
> > > > >>>      endif
> > > > >>>    endif
> > > > >>>
> > > > >>> @@ -2423,6 +2426,14 @@ if have_tools
> > > > >>>                   dependencies: [authz, crypto, io, qom, qemuut=
il,
> > > > >>>                                  libcap_ng, mpathpersist],
> > > > >>>                   install: true)
> > > > >>> +
> > > > >>> +    if libbpf.found()
> > > > >>> +        executable('qemu-ebpf-rss-helper', files(
> > > > >>> +                   'ebpf/qemu-ebpf-rss-helper.c', 'ebpf/ebpf_r=
ss.c'),
> > > > >>> +                   dependencies: [qemuutil, libbpf, glib],
> > > > >>> +                   install: true,
> > > > >>> +                   install_dir: get_option('libexecdir'))
> > > > >>> +    endif
> > > > >>>      endif
> > > > >>>
> > > > >>>      if 'CONFIG_IVSHMEM' in config_host
> > > >
> > >
> >
>


