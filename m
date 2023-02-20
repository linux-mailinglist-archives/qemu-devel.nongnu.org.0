Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7A769C808
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 10:55:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU2so-0001zq-Dz; Mon, 20 Feb 2023 04:54:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pU2sl-0001zc-DW
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 04:54:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pU2sj-0005ml-2Y
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 04:54:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676886888;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Nx1NR6ag3g9EB8ieUa4JOIkicXjenXj3Yp9wbz5I7tw=;
 b=I60rFWtcIdYCCYLXeDsFFTu3/pVvU6nRJ7/s6wvRMY0lSsOnYACKKS1nFh32bvWN3kRJ3J
 p+GUzETXiRCQff+JP7r8qFvvU4INu1gRt7+povTMFaPnSbSRBYn+9y/tpsmiNcubDDEf4O
 kKUDLYpfZZ1TpfdBUrq0MsTSmQ3jZZw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-509-woht3cXBNn-Q2btc_j0O2A-1; Mon, 20 Feb 2023 04:54:45 -0500
X-MC-Unique: woht3cXBNn-Q2btc_j0O2A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7851E183B3C0;
 Mon, 20 Feb 2023 09:54:44 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 24F802026D4B;
 Mon, 20 Feb 2023 09:54:42 +0000 (UTC)
Date: Mon, 20 Feb 2023 09:54:39 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Andrew Melnychenko <andrew@daynix.com>
Cc: jasowang@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, thuth@redhat.com, philmd@linaro.org,
 armbru@redhat.com, eblake@redhat.com, qemu-devel@nongnu.org,
 toke@redhat.com, mprivozn@redhat.com, yuri.benditovich@daynix.com,
 yan@daynix.com
Subject: Re: [PATCH 4/5] ebpf_rss_helper: Added helper for eBPF RSS.
Message-ID: <Y/NDX9LvVQMoKJL+@redhat.com>
References: <20230219162100.174318-1-andrew@daynix.com>
 <20230219162100.174318-5-andrew@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230219162100.174318-5-andrew@daynix.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sun, Feb 19, 2023 at 06:20:59PM +0200, Andrew Melnychenko wrote:
> Helper program. Loads eBPF RSS program and maps and passes them through unix socket.
> Libvirt may launch this helper and pass eBPF fds to qemu virtio-net.
> Also, libbpf dependency for now is exclusively for Linux.
> Libbpf is used for eBPF RSS steering, which is supported only by Linux TAP.
> There is no reason yet to build eBPF loader and helper for non-Linux systems,
> even if libbpf is present.
> 
> Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
> ---
>  ebpf/qemu-ebpf-rss-helper.c | 132 ++++++++++++++++++++++++++++++++++++
>  meson.build                 |  37 ++++++----
>  2 files changed, 156 insertions(+), 13 deletions(-)
>  create mode 100644 ebpf/qemu-ebpf-rss-helper.c
> 
> diff --git a/ebpf/qemu-ebpf-rss-helper.c b/ebpf/qemu-ebpf-rss-helper.c
> new file mode 100644
> index 0000000000..348d26bcdd
> --- /dev/null
> +++ b/ebpf/qemu-ebpf-rss-helper.c
> @@ -0,0 +1,132 @@
> +/*
> + * eBPF RSS Helper
> + *
> + * Developed by Daynix Computing LTD (http://www.daynix.com)
> + *
> + * Authors:
> + *  Andrew Melnychenko <andrew@daynix.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2.  See
> + * the COPYING file in the top-level directory.

Is there a reason for specifying GPL version 2 only ?

Unless this has copied code from one of the existing GPLv2-only files
in QEMU, the requirement (listed in LICENSE) is that new contributions
will be GPLv2-or-later, except for a handful of sub-directories.



> + *
> + * Description: This is helper program for libvirtd.
> + *              It loads eBPF RSS program and passes fds through unix socket.
> + *              Built by meson, target - 'qemu-ebpf-rss-helper'.
> + */
> +
> +#include <stdio.h>
> +#include <stdint.h>
> +#include <stdlib.h>
> +#include <stdbool.h>
> +#include <getopt.h>
> +#include <memory.h>
> +#include <errno.h>
> +#include <sys/socket.h>
> +
> +#include "ebpf_rss.h"
> +
> +#include "qemu-ebpf-rss-helper-stamp.h"
> +
> +void QEMU_EBPF_RSS_HELPER_STAMP(void) {}
> +
> +static int send_fds(int socket, int *fds, int n)
> +{
> +    struct msghdr msg = {};
> +    struct cmsghdr *cmsg = NULL;
> +    char buf[CMSG_SPACE(n * sizeof(int))];
> +    char dummy_buffer = 0;
> +    struct iovec io = { .iov_base = &dummy_buffer,
> +                        .iov_len = sizeof(dummy_buffer) };
> +
> +    memset(buf, 0, sizeof(buf));
> +
> +    msg.msg_iov = &io;
> +    msg.msg_iovlen = 1;
> +    msg.msg_control = buf;
> +    msg.msg_controllen = sizeof(buf);
> +
> +    cmsg = CMSG_FIRSTHDR(&msg);
> +    cmsg->cmsg_level = SOL_SOCKET;
> +    cmsg->cmsg_type = SCM_RIGHTS;
> +    cmsg->cmsg_len = CMSG_LEN(n * sizeof(int));
> +
> +    memcpy(CMSG_DATA(cmsg), fds, n * sizeof(int));
> +
> +    return sendmsg(socket, &msg, 0);
> +}
> +
> +static void print_help_and_exit(const char *prog, int exitcode)
> +{
> +    fprintf(stderr, "%s - load eBPF RSS program for qemu and pass eBPF fds"
> +            " through unix socket.\n", prog);
> +    fprintf(stderr, "\t--fd <num>, -f <num> - unix socket file descriptor"
> +            " used to pass eBPF fds.\n");
> +    fprintf(stderr, "\t--help, -h - this help.\n");
> +    exit(exitcode);
> +}
> +
> +int main(int argc, char **argv)
> +{
> +    char *fd_string = NULL;
> +    int unix_fd = 0;
> +    struct EBPFRSSContext ctx = {};
> +    int fds[EBPF_RSS_MAX_FDS] = {};
> +    int ret = -1;
> +
> +    for (;;) {
> +        int c;
> +        static struct option long_options[] = {
> +                {"help",  no_argument, 0, 'h'},
> +                {"fd",  required_argument, 0, 'f'},
> +                {0, 0, 0, 0}
> +        };
> +        c = getopt_long(argc, argv, "hf:",
> +                long_options, NULL);
> +
> +        if (c == -1) {
> +            break;
> +        }
> +
> +        switch (c) {
> +        case 'f':
> +            fd_string = optarg;
> +            break;
> +        case 'h':
> +        default:
> +            print_help_and_exit(argv[0],
> +                    c == 'h' ? EXIT_SUCCESS : EXIT_FAILURE);
> +        }
> +    }
> +
> +    if (!fd_string) {
> +        fprintf(stderr, "Unix file descriptor not present.\n");
> +        print_help_and_exit(argv[0], EXIT_FAILURE);
> +    }
> +
> +    unix_fd = atoi(fd_string);
> +
> +    if (!unix_fd) {
> +        fprintf(stderr, "Unix file descriptor is invalid.\n");
> +        return EXIT_FAILURE;
> +    }
> +
> +    ebpf_rss_init(&ctx);
> +    if (!ebpf_rss_load(&ctx)) {
> +        fprintf(stderr, "Can't load ebpf.\n");
> +        return EXIT_FAILURE;
> +    }
> +    fds[0] = ctx.program_fd;
> +    fds[1] = ctx.map_configuration;
> +    fds[2] = ctx.map_toeplitz_key;
> +    fds[3] = ctx.map_indirections_table;
> +
> +    ret = send_fds(unix_fd, fds, EBPF_RSS_MAX_FDS);
> +    if (ret < 0) {
> +        fprintf(stderr, "Issue while sending fds: %s.\n", strerror(errno));
> +    }
> +
> +    ebpf_rss_unload(&ctx);
> +
> +    return ret < 0 ? EXIT_FAILURE : EXIT_SUCCESS;
> +}
> +
> diff --git a/meson.build b/meson.build
> index b409912aed..6e6e2f3e40 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1632,19 +1632,22 @@ elif get_option('vduse_blk_export').disabled()
>  endif
>  
>  # libbpf
> -libbpf = dependency('libbpf', required: get_option('bpf'), method: 'pkg-config')
> -if libbpf.found() and not cc.links('''
> -   #include <bpf/libbpf.h>
> -   int main(void)
> -   {
> -     bpf_object__destroy_skeleton(NULL);
> -     return 0;
> -   }''', dependencies: libbpf)
> -  libbpf = not_found
> -  if get_option('bpf').enabled()
> -    error('libbpf skeleton test failed')
> -  else
> -    warning('libbpf skeleton test failed, disabling')
> +libbpf = not_found
> +if targetos == 'linux'
> +  libbpf = dependency('libbpf', required: get_option('bpf'), method: 'pkg-config')
> +  if libbpf.found() and not cc.links('''
> +    #include <bpf/libbpf.h>
> +    int main(void)
> +    {
> +      bpf_object__destroy_skeleton(NULL);
> +      return 0;
> +    }''', dependencies: libbpf)
> +    libbpf = not_found
> +    if get_option('bpf').enabled()
> +      error('libbpf skeleton test failed')
> +    else
> +      warning('libbpf skeleton test failed, disabling')
> +    endif
>    endif
>  endif
>  
> @@ -3646,6 +3649,14 @@ if have_tools
>                 dependencies: [authz, crypto, io, qom, qemuutil,
>                                libcap_ng, mpathpersist],
>                 install: true)
> +
> +    if libbpf.found()
> +        executable('qemu-ebpf-rss-helper', files(
> +                   'ebpf/qemu-ebpf-rss-helper.c', 'ebpf/ebpf_rss.c'),
> +                   dependencies: [qemuutil, libbpf, glib],
> +                   install: true,
> +                   install_dir: get_option('libexecdir'))
> +    endif
>    endif
>  
>    if have_ivshmem
> -- 
> 2.39.1
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


