Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15EB73A8387
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 17:02:43 +0200 (CEST)
Received: from localhost ([::1]:46526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltAaQ-0007WB-50
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 11:02:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ltAXn-0005Yg-5d
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 10:59:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ltAXj-0003VM-I1
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 10:59:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623769193;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=RU/Zi2svWGGgJ5s4zxEg1qLZ+b0DsruKFpMkB6sLQ5A=;
 b=EEFyul9bx8Kxt7AzszUN+IGvlG9m2/+inZOAyGgbD542xLsP0GyPPtZof5CN5DNtW5HnSZ
 EWBmhpFbJnvqzfZGuBKikJpA/7Diap0mMY9wjyaU7C1VU7PL89nWw4rqKsX04P0XV24gze
 8p5FU+/K7IFVZ6NerLR/GVFkEjgDBew=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255-tjcNn-4vO3-GgUfp0z8lPA-1; Tue, 15 Jun 2021 10:59:49 -0400
X-MC-Unique: tjcNn-4vO3-GgUfp0z8lPA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C84499F933
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 14:59:48 +0000 (UTC)
Received: from redhat.com (ovpn-115-226.ams2.redhat.com [10.36.115.226])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 04A1E60861;
 Tue, 15 Jun 2021 14:59:47 +0000 (UTC)
Date: Tue, 15 Jun 2021 15:59:44 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 19/26] configure: convert compiler tests to meson, part 1
Message-ID: <YMjAYMEGpegs05Dr@redhat.com>
References: <20210608112301.402434-1-pbonzini@redhat.com>
 <20210608112301.402434-20-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210608112301.402434-20-pbonzini@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 08, 2021 at 01:22:54PM +0200, Paolo Bonzini wrote:
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  configure          | 348 ---------------------------------------------
>  meson.build        |  35 ++++-
>  ui/vnc-auth-sasl.c |   2 +-
>  util/meson.build   |   4 +-
>  4 files changed, 38 insertions(+), 351 deletions(-)

> diff --git a/meson.build b/meson.build
> index 2a19f6c1bd..fe8f64763b 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1055,10 +1055,12 @@ endif
>  
>  # Check whether the glibc provides statx()
>  
> -statx_test = '''
> +gnu_source_prefix = '''
>    #ifndef _GNU_SOURCE
>    #define _GNU_SOURCE
>    #endif
> +'''
> +statx_test = gnu_source_prefix + '''
>    #include <sys/stat.h>
>    int main(void) {
>      struct statx statxbuf;
> @@ -1260,6 +1262,7 @@ config_host_data.set('QEMU_VERSION_MICRO', meson.project_version().split('.')[2]
>  
>  config_host_data.set('HAVE_HOST_BLOCK_DEVICE', have_host_block_device)
>  
> +config_host_data.set('CONFIG_EPOLL', cc.has_header('sys/epoll.h'))

Why add this here rather than with the other CONFIG_ checks ?

>  config_host_data.set('HAVE_BTRFS_H', cc.has_header('linux/btrfs.h'))
>  config_host_data.set('HAVE_DRM_H', cc.has_header('libdrm/drm.h'))
>  config_host_data.set('HAVE_PTY_H', cc.has_header('pty.h'))
> @@ -1267,9 +1270,39 @@ config_host_data.set('HAVE_SYS_DISK_H', cc.has_header('sys/disk.h'))
>  config_host_data.set('HAVE_SYS_IOCCOM_H', cc.has_header('sys/ioccom.h'))
>  config_host_data.set('HAVE_SYS_KCOV_H', cc.has_header('sys/kcov.h'))
>  
> +config_host_data.set('CONFIG_CLOCK_ADJTIME', cc.has_function('clock_adjtime'))
> +config_host_data.set('CONFIG_DUP3', cc.has_function('dup3'))
> +config_host_data.set('CONFIG_FALLOCATE', cc.has_function('fallocate'))
> +config_host_data.set('CONFIG_POSIX_FALLOCATE', cc.has_function('posix_fallocate'))
> +config_host_data.set('CONFIG_PPOLL', cc.has_function('ppoll'))
>  config_host_data.set('CONFIG_PREADV', cc.has_function('preadv', prefix: '#include <sys/uio.h>'))
> +config_host_data.set('CONFIG_SENDFILE', cc.has_function('sendfile'))
> +config_host_data.set('CONFIG_SETNS', cc.has_function('setns') and cc.has_function('unshare'))
> +config_host_data.set('CONFIG_SYNCFS', cc.has_function('syncfs'))
> +config_host_data.set('CONFIG_SYNC_FILE_RANGE', cc.has_function('sync_file_range'))
> +config_host_data.set('CONFIG_TIMERFD', cc.has_function('timerfd_create'))
> +config_host_data.set('HAVE_OPENPTY', cc.has_function('openpty', dependencies: util))
>  config_host_data.set('HAVE_SYSTEM_FUNCTION', cc.has_function('system', prefix: '#include <stdlib.h>'))

This function looks even more out of place

>  
> +config_host_data.set('CONFIG_BYTESWAP_H',
> +                     cc.has_header_symbol('byteswap.h', 'bswap_32'))
> +config_host_data.set('CONFIG_EPOLL_CREATE1',
> +                     cc.has_header_symbol('sys/epoll.h', 'epoll_create1'))

Why not sort next to CONFIG_EPOLL

> +config_host_data.set('CONFIG_FALLOCATE_PUNCH_HOLE',
> +                     cc.has_header_symbol('linux/falloc.h', 'FALLOC_FL_PUNCH_HOLE') and
> +                     cc.has_header_symbol('linux/falloc.h', 'FALLOC_FL_KEEP_SIZE'))
> +config_host_data.set('CONFIG_FALLOCATE_ZERO_RANGE',
> +                     cc.has_header_symbol('linux/falloc.h', 'FALLOC_FL_ZERO_RANGE'))

And next to CONFIG_FALLOCATE ?

> +config_host_data.set('CONFIG_FIEMAP',
> +                     cc.has_header('linux/fiemap.h') and
> +                     cc.has_header_symbol('linux/fs.h', 'FS_IOC_FIEMAP'))
> +config_host_data.set('CONFIG_MACHINE_BSWAP_H',
> +                     cc.has_header_symbol('machine/bswap.h', 'bswap32',
> +                                          prefix: '''#include <sys/endian.h>
> +                                                     #include <sys/types.h>'''))
> +config_host_data.set('CONFIG_PRCTL_PR_SET_TIMERSLACK',
> +                     cc.has_header_symbol('sys/prctl.h', 'PR_SET_TIMERSLACK'))
> +
>  # Some versions of Mac OS X incorrectly define SIZE_MAX
>  config_host_data.set('HAVE_BROKEN_SIZE_MAX', not cc.compiles('''
>      #include <stdint.h>
> diff --git a/ui/vnc-auth-sasl.c b/ui/vnc-auth-sasl.c
> index 47fdae5b21..cf65a0b161 100644
> --- a/ui/vnc-auth-sasl.c
> +++ b/ui/vnc-auth-sasl.c
> @@ -33,7 +33,7 @@
>   * files that use SASL API need to disable -Wdeprecated-declarations.
>   */
>  #ifdef CONFIG_DARWIN
> -#pragma GCC diagnostic ignored "-Wdeprecated-declarations"
> +#pragma GCC diagnostic warning "-Wdeprecated-declarations"

Why this change now ?

>  #endif
>  
>  /* Max amount of data we send/recv for SASL steps to prevent DOS */
> diff --git a/util/meson.build b/util/meson.build
> index 97fad44105..7fe9da60ab 100644
> --- a/util/meson.build
> +++ b/util/meson.build
> @@ -3,7 +3,9 @@ util_ss.add(files('osdep.c', 'cutils.c', 'unicode.c', 'qemu-timer-common.c'))
>  util_ss.add(when: 'CONFIG_ATOMIC64', if_false: files('atomic64.c'))
>  util_ss.add(when: 'CONFIG_POSIX', if_true: files('aio-posix.c'))
>  util_ss.add(when: 'CONFIG_POSIX', if_true: files('fdmon-poll.c'))
> -util_ss.add(when: 'CONFIG_EPOLL_CREATE1', if_true: files('fdmon-epoll.c'))
> +if config_host_data.get('CONFIG_EPOLL_CREATE1')
> +  util_ss.add(files('fdmon-epoll.c'))
> +endif


Why does this need to change  ?

>  util_ss.add(when: ['CONFIG_LINUX_IO_URING', linux_io_uring], if_true: files('fdmon-io_uring.c'))
>  util_ss.add(when: 'CONFIG_POSIX', if_true: files('compatfd.c'))
>  util_ss.add(when: 'CONFIG_POSIX', if_true: files('event_notifier-posix.c'))

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


