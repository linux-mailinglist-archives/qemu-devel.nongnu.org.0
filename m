Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B31576B7140
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 09:38:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbdg9-0007sV-Du; Mon, 13 Mar 2023 04:37:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pbdg6-0007qf-3C
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 04:37:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pbdg1-0002aX-Mc
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 04:37:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678696625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6zIhIwJRcP1iPnfrY3/CIRWd2CdyIHmWkO4f0VIbOmk=;
 b=IaCbibAdz8DUl65AF8+GPzqEswFJ4BmowRUpX3kKr7rktbjxCjoq8kDaYFGEPHk30k2NJB
 xlZEaxTQQpawIF+QW4N0vLv2ThSDY83IJoB0+hL9a0IG5fkCTfzT+6oBvdzJ/6CU8PXbkX
 goJEbyNtIt3jOtd6qADEz33O+1S2eMM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-492-46eJVacdOSCjScmpJsP4UQ-1; Mon, 13 Mar 2023 04:37:03 -0400
X-MC-Unique: 46eJVacdOSCjScmpJsP4UQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 y11-20020a056000168b00b002ce179d1b90so1921125wrd.23
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 01:37:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678696622;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6zIhIwJRcP1iPnfrY3/CIRWd2CdyIHmWkO4f0VIbOmk=;
 b=x+ooItblzEbOq2u+rCh1tSLKP0teHIqeRWZEBMxoyqQazSlT/mwOtYZsK30UIVsrXT
 A+0v91n2b4gNBXOrM2WwuO5NG5ypRtqUNOFXd64p2+M5xxxcGmjmSlpb++vldIWxLyY6
 0g/joMiiPnB5Peqg8BxeeVGfFDK55dcSfF1g+S0jBndeqCs0DHXPdeZwSJZMazr6LmvG
 /CZwFzyImm059VfzCwnE44jJGTwz4rVumKkEh5CYgQgisN6rEUzg3/wxEK7qpRXfasMI
 ZkX+7JpPZGrmQcvy6vvtpBsnwBZQdVJCh2LzSGD6HnQm0e0RybFYVrjndD5BAEmJotln
 tEdg==
X-Gm-Message-State: AO0yUKUuCFuE0Rw3Kw1KYuCHWZpNjEVYmbO1zN2naaMgK/HqN8cXkQqg
 nvpXoRd/OJqhVqAL8cFwjfo5j3A0mOcVPFB0+2IKCCk4IhkiXFLrjPcCfT/uGkdCcf0xVOg1W00
 0I4j1ihzx4FCihFY=
X-Received: by 2002:a05:600c:3503:b0:3ea:e7f6:f8fa with SMTP id
 h3-20020a05600c350300b003eae7f6f8famr9724326wmq.10.1678696622462; 
 Mon, 13 Mar 2023 01:37:02 -0700 (PDT)
X-Google-Smtp-Source: AK7set+4/7XxPYFRlYEJxAAZ74rBfdN5KwUVp9jHukPT5Ap113GRmkvV+1G2Jx9R8nYm4fvwkPY68w==
X-Received: by 2002:a05:600c:3503:b0:3ea:e7f6:f8fa with SMTP id
 h3-20020a05600c350300b003eae7f6f8famr9724302wmq.10.1678696622218; 
 Mon, 13 Mar 2023 01:37:02 -0700 (PDT)
Received: from [192.168.0.2] (ip-109-43-179-26.web.vodafone.de.
 [109.43.179.26]) by smtp.gmail.com with ESMTPSA id
 y22-20020a7bcd96000000b003ecc64edf7esm7166718wmj.39.2023.03.13.01.37.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Mar 2023 01:37:01 -0700 (PDT)
Message-ID: <b8d26003-c872-f851-88b5-8d38f1b8f2c4@redhat.com>
Date: Mon, 13 Mar 2023 09:36:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v7 5/6] memory: Allow disabling re-entrancy checking per-MR
Content-Language: en-US
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Bandan Das <bsd@redhat.com>, "Edgar E . Iglesias"
 <edgar.iglesias@gmail.com>, Darren Kenny <darren.kenny@oracle.com>,
 Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Jon Maloy <jmaloy@redhat.com>,
 Siqi Chen <coc.cyqh@gmail.com>
References: <20230313082417.827484-1-alxndr@bu.edu>
 <20230313082417.827484-6-alxndr@bu.edu>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230313082417.827484-6-alxndr@bu.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 13/03/2023 09.24, Alexander Bulekov wrote:
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> ---
>   include/exec/memory.h | 3 +++
>   softmmu/memory.c      | 2 +-
>   2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index 6fa0b071f0..5154b123d8 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -791,6 +791,9 @@ struct MemoryRegion {
>       unsigned ioeventfd_nb;
>       MemoryRegionIoeventfd *ioeventfds;
>       RamDiscardManager *rdm; /* Only for RAM */
> +
> +    /* For devices designed to perform re-entrant IO into their own IO MRs */
> +    bool disable_reentrancy_guard;
>   };
>   
>   struct IOMMUMemoryRegion {
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index 57bf18a257..3018fa2edb 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -544,7 +544,7 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
>       }
>   
>       /* Do not allow more than one simultanous access to a device's IO Regions */
> -    if (mr->owner &&
> +    if (mr->owner && !mr->disable_reentrancy_guard &&
>           !mr->ram_device && !mr->ram && !mr->rom_device && !mr->readonly) {
>           dev = (DeviceState *) object_dynamic_cast(mr->owner, TYPE_DEVICE);
>           if (dev) {

Reviewed-by: Thomas Huth <thuth@redhat.com>


