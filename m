Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65130508D37
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 18:25:56 +0200 (CEST)
Received: from localhost ([::1]:37726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhD9P-0001YN-GQ
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 12:25:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nhCXu-0008W3-KV
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:47:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nhCXt-0003As-3U
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:47:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650469628;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lmwCxMBgvt21rBIwiEDK4J7DQcI4PIHXkc1NlX6twVU=;
 b=LEa6mU+uFoEAGWbwmDNaeDp2EZaWi/+9pEtoInGwoHee16vyQBUmX9yauynNH4YuV9jfX4
 88+VsyizUpKAqiXWzJ0H6zeYd9ToMtYle607YAFrGrKcgC2y071j9o0cXn5rtkzxB6Oscy
 ffWdh+XPptIw9eEp8D+XO43tbmPu9vk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-340-JhPieeT_P52tOYbPPq5jaQ-1; Wed, 20 Apr 2022 11:47:07 -0400
X-MC-Unique: JhPieeT_P52tOYbPPq5jaQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 c17-20020a5d6cd1000000b00207a6974951so521639wrc.1
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 08:47:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:cc:from:in-reply-to
 :content-transfer-encoding;
 bh=lmwCxMBgvt21rBIwiEDK4J7DQcI4PIHXkc1NlX6twVU=;
 b=p3IxgdlwbrkEXuBI/vwnkWQP4eDQmxs7dbu2qmlMR+MheqDx954znc0OVnKYVOxbV4
 b5sYiiIFyj77plRYgq+SL7vNoeNWO+XRhKOoRakbuG0eYwCYX052osPcIpXqJt8QrSiY
 zBc/Aw+NwNlm775X5ZUNV06NDC0HRfElWkSJys9HebuE+DxUeONeQI5ZWNzrRke4Fk6j
 zR4vBrxPAJto1+fJcfhSvwxQ0st4ZYOphb+AVgCVDjwCN9gykrOlXjBJdG6SFLr6XROb
 i6QIcJXKedJh5pLlH1wvpRl3tyv7rIOMzGG1k76u+R21EJECTXtPevMawN1MHyBc63qz
 iMlQ==
X-Gm-Message-State: AOAM5338lJ080eusg6+ot5fv5yycN62B5mYiQcFHYOjvg7R4vGyXLGZP
 6oo+c5RJpAZeHQq6UbcNJ/fQFMfHXwGk9EPcar6fj/ZtkDDbob6lTKY4o7qfDolcAnFypyCLe0p
 7qqOVZvDX9DnvA30=
X-Received: by 2002:a05:600c:3548:b0:38f:20d9:4f03 with SMTP id
 i8-20020a05600c354800b0038f20d94f03mr4392177wmq.189.1650469625880; 
 Wed, 20 Apr 2022 08:47:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxF/PaSiJqoTZATpT67RM/rt5ld7qjF6AMWfupqOqlj6rB3TC2u+2qygox8+0nlm2rPFkqRQg==
X-Received: by 2002:a05:600c:3548:b0:38f:20d9:4f03 with SMTP id
 i8-20020a05600c354800b0038f20d94f03mr4392160wmq.189.1650469625717; 
 Wed, 20 Apr 2022 08:47:05 -0700 (PDT)
Received: from [192.168.8.102]
 (dynamic-046-114-174-058.46.114.pool.telefonica.de. [46.114.174.58])
 by smtp.gmail.com with ESMTPSA id
 f16-20020a05600c155000b0039288e17458sm251222wmg.19.2022.04.20.08.47.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Apr 2022 08:47:05 -0700 (PDT)
Message-ID: <8066a548-c4dc-35d7-4479-af7bc3eee9f7@redhat.com>
Date: Wed, 20 Apr 2022 17:47:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 04/34] configure: pc-bios/qemu-icon.bmp does not exist
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220420153407.73926-1-pbonzini@redhat.com>
 <20220420153407.73926-5-pbonzini@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220420153407.73926-5-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/04/2022 17.33, Paolo Bonzini wrote:
> The file has been removed in commit a8260d3876 ("ui: install logo icons to
> $prefix/share/icons", 2019-01-21), do not try to symlink it in the build tree.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   configure | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/configure b/configure
> index 2bc5a0b84f..7a89cb4123 100755
> --- a/configure
> +++ b/configure
> @@ -3020,7 +3020,6 @@ LINKS="Makefile"
>   LINKS="$LINKS tests/tcg/Makefile.target"
>   LINKS="$LINKS pc-bios/optionrom/Makefile"
>   LINKS="$LINKS pc-bios/s390-ccw/Makefile"
> -LINKS="$LINKS pc-bios/qemu-icon.bmp"
>   LINKS="$LINKS .gdbinit scripts" # scripts needed by relative path in .gdbinit
>   LINKS="$LINKS tests/avocado tests/data"
>   LINKS="$LINKS tests/qemu-iotests/check"

Reviewed-by: Thomas Huth <thuth@redhat.com>


