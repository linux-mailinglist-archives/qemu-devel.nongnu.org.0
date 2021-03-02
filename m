Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9368932AC2F
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 22:25:29 +0100 (CET)
Received: from localhost ([::1]:41572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHCWG-0000fS-HL
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 16:25:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHCIM-00021o-TP
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 16:11:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHCIJ-0002Y9-1H
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 16:11:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614719461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HXO8EOv/gLMM/VLaeOYlikmEyg7vQIlzGyo6NDqfVM8=;
 b=KGzu9yv6GZBl9GILfjudK21NPtBgm/0UbhYVPvsOY0G7+VQGFAFb85a065pqvb5mEqizpO
 xojcPEwQrqvnuWFXDc9oCQPL9f0RH6qUGsirMpaN7y8pUpeKqD1RzkmJzC2dOI54aJJU2e
 qsxX/zTQphfX8y09AQAo3ieg/er4yxg=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-192-nDhocMAUPtqF3Pkw31Jfaw-1; Tue, 02 Mar 2021 16:10:59 -0500
X-MC-Unique: nDhocMAUPtqF3Pkw31Jfaw-1
Received: by mail-ej1-f69.google.com with SMTP id v19so1140093ejc.12
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 13:10:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HXO8EOv/gLMM/VLaeOYlikmEyg7vQIlzGyo6NDqfVM8=;
 b=ZP3rF/szFHkc16iegnB6HBftV3sqo7R4KUDiaPv+naSJCbTLWFrMSYtkvyOJcRQwVH
 5gTv3+IswfKI1HMUslrkgp0Jr2zzKLc6qRGh5vpkjvT1oZRLAlcAFez7swUKpJkpF2PE
 8U/X/M74nIq+/IcS4L3FxyfM+Tql+0fos5Wzqo7w55c5P+1mra72k+Q1V6x2cJwVEZ3O
 fnIKIP8eA26LmuO+x6JwosyZWn5///77j0cw0zCPL1g3jCIOBWPQ2KFOrLtb4+JttPsI
 55IdLRXrPHBkYVWHSeyxxa4aV6O6fhFr4VorimDW24SV3VAFzEpxjjz7OI48aqKPc25T
 214A==
X-Gm-Message-State: AOAM5302s7g56cvuBZ4H3mVjyp+d8wjw5HXbdsaTncelNbsGPiVYNOe1
 V7/cHZvTYD8IQwZWJ12n0NaiO2zGCSCFMPbxUi0bkYXdxu31uN2vCJpLeDMVoB9Q2r+uaCevhL2
 rOgUlk9MqDhtmUs8=
X-Received: by 2002:a17:906:cecc:: with SMTP id
 si12mr22890936ejb.461.1614719458751; 
 Tue, 02 Mar 2021 13:10:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJytEIK5CeHYZX05i53yH8pWO7zKuCaB0DA9emNtoPCeQRNfmJvG9rh2Stv+Dsdu9jns9Mf1Fw==
X-Received: by 2002:a17:906:cecc:: with SMTP id
 si12mr22890918ejb.461.1614719458586; 
 Tue, 02 Mar 2021 13:10:58 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id gj13sm226679ejb.118.2021.03.02.13.10.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Mar 2021 13:10:58 -0800 (PST)
Subject: Re: [PATCH 1/3] qapi, audio: add query-audiodev command
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210302175524.1290840-1-berrange@redhat.com>
 <20210302175524.1290840-2-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <6ed46b74-c426-0c85-61eb-668f49a31795@redhat.com>
Date: Tue, 2 Mar 2021 22:10:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210302175524.1290840-2-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Michael Roth <michael.roth@amd.com>, Markus Armbruster <armbru@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/2/21 6:55 PM, Daniel P. Berrangé wrote:
> Way back in QEMU 4.0, the -audiodev command line option was introduced
> for configuring audio backends. This CLI option does not use QemuOpts
> so it is not visible for introspection in 'query-command-line-options',
> instead using the QAPI Audiodev type.  Unfortunately there is also no
> QMP command that uses the Audiodev type, so it is not introspectable
> with 'query-qmp-schema' either.
> 
> This introduces a 'query-audiodev' command that simply reflects back
> the list of configured -audiodev command line options. This in turn
> makes Audiodev introspectable via 'query-qmp-schema'.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  audio/audio.c   | 19 +++++++++++++++++++
>  qapi/audio.json | 13 +++++++++++++
>  2 files changed, 32 insertions(+)

> +
> +##
> +# @query-audiodevs:
> +#
> +# Returns information about audiodev configuration
> +#
> +# Returns: array of @Audiodev
> +#
> +# Since: 6.0
> +#
> +##
> +{ 'command': 'query-audiodevs',
> +  'returns': ['Audiodev'] }
> 

Can we use 'query-audiodev-backends' similarly to
'query-chardev-backends'?


