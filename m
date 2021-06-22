Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A269F3B032B
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 13:48:04 +0200 (CEST)
Received: from localhost ([::1]:48522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvest-0007SF-Nj
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 07:48:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lverc-0006lW-K2
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 07:46:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30287)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lvera-0002bm-L4
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 07:46:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624362402;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XjIrFHs7fgYEOFiD7JWfrlW3WpTf6YE+QrQoMlZmUyc=;
 b=MU+/JXA5iwfih4Co3AMJ7mVnSH8D/2ZQFzmXqNrFIsJ0nRPzEuuVKFTV3f/WqYjJ2y8SJB
 qL3kSy0reV2ANnYumWJwCFnA9rpePkDQdKyvNwXciqb7nIuBL6NfnAzUqbnsW9sX/Sh3hG
 FAq9/DoLM2DPY6pB58mmYd8FhwpK0iw=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-uz1MGCD_M_W7kFTYaFZ2Iw-1; Tue, 22 Jun 2021 07:46:38 -0400
X-MC-Unique: uz1MGCD_M_W7kFTYaFZ2Iw-1
Received: by mail-ej1-f70.google.com with SMTP id
 l6-20020a1709062a86b029046ec0ceaf5cso5108836eje.8
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 04:46:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=XjIrFHs7fgYEOFiD7JWfrlW3WpTf6YE+QrQoMlZmUyc=;
 b=lMb/RVjszv2xBgrYasDrcg46IvPZKCpOhhcey+UYrgkJcZCTDFfXvTed94itFW8zCB
 xbf9zdKRkejbkBiAuvZhveOoOi4mIj9MzOsLTQKnI+T3Tm/wou3iR2uvVmB3h8Q2xkKK
 wpoBwVpVDKOIZrbT95zJnZzlJCs+Z9efCNjzKDcrCl718AYa7r8WAGKDwxh59/rpzZwW
 B9Za+RKsCiKdRVLQOSHHIgaydLNr7DITK0/lFMCsh02Bb3NlRuZq2tpq2n7p9RidjtrS
 UpKOfDpo3RHBxRoYPsXcJ0Y5dmKuPP8nsRNDkGJWxnYmem0GkjVSAcfVj+33xcLtxke2
 EddA==
X-Gm-Message-State: AOAM531/d8qCqBHFJ9hN1+H25DjR4yh0T8R7at7cbdBPZiTLLlmXwGOG
 Ar7+R7A+8Bii/At91+QzIsoS9aXfVG0X0yvc6iFwnECF1rLPqkIsbdZEp3i4RXMROKl8as/uuly
 JuFgW2FdK1PkDu40=
X-Received: by 2002:aa7:d853:: with SMTP id f19mr4330644eds.1.1624362397705;
 Tue, 22 Jun 2021 04:46:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwAmcUjDJo2gtYnjXmHvrGEFEtrEoeQMjvNLCajj9yk0YBo9+NagC0SReHGOCNLyNO9SD5K9Q==
X-Received: by 2002:aa7:d853:: with SMTP id f19mr4330603eds.1.1624362397376;
 Tue, 22 Jun 2021 04:46:37 -0700 (PDT)
Received: from gator (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id z19sm11905574edc.90.2021.06.22.04.46.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 04:46:37 -0700 (PDT)
Date: Tue, 22 Jun 2021 13:46:34 +0200
From: Andrew Jones <drjones@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [RFC PATCH v4 0/7] hw/arm/virt: Introduce cpu topology support
Message-ID: <20210622114634.crjqusw6x6oj4j6v@gator>
References: <20210622093413.13360-1-wangyanan55@huawei.com>
 <YNG44c9KtaiNXT7b@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YNG44c9KtaiNXT7b@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.223,
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
Cc: Barry Song <song.bao.hua@hisilicon.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 qemu-devel@nongnu.org, yangyicong@huawei.com,
 Yanan Wang <wangyanan55@huawei.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 prime.zeng@hisilicon.com, Paolo Bonzini <pbonzini@redhat.com>,
 yuzenghui@huawei.com, Igor Mammedov <imammedo@redhat.com>,
 zhukeqian1@huawei.com, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 22, 2021 at 11:18:09AM +0100, Daniel P. Berrangé wrote:
> On Tue, Jun 22, 2021 at 05:34:06PM +0800, Yanan Wang wrote:
> > Hi,
> > 
> > This is v4 of the series [1] that I posted to introduce support for
> > generating cpu topology descriptions to guest. Comments are welcome!
> > 
> > Description:
> > Once the view of an accurate virtual cpu topology is provided to guest,
> > with a well-designed vCPU pinning to the pCPU we may get a huge benefit,
> > e.g., the scheduling performance improvement. See Dario Faggioli's
> > research and the related performance tests in [2] for reference. So here
> > we go, this patch series introduces cpu topology support for ARM platform.
> > 
> > In this series, instead of quietly enforcing the support for the latest
> > machine type, a new parameter "expose=on|off" in -smp command line is
> > introduced to leave QEMU users a choice to decide whether to enable the
> > feature or not. This will allow the feature to work on different machine
> > types and also ideally compat with already in-use -smp command lines.
> > Also we make much stricter requirement for the topology configuration
> > with "expose=on".
> 
> Seeing this 'expose=on' parameter feels to me like we're adding a
> "make-it-work=yes" parameter. IMHO this is just something that should
> be done by default for the current machine type version and beyond.
> I don't see the need for a parameter to turnthis on, especially since
> it is being made architecture specific.
>

I agree.

Yanan, we never discussed an "expose" parameter in the previous versions
of this series. We discussed a "strict" parameter though, which would
allow existing command lines to "work" using assumptions of what the user
meant and strict=on users to get what they mean or an error saying that
they asked for something that won't work or would require unreasonable
assumptions. Why was this changed to an "expose" parameter?

Thanks,
drew


