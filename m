Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDED1588993
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 11:42:31 +0200 (CEST)
Received: from localhost ([::1]:54512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJAta-0007el-Kj
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 05:42:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oJAfg-00034p-Jm
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 05:28:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oJAfb-0004NI-N4
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 05:28:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659518882;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/wtn5AXEFmlUU70xrLHKpsvkhz8tX8NDYv0AuiKir58=;
 b=EGrYfqZDzzJWnC036RF4uQhSrAZvgzI/Mg6Abru+CnwJEJvfePSPXfQPQcLPOyO5wSGt2M
 khbrdxH9HsuJx6kigw9IQER0hE6tWsGYH6kE00ZUdWFaCxQirUaijfKY//KC2Ez+lMI6MY
 iAECTyQQ0HIEH1jdoQhhFfX7ExsePcQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-593-zfd9nWXiNCOklRQLSZd7kQ-1; Wed, 03 Aug 2022 05:28:01 -0400
X-MC-Unique: zfd9nWXiNCOklRQLSZd7kQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0809E3C01E14;
 Wed,  3 Aug 2022 09:28:01 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.173])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1923E2026D4C;
 Wed,  3 Aug 2022 09:27:59 +0000 (UTC)
Date: Wed, 3 Aug 2022 10:27:57 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: qemu-devel@nongnu.org, Florian Weimer <fweimer@redhat.com>
Cc: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH for 7.1] linux-user: fix compat with glibc >= 2.36
 sys/mount.h
Message-ID: <Yuo/nbb2Gnse0323@redhat.com>
References: <20220802164134.1851910-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220802164134.1851910-1-berrange@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

CC'ing Florian to get the POV of a glibc maintainer on what we've
had to do to work around this compatibility brekage.

On Tue, Aug 02, 2022 at 12:41:34PM -0400, Daniel P. Berrangé wrote:
> The latest glibc 2.36 has extended sys/mount.h so that it
> defines the FSCONFIG_* enum constants. These are historically
> defined in linux/mount.h, and thus if you include both headers
> the compiler complains:
> 
> In file included from /usr/include/linux/fs.h:19,
>                  from ../linux-user/syscall.c:98:
> /usr/include/linux/mount.h:95:6: error: redeclaration of 'enum fsconfig_command'
>    95 | enum fsconfig_command {
>       |      ^~~~~~~~~~~~~~~~
> In file included from ../linux-user/syscall.c:31:
> /usr/include/sys/mount.h:189:6: note: originally defined here
>   189 | enum fsconfig_command
>       |      ^~~~~~~~~~~~~~~~
> /usr/include/linux/mount.h:96:9: error: redeclaration of enumerator 'FSCONFIG_SET_FLAG'
>    96 |         FSCONFIG_SET_FLAG       = 0,    /* Set parameter, supplying no value */
>       |         ^~~~~~~~~~~~~~~~~
> /usr/include/sys/mount.h:191:3: note: previous definition of 'FSCONFIG_SET_FLAG' with type 'enum fsconfig_command'
>   191 |   FSCONFIG_SET_FLAG       = 0,    /* Set parameter, supplying no value */
>       |   ^~~~~~~~~~~~~~~~~
> ...snip...
> 
> QEMU doesn't include linux/mount.h, but it does use
> linux/fs.h and thus gets linux/mount.h indirectly.
> 
> glibc acknowledges this problem but does not appear to
> be intending to fix it in the forseeable future, simply
> documenting it as a known incompatibility with no
> workaround:
> 
>   https://sourceware.org/glibc/wiki/Release/2.36#Usage_of_.3Clinux.2Fmount.h.3E_and_.3Csys.2Fmount.h.3E
>   https://sourceware.org/glibc/wiki/Synchronizing_Headers
> 
> To address this requires either removing use of sys/mount.h
> or linux/fs.h, despite QEMU needing declarations from
> both.
> 
> This patch removes linux/fs.h, meaning we have to define
> various FS_IOC constants that are now unavailable.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  linux-user/syscall.c | 18 ++++++++++++++++++
>  meson.build          |  2 ++
>  2 files changed, 20 insertions(+)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index b27a6552aa..52d178afe7 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -95,7 +95,25 @@
>  #include <linux/soundcard.h>
>  #include <linux/kd.h>
>  #include <linux/mtio.h>
> +
> +#ifdef HAVE_SYS_MOUNT_FSCONFIG
> +/*
> + * glibc >= 2.36 linux/mount.h conflicts with sys/mount.h,
> + * which in turn prevents use of linux/fs.h. So we have to
> + * define the constants ourselves for now.
> + */
> +#define FS_IOC_GETFLAGS                _IOR('f', 1, long)
> +#define FS_IOC_SETFLAGS                _IOW('f', 2, long)
> +#define FS_IOC_GETVERSION              _IOR('v', 1, long)
> +#define FS_IOC_SETVERSION              _IOW('v', 2, long)
> +#define FS_IOC_FIEMAP                  _IOWR('f', 11, struct fiemap)
> +#define FS_IOC32_GETFLAGS              _IOR('f', 1, int)
> +#define FS_IOC32_SETFLAGS              _IOW('f', 2, int)
> +#define FS_IOC32_GETVERSION            _IOR('v', 1, int)
> +#define FS_IOC32_SETVERSION            _IOW('v', 2, int)
> +#else
>  #include <linux/fs.h>
> +#endif
>  #include <linux/fd.h>
>  #if defined(CONFIG_FIEMAP)
>  #include <linux/fiemap.h>
> diff --git a/meson.build b/meson.build
> index 294e9a8f32..30a380752c 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1963,6 +1963,8 @@ config_host_data.set('HAVE_OPTRESET',
>                       cc.has_header_symbol('getopt.h', 'optreset'))
>  config_host_data.set('HAVE_IPPROTO_MPTCP',
>                       cc.has_header_symbol('netinet/in.h', 'IPPROTO_MPTCP'))
> +config_host_data.set('HAVE_SYS_MOUNT_FSCONFIG',
> +                     cc.has_header_symbol('sys/mount.h', 'FSCONFIG_SET_FLAG'))
>  
>  # has_member
>  config_host_data.set('HAVE_SIGEV_NOTIFY_THREAD_ID',
> -- 
> 2.37.1
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


