Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A342D4F38
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 01:11:41 +0100 (CET)
Received: from localhost ([::1]:38806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn9XW-00031e-8K
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 19:10:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kn9VS-0002aD-QV
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 19:08:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kn9VP-0004Ul-Nl
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 19:08:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607558902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oO6FYUm6Ud1afXDPaPXXM6tKB/GWdCUBTneC+/Mmhek=;
 b=iuQ+1+DfeY5dAEN5/OOAB9GCDKM+fjYVc+hEbXZ/BKGhK5ITsORtRsNVFGoZ0PvDhsA3Gu
 b2dL+hsq12RKVukBgvtS+vuLPLr/rpmi3MQUcMHklDxKe1yQhmYUpd+B9iuHEpwDzx6QTD
 de1RjZCzJrsUaX06+df/iuZkZB9syZs=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-100-tUCGogsuNHuBsHnkCwJvcg-1; Wed, 09 Dec 2020 19:08:20 -0500
X-MC-Unique: tUCGogsuNHuBsHnkCwJvcg-1
Received: by mail-ej1-f71.google.com with SMTP id m11so1038645ejr.20
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 16:08:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oO6FYUm6Ud1afXDPaPXXM6tKB/GWdCUBTneC+/Mmhek=;
 b=fNJxm5imxcVhUVVJ8uIpnVwq2gi6+Bc3cRRuKbZlThxUW/Z09WnssweVZA/6AmJBEA
 9tc3MhViIuUpqo1NwsFcm46xs856Jth3PxbE9aVeh4BuMYZeiqcxUz6GlEjHNVVhbkqZ
 mUjJvVUEsF7GtYr/aYhTsueAu5EhhYZoZ8eond20Y/zQxEa4KXAbaFeu7O4nhTKdNj+9
 T7jAceFHmQp9FoJEVKpRYQ8GRVjlaZXWpBhAvJsdxRu0+p5mfWtS/eEuAbvxAQJnMfgf
 dSg5HCB3qxhEsrf7IzcuVy0CEPJ/mc0vwquPdKclYUJRqDHiLzV5IDP3LnVS4eXx8niH
 86Uw==
X-Gm-Message-State: AOAM531vIhcpFgRmlrHvXdQxSrPkrnLg9gRzgvTY9kMtz0t3zcAz1x55
 hwub9yQTSJL/fAT/Su0FJmq5bs36PLjAuTBzURIKtqVtmOLGa4gK3eMB7qeL7RJ2aM9OpG05DHL
 hELaaOD2pQ78Y9Ps=
X-Received: by 2002:a50:8e0e:: with SMTP id 14mr4190758edw.171.1607558899160; 
 Wed, 09 Dec 2020 16:08:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyIFoju34Kz4zsPXwjyCIDCGuhMCIxpSlQrcvq/B0SZ0We6JOzA8/fIlLSSJeYPzkFJwZdc/A==
X-Received: by 2002:a50:8e0e:: with SMTP id 14mr4190739edw.171.1607558898969; 
 Wed, 09 Dec 2020 16:08:18 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:48f9:bea:a04c:3dfe?
 ([2001:b07:6468:f312:48f9:bea:a04c:3dfe])
 by smtp.gmail.com with ESMTPSA id r24sm3100692edc.21.2020.12.09.16.08.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Dec 2020 16:08:18 -0800 (PST)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20201209170059.20742-1-alex.bennee@linaro.org>
 <20201209170059.20742-4-alex.bennee@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v1 3/6] configure: add --without-default-features
Message-ID: <3605142c-6815-b2a1-1008-69bd791d6a6d@redhat.com>
Date: Thu, 10 Dec 2020 01:08:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201209170059.20742-4-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: fam@euphon.net, berrange@redhat.com, stefanb@linux.vnet.ibm.com,
 richard.henderson@linaro.org, f4bug@amsat.org, cota@braap.org,
 stefanha@redhat.com, marcandre.lureau@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/12/20 18:00, Alex Bennée wrote:
> By default QEMU enables a lot of features if it can probe and find the
> support libraries. It also enables a bunch of features by default.
> This patch adds the ability to build --without-default-features which
> can be paired with a --without-default-devices for a barely functional
> build.
> 
> The main use case for this is testing our build assumptions and for
> minimising the amount of stuff you build if you just want to test a
> particular feature on your relatively slow emulated test system.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   configure | 159 ++++++++++++++++++++++++++++++------------------------
>   1 file changed, 88 insertions(+), 71 deletions(-)
> 
> diff --git a/configure b/configure
> index 8f2095a2db..a08e6c96e0 100755
> --- a/configure
> +++ b/configure
> @@ -291,10 +291,24 @@ unset target_list_exclude
>   #
>   # Always add --enable-foo and --disable-foo command line args.
>   # Distributions want to ensure that several features are compiled in, and it
> -# is impossible without a --enable-foo that exits if a feature is not found.
> +# is impossible without a --enable-foo that exits if a feature is not
> +# found.
>   
> -brlapi=""
> -curl=""
> +default_feature=""
> +default_yes_feature="yes"
> +# parse CC options second
> +for opt do
> +  optarg=$(expr "x$opt" : 'x[^=]*=\(.*\)')
> +  case "$opt" in
> +      --without-default-features)
> +          default_feature="no"
> +          default_yes_feature="no"

default_yes_features can be replaced with ${default_feature:-yes} if you 
wish.

> +  ;;
> +  esac
> +done

Since Meson has equivalent functionality to --without-default-features, 
you also want to add -Dauto_features=disabled to the meson command line.

Also, the gettext feature is true/false/empty rather than yes/no, so 
it's not being adjusted.  I suggest you change it (in meson_options.txt) 
from "boolean" to "feature" (auto/enabled/disabled) and move the 
detection code from configure to po/meson.build.  It should be as simple as

-if get_option('gettext')
+if find_program('xgettext', required: get_option('gettext')).found()

and then it will also get the functionality from -Dauto_features.

Paolo

> @@ -453,7 +467,7 @@ gettext=""
>   bogus_os="no"
>   malloc_trim="auto"
>   
> -# parse CC options first
> +# parse CC options second
>   for opt do
>     optarg=$(expr "x$opt" : 'x[^=]*=\(.*\)')
>     case "$opt" in
> @@ -796,7 +810,7 @@ Linux)
>     audio_possible_drivers="oss alsa sdl pa"
>     linux="yes"
>     linux_user="yes"
> -  vhost_user="yes"
> +  vhost_user="$default_yes_feature"
>   ;;
>   esac
>   
> @@ -940,6 +954,8 @@ for opt do
>     ;;
>     --without-default-devices) default_devices="no"
>     ;;
> +  --without-default-features) # processed above
> +  ;;
>     --enable-gprof) gprof="yes"
>     ;;
>     --enable-gcov) gcov="yes"
> @@ -1737,7 +1753,8 @@ Advanced options (experts only):
>     --gdb=GDB-path           gdb to use for gdbstub tests [$gdb_bin]
>   
>   Optional features, enabled with --enable-FEATURE and
> -disabled with --disable-FEATURE, default is enabled if available:
> +disabled with --disable-FEATURE, default is enabled if available
> +(unless built with --without-default-features):
>   
>     system          all system emulation targets
>     user            supported user emulation targets
> 


