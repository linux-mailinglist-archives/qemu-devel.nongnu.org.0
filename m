Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CA3480CCC
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Dec 2021 20:30:42 +0100 (CET)
Received: from localhost ([::1]:57516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2IBF-0000lI-4S
	for lists+qemu-devel@lfdr.de; Tue, 28 Dec 2021 14:30:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n2I9I-0008AS-E2
 for qemu-devel@nongnu.org; Tue, 28 Dec 2021 14:28:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n2I9H-0002xB-59
 for qemu-devel@nongnu.org; Tue, 28 Dec 2021 14:28:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640719718;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qzq6ZcjbayTNJfL4IrlU4jb+5rwVP1q8GDO8/MTd9GU=;
 b=FZxefGdzwKyYWCeSpXu7JcJHrVcUVejTcE1ddvSIAv4qSbjPDDgt4tfp6r7uymNVTeuVNu
 TKSSLB370zLR/hBirINy4dSbiE+sUB/saIVLqVMvHE2OkGCSmxOqpfCh1NX/Q1MDo+81So
 UiBE30c07Jg8ADNypNbNAuDb0NUdNEg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-439-mfLFuQaPNRyliGagfVYLLw-1; Tue, 28 Dec 2021 14:28:35 -0500
X-MC-Unique: mfLFuQaPNRyliGagfVYLLw-1
Received: by mail-wm1-f69.google.com with SMTP id
 v62-20020a1cac41000000b0033719a1a714so6538767wme.6
 for <qemu-devel@nongnu.org>; Tue, 28 Dec 2021 11:28:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qzq6ZcjbayTNJfL4IrlU4jb+5rwVP1q8GDO8/MTd9GU=;
 b=CJHLTJoBfYrNDzKcTQ8tTK5pp0WLH+D0gnbhHzmNaNckn26YELvvaMRXhtJsNRB2lx
 oDovwVLmXyRSgmMIFZrh3qFnQnn/SMRlYBMa0acOGHvHPRtRPCGWKKs2sM8BnRnpcCBI
 DNIrFp7lZ9DAJ28EHUq7gAiIdaY1CIytmSCPj49lOzwBw0o5Iy/L7BaYZnOEUtB/+tI+
 urimKiqo7zuvpUjTvO8beu9bu20PZLSmdkuTQ224Sf321wfne2ot7cp2zp1PIOukvmIB
 7CUKAyKGsIwIgP4Xy+1FJujTmPTi9GSmXzKmwsSVZRgFcjsibbUdJARN6u1zOYVamFtA
 O2+w==
X-Gm-Message-State: AOAM532uG8HHxa0g5Ik++o9J3pO6s5xbmAsmiM9dnMvJ8j08opTZZZQR
 rW4U7PV9i7QNjR9wrAaJRmZdr2W6JOK4arOBRD/xtUU7BFnBaXx76H9sdPJiGGkt6rsW1TxckEj
 WRCsnXozmkO3HTFU=
X-Received: by 2002:a05:6000:108e:: with SMTP id
 y14mr17582067wrw.69.1640719714255; 
 Tue, 28 Dec 2021 11:28:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwszwwk05KIJyXGbuTC9UCV8XiBgIewkyHhmbNAyIxDlVTVkDXtIofIeACufMHytvwTekMS5A==
X-Received: by 2002:a05:6000:108e:: with SMTP id
 y14mr17582048wrw.69.1640719714065; 
 Tue, 28 Dec 2021 11:28:34 -0800 (PST)
Received: from [192.168.1.16] (adijon-655-1-69-27.w90-13.abo.wanadoo.fr.
 [90.13.240.27])
 by smtp.gmail.com with ESMTPSA id r9sm19329735wmq.18.2021.12.28.11.28.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Dec 2021 11:28:33 -0800 (PST)
Message-ID: <c91bf7a2-f9c7-a7fd-4d58-88c0e1220533@redhat.com>
Date: Tue, 28 Dec 2021 20:28:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v5 06/14] tests/unit/test-smp-parse: Keep default MIN/MAX
 CPUs in machine_base_class_init
To: Yanan Wang <wangyanan55@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <20211228092221.21068-1-wangyanan55@huawei.com>
 <20211228092221.21068-7-wangyanan55@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211228092221.21068-7-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) DKIMWL_WL_HIGH=-0.573, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.024,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 Markus Armbruster <armbru@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/28/21 10:22, Yanan Wang wrote:
> Most machine types in test-smp-parse will be OK to have the default
> MIN/MAX CPUs except "smp-generic-invalid", let's keep the default
> values in machine_base_class_init which will be inherited. And if
> we hope a different value for a specific machine, modify it in its
> own initialization function.
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  tests/unit/test-smp-parse.c | 16 ++--------------
>  1 file changed, 2 insertions(+), 14 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


