Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C501A436062
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 13:35:05 +0200 (CEST)
Received: from localhost ([::1]:42694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdWLg-0004zK-DJ
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 07:35:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mdWJl-00041D-Ib
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 07:33:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mdWJh-0005Ep-9q
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 07:33:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634815979;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lmdBzIzpEyO22jKUjbSOyf0y95rm49so3UDBg+KR5rk=;
 b=L6hrZH+rp+Hh1Uxb9wawiaxXu0fTQX3dYM1b3xvncvQWRyPsZ2kMrHlh1ZIjaF8NV4e4++
 AiABCPclc99QPlxZSuXT4mpWelrCUNjUVISy4ZPN41syK4QQc8jiB8QwqAFQexfoPS3dg2
 udarBwnWZTUIcZX4IlcFq5J+64qAg0s=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-t1BZ_H9ePj2qfIURQ0nW3g-1; Thu, 21 Oct 2021 07:32:58 -0400
X-MC-Unique: t1BZ_H9ePj2qfIURQ0nW3g-1
Received: by mail-wr1-f70.google.com with SMTP id
 s1-20020adfc541000000b001645b92c65bso87042wrf.6
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 04:32:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=lmdBzIzpEyO22jKUjbSOyf0y95rm49so3UDBg+KR5rk=;
 b=oZEcICzIBSodvuiTtlH+usYEb4hYxYYQ/lnlOB+tjbIO4QPr2pzdhf7TTrUzxRYUiO
 ChGf1EX/OA0T4mle5Z6PVenjhmSwLnx0F6HGRV6wd2MC3eJUsE7QEF9V03ytAiKChhev
 vWEFRyvRvRAsfr0TjUboFVMeFxQP0Q8VuSuxs6+O1WCEw9yRGrdzV3HZTOakrSOyw31j
 c0whAGczNJWkB/s5iQ9yQ0llHm7dv1lpjSRBw/+VG+EseMzPY0tPXGD+uUgENBwGA3XM
 oxVx1TgHmtnOaGAGuniCbieMQDcDdVgtSqP637CPQUMU/bexOWjlzL6rLREQHWnI16fh
 0Tag==
X-Gm-Message-State: AOAM531fv24NwwBZfbsvD7EVGJnyRbmWCZWEr/2Z2EYAwOj8Anw+jER+
 bGuG6+fcBdNdyLBuJDk/qBx6i9V2gABPqUKkdY2HSB1TmU42fg6CUONEHsJ+OF9tFlIRbGyK9Dq
 ESxTthTBtVXPUHY8=
X-Received: by 2002:adf:b19c:: with SMTP id q28mr6599954wra.348.1634815977255; 
 Thu, 21 Oct 2021 04:32:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzUmtjqfChyiKeH+aa9XiYcCKL2SVWXbbY8YNNunIVZxYRX7JgSO0NZqxUNbxWuirJ2shkf6Q==
X-Received: by 2002:adf:b19c:: with SMTP id q28mr6599919wra.348.1634815977038; 
 Thu, 21 Oct 2021 04:32:57 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id n9sm4967113wmq.6.2021.10.21.04.32.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Oct 2021 04:32:56 -0700 (PDT)
Subject: Re: [PATCH 2/8] pci: Export pci_for_each_device_under_bus*()
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
References: <20211021104259.57754-1-peterx@redhat.com>
 <20211021104259.57754-3-peterx@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <aff870b0-9eea-7bfc-f9b4-9b543c9b6831@redhat.com>
Date: Thu, 21 Oct 2021 13:32:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20211021104259.57754-3-peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.867, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Reply-To: eric.auger@redhat.com
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 10/21/21 12:42 PM, Peter Xu wrote:
> They're actually more commonly used than the helper without _under_bus, because
> most callers do have the pci bus on hand.  After exporting we can switch a lot
> of the call sites to use these two helpers.
>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  hw/pci/pci.c         | 10 +++++-----
>  include/hw/pci/pci.h |  5 +++++
>  2 files changed, 10 insertions(+), 5 deletions(-)
>
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index 1ab2b78321..6b834cace5 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -1654,9 +1654,9 @@ static const pci_class_desc pci_class_descriptions[] =
>      { 0, NULL}
>  };
>  
> -static void pci_for_each_device_under_bus_reverse(PCIBus *bus,
> -                                                  pci_bus_dev_fn fn,
> -                                                  void *opaque)
> +void pci_for_each_device_under_bus_reverse(PCIBus *bus,
> +                                           pci_bus_dev_fn fn,
> +                                           void *opaque)
>  {
>      PCIDevice *d;
>      int devfn;
> @@ -1679,8 +1679,8 @@ void pci_for_each_device_reverse(PCIBus *bus, int bus_num,
>      }
>  }
>  
> -static void pci_for_each_device_under_bus(PCIBus *bus,
> -                                          pci_bus_dev_fn fn, void *opaque)
> +void pci_for_each_device_under_bus(PCIBus *bus,
> +                                   pci_bus_dev_fn fn, void *opaque)
>  {
>      PCIDevice *d;
>      int devfn;
> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> index 8e2d80860b..437eabe609 100644
> --- a/include/hw/pci/pci.h
> +++ b/include/hw/pci/pci.h
> @@ -465,6 +465,11 @@ void pci_for_each_device(PCIBus *bus, int bus_num,
>  void pci_for_each_device_reverse(PCIBus *bus, int bus_num,
>                                   pci_bus_dev_fn fn,
>                                   void *opaque);
> +void pci_for_each_device_under_bus(PCIBus *bus,
> +                                   pci_bus_dev_fn fn, void *opaque);
> +void pci_for_each_device_under_bus_reverse(PCIBus *bus,
> +                                           pci_bus_dev_fn fn,
> +                                           void *opaque);
>  void pci_for_each_bus_depth_first(PCIBus *bus,
>                                    void *(*begin)(PCIBus *bus, void *parent_state),
>                                    void (*end)(PCIBus *bus, void *state),
Reviewed-by: Eric Auger <eric.auger@redhat.com>


Eric


