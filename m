Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB87D4CE015
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 23:11:10 +0100 (CET)
Received: from localhost ([::1]:33226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQG8k-0000b5-2t
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 17:11:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nQG7r-0008MH-9C
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 17:10:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nQG7o-0006b2-B6
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 17:10:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646431811;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yH5b7SwhEjLnjg+nWHdGJoMF3DjtzpjlgHe1DflS4E8=;
 b=JXOCA4bAVN2hS4YG6Fol4K69E2oAhNnsI2LKXdLrCFCkzu3pDlYX8q8ssjjuBFE0m/x44l
 TOO21ZxBhMI5jghbnf4m6uqcZqjbMrvBsN4U5NTyJJTmhHwBTN0HCJp7O1cWEurJ7G6shr
 v/cL/4SI/dITjyOvxHETBaD/6DDOiM0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-90-Unb8bHjhPByYihOiT9V4tQ-1; Fri, 04 Mar 2022 17:10:09 -0500
X-MC-Unique: Unb8bHjhPByYihOiT9V4tQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0311A801AAD;
 Fri,  4 Mar 2022 22:10:09 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.226])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A1E8B794B5;
 Fri,  4 Mar 2022 22:09:40 +0000 (UTC)
Date: Fri, 4 Mar 2022 16:09:38 -0600
From: Eric Blake <eblake@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH v2 7/8] softmmu: move parsing of -runas, -chroot and
 -daemonize code
Message-ID: <20220304220938.kaif7apy472zx2hy@redhat.com>
References: <20220304185620.3272401-1-berrange@redhat.com>
 <20220304185620.3272401-8-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220304185620.3272401-8-berrange@redhat.com>
User-Agent: NeoMutt/20211029-383-c6e293
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, libvir-list@redhat.com,
 Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 04, 2022 at 06:56:19PM +0000, Daniel P. Berrangé wrote:
> With the future intent to try to move to a fully QAPI driven
> configuration system, we want to have any current command
> parsing well isolated from logic that applies the resulting
> configuration.
> 
> We also don't want os-posix.c to contain code that is specific
> to the system emulators, as this file is linked to other binaries
> too.
> 
> To satisfy these goals, we move parsing of the -runas, -chroot and
> -daemonize code out of the os-posix.c helper code, and pass the
> parsed data into APIs in os-posix.c.
> 
> As a side benefit the 'os_daemonize()' function now lives up to
> its name and will always daemonize, instead of using global state
> to decide to be a no-op sometimes.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  include/sysemu/os-posix.h |   4 +-
>  include/sysemu/os-win32.h |   1 -
>  os-posix.c                | 148 +++++++++++---------------------------
>  os-win32.c                |   9 ---
>  softmmu/vl.c              |  86 ++++++++++++++++++----
>  5 files changed, 117 insertions(+), 131 deletions(-)

> @@ -2780,6 +2811,14 @@ void qemu_init(int argc, char **argv, char **envp)
>      MachineClass *machine_class;
>      bool userconfig = true;
>      FILE *vmstate_dump_file = NULL;
> +    bool daemonize = false;

Given this declaration,...

> +#ifndef WIN32
> +    struct passwd *pwd;
> +    uid_t runas_uid = -1;
> +    gid_t runas_gid = -1;
> +    g_autofree char *runas_name = NULL;
> +    const char *chroot_dir = NULL;
> +#endif /* !WIN32 */
>  
>      qemu_add_opts(&qemu_drive_opts);
>      qemu_add_drive_opts(&qemu_legacy_drive_opts);
> @@ -3661,15 +3700,34 @@ void qemu_init(int argc, char **argv, char **envp)
>              case QEMU_OPTION_nouserconfig:
>                  /* Nothing to be parsed here. Especially, do not error out below. */
>                  break;
> -            default:
> -                if (os_parse_cmd_args(popt->index, optarg)) {
> -                    error_report("Option not supported in this build");
> +#ifndef WIN32
> +            case QEMU_OPTION_runas:
> +                pwd = getpwnam(optarg);
> +                if (pwd) {
> +                    runas_uid = pwd->pw_uid;
> +                    runas_gid = pwd->pw_gid;
> +                    runas_name = g_strdup(pwd->pw_name);
> +                } else if (!os_parse_runas_uid_gid(optarg,
> +                                                   &runas_uid,
> +                                                   &runas_gid)) {
> +                    error_report("User \"%s\" doesn't exist"
> +                                 " (and is not <uid>:<gid>)",
> +                                 optarg);
>                      exit(1);
>                  }
> -                if (is_daemonized()) {
> -                    qemu_log_stdio_disable();
> -                    qemu_chr_stdio_disable();
> -                }
> +                break;
> +            case QEMU_OPTION_chroot:
> +                chroot_dir = optarg;
> +                break;
> +            case QEMU_OPTION_daemonize:
> +                daemonize = 1;

...this should s/1/true/. With that tweak,

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


