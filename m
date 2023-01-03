Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2AA65C1A0
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 15:15:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCi3k-0003te-Hd; Tue, 03 Jan 2023 09:14:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pCi3i-0003sf-LS
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 09:14:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pCi3g-00050k-Vs
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 09:14:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672755267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B4bhdZHk1eflwG6L+HnTUT+S8MMzv/dpXWqPG6XnyiM=;
 b=PSSVzFVb2n9mzjdqchhF1e8R87yF6jgyaKYrddrRKJkuE6Hik5ISwg/zvG7HBsEf9zTZLn
 MFUD2Pm+JJMylsMkAPHqHs4aU/36ouBbeV7hQab5j7tF5ApvLJT/3P1nwhvzw1SZzC10AR
 OdXyVv0mPflOmbHFVHIVdRICcbhHvjY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-338-A4bxAT_kPPeEhoRArClTvQ-1; Tue, 03 Jan 2023 09:14:24 -0500
X-MC-Unique: A4bxAT_kPPeEhoRArClTvQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 v4-20020adfa1c4000000b002753317406aso2913913wrv.21
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 06:14:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=B4bhdZHk1eflwG6L+HnTUT+S8MMzv/dpXWqPG6XnyiM=;
 b=Zyz25+g+OpsBfTZmhzQjxyQG5wL16aIvakUmM/ZUyGeiezGYYffvxis6/WA2KYc4ut
 mEWrhqWCDMwT0B5I/TzgT1AUx/eZUt9U7IOU7vCahxNSIaEN3h172qtXuClGrGfWTpac
 vA8k/QtNF6WbZrdqq6zvyx97yH2vVn+SMStSf//QGEjySym/nUWJU4KkOK+CDAhd/4yM
 VZK5ipqOwtWDieIw4swYtANoAa4LGlIX3wVgdZ8THv2BIK6/IjAK56kCaAVv9oBAbZzS
 xbMC2ZcBvOCTkRRSNmreoHCxiAF7XHJy/fU9X7rJxQrgO1HzOLVWd4y3/mt6DwtMlNJh
 6odA==
X-Gm-Message-State: AFqh2kodkglSEI1v2dtSH1UyRFDEkJumxJOYS+3zLPcqp+LRAAKQab5W
 hK/3Y/wRpmQUmcD5SHWuiAojP0uxWsqyXa68WjcCnYMWTKdB2wP7bRgn0s9ShB8A4f43xnwsAne
 dxRcQJV+t4+0NYlg=
X-Received: by 2002:a5d:54d0:0:b0:24a:e56d:e20 with SMTP id
 x16-20020a5d54d0000000b0024ae56d0e20mr27134638wrv.29.1672755263540; 
 Tue, 03 Jan 2023 06:14:23 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtEvDN14Mk0y4LfJIKvfCH3HGS3QgSKvudioa19NxxZMlGgOqaKaLPxR80ueUcIBm7V1MYIuQ==
X-Received: by 2002:a5d:54d0:0:b0:24a:e56d:e20 with SMTP id
 x16-20020a5d54d0000000b0024ae56d0e20mr27134618wrv.29.1672755263227; 
 Tue, 03 Jan 2023 06:14:23 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-177-55.web.vodafone.de.
 [109.43.177.55]) by smtp.gmail.com with ESMTPSA id
 p3-20020adfcc83000000b0027a57c1a6fbsm25703653wrj.22.2023.01.03.06.14.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Jan 2023 06:14:21 -0800 (PST)
Message-ID: <8776bff0-3cf7-c4d9-b685-35281591e884@redhat.com>
Date: Tue, 3 Jan 2023 15:14:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] Update scripts/meson-buildoptions.sh
Content-Language: en-US
To: Alessandro Di Federico <ale@rev.ng>, qemu-devel@nongnu.org
Cc: Taylor Simpson <tsimpson@quicinc.com>, Anton Johansson <anjo@rev.ng>,
 philmd@linaro.org, peter.maydell@linaro.org, bcain@quicinc.com,
 quic_mathbern@quicinc.com, stefanha@redhat.com,
 QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
References: <20230102104113.3438895-1-ale@rev.ng>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230102104113.3438895-1-ale@rev.ng>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.103, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 02/01/2023 11.41, Alessandro Di Federico wrote:
> Note: `Makefile` relies on modification dates in the source tree to
> detect changes to `meson_options.txt`. However, git does not track
> those. Therefore, the following was necessary to regenerate
> `meson-buildoptions.sh`:
> 
>      touch meson_options.txt
>      cd "$BUILD_DIR"
>      make update-buildoptions
> 
> Signed-off-by: Alessandro Di Federico <ale@rev.ng>
> ---
>   scripts/meson-buildoptions.sh | 18 ++++++++++++------
>   1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
> index aa6e30ea911..0f71e92dcba 100644
> --- a/scripts/meson-buildoptions.sh
> +++ b/scripts/meson-buildoptions.sh
> @@ -10,6 +10,9 @@ meson_options_help() {
>     printf "%s\n" '                           affects only QEMU, not tools like qemu-img)'
>     printf "%s\n" '  --datadir=VALUE          Data file directory [share]'
>     printf "%s\n" '  --disable-coroutine-pool coroutine freelist (better performance)'
> +  printf "%s\n" '  --disable-hexagon-idef-parser'
> +  printf "%s\n" '                           use idef-parser to automatically generate TCG'
> +  printf "%s\n" '                           code for the Hexagon frontend'
>     printf "%s\n" '  --disable-install-blobs  install provided firmware blobs'
>     printf "%s\n" '  --docdir=VALUE           Base directory for documentation installation'
>     printf "%s\n" '                           (can be empty) [share/doc]'
> @@ -40,7 +43,8 @@ meson_options_help() {
>     printf "%s\n" '  --enable-trace-backends=CHOICES'
>     printf "%s\n" '                           Set available tracing backends [log] (choices:'
>     printf "%s\n" '                           dtrace/ftrace/log/nop/simple/syslog/ust)'
> -  printf "%s\n" '  --firmwarepath=VALUES    search PATH for firmware files [share/qemu-firmware]'
> +  printf "%s\n" '  --firmwarepath=VALUES    search PATH for firmware files [share/qemu-'
> +  printf "%s\n" '                           firmware]'
>     printf "%s\n" '  --iasl=VALUE             Path to ACPI disassembler'
>     printf "%s\n" '  --includedir=VALUE       Header file directory [include]'
>     printf "%s\n" '  --interp-prefix=VALUE    where to find shared libraries etc., use %M for'
> @@ -93,7 +97,7 @@ meson_options_help() {
>     printf "%s\n" '  glusterfs       Glusterfs block device driver'
>     printf "%s\n" '  gnutls          GNUTLS cryptography support'
>     printf "%s\n" '  gtk             GTK+ user interface'
> -  printf "%s\n" '  gtk-clipboard   clipboard support for GTK (EXPERIMENTAL, MAY HANG)'
> +  printf "%s\n" '  gtk-clipboard   clipboard support for the gtk UI (EXPERIMENTAL, MAY HANG)'
>     printf "%s\n" '  guest-agent     Build QEMU Guest Agent'
>     printf "%s\n" '  guest-agent-msi Build MSI package for the QEMU Guest Agent'
>     printf "%s\n" '  hax             HAX acceleration support'
> @@ -156,6 +160,8 @@ meson_options_help() {
>     printf "%s\n" '  usb-redir       libusbredir support'
>     printf "%s\n" '  vde             vde network backend support'
>     printf "%s\n" '  vdi             vdi image format support'
> +  printf "%s\n" '  vduse-blk-export'
> +  printf "%s\n" '                  VDUSE block export support'
>     printf "%s\n" '  vfio-user-server'
>     printf "%s\n" '                  vfio-user server support'
>     printf "%s\n" '  vhost-crypto    vhost-user crypto backend support'
> @@ -164,8 +170,6 @@ meson_options_help() {
>     printf "%s\n" '  vhost-user      vhost-user backend support'
>     printf "%s\n" '  vhost-user-blk-server'
>     printf "%s\n" '                  build vhost-user-blk server'
> -  printf "%s\n" '  vduse-blk-export'
> -  printf "%s\n" '                  VDUSE block export support'
>     printf "%s\n" '  vhost-vdpa      vhost-vdpa kernel backend support'
>     printf "%s\n" '  virglrenderer   virgl rendering support'
>     printf "%s\n" '  virtfs          virtio-9p support'
> @@ -283,6 +287,8 @@ _meson_option_parse() {
>       --disable-guest-agent-msi) printf "%s" -Dguest_agent_msi=disabled ;;
>       --enable-hax) printf "%s" -Dhax=enabled ;;
>       --disable-hax) printf "%s" -Dhax=disabled ;;
> +    --enable-hexagon-idef-parser) printf "%s" -Dhexagon_idef_parser=true ;;
> +    --disable-hexagon-idef-parser) printf "%s" -Dhexagon_idef_parser=false ;;
>       --enable-hvf) printf "%s" -Dhvf=enabled ;;
>       --disable-hvf) printf "%s" -Dhvf=disabled ;;
>       --iasl=*) quote_sh "-Diasl=$2" ;;
> @@ -429,6 +435,8 @@ _meson_option_parse() {
>       --disable-vde) printf "%s" -Dvde=disabled ;;
>       --enable-vdi) printf "%s" -Dvdi=enabled ;;
>       --disable-vdi) printf "%s" -Dvdi=disabled ;;
> +    --enable-vduse-blk-export) printf "%s" -Dvduse_blk_export=enabled ;;
> +    --disable-vduse-blk-export) printf "%s" -Dvduse_blk_export=disabled ;;
>       --enable-vfio-user-server) printf "%s" -Dvfio_user_server=enabled ;;
>       --disable-vfio-user-server) printf "%s" -Dvfio_user_server=disabled ;;
>       --enable-vhost-crypto) printf "%s" -Dvhost_crypto=enabled ;;
> @@ -441,8 +449,6 @@ _meson_option_parse() {
>       --disable-vhost-user) printf "%s" -Dvhost_user=disabled ;;
>       --enable-vhost-user-blk-server) printf "%s" -Dvhost_user_blk_server=enabled ;;
>       --disable-vhost-user-blk-server) printf "%s" -Dvhost_user_blk_server=disabled ;;
> -    --enable-vduse-blk-export) printf "%s" -Dvduse_blk_export=enabled ;;
> -    --disable-vduse-blk-export) printf "%s" -Dvduse_blk_export=disabled ;;
>       --enable-vhost-vdpa) printf "%s" -Dvhost_vdpa=enabled ;;
>       --disable-vhost-vdpa) printf "%s" -Dvhost_vdpa=disabled ;;
>       --enable-virglrenderer) printf "%s" -Dvirglrenderer=enabled ;;

Reviewed-by: Thomas Huth <thuth@redhat.com>


