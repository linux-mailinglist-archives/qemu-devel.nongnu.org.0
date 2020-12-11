Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B472D82B4
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Dec 2020 00:27:18 +0100 (CET)
Received: from localhost ([::1]:49980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knroi-0008Id-7k
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 18:27:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1knrmC-0007h0-3z
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 18:24:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1knrm7-000632-Qb
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 18:24:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607729070;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mTSg41AypFyHWSr1V5cJEPUDxSw+p3/3twpQQagHv1U=;
 b=bG+Iqw77ExtuKbeyG0Qy7oyCUcVEsBYjsYZgvLu9qbfBdym9KG3wu7L+E+Wc0+agt2xenn
 sDZ+Euh7yN5zdexnRsG4m53ffcGu4iqy5xhf62kVjfS+xgfUfbIiT1aECoRGGHQltiCpnJ
 BnfpRiioOkPuBOJYJkRteXOuJ1VJgL4=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-398-T3WXv68nOKC2t603nw6XZQ-1; Fri, 11 Dec 2020 18:24:28 -0500
X-MC-Unique: T3WXv68nOKC2t603nw6XZQ-1
Received: by mail-ed1-f71.google.com with SMTP id c24so4633970edx.2
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 15:24:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mTSg41AypFyHWSr1V5cJEPUDxSw+p3/3twpQQagHv1U=;
 b=Pmnht/8uZiq3VLUIyQ7z9rIG0ZK4d9OrS3YEQQrE6s7rdzgThG3k0B+lfoAkSPaUf1
 nY+BX4eJrthpnvBXQw/44hyK+9bgeHeFufqdg2eg+Hhw4PF4Q10l7UWun6Mk16APpBc8
 mLQ9IA8VXTElIa9nymU9jFr8ndmyTKiQdiNOj+tcIYW62tGFEZwKlTZ/tFBAcM+dqDkA
 0G3PDMyPYcX8x84uzf7qE9LkV2tkBPCSOrRh9KmPn9Z5AJaPCww7eNaUoC38YfxPwbdQ
 TypqWrIMyUS1YiicUuEWO1rHI8nlFvKwzZyXefNdCxHyuZ3dTLaXq5qqPaEHB5agN04F
 oAzg==
X-Gm-Message-State: AOAM533EijSiI59Qt+vDuT2xHLt+AoqcL8V3FOfXBJ0fetf60OopPOBy
 FeQ6YPugkKP5y5WWdTftGDB0uEYddrIb6rXXp2z7Ij+GS3k06ZIBFB/wnQR4stm3cbiP0pgkfw5
 YYr58HKT+Wajy6NmoIL2buBZDAbTK9shQ9CCG644UJldTT8fxZ2YnJsLQsqi6tHqTm8w=
X-Received: by 2002:aa7:c886:: with SMTP id p6mr14599009eds.352.1607729067130; 
 Fri, 11 Dec 2020 15:24:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwctsY4AlhUr2/bzg0iy/eKxZ9iaa/GzPxb0aWFvX54uCphTWoRof2caDKcF3MXSPuaJMX0FA==
X-Received: by 2002:aa7:c886:: with SMTP id p6mr14598990eds.352.1607729066909; 
 Fri, 11 Dec 2020 15:24:26 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n16sm9014488edq.62.2020.12.11.15.24.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Dec 2020 15:24:25 -0800 (PST)
Subject: Re: [PATCH 14/15] null-machine: do not create a default memdev
To: Igor Mammedov <imammedo@redhat.com>
References: <20201202081854.4126071-1-pbonzini@redhat.com>
 <20201202081854.4126071-15-pbonzini@redhat.com>
 <20201207174359.03b099ce@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <4e36d013-d379-05e3-7803-eb4df9fbb0d3@redhat.com>
Date: Sat, 12 Dec 2020 00:24:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201207174359.03b099ce@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/12/20 17:43, Igor Mammedov wrote:
>>       mc->default_ram_size = 0;
>> -    mc->default_ram_id = "ram";
>> +    mc->default_ram_id = NULL;
> probably that will break:
> 
>   QEMU -m X -M none

No, it works.  "-m" is simply ignored, because the default memdev is 
created here:

     if (machine_class->default_ram_id && current_machine->ram_size &&
         numa_uses_legacy_mem() && !current_machine->ram_memdev_id) {
         create_default_memdev(current_machine, mem_path);
     }

and is thus skipped for -M none.

Paolo

> 
> maybe there is  a bug over there but
>      "mc->default_ram_size = 0"
> above, should result in
>      current_machine->ram_size == 0
> in case user hasn't provided "-m"
> and hence memdev shouldn't be created
> 


