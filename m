Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71FFF51AED4
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 22:12:27 +0200 (CEST)
Received: from localhost ([::1]:54228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmLMH-0005st-7k
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 16:12:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nmLLK-0005Dd-3d
 for qemu-devel@nongnu.org; Wed, 04 May 2022 16:11:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60194)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nmLLI-0006sc-6V
 for qemu-devel@nongnu.org; Wed, 04 May 2022 16:11:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651695082;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=g8w8l8ma28D4DTNwuvPt+cKMYwBDuhQgRyZ4PAYyzes=;
 b=StjLhsWdC7/EXf1ZHSLAKZJPt5WLk8ZivfQgdGmtbRZ95jrTl/bDt3l7waEvjQQmuLmtb1
 Xe9z/lIGLfG4C59kaxblwBCCAl8DDH4o9iLzuHeaCPMCbXtXJWZo77MVKtDcSVPfklo5dp
 V+a+mjJ9McOb114E4m4snrETCNHE7Uc=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-194-I8p_LE-kOs2xj1sq2_ndWg-1; Wed, 04 May 2022 16:11:21 -0400
X-MC-Unique: I8p_LE-kOs2xj1sq2_ndWg-1
Received: by mail-il1-f197.google.com with SMTP id
 q6-20020a056e0215c600b002c2c4091914so1269746ilu.14
 for <qemu-devel@nongnu.org>; Wed, 04 May 2022 13:11:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=g8w8l8ma28D4DTNwuvPt+cKMYwBDuhQgRyZ4PAYyzes=;
 b=TGUPhexw03ZHRveKcpvC3kQudBILqtDYNFRMJFrPoQ/wenrZOm4/JuEl3f/hHwgmhw
 XX8rBZMEe9B6h3TNk4qoIHlRIhg39B1f8XfLM5GgwkChZGRI/VI1d/nGvosoBC7w5y/R
 g6k40HXtzxIxS9i0FVKKbTA+A9fyrT+I2T1KLbGf0zrf9SUELqGfrZfaVMdQvVMnLS5F
 hBpji1th/kscAHrG5yeGB3hlI/endNyLEidCAlGuu9eWo6SBRk+pR4y32Fafr8yKZwKM
 w7renCCI6sZkcpMZfGXwubSEfsZcuM+zI/BPkWc/QKeuEKNciCZY24nbGXpgi0B9s1QE
 yHPw==
X-Gm-Message-State: AOAM532XPUm2LI9WNOrtOKomYGacwFLeATiq0xef/nmwkuzwlwGyK2DN
 u8XZKpgoQR2UzDPdbvWyAWKXfmsKhJ1mH2Pyzpo552kMMqdU89o6m482/PksAMNeWRwo9R+xWHU
 Hvhojix4U59pcivU=
X-Received: by 2002:a6b:7845:0:b0:64c:9acc:9f1a with SMTP id
 h5-20020a6b7845000000b0064c9acc9f1amr8823478iop.103.1651695080517; 
 Wed, 04 May 2022 13:11:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxXxJw8HskfKMhb2KmHeGVSapHKE///TS2gM+2yR+mKxK0u2oG3LMHfrNfO5rQ1xcrxh7e6RA==
X-Received: by 2002:a6b:7845:0:b0:64c:9acc:9f1a with SMTP id
 h5-20020a6b7845000000b0064c9acc9f1amr8823452iop.103.1651695080319; 
 Wed, 04 May 2022 13:11:20 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 q19-20020a0566380ed300b0032b3a78179csm4960800jas.96.2022.05.04.13.11.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 13:11:20 -0700 (PDT)
Date: Wed, 4 May 2022 16:11:17 -0400
From: Peter Xu <peterx@redhat.com>
To: Joao Martins <joao.m.martins@oracle.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Jason Wang <jasowang@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Nicolin Chen <nicolinc@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>,
 Kevin Tian <kevin.tian@intel.com>, Yi Liu <yi.l.liu@intel.com>,
 Eric Auger <eric.auger@redhat.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>,
 "John G . Johnson" <john.g.johnson@oracle.com>, kvm@vger.kernel.org
Subject: Re: [PATCH RFC 04/10] intel_iommu: Second Stage Access Dirty bit
 support
Message-ID: <YnLd5b3GssL0l/uE@xz-m1.local>
References: <20220428211351.3897-1-joao.m.martins@oracle.com>
 <20220428211351.3897-5-joao.m.martins@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220428211351.3897-5-joao.m.martins@oracle.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hi, Joao,

On Thu, Apr 28, 2022 at 10:13:45PM +0100, Joao Martins wrote:
> +/* Get the content of a spte located in @base_addr[@index] */
> +static uint64_t vtd_set_slpte(dma_addr_t base_addr, uint32_t index,
> +                              uint64_t slpte)
> +{
> +
> +    if (dma_memory_write(&address_space_memory,
> +                         base_addr + index * sizeof(slpte), &slpte,
> +                         sizeof(slpte), MEMTXATTRS_UNSPECIFIED)) {
> +        slpte = (uint64_t)-1;
> +        return slpte;
> +    }
> +
> +    return vtd_get_slpte(base_addr, index);
> +}

Could I ask when the write succeeded, why need to read slpte again?

Thanks,

-- 
Peter Xu


