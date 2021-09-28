Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B93A41B560
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 19:44:41 +0200 (CEST)
Received: from localhost ([::1]:47460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVH9d-00070L-AJ
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 13:44:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mVH51-0005K5-LR
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 13:39:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mVH4y-0000U7-UA
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 13:39:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632850782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XVZQwcQxTG9VAcbRB0rFJ4uWctGudl1JVn+ono5N/7Y=;
 b=ebIkX0q/4zXw0+cPQK9KMplBbzYzhfZZUtvTm468QZwqiP3fnXcUxtGr04R7THaiiX8iqt
 l7FiOEvaJEj7U2a4IBQBWV1RCcp6u5D22VKKOyKZ4Hgv1RQr0ErO7dEFSYQFbiAcQQc7Ry
 efANqtUDa6+L1bT3Xe/7dwWhhut4LrU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-253-ksZJ7nxVOhG6_2eDI7Pjsw-1; Tue, 28 Sep 2021 13:39:36 -0400
X-MC-Unique: ksZJ7nxVOhG6_2eDI7Pjsw-1
Received: by mail-wr1-f69.google.com with SMTP id
 j15-20020a5d564f000000b00160698bf7e9so2102294wrw.13
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 10:39:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XVZQwcQxTG9VAcbRB0rFJ4uWctGudl1JVn+ono5N/7Y=;
 b=0+dQ6dJhcj/XyZaI/Cqh5PlEVLnrIfdQPWswrnuhAHka3mN8u+uIZvxoPOsjatRSV/
 JTtSfuIaoAD+bXZEK9QKFXbsrtwp0b3SB9/O292hnIlFAb+t9L5PnFLOEjaJHmUtdR/S
 Y3o5B1U8pI46T1ad1yPUgmv0JUEZkQnBAEHzTm2tYSbESmiiTm3O6VFW8paWMh35mGP9
 f5j6aqpmNJnkMH8l0xXLXNRttnsAEnrpD2CVafwTbFDvPml55gDorDa82nXd1EBQnL3h
 GTV9c574/4589A9a6AI7EwcWqCM5BslLC+NfgUasNuysAUOv6wrL7s3dSojiwz/sY9eC
 G70w==
X-Gm-Message-State: AOAM5309PZUPtQ3IgSz85IglA1HcqCKq+LiA2GuFASrk1yCWlP8ilkOr
 oNFoOHBerYDMurI60VUJSAwEaEEe/meHJfgMDUrW3bLTojRd2hZFg0qlJCJ/qHZh9/tX+spH0gD
 x6HAyobEA40coJ1A=
X-Received: by 2002:a5d:58ef:: with SMTP id f15mr1667664wrd.160.1632850775731; 
 Tue, 28 Sep 2021 10:39:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw10YPVnEOnYbdBFCSDzQFoQusH/Sn3G2sx5DHZkgAyxdh6zVOJr6aMxis5Mq0LNw8/gXICcQ==
X-Received: by 2002:a5d:58ef:: with SMTP id f15mr1667634wrd.160.1632850775514; 
 Tue, 28 Sep 2021 10:39:35 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id d8sm21513048wrv.80.2021.09.28.10.39.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Sep 2021 10:39:34 -0700 (PDT)
Message-ID: <c85745b0-d913-5f64-4c08-c2d03542107e@redhat.com>
Date: Tue, 28 Sep 2021 19:39:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] qapi: Make some ObjectTypes depend on the build settings
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>
References: <20210928160232.432980-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20210928160232.432980-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.562, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/28/21 18:02, Thomas Huth wrote:
> Some of the ObjectType entries already depend on CONFIG_* switches.
> Some others also only make sense with certain configurations, but
> are currently always listed in the ObjectType enum. Let's make them
> depend on the correpsonding CONFIG_* switches, too, so that upper
> layers (like libvirt) have a better way to determine which features
> are available in QEMU.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  qapi/qom.json | 30 ++++++++++++++++++++----------
>  1 file changed, 20 insertions(+), 10 deletions(-)
> 
> diff --git a/qapi/qom.json b/qapi/qom.json
> index a25616bc7a..78b60433a9 100644
> --- a/qapi/qom.json
> +++ b/qapi/qom.json
> @@ -777,7 +777,8 @@
>      'authz-pam',
>      'authz-simple',
>      'can-bus',
> -    'can-host-socketcan',
> +    { 'name': 'can-host-socketcan',
> +      'if': 'CONFIG_LINUX' },
>      'colo-compare',
>      'cryptodev-backend',
>      'cryptodev-backend-builtin',
> @@ -791,20 +792,24 @@
>      'filter-replay',
>      'filter-rewriter',
>      'input-barrier',
> -    'input-linux',
> +    { 'name': 'input-linux',
> +      'if': 'CONFIG_LINUX' },
>      'iothread',
>      'memory-backend-file',
>      { 'name': 'memory-backend-memfd',
>        'if': 'CONFIG_LINUX' },
>      'memory-backend-ram',
>      'pef-guest',
> -    'pr-manager-helper',
> +    { 'name': 'pr-manager-helper',
> +      'if': 'CONFIG_LINUX' },
>      'qtest',
>      'rng-builtin',
>      'rng-egd',
> -    'rng-random',
> +    { 'name': 'rng-random',
> +      'if': 'CONFIG_POSIX' },
>      'secret',
> -    'secret_keyring',
> +    { 'name': 'secret_keyring',
> +      'if': 'CONFIG_SECRET_KEYRING' },
>      'sev-guest',
>      's390-pv-guest',
>      'throttle-group',
> @@ -835,7 +840,8 @@
>        'authz-listfile':             'AuthZListFileProperties',
>        'authz-pam':                  'AuthZPAMProperties',
>        'authz-simple':               'AuthZSimpleProperties',
> -      'can-host-socketcan':         'CanHostSocketcanProperties',
> +      'can-host-socketcan':         { 'type': 'CanHostSocketcanProperties',
> +                                      'if': 'CONFIG_LINUX' },
>        'colo-compare':               'ColoCompareProperties',
>        'cryptodev-backend':          'CryptodevBackendProperties',
>        'cryptodev-backend-builtin':  'CryptodevBackendProperties',
> @@ -849,19 +855,23 @@
>        'filter-replay':              'NetfilterProperties',
>        'filter-rewriter':            'FilterRewriterProperties',
>        'input-barrier':              'InputBarrierProperties',
> -      'input-linux':                'InputLinuxProperties',
> +      'input-linux':                { 'type': 'InputLinuxProperties',
> +                                      'if': 'CONFIG_LINUX' },
>        'iothread':                   'IothreadProperties',
>        'memory-backend-file':        'MemoryBackendFileProperties',
>        'memory-backend-memfd':       { 'type': 'MemoryBackendMemfdProperties',
>                                        'if': 'CONFIG_LINUX' },
>        'memory-backend-ram':         'MemoryBackendProperties',
> -      'pr-manager-helper':          'PrManagerHelperProperties',
> +      'pr-manager-helper':          { 'type': 'PrManagerHelperProperties',
> +                                      'if': 'CONFIG_LINUX' },
>        'qtest':                      'QtestProperties',
>        'rng-builtin':                'RngProperties',
>        'rng-egd':                    'RngEgdProperties',
> -      'rng-random':                 'RngRandomProperties',
> +      'rng-random':                 { 'type': 'RngRandomProperties',
> +                                      'if': 'CONFIG_POSIX' },
>        'secret':                     'SecretProperties',
> -      'secret_keyring':             'SecretKeyringProperties',
> +      'secret_keyring':             { 'type': 'SecretKeyringProperties',
> +                                      'if': 'CONFIG_SECRET_KEYRING' },
>        'sev-guest':                  'SevGuestProperties',
>        'throttle-group':             'ThrottleGroupProperties',
>        'tls-creds-anon':             'TlsCredsAnonProperties',
> 

I quickly opened qapi/qom.json and spotted another one:

--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -870,3 +870,4 @@
       'tls-cipher-suites':          'TlsCredsProperties',
-      'x-remote-object':            'RemoteObjectProperties'
+      'x-remote-object':            { 'type': 'RemoteObjectProperties',
+                                      'if': 'CONFIG_MULTIPROCESS' },
   } }

While your change is correct, this isn't maintainable long term.
Not sure how we could improve that :/ But having to handle similar
information in 3 different places (configure, meson.build, qapi json)
is error prone. Thoughts?


