Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CEAE435FF9
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 13:08:42 +0200 (CEST)
Received: from localhost ([::1]:56398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdVw9-0001fP-Ct
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 07:08:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mdVuY-0007wd-Po
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 07:07:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33350)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mdVuI-00015R-6c
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 07:07:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634814404;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ImLtL258rIvxKjRVuji/sthYnSNDPZ5edxUM28dv/y8=;
 b=YlnUJOWlFcs6k4aFk/SRB6NRdrIAts0XCophAhYabmQ5iwg9Fga00kmpa51DiNDiVxmt1U
 8vDV+TJ9s7D38r+V8TsDfn2GLs9AsAF8K5SY1K/xADOS8QuhkoBgvBj+sp2z952mqazxfK
 qDtafZHFzsG7e+u8oefuqHQ5gGqOdUA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-530-KUQJ6tdRNISAY9cgsyicIA-1; Thu, 21 Oct 2021 07:06:41 -0400
X-MC-Unique: KUQJ6tdRNISAY9cgsyicIA-1
Received: by mail-wm1-f71.google.com with SMTP id
 c5-20020a05600c0ac500b0030dba7cafc9so74766wmr.5
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 04:06:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ImLtL258rIvxKjRVuji/sthYnSNDPZ5edxUM28dv/y8=;
 b=U3CVyieIFUiyNUyh0EKwUoHurhx8vMF8Jzft0RLLu3B6wghFaprN0z6VLFFe1pA7YQ
 KELbeWAPxTTCwmNLBuhEjak89YWBYYxDQbrTIpNLITbcAxeI25uxtpbVbqyEDpNiEQgm
 KrSo9BGy+7ZxjjseUWbwil9tLY0av0v/brD63w90HXvEFyWFJJDvvtivPSuTiSgndxea
 CXKNg8xihBIfvBHyWQ30Eh83O8uG8T39x6eMykCyy2FuTIxTAs493m2d+lAyCVODNJVi
 GEM9wbUr3lr5hlHOK72jfH+tlmoULt07qDkvXRmb/h6k2ireMXjEaNi1zAllNDESCine
 p6kw==
X-Gm-Message-State: AOAM531yLaY1AOWZbrk5II+IgvFi32z6Tl6BvaRThk/Yz2CO9qfqr4A2
 VbbbeBlyTpE9UkXy0PKcsMxOSo24aalgMjIesprbfDQeUniPeyA5k6deRIz5uZTWFn/p5ZvOjGF
 wGWo4A9/hks0FwqY=
X-Received: by 2002:a05:600c:35c2:: with SMTP id
 r2mr5943332wmq.26.1634814400408; 
 Thu, 21 Oct 2021 04:06:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwMZYcPsVYQUjMBwZgUHf3jCyPkpZt3r71JmDcfLhAiXSzuX2d3ogCo2MdJ5zJxPvQjqzgPwQ==
X-Received: by 2002:a05:600c:35c2:: with SMTP id
 r2mr5943293wmq.26.1634814400189; 
 Thu, 21 Oct 2021 04:06:40 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23aba.dip0.t-ipconnect.de. [79.242.58.186])
 by smtp.gmail.com with ESMTPSA id 3sm4567473wms.5.2021.10.21.04.06.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Oct 2021 04:06:39 -0700 (PDT)
Message-ID: <31eb2d00-6d73-8ded-8d92-0aeb08fbffc7@redhat.com>
Date: Thu, 21 Oct 2021 13:06:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 6/8] pci: Use pci_for_each_root_bus() in current code
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
References: <20211021104259.57754-1-peterx@redhat.com>
 <20211021104259.57754-7-peterx@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20211021104259.57754-7-peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.267, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21.10.21 12:42, Peter Xu wrote:
> There're three places that can be rewritten with the pci_for_each_root_bus()
> helper that we just introduced.  De-dup the code.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  hw/arm/virt-acpi-build.c | 31 +++++++++++--------------------
>  hw/i386/acpi-build.c     | 38 ++++++++++----------------------------
>  2 files changed, 21 insertions(+), 48 deletions(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 6cec97352b..54b82aa863 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -263,28 +263,20 @@ struct AcpiIortIdMapping {
>  typedef struct AcpiIortIdMapping AcpiIortIdMapping;
>  
>  /* Build the iort ID mapping to SMMUv3 for a given PCI host bridge */
> -static int
> -iort_host_bridges(Object *obj, void *opaque)
> +static void
> +iort_host_bridges(PCIBus *bus, void *opaque)

^ I never understood the use of the line break within a function
declaration+definition, especially if everything just fits into a single
line. If it's already there, it's most probably in-line with the QEMU
coding style.

LGTM

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


