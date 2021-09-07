Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C83402277
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 05:24:33 +0200 (CEST)
Received: from localhost ([::1]:45714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNRiq-0004Bp-5v
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 23:24:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mNRh8-0002ts-VZ
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 23:22:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mNRh5-00053w-5s
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 23:22:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630984961;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oTHKjMyYvp/HMzx41sulKyYijospLHHfqnfkjHG1xhg=;
 b=c+6dWfOCxR3yj/a6j2S8GLX3zr/kTPhw9k3Zg6lIQKj7RDiksAOVx6V+uA3TclbURi0DVC
 pSQIlJczb3v6YpaKle/6adWGPJwB2wMStEBZCkSZc5yCNxV7f53h/zJajGmmdsZgX0VEPP
 7AR/7teQful3QpkpuZHMf7oJYD63sc0=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177-mHpYjO95OfyxoQ_rtYrDUA-1; Mon, 06 Sep 2021 23:22:38 -0400
X-MC-Unique: mHpYjO95OfyxoQ_rtYrDUA-1
Received: by mail-lf1-f69.google.com with SMTP id
 x33-20020a0565121321b02903ac51262781so2070799lfu.9
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 20:22:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=oTHKjMyYvp/HMzx41sulKyYijospLHHfqnfkjHG1xhg=;
 b=fb2Bn9w1ji2UEElOiMxvP4krD6kv7ln6KdeMZuS0tff8QMLFdhTTkDR96frj7NypBx
 MMB3yvqjICb/b9cIGtW4P8346aogBEh2BN1grL6+gJeYuWAiuIutCiHRzAfscL3sO3II
 YQ6m/BgzVM1/gtmIFAHY1wq3Rc6glhf+u4XcRdt2/u340lg2Q2JZn7qfYJdQ4l0SvJ6L
 cptAgiPHiQkqKlJzQVO/nyYFCRS14NWy8Vk2i2vj8xB73TaEqz8kaIMuQP6VpIWJVThm
 ECQ5CFSg56CLhuqd6TAaTTtHjuSxfdcEQAgYxC9UAmw7hiZNTseoqZBZZntu/PfZhmW1
 mfsw==
X-Gm-Message-State: AOAM533D+RXqR+QS7SfobS5YJ8SCYCWOWMFoRxy51S+iQu/MfHNBmRwa
 zJNe1dcIp0Oundl8WF1O7UO9d77ol7r9n2bBaxsQOGCNQ0cGj6Nm1RBEyxVZXt+7I8AspVigDjT
 pys7PPkLrwJ6F+NCr+AsgLAgYFiLL8RY=
X-Received: by 2002:ac2:5fc5:: with SMTP id q5mr11121959lfg.629.1630984956362; 
 Mon, 06 Sep 2021 20:22:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz12Wc4M4CqXXUcYoCXrFI+E2/kMGfR+/9c9BBViddz8FGOWptpg79MleARDnW+OdDd5xoYZcSIJwFR6zpnx60=
X-Received: by 2002:ac2:5fc5:: with SMTP id q5mr11121933lfg.629.1630984956021; 
 Mon, 06 Sep 2021 20:22:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210713153758.323614-1-andrew@daynix.com>
 <20210713153758.323614-5-andrew@daynix.com>
 <e73ce649-a04e-5200-8258-487a565c7e20@redhat.com>
 <CAOEp5OekBjFfwPEJ3JU-x0_wrwO9szApOk=kR3e7AKhiLqa9-w@mail.gmail.com>
 <38ea6b36-b968-02bf-b3a8-3d6393df31a5@redhat.com>
 <CABcq3pGuqjBY_uqs3BthXS4oSViC=kP16sUbeqLFKJAoQWq6Xw@mail.gmail.com>
In-Reply-To: <CABcq3pGuqjBY_uqs3BthXS4oSViC=kP16sUbeqLFKJAoQWq6Xw@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 7 Sep 2021 11:22:25 +0800
Message-ID: <CACGkMEuwzya7Dh62=WbdFwZEYEFE7CN9ZYdkP8aThkdOFFh4iQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] ebpf_rss_helper: Added helper for eBPF RSS.
To: Andrew Melnichenko <andrew@daynix.com>
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
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Yan Vugenfirer <yan@daynix.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 6, 2021 at 11:50 PM Andrew Melnichenko <andrew@daynix.com> wrot=
e:
>
> Hi,
>>
>> I think it's for back-compatibility.
>>
>> E.g current codes works without mmap(), and user will surprise that it
>> wont' work after upgrading their qemu.
>
> Well, the current code would require additional capabilities with "kernel=
.unprivileged_bpf_disabled=3D1", which may be possible on RedHat systems.
> Technically we may have mmap test which will show that mmap for BPF_MAP_T=
YPE_ARRAY works, but on the target system, we will know it only in runtime.
> If I'm not mistaken, mmap for BPF_MAP_TYPE_ARRAY was added before kernel =
5.4 and our bpf program requires kernel 5.8+.

Ok, if this is the case, please explain this in the commit log.

Btw, any reason that 5.8 is required for our bpf program?

Thanks

> So, there are no reasons to add bpf() update map as a fallback for mmap()=
.
>
> On Wed, Sep 1, 2021 at 9:42 AM Jason Wang <jasowang@redhat.com> wrote:
>>
>>
>> =E5=9C=A8 2021/8/31 =E4=B8=8A=E5=8D=881:07, Yuri Benditovich =E5=86=99=
=E9=81=93:
>> > On Fri, Aug 20, 2021 at 6:41 AM Jason Wang <jasowang@redhat.com> wrote=
:
>> >>
>> >> =E5=9C=A8 2021/7/13 =E4=B8=8B=E5=8D=8811:37, Andrew Melnychenko =E5=
=86=99=E9=81=93:
>> >>> Helper program. Loads eBPF RSS program and maps and passes them thro=
ugh unix socket.
>> >>> Libvirt may launch this helper and pass eBPF fds to qemu virtio-net.
>> >>
>> >> I wonder if this can be done as helper for TAP/bridge.
>> >>
>> >> E.g it's the qemu to launch those helper with set-uid.
>> >>
>> >> Then libvirt won't even need to care about that?
>> >>
>> > There are pros and cons for such a solution with set-uid.
>> >  From my point of view one of the cons is that set-uid is efficient
>> > only at install time so the coexistence of different qemu builds (and
>> > different helpers for each one) is kind of problematic.
>> > With the current solution this does not present any problem: the
>> > developer can have several different builds, each one automatically
>> > has its own helper and there is no conflict between these builds and
>> > between these builds and installed qemu package. Changing the
>> > 'emulator' in the libvirt profile automatically brings the proper
>> > helper to work.
>>
>>
>> I'm not sure I get you here. We can still have default/sample helper to
>> make sure it works for different builds.
>>
>> If we can avoid the involvement of libvirt, that would be better.
>>
>> Thanks
>>
>>
>> >
>> >>> Also, libbpf dependency now exclusively for Linux.
>> >>> Libbpf is used for eBPF RSS steering, which is supported only by Lin=
ux TAP.
>> >>> There is no reason yet to build eBPF loader and helper for non Linux=
 systems,
>> >>> even if libbpf is present.
>> >>>
>> >>> Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
>> >>> ---
>> >>>    ebpf/qemu-ebpf-rss-helper.c | 130 +++++++++++++++++++++++++++++++=
+++++
>> >>>    meson.build                 |  37 ++++++----
>> >>>    2 files changed, 154 insertions(+), 13 deletions(-)
>> >>>    create mode 100644 ebpf/qemu-ebpf-rss-helper.c
>> >>>
>> >>> diff --git a/ebpf/qemu-ebpf-rss-helper.c b/ebpf/qemu-ebpf-rss-helper=
.c
>> >>> new file mode 100644
>> >>> index 0000000000..fe68758f57
>> >>> --- /dev/null
>> >>> +++ b/ebpf/qemu-ebpf-rss-helper.c
>> >>> @@ -0,0 +1,130 @@
>> >>> +/*
>> >>> + * eBPF RSS Helper
>> >>> + *
>> >>> + * Developed by Daynix Computing LTD (http://www.daynix.com)
>> >>> + *
>> >>> + * Authors:
>> >>> + *  Andrew Melnychenko <andrew@daynix.com>
>> >>> + *
>> >>> + * This work is licensed under the terms of the GNU GPL, version 2.=
  See
>> >>> + * the COPYING file in the top-level directory.
>> >>> + *
>> >>> + * Description: This is helper program for libvirtd.
>> >>> + *              It loads eBPF RSS program and passes fds through un=
ix socket.
>> >>> + *              Built by meson, target - 'qemu-ebpf-rss-helper'.
>> >>> + */
>> >>> +
>> >>> +#include <stdio.h>
>> >>> +#include <stdint.h>
>> >>> +#include <stdlib.h>
>> >>> +#include <stdbool.h>
>> >>> +#include <getopt.h>
>> >>> +#include <memory.h>
>> >>> +#include <errno.h>
>> >>> +#include <sys/socket.h>
>> >>> +
>> >>> +#include "ebpf_rss.h"
>> >>> +
>> >>> +#include "qemu-helper-stamp.h"
>> >>> +
>> >>> +void QEMU_HELPER_STAMP(void) {}
>> >>> +
>> >>> +static int send_fds(int socket, int *fds, int n)
>> >>> +{
>> >>> +    struct msghdr msg =3D {};
>> >>> +    struct cmsghdr *cmsg =3D NULL;
>> >>> +    char buf[CMSG_SPACE(n * sizeof(int))];
>> >>> +    char dummy_buffer =3D 0;
>> >>> +    struct iovec io =3D { .iov_base =3D &dummy_buffer,
>> >>> +                        .iov_len =3D sizeof(dummy_buffer) };
>> >>> +
>> >>> +    memset(buf, 0, sizeof(buf));
>> >>> +
>> >>> +    msg.msg_iov =3D &io;
>> >>> +    msg.msg_iovlen =3D 1;
>> >>> +    msg.msg_control =3D buf;
>> >>> +    msg.msg_controllen =3D sizeof(buf);
>> >>> +
>> >>> +    cmsg =3D CMSG_FIRSTHDR(&msg);
>> >>> +    cmsg->cmsg_level =3D SOL_SOCKET;
>> >>> +    cmsg->cmsg_type =3D SCM_RIGHTS;
>> >>> +    cmsg->cmsg_len =3D CMSG_LEN(n * sizeof(int));
>> >>> +
>> >>> +    memcpy(CMSG_DATA(cmsg), fds, n * sizeof(int));
>> >>> +
>> >>> +    return sendmsg(socket, &msg, 0);
>> >>> +}
>> >>> +
>> >>> +static void print_help_and_exit(const char *prog, int exitcode)
>> >>> +{
>> >>> +    fprintf(stderr, "%s - load eBPF RSS program for qemu and pass e=
BPF fds"
>> >>> +            " through unix socket.\n", prog);
>> >>> +    fprintf(stderr, "\t--fd <num>, -f <num> - unix socket file desc=
riptor"
>> >>> +            " used to pass eBPF fds.\n");
>> >>> +    fprintf(stderr, "\t--help, -h - this help.\n");
>> >>> +    exit(exitcode);
>> >>> +}
>> >>> +
>> >>> +int main(int argc, char **argv)
>> >>> +{
>> >>> +    char *fd_string =3D NULL;
>> >>> +    int unix_fd =3D 0;
>> >>> +    struct EBPFRSSContext ctx =3D {};
>> >>> +    int fds[EBPF_RSS_MAX_FDS] =3D {};
>> >>> +    int ret =3D -1;
>> >>> +
>> >>> +    for (;;) {
>> >>> +        int c;
>> >>> +        static struct option long_options[] =3D {
>> >>> +                {"help",  no_argument, 0, 'h'},
>> >>> +                {"fd",  required_argument, 0, 'f'},
>> >>> +                {0, 0, 0, 0}
>> >>> +        };
>> >>> +        c =3D getopt_long(argc, argv, "hf:",
>> >>> +                long_options, NULL);
>> >>> +
>> >>> +        if (c =3D=3D -1) {
>> >>> +            break;
>> >>> +        }
>> >>> +
>> >>> +        switch (c) {
>> >>> +        case 'f':
>> >>> +            fd_string =3D optarg;
>> >>> +            break;
>> >>> +        case 'h':
>> >>> +        default:
>> >>> +            print_help_and_exit(argv[0],
>> >>> +                    c =3D=3D 'h' ? EXIT_SUCCESS : EXIT_FAILURE);
>> >>> +        }
>> >>> +    }
>> >>> +
>> >>> +    if (!fd_string) {
>> >>> +        fprintf(stderr, "Unix file descriptor not present.\n");
>> >>> +        print_help_and_exit(argv[0], EXIT_FAILURE);
>> >>> +    }
>> >>> +
>> >>> +    unix_fd =3D atoi(fd_string);
>> >>> +
>> >>> +    if (!unix_fd) {
>> >>> +        fprintf(stderr, "Unix file descriptor is invalid.\n");
>> >>> +        return EXIT_FAILURE;
>> >>> +    }
>> >>> +
>> >>> +    ebpf_rss_init(&ctx);
>> >>> +    if (!ebpf_rss_load(&ctx)) {
>> >>> +        fprintf(stderr, "Can't load ebpf.\n");
>> >>> +        return EXIT_FAILURE;
>> >>> +    }
>> >>> +    fds[0] =3D ctx.program_fd;
>> >>> +    fds[1] =3D ctx.map_configuration;
>> >>> +
>> >>> +    ret =3D send_fds(unix_fd, fds, EBPF_RSS_MAX_FDS);
>> >>> +    if (ret < 0) {
>> >>> +        fprintf(stderr, "Issue while sending fds: %s.\n", strerror(=
errno));
>> >>> +    }
>> >>> +
>> >>> +    ebpf_rss_unload(&ctx);
>> >>> +
>> >>> +    return ret < 0 ? EXIT_FAILURE : EXIT_SUCCESS;
>> >>> +}
>> >>> +
>> >>> diff --git a/meson.build b/meson.build
>> >>> index 257e51d91b..913aa1fee5 100644
>> >>> --- a/meson.build
>> >>> +++ b/meson.build
>> >>> @@ -1033,19 +1033,22 @@ if not get_option('fuse_lseek').disabled()
>> >>>    endif
>> >>>
>> >>>    # libbpf
>> >>> -libbpf =3D dependency('libbpf', required: get_option('bpf'), method=
: 'pkg-config')
>> >>> -if libbpf.found() and not cc.links('''
>> >>> -   #include <bpf/libbpf.h>
>> >>> -   int main(void)
>> >>> -   {
>> >>> -     bpf_object__destroy_skeleton(NULL);
>> >>> -     return 0;
>> >>> -   }''', dependencies: libbpf)
>> >>> -  libbpf =3D not_found
>> >>> -  if get_option('bpf').enabled()
>> >>> -    error('libbpf skeleton test failed')
>> >>> -  else
>> >>> -    warning('libbpf skeleton test failed, disabling')
>> >>> +libbpf =3D not_found
>> >>> +if targetos =3D=3D 'linux'
>> >>> +  libbpf =3D dependency('libbpf', required: get_option('bpf'), meth=
od: 'pkg-config')
>> >>> +  if libbpf.found() and not cc.links('''
>> >>> +    #include <bpf/libbpf.h>
>> >>> +    int main(void)
>> >>> +    {
>> >>> +      bpf_object__destroy_skeleton(NULL);
>> >>
>> >> Do we need to test whether the bpf can do mmap() here?
>> >>
>> >> Thanks
>> >>
>> >>
>> >>> +      return 0;
>> >>> +    }''', dependencies: libbpf)
>> >>> +    libbpf =3D not_found
>> >>> +    if get_option('bpf').enabled()
>> >>> +      error('libbpf skeleton test failed')
>> >>> +    else
>> >>> +      warning('libbpf skeleton test failed, disabling')
>> >>> +    endif
>> >>>      endif
>> >>>    endif
>> >>>
>> >>> @@ -2423,6 +2426,14 @@ if have_tools
>> >>>                   dependencies: [authz, crypto, io, qom, qemuutil,
>> >>>                                  libcap_ng, mpathpersist],
>> >>>                   install: true)
>> >>> +
>> >>> +    if libbpf.found()
>> >>> +        executable('qemu-ebpf-rss-helper', files(
>> >>> +                   'ebpf/qemu-ebpf-rss-helper.c', 'ebpf/ebpf_rss.c'=
),
>> >>> +                   dependencies: [qemuutil, libbpf, glib],
>> >>> +                   install: true,
>> >>> +                   install_dir: get_option('libexecdir'))
>> >>> +    endif
>> >>>      endif
>> >>>
>> >>>      if 'CONFIG_IVSHMEM' in config_host
>>


