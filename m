Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F39339192
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 16:40:57 +0100 (CET)
Received: from localhost ([::1]:51652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKjuK-0001Ks-45
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 10:40:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKjkS-0008Ry-Rx
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 10:30:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKjkP-0001Gi-K1
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 10:30:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615563039;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JCWJqJJO00nSspxEemYBxF+WIg8B2Obf4vPuxyUE+uM=;
 b=I5phb3o0LCmWkGvpOATsln66oPdEYdPCSlo8mOBH5HuaIgGlnNhnZEfsSimaWzbc3+fkfq
 6uGBogSmqMPurW2PvFtenn9ljWgS6bFLfb2Z2z9QYaAm1oeR2+H3DAK9vTGQX5zUn5bjzX
 YYueuSeTnLlg33Dl1ndb8e45p6DsgHo=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-m6uwql30N86QWSDj7W0ycQ-1; Fri, 12 Mar 2021 10:30:37 -0500
X-MC-Unique: m6uwql30N86QWSDj7W0ycQ-1
Received: by mail-wr1-f70.google.com with SMTP id g2so11309984wrx.20
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 07:30:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JCWJqJJO00nSspxEemYBxF+WIg8B2Obf4vPuxyUE+uM=;
 b=Jfya4L2cjabzG85QcnmDkoNPY/u+OUk0vXO2DackWRH/By6EhJGSQqSCqkuF3MgxJC
 lN1HUo4NU05LMI1kL58AdisVlXiQ7Mp731v+DxtTIqfzUlhm/P56Vfi4d9NVKhm5Oc8z
 /FZhMj/JkYxjrrpV4mYp3oC1Yf1wGWNSDLFhqWYrbiU47mhagfpccnFYYBOGsd1SIXGM
 ROL+Ohmf4nBEY5I1ni5NeVt/f4UrCkVfwWZHuY1EMvQYAzbE72Gt/RLCMiIvhvUIW9cp
 ok7K5YkXvY85vRtexgXl717vv50s55VDRlB37muE7Jr2JD4Jry0o9CCjFUuIKvZwrDB3
 KNRA==
X-Gm-Message-State: AOAM53305/40UONENe2LqHBQufUUEp2BBiARE5CvKpENh1NnVSBAMa+n
 jzjjwQvwobfK0dQZ7FqvXuGdJKQU/YN6RR+Ul5qDnCgcb9WW9WXF9Ht9ZGcx2Opu5HIxuLGxXje
 QBJK5fdDzSFOUFHo=
X-Received: by 2002:a1c:7e45:: with SMTP id z66mr13602530wmc.126.1615563036636; 
 Fri, 12 Mar 2021 07:30:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzqEkMU+fFJ2anDERAWPYCl0zK9Vs620Gg61pbAp8PJBoHty+O5xi20tUekxc6CxYpeJtt8jw==
X-Received: by 2002:a1c:7e45:: with SMTP id z66mr13602504wmc.126.1615563036429; 
 Fri, 12 Mar 2021 07:30:36 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id g5sm8060030wrq.30.2021.03.12.07.30.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Mar 2021 07:30:35 -0800 (PST)
Subject: Re: [PATCH v1] configure: add option to implicitly enable/disable
 libgio
To: Denis Plotnikov <den-plotnikov@yandex-team.ru>, qemu-devel@nongnu.org
References: <20210312151440.405776-1-den-plotnikov@yandex-team.ru>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <56ddd7bb-b64f-3df8-ffa9-28fc5ca769bf@redhat.com>
Date: Fri, 12 Mar 2021 16:30:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210312151440.405776-1-den-plotnikov@yandex-team.ru>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: philmd@redhat.com, yc-core@yandex-team.ru
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/03/21 16:14, Denis Plotnikov wrote:
> Now, compilation of util/dbus is implicit and depends
> on libgio presence on the building host.
> The patch adds options to manage libgio dependencies explicitly.
> 
> Signed-off-by: Denis Plotnikov <den-plotnikov@yandex-team.ru>
> ---
>   configure | 60 ++++++++++++++++++++++++++++++++++++-------------------
>   1 file changed, 39 insertions(+), 21 deletions(-)
> 
> diff --git a/configure b/configure
> index 34fccaa2bae6..23eed988be81 100755
> --- a/configure
> +++ b/configure
> @@ -465,6 +465,7 @@ fuse_lseek="auto"
>   multiprocess="auto"
>   
>   malloc_trim="auto"
> +gio="$default_feature"
>   
>   # parse CC options second
>   for opt do
> @@ -1560,6 +1561,10 @@ for opt do
>     ;;
>     --disable-multiprocess) multiprocess="disabled"
>     ;;
> +  --enable-gio) gio=yes
> +  ;;
> +  --disable-gio) gio=no
> +  ;;
>     *)
>         echo "ERROR: unknown option $opt"
>         echo "Try '$0 --help' for more information"
> @@ -1913,6 +1918,7 @@ disabled with --disable-FEATURE, default is enabled if available
>     fuse            FUSE block device export
>     fuse-lseek      SEEK_HOLE/SEEK_DATA support for FUSE exports
>     multiprocess    Out of process device emulation support
> +  gio             libgio support
>   
>   NOTE: The object files are built at the place where configure is launched
>   EOF
> @@ -3319,17 +3325,19 @@ if test "$static" = yes && test "$mingw32" = yes; then
>       glib_cflags="-DGLIB_STATIC_COMPILATION $glib_cflags"
>   fi
>   
> -if $pkg_config --atleast-version=$glib_req_ver gio-2.0; then
> -    gio_cflags=$($pkg_config --cflags gio-2.0)
> -    gio_libs=$($pkg_config --libs gio-2.0)
> -    gdbus_codegen=$($pkg_config --variable=gdbus_codegen gio-2.0)
> -    if [ ! -x "$gdbus_codegen" ]; then
> -        gdbus_codegen=
> -    fi
> -    # Check that the libraries actually work -- Ubuntu 18.04 ships
> -    # with pkg-config --static --libs data for gio-2.0 that is missing
> -    # -lblkid and will give a link error.
> -    cat > $TMPC <<EOF
> +if ! test "$gio" = "no"; then
> +    pass=no
> +    if $pkg_config --atleast-version=$glib_req_ver gio-2.0; then
> +        gio_cflags=$($pkg_config --cflags gio-2.0)
> +        gio_libs=$($pkg_config --libs gio-2.0)
> +        gdbus_codegen=$($pkg_config --variable=gdbus_codegen gio-2.0)
> +        if [ ! -x "$gdbus_codegen" ]; then
> +            gdbus_codegen=
> +        fi
> +        # Check that the libraries actually work -- Ubuntu 18.04 ships
> +        # with pkg-config --static --libs data for gio-2.0 that is missing
> +        # -lblkid and will give a link error.
> +        cat > $TMPC <<EOF
>   #include <gio/gio.h>
>   int main(void)
>   {
> @@ -3337,18 +3345,28 @@ int main(void)
>       return 0;
>   }
>   EOF
> -    if compile_prog "$gio_cflags" "$gio_libs" ; then
> -        gio=yes
> -    else
> -        gio=no
> +        if compile_prog "$gio_cflags" "$gio_libs" ; then
> +            pass=yes
> +        else
> +            pass=no
> +        fi
> +
> +        if test "$pass" = "yes" &&
> +            $pkg_config --atleast-version=$glib_req_ver gio-unix-2.0; then
> +            gio_cflags="$gio_cflags $($pkg_config --cflags gio-unix-2.0)"
> +            gio_libs="$gio_libs $($pkg_config --libs gio-unix-2.0)"
> +        fi
>       fi
> -else
> -    gio=no
> -fi
>   
> -if $pkg_config --atleast-version=$glib_req_ver gio-unix-2.0; then
> -    gio_cflags="$gio_cflags $($pkg_config --cflags gio-unix-2.0)"
> -    gio_libs="$gio_libs $($pkg_config --libs gio-unix-2.0)"
> +    if test "$pass" = "no"; then
> +        if test "$gio" = "yes"; then
> +            feature_not_found "gio" "Install libgio >= 2.0"
> +        else
> +            gio=no
> +        fi
> +    else
> +        gio=yes
> +    fi
>   fi
>   
>   # Sanity check that the current size_t matches the
> 

Queued, thanks.

Paolo


