Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B85343CB3F
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 15:57:18 +0200 (CEST)
Received: from localhost ([::1]:53772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfjQb-0000OL-Dq
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 09:57:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mfj6f-0004AX-JU
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 09:36:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mfj6d-00016Y-0s
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 09:36:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635341797;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1SrQ6jaJilOp1yrFZ9zv1K0mKYN/sJK782ufNt11Lqg=;
 b=eNWX+tgjXrkzi2l47EV/1fyYfuM+qr9WFQ4Py7Nf0H16uOHESNe0EuCmFXC3sP6g8xz4ty
 uwRptUUs1Y9/6jkT1OgJEt3CLrrYBw8t7aAqHOkbjNK8KBKhMvyw7h0SWiXd0SuR2v5nIS
 LsRLphGYURvW9eKFCzUIzwGY5xpceKI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-kvrP0l4VNFSXkNmzC56txg-1; Wed, 27 Oct 2021 09:36:34 -0400
X-MC-Unique: kvrP0l4VNFSXkNmzC56txg-1
Received: by mail-wr1-f71.google.com with SMTP id
 c4-20020a056000184400b0016e0cc310b3so680345wri.3
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 06:36:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1SrQ6jaJilOp1yrFZ9zv1K0mKYN/sJK782ufNt11Lqg=;
 b=5T7QMrgAbOgfNF/ZAeygmTBTGiTTl7nPhiJcRv14GyE9a4+WjxusfbcEMjUwkWo1qp
 +X2l7EjZECXD5OWSEIziIkN0Gy/tW4X9lERTv/2afLHMJv5J/BHIPg+XdcoEQiQWvndJ
 ha07Au/i5Pw1lAgXjoqfvCttzmX+E/X8+m0VSHsWGy7oIByzVI5JS7R8KUZGajRSaSos
 vGfO106O+Z7pJkporvVm31F0kLb4rTKpu2nIgFl9rD0glKYhpnTE7YSB+DNQh0ztWu0o
 0fJg3MIIsPZ3Gia2CYl5m07mbPNLjfSxVvVbUKiG+dufKcxrQcnnhbjLbpI6CrddJ1rP
 bq6w==
X-Gm-Message-State: AOAM530AzdZSlJ4XGXFithSBF7uFUN/RMVSxi0JbMSEHBY/o5JKAG6ew
 3ZN9grdF9Y9MkgV/RBtzXAiUFVQNnxvYjerYev3olZe1OzJ+B70LL+o+QX2lSdjYC2tG8Ww6FjB
 zeLZ5XLKh8qfGjeE=
X-Received: by 2002:a5d:59aa:: with SMTP id p10mr40379643wrr.45.1635341793262; 
 Wed, 27 Oct 2021 06:36:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwEOZHXkux47bJsEHIMV3VqdLetz3CsBoRWhuCRjNcgcHCrOfHRroHar5PFK0+IW5n+RlAcsw==
X-Received: by 2002:a5d:59aa:: with SMTP id p10mr40379584wrr.45.1635341793004; 
 Wed, 27 Oct 2021 06:36:33 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id l6sm3788173wmq.17.2021.10.27.06.36.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 06:36:32 -0700 (PDT)
Message-ID: <4ce74e8f-080d-9a0d-1b5b-6f7a7203e2ab@redhat.com>
Date: Wed, 27 Oct 2021 15:36:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v1 02/12] vhost: Return number of free memslots
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20211027124531.57561-1-david@redhat.com>
 <20211027124531.57561-3-david@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211027124531.57561-3-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.847, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Sebastien Boeuf <sebastien.boeuf@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 Hui Zhu <teawater@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/27/21 14:45, David Hildenbrand wrote:
> Let's return the number of free slots instead of only checking if there
> is a free slot. Required to support memory devices that consume multiple
> memslots.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  hw/mem/memory-device.c    | 2 +-
>  hw/virtio/vhost-stub.c    | 2 +-
>  hw/virtio/vhost.c         | 4 ++--
>  include/hw/virtio/vhost.h | 2 +-
>  4 files changed, 5 insertions(+), 5 deletions(-)

> --- a/hw/virtio/vhost-stub.c
> +++ b/hw/virtio/vhost-stub.c
> @@ -2,7 +2,7 @@
>  #include "hw/virtio/vhost.h"
>  #include "hw/virtio/vhost-user.h"
>  
> -bool vhost_has_free_slot(void)
> +unsigned int vhost_get_free_memslots(void)
>  {
>      return true;

       return 0;

>  }


