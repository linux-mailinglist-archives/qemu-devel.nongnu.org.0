Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83ED4508405
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 10:49:51 +0200 (CEST)
Received: from localhost ([::1]:44072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nh622-0001xn-DP
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 04:49:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nh5mZ-0004xZ-QZ
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 04:33:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nh5mT-0005F9-S9
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 04:33:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650443623;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+oh91KWO6IxgYG5eYRjSGBGAYEYXa8VOrMzvr3D3DZc=;
 b=LSq98Bq9kf78ZwwmGieWLCeTruM/Ip9anWGqs1oHQMDGZOHvJsuj1bcdBkuqU1drSWyHba
 96Gi0HQQ3MDyADIE8joPhXsMJy+UrEKin8Rm0l2OoUOg8coI6Eg8A4NJTF+x2S3j157WX9
 H+vh/aB96gP6cv0wLNtm84oyKNe5lrs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-529-HBtIKwvOPXO5u81WxY-_Dw-1; Wed, 20 Apr 2022 04:33:42 -0400
X-MC-Unique: HBtIKwvOPXO5u81WxY-_Dw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0249180005D;
 Wed, 20 Apr 2022 08:33:42 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 16DA01454543;
 Wed, 20 Apr 2022 08:33:40 +0000 (UTC)
Date: Wed, 20 Apr 2022 09:33:38 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Dirk =?utf-8?Q?M=C3=BCller?= <dmueller@suse.de>
Subject: Re: [PATCH] Only advertise aio=io_uring if support is actually
 available
Message-ID: <Yl/FYrWfjAOeIl94@redhat.com>
References: <20220419171931.26192-1-dmueller@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220419171931.26192-1-dmueller@suse.de>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: eblake@redhat.com, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 19, 2022 at 07:19:31PM +0200, Dirk Müller wrote:
> This allows $qemu --help runtime configure checks for detecting
> the host support.

Note: detecting features by parsing --help output is something that
is explicitly a non-goal for QEMU. The only supported interface for
detecting features is QMP. We can't actively prevent people writing
code that parses --help, but if such parsing breaks on arrival of
new QEMU releases that is not considered a bug on the QEMU side.

That all said, the patch itself is OK, because for human targetted
interactive usage, it is desirable for --help to be representative
of what's available.

IOW, I'm just complaining about the commit message justification
here & warning against writing tools to use --help :-)

> Signed-off-by: Dirk Müller <dmueller@suse.de>
> ---
>  block/file-posix.c | 4 ++++
>  qemu-nbd.c         | 4 ++++
>  qemu-options.hx    | 6 +++++-
>  3 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/block/file-posix.c b/block/file-posix.c
> index 39a3d6dbe6..aec4763862 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -544,7 +544,11 @@ static QemuOptsList raw_runtime_opts = {
>          {
>              .name = "aio",
>              .type = QEMU_OPT_STRING,
> +#ifdef CONFIG_LINUX_IO_URING
>              .help = "host AIO implementation (threads, native, io_uring)",
> +#else
> +            .help = "host AIO implementation (threads, native)",
> +#endif

If we're going to conditionalize this, then we really ought to be
address it fully, because 'native' is also platform specific.

IOW, we would end up needing something more like this:

           .help = "host AIO implementation (threads"
 #if defined(WIN32) || defined(CONFIG_LINUX_AIO)
                   ", native"
 #endif
 #if defined(CONFIG_LINUX_IO_URING)
                   ", io_uring"
 #else
                   "),"

admittedly pretty ugly

>          },
>          {
>              .name = "aio-max-batch",
> diff --git a/qemu-nbd.c b/qemu-nbd.c
> index 713e7557a9..4634a0fc42 100644
> --- a/qemu-nbd.c
> +++ b/qemu-nbd.c
> @@ -147,7 +147,11 @@ static void usage(const char *name)
>  "      --cache=MODE          set cache mode used to access the disk image, the\n"
>  "                            valid options are: 'none', 'writeback' (default),\n"
>  "                            'writethrough', 'directsync' and 'unsafe'\n"
> +#ifdef CONFIG_LINUX_IO_URING
>  "      --aio=MODE            set AIO mode (native, io_uring or threads)\n"
> +#else
> +"      --aio=MODE            set AIO mode (native or threads)\n"
> +#endif
>  "      --discard=MODE        set discard mode (ignore, unmap)\n"
>  "      --detect-zeroes=MODE  set detect-zeroes mode (off, on, unmap)\n"
>  "      --image-opts          treat FILE as a full set of image options\n"
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 34e9b32a5c..973125cfca 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -1338,7 +1338,11 @@ DEF("drive", HAS_ARG, QEMU_OPTION_drive,
>      "       [,cache=writethrough|writeback|none|directsync|unsafe][,format=f]\n"
>      "       [,snapshot=on|off][,rerror=ignore|stop|report]\n"
>      "       [,werror=ignore|stop|report|enospc][,id=name]\n"
> -    "       [,aio=threads|native|io_uring]\n"
> +    "       [,aio=threads|native"
> +#if defined(CONFIG_LINUX_IO_URING)
> +    "|io_uring"
> +#endif
> +    "]\n"
>      "       [,readonly=on|off][,copy-on-read=on|off]\n"
>      "       [,discard=ignore|unmap][,detect-zeroes=on|off|unmap]\n"
>      "       [[,bps=b]|[[,bps_rd=r][,bps_wr=w]]]\n"
> -- 
> 2.35.3
> 
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


