Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4D369AE47
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 15:45:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT1yX-0002yh-Sn; Fri, 17 Feb 2023 09:44:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pT1yU-0002yU-4T
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 09:44:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pT1yS-0007Yd-C3
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 09:44:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676645068;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5mKQIRAhj8AOFan+eCMqKnBcH6EMqeY92zkvNhp47lY=;
 b=KSaN/HeLnkeDwISvzQnN7mivnDel7gNBaXQkxkdzDYHFjl6mA0za7Duj8+sWLbGj2FkkPn
 I0bgp6tTTiAGK4khnmEDuPzwMRc0KlclBCKwSFEuHYzjhvqaakIO2ZCeiOUSYb/uNxH/cv
 uOJTyF1aKHwAHBXWT8R7/T6NxZrkiK8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-76-Z_pPZ36UMPaDwjZYBVbC4g-1; Fri, 17 Feb 2023 09:44:27 -0500
X-MC-Unique: Z_pPZ36UMPaDwjZYBVbC4g-1
Received: by mail-wr1-f70.google.com with SMTP id
 n11-20020a5d588b000000b002c54a27803cso86988wrf.22
 for <qemu-devel@nongnu.org>; Fri, 17 Feb 2023 06:44:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5mKQIRAhj8AOFan+eCMqKnBcH6EMqeY92zkvNhp47lY=;
 b=0lbDqs5gTh1EvGRnrigL3RoR3UpVHvG3YqELgIRHNW4gS/425JzPbRqjLpjRA0Dl7S
 Gxj6gg9KB4Tiu64qBUewSOaE1CqMzWg46fqAtzDaQT+11N6AP6UPeHedaLV+n1m9Tgnt
 JeeitdftwwGIUNlaD4uDoTPXxnWI3RzKaxgSCC4CEF706Amc0KdYnit+VqOazQcD1mmP
 0ZQuOuWxhDourxlZ6pidyqDDxufWeM6/PyKjFZdNrxgSL2Nm4G7AvM4IAtghpbegYIy4
 B2sXEyyzHeryfzgiGWuzssHke9p6eAOZS1yBCgRYXgMmKn97zDD40vYNogay/+sjgH9k
 1iFw==
X-Gm-Message-State: AO0yUKUSxcVSScuG6sqszOcR6CZVJy4ionkfdemmhaLvV2pSxiKGyktA
 rlfWVI9tch3SbERP9PVFeQwWsLyb04m/eNzUVyv0qSMifRp0TVj1600vp3KqBh+2upWApKJnSsn
 gyQlR22FYuTjKDaI=
X-Received: by 2002:a05:600c:90f:b0:3df:3bd6:63e5 with SMTP id
 m15-20020a05600c090f00b003df3bd663e5mr765658wmp.12.1676645066603; 
 Fri, 17 Feb 2023 06:44:26 -0800 (PST)
X-Google-Smtp-Source: AK7set9ZQJ474sUmNDRuh33LnAWW71+wiHz8fFwATgnTwkcpzzSMGz5BWhxwHvfUehDf8Wbbe/GkkQ==
X-Received: by 2002:a05:600c:90f:b0:3df:3bd6:63e5 with SMTP id
 m15-20020a05600c090f00b003df3bd663e5mr765648wmp.12.1676645066284; 
 Fri, 17 Feb 2023 06:44:26 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.googlemail.com with ESMTPSA id
 1-20020a05600c028100b003e200dc15f5sm5213380wmk.42.2023.02.17.06.44.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Feb 2023 06:44:25 -0800 (PST)
Message-ID: <3b6b4035-0a7b-431e-6479-70753f850554@redhat.com>
Date: Fri, 17 Feb 2023 15:44:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH] docs/about/build-platforms: Refine the distro support
 policy
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Daniel Berrange <berrange@redhat.com>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Claudio Fontana <cfontana@suse.de>
References: <20230217132631.403112-1-thuth@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230217132631.403112-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.256, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 2/17/23 14:26, Thomas Huth wrote:
> Note: These changes mean that openSUSE is not considered as supported
> anymore (since version 15.0 has been released in May 2018), and
> RHEL/CentOS 8 will not be supported anymore in 3 months (since version
> 8.0 has been released in May 2019).
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

This has the advantage of being a very simple change to the support 
policy.  However, it has the disadvantage that at this point both SLE15 
and RHEL8 are not hard to support _at run-time_, only the build is a bit 
problematic; so, it kinda throws away the baby with the bathwater.

I have posted another RFC at 
https://lore.kernel.org/qemu-devel/20230217124150.205012-1-pbonzini@redhat.com; 
they share the 4 year deadline but it only applies to non-native 
dependencies (which means Python right now).

Thanks for posting this, it's useful to have two different possibilities 
to compare.

Paolo

> ---
>   docs/about/build-platforms.rst | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/docs/about/build-platforms.rst b/docs/about/build-platforms.rst
> index 1c1e7b9e11..cdc38f16a4 100644
> --- a/docs/about/build-platforms.rst
> +++ b/docs/about/build-platforms.rst
> @@ -67,10 +67,11 @@ Non-supported architectures may be removed in the future following the
>   Linux OS, macOS, FreeBSD, NetBSD, OpenBSD
>   -----------------------------------------
>   
> -The project aims to support the most recent major version at all times. Support
> -for the previous major version will be dropped 2 years after the new major
> -version is released or when the vendor itself drops support, whichever comes
> -first. In this context, third-party efforts to extend the lifetime of a distro
> +The project aims to support the most recent major version at all times for
> +up to four years after its initial release. Support for the previous major
> +version will be dropped one years after the new major version is released
> +or when the vendor itself drops support, whichever comes first.
> +In this context, third-party efforts to extend the lifetime of a distro
>   are not considered, even when they are endorsed by the vendor (eg. Debian LTS);
>   the same is true of repositories that contain packages backported from later
>   releases (e.g. Debian backports). Within each major release, only the most


