Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15278682FC2
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 15:52:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMrFb-0006nb-Nk; Tue, 31 Jan 2023 09:04:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMrFZ-0006nT-Ap
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 09:04:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMrFX-0002qP-8Q
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 09:04:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675173878;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Svd+8sWUw8PYlJNHP3F0NKAwX2zot7PgklGR5ShTsz0=;
 b=NNMANM2dUvxwWs+VEs/E4/ONitjMcDCDSwVlyc8kAhGePUCQg3eIw9psUluUpYLL86xeqx
 a4JULUBOMGyj7s/8i7PPKSNdv605wH3EvD3Eq5GV/ndy5gdBfy6NMh8QZoVLA+hDumAX9y
 OZHzJfJVRV38m7ozcbIZS5Xur15zGuI=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-590-OhRHAFhDMiOaHW6k3Z4y6A-1; Tue, 31 Jan 2023 09:04:34 -0500
X-MC-Unique: OhRHAFhDMiOaHW6k3Z4y6A-1
Received: by mail-yw1-f200.google.com with SMTP id
 00721157ae682-5065604854eso168343367b3.16
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 06:04:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Svd+8sWUw8PYlJNHP3F0NKAwX2zot7PgklGR5ShTsz0=;
 b=SatZ3jXVa0p/dUHxY7GaOogelU8VieAt4c9ufs0aUI2RyBe6E55kgaK1bN7abGNXL+
 DMpfXGkyxMYPsa1whLloptWgv/HpPG3Xhsv2v++cA52/Gwzz1ZfF2vGEuOmmmqWFGS+O
 NJTR51pCpE2wdnFb/22qgTp3S3l2dxMOdqkQrX8psbmP0VoomOfXsQbOdWqtmXYEzU2T
 VWXGUJmDqTacH4BBw8sUxfCt6hZ76ITkKVSUwzsEVkpJ6+enTGgLeQLs81immK8Jj1uQ
 8fL44Ezeur5g2qNJPUZO00i9u9IYuABaLxZ4rscnINtCD0hPj7zwqdO3nR9E1EPrw6N6
 SdMg==
X-Gm-Message-State: AO0yUKW1D/W4n1eTSk61IxDJE+QrJd6hx0j9hP64pKrXwVqloxSc2r/8
 M/uVY0ZIS1tjGlDnlqe4rB3VH5QLkVADp05T39PF9hrkk76LGeaNdejRrZ5yAAEwurYZZqHkJPq
 wMHvY4SJQGLZ2RmM=
X-Received: by 2002:a25:28c2:0:b0:83a:c1da:f0de with SMTP id
 o185-20020a2528c2000000b0083ac1daf0demr1012090ybo.46.1675173874215; 
 Tue, 31 Jan 2023 06:04:34 -0800 (PST)
X-Google-Smtp-Source: AK7set9XC1mQUbpN4jCNTmaSOaCkUSADsDfVAISNUFf/qc0+/QaSvmJIlLE2VC+TK6ppdgBMM/bhrA==
X-Received: by 2002:a25:28c2:0:b0:83a:c1da:f0de with SMTP id
 o185-20020a2528c2000000b0083ac1daf0demr1012064ybo.46.1675173873912; 
 Tue, 31 Jan 2023 06:04:33 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-155.web.vodafone.de.
 [109.43.176.155]) by smtp.gmail.com with ESMTPSA id
 i1-20020a37b801000000b00702d1c6e7bbsm9876458qkf.130.2023.01.31.06.04.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Jan 2023 06:04:33 -0800 (PST)
Message-ID: <d72390b7-baab-c7d8-f827-cb9b0f11ac6c@redhat.com>
Date: Tue, 31 Jan 2023 15:04:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 10/20] hw/isa/lpc_ich9: Eliminate ICH9LPCState::isa_bus
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Ani Sinha
 <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Laurent Vivier <lvivier@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, qemu-trivial@nongnu.org
References: <20230131115326.12454-1-shentey@gmail.com>
 <20230131115326.12454-11-shentey@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230131115326.12454-11-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 31/01/2023 12.53, Bernhard Beschow wrote:
> By using qdev_get_child_bus() we can eliminate ICH9LPCState::isa_bus and
> spare the ich9_lpc variable in pc_q35, too.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   include/hw/i386/ich9.h | 3 ---
>   hw/i386/pc_q35.c       | 4 +---
>   hw/isa/lpc_ich9.c      | 5 +----
>   3 files changed, 2 insertions(+), 10 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


