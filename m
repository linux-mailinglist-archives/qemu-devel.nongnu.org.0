Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B85414562
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 11:40:53 +0200 (CEST)
Received: from localhost ([::1]:44346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSykG-00069t-DA
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 05:40:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1mSyi8-0004qt-Le
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 05:38:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1mSyi7-00008k-4j
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 05:38:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632303518;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TeRIh26OM0uQx13cf9b6lUW/cFh3nuMY3za8BjrwwgI=;
 b=W8lmxlHAM2B5jJgkKF+MxBnsYhHqITvq8J7/ubdXutwMGZfB93jkT2bR1Lg0vWYDvF7Z5Y
 gcuyBRw++erKyG9XBX44ezaI2qBslXXbdzqal+jJyTmGmLmFGQ+dw3LdcHXFIgzZXLgC8f
 WWqpxFvA2e1970kVtw2Qmn9vCCbvQS4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175-QOsj-yWvMOG_Uye0Md762Q-1; Wed, 22 Sep 2021 05:38:37 -0400
X-MC-Unique: QOsj-yWvMOG_Uye0Md762Q-1
Received: by mail-wr1-f70.google.com with SMTP id
 u10-20020adfae4a000000b0016022cb0d2bso1580982wrd.19
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 02:38:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TeRIh26OM0uQx13cf9b6lUW/cFh3nuMY3za8BjrwwgI=;
 b=vQcitQa6I/DAN1WPLf0/vFIQNOyQ1sKTbnsl6YS4y6JH134hvcSIx+l4hktn2ciEEM
 eRm+OwnuL9L7ZJ+fMd2MBKcF261l1ggmGsd/S9imOmiGiPrhvW80SysQ5XKTOviLyQxn
 urFzpO4IvzMXrvbN5UbVfqrBtn/8M2hg098Smbt3/ZEFn6Rf+XjngdxwmE3KdgjVWjQd
 uI8trVl2D1IA471g/4fLqm34XJg7NAwyZ1GoyxiaeM0mWKra4P1PbFfylRf6pv6TvVRP
 4H0AaKTs8Mbn8/vhpzQFS8QDgTQ3sAZA3gECDwrBsY3mQ8JYYsRlmSLbmRNqEOucayxR
 i4/g==
X-Gm-Message-State: AOAM5309+zRe1wEgjQ+pDBzqQdhe21bZcMnFV7lRyY6VPMbw2M+4x2EF
 ejppnOabIbal50s/6RX0onlJwElEAS7HUE9OGHey3XgK7WX45sLachjO25aIXoIlQ0qyVfGg31p
 qg+6l54QmBSj5SlE=
X-Received: by 2002:adf:f0c7:: with SMTP id x7mr40547091wro.432.1632303516199; 
 Wed, 22 Sep 2021 02:38:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwRFV4qnGWR8XIMFiJUXVHA6D4gV9BvnCdn8eBHS4uXDWggvqLQD4LKzrP/kg1eA1jbgDl+dQ==
X-Received: by 2002:adf:f0c7:: with SMTP id x7mr40547079wro.432.1632303516060; 
 Wed, 22 Sep 2021 02:38:36 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id h18sm1612850wrb.33.2021.09.22.02.38.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 02:38:35 -0700 (PDT)
Subject: Re: [PATCH v3 22/35] acpi: x86: remove dead code
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20210907144814.741785-1-imammedo@redhat.com>
 <20210907144814.741785-23-imammedo@redhat.com>
From: Eric Auger <eauger@redhat.com>
Message-ID: <dd7cc1b6-398d-8523-1658-924c0b1c1b21@redhat.com>
Date: Wed, 22 Sep 2021 11:38:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210907144814.741785-23-imammedo@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eauger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.475,
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
> ---
>  include/hw/acpi/acpi-defs.h | 13 -------------
>  1 file changed, 13 deletions(-)
> 
> diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
> index c7fa5caa06..af4fa412a5 100644
> --- a/include/hw/acpi/acpi-defs.h
> +++ b/include/hw/acpi/acpi-defs.h
> @@ -163,19 +163,6 @@ struct AcpiFacsDescriptorRev1 {
>  } QEMU_PACKED;
>  typedef struct AcpiFacsDescriptorRev1 AcpiFacsDescriptorRev1;
>  
> -/*
> - * Differentiated System Description Table (DSDT)
> - */
> -
> -/*
> - * MADT values and structures
> - */
> -
> -/* Values for MADT PCATCompat */
> -
> -#define ACPI_DUAL_PIC                0
> -#define ACPI_MULTIPLE_APIC           1
> -
>  /* Values for Type in APIC sub-headers */
>  
>  #define ACPI_APIC_PROCESSOR          0
> 

Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric


