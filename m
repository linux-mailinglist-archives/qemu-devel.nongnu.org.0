Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61BA46482C6
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 14:27:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3dNy-0001DB-Cq; Fri, 09 Dec 2022 08:25:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p3dNk-0001AV-2n
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 08:25:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p3dNi-0002oG-9L
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 08:25:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670592336;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cWBMW3x3BJGQn6ry2NvxqBfiI7QRdFQh8WbRTd69Tbo=;
 b=a1hgKUQ2DfimCvqHgKZKqsm03eVVu5fhZ6W6R2kNYr65j+5vt6PAugzJaPUp1NowKAg8WL
 U3DzspMBC+8Ksauf/fGUVApYZv5rQq2tcTkGRFH97Tu9rNkc/c7DxG00JKXK5STBHqKNCh
 /DPQd+1DZRrihluABC62yEWuawBKrYA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-417-3id01WpvMgCl668d600a-Q-1; Fri, 09 Dec 2022 08:25:35 -0500
X-MC-Unique: 3id01WpvMgCl668d600a-Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 m17-20020a05600c3b1100b003cf9cc47da5so2389039wms.9
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 05:25:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cWBMW3x3BJGQn6ry2NvxqBfiI7QRdFQh8WbRTd69Tbo=;
 b=oO6kahFP5RjNalK5jRBCHH0Ht4dBqEdPGG7s2YDqJVNhk7yhZXP3upCQb6/JQFoCpj
 urouvJhHfuS6e4LE3NtR0OdPQwzdsZnZW8myX06WOEyeg3qp2YUouP7HaSgAHftr8C8D
 GsBiF5tztJHxn4GNRveBx9ChhDdv+ZVZKl2ODIMUhx7iFOhVDhXX2jFAR99CXreNcJ0n
 2fqJlYGkM4DVdzeq3vAWd9Q+OGE8oaL5/v2CW6htHXVT+G1TgU7Hf8v86zhMRJoAq5pM
 K+co7H47Rja9+7MLevzExFoXypTKiYY80SLqTGGHUps5N0Iv1EBITaWpBUDqRKkmVALr
 W1Jw==
X-Gm-Message-State: ANoB5pmSAHiG2IwuBkvvJ+zWGZ4zjrXbMgIZq/1sfVn4uzr4psL+ncep
 Y23vRPhdYDYzcNPxvJyfQeCUfKH4Y33GO7YQlSLzVJfXBbXzgSF9gtcqlGIsQW8doXmftDbJGpY
 TklDUCtRewrsmrqY=
X-Received: by 2002:a5d:494c:0:b0:242:7a19:b53e with SMTP id
 r12-20020a5d494c000000b002427a19b53emr3630138wrs.27.1670592334664; 
 Fri, 09 Dec 2022 05:25:34 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6ifxEkPM3tLm8H5pfZZZ0xbIRh+xMTJ2kCY8gUaBerzE6YPhk9yOP4k3xn5DJutknrAwdqqQ==
X-Received: by 2002:a5d:494c:0:b0:242:7a19:b53e with SMTP id
 r12-20020a5d494c000000b002427a19b53emr3630126wrs.27.1670592334451; 
 Fri, 09 Dec 2022 05:25:34 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-177-15.web.vodafone.de.
 [109.43.177.15]) by smtp.gmail.com with ESMTPSA id
 j18-20020a5d5652000000b002427bfd17b6sm1664689wrw.63.2022.12.09.05.25.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Dec 2022 05:25:33 -0800 (PST)
Message-ID: <e63e54a8-e699-03bf-c9b6-37b207e0f8fc@redhat.com>
Date: Fri, 9 Dec 2022 14:25:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 08/30] meson: require 0.63.0
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20221209112409.184703-1-pbonzini@redhat.com>
 <20221209112409.184703-9-pbonzini@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221209112409.184703-9-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.288, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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

On 09/12/2022 12.23, Paolo Bonzini wrote:
> This allows cleanups cleanups in modinfo collection and supports the

Scratch one "cleanups" ?

> equivalent of QEMU's --static option to configure.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   configure   | 2 +-
>   meson       | 2 +-
>   meson.build | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


