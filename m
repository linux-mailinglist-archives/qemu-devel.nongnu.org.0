Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A91602ECAE9
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 08:22:16 +0100 (CET)
Received: from localhost ([::1]:37784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxPcd-00057h-7H
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 02:22:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kxPb8-0004ec-HA
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 02:20:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kxPb4-0004Ec-R2
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 02:20:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610004036;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KV8g8lOVO1AJwh4DLxxPzSGEkBte2JjJCWwkTfjIZuc=;
 b=MxsXSrT83TBhBxYuX7snZ7qU+jbB0fGQYAEkhvqGV10OUahfCHZHQlXi1SfqqEORFX9i/l
 U1l4ouCMqk8CdzIOQesvvlAFbt7hDBZBxFbclRv1FqgKv2YTvSilXxvIeFKblD8zqbA5zS
 ulJgTEErAD+YuxjAzg4+ShjEs8ZDmqQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-404-2OcduRv8PnW4FVVWZaJqow-1; Thu, 07 Jan 2021 02:20:34 -0500
X-MC-Unique: 2OcduRv8PnW4FVVWZaJqow-1
Received: by mail-wm1-f72.google.com with SMTP id g82so1954544wmg.6
 for <qemu-devel@nongnu.org>; Wed, 06 Jan 2021 23:20:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KV8g8lOVO1AJwh4DLxxPzSGEkBte2JjJCWwkTfjIZuc=;
 b=oBrGOMytbjMZypy30q9Z4+CXUuphL4tk7B9nzx+aPsFXEFT1w7dj7gGfSlcM8/MH5y
 FkBVjuMxbQ7EidYtY1RWpw2I+bzO+k5wL4NqPE0HoNtNcoMEVdL88v5odCuYF/PgWob2
 Nr398gIIIhHYWzmG2khgpkw6EsVo2uYhz96ymvH5wH6JDT+iACBPJ1om49Bu5UtuZ3dp
 KEQCHr5QGtyrx3jUCDG9fPKN0FZUZrB3ivifJccvA+sSDocUcMa37k5FjfGTjimLX6/K
 m2UP7h4qhYP8LpkPYbD9zNCDUt8YUCM09d4MMpDOa0PPb3i2uJOvIOrK6lucYNp0ToyP
 uNMA==
X-Gm-Message-State: AOAM533uZWz4kwlff9b2jAyHwaCNURzkRlgz0hOs6BEw2vcpClmjZzu6
 Hkb1qFKJlByHw5xBQSagWZSGinGdYU0G6byryaBGrUGnkg5cyT0Q2XVKRcvynOgOP5K+JILS+LJ
 MFjY0notOpjlhyK4=
X-Received: by 2002:adf:e452:: with SMTP id t18mr7227478wrm.177.1610004033739; 
 Wed, 06 Jan 2021 23:20:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxzLlaOX47kyiYpvmE7vfD5zoRsyBs65HITQqb1bUQKZuZAoOc5vWeLH9VbsWdQ1uWIFYhNeQ==
X-Received: by 2002:adf:e452:: with SMTP id t18mr7227464wrm.177.1610004033587; 
 Wed, 06 Jan 2021 23:20:33 -0800 (PST)
Received: from [192.168.1.36] (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id j10sm6685549wmj.7.2021.01.06.23.20.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Jan 2021 23:20:32 -0800 (PST)
Subject: Re: [PATCH 4/4] maintainers: Add me as Windows Hosted Continuous
 Integration maintainer
To: Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org
References: <20210107053825.2010-1-luoyonggang@gmail.com>
 <20210107053825.2010-5-luoyonggang@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <26a11923-5e71-d6bd-a6d8-ea543309a9ac@redhat.com>
Date: Thu, 7 Jan 2021 08:20:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210107053825.2010-5-luoyonggang@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.249, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Ed Maste <emaste@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/7/21 6:38 AM, Yonggang Luo wrote:
> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> ---
>  MAINTAINERS | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4be087b88e..4d9df874a1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3198,6 +3198,12 @@ S: Maintained
>  F: .cirrus.yml
>  W: https://cirrus-ci.com/github/qemu/qemu
>  
> +Windows Hosted Continuous Integration
> +M: Yonggang Luo <luoyonggang@gmail.com>
> +S: Maintained
> +F: .cirrus.yml
> +W: https://cirrus-ci.com/github/qemu/qemu

Thanks for stepping forward!

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


