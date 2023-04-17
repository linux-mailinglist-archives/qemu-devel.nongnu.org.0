Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3C96E4330
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 11:06:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poKmz-0004ij-Ql; Mon, 17 Apr 2023 05:04:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1poKmv-0004iT-Tm
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 05:04:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1poKmt-0007gb-WE
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 05:04:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681722278;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dNuxJ6psyQmJsqgOeQpFbqf4bE/thKthiaGrTODBa9s=;
 b=ecPpS9iG8tRkX9jWPmHTXExVyMEmY5Mc9mf2m07lf0ELS2U3VsBZ5wHHqo6Mv86sHFLrIe
 kim9pe4F+CaNRzUKiSNjXLLXxH+IyrumZybfM8qAsHtXn71iiwyHIhzoZdYggIdU7B97Ri
 RKjkzs1Ek6mUa+5RRfjtFd2IgFeco+c=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-352-SaRM-EZdOA6OI5xf33HaBg-1; Mon, 17 Apr 2023 05:04:36 -0400
X-MC-Unique: SaRM-EZdOA6OI5xf33HaBg-1
Received: by mail-wm1-f71.google.com with SMTP id
 p12-20020a05600c468c00b003f0ae59f2e1so2953249wmo.9
 for <qemu-devel@nongnu.org>; Mon, 17 Apr 2023 02:04:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681722275; x=1684314275;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dNuxJ6psyQmJsqgOeQpFbqf4bE/thKthiaGrTODBa9s=;
 b=BemCABcQGNLEAe5dGa5GB27DGL0oy28pUROMpyeCgnMaDK26lCNvlaJsJURohoOr/+
 Y/7m3RWAb+WvgA3AmhseRshyS34iMKO0mYPLAWdvfeR3nBG1cNfrfbn2ezYAdEYIsH+R
 G1GdjIetU7ubHMpjChHA65t0cU8aYYEXJEPPHB7ZuPID//gbL+hxthe31zrV07DjUHca
 i3cFKerTAvpo8JKfdZhPHD5D/NLQiW8qCDLXcrnHoNbYds5z4qecrZW+1B3vYnz4f66O
 qhS5MaPR6YqUXI6PZ8fI7XQ2I/0cKX0RFkzzBzplycIKcfs0li9/n4WC9jxkqdarqssK
 ZkUQ==
X-Gm-Message-State: AAQBX9cC8kpRgwiLgkJRY5sxwdYpwwMwslDuu2p/sekmjSNWQZ/hNhaL
 M0RbyWqWjGvRcxntjIZ5FXDXQQpHBMsZnZ4uCSuO0uoUfDxkXC9KwQe+5s7FkO1uvLvzQi6OeUH
 VHcwk5TTl08IK3g0=
X-Received: by 2002:a7b:c4d0:0:b0:3f1:74bd:bc22 with SMTP id
 g16-20020a7bc4d0000000b003f174bdbc22mr1008842wmk.6.1681722275834; 
 Mon, 17 Apr 2023 02:04:35 -0700 (PDT)
X-Google-Smtp-Source: AKy350aagQWB10ujNHlMkwetAFTFCzNBAIqOzgtgeB/fmEPY+0+A4fs5e5VjNvT5EbSkQaScYwu0rg==
X-Received: by 2002:a7b:c4d0:0:b0:3f1:74bd:bc22 with SMTP id
 g16-20020a7bc4d0000000b003f174bdbc22mr1008827wmk.6.1681722275519; 
 Mon, 17 Apr 2023 02:04:35 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-177-194.web.vodafone.de.
 [109.43.177.194]) by smtp.gmail.com with ESMTPSA id
 u7-20020a7bcb07000000b003ee70225ed2sm11420564wmj.15.2023.04.17.02.04.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Apr 2023 02:04:35 -0700 (PDT)
Message-ID: <3f10f20c-00b9-aae2-1759-346196826699@redhat.com>
Date: Mon, 17 Apr 2023 11:04:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: "you.chen" <you.chen@intel.com>, qemu-devel@nongnu.org
Cc: "dennis . wu" <dennis.wu@intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20230417083935.415782-1-you.chen@intel.com>
 <20230417083935.415782-2-you.chen@intel.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 1/2] migration: add build option to support qemu build
 with qatzip
In-Reply-To: <20230417083935.415782-2-you.chen@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.976, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 17/04/2023 10.39, you.chen wrote:
> In this patch, we added qatzip build option in the meson_options.txt and meson-buildoptons.sh to support qemu build with qatzip.
> If you installed qatzip and would like to use it for live migration, you could use "--enable-qatzip" during configure, it will check qatzip availablility from the pkg-config list (Please make sure you correctly set PKG_CONFIG_PATH to include qatzip.pc).
> If you simply use "configure" or use "configure --disable-qatzip", qatzip will not be enabled.

When neither specifying --disable-qatzip nor --enable-qatzip, the default 
should be auto-detection, not disablement ... or is this too instable to be 
enabled by default?

> Co-developed-by: dennis.wu <dennis.wu@intel.com>
> 
> Signed-off-by: you.chen <you.chen@intel.com>
> ---
>   meson.build                   | 11 ++++++++++-
>   meson_options.txt             |  2 ++
>   scripts/meson-buildoptions.sh |  3 +++
>   3 files changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/meson.build b/meson.build
> index 29f8644d6d..aa7445e29e 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -553,6 +553,13 @@ if have_system or have_tools
>   endif
>   zlib = dependency('zlib', required: true, kwargs: static_kwargs)
>   
> +qatzip = not_found
> +if not get_option('qatzip').auto()

This looks weird - why ignoring the library when the option should be 
auto-detected? I think you likely want something like this instead:

  if not get_option('qatzip').auto() or have_system

... so that the feature gets enabled automatically when system emulator 
binaries are built and the library is available.

> +  qatzip = dependency('qatzip', required: get_option('qatzip'),
> +                         method: 'pkg-config',
> +                         static: enable_static)
> +endif
> +
>   libaio = not_found
>   if not get_option('linux_aio').auto() or have_block
>     libaio = cc.find_library('aio', has_headers: ['libaio.h'],
> @@ -1863,6 +1870,7 @@ config_host_data.set('CONFIG_LIBISCSI', libiscsi.found())
>   config_host_data.set('CONFIG_LIBNFS', libnfs.found())
>   config_host_data.set('CONFIG_LIBSSH', libssh.found())
>   config_host_data.set('CONFIG_LINUX_AIO', libaio.found())
> +config_host_data.set('CONFIG_QATZIP', qatzip.found())
>   config_host_data.set('CONFIG_LINUX_IO_URING', linux_io_uring.found())
>   config_host_data.set('CONFIG_LIBPMEM', libpmem.found())
>   config_host_data.set('CONFIG_NUMA', numa.found())
> @@ -3339,7 +3347,7 @@ libmigration = static_library('migration', sources: migration_files + genh,
>                                 name_suffix: 'fa',
>                                 build_by_default: false)
>   migration = declare_dependency(link_with: libmigration,
> -                               dependencies: [zlib, qom, io])
> +                               dependencies: [qatzip, zlib, qom, io])

Not sure whether this is the right place to add this ... can't you add the 
dependency in the migration/meson.build file instead?

>   softmmu_ss.add(migration)
>   
>   block_ss = block_ss.apply(config_host, strict: false)
> @@ -3986,6 +3994,7 @@ summary_info += {'vde support':       vde}
>   summary_info += {'netmap support':    have_netmap}
>   summary_info += {'l2tpv3 support':    have_l2tpv3}
>   summary_info += {'Linux AIO support': libaio}
> +summary_info += {'qatzip compress support': qatzip}

Could you please keep this closer to the other compression options in the 
summary instead? (lzo, bzip2, zstd, ...)

>   summary_info += {'Linux io_uring support': linux_io_uring}
>   summary_info += {'ATTR/XATTR support': libattr}
>   summary_info += {'RDMA support':      rdma}
> diff --git a/meson_options.txt b/meson_options.txt
> index fc9447d267..ef6d639876 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -191,6 +191,8 @@ option('smartcard', type : 'feature', value : 'auto',
>          description: 'CA smartcard emulation support')
>   option('snappy', type : 'feature', value : 'auto',
>          description: 'snappy compression support')
> +option('qatzip', type : 'feature', value : 'auto',
> +       description: 'qatzip compress support')
>   option('spice', type : 'feature', value : 'auto',
>          description: 'Spice server support')
>   option('spice_protocol', type : 'feature', value : 'auto',
> diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
> index 009fab1515..84d110197d 100644
> --- a/scripts/meson-buildoptions.sh
> +++ b/scripts/meson-buildoptions.sh
> @@ -152,6 +152,7 @@ meson_options_help() {
>     printf "%s\n" '  slirp-smbd      use smbd (at path --smbd=*) in slirp networking'
>     printf "%s\n" '  smartcard       CA smartcard emulation support'
>     printf "%s\n" '  snappy          snappy compression support'
> +  printf "%s\n" '  qatzip          qatzip compression support'
>     printf "%s\n" '  sndio           sndio sound support'
>     printf "%s\n" '  sparse          sparse checker'
>     printf "%s\n" '  spice           Spice server support'
> @@ -332,6 +333,8 @@ _meson_option_parse() {
>       --disable-libvduse) printf "%s" -Dlibvduse=disabled ;;
>       --enable-linux-aio) printf "%s" -Dlinux_aio=enabled ;;
>       --disable-linux-aio) printf "%s" -Dlinux_aio=disabled ;;
> +    --enable-qatzip) printf "%s" -Dqatzip=enabled ;;
> +    --disable-qatzip) printf "%s" -Dqatzip=disabled ;;

The placement here looks rather random ... Could you please run 
scripts/meson-buildoptions.py to create this file instead?

>       --enable-linux-io-uring) printf "%s" -Dlinux_io_uring=enabled ;;
>       --disable-linux-io-uring) printf "%s" -Dlinux_io_uring=disabled ;;
>       --enable-live-block-migration) printf "%s" -Dlive_block_migration=enabled ;;

  Thomas


