Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C54A4007A8
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 23:57:56 +0200 (CEST)
Received: from localhost ([::1]:36452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMHC7-00020T-8L
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 17:57:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1mMHAM-0000Aa-Iv
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 17:56:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1mMHAL-0005KY-3j
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 17:56:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630706164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1TPvNnBbj6sk2BTaVEgfsDo5C+JoVGrFowUMHevPFWg=;
 b=KDjxIQxcAGk8xP41MjXOSKiwENnta3AjODkaMox6U0ysMaTZy8RAJ0vougEE3DY6poHoeZ
 7qH1s1ptx8zj//ZrpimQxHKzA5khC0DJVfbUoteCZQRnXEAilnfFuw82nh/GiwCNFhc6wU
 86Jq8wSpNN+v3wmaRuZtDb7yeS27vUo=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-262-VkLsbfbBNNy53yp7WImADg-1; Fri, 03 Sep 2021 17:56:01 -0400
X-MC-Unique: VkLsbfbBNNy53yp7WImADg-1
Received: by mail-oo1-f70.google.com with SMTP id
 bc36-20020a05682016a400b0028c8e8a2746so177218oob.5
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 14:56:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=1TPvNnBbj6sk2BTaVEgfsDo5C+JoVGrFowUMHevPFWg=;
 b=IpSprNQQELn/RDIJwhnUb9V8hBptDRr320t9S81vSHMeObnwCKzdiSLdjP9fgrfc3e
 gZnCKo9m4y1s7+uEJnrcFt1zZB4KBSnMO4eJmoZQrm6L/+ECUXqFC/D0r8eYVMboApoU
 ESMheKoQZzJh/eCaL9+4oDWxAp9iNTA2+SakS4O6gaCLKC+nVv4lSLZm0enXMJt5Sq67
 vnv1/He2ylKe4bx/RmXEAQ07D9WeZcIT10QWuye4RmT4XeIqeiISUsb9le64f4VwboPv
 3AfwfOlSDdcIMEt9yEBnYXXjfusH7H5sMtgfyDG8pNlNwz6Sti4He3t+Qb0UFo/W4m7P
 S3WQ==
X-Gm-Message-State: AOAM533FPrr18SV3Iobo+BCBs5KTbaMBM3P1N2C0obWRh0sxVDBa1KaT
 28yHVMdvGMeGeMMUuEu8JPk72sEtbI7dwfVKT2Mi9CX2Am1+7ZMWF5l35tYkvSJXWRV37LCIy+q
 JutWAKRq5vaRffeI=
X-Received: by 2002:a9d:6e81:: with SMTP id a1mr1056546otr.248.1630706160606; 
 Fri, 03 Sep 2021 14:56:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLWYrW4S3lR/0cfE4Q5aXjXyf6TBejSzXvtB7xb4V1wpvfgad/X0/HZ+VW23hO1UQmfH/erQ==
X-Received: by 2002:a9d:6e81:: with SMTP id a1mr1056536otr.248.1630706160414; 
 Fri, 03 Sep 2021 14:56:00 -0700 (PDT)
Received: from redhat.com ([198.99.80.109])
 by smtp.gmail.com with ESMTPSA id w6sm127635otp.3.2021.09.03.14.55.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 14:56:00 -0700 (PDT)
Date: Fri, 3 Sep 2021 15:55:59 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: "Longpeng(Mike)" <longpeng2@huawei.com>
Subject: Re: [PATCH 2/5] msix: simplfy the conditional in
 msix_set/unset_vector_notifiers
Message-ID: <20210903155559.17d0d593.alex.williamson@redhat.com>
In-Reply-To: <20210825075620.2607-3-longpeng2@huawei.com>
References: <20210825075620.2607-1-longpeng2@huawei.com>
 <20210825075620.2607-3-longpeng2@huawei.com>
Organization: Red Hat
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: mst@redhat.com, qemu-devel@nongnu.org, arei.gonglei@huawei.com,
 huangzhichao@huawei.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 25 Aug 2021 15:56:17 +0800
"Longpeng(Mike)" <longpeng2@huawei.com> wrote:

> 'msix_function_masked' is kept pace with the device's config,

s/pace/synchronized/?

> we can use it to replace the complex conditional in
> msix_set/unset_vector_notifiers.
> 
> poll_notifier should be reset to NULL in the error path in
> msix_set_vector_notifiers, fix it incidentally.

Agree with Philippe, separate patch.
 
> Signed-off-by: Longpeng(Mike) <longpeng2@huawei.com>
> ---
>  hw/pci/msix.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/pci/msix.c b/hw/pci/msix.c
> index ae9331c..8057709 100644
> --- a/hw/pci/msix.c
> +++ b/hw/pci/msix.c
> @@ -592,8 +592,7 @@ int msix_set_vector_notifiers(PCIDevice *dev,
>      dev->msix_vector_release_notifier = release_notifier;
>      dev->msix_vector_poll_notifier = poll_notifier;
>  
> -    if ((dev->config[dev->msix_cap + MSIX_CONTROL_OFFSET] &
> -        (MSIX_ENABLE_MASK | MSIX_MASKALL_MASK)) == MSIX_ENABLE_MASK) {
> +    if (!dev->msix_function_masked) {
>          for (vector = 0; vector < dev->msix_entries_nr; vector++) {
>              ret = msix_set_notifier_for_vector(dev, vector);
>              if (ret < 0) {
> @@ -612,6 +611,7 @@ undo:
>      }
>      dev->msix_vector_use_notifier = NULL;
>      dev->msix_vector_release_notifier = NULL;
> +    dev->msix_vector_poll_notifier = NULL;
>      return ret;
>  }
>  
> @@ -622,8 +622,7 @@ void msix_unset_vector_notifiers(PCIDevice *dev)
>      assert(dev->msix_vector_use_notifier &&
>             dev->msix_vector_release_notifier);
>  
> -    if ((dev->config[dev->msix_cap + MSIX_CONTROL_OFFSET] &
> -        (MSIX_ENABLE_MASK | MSIX_MASKALL_MASK)) == MSIX_ENABLE_MASK) {
> +    if (!dev->msix_function_masked) {
>          for (vector = 0; vector < dev->msix_entries_nr; vector++) {
>              msix_unset_notifier_for_vector(dev, vector);
>          }


