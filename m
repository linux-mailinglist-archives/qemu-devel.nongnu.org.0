Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C94A669CCE
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 16:48:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGL3K-0002oj-Q3; Fri, 13 Jan 2023 09:29:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pGL39-0002kb-Ie
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 09:28:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pGL37-0007aC-3Z
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 09:28:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673620068;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=shcFh22nF6EFzDZQbp+ujZhMZlzdg1vA2H9XE4J8C5M=;
 b=PqOIBnLzuEHYfv+3J95H0H3QRfA9ng6cYUI9Lr4jd3rgoS8tQAqJ/K9vFUQaXBXCeUpBFT
 qwj15cXpW4fozhpKeymINN6O9fKGkEugDWob0pukJIlLwXzgWlfmnaKUsU94AY9gXg78N9
 gO38QV8hzC07aZPu1H7CMzZRuNFWy1A=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-313-XgSDb9fIPae2U8wyPCTn3w-1; Fri, 13 Jan 2023 09:27:46 -0500
X-MC-Unique: XgSDb9fIPae2U8wyPCTn3w-1
Received: by mail-wm1-f72.google.com with SMTP id
 fl12-20020a05600c0b8c00b003d96f0a7f36so10995427wmb.1
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 06:27:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=shcFh22nF6EFzDZQbp+ujZhMZlzdg1vA2H9XE4J8C5M=;
 b=64oMNFPgU4rcDwUh2AP2RwoHC84WZBHInWXtaaBYi1buLbGRNDIa/7hB0Z0YthdSGl
 LIJRMngsz0ayjTSLMXeTw8ZGCRO9PcZRka3BugbEk8TwtkZ0W6x46pwahKc0sLnMyt7V
 h2Bqv6MP7khG7pPdfq3JijuirsMp7fYx7h1JvrITghoGaI5wvVmlhlg6l4NSbzxu737T
 ziqKgEFJj0vmkHt5jWN8plSusYcmRHZT7UJWwfEDfGAbZSN1P1oVlxz537do1GDtCF/W
 O6gzUclVxM39eeXTCdVG1l9wksdEa8LXQG375Eyiorjz1hQLkwZjqDLlfqNRryIOVmmT
 Cfaw==
X-Gm-Message-State: AFqh2krGxNAVVSlkYK5rOGxRh3IQIJoM1+QbHWlf2mKmdRmBITQKBIj6
 nzcXWtlZ8cmnFFCZSKU9OJ6nf4AsmtSiGCKxl8CS1JmkZB611C3AB21wVykgkQQwBWiahMaVwdi
 VzeJj4idfOyaNTY4=
X-Received: by 2002:a05:600c:3b9b:b0:3da:23f8:f028 with SMTP id
 n27-20020a05600c3b9b00b003da23f8f028mr1831881wms.21.1673620065816; 
 Fri, 13 Jan 2023 06:27:45 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs7ZS27tbG7AhfR0TxkK9j6gMyupZCuK9C/HQeDBa98HCU6VCMwhSaHCMAWhcILYeSME8TemA==
X-Received: by 2002:a05:600c:3b9b:b0:3da:23f8:f028 with SMTP id
 n27-20020a05600c3b9b00b003da23f8f028mr1831862wms.21.1673620065622; 
 Fri, 13 Jan 2023 06:27:45 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-39.web.vodafone.de.
 [109.43.177.39]) by smtp.gmail.com with ESMTPSA id
 f12-20020a05600c154c00b003d9fba3c7a4sm12122188wmg.16.2023.01.13.06.27.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 06:27:42 -0800 (PST)
Message-ID: <60747f19-91ca-403d-29b5-c205141c7047@redhat.com>
Date: Fri, 13 Jan 2023 15:27:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [RFC PATCH v3 23/28] tests/tcg: Do not build/run TCG tests if TCG
 is disabled
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Claudio Fontana <cfontana@suse.de>, Eduardo Habkost <ehabkost@redhat.com>,
 Alexander Graf <agraf@csgraf.de>
References: <20230113140419.4013-1-farosas@suse.de>
 <20230113140419.4013-24-farosas@suse.de>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230113140419.4013-24-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 13/01/2023 15.04, Fabiano Rosas wrote:
> The tests under tests/tcg depend on the TCG accelerator. Do not build
> them if --disable-tcg was given in the configure line.
> 
> Test against CONFIG_TCG='' instead of CONFIG_TCG=y to account for
> CONFIG_TCG=m.
> 
> sample output:
> 
> $ make check-tcg
>    GIT     ui/keycodemapdb meson dtc
>    SKIPPED x86_64-softmmu guest-tests because TCG is disabled in this build
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   configure              |  4 ++++
>   tests/Makefile.include | 10 ++++++++++
>   2 files changed, 14 insertions(+)
> 
> diff --git a/configure b/configure
> index 9e407ce2e3..a6f9892757 100755
> --- a/configure
> +++ b/configure
> @@ -2352,6 +2352,10 @@ if test "$plugins" = "yes" ; then
>       echo "CONFIG_PLUGIN=y" >> $config_host_mak
>   fi
>   
> +if test "$tcg" = "enabled" ; then
> +    echo "CONFIG_TCG=y" >> $config_host_mak
> +fi

Commit 8a19980e3fc42239a moved CONFIG_TCG to meson.build, so this looks 
backward now ... could you maybe simply make sure that TCG_TESTS_TARGETS 
does not get set in config-host.mak if TCG is disabled?

  Thomas



