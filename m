Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1623AE4B7
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 10:23:46 +0200 (CEST)
Received: from localhost ([::1]:46090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvFDd-000750-P8
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 04:23:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lvFCj-0005iY-6O
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 04:22:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lvFCh-0003qy-3I
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 04:22:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624263766;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c6r3bQE3FaMWlfJ6OkwL4WJIWL5utBBDoI8UAoHDB1U=;
 b=VLO8TlpL8f+StSq7r0uXQ/cIhDDjKdZEnucBSx1qNHCqlnpcnmoOYrvWyNN1fQ85LvmPUV
 2Tyh4eWhqtqqJSdhHbUeCX/vNxRNRoC/auqANRa3hg8TokKugUIsqh+m+peUXS5tBs08XB
 4bTJh4PojIXBt8QBZDb2fqfaqbwZ+7g=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-rBeRxZM9Pkmi1P12ODz4pQ-1; Mon, 21 Jun 2021 04:22:43 -0400
X-MC-Unique: rBeRxZM9Pkmi1P12ODz4pQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 l13-20020adfe9cd0000b0290119a0645c8fso8139724wrn.8
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 01:22:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=c6r3bQE3FaMWlfJ6OkwL4WJIWL5utBBDoI8UAoHDB1U=;
 b=D5QuR8/aymNMVdw/nV3wfRpC8VeuFRcJ9SrbUh0xTvOsc5LxLOa+RqIPtDcgvOWOR+
 TxJnAfItUYLd4w8Wvm6+6UXlaE/rerTKkpgyql1l8ZIkuc+9WddS8uEsZv+cl3oVbpeZ
 rxzQV/S5bRTa+fuURDT6vF2lKKni2CJjN4Z+peJwwcQWqd5zMbyMZ13KbZdr5WW3elfL
 VEeL2WJIRaGwOpx5VnAZIW4Eppzr9FCTkqOhqueIHt1HwMQSV8c0KvK9GecuSfawaAu9
 IsRhd0xOn/VFRfGKfu8z5o3EG9oEnDt8/pfbZeMaAsATXoc7ST+n1MwZlRJ1ONdGZVxE
 Xk7Q==
X-Gm-Message-State: AOAM533CzLV9ClLJACGgBZWdaip/qMEDPofbudQgb+NkkjDn6zvq8X4y
 o9yauH05wwwx0gR9a6uMFYyxrHHeYmMn7ytmsy11Otu7GY+K/memSV+whra7H8AQkrGyOLF6xwD
 IeA5y0vOThVGSSLg=
X-Received: by 2002:a05:600c:2512:: with SMTP id
 d18mr9932999wma.85.1624263762335; 
 Mon, 21 Jun 2021 01:22:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzpauHf8ajrwwZYGCzHPoK3j1mu5CI2rWIq3j1Ynj/4jfCMQhKvqzKXX6GeGJJ9rDfQQUzM0A==
X-Received: by 2002:a05:600c:2512:: with SMTP id
 d18mr9932982wma.85.1624263762102; 
 Mon, 21 Jun 2021 01:22:42 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id x1sm15156812wmc.31.2021.06.21.01.22.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 01:22:41 -0700 (PDT)
Subject: Re: [PATCH RFC] meson: add option to use zstd for qcow2 compression
 by default
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210617195128.66675-1-vsementsov@virtuozzo.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <8d3711a0-2716-3bc5-3710-990042e16c0b@redhat.com>
Date: Mon, 21 Jun 2021 10:22:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210617195128.66675-1-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.299,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, den@openvz.org, qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/06/21 21:51, Vladimir Sementsov-Ogievskiy wrote:
> So, it's an RFC. I also can split the patch so that refactoring of
> qcow2_co_create() go in a separate preparation patch.
> 
> Another RFC question, shouldn't we move to zstd by default in upstream
> too?

I think backwards-incompatible changes in the past were not handled with 
build options, but that can be changed.

However I would prefer to have an option like 
--with-qcow2-compression={zstd,zlib}.  Meson supports multiple-choice 
options, they don't have to use enabled/disabled or (if boolean) true/false.

Regarding changing the default, that would make images unreadable to 
QEMU 5.0 and earlier versions.  Does that apply to images that have no 
compressed clusters?

Paolo

>   configure         | 10 +++++++++-
>   meson.build       |  4 ++++
>   block/qcow2.c     | 32 +++++++++++++++++++++++++-------
>   meson_options.txt |  2 ++
>   4 files changed, 40 insertions(+), 8 deletions(-)
> 
> diff --git a/configure b/configure
> index debd50c085..b19af43525 100755
> --- a/configure
> +++ b/configure
> @@ -385,6 +385,7 @@ snappy="auto"
>   bzip2="auto"
>   lzfse="auto"
>   zstd="auto"
> +qcow2_zstd_default="no"
>   guest_agent="$default_feature"
>   guest_agent_with_vss="no"
>   guest_agent_ntddscsi="no"
> @@ -1318,6 +1319,10 @@ for opt do
>     ;;
>     --enable-zstd) zstd="enabled"
>     ;;
> +  --disable-qcow2-zstd-default) qcow2_zstd_default="disabled"
> +  ;;
> +  --enable-qcow2-zstd-default) qcow2_zstd_default="enabled"
> +  ;;
>     --enable-guest-agent) guest_agent="yes"
>     ;;
>     --disable-guest-agent) guest_agent="no"
> @@ -1903,6 +1908,8 @@ disabled with --disable-FEATURE, default is enabled if available
>                     (for reading lzfse-compressed dmg images)
>     zstd            support for zstd compression library
>                     (for migration compression and qcow2 cluster compression)
> +  qcow2-zstd-default  Use zstd by default for qcow2 image creation
> +                  (requires zstd enabled)
>     seccomp         seccomp support
>     coroutine-pool  coroutine freelist (better performance)
>     glusterfs       GlusterFS backend
> @@ -6424,7 +6431,8 @@ if test "$skip_meson" = no; then
>           -Dcurl=$curl -Dglusterfs=$glusterfs -Dbzip2=$bzip2 -Dlibiscsi=$libiscsi \
>           -Dlibnfs=$libnfs -Diconv=$iconv -Dcurses=$curses -Dlibudev=$libudev\
>           -Drbd=$rbd -Dlzo=$lzo -Dsnappy=$snappy -Dlzfse=$lzfse \
> -        -Dzstd=$zstd -Dseccomp=$seccomp -Dvirtfs=$virtfs -Dcap_ng=$cap_ng \
> +        -Dzstd=$zstd -Dqcow2_zstd_default=$qcow2_zstd_default \
> +        -Dseccomp=$seccomp -Dvirtfs=$virtfs -Dcap_ng=$cap_ng \
>           -Dattr=$attr -Ddefault_devices=$default_devices \
>           -Ddocs=$docs -Dsphinx_build=$sphinx_build -Dinstall_blobs=$blobs \
>           -Dvhost_user_blk_server=$vhost_user_blk_server -Dmultiprocess=$multiprocess \
> diff --git a/meson.build b/meson.build
> index d8a92666fb..3d65b6c46b 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -484,6 +484,9 @@ if not get_option('zstd').auto() or have_block
>                       required: get_option('zstd'),
>                       method: 'pkg-config', kwargs: static_kwargs)
>   endif
> +if not zstd.found() and get_option('qcow2_zstd_default').enabled()
> +  error('--enable-qcow2-zstd-default: Cannot use zstd by default without enabling zstd')
> +endif
>   gbm = not_found
>   if 'CONFIG_GBM' in config_host
>     gbm = declare_dependency(compile_args: config_host['GBM_CFLAGS'].split(),
> @@ -1168,6 +1171,7 @@ config_host_data.set('CONFIG_GETTID', has_gettid)
>   config_host_data.set('CONFIG_MALLOC_TRIM', has_malloc_trim)
>   config_host_data.set('CONFIG_STATX', has_statx)
>   config_host_data.set('CONFIG_ZSTD', zstd.found())
> +config_host_data.set('CONFIG_QCOW2_ZSTD_DEFAULT', get_option('qcow2_zstd_default').enabled())
>   config_host_data.set('CONFIG_FUSE', fuse.found())
>   config_host_data.set('CONFIG_FUSE_LSEEK', fuse_lseek.found())
>   config_host_data.set('CONFIG_X11', x11.found())
> diff --git a/block/qcow2.c b/block/qcow2.c
> index ee4530cdbd..06bfbbf7b8 100644
> --- a/block/qcow2.c
> +++ b/block/qcow2.c
> @@ -3540,17 +3540,36 @@ qcow2_co_create(BlockdevCreateOptions *create_options, Error **errp)
>           }
>       }
>   
> -    if (qcow2_opts->has_compression_type &&
> -        qcow2_opts->compression_type != QCOW2_COMPRESSION_TYPE_ZLIB) {
> -
> -        ret = -EINVAL;
> -
> -        if (version < 3) {
> +    if (version < 3) {
> +        if (qcow2_opts->has_compression_type &&
> +            qcow2_opts->compression_type != QCOW2_COMPRESSION_TYPE_ZLIB)
> +        {
> +            ret = -EINVAL;
>               error_setg(errp, "Non-zlib compression type is only supported with "
>                          "compatibility level 1.1 and above (use version=v3 or "
>                          "greater)");
>               goto out;
>           }
> +    } else {
> +        if (qcow2_opts->has_compression_type) {
> +            compression_type = qcow2_opts->compression_type;
> +#ifdef CONFIG_QCOW2_ZSTD_DEFAULT
> +        } else {
> +            compression_type = QCOW2_COMPRESSION_TYPE_ZSTD;
> +#endif
> +        }
> +
> +#ifndef CONFIG_ZSTD
> +        assert(compression_type == QCOW2_COMPRESSION_TYPE_ZLIB);
> +#endif
> +    }
> +
> +    if (qcow2_opts->has_compression_type &&
> +        qcow2_opts->compression_type != QCOW2_COMPRESSION_TYPE_ZLIB) {
> +
> +        ret = -EINVAL;
> +
> +        compression_type = qcow2_opts->compression_type;
>   
>           switch (qcow2_opts->compression_type) {
>   #ifdef CONFIG_ZSTD
> @@ -3562,7 +3581,6 @@ qcow2_co_create(BlockdevCreateOptions *create_options, Error **errp)
>               goto out;
>           }
>   
> -        compression_type = qcow2_opts->compression_type;
>       }
>   
>       /* Create BlockBackend to write to the image */
> diff --git a/meson_options.txt b/meson_options.txt
> index 3d304cac96..8af9bb97f5 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -108,6 +108,8 @@ option('xkbcommon', type : 'feature', value : 'auto',
>          description: 'xkbcommon support')
>   option('zstd', type : 'feature', value : 'auto',
>          description: 'zstd compression support')
> +option('qcow2_zstd_default', type : 'feature', value : 'disabled',
> +       description: 'Use zstd compression type for qcow2 image creation by default')
>   option('fuse', type: 'feature', value: 'auto',
>          description: 'FUSE block device export')
>   option('fuse_lseek', type : 'feature', value : 'auto',
> 


