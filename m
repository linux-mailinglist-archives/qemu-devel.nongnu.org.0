Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0675D46D10C
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Dec 2021 11:31:51 +0100 (CET)
Received: from localhost ([::1]:46130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muuEn-0003W1-IQ
	for lists+qemu-devel@lfdr.de; Wed, 08 Dec 2021 05:31:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1muuDn-0002eR-A2
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 05:30:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53389)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1muuDk-0002VJ-M6
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 05:30:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638959443;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nFLvTdLLgJdJ+8hfg5MAV9SEj87wM7ur8FtX5wKRGG8=;
 b=KUU8JPkJbO8mXg9v85tmEKs5KbneI1RhRAAczWwuFVA7pHgE58MMedULWXbH5rtAqfeCxZ
 JVtVlHJY/3Vjxl6D966BNy1ULxUqxr3fMKh47Nf7MuuoebEUUVyJS+vPg3TQ1zpxbDY0R/
 TrUtJygMpEnsq917aP2y7DkniE9KtKA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-541-DJbT7roMMRmPiT625yku7w-1; Wed, 08 Dec 2021 05:30:42 -0500
X-MC-Unique: DJbT7roMMRmPiT625yku7w-1
Received: by mail-wm1-f71.google.com with SMTP id
 145-20020a1c0197000000b0032efc3eb9bcso2823328wmb.0
 for <qemu-devel@nongnu.org>; Wed, 08 Dec 2021 02:30:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nFLvTdLLgJdJ+8hfg5MAV9SEj87wM7ur8FtX5wKRGG8=;
 b=p+k9E09/HtLO3VV+LP3mplLwNitlQ2ve35bttF9Gslx68/coK9rshveTy9mFiV7HmA
 wO6wUl3e5Ku2YTKqtjyCbuGL6P7dUkeDdFU0IbJxpvSQu0Wp2hv6LwGxHg7yEuX4DL4a
 LsK8mtKkys33YL+xxZAukRlUjxlacT82l7ufrnW82yto+ot8vq6Hod2W/QEvrL10W/A9
 SBHapOzNzmVD3qwr263LlhV5cnOciwIOE3aTIz3mcjKNs3RgDPsIOAER+/eST7tCdoru
 8dwh/enY/MwZmFYONJRxiXQdvf03BETy1ugnD2iQMz4eI1+ZHJp+AUnfdtcDm097FQj3
 21qg==
X-Gm-Message-State: AOAM531RPuImoOcq6yf6CxBPmc5zCiVD28N7uPxl0nttUoXkBO5jdGDV
 MnZFiJPuQaK08+PnmW1Z3MDhZDrpqPE3ffR6XPhML1WH6WqkcCc57u57gl3EHFIhaPCdykzhBzc
 ajGsshJCoSAuP9IQ=
X-Received: by 2002:a5d:6101:: with SMTP id v1mr59703851wrt.598.1638959441110; 
 Wed, 08 Dec 2021 02:30:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxGWtan1SHhwgUWFImrM3l8CbHw6BLDBYjHCZ9PClhi0QBXTuoFfZId+a5LuC7mNd50LNKlag==
X-Received: by 2002:a5d:6101:: with SMTP id v1mr59703815wrt.598.1638959440855; 
 Wed, 08 Dec 2021 02:30:40 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id o4sm6411525wmq.31.2021.12.08.02.30.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Dec 2021 02:30:40 -0800 (PST)
Message-ID: <cea4e291-0537-bf15-38c7-7c9385427ab1@redhat.com>
Date: Wed, 8 Dec 2021 11:30:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 01/12] s390x/pci: use a reserved ID for the default PCI
 group
To: Matthew Rosato <mjrosato@linux.ibm.com>, qemu-s390x@nongnu.org
References: <20211207210425.150923-1-mjrosato@linux.ibm.com>
 <20211207210425.150923-2-mjrosato@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20211207210425.150923-2-mjrosato@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.44, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: farman@linux.ibm.com, kvm@vger.kernel.org, pmorel@linux.ibm.com,
 schnelle@linux.ibm.com, cohuck@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, pasic@linux.ibm.com, alex.williamson@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, david@redhat.com,
 borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/12/2021 22.04, Matthew Rosato wrote:
> The current default PCI group being used can technically collide with a
> real group ID passed from a hostdev.  Let's instead use a group ID that
> comes from a special pool (0xF0-0xFF) that is architected to be reserved
> for simulated devices.

Maybe mention that this is not a problem for migration since zPCI currently 
can't be migrated anyway (as mentioned in the discussion of an earlier 
version of this patch)

Acked-by: Thomas Huth <thuth@redhat.com>


> Fixes: 28dc86a072 ("s390x/pci: use a PCI Group structure")
> Reviewed-by: Eric Farman <farman@linux.ibm.com>
> Reviewed-by: Pierre Morel <pmorel@linux.ibm.com>
> Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
> ---
>   include/hw/s390x/s390-pci-bus.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/hw/s390x/s390-pci-bus.h b/include/hw/s390x/s390-pci-bus.h
> index aa891c178d..2727e7bdef 100644
> --- a/include/hw/s390x/s390-pci-bus.h
> +++ b/include/hw/s390x/s390-pci-bus.h
> @@ -313,7 +313,7 @@ typedef struct ZpciFmb {
>   } ZpciFmb;
>   QEMU_BUILD_BUG_MSG(offsetof(ZpciFmb, fmt0) != 48, "padding in ZpciFmb");
>   
> -#define ZPCI_DEFAULT_FN_GRP 0x20
> +#define ZPCI_DEFAULT_FN_GRP 0xFF
>   typedef struct S390PCIGroup {
>       ClpRspQueryPciGrp zpci_group;
>       int id;
> 


