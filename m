Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 624B5382D0F
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 15:13:44 +0200 (CEST)
Received: from localhost ([::1]:41760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lid43-00026Z-25
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 09:13:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lid2B-0000dQ-F0
 for qemu-devel@nongnu.org; Mon, 17 May 2021 09:11:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lid26-0006qN-5K
 for qemu-devel@nongnu.org; Mon, 17 May 2021 09:11:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621257101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0KZDBDdaTBZCZ4OZbD2Q67Qucxj3mSvEfsMAq9+a7VY=;
 b=jKkswDW9SY7SXdMxzS7RO8x1+5p4a2zL97+KJwSVJh2FyDv0sW2TChrI+XmYYJoi4/0mSb
 rRsIhOBFTiqdyTMO2ecbRly5WxE1jZ8CewmaKF4Z+eM3jolpnDtqTzPk18NXyxfPdy1ZwX
 xBvzTPHkBOZljyBvwLc7M+ICZxfJ4qg=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-483-_rlPXGg5NJKCa-UpM9Vkzg-1; Mon, 17 May 2021 09:11:39 -0400
X-MC-Unique: _rlPXGg5NJKCa-UpM9Vkzg-1
Received: by mail-ed1-f71.google.com with SMTP id
 p8-20020aa7c8880000b029038ce714c8d6so3868357eds.10
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 06:11:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0KZDBDdaTBZCZ4OZbD2Q67Qucxj3mSvEfsMAq9+a7VY=;
 b=XSaYoL9JrCZ9dh3nzpBvigRcZS4j+Ook34OUjE1ZIU2mA1FsotPO7tRTFT1/7W0NLw
 9otPv5Mb+0YwDBRJyXXIT3c3yVztml3dV6IGGmerGTPieFo7yVfnvkUt0qEhcdvCAljK
 RQOwoAxCK8gkFLwP9RHKvKBIhYdF+YVmCaA7P7BZ1blZcC9K/Iec12/y/tkvpXpRazHW
 9JtsdNqxbFG3PIl+R4h3pJW1SNPlF0xmtzivyDEqW7rEBowkq3o8yVbOcdY33QvLCAY7
 TEV1nMSSqXdZbisjq8AI6ziDwU9BORLCeEnvASJqyNzg3lkBpBujvQICSndlPxQg6Sxy
 UmQg==
X-Gm-Message-State: AOAM531UDwNS+YTgdDfvM9tCwLDFeFWxqBtOk63IRrRv9jE5LSQiMU0d
 +PWnmjEHlXGzcMd8mDWTrXaGyOgKTFUxBMx/nKkaBqyf7L8o86ImHCjcBT5ocE5DxSw8F9NpA4d
 A02vQLQzkwVLNa04=
X-Received: by 2002:a17:906:3b92:: with SMTP id
 u18mr29071505ejf.450.1621257098308; 
 Mon, 17 May 2021 06:11:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzJ+wMDUpX4maduDT13SMy/DazKZf2ELdt8RLuqI3cMpJaxAYi7L94sE1Hx7oQPNzq0Ll3Lbw==
X-Received: by 2002:a17:906:3b92:: with SMTP id
 u18mr29071488ejf.450.1621257098171; 
 Mon, 17 May 2021 06:11:38 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id d17sm1429510ejp.90.2021.05.17.06.11.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 May 2021 06:11:37 -0700 (PDT)
Subject: Re: [PATCH v2] vhost-vdpa: Remove redundant declaration of
 address_space_memory
To: Xie Yongji <xieyongji@bytedance.com>, mst@redhat.com, jasowang@redhat.com
References: <20210517123246.999-1-xieyongji@bytedance.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d00aed97-cc58-0c8a-dc7d-9ae8945c3af4@redhat.com>
Date: Mon, 17 May 2021 15:11:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210517123246.999-1-xieyongji@bytedance.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing qemu-trivial@

On 5/17/21 2:32 PM, Xie Yongji wrote:
> The symbol address_space_memory are already declared in
> include/exec/address-spaces.h. So let's add this header file
> and remove the redundant declaration in include/hw/virtio/vhost-vdpa.h.
> 
> Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/virtio/vhost-vdpa.c         | 1 +
>  include/hw/virtio/vhost-vdpa.h | 1 -
>  2 files changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 8f2fb9f10b2a..ee51863d280b 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -18,6 +18,7 @@
>  #include "hw/virtio/vhost-backend.h"
>  #include "hw/virtio/virtio-net.h"
>  #include "hw/virtio/vhost-vdpa.h"
> +#include "exec/address-spaces.h"
>  #include "qemu/main-loop.h"
>  #include "cpu.h"
>  #include "trace.h"
> diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
> index 28ca65018ed7..ae9ee7adb2d0 100644
> --- a/include/hw/virtio/vhost-vdpa.h
> +++ b/include/hw/virtio/vhost-vdpa.h
> @@ -21,5 +21,4 @@ typedef struct vhost_vdpa {
>      struct vhost_dev *dev;
>  } VhostVDPA;
>  
> -extern AddressSpace address_space_memory;
>  #endif
> 


