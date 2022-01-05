Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74953485583
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 16:12:04 +0100 (CET)
Received: from localhost ([::1]:41980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n57xL-0000NM-Ju
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 10:12:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1n57kk-0007Xf-SM
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 09:59:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58406)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1n57ki-0006w9-No
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 09:59:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641394740;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xuDXDZaYk8pGsNJOMGUKMDNxo2JBtvsfuoGsrVtjpq0=;
 b=Y6FwTjh5m43lNHsDUlpedDlXMsp7d3fu+DO/hGMymht0wvIzbZrjyEs5BB+Y9D5SF5Yab1
 N9nYyTcnHE8Ajl54Tkq0yKmmeQ0GEOUV8xQIm+z71xKUnf4f9GT8oTCuCb8EHZYRTlCVRU
 U8Y590jYDtlR1o5vrJAi+MrpDV05jbg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-373-TXwIKRj5NZe6P4x0sddxgA-1; Wed, 05 Jan 2022 09:58:59 -0500
X-MC-Unique: TXwIKRj5NZe6P4x0sddxgA-1
Received: by mail-wm1-f69.google.com with SMTP id
 r2-20020a05600c35c200b00345c3b82b22so1942235wmq.0
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 06:58:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xuDXDZaYk8pGsNJOMGUKMDNxo2JBtvsfuoGsrVtjpq0=;
 b=6yNVG1x5yX+YgAOkig+zBbtQmhCtqRBbEduMq273aMc37GOswYBMxcz8A+Wvq65GZ2
 Ok5bnP+iWJ/FZaNI4DXOe61mKdPeKmr7IuZsV1lHUDrCoeRQOuMMG18oU+bsStoz5blK
 u40PEFksv9wM487Zlcy/Uvi+8/1JWHvlsHBf+9KpYYTLktpW4Ekc/MC+4hzAJ5C3z/Yz
 3MezdmA/y5GISszEUJsDsAmiTiZKG61OxttJI91ebQ5aPdIoRKDpDlS1GGHbK3Q/f/c/
 lmSpBo8SUkImK5nKjrL+lzPGfIF2xsXrH2hfdyar86RqTb/G6wPX+/duAj3SS5FhKPnx
 6ekw==
X-Gm-Message-State: AOAM531UpZTyHD6HxV9CQDCW0F8WEM05+txd0K2fMub4sWys8Psbsv02
 femvUwdkzZd7ZsoCzLdM58FkCbNtBzHm4XDdF4L+x9TZjyGhaKmd+2LqPNG/lslUsxeCxcGmKkw
 09eQ5G0mo4kS8YHs=
X-Received: by 2002:a5d:564f:: with SMTP id j15mr45520960wrw.366.1641394737665; 
 Wed, 05 Jan 2022 06:58:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzAIE48Rt6oCWt/TrKYOLRuPR/0b02qx5CUgTR/XXf3h6OjcPtM0vEG7RamhYrEag2pLW40KA==
X-Received: by 2002:a5d:564f:: with SMTP id j15mr45520954wrw.366.1641394737546; 
 Wed, 05 Jan 2022 06:58:57 -0800 (PST)
Received: from gator (nat-pool-brq-u.redhat.com. [213.175.37.12])
 by smtp.gmail.com with ESMTPSA id n9sm3237489wmq.37.2022.01.05.06.58.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 06:58:57 -0800 (PST)
Date: Wed, 5 Jan 2022 15:58:55 +0100
From: Andrew Jones <drjones@redhat.com>
To: Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v2] hw/arm/virt: KVM: Enable PAuth when supported by the
 host
Message-ID: <20220105145855.ca7vxeu3ubytdkna@gator>
References: <20220103180507.2190429-1-maz@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20220103180507.2190429-1-maz@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Eric Auger <eric.auger@redhat.com>, kernel-team@android.com,
 kvmarm@lists.cs.columbia.edu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 03, 2022 at 06:05:07PM +0000, Marc Zyngier wrote:
> Add basic support for Pointer Authentication when running a KVM
> guest and that the host supports it, loosely based on the SVE
> support.
> 
> Although the feature is enabled by default when the host advertises
> it, it is possible to disable it by setting the 'pauth=off' CPU
> property. The 'pauth' comment is removed from cpu-features.rst,
> as it is now common to both TCG and KVM.
> 
> Tested on an Apple M1 running 5.16-rc6.
> 
> Cc: Eric Auger <eric.auger@redhat.com>
> Cc: Andrew Jones <drjones@redhat.com>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
> * From v1:
>   - Drop 'pauth' documentation
>   - Make the TCG path common to both TCG and KVM
>   - Some tidying up
> 
>  docs/system/arm/cpu-features.rst |  4 ----
>  target/arm/cpu.c                 | 14 ++++----------
>  target/arm/cpu.h                 |  1 +
>  target/arm/cpu64.c               | 33 ++++++++++++++++++++++++++++----
>  target/arm/kvm64.c               | 21 ++++++++++++++++++++
>  5 files changed, 55 insertions(+), 18 deletions(-)
>

 
Reviewed-by: Andrew Jones <drjones@redhat.com>

Thanks,
drew


