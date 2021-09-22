Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE7F414AAC
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 15:38:45 +0200 (CEST)
Received: from localhost ([::1]:60110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT2SR-0004dj-Kd
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 09:38:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1mT2Or-0001wZ-Ue
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 09:35:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34229)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1mT2Oq-0002hZ-5T
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 09:35:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632317699;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mttkPKRIX4s3J9CQU6GKrbZzWqvXCbx8eQuOlji4/Gc=;
 b=GG575tV1zwWAxBibT9hfbp/yGqFsKGV541k8Iyf8oy40fGX99hj0hCm7VbbZPBGvxvC+yQ
 iklwF8p6dtqkODEUfrtJlS67nT0f73gkgXNhoVNCZrmvtFG48Aud0hXTWVXDG2wI2DGbeu
 FwenZqR29kHi3S0jVBQi+8tvt+eZUIA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-244-tGEefa-fNZOEE5_rRzyvUg-1; Wed, 22 Sep 2021 09:34:58 -0400
X-MC-Unique: tGEefa-fNZOEE5_rRzyvUg-1
Received: by mail-wr1-f70.google.com with SMTP id
 c2-20020adfa302000000b0015e4260febdso2141985wrb.20
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 06:34:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mttkPKRIX4s3J9CQU6GKrbZzWqvXCbx8eQuOlji4/Gc=;
 b=XwKLooXV+ixN6sze0mX7HHBXrzwUKsfMujhN5OGMaFZ8o8NUDDKsfiQvKAVgdFuBKJ
 JKHtEhRqM3/f8Eo4mdS1uPPcmxzsr9l/wUM9Z3lNGtKcJag1JG7ZY29nCKM+FakpIHEM
 we1+QWitGPbZr/YAPtNlRtDtIDkCVBOsK05Y+5kpP0d3QOOsvjAzbXiaOZ7CQgTDycpz
 jOHxUcPGvjiniN+7MJ0xplpVyEkkdXgxrb4HVduNRDVvMkOLT5Oiy6ounLFm2jLOilWy
 +Pyjphv8ubW4IjBGbsx2FhTsxkMMAYBDRjtUXV6H0THVGuSX9tQcU9UXa8lcnTuuuout
 ItIQ==
X-Gm-Message-State: AOAM530psog/H1u10YmN/8zB7tCXRZFVCBhKfz8zi6Ut2roxGkhZbUeo
 xCLNByJVBjkXY4zoQFGBVe7MAwYZZ1ILSC9umfViWIDycfAY9mP6RHGYX0D7htedYnn83GpRut/
 N0CgFD9bbJjc1ipo=
X-Received: by 2002:a5d:43cc:: with SMTP id v12mr42605890wrr.329.1632317696949; 
 Wed, 22 Sep 2021 06:34:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZ7LtCNUi8bGHm96Pi+pimGgVoM0ndyVABCvmh38RmCdY17zuy8IY6vPBjEDPgMwAg4tlH8A==
X-Received: by 2002:a5d:43cc:: with SMTP id v12mr42605864wrr.329.1632317696803; 
 Wed, 22 Sep 2021 06:34:56 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id n66sm2046328wmn.2.2021.09.22.06.34.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 06:34:56 -0700 (PDT)
Subject: Re: [PATCH v3 35/35] acpi: AcpiGenericAddress no longer used to
 map/access fields of MMIO, drop packed attribute
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20210907144814.741785-1-imammedo@redhat.com>
 <20210907144814.741785-36-imammedo@redhat.com>
From: Eric Auger <eauger@redhat.com>
Message-ID: <a66e2316-2e1c-d07a-2e9a-9206c7fc732b@redhat.com>
Date: Wed, 22 Sep 2021 15:34:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210907144814.741785-36-imammedo@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eauger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 9/7/21 4:48 PM, Igor Mammedov wrote:
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  include/hw/acpi/acpi-defs.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
> index ee733840aa..c97e8633ad 100644
> --- a/include/hw/acpi/acpi-defs.h
> +++ b/include/hw/acpi/acpi-defs.h
> @@ -55,7 +55,7 @@ struct AcpiGenericAddress {
>      uint8_t access_width;    /* ACPI 3.0: Minimum Access size (ACPI 3.0),
>                                  ACPI 2.0: Reserved, Table 5-1 */
>      uint64_t address;        /* 64-bit address of struct or register */
> -} QEMU_PACKED;
> +};
>  
>  typedef struct AcpiFadtData {
>      struct AcpiGenericAddress pm1a_cnt;   /* PM1a_CNT_BLK */
> 


