Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D81303BE221
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 06:33:37 +0200 (CEST)
Received: from localhost ([::1]:41876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0zFg-0004XF-IK
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 00:33:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m0zEe-0003rp-Ts
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 00:32:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41188)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m0zEc-00045v-EZ
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 00:32:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625632349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cq8BnSZBOHxwjEtPzR6FgvDSx9oHbY/VDV4bi2ouA1Q=;
 b=Zugw7THVGCJAJul0enqRDGHb6PnSDlFVyTg0Fxxy1AUG7zyK1wfaVaKexir9eIUsSRr25O
 gr9nfRhNDTGhW0OiQ7Ora9tqCzQiG7oFgaStuhzwNKmH/m53eLX+huRWvu00+ey1Zg7I/K
 g2zlcJ+l5kUGCltdPPrXcklVE2g5lCQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-04SSDE24P0ipGjYBf1HtGQ-1; Wed, 07 Jul 2021 00:32:27 -0400
X-MC-Unique: 04SSDE24P0ipGjYBf1HtGQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 l21-20020a0560000235b029013564642c78so381451wrz.9
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 21:32:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Cq8BnSZBOHxwjEtPzR6FgvDSx9oHbY/VDV4bi2ouA1Q=;
 b=i87eiwsDtzyurPWQnhpjmiOmfl+Z6gMHghIfawY7vPaR5nmLtP3YOSMwMo56qzlwsd
 ODa8zXXFOwUjkwU61ckHkgHgQEZ5w63vmMhY/6M6y7OwPQgxMvUdxaewbMWLW3izaH2P
 iMxpbKhb0u3GMR++RGgBpTi1WBu8vLj05kVzBh93O6x3uBbqFoCJJnenpiTqNtcFZcOG
 cwdKtTcdpJ4QsfbEYDPfzFSNWHQvczNr9fbQd6qZEA4tZKYa0pA9ma7DQSpW35HXbpDb
 UVbB1HdvEspkzcanlr6kkZUwkVJXzE8NWTnMum7lFOvo//UCVmMKiUutkr+tKXUlvUAt
 4jSQ==
X-Gm-Message-State: AOAM531ordFMC9N/D6RSZWYN5tGi+AY3QQnOc/PzORPKgE+Bwlff/Kd/
 HzhYY+a97jylLf/tW9xtZB1cwjlt6rAk1if0SPBp2GgXkRVmbconcRPXCRM6/zGtnvlGD9uax4c
 5iMM33s4Dt33ks0U=
X-Received: by 2002:a05:6000:110:: with SMTP id
 o16mr8319967wrx.284.1625632346669; 
 Tue, 06 Jul 2021 21:32:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxwWzdbZgHEmHjD1LZyb0/oeZQnFolILxyUua5+UvIb1BqiB6HVfdLndF+/r6LePqNEi0GyyA==
X-Received: by 2002:a05:6000:110:: with SMTP id
 o16mr8319947wrx.284.1625632346493; 
 Tue, 06 Jul 2021 21:32:26 -0700 (PDT)
Received: from thuth.remote.csb (pd9575ead.dip0.t-ipconnect.de.
 [217.87.94.173])
 by smtp.gmail.com with ESMTPSA id n23sm4829852wmi.29.2021.07.06.21.32.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 21:32:26 -0700 (PDT)
Subject: Re: [PATCH v1 31/39] tcg/plugins: enable by default for TCG builds
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210706145817.24109-1-alex.bennee@linaro.org>
 <20210706145817.24109-32-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <38827f08-6f3c-8589-9141-3390fc23d198@redhat.com>
Date: Wed, 7 Jul 2021 06:32:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210706145817.24109-32-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
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
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/07/2021 16.58, Alex Bennée wrote:
> Aside from a minor bloat to file size the ability to have TCG plugins
> has no real impact on performance unless a plugin is actively loaded.
> Even then the libempty.so plugin shows only a minor degradation in
> performance caused by the extra book keeping the TCG has to do to keep
> track of instructions. As it's a useful feature lets just enable it by
> default and reduce our testing matrix a little.
> 
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v2
>    - properly handle plugins being ""
>    - make the test for linker support handle default case
>    - move linker tests to before the glib-modules test
> ---
>   docs/devel/tcg-plugins.rst |   3 +-
>   configure                  | 125 ++++++++++++++++++++-----------------
>   .gitlab-ci.d/buildtest.yml |  23 -------
>   3 files changed, 71 insertions(+), 80 deletions(-)
> 
> diff --git a/docs/devel/tcg-plugins.rst b/docs/devel/tcg-plugins.rst
> index 18c6581d85..0cd77c77d2 100644
> --- a/docs/devel/tcg-plugins.rst
> +++ b/docs/devel/tcg-plugins.rst
> @@ -71,7 +71,8 @@ API
>   Usage
>   =====
>   
> -The QEMU binary needs to be compiled for plugin support::
> +Any QEMU binary with TCG support has plugins enabled by default.
> +Earlier releases needed to be explicitly enabled with::
>   
>     configure --enable-plugins
>   
> diff --git a/configure b/configure
> index 9d72b31a9f..0ce6c1ff65 100755
> --- a/configure
> +++ b/configure
> @@ -429,7 +429,7 @@ libxml2="auto"
>   debug_mutex="no"
>   libpmem="auto"
>   default_devices="true"
> -plugins="no"
> +plugins="$default_feature"
>   fuzzing="no"
>   rng_none="no"
>   secret_keyring="$default_feature"
> @@ -3085,6 +3085,73 @@ for drv in $audio_drv_list; do
>       esac
>   done
>   
> +##########################################
> +# plugin linker support probe
> +
> +if test "$plugins" != "no"; then
> +
> +    #########################################
> +    # See if --dynamic-list is supported by the linker
> +
> +    ld_dynamic_list="no"
> +    if test "$static" = "no" ; then
> +        cat > $TMPTXT <<EOF
> +{
> +  foo;
> +};
> +EOF
> +
> +        cat > $TMPC <<EOF
> +#include <stdio.h>
> +void foo(void);
> +
> +void foo(void)
> +{
> +  printf("foo\n");
> +}
> +
> +int main(void)
> +{
> +  foo();
> +  return 0;
> +}
> +EOF
> +
> +        if compile_prog "" "-Wl,--dynamic-list=$TMPTXT" ; then
> +            ld_dynamic_list="yes"
> +        fi
> +    fi
> +
> +    #########################################
> +    # See if -exported_symbols_list is supported by the linker
> +
> +    ld_exported_symbols_list="no"
> +    if test "$static" = "no" ; then
> +        cat > $TMPTXT <<EOF
> +  _foo
> +EOF
> +
> +        if compile_prog "" "-Wl,-exported_symbols_list,$TMPTXT" ; then
> +            ld_exported_symbols_list="yes"
> +        fi
> +    fi
> +
> +    if test "$ld_dynamic_list" = "no" &&
> +       test "$ld_exported_symbols_list" = "no" ; then
> +        if test "$plugins" = "yes"; then
> +            error_exit \
> +                "Plugin ($plugins) support requires dynamic linking and specifying a set of symbols " \

Printing "($plugins)" here does not make much sense to me (it will always 
result in "(yes)", won't it?) ... but apart from that, the patch looks fine 
to me.

So with that "($plugins)" removed:

Reviewed-by: Thomas Huth <thuth@redhat.com>


