Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A704E5223
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 13:28:11 +0100 (CET)
Received: from localhost ([::1]:33900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX05y-0006Rw-Fs
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 08:28:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWzas-0000pU-99
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 07:56:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWzap-0004zk-DT
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 07:56:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648036558;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ElPaoFMM7AhbQHuQ5FYer1bFw7Hcx1MX8jE5FlVMVVE=;
 b=OPnN2PhX6fEyuhqHThQLSrqJrAsbvNyil2oKDRB+vg5FArhZ8UZIlw4f1qTj+OV3Yn/5ea
 daagQYkODqv1Mi3xXx3H7VVEN66KLN5Q7B5z9rIUWi2vDnyGruOIXSsrsUytYXs0EKD9YH
 wBbF6W1O2m1RLZ4upkRXT5J3kSl36ig=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-324-5kI3LzADOWipCKf7MQMRQQ-1; Wed, 23 Mar 2022 07:55:57 -0400
X-MC-Unique: 5kI3LzADOWipCKf7MQMRQQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 i22-20020a508716000000b0041908045af3so899074edb.3
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 04:55:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ElPaoFMM7AhbQHuQ5FYer1bFw7Hcx1MX8jE5FlVMVVE=;
 b=iNTRHpATjR6IgX6IOqg1hd5vRjVkbuQEnjhrUnwO7wsm7Ft+QAf2BCQOb/chcxxEEV
 g/M1v/Ck1EhL6isUDroOkVmmPU/rY/DyW8WBd6v2NpqzEvSU5A0LiBtPImpMrjOJi1wl
 viSiwMCPSjR15lvcPMG8hjt18KKe7O61m3mTlAh3LO1pdTlAhEbRCx5OhVvZZ4pcfXjx
 5mjYOYOqaR346oeV7ACBJWBrhlbvjqImQfJK8iXpGIm1/gWoGKNjiqzqPjxnZsIrH31V
 tlAHaYpzs3kbe1UnU59gkbeM6WNfaZMuTfQeYHMAKwLN2HHiuFsoGm82UfZ+DozM7lY3
 0b9Q==
X-Gm-Message-State: AOAM532YCThGlnMrLWu5CX1binLK9y6CvKMasy/MxM9CGnq77/C9dG58
 rwG7/KNznNKkOt2cg2x+HSEdiLqCBamgUpY9bpWadfrrhvm7O/IWSxPnNPJ560p5OfsE1PyRjlp
 mxkq0bqnCSzrD8rY=
X-Received: by 2002:a05:6402:1650:b0:418:fbfc:971b with SMTP id
 s16-20020a056402165000b00418fbfc971bmr32219865edx.351.1648036556518; 
 Wed, 23 Mar 2022 04:55:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxEbD/Xb7yCj0jN5w+9svIOjJc4yues+nEbjJUWenGQwHciMmnvmMR+k3+xDpIHrSvpjJzX+g==
X-Received: by 2002:a05:6402:1650:b0:418:fbfc:971b with SMTP id
 s16-20020a056402165000b00418fbfc971bmr32219830edx.351.1648036556309; 
 Wed, 23 Mar 2022 04:55:56 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 dm11-20020a170907948b00b006cf488e72e3sm9393256ejc.25.2022.03.23.04.55.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Mar 2022 04:55:55 -0700 (PDT)
Message-ID: <49a70904-bbef-f4fa-c388-8774abf1456d@redhat.com>
Date: Wed, 23 Mar 2022 12:55:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH-for-7.0 1/2] block: Fix misleading hexadecimal format
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>, qemu-devel@nongnu.org
References: <20220323114718.58714-1-philippe.mathieu.daude@gmail.com>
 <20220323114718.58714-2-philippe.mathieu.daude@gmail.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220323114718.58714-2-philippe.mathieu.daude@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Eduardo Habkost <eduardo@habkost.net>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Denis V. Lunev" <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23.03.22 12:47, Philippe Mathieu-Daudé wrote:
> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
>
> "0x%u" format is very misleading, replace by "0x%x".
>
> Found running:
>
>    $ git grep -E '0x%[0-9]*([lL]*|" ?PRI)[dDuU]' block/
>
> Inspired-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   block/parallels-ext.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


