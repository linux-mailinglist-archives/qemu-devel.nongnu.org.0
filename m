Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D205538BFC
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 09:32:53 +0200 (CEST)
Received: from localhost ([::1]:52986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvwN2-0008VG-5J
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 03:32:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nvwH4-0005ye-28
 for qemu-devel@nongnu.org; Tue, 31 May 2022 03:26:44 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:33412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nvwGw-0006Gd-4b
 for qemu-devel@nongnu.org; Tue, 31 May 2022 03:26:41 -0400
Received: by mail-ej1-x62f.google.com with SMTP id f9so24909911ejc.0
 for <qemu-devel@nongnu.org>; Tue, 31 May 2022 00:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IKS5gbVC5TKkwCxvfzNBNsteWO3XdewF6O03i9WkL2k=;
 b=VKgN+Vu5HV9ZfjKsG6MXuV0uc1Y7i++jFVjttD15/vblyI/xZR4oCks9oNuU7SHFM7
 wIaRr/OZvTn9XZo4kmXOYTyzqeDzIhtLQcjDV1ySO08+WV/moo5it0j/DuGg+UdDOAUx
 bp8DgfGuIBTw/L2YqwzzEMgulmhlK7SE/duZRCRha+oCgRAVQlOaW6IMZ5DSablH8WEy
 8sPXPoq6nkR8c+SqfPGcpl8l7dSa3wtqO6e2CbN/N5L/Wf55slwhHUPG7xlzm6XtluKa
 QZW8tt4qxI5jt46Wk8laXvbbGBxiq/sPd/goaHI2uaBfPjdjGI/+AK2CRMK0UNuIc5r3
 Hs7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IKS5gbVC5TKkwCxvfzNBNsteWO3XdewF6O03i9WkL2k=;
 b=oshXn3r6NzT9MZUXjohlGP5E89y9HA1Ak0f03zMBB1QhZerZ0GIIdHMEmm6gDQA3vb
 02ZnEbL+xQWR/qqmsUa6ZRLnDAFwwXqXcwiLDd5jM/OMLkMRCrO/D1U24/iuTUjR1RsM
 4lPStG5RvFy8Min92KjE6eFzmyDlHOe1Au4pYCz8A7dck9zefT+cuzgHdWN4LJAswowx
 bfUB48LsQvzzHKKg7hMrRVDWnrsP8douObkNNBOdpEx6H0sXx2E+Qrka3VBynuDG9xzc
 mB9PWuxyyaoIwrm+RwhnBllnPY1lHkpbpZTd+Llxh4bDeELYKvydVx4x7zCcT6MLQdj4
 AVcw==
X-Gm-Message-State: AOAM533vxS25882dOZzsm2dm5rH/0sYV3/b77fkJdYuga7EfxcGjLzxJ
 lyTupHXqHcPGvcAYDWIR6LY=
X-Google-Smtp-Source: ABdhPJyI82V82+l/ssP/+iIgPP/zZ/m2yvYHRt5DKM+YO1MLiDdz1hIGSEuVlz+HftMFW6T0eRteDg==
X-Received: by 2002:a17:906:4784:b0:6ff:34ea:d824 with SMTP id
 cw4-20020a170906478400b006ff34ead824mr17564455ejc.526.1653981992512; 
 Tue, 31 May 2022 00:26:32 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 m8-20020a056402430800b0042de29d8fc0sm701315edc.94.2022.05.31.00.26.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 May 2022 00:26:31 -0700 (PDT)
Message-ID: <cdb07cb9-4705-5b63-4f40-a44a6f735f38@redhat.com>
Date: Tue, 31 May 2022 09:26:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 1/8] hw/cxl: Make the CXL fixed memory window setup a
 machine parameter.
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
 <20220530134514.31664-2-Jonathan.Cameron@huawei.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220530134514.31664-2-Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
> +    object_property_add(obj, "cxl-fmw", "CXLFixedMemoryWindow",
> +                        machine_get_cfmw, machine_set_cfmw,
> +                        NULL, state);
> +    object_property_set_description(obj, "cxl-fmw",
> +                                    "CXL Fixed Memory Window");

Perhaps "CML fixed memory windows (array)" or something like that?

Paolo

