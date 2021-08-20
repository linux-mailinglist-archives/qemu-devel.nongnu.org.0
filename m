Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61ABA3F256C
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 05:42:50 +0200 (CEST)
Received: from localhost ([::1]:50796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGvQf-00027W-G4
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 23:42:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mGvP3-0001L3-P1
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 23:41:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mGvOz-0007UB-G0
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 23:41:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629430864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x9/dwPBy31eLRKx2xYJSPtQix1uoBT8Q60Nub8+hgd8=;
 b=gB45GEA/bI1qnEi0YRFDDxpV01qM6cBEfxo8RY2N72WXQ8cBEb1f9bDOI50d90iOki4HsL
 xuO27D8KkjZI+ZoBgcr3KRZXOEzWEeiHS9tesw7qMWzNHZ2eI5VP8ZH3Rih2q5aWNG7zQg
 JORdGy3K8VTnHyJgeUDC3KnVBgdeFCY=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-545-2r43QjTaNUqq0-CfAy7TyA-1; Thu, 19 Aug 2021 23:41:00 -0400
X-MC-Unique: 2r43QjTaNUqq0-CfAy7TyA-1
Received: by mail-pf1-f199.google.com with SMTP id
 g17-20020a056a00079100b003e1010a1ad4so4026882pfu.5
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 20:41:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=x9/dwPBy31eLRKx2xYJSPtQix1uoBT8Q60Nub8+hgd8=;
 b=FruDpccKb3uqCSBqpCz5cy01vGzslc2+YRY23DL2vF+Q44BCKNVDBCfrYiJXZheI0N
 bVXGau8tkwq6HjKFJ4UtFc4I7i0CjeeXEzTMK9IRW7qc8Tt8q0pCEMrshMlTCkF113Ma
 /32fUXjqFA3IYxp+5npIUut5HzeqRAHvO5WVxdKXR79Ku154pTPYLe5TOZqOBJFgcO86
 hC00/fIziofFqVLEWMv3NDLYrVN6kfN71MBB6py2lm2f+6s6BSDBX5/vZNXmW8iqRcnX
 yxpSW9gYnUeFEJgl9xswSaYt8tnf8ciI08XTdKWCsYCu9F8MQBhJKhuKCZCWYIISTfK1
 X4+A==
X-Gm-Message-State: AOAM532CUzsBdjq6uxJcCn4Dh0Dv93Q3hmiUORm/pJywpADDZkhzj2QM
 9S0smHRhY4n9z+SyAwiHcYHdR2EZfzmooY6kwtynNc1ZMeax0Pr/Nh3YL6ju8IJ0QjzuhHsyErq
 9j4eb7JGc5f51xrY=
X-Received: by 2002:a62:9288:0:b0:3e1:c44f:a1b7 with SMTP id
 o130-20020a629288000000b003e1c44fa1b7mr17951474pfd.63.1629430859146; 
 Thu, 19 Aug 2021 20:40:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwbpKT5Bsp+FY8reeT9RZeBJzDOjKEOCbX2CfmMVACDeRsGHhcl0OfUazcB3HZE3+eSxxDF2w==
X-Received: by 2002:a62:9288:0:b0:3e1:c44f:a1b7 with SMTP id
 o130-20020a629288000000b003e1c44fa1b7mr17951454pfd.63.1629430858883; 
 Thu, 19 Aug 2021 20:40:58 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id p9sm5019630pfn.97.2021.08.19.20.40.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Aug 2021 20:40:58 -0700 (PDT)
Subject: Re: [PATCH 4/5] ebpf_rss_helper: Added helper for eBPF RSS.
To: Andrew Melnychenko <andrew@daynix.com>, mst@redhat.com,
 yuri.benditovich@daynix.com, armbru@redhat.com, eblake@redhat.com,
 berrange@redhat.com
References: <20210713153758.323614-1-andrew@daynix.com>
 <20210713153758.323614-5-andrew@daynix.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <e73ce649-a04e-5200-8258-487a565c7e20@redhat.com>
Date: Fri, 20 Aug 2021 11:40:52 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210713153758.323614-5-andrew@daynix.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_CHARSET_FARAWAY=2.45, NICE_REPLY_A=-2.591, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: yan@daynix.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


ÔÚ 2021/7/13 ÏÂÎç11:37, Andrew Melnychenko Ð´µÀ:
> Helper program. Loads eBPF RSS program and maps and passes them through unix socket.
> Libvirt may launch this helper and pass eBPF fds to qemu virtio-net.


I wonder if this can be done as helper for TAP/bridge.

E.g it's the qemu to launch those helper with set-uid.

Then libvirt won't even need to care about that?


> Also, libbpf dependency now exclusively for Linux.
> Libbpf is used for eBPF RSS steering, which is supported only by Linux TAP.
> There is no reason yet to build eBPF loader and helper for non Linux systems,
> even if libbpf is present.
>
> Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
> ---
>   ebpf/qemu-ebpf-rss-helper.c | 130 ++++++++++++++++++++++++++++++++++++
>   meson.build                 |  37 ++++++----
>   2 files changed, 154 insertions(+), 13 deletions(-)
>   create mode 100644 ebpf/qemu-ebpf-rss-helper.c
>
> diff --git a/ebpf/qemu-ebpf-rss-helper.c b/ebpf/qemu-ebpf-rss-helper.c
> new file mode 100644
> index 0000000000..fe68758f57
> --- /dev/null
> +++ b/ebpf/qemu-ebpf-rss-helper.c
> @@ -0,0 +1,130 @@
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
> +#include "qemu-helper-stamp.h"
> +
> +void QEMU_HELPER_STAMP(void) {}
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
> index 257e51d91b..913aa1fee5 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1033,19 +1033,22 @@ if not get_option('fuse_lseek').disabled()
>   endif
>   
>   # libbpf
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


Do we need to test whether the bpf can do mmap() here?

Thanks


> +      return 0;
> +    }''', dependencies: libbpf)
> +    libbpf = not_found
> +    if get_option('bpf').enabled()
> +      error('libbpf skeleton test failed')
> +    else
> +      warning('libbpf skeleton test failed, disabling')
> +    endif
>     endif
>   endif
>   
> @@ -2423,6 +2426,14 @@ if have_tools
>                  dependencies: [authz, crypto, io, qom, qemuutil,
>                                 libcap_ng, mpathpersist],
>                  install: true)
> +
> +    if libbpf.found()
> +        executable('qemu-ebpf-rss-helper', files(
> +                   'ebpf/qemu-ebpf-rss-helper.c', 'ebpf/ebpf_rss.c'),
> +                   dependencies: [qemuutil, libbpf, glib],
> +                   install: true,
> +                   install_dir: get_option('libexecdir'))
> +    endif
>     endif
>   
>     if 'CONFIG_IVSHMEM' in config_host


