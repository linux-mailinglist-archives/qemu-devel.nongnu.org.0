Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D503C6A764F
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 22:45:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXUFV-0005mN-R0; Wed, 01 Mar 2023 16:44:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXUFT-0005ko-3y
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 16:44:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXUFR-0003Ei-Nn
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 16:44:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677707068;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wRJtKHX5fh2nvUWLM0Td+R9/XrKFNRxn/0cuFRwulUc=;
 b=du6KEpniWORccU8eGQUUpbDItig33SdkJ+R1q2gkwdDpxiyhnpEG0wzAGuypkj8jExSzpp
 Jk3MFDoQm2XyjAfFb6rWmOkJf/FYFKrQF3Wiv6/BVhs5sd4yeTYKST+BrzBX/yxAzkJVKQ
 CoGtCe76U3aX5JjfiyeRy7wptgVfkWc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-194-1khHpz5vOkK2DrVT9_d0DQ-1; Wed, 01 Mar 2023 16:44:27 -0500
X-MC-Unique: 1khHpz5vOkK2DrVT9_d0DQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 bi21-20020a05600c3d9500b003e836e354e0so233804wmb.5
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 13:44:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677707066;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wRJtKHX5fh2nvUWLM0Td+R9/XrKFNRxn/0cuFRwulUc=;
 b=hnGJwSFrgwSBkZEMRfpFmPsZOvH7VMFBuzUEjtlZ1+96aMIdkJ6csJ8lmc/b5aDsfq
 Qq1KfsCauRSGsRstGJJUjtGIoZtt9pcN6wfqSwJuDB3kZKOOJyQEWT50bBInxpE0pK15
 1UJ+3VWCP6VTCqkZRTSHLeNRgzIzdM/XAd42E5Tm4rBi/oMU6tPkUM86wvE8kqgxL7+U
 3Yot/GT7mlerWSf007X/znUCzu5MKSyeH7oq1aBzj3JlVZzrAHNEqJIh+oClUx0+UKKX
 SadeVPLu+K4RRJRggdCk55rrLiQatFOhD/OnYWNdj36k5aPmVdZ+4CgND6a3hdjll2eQ
 QIeQ==
X-Gm-Message-State: AO0yUKU+kCNOlA/zxeJg27CvpDsme/c5A8FVD0A4hhF/cN+IehfoUTAr
 HrM9Q7/0VRSljC2+JMAxmRhj/wI5KvJUwCaLsaZyt800dPz6B8Z/pZOezEpQazETDoODSq7NPh6
 WO4vxvZVyi9zW0fg=
X-Received: by 2002:a05:600c:1c15:b0:3eb:2e32:72b4 with SMTP id
 j21-20020a05600c1c1500b003eb2e3272b4mr6047603wms.15.1677707066791; 
 Wed, 01 Mar 2023 13:44:26 -0800 (PST)
X-Google-Smtp-Source: AK7set/xtSsUt6usEN+BVqIASVFCX2MtBMM1BhNw0fnScAcfCvOGbceorEZNTj45mTsI/3AsTYXI3w==
X-Received: by 2002:a05:600c:1c15:b0:3eb:2e32:72b4 with SMTP id
 j21-20020a05600c1c1500b003eb2e3272b4mr6047591wms.15.1677707066517; 
 Wed, 01 Mar 2023 13:44:26 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 p14-20020a05600c468e00b003e9ae2a8cbfsm911117wmo.2.2023.03.01.13.44.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 13:44:26 -0800 (PST)
Date: Wed, 1 Mar 2023 16:44:22 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PATCH 02/12] hw/pci-host/q35: Fix contradicting .endianness
 assignment
Message-ID: <20230301164339-mutt-send-email-mst@kernel.org>
References: <20230214131441.101760-1-shentey@gmail.com>
 <20230214131441.101760-3-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230214131441.101760-3-shentey@gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Feb 14, 2023 at 02:14:31PM +0100, Bernhard Beschow wrote:
> Settle on little endian which is consistent with using
> pci_host_conf_le_ops.
> 
> Fixes: bafc90bdc594 'q35: implement TSEG'
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>

I think it's native because native is a bit cheaper and
it's just 0xffffffff anyway.
Why change? A comment would be a good idea though.

> ---
>  hw/pci-host/q35.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
> index 83f2a98c71..3124cad60f 100644
> --- a/hw/pci-host/q35.c
> +++ b/hw/pci-host/q35.c
> @@ -289,7 +289,6 @@ static void blackhole_write(void *opaque, hwaddr addr, uint64_t val,
>  static const MemoryRegionOps blackhole_ops = {
>      .read = blackhole_read,
>      .write = blackhole_write,
> -    .endianness = DEVICE_NATIVE_ENDIAN,
>      .valid.min_access_size = 1,
>      .valid.max_access_size = 4,
>      .impl.min_access_size = 4,
> -- 
> 2.39.1


