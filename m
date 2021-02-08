Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A29431398A
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 17:34:18 +0100 (CET)
Received: from localhost ([::1]:53388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l99UP-0000vO-9y
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 11:34:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l93BM-0001qt-36
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 04:50:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l93B9-0002Vo-JU
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 04:50:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612777793;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=VGE0BjLZ2tpZuvI7TIr2VOwFPtj1NyVH7Q/nkmXaELU=;
 b=CfICczYX+fW1YPyanup0h6URnXc6ljVQOWYw9VwhAwXSXfamK9+SfvMoWmTZvSLHzMP6a+
 BudiQJygnjHfoybozSgFsoiplzROx7P7AILWdQDFlbshgPDyRphLBXexczJvvVV9kRhv9E
 8d90v9tTA0BlkQ+GLZ7vbNYRaTiAals=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-igv6CcTVPKqcRH-StuL0wA-1; Mon, 08 Feb 2021 04:49:43 -0500
X-MC-Unique: igv6CcTVPKqcRH-StuL0wA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DC0A1801962;
 Mon,  8 Feb 2021 09:49:41 +0000 (UTC)
Received: from redhat.com (ovpn-115-97.ams2.redhat.com [10.36.115.97])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C70B65D9E2;
 Mon,  8 Feb 2021 09:49:36 +0000 (UTC)
Date: Mon, 8 Feb 2021 09:49:33 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Andrew Melnychenko <andrew@daynix.com>
Subject: Re: [RFC PATCH v4 4/7] ebpf: Added eBPF RSS loader.
Message-ID: <20210208094907.GB1141037@redhat.com>
References: <20210204170951.91805-1-andrew@daynix.com>
 <20210204170951.91805-5-andrew@daynix.com>
MIME-Version: 1.0
In-Reply-To: <20210204170951.91805-5-andrew@daynix.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: mst@redhat.com, jasowang@redhat.com, qemu-devel@nongnu.org,
 yuri.benditovich@daynix.com, yan@daynix.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 04, 2021 at 07:09:48PM +0200, Andrew Melnychenko wrote:
> From: Andrew <andrew@daynix.com>
> 
> Added function that loads RSS eBPF program.
> Added stub functions for RSS eBPF loader.
> Added meson and configuration options.
> 
> By default, eBPF feature enabled if libbpf is present in the build system.
> libbpf checked in configuration shell script and meson script.
> 
> Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
> Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
> ---
>  configure               |  30 +++
>  ebpf/ebpf_rss-stub.c    |  40 ++++
>  ebpf/ebpf_rss.c         | 165 +++++++++++++++++
>  ebpf/ebpf_rss.h         |  44 +++++
>  ebpf/meson.build        |   1 +
>  ebpf/rss.bpf.skeleton.h | 397 ++++++++++++++++++++++++++++++++++++++++
>  ebpf/trace-events       |   4 +
>  ebpf/trace.h            |   2 +
>  meson.build             |  13 ++
>  9 files changed, 696 insertions(+)
>  create mode 100644 ebpf/ebpf_rss-stub.c
>  create mode 100644 ebpf/ebpf_rss.c
>  create mode 100644 ebpf/ebpf_rss.h
>  create mode 100644 ebpf/meson.build
>  create mode 100644 ebpf/rss.bpf.skeleton.h
>  create mode 100644 ebpf/trace-events
>  create mode 100644 ebpf/trace.h

When adding a new build dependancy we need to update the dockerfiles
in tests/docker/dockerfiles to add the required development package
on all the distros that have it available currently. It is in Fedora
at least, but have not checked other distros.

> 
> diff --git a/configure b/configure
> index e85d6baf8f..38797e0116 100755
> --- a/configure
> +++ b/configure

> +##########################################
> +# check for usable bpf system call
> +if test "$bpf" = ""; then
> +    have_bpf=no
> +    if test "$linux" = "yes" -a "$bigendian" != "yes"; then
> +        cat > $TMPC << EOF
> +    #include <stdlib.h>
> +    #include <bpf/libbpf.h>
> +    int main(void) {
> +        struct bpf_object *obj = NULL;
> +        bpf_object__load(obj);
> +        exit(0);
> +    }
> +EOF
> +        if compile_prog "" "-lbpf" ; then
> +            have_bpf=yes
> +            bpf=yes
> +        fi
> +    fi
> +fi

libbpf provides a pkg-config file, so it should be probed using
pkg-config in meson.build. CC'ing Paolo to confirm.


> diff --git a/meson.build b/meson.build
> index 2d8b433ff0..9a24020bc3 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -995,6 +995,13 @@ if not get_option('fuse_lseek').disabled()
>    endif
>  endif
>  
> +# libbpf
> +libbpf = not_found
> +if 'CONFIG_EBPF' in config_host
> +  libbpf = cc.find_library('bpf', required: true)
> +
> +endif

This is where you need todo the pkg-config search using 'dependency()'
instead of 'find_library'.

> +
>  if get_option('cfi')
>    cfi_flags=[]
>    # Check for dependency on LTO
> @@ -1748,6 +1755,7 @@ if have_system
>      'backends',
>      'backends/tpm',
>      'chardev',
> +    'ebpf',
>      'hw/9pfs',
>      'hw/acpi',
>      'hw/adc',
> @@ -1914,6 +1922,9 @@ subdir('accel')
>  subdir('plugins')
>  subdir('bsd-user')
>  subdir('linux-user')
> +subdir('ebpf')
> +
> +common_ss.add(libbpf)
>  
>  bsd_user_ss.add(files('gdbstub.c'))
>  specific_ss.add_all(when: 'CONFIG_BSD_USER', if_true: bsd_user_ss)
> @@ -2592,6 +2603,7 @@ summary_info += {'RDMA support':      config_host.has_key('CONFIG_RDMA')}
>  summary_info += {'PVRDMA support':    config_host.has_key('CONFIG_PVRDMA')}
>  summary_info += {'fdt support':       fdt_opt == 'disabled' ? false : fdt_opt}
>  summary_info += {'libcap-ng support': libcap_ng.found()}
> +summary_info += {'bpf support': config_host.has_key('CONFIG_EBPF')}
>  # TODO: add back protocol and server version
>  summary_info += {'spice support':     config_host.has_key('CONFIG_SPICE')}
>  summary_info += {'rbd support':       rbd.found()}
> @@ -2653,3 +2665,4 @@ if not supported_oses.contains(targetos)
>    message('if you care about QEMU on this platform you should contact')
>    message('us upstream at qemu-devel@nongnu.org.')
>  endif
> +
> -- 
> 2.30.0
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


