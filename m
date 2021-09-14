Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3FD40A6F1
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 08:55:17 +0200 (CEST)
Received: from localhost ([::1]:54444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ2Lc-0006Jx-6b
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 02:55:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mQ2KI-0004tP-6g
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 02:53:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mQ2KG-0007tQ-JL
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 02:53:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631602431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pajrMvCYkvTqYDSWg77H38DHvsUkJEugec1d5jft3zA=;
 b=XaBZmn7OIkX/A5i4dtOifkS+swxfQgeYPhL5ZFKohhi6bcFNUdTU7E3jM51PT5H1bP2v1d
 vqZqgXnBRrL68fTNFnKHDwSTaafrUp/aILEeaOnBhr1Er7BsrTKfBJG54Ldn6XjG1suo/I
 57Br4Bs4Qs+KWP1gR8GK5QCSzkgAJhk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-4-bMRlqWMpOyaExt5A2GrZ3w-1; Tue, 14 Sep 2021 02:53:50 -0400
X-MC-Unique: bMRlqWMpOyaExt5A2GrZ3w-1
Received: by mail-wr1-f69.google.com with SMTP id
 r5-20020adfb1c5000000b0015cddb7216fso3488304wra.3
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 23:53:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pajrMvCYkvTqYDSWg77H38DHvsUkJEugec1d5jft3zA=;
 b=ukyGVV4siLW8tNbWuPQ5U+9xZxQN+jp/CLGT24Gf/GZFpCsUJJCUy7fvWDZinWdyci
 Lh6yxXpU6RHdeGs5oQwdFA/GYkMN6H4zQn1gH9tMlJEYIg+Vsn8lWONhUIzfzQ9gzSjd
 uxYVBVV4TI+k0JxpGFGQ4ThzgIRxmsAN8AMEjHdT/bBGYdh5S9fyhXbjoHyhfaOeEuHm
 XcACyN/nNjX59eZgu+oUiRqmtW/rVTaWq91staKkiO6iq99PWfgMae15LB5fZVfwuO8o
 Jfn7Ttr0hlPbN571PKE7qJnaBqC41Sy2iyEVWZGk5PakNSffx5Ck10A4AW+0nF+E90oj
 HxCw==
X-Gm-Message-State: AOAM532QAYD4nLKfiQI2QgjXosLiSyep56a0a+gOQOfMkwmI/LYr3RxB
 EvJXkCxiBF2YK6p+Lz7iDWFNMudCDC14eORNtrV8hAdDv/cZqDNsjt/4InLlwQnQECiIH4efXoC
 2hWcnmdcsjRl1lq8=
X-Received: by 2002:a5d:58cd:: with SMTP id o13mr1100890wrf.416.1631602429399; 
 Mon, 13 Sep 2021 23:53:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwYbPn6yInIvajV/C5oEhW4AyTy1AYDes+UVmNFiGmXX3xAXco+5xae2GUV5hxFgBJ1V90RwQ==
X-Received: by 2002:a5d:58cd:: with SMTP id o13mr1100869wrf.416.1631602429183; 
 Mon, 13 Sep 2021 23:53:49 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id q11sm8960713wrn.65.2021.09.13.23.53.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Sep 2021 23:53:48 -0700 (PDT)
Subject: Re: [PATCH v4 23/33] sgx-epc: Add the reset interface for sgx-epc
 virt device
To: Yang Zhong <yang.zhong@intel.com>, qemu-devel@nongnu.org
References: <20210719112136.57018-1-yang.zhong@intel.com>
 <20210719112136.57018-24-yang.zhong@intel.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <77caedf9-31bb-c245-d5b5-20b9792a57ed@redhat.com>
Date: Tue, 14 Sep 2021 08:53:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210719112136.57018-24-yang.zhong@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.969, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: seanjc@google.com, kai.huang@intel.com, eblake@redhat.com,
 jarkko@kernel.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/19/21 1:21 PM, Yang Zhong wrote:
> If the VM is reset, we need make sure sgx virt epc in clean status.
> Once the VM is reset, and sgx epc virt device will be reseted by
> reset callback registered by qemu_register_reset(). Since this epc
> virt device depend on backend, this reset will call backend reset
> interface to re-mmap epc to guest.
> 
> Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> ---
>  hw/i386/sgx-epc.c | 94 ++++++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 81 insertions(+), 13 deletions(-)
> 
> diff --git a/hw/i386/sgx-epc.c b/hw/i386/sgx-epc.c
> index 924dea22f0..9880d832d5 100644
> --- a/hw/i386/sgx-epc.c
> +++ b/hw/i386/sgx-epc.c
> @@ -18,6 +18,9 @@
>  #include "qapi/visitor.h"
>  #include "target/i386/cpu.h"
>  #include "exec/address-spaces.h"
> +#include "sysemu/reset.h"
> +
> +uint32_t epc_num;

Missing 'static' qualifier.


