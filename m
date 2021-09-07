Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC5F402CC6
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 18:21:58 +0200 (CEST)
Received: from localhost ([::1]:47664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNdrA-0007iX-Mw
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 12:21:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mNdpy-0006qD-Ju
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 12:20:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36227)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mNdpv-0005VS-O4
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 12:20:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631031637;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zrNI7QRmkPgow0eBHQ/8qZcCs2JE+EqtIgid+ytbG1I=;
 b=BSDzEGq3WJ9NNaH/0A2KKSQTprSlkpPW5VOnAUhJxwdoeM+yzHjFNpjD/XLYLGB3LbRQ86
 nJjlTpFOrejQGswGJqDzYvmWM/KsiQXF+TYqOoyF35A/lMBVz3+OanCDXyiF2bsW1EqmJq
 Sc2uUdM+S1V6O0j2HIr+uQVg6Re4qAo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-597-KkPxxDzlMHyIQS455eeJGg-1; Tue, 07 Sep 2021 12:20:36 -0400
X-MC-Unique: KkPxxDzlMHyIQS455eeJGg-1
Received: by mail-wm1-f70.google.com with SMTP id
 h1-20020a05600c350100b002e751bf6733so1295836wmq.8
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 09:20:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zrNI7QRmkPgow0eBHQ/8qZcCs2JE+EqtIgid+ytbG1I=;
 b=qMWJoKoD/qqmB2A4Q4DzgwFvNNVYqBn8g4aiiYWdCyAJBfSHKVnl2+Qc/7rTtpR56B
 V6kwh1wEDqi8Tm565RmQinWWHL+EdfQDTLw1ArMr7tYc1iCNVsrJo/rGswrH6Z1kpust
 fEV59x1IJs5w38MN28YFrqRw9MLycz96//86bB9pnbUiaHSV8v4oB53gCW9hkf36fjc+
 AdNnr24GlnSf8Of5iE7W0ilbK+ORSLBFewT4dAbmlrCbI3+LDTiw6/CZuyRUznl45o6f
 PfJJLgqCPKf/LM4RLPac+hQvEfCTMTQoWmHyQpuNN1X5BVQhRPkoYi1hzMw55sLYaS82
 EU/Q==
X-Gm-Message-State: AOAM530d4JYD9buaZptrzHxKKXO3FWga8agAEI5ER2vpvGyprdU5+FRo
 pFf3Dx3X20P35FCF5V3s2EQKp8COTPVLX7a4qKNQS6/t0KtCTDZGd/8P0YZRzPj+e37nxzeEp4a
 kYCR4X22cUnV85m8=
X-Received: by 2002:a5d:470b:: with SMTP id y11mr20256473wrq.213.1631031635442; 
 Tue, 07 Sep 2021 09:20:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz+Yxp45vyVxI4OhuUAifSTv0jMOFb8Pwss0D+vLewL7E1TC2IjMDWU64mkjcstKWT1uvfkEg==
X-Received: by 2002:a5d:470b:: with SMTP id y11mr20256454wrq.213.1631031635228; 
 Tue, 07 Sep 2021 09:20:35 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id l17sm11801322wrz.35.2021.09.07.09.20.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Sep 2021 09:20:34 -0700 (PDT)
Subject: Re: [PATCH v1 1/2] Only check CONFIG_NVMM when NEED_CPU_H is defined
To: Reinoud Zandijk <reinoud@NetBSD.org>, qemu-devel@nongnu.org
References: <20210718134650.1191-1-reinoud@NetBSD.org>
 <20210718134650.1191-2-reinoud@NetBSD.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <6059b24a-a5ee-822f-8ff8-7277eb99896c@redhat.com>
Date: Tue, 7 Sep 2021 18:20:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210718134650.1191-2-reinoud@NetBSD.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.332, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/18/21 3:46 PM, Reinoud Zandijk wrote:
> Userland targers will otherwise use a poisoned CONFIG_NVMM

Typo "targets", but do you mean bsd-user or linux-user?

But what is the error you get here?

cpu_report_tpr_access() is protected for !CONFIG_USER_ONLY,
target/i386/nvmm/ is only build on system emulation.

So when can this happen? Last candidate is "sysemu/hw_accel.h";
does it really need to include "sysemu/nvmm.h"?

> Signed-off-by: Reinoud Zandijk <Reinoud@NetBSD.org>
> ---
>  include/sysemu/nvmm.h | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/include/sysemu/nvmm.h b/include/sysemu/nvmm.h
> index 6d216599b0..833670fccb 100644
> --- a/include/sysemu/nvmm.h
> +++ b/include/sysemu/nvmm.h
> @@ -10,8 +10,7 @@
>  #ifndef QEMU_NVMM_H
>  #define QEMU_NVMM_H
>  
> -#include "config-host.h"
> -#include "qemu-common.h"
> +#ifdef NEED_CPU_H
>  
>  #ifdef CONFIG_NVMM
>  
> @@ -23,4 +22,6 @@ int nvmm_enabled(void);
>  
>  #endif /* CONFIG_NVMM */
>  
> -#endif /* CONFIG_NVMM */
> +#endif /* NEED_CPU_H */
> +
> +#endif /* QEMU_NVMM_H */
> 


