Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9D436D086
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 04:23:51 +0200 (CEST)
Received: from localhost ([::1]:42836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbZrh-00018I-OB
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 22:23:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lbZqV-0000UN-5j
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 22:22:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lbZqS-000840-71
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 22:22:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619576551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6ayJ/6OUW6sw4lby+b9AHYA+UxK5B8VWlx/nAccgyO4=;
 b=hhrFq3U42Kt4QqUkZIVLHTWWz3HWTL9l95iXoyydO5mpiZqUaSeaQ1Y+p5Jj1ljLOkJOmX
 znCBqoHh66eI+AEWXPdIEN0R0iD9mMzW4vLghjPO2V/3DHEgxGhifUni2Gu97izr57PuCN
 8iwCRXIgjWHrb8h4RbqU0vYBHuX21ds=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-chrPua1RPbGASUtA_fzJ_A-1; Tue, 27 Apr 2021 22:22:27 -0400
X-MC-Unique: chrPua1RPbGASUtA_fzJ_A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BEF2B803622;
 Wed, 28 Apr 2021 02:22:26 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-12-131.pek2.redhat.com
 [10.72.12.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C745B5D9C0;
 Wed, 28 Apr 2021 02:22:23 +0000 (UTC)
Subject: Re: [PATCH v6 0/7] eBPF RSS support for virtio-net
To: Andrew Melnichenko <andrew@daynix.com>
References: <20210412082512.14998-1-andrew@daynix.com>
 <94e8d3e4-7c63-4b42-109d-2c655ac118ba@redhat.com>
 <CABcq3pE1GUCxrjo=Vj-w_e+hKhhCnQa_YC6B4cfC1qm_Wh2pNQ@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <ddfc2621-ecbd-d985-c284-6c6c56563429@redhat.com>
Date: Wed, 28 Apr 2021 10:22:21 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <CABcq3pE1GUCxrjo=Vj-w_e+hKhhCnQa_YC6B4cfC1qm_Wh2pNQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.218,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Yan Vugenfirer <yan@daynix.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/4/27 下午6:47, Andrew Melnichenko 写道:
> Hi,
> I've checked the issue. Apparently, libbpf can't work with a 
> skeleton on Debian.
> Version check would not help - versioning differs at different distros.


So you meant the libbpf version is too old?


> I've added a small check:
>
>     diff --git a/meson.build b/meson.build
>     index ca551dd15d..4a51a25643 100644
>     --- a/meson.build
>     +++ b/meson.build
>     @@ -1018,6 +1018,20 @@ endif
>
>      # libbpf
>      libbpf = dependency('libbpf', required: get_option('bpf'))
>     +if libbpf.found() and not cc.links('''
>     +   #include <bpf/libbpf.h>
>     +   int main(void)
>     +   {
>     +     bpf_object__destroy_skeleton(NULL);
>     +     return 0;
>     +   }''', dependencies: libbpf)
>     +  libbpf = not_found
>     +  if get_option('bpf').enabled()
>     +    error('libbpf skeleton test failed')
>     +  else
>     +    warning('libbpf skeleton test failed, disabling')
>     +  endif
>     +endif
>
>      if get_option('cfi')
>        cfi_flags=[]
>
>
> Is it possible to prepare an additional patch or should I prepare new 
> eBPFv7 patches?


Please send V7.

Thanks


>
>
> On Sun, Apr 25, 2021 at 6:32 AM Jason Wang <jasowang@redhat.com 
> <mailto:jasowang@redhat.com>> wrote:
>
>
>     在 2021/4/12 下午4:25, Andrew Melnychenko 写道:
>     > This set of patches introduces the usage of eBPF for packet steering
>     > and RSS hash calculation:
>     > * RSS(Receive Side Scaling) is used to distribute network packets to
>     > guest virtqueues by calculating packet hash
>     > * Additionally adding support for the usage of RSS with vhost
>     >
>     > The eBPF works on kernels 5.8+
>     > On earlier kerneld it fails to load and the RSS feature is reported
>     > only without vhost and implemented in 'in-qemu' software.
>     >
>     > Implementation notes:
>     > Linux TAP TUNSETSTEERINGEBPF ioctl was used to set the eBPF program.
>     > Added libbpf dependency and eBPF support.
>     > The eBPF program is part of the qemu and presented as an array
>     > of BPF ELF file data. The eBPF array file initially generated by
>     bpftool.
>     > The compilation of eBPF is not part of QEMU build and can be done
>     > using provided Makefile.ebpf.
>     > Added changes to virtio-net and vhost, primary eBPF RSS is used.
>     > 'in-qemu' RSS used in the case of hash population and as a
>     fallback option.
>     > For vhost, the hash population feature is not reported to the guest.
>     >
>     > Please also see the documentation in PATCH 6/7.
>     >
>     > Known issues:
>     > * hash population not supported by eBPF RSS: 'in-qemu' RSS used
>     > as a fallback, also, hash population feature is not reported to
>     guests
>     > with vhost.
>     > * IPv6 extensions still in progress.
>
>
>     Want to merge but it fails to build on Debian 10.9:
>
>     dpkg -l | grep libbpf
>     ii  libbpf-dev:amd64              4.19.181-1 amd64        eBPF helper
>     library (development files)
>     ii  libbpf4.19:amd64              4.19.181-1 amd64        eBPF helper
>     library (shared library)
>
>     I configure use --enable-bpf --target-list=x86_64-softmmu, and I get:
>
>     [3/1375] Compiling C object libcommon.fa.p/ebpf_ebpf_rss.c.o
>     FAILED: libcommon.fa.p/ebpf_ebpf_rss.c.o
>     cc -Ilibcommon.fa.p -I. -I.. -I../slirp -I../slirp/src
>     -I../dtc/libfdt
>     -I../capstone/include/capstone -Iqapi -Itrace -Iui -Iui/shader
>     -I/usr/include/libmount -I/usr/include/blkid -I/usr/include/uuid
>     -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include
>     -I/usr/include/gio-unix-2.0 -I/usr/include/pixman-1
>     -fdiagnostics-color=auto -pipe -Wall -Winvalid-pch -Werror -std=gnu99
>     -O2 -g -isystem /home/devel/git/qemu/linux-headers -isystem
>     linux-headers -iquote . -iquote /home/devel/git/qemu -iquote
>     /home/devel/git/qemu/include -iquote
>     /home/devel/git/qemu/disas/libvixl
>     -iquote /home/devel/git/qemu/tcg/i386 -iquote
>     /home/devel/git/qemu/accel/tcg -pthread -U_FORTIFY_SOURCE
>     -D_FORTIFY_SOURCE=2 -m64 -mcx16 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64
>     -D_LARGEFILE_SOURCE -Wstrict-prototypes -Wredundant-decls -Wundef
>     -Wwrite-strings -Wmissing-prototypes -fno-strict-aliasing -fno-common
>     -fwrapv -Wold-style-declaration -Wold-style-definition -Wtype-limits
>     -Wformat-security -Wformat-y2k -Winit-self -Wignored-qualifiers
>     -Wempty-body -Wnested-externs -Wendif-labels -Wexpansion-to-defined
>     -Wimplicit-fallthrough=2 -Wno-missing-include-dirs
>     -Wno-shift-negative-value -Wno-psabi -fstack-protector-strong
>     -fPIC -MD
>     -MQ libcommon.fa.p/ebpf_ebpf_rss.c.o -MF
>     libcommon.fa.p/ebpf_ebpf_rss.c.o.d -o
>     libcommon.fa.p/ebpf_ebpf_rss.c.o
>     -c ../ebpf/ebpf_rss.c
>     In file included from ../ebpf/ebpf_rss.c:23:
>     /home/devel/git/qemu/ebpf/rss.bpf.skeleton.h: In function
>     ‘rss_bpf__destroy’:
>     /home/devel/git/qemu/ebpf/rss.bpf.skeleton.h:32:3: error: implicit
>     declaration of function ‘bpf_object__destroy_skeleton’; did you mean
>     ‘bpf_object__kversion’? [-Werror=implicit-function-declaration]
>         bpf_object__destroy_skeleton(obj->skeleton);
>         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>         bpf_object__kversion
>     /home/devel/git/qemu/ebpf/rss.bpf.skeleton.h:32:3: error: nested
>     extern
>     declaration of ‘bpf_object__destroy_skeleton’ [-Werror=nested-externs]
>     /home/devel/git/qemu/ebpf/rss.bpf.skeleton.h: At top level:
>     /home/devel/git/qemu/ebpf/rss.bpf.skeleton.h:40:33: error: ‘struct
>     bpf_object_open_opts’ declared inside parameter list will not be
>     visible
>     outside of this definition or declaration [-Werror]
>       rss_bpf__open_opts(const struct bpf_object_open_opts *opts)
>                                       ^~~~~~~~~~~~~~~~~~~~
>     /home/devel/git/qemu/ebpf/rss.bpf.skeleton.h: In function
>     ‘rss_bpf__open_opts’:
>     /home/devel/git/qemu/ebpf/rss.bpf.skeleton.h:49:6: error: implicit
>     declaration of function ‘bpf_object__open_skeleton’; did you mean
>     ‘bpf_object__open_buffer’? [-Werror=implicit-function-declaration]
>        if (bpf_object__open_skeleton(obj->skeleton, opts))
>            ^~~~~~~~~~~~~~~~~~~~~~~~~
>            bpf_object__open_buffer
>     /home/devel/git/qemu/ebpf/rss.bpf.skeleton.h:49:6: error: nested
>     extern
>     declaration of ‘bpf_object__open_skeleton’ [-Werror=nested-externs]
>     /home/devel/git/qemu/ebpf/rss.bpf.skeleton.h: In function
>     ‘rss_bpf__load’:
>     /home/devel/git/qemu/ebpf/rss.bpf.skeleton.h:67:9: error: implicit
>     declaration of function ‘bpf_object__load_skeleton’; did you mean
>     ‘bpf_object__load’? [-Werror=implicit-function-declaration]
>        return bpf_object__load_skeleton(obj->skeleton);
>               ^~~~~~~~~~~~~~~~~~~~~~~~~
>               bpf_object__load
>     /home/devel/git/qemu/ebpf/rss.bpf.skeleton.h:67:9: error: nested
>     extern
>     declaration of ‘bpf_object__load_skeleton’ [-Werror=nested-externs]
>     /home/devel/git/qemu/ebpf/rss.bpf.skeleton.h: In function
>     ‘rss_bpf__attach’:
>     /home/devel/git/qemu/ebpf/rss.bpf.skeleton.h:88:9: error: implicit
>     declaration of function ‘bpf_object__attach_skeleton’; did you mean
>     ‘bpf_object__for_each_safe’? [-Werror=implicit-function-declaration]
>        return bpf_object__attach_skeleton(obj->skeleton);
>               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>               bpf_object__for_each_safe
>     /home/devel/git/qemu/ebpf/rss.bpf.skeleton.h:88:9: error: nested
>     extern
>     declaration of ‘bpf_object__attach_skeleton’ [-Werror=nested-externs]
>     /home/devel/git/qemu/ebpf/rss.bpf.skeleton.h: In function
>     ‘rss_bpf__detach’:
>     /home/devel/git/qemu/ebpf/rss.bpf.skeleton.h:94:9: error: implicit
>     declaration of function ‘bpf_object__detach_skeleton’; did you mean
>     ‘bpf_object__for_each_safe’? [-Werror=implicit-function-declaration]
>        return bpf_object__detach_skeleton(obj->skeleton);
>               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>               bpf_object__for_each_safe
>     /home/devel/git/qemu/ebpf/rss.bpf.skeleton.h:94:9: error: nested
>     extern
>     declaration of ‘bpf_object__detach_skeleton’ [-Werror=nested-externs]
>     /home/devel/git/qemu/ebpf/rss.bpf.skeleton.h:94:9: error: ‘return’
>     with
>     a value, in function returning void [-Werror]
>        return bpf_object__detach_skeleton(obj->skeleton);
>               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>     /home/devel/git/qemu/ebpf/rss.bpf.skeleton.h:92:1: note: declared here
>       rss_bpf__detach(struct rss_bpf *obj)
>       ^~~~~~~~~~~~~~~
>     /home/devel/git/qemu/ebpf/rss.bpf.skeleton.h: In function
>     ‘rss_bpf__create_skeleton’:
>     /home/devel/git/qemu/ebpf/rss.bpf.skeleton.h:102:53: error:
>     dereferencing pointer to incomplete type ‘struct bpf_object_skeleton’
>        s = (struct bpf_object_skeleton *)calloc(1, sizeof(*s));
>                                                           ^~
>     cc1: all warnings being treated as errors
>
>     Thanks
>
>
>     >
>     > Changes since v1:
>     > * using libbpf instead of direct 'bpf' system call.
>     > * added libbpf dependency to the configure/meson scripts.
>     > * changed python script for eBPF .h file generation.
>     > * changed eBPF program - reading L3 proto from ethernet frame.
>     > * added TUNSETSTEERINGEBPF define for TUN.
>     > * changed the maintainer's info.
>     > * added license headers.
>     > * refactored code.
>     >
>     > Changes since v2:
>     > * using bpftool for eBPF skeleton generation.
>     > * ebpf_rss is refactored to use skeleton generated by bpftool.
>     > * added/adjasted license in comment sections and in eBPF file.
>     > * rss.bpf.c and Makefile.ebpf moved to the tool/ebpf folder.
>     > * virtio-net eBPF rss refactored. Now eBPF initialized during
>     realize().
>     >
>     > Changes since v3:
>     > * rebased to last master.
>     > * fixed issue with failed build without libbpf.
>     > * fixed ebpf loading without rss option.
>     > * refactored labels in ebpf_rss.c
>     >
>     > Changes since v4:
>     > * refactored configure/meson script.
>     > * added checks for load_bytes in ebpf.
>     > * documentation added to the index.
>     > * refactored Makefile and rss.bpf.c.
>     > * rebased to last master.
>     >
>     > Changes since v5:
>     > * fixed issue with dstopt parsing in the eBPF program.
>     > * added fragment packet parsing to skip L4.
>     >
>     > Andrew (7):
>     >    net/tap: Added TUNSETSTEERINGEBPF code.
>     >    net: Added SetSteeringEBPF method for NetClientState.
>     >    ebpf: Added eBPF RSS program.
>     >    ebpf: Added eBPF RSS loader.
>     >    virtio-net: Added eBPF RSS to virtio-net.
>     >    docs: Added eBPF documentation.
>     >    MAINTAINERS: Added eBPF maintainers information.
>     >
>     >   MAINTAINERS                    |   8 +
>     >   configure                      |   8 +-
>     >   docs/devel/ebpf_rss.rst        | 125 ++++++++
>     >   docs/devel/index.rst           |   1 +
>     >   ebpf/ebpf_rss-stub.c           |  40 +++
>     >   ebpf/ebpf_rss.c                | 165 ++++++++++
>     >   ebpf/ebpf_rss.h                |  44 +++
>     >   ebpf/meson.build               |   1 +
>     >   ebpf/rss.bpf.skeleton.h        | 431 +++++++++++++++++++++++++
>     >   ebpf/trace-events              |   4 +
>     >   ebpf/trace.h                   |   2 +
>     >   hw/net/vhost_net.c             |   3 +
>     >   hw/net/virtio-net.c            | 115 ++++++-
>     >   include/hw/virtio/virtio-net.h |   4 +
>     >   include/net/net.h              |   2 +
>     >   meson.build                    |   9 +
>     >   meson_options.txt              |   2 +
>     >   net/tap-bsd.c                  |   5 +
>     >   net/tap-linux.c                |  13 +
>     >   net/tap-linux.h                |   1 +
>     >   net/tap-solaris.c              |   5 +
>     >   net/tap-stub.c                 |   5 +
>     >   net/tap.c                      |   9 +
>     >   net/tap_int.h                  |   1 +
>     >   net/vhost-vdpa.c               |   2 +
>     >   tools/ebpf/Makefile.ebpf       |  22 ++
>     >   tools/ebpf/rss.bpf.c           | 569
>     +++++++++++++++++++++++++++++++++
>     >   27 files changed, 1592 insertions(+), 4 deletions(-)
>     >   create mode 100644 docs/devel/ebpf_rss.rst
>     >   create mode 100644 ebpf/ebpf_rss-stub.c
>     >   create mode 100644 ebpf/ebpf_rss.c
>     >   create mode 100644 ebpf/ebpf_rss.h
>     >   create mode 100644 ebpf/meson.build
>     >   create mode 100644 ebpf/rss.bpf.skeleton.h
>     >   create mode 100644 ebpf/trace-events
>     >   create mode 100644 ebpf/trace.h
>     >   create mode 100755 tools/ebpf/Makefile.ebpf
>     >   create mode 100644 tools/ebpf/rss.bpf.c
>     >
>


