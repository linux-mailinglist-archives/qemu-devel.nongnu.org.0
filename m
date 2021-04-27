Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B59136C1FD
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 11:44:00 +0200 (CEST)
Received: from localhost ([::1]:40842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbKG7-0005DZ-2z
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 05:43:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lbKCw-00036E-Ja
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 05:40:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lbKCs-0002Ko-Os
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 05:40:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619516438;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SCJdhqg0vNgtqxyw+htojD9FTXENHPVX3MX6GeBFltM=;
 b=GWph5XG/9LJ42YxxulFPcXdWTWhN0GL7ZNJdExHQRhi0+zV3FYCNUxe36Mcgy1MAz54qUv
 7UXzZG2tDqtkTT/laK8flpkN5QfWY4V9OE3HXtaIp1FG31IYwLn3DggA7208y/ATr8wRsi
 ZG4xjD9mBs3avV/fIkGyC05m+kOmdcg=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-463-t0wkiX4pOwmarNdeC2hw4w-1; Tue, 27 Apr 2021 05:40:36 -0400
X-MC-Unique: t0wkiX4pOwmarNdeC2hw4w-1
Received: by mail-ej1-f70.google.com with SMTP id
 n10-20020a1709061d0ab029037caa96b8c5so11115523ejh.23
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 02:40:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SCJdhqg0vNgtqxyw+htojD9FTXENHPVX3MX6GeBFltM=;
 b=UxjAioN+ewBBbc1H9mdhVmxLXJrqduZEiNyqmDIYpMyDGIJxSH/1rogNJYwTqAJUjw
 9gN56l2hTJko5rVZujhFGdLe9qJPz291wx7Wj3nkphhHjaEH6E6UIwyHIaK51FAQPVi+
 1vkcejo4hmDJKFWVyYCVALo1nA7OPh4c/EVJCN/D73L6lUHu37YLCC6VIBEE/8vf3Byw
 kbNXAvVsPCiANbW3N93CUwCT5gFbjj1rhcXx6AzaP1YjlO3MtJJwHbmkk+W3rrFjZSob
 AiTAjboqxIKga/uBT+rzgkZUnoPNALxX+BhchQ7ZAog4KeWYIQeJAae/cbW/Xz3anSzn
 ugyQ==
X-Gm-Message-State: AOAM531qXzNNZPyGbyZFT1Q1krM3qp3RLTWJyaDNYN7jr8yeZQPp33Tr
 EqZjOR/RLruN72dKhkq7yREWkBWu/NgHOFNi85NHtNASIiCuYucKR66Rg3EWFKe1OVwzkfcTJ90
 vnVV4SqFjP0eSSUY=
X-Received: by 2002:a05:6402:5107:: with SMTP id
 m7mr3220086edd.75.1619516435314; 
 Tue, 27 Apr 2021 02:40:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyQyxzwML1ezv9mHTiGn6gOlpvp8CTttOROjOD/S1SIPNAGXoJ1pQRffbSq+HAqtOr1D9yzEw==
X-Received: by 2002:a05:6402:5107:: with SMTP id
 m7mr3220066edd.75.1619516435130; 
 Tue, 27 Apr 2021 02:40:35 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id v8sm1868003edc.30.2021.04.27.02.40.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 02:40:34 -0700 (PDT)
Date: Tue, 27 Apr 2021 11:40:32 +0200
From: Andrew Jones <drjones@redhat.com>
To: Haibo Xu <haibo.xu@linaro.org>
Subject: Re: [PATCH RESEND v2 0/6] target/arm: Add nested virtualization
 support
Message-ID: <20210427094032.awefmueute7gek2d@gator.home>
References: <cover.1617281290.git.haibo.xu@linaro.org>
MIME-Version: 1.0
In-Reply-To: <cover.1617281290.git.haibo.xu@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, abologna@redhat.com, qemu-arm@nongnu.org,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 01, 2021 at 05:55:32AM -0700, Haibo Xu wrote:
> v2:
>   - Move the NV to a CPU feature flag(Andrea&Andrew)
>   - Add CPU feature 'el2' test(Andrew)
> 
> Many thanks to Andrea and Andrew for their comments!
> 
> This series add support for ARMv8.3/8.4 nested virtualization support
> in KVM mode. It's based on Marc Zyngier's kernel KVM patches[1], and 
> has been tested on a FVP model to run a L2 guest with Qemu. Now the 
> feature can be enabled by "-M virt,accel=kvm -cpu host,el2=on" when
> starting a VM. 
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/log/?h=kvm-arm64/nv-5.12-WIP
> 
> Haibo Xu (6):
>   Update linux header with new arm64 NV macro
>   target/arm/kvm: Add helper to detect el2 when using KVM
>   target/arm/kvm: Add an option to turn on/off el2 support
>   hw/intc/arm_gicv3: Enable support for setting vGIC maintenance IRQ
>   target/arm/cpu: Enable 'el2' to work with host/max cpu
>   target/arm: Add vCPU feature 'el2' test.

Hi Haibo,

Thank you for this new feature.

Please also update docs/system/arm/cpu-features.rst in the next version of
this patch series.

Thanks,
drew


