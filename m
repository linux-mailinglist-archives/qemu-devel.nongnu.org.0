Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 746DC5EA69D
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 14:56:50 +0200 (CEST)
Received: from localhost ([::1]:48366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocnfE-0005XG-Oi
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 08:56:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ocnbp-0003fN-9g
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 08:53:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ocnbl-0007A0-9E
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 08:53:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664196792;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dZnzkSPkrJhMkyrPYaJDC4tJIosUyBPmaHd/A+YN8Ro=;
 b=BPygqRJd6MmuKpJgrgecIzWd4YOBVhN1ULwrL+8U8qvBO4AWsTP6qz/yyy7A9aWdF9QmfU
 MomvMfIl7MbiH06zpomHsDgpgxSC9uG3FQtmXVnFgjgyzCMMOYmKgv7hCDorXhwLcfKNaR
 aqmzLeP6lC46KvmGqhy8tC6dikbqE9c=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-481-NBwHbGjGPcmjiyYIQ3vYJQ-1; Mon, 26 Sep 2022 08:53:10 -0400
X-MC-Unique: NBwHbGjGPcmjiyYIQ3vYJQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 c21-20020adfa315000000b0022adc2a2edaso1141933wrb.0
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 05:53:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=dZnzkSPkrJhMkyrPYaJDC4tJIosUyBPmaHd/A+YN8Ro=;
 b=NAmAY0ItutyPIGgd001IGGKdWn+vd7BNsHYKnUN5+DZXsog8x26gEcUb5qYLerOhn/
 oHQqNxBkTDI4xNnFS9COqk3tcbajWPra+378tuM/yBquZd2xuAFAVnmNB20gjkiVLshi
 5qr9G8Ta+h0Pr2nBL5vn8r41atWfho3txm5ut9NErBwucUD7gtU7o7q8TRF9x7mpk8Vk
 E/Q0s+zHnN6eIhq9LnqTG0NLTivSD4XU8xmeyftegqmHCxvC4GIJd38mZ9avHsh8ABpg
 xQxsGimNBDeM7t/OE85oMcPwVL5Z7+1s27w40AtGhLI949MYDW8ayDjD5dfEgm/yzXII
 pc9Q==
X-Gm-Message-State: ACrzQf1XMBRXSrsbaKLuEPjyjNo4m8rvSZJK5Jb1Rs1ykQJgU3SMDOkb
 VMadAzRz4EFVa9h+pxEflsAr3CKo9zT+Iv8JLpnMMOlMhoXB3spbMpGfeqc4LyXktWNuCJOHVpB
 JLFEbe/PT8hUEyWg=
X-Received: by 2002:a5d:584d:0:b0:22b:229:7582 with SMTP id
 i13-20020a5d584d000000b0022b02297582mr13692763wrf.211.1664196789908; 
 Mon, 26 Sep 2022 05:53:09 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6OQZe0Iibwn3qepP2lrKsEYROWRa0JJtctdj+1K8JGXD02l/2/KS+bqh9+e3+0Hw1xBDWGaQ==
X-Received: by 2002:a5d:584d:0:b0:22b:229:7582 with SMTP id
 i13-20020a5d584d000000b0022b02297582mr13692725wrf.211.1664196789608; 
 Mon, 26 Sep 2022 05:53:09 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-177-251.web.vodafone.de.
 [109.43.177.251]) by smtp.gmail.com with ESMTPSA id
 l39-20020a05600c1d2700b003b50428cf66sm12102270wms.33.2022.09.26.05.53.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Sep 2022 05:53:09 -0700 (PDT)
Message-ID: <597a2761-f718-4a2c-c012-a0d25bf3c7fb@redhat.com>
Date: Mon, 26 Sep 2022 14:53:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v8 1/8] linux-headers: update to 6.0-rc3
Content-Language: en-US
To: Matthew Rosato <mjrosato@linux.ibm.com>, qemu-s390x@nongnu.org,
 richard.henderson@linaro.org, Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P. Berrange" <berrange@redhat.com>
Cc: alex.williamson@redhat.com, schnelle@linux.ibm.com, cohuck@redhat.com,
 farman@linux.ibm.com, pmorel@linux.ibm.com, david@redhat.com,
 pasic@linux.ibm.com, borntraeger@linux.ibm.com, mst@redhat.com,
 pbonzini@redhat.com, qemu-devel@nongnu.org, kvm@vger.kernel.org
References: <20220902172737.170349-1-mjrosato@linux.ibm.com>
 <20220902172737.170349-2-mjrosato@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220902172737.170349-2-mjrosato@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.319, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/09/2022 19.27, Matthew Rosato wrote:
> Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
> ---
...
> diff --git a/linux-headers/asm-x86/kvm.h b/linux-headers/asm-x86/kvm.h
> index bf6e96011d..46de10a809 100644
> --- a/linux-headers/asm-x86/kvm.h
> +++ b/linux-headers/asm-x86/kvm.h
> @@ -198,13 +198,13 @@ struct kvm_msrs {
>   	__u32 nmsrs; /* number of msrs in entries */
>   	__u32 pad;
>   
> -	struct kvm_msr_entry entries[0];
> +	struct kvm_msr_entry entries[];
>   };

Yuck, this fails to compile with Clang:

  https://gitlab.com/thuth/qemu/-/jobs/3084427423#L2206

  ../target/i386/kvm/kvm.c:470:25: error: field 'info' with variable sized 
type 'struct kvm_msrs' not at the end of a struct or class is a GNU 
extension [-Werror,-Wgnu-variable-sized-type-not-at-end]
         struct kvm_msrs info;
                         ^

Anybody any ideas how to fix this best? Simply disable the compiler warning 
in QEMU?

  Thomas


