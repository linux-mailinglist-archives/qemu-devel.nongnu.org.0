Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DAB9538BF5
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 09:29:38 +0200 (CEST)
Received: from localhost ([::1]:50656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvwJs-0006jG-Vv
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 03:29:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nvwH1-0005yT-Rk
 for qemu-devel@nongnu.org; Tue, 31 May 2022 03:26:40 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:36548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nvwGz-0006HD-Vq
 for qemu-devel@nongnu.org; Tue, 31 May 2022 03:26:39 -0400
Received: by mail-ed1-x529.google.com with SMTP id fd25so16301748edb.3
 for <qemu-devel@nongnu.org>; Tue, 31 May 2022 00:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZXRAOzMB63EZbV3P+p/zpTU+Aduy0jpZ/23fcsJpOvw=;
 b=ZBwygGefo/NBfCQjAClkRP/6t0WpGmvzZmTeffqDj5FLd0Nb3BMk2N/xnwff4hqcd5
 h1wEJGi4dWYLQ8qEl2ST3UmjZvmMw4yWqOnnr7whcJQFZbME/9a+l9VcNPjXH//2p720
 +r55Gu1exO1R5bLeYYGbeHSh4rokIbvr9rbhrHoJPIFe55VWYY6e68GYrW3qDbApKkmi
 SLa94V6oZPnKmBAiNDmGncriPObzPaWChPy8HuqEhmuSVuzFxYwu2Er6vMuZIKvG2hks
 Vj9sF+sQl/JdbcyakQMF9T6xzCCEGW39uCOl73sgdaGQETbWaq22Jo+w54z2XTRpPdBJ
 vxVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZXRAOzMB63EZbV3P+p/zpTU+Aduy0jpZ/23fcsJpOvw=;
 b=qlyvS+lpVNjld5eIIi+wLKabW6WrGqxGw5VvgmO+uG+lvde6aF9DQw9ExHbQiIeoeO
 hTbVwujY7FXgDnK5ioNiuA9RbZMr0y4VHIwgwycZOjmubKysMD0m1FMLzus0su2X4FYr
 6ipxv4jYFzrbkHVlrcvQ9fZR/y69xr8UEU3CoulIpdxJ5HbSaFwPa9kyv7/6LWd1K0gL
 a5PC3bVLPc+AC6Xz8I08V0IjEgoiovguU9QGdqKSuWnarwdga49Kt6tP5xr4TJuTdMMI
 YyJmbARkxYPOhwqV6b5klNDH4L54S8bEHDYvSyQv/6Yqv/nyuwYClzhBGUnvNzYB3+9s
 b3OA==
X-Gm-Message-State: AOAM530QMhEm4fLmqvdOtRNtqE+oUkU+DJS4/EEXWhk3RxuHK+GSaVa2
 LMyJFWObZt/OYYPk+hXQAnM=
X-Google-Smtp-Source: ABdhPJwFNfDSt6waLF6OlQpTR0pmmbXlShTCJ8ffV43e4b3zQzi572ShONEYA9n6A9fqFD7gBFLG2Q==
X-Received: by 2002:a05:6402:27c9:b0:42a:d367:fdb9 with SMTP id
 c9-20020a05640227c900b0042ad367fdb9mr63313915ede.47.1653981996664; 
 Tue, 31 May 2022 00:26:36 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 sb3-20020a170906edc300b006ff19354f9fsm4655389ejb.215.2022.05.31.00.26.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 May 2022 00:26:35 -0700 (PDT)
Message-ID: <8878d03f-0576-94e5-5e4d-7133baf61372@redhat.com>
Date: Tue, 31 May 2022 09:26:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 5/8] pci/pci_expander_bridge: For CXL HB delay the HB
 register memory region setup.
Content-Language: en-US
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>, qemu-devel@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>
Cc: linux-cxl@vger.kernel.org, linuxarm@huawei.com, alex.bennee@linaro.org,
 Marcel Apfelbaum <marcel@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Adam Manzanares <a.manzanares@samsung.com>, Tong Zhang
 <ztong0001@gmail.com>, Ben Widawsky <ben.widawsky@intel.com>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
References: <20220530134514.31664-1-Jonathan.Cameron@huawei.com>
 <20220530134514.31664-6-Jonathan.Cameron@huawei.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220530134514.31664-6-Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/30/22 15:45, Jonathan Cameron via wrote:
> +    /* Walk the pci busses looking for pxb busses to hook up */
> +    if (bus) {
> +        QLIST_FOREACH(bus, &bus->child, sibling) {
> +            if (!pci_bus_is_root(bus)) {
> +                continue;
> +            }
> +            if (pci_bus_is_cxl(bus)) {
> +                if (!ms->cxl_devices_state->is_enabled) {
> +                    error_report("CXL host bridges present, but cxl=off");
> +                    exit(EXIT_FAILURE);
> +                }
> +                pxb_cxl_hook_up_registers(ms->cxl_devices_state, bus, &error_fatal);
> +            }
> +        }
> +    }

Perhaps this loop can be moved to a separate function in cxl_host.h?

Otherwise looks great, thank you very much for the quick reply!

Paolo

>       if (ms->cxl_devices_state) {
>           cxl_fmws_link_targets(ms->cxl_devices_state, &error_fatal);
>       }


