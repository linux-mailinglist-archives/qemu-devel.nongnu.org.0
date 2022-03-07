Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4C54CF6ED
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 10:43:37 +0100 (CET)
Received: from localhost ([::1]:40768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR9tw-0001mv-8D
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 04:43:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nR9qa-0007Sy-0t
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 04:40:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nR9qT-0007Zy-Ls
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 04:40:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646646000;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y+zHzclCF+KBdFtlbiqIco229vrhyO4TQmz2ouHkG1A=;
 b=KBL0LYfA1Ndx5wQmAVmt/9C/2Yj/8dKkv+Hp+S8xPHNG5KuItHb/eCQ+QOtJkTxnmiBQ7e
 d1iOo5Hxf/ZIETi8WgRxxoQVHEEQWsMK0A6QccWj2pah0dJK/nTVHQKJUZ3Z39MGPSfFyD
 2WKi/TENMtQBTUtif2QM7BFj+tdAkXQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-501-cLvloQo9MueWL8zvCK5WEA-1; Mon, 07 Mar 2022 04:39:57 -0500
X-MC-Unique: cLvloQo9MueWL8zvCK5WEA-1
Received: by mail-wr1-f72.google.com with SMTP id
 w17-20020adfec51000000b001f068bc3342so2096330wrn.6
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 01:39:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=y+zHzclCF+KBdFtlbiqIco229vrhyO4TQmz2ouHkG1A=;
 b=E+O1KOo3cljNzWjeLrTN3rFo7/x170OGLlhwiZ0s3RsrDX5nRs13awyYLSfxiFEExl
 FxWYCa16Q80Q4n7Rg+qy1gzjVMEXogIS/DiB5VNOQwMlcgCaNM/jDx1lNZvdqLkJT0b5
 W/o6vs0rtz0Tuo0y8iOqvAqx4/lY0F0t17IIBR5i9HYEzAI3bruZPdEWqcFWw34dwusR
 MxJunO1X8cYACECBzAhfi2AgDDJeJ+95AfJWk4paNiE53/rr8Av9j4Tx99qib2W+Exh2
 nzX7YeC/1At2aX05j/IMkQscQDjlF3vrr64HZDTPvNhLF+vZ+Z3BK3AQrXiON68pruvd
 Iaww==
X-Gm-Message-State: AOAM531HDAffx+vZnpQBK+1TMOq/hFsqI8rXLJXgHLypYBVLA/LpXIhy
 tUJpUKG0GnmCF4kbiTTpmev/3MBXxfZNSOcNxSvOs7UVaRg0cey5MpbeL8iG2OWAM7ynNJYyLZH
 juQHHaw1RlFPgqgc=
X-Received: by 2002:a5d:4f06:0:b0:1f0:2346:36d9 with SMTP id
 c6-20020a5d4f06000000b001f0234636d9mr7284500wru.144.1646645996474; 
 Mon, 07 Mar 2022 01:39:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxdWpAGLHK/5fP86BoIoYjLNL7sdwsPbRxxYRa+1Ghc7dEKTUHcP/nBFh+CeoqgrHoc8P6MHg==
X-Received: by 2002:a5d:4f06:0:b0:1f0:2346:36d9 with SMTP id
 c6-20020a5d4f06000000b001f0234636d9mr7284466wru.144.1646645996257; 
 Mon, 07 Mar 2022 01:39:56 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 p18-20020adfba92000000b001e4ae791663sm11329312wrg.62.2022.03.07.01.39.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 01:39:55 -0800 (PST)
Message-ID: <17257e9d-1a2b-2c8d-954d-090d262ce079@redhat.com>
Date: Mon, 7 Mar 2022 10:39:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v4 3/4] configure, meson: allow enabling vhost-user on all
 POSIX systems
To: Sergio Lopez <slp@redhat.com>, qemu-devel@nongnu.org
References: <20220304100854.14829-1-slp@redhat.com>
 <20220304100854.14829-4-slp@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220304100854.14829-4-slp@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, John G Johnson <john.g.johnson@oracle.com>,
 kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, vgoyal@redhat.com,
 Eric Farman <farman@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/03/2022 11.08, Sergio Lopez wrote:
> With the possibility of using a pipe pair via qemu_pipe() as a
> replacement on operating systems that doesn't support eventfd,
> vhost-user can also work on all POSIX systems.
> 
> This change allows enabling vhost-user on all non-Windows platforms
> and makes libvhost_user (which still depends on eventfd) a linux-only
> feature.
> 
> Signed-off-by: Sergio Lopez <slp@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   configure   | 4 ++--
>   meson.build | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/configure b/configure
> index c56ed53ee3..daccf4be7c 100755
> --- a/configure
> +++ b/configure
> @@ -1659,8 +1659,8 @@ fi
>   # vhost interdependencies and host support
>   
>   # vhost backends
> -if test "$vhost_user" = "yes" && test "$linux" != "yes"; then
> -  error_exit "vhost-user is only available on Linux"
> +if test "$vhost_user" = "yes" && test "$mingw32" = "yes"; then
> +  error_exit "vhost-user is not available on Windows"
>   fi
>   test "$vhost_vdpa" = "" && vhost_vdpa=$linux
>   if test "$vhost_vdpa" = "yes" && test "$linux" != "yes"; then
> diff --git a/meson.build b/meson.build
> index 8df40bfac4..f2bc439c30 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2701,7 +2701,7 @@ if have_system or have_user
>   endif
>   
>   vhost_user = not_found
> -if 'CONFIG_VHOST_USER' in config_host
> +if targetos == 'linux' and 'CONFIG_VHOST_USER' in config_host
>     libvhost_user = subproject('libvhost-user')
>     vhost_user = libvhost_user.get_variable('vhost_user_dep')
>   endif

Reviewed-by: Thomas Huth <thuth@redhat.com>


