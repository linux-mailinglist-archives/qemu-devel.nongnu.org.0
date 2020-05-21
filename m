Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CB81DD07E
	for <lists+qemu-devel@lfdr.de>; Thu, 21 May 2020 16:50:16 +0200 (CEST)
Received: from localhost ([::1]:58886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jbmWV-0007Pi-E2
	for lists+qemu-devel@lfdr.de; Thu, 21 May 2020 10:50:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jbmT5-00005S-Js
 for qemu-devel@nongnu.org; Thu, 21 May 2020 10:46:43 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:25173
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jbmT4-0002Wh-6U
 for qemu-devel@nongnu.org; Thu, 21 May 2020 10:46:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590072401;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=USLeMxcB/gZ9GGCsDGqkU49MhFSxIPTJ5eZ58NzmCLU=;
 b=Kp8GRvXaH4Wi2Ofd1Pdj1s/iY2ESvKMYAmvmGM4A9wXbUskFKO3syvd5bPsqpVhoOSAIAa
 NBMBfjC6sMc7XjXb+UHbHh30G0vSS9pC4PxeBkUh1jZXrozeE8C8UkRGDjOHStrFmxIf13
 dPNcCXURdZUJ0h5oagy10b8G/pCBDy8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-307-DjdqATsLOaKnEm_BIwrdtw-1; Thu, 21 May 2020 10:46:40 -0400
X-MC-Unique: DjdqATsLOaKnEm_BIwrdtw-1
Received: by mail-wm1-f70.google.com with SMTP id e15so1057053wme.1
 for <qemu-devel@nongnu.org>; Thu, 21 May 2020 07:46:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=USLeMxcB/gZ9GGCsDGqkU49MhFSxIPTJ5eZ58NzmCLU=;
 b=KMVCRqUtu56D1zkIEHF8xE7W1rE3M5F/KY2XoWB1/rg9hop2/YUh6w6vutXTD5bUxl
 Zm6wMgeZGchgB8QnNBWMuJbC77COBCRJjgGvdL0W+6SbUSfRV6ONOJ3507DIlQdkxQlN
 KvPyAs5eUIyECfoDtCDpW4uAl1lXgt9aguyVreymHHeB1x3dlp+liUcVjkU9c3jI4ALP
 RZgHq85IEjpzMXF+0HpGOBbZkk6d4N/1ehPAfgpnQfyPP1lS6oUgHSZl127KG4XZu31l
 UQVEoWo6UGAFXoVAs2/ZiQOn1UAsO1EhqeHKBUy3MqP9zMaKhid74xzPcbaJtNnm+NHI
 H7CA==
X-Gm-Message-State: AOAM532gb9XgM3cYavWZi1RLK32Xiv95l19oEp941H6JjVX/8s7fj74z
 QdZ6P1kYs23y85xop7TAlplWltBkIiVP+r2Q7CFQAy3S3FIIpG4NB5daav9hkpWR8WDmIKthnkk
 HnJCj6lif1sM0xjg=
X-Received: by 2002:adf:fc8b:: with SMTP id g11mr9377425wrr.90.1590072398744; 
 Thu, 21 May 2020 07:46:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxrUBO+1n4OrxGIFWdarpub6deORjztDIAAedmyKV3fI/kV0nAHP7nqyho7dJIZLhE4cohiuw==
X-Received: by 2002:adf:fc8b:: with SMTP id g11mr9377410wrr.90.1590072398447; 
 Thu, 21 May 2020 07:46:38 -0700 (PDT)
Received: from [192.168.178.58] ([151.30.94.134])
 by smtp.gmail.com with ESMTPSA id l9sm5541539wrv.32.2020.05.21.07.46.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 May 2020 07:46:38 -0700 (PDT)
Subject: Re: [PATCH] qom/container: remove .instance_size initializer from
 container_info
To: Masahiro Yamada <masahiroy@kernel.org>, qemu-devel@nongnu.org,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
References: <20200513033600.2709646-1-masahiroy@kernel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <337d26b8-11b3-bed9-2c30-f52bdf7c2b40@redhat.com>
Date: Thu, 21 May 2020 16:46:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200513033600.2709646-1-masahiroy@kernel.org>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/21 01:44:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/05/20 05:36, Masahiro Yamada wrote:
> You can omit .instance_size if it is the same as that of the parent.
> 
>     .class_size = sizeof(ObjectClass)
> 
> ... is omitted here, so removing .instance_size is more consistent.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  qom/container.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/qom/container.c b/qom/container.c
> index f6ccaf7ea7..4c030d6dda 100644
> --- a/qom/container.c
> +++ b/qom/container.c
> @@ -16,7 +16,6 @@
>  
>  static const TypeInfo container_info = {
>      .name          = "container",
> -    .instance_size = sizeof(Object),
>      .parent        = TYPE_OBJECT,
>  };
>  
> 

Queued, thanks.

Paolo


