Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79CDF63F765
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 19:20:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0o8h-0006zS-4J; Thu, 01 Dec 2022 13:18:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1p0o8T-0006yX-8G
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 13:18:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1p0o8L-0002Oz-It
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 13:18:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669918683;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UW1nqvoF1pz6jdE5desm9aIdUvLm7uHV5pUohntqSfI=;
 b=JSDVI0yOXfw+NQNeGx/O5hOISSlZNCQkeZICgdnhM57moXKdEj8T4kMT/eInBRdteU1vGV
 dpFfDnjC3Xa+iBZhL95YmZLWMbr+xAV8CUVTeiGyg+Wd22VyHvrlBzLEUW/9YMpTM+P3O7
 TE/HJb49y4BWbCuHDxdg6nBvapO5MIc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-246-_Z3ypo9dObq0ZPDpJiB76w-1; Thu, 01 Dec 2022 13:17:56 -0500
X-MC-Unique: _Z3ypo9dObq0ZPDpJiB76w-1
Received: by mail-wm1-f72.google.com with SMTP id
 h9-20020a1c2109000000b003cfd37aec58so1205415wmh.1
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 10:17:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UW1nqvoF1pz6jdE5desm9aIdUvLm7uHV5pUohntqSfI=;
 b=AncPe8z/FLi0ama1cJ9flyaxyScLYEoIlYjuz/eAaHtCtrKWyISB/GpjGtGc8fW2ZK
 t7uOKUhQuojEflxxZFtC1Yo2OJ8VbAMotvRwrhAGJ0KiuX70gD+oW91rorHsOZ/+i7DE
 /awyuquP5s6ojDw7F4kwvrzid1JkqXae+k1l9piOfP6SE4sQHns6NFQQ13AR/gpRzfhG
 fPtL6FPb1AvsNNH5kego1rB0e8dQ3H0Avmi4QSpck9bzIq8MS4rvCv2/21NsJbYxYyZ9
 sgxd0I3cGtqkyMEA42+BbTmV12aVM4hdvKFsiOXudreUcZYcgR/TGkybCB187YZq1Rn5
 u4kA==
X-Gm-Message-State: ANoB5pkpRwinhCy2XOrosMT/hfeKam81n30vtUKUHYOOyB0ViIgUkmNi
 T1c8U70BkESvk7EjE5io1m5AsAshcb8IRsygScd+kJ3yWeoorIxJhMdLkpikpxDHcSWaCirz8Eq
 Ft0DAXp4uu6JSZSE=
X-Received: by 2002:a05:600c:34c5:b0:3d0:7416:a84c with SMTP id
 d5-20020a05600c34c500b003d07416a84cmr6179306wmq.145.1669918664138; 
 Thu, 01 Dec 2022 10:17:44 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5oN+lNZEQ1FBr20FHLaSMvkBZFhTIkcTluq2kNdmM+rE+J1tjpZWkEQX8FJ9xdSECCINiKUg==
X-Received: by 2002:a05:600c:34c5:b0:3d0:7416:a84c with SMTP id
 d5-20020a05600c34c500b003d07416a84cmr6179286wmq.145.1669918663923; 
 Thu, 01 Dec 2022 10:17:43 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 p15-20020a05600c358f00b003c6b874a0dfsm8570846wmq.14.2022.12.01.10.17.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Dec 2022 10:17:43 -0800 (PST)
Message-ID: <9de7491a-0787-fca5-0738-da5e8288b683@redhat.com>
Date: Thu, 1 Dec 2022 19:17:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH] intel-iommu: Document iova_tree
Content-Language: en-US
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, 
 Yi Liu <yi.l.liu@intel.com>, Alex Williamson <alex.williamson@redhat.com>
References: <20221201162501.3864692-1-peterx@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20221201162501.3864692-1-peterx@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.257, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Peter

On 12/1/22 17:25, Peter Xu wrote:
> It seems not super clear on when iova_tree is used, and why.  Add a rich
> comment above iova_tree to track why we needed the iova_tree, and when we
> need it.
>
> Suggested-by: Jason Wang <jasowang@redhat.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  include/hw/i386/intel_iommu.h | 30 +++++++++++++++++++++++++++++-
>  1 file changed, 29 insertions(+), 1 deletion(-)
>
> diff --git a/include/hw/i386/intel_iommu.h b/include/hw/i386/intel_iommu.h
> index 46d973e629..8d130ab2e3 100644
> --- a/include/hw/i386/intel_iommu.h
> +++ b/include/hw/i386/intel_iommu.h
> @@ -109,7 +109,35 @@ struct VTDAddressSpace {
>      QLIST_ENTRY(VTDAddressSpace) next;
>      /* Superset of notifier flags that this address space has */
>      IOMMUNotifierFlag notifier_flags;
> -    IOVATree *iova_tree;          /* Traces mapped IOVA ranges */
> +    /*
> +     * @iova_tree traces mapped IOVA ranges.
> +     *
> +     * The tree is not needed if no MAP notifiers is registered with

s/no MAP notifiers/no MAP notifier
> +     * current VTD address space, because all UNMAP (including iotlb or
> +     * dev-iotlb) events can be transparently delivered to !MAP iommu
> +     * notifiers.
because all UNMAP notifications (iotlb or dev-iotlb) can be triggered
directly, as opposed to MAP notifications. (?)
> +     *
> +     * The tree OTOH is required for MAP typed iommu notifiers for a few
> +     * reasons.
> +     *
> +     * Firstly, there's no way to identify whether an PSI event is MAP or
maybe give the decryption of the 'PSI' and 'DSI" acronyms once ;-)
> +     * UNMAP within the PSI message itself.  Without having prior knowledge
> +     * of existing state vIOMMU doesn't know whether it should notify MAP
> +     * or UNMAP for a PSI message it received.
> +     *
> +     * Secondly, PSI received from guest driver (or even a large PSI can
> +     * grow into a DSI at least with Linux intel-iommu driver) can be
> +     * larger in range than the newly mapped ranges for either MAP or UNMAP
> +     * events. If it directly pass-throughs any such event it may confuse

If it directly notifies the registered device with the unmodified range, it may confuse the drivers ../..

So the range of the MAP notification can be adapted based on the existing IOVA mappings.  

> +     * the registered drivers (e.g. vfio-pci) on either: (1) trying to map
> +     * the same region more than once (for VFIO_IOMMU_MAP_DMA, -EEXIST will
> +     * trigger), or (2) trying to UNMAP a range that is still partially
> +     * mapped.  That accuracy is not required for UNMAP-only notifiers, but
> +     * it is a must-to-have for MAP-inclusive notifiers, because the vIOMMU
> +     * needs to make sure the shadow page table is always in sync with the
> +     * guest IOMMU pgtables for a device.
> +     */
> +    IOVATree *iova_tree;
>  };
>  
>  struct VTDIOTLBEntry {
Thanks

Eric


