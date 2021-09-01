Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F81A3FD3E3
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 08:39:42 +0200 (CEST)
Received: from localhost ([::1]:46684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLJuP-0002Ih-82
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 02:39:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mLJt2-0001cD-UV
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 02:38:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mLJsy-00049d-2g
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 02:38:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630478289;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vc8Kljq9voUB5Z15yQVdfLPUsEXiIqgIKoRELHeu7l4=;
 b=Q1xDZMoJoqMCW1iLa5w2523irgkAQP0K17Ti6OAseZSEHcT1tzP5gcSFv7nxEO4gHYmCTv
 1Qv95WBFEmBKhpPOSMsD99CR4xQERvTxyW6sSXZ9ewxF3aGZbwSLmQscsfeob4rzMRG15Z
 Xu0QDjQ2qC4+6BUI4ZEsgpNJxa6aQZc=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-482-QBX9vmf2Psak2TS3KUT3oA-1; Wed, 01 Sep 2021 02:38:05 -0400
X-MC-Unique: QBX9vmf2Psak2TS3KUT3oA-1
Received: by mail-pg1-f200.google.com with SMTP id
 1-20020a630e41000000b002528846c9f2so1136446pgo.12
 for <qemu-devel@nongnu.org>; Tue, 31 Aug 2021 23:38:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Vc8Kljq9voUB5Z15yQVdfLPUsEXiIqgIKoRELHeu7l4=;
 b=mk1eHMKTVdJyuwXWO8nEOXc4CAY+w598riyML9ilKHVa0j+MaK/EsPkg9nqlTMfAMv
 icm6BABL7+RNBKsGSoUhhnnKgpTEu/LNX9l03v9LtWbef5Rx88C9kXvwpfCMln2SyoWV
 ilNqQIKUoWTMAVYQCCfI26jIwQ/E0BbX5zgkYiWXbtS1c76+gOEOlsnDo7hQoOttV/QO
 5XlFRxwbqAx+yzqKCM8h03cl1UlcDSX9TON7G5VPbBbbrpNhjen7T101pibfGozFVbXz
 wYBDNStiyWzIxtEe158HJcL1XPvqqDaaMgF3vw6t5Kwys4kSLJPouTLWz4JB+HbSD7fP
 r/FQ==
X-Gm-Message-State: AOAM532vjrJBs/OP9Uf9YX9lLv6UuYv9fclKmwxM6s0F+RVJBV50BrAl
 kxBF5e1fBCUQNzZrDRRNQOf+xG80RZki+WJRntiAX4mGYqygTggfEe+G9a+Rfc6wS8bKNpA/2K5
 gGQveMWHypywB/kY=
X-Received: by 2002:a17:90a:d3d0:: with SMTP id
 d16mr10027526pjw.103.1630478284456; 
 Tue, 31 Aug 2021 23:38:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyTVj1oyzAoFFXn/VhJ9knPHUcwARILdpdhoGqFy34DeuD8Jam5zOMuj4srKsB96BC/hP9nDQ==
X-Received: by 2002:a17:90a:d3d0:: with SMTP id
 d16mr10027499pjw.103.1630478284145; 
 Tue, 31 Aug 2021 23:38:04 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id w14sm19680417pge.40.2021.08.31.23.38.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Aug 2021 23:38:03 -0700 (PDT)
Subject: Re: [PATCH 4/5] ebpf_rss_helper: Added helper for eBPF RSS.
To: Andrew Melnichenko <andrew@daynix.com>
References: <20210713153758.323614-1-andrew@daynix.com>
 <20210713153758.323614-5-andrew@daynix.com>
 <e73ce649-a04e-5200-8258-487a565c7e20@redhat.com>
 <CABcq3pFTTMRY-N=f-ORHnE_RP-awWZheGbihfTpv7m+=dQQ9DA@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <c04d0234-48c0-e40f-b866-2d8061f5c292@redhat.com>
Date: Wed, 1 Sep 2021 14:37:54 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CABcq3pFTTMRY-N=f-ORHnE_RP-awWZheGbihfTpv7m+=dQQ9DA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.932, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Yan Vugenfirer <yan@daynix.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/8/26 上午2:24, Andrew Melnichenko 写道:
> Hi,
>
>     I wonder if this can be done as helper for TAP/bridge.
>
> Well, it does already, libvirt may create TAP device and pass it in 
> command line or using getfd qmp command.
>
>     E.g it's the qemu to launch those helper with set-uid.
>
>     Then libvirt won't even need to care about that?
>
> Yea, we may think about this routine in the future as a fallback.
>
>     Do we need to test whether the bpf can do mmap() here?
>
> I'm not sure that it's required.


I think it's for back-compatibility.

E.g current codes works without mmap(), and user will surprise that it 
wont' work after upgrading their qemu.

Thanks



>
> On Fri, Aug 20, 2021 at 6:41 AM Jason Wang <jasowang@redhat.com 
> <mailto:jasowang@redhat.com>> wrote:
>
>
>     在 2021/7/13 下午11:37, Andrew Melnychenko 写道:
>     > Helper program. Loads eBPF RSS program and maps and passes them
>     through unix socket.
>     > Libvirt may launch this helper and pass eBPF fds to qemu virtio-net.
>
>
>     I wonder if this can be done as helper for TAP/bridge.
>
>     E.g it's the qemu to launch those helper with set-uid.
>
>     Then libvirt won't even need to care about that?
>
>
>     > Also, libbpf dependency now exclusively for Linux.
>     > Libbpf is used for eBPF RSS steering, which is supported only by
>     Linux TAP.
>     > There is no reason yet to build eBPF loader and helper for non
>     Linux systems,
>     > even if libbpf is present.
>     >
>     > Signed-off-by: Andrew Melnychenko <andrew@daynix.com
>     <mailto:andrew@daynix.com>>
>     > ---
>     >   ebpf/qemu-ebpf-rss-helper.c | 130
>     ++++++++++++++++++++++++++++++++++++
>     >   meson.build                 |  37 ++++++----
>     >   2 files changed, 154 insertions(+), 13 deletions(-)
>     >   create mode 100644 ebpf/qemu-ebpf-rss-helper.c
>     >
>     > diff --git a/ebpf/qemu-ebpf-rss-helper.c
>     b/ebpf/qemu-ebpf-rss-helper.c
>     > new file mode 100644
>     > index 0000000000..fe68758f57
>     > --- /dev/null
>     > +++ b/ebpf/qemu-ebpf-rss-helper.c
>     > @@ -0,0 +1,130 @@
>     > +/*
>     > + * eBPF RSS Helper
>     > + *
>     > + * Developed by Daynix Computing LTD (http://www.daynix.com
>     <http://www.daynix.com>)
>     > + *
>     > + * Authors:
>     > + *  Andrew Melnychenko <andrew@daynix.com
>     <mailto:andrew@daynix.com>>
>     > + *
>     > + * This work is licensed under the terms of the GNU GPL,
>     version 2.  See
>     > + * the COPYING file in the top-level directory.
>     > + *
>     > + * Description: This is helper program for libvirtd.
>     > + *              It loads eBPF RSS program and passes fds
>     through unix socket.
>     > + *              Built by meson, target - 'qemu-ebpf-rss-helper'.
>     > + */
>     > +
>     > +#include <stdio.h>
>     > +#include <stdint.h>
>     > +#include <stdlib.h>
>     > +#include <stdbool.h>
>     > +#include <getopt.h>
>     > +#include <memory.h>
>     > +#include <errno.h>
>     > +#include <sys/socket.h>
>     > +
>     > +#include "ebpf_rss.h"
>     > +
>     > +#include "qemu-helper-stamp.h"
>     > +
>     > +void QEMU_HELPER_STAMP(void) {}
>     > +
>     > +static int send_fds(int socket, int *fds, int n)
>     > +{
>     > +    struct msghdr msg = {};
>     > +    struct cmsghdr *cmsg = NULL;
>     > +    char buf[CMSG_SPACE(n * sizeof(int))];
>     > +    char dummy_buffer = 0;
>     > +    struct iovec io = { .iov_base = &dummy_buffer,
>     > +                        .iov_len = sizeof(dummy_buffer) };
>     > +
>     > +    memset(buf, 0, sizeof(buf));
>     > +
>     > +    msg.msg_iov = &io;
>     > +    msg.msg_iovlen = 1;
>     > +    msg.msg_control = buf;
>     > +    msg.msg_controllen = sizeof(buf);
>     > +
>     > +    cmsg = CMSG_FIRSTHDR(&msg);
>     > +    cmsg->cmsg_level = SOL_SOCKET;
>     > +    cmsg->cmsg_type = SCM_RIGHTS;
>     > +    cmsg->cmsg_len = CMSG_LEN(n * sizeof(int));
>     > +
>     > +    memcpy(CMSG_DATA(cmsg), fds, n * sizeof(int));
>     > +
>     > +    return sendmsg(socket, &msg, 0);
>     > +}
>     > +
>     > +static void print_help_and_exit(const char *prog, int exitcode)
>     > +{
>     > +    fprintf(stderr, "%s - load eBPF RSS program for qemu and
>     pass eBPF fds"
>     > +            " through unix socket.\n", prog);
>     > +    fprintf(stderr, "\t--fd <num>, -f <num> - unix socket file
>     descriptor"
>     > +            " used to pass eBPF fds.\n");
>     > +    fprintf(stderr, "\t--help, -h - this help.\n");
>     > +    exit(exitcode);
>     > +}
>     > +
>     > +int main(int argc, char **argv)
>     > +{
>     > +    char *fd_string = NULL;
>     > +    int unix_fd = 0;
>     > +    struct EBPFRSSContext ctx = {};
>     > +    int fds[EBPF_RSS_MAX_FDS] = {};
>     > +    int ret = -1;
>     > +
>     > +    for (;;) {
>     > +        int c;
>     > +        static struct option long_options[] = {
>     > +                {"help",  no_argument, 0, 'h'},
>     > +                {"fd",  required_argument, 0, 'f'},
>     > +                {0, 0, 0, 0}
>     > +        };
>     > +        c = getopt_long(argc, argv, "hf:",
>     > +                long_options, NULL);
>     > +
>     > +        if (c == -1) {
>     > +            break;
>     > +        }
>     > +
>     > +        switch (c) {
>     > +        case 'f':
>     > +            fd_string = optarg;
>     > +            break;
>     > +        case 'h':
>     > +        default:
>     > +            print_help_and_exit(argv[0],
>     > +                    c == 'h' ? EXIT_SUCCESS : EXIT_FAILURE);
>     > +        }
>     > +    }
>     > +
>     > +    if (!fd_string) {
>     > +        fprintf(stderr, "Unix file descriptor not present.\n");
>     > +        print_help_and_exit(argv[0], EXIT_FAILURE);
>     > +    }
>     > +
>     > +    unix_fd = atoi(fd_string);
>     > +
>     > +    if (!unix_fd) {
>     > +        fprintf(stderr, "Unix file descriptor is invalid.\n");
>     > +        return EXIT_FAILURE;
>     > +    }
>     > +
>     > +    ebpf_rss_init(&ctx);
>     > +    if (!ebpf_rss_load(&ctx)) {
>     > +        fprintf(stderr, "Can't load ebpf.\n");
>     > +        return EXIT_FAILURE;
>     > +    }
>     > +    fds[0] = ctx.program_fd;
>     > +    fds[1] = ctx.map_configuration;
>     > +
>     > +    ret = send_fds(unix_fd, fds, EBPF_RSS_MAX_FDS);
>     > +    if (ret < 0) {
>     > +        fprintf(stderr, "Issue while sending fds: %s.\n",
>     strerror(errno));
>     > +    }
>     > +
>     > +    ebpf_rss_unload(&ctx);
>     > +
>     > +    return ret < 0 ? EXIT_FAILURE : EXIT_SUCCESS;
>     > +}
>     > +
>     > diff --git a/meson.build b/meson.build
>     > index 257e51d91b..913aa1fee5 100644
>     > --- a/meson.build
>     > +++ b/meson.build
>     > @@ -1033,19 +1033,22 @@ if not get_option('fuse_lseek').disabled()
>     >   endif
>     >
>     >   # libbpf
>     > -libbpf = dependency('libbpf', required: get_option('bpf'),
>     method: 'pkg-config')
>     > -if libbpf.found() and not cc.links('''
>     > -   #include <bpf/libbpf.h>
>     > -   int main(void)
>     > -   {
>     > -     bpf_object__destroy_skeleton(NULL);
>     > -     return 0;
>     > -   }''', dependencies: libbpf)
>     > -  libbpf = not_found
>     > -  if get_option('bpf').enabled()
>     > -    error('libbpf skeleton test failed')
>     > -  else
>     > -    warning('libbpf skeleton test failed, disabling')
>     > +libbpf = not_found
>     > +if targetos == 'linux'
>     > +  libbpf = dependency('libbpf', required: get_option('bpf'),
>     method: 'pkg-config')
>     > +  if libbpf.found() and not cc.links('''
>     > +    #include <bpf/libbpf.h>
>     > +    int main(void)
>     > +    {
>     > +      bpf_object__destroy_skeleton(NULL);
>
>
>     Do we need to test whether the bpf can do mmap() here?
>
>     Thanks
>
>
>     > +      return 0;
>     > +    }''', dependencies: libbpf)
>     > +    libbpf = not_found
>     > +    if get_option('bpf').enabled()
>     > +      error('libbpf skeleton test failed')
>     > +    else
>     > +      warning('libbpf skeleton test failed, disabling')
>     > +    endif
>     >     endif
>     >   endif
>     >
>     > @@ -2423,6 +2426,14 @@ if have_tools
>     >                  dependencies: [authz, crypto, io, qom, qemuutil,
>     >                                 libcap_ng, mpathpersist],
>     >                  install: true)
>     > +
>     > +    if libbpf.found()
>     > +        executable('qemu-ebpf-rss-helper', files(
>     > +                   'ebpf/qemu-ebpf-rss-helper.c',
>     'ebpf/ebpf_rss.c'),
>     > +                   dependencies: [qemuutil, libbpf, glib],
>     > +                   install: true,
>     > +                   install_dir: get_option('libexecdir'))
>     > +    endif
>     >     endif
>     >
>     >     if 'CONFIG_IVSHMEM' in config_host
>


