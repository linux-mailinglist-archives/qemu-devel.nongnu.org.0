Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0861D3A7E2B
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 14:26:55 +0200 (CEST)
Received: from localhost ([::1]:46158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt89d-0004N8-HW
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 08:26:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lt87x-0002jA-W7
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 08:25:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lt87o-0007DD-Jv
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 08:25:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623759898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fWtDcmSA0PdYR5EFACd5pgg5mScCFzkym3tMUXQJBy0=;
 b=hGsS+giOUO/lYtQsCxLHekvx6LE8aFgwu1i2uwkXvJ6eAX8XQCSwv3Un3KidQqRLiWgC0A
 e12dOK0oWVQeIWZxTV9CWj4It5ZRh/OGulTTor+vgXHbXxzggqMFTNiqtIZRSl6Q97+VSN
 YiFxfEiB0fZUJm0RC8owayT3FcopT2g=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-166-ucepnGAOOaep3Tn1ymdvIg-1; Tue, 15 Jun 2021 08:24:57 -0400
X-MC-Unique: ucepnGAOOaep3Tn1ymdvIg-1
Received: by mail-ej1-f69.google.com with SMTP id
 jy19-20020a1709077633b02903eb7acdb38cso4440012ejc.14
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 05:24:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fWtDcmSA0PdYR5EFACd5pgg5mScCFzkym3tMUXQJBy0=;
 b=DaxP3MtVvkO+5vbzsbKy7UULNFmQ4fbiQvz5dLvgY7zBDovOcpfrOao6jdqoyTFCVN
 3dOReDHvSk/CJ0UHDsj0SZSkRIx4+2KLTdrM+pic9oPA5cWSlrYXBk/hWbUtMg86ym8/
 jLUS8PBusURmJ2038FRxUX62iQVnLwlGkwEszTs2FO8My2Mqn534kwPSdWcNrEFeUYtP
 kxQY/TTb57ACTJHDzi2lUIIvihmv2RmtO6Rh+VTqA2Fn8XiB5Yi5nOw16JjbiD1LyLuk
 Rd7oppVm7cf1Yd4GFEh2x9G+mOwHtrKyxqMxsLwNvHdOUxzmIFrhsKYBSqNUdo5ETL3R
 TpOQ==
X-Gm-Message-State: AOAM5311KwUcubSyumflynC+dgLyydKeJBjum9o7xPOeqMEwBg/XYGg0
 02s4P5PmpqBq8tGHz7AgIDVXmNZi4CXM+LutbJXZ34PiZn2P+/6hZ2OADTL9G/pJqig3EMOKxBh
 shbu7Jy06uWC6TJOpCTe8BrHsvmDwv+Lar5P1EGxB6tzHL9VVQaA7dNhjvhAD+EVvxcg=
X-Received: by 2002:aa7:dc4c:: with SMTP id g12mr23558186edu.258.1623759895667; 
 Tue, 15 Jun 2021 05:24:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJTMExUNqeF/DcTwU6pYO0vQL+GI1OyEJRseoubi6vNSpJpvBEZ0EqrTdM3lPd2LeTNygWSg==
X-Received: by 2002:aa7:dc4c:: with SMTP id g12mr23558146edu.258.1623759895392; 
 Tue, 15 Jun 2021 05:24:55 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n2sm11908025edi.32.2021.06.15.05.24.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jun 2021 05:24:54 -0700 (PDT)
Subject: Re: [PATCH 1/3] target/i386: Added consistency checks for VMRUN
 intercept and ASID
To: Lara Lazier <laramglazier@gmail.com>, qemu-devel@nongnu.org
References: <20210614100902.15860-1-laramglazier@gmail.com>
 <20210614100902.15860-2-laramglazier@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <d0eea515-af7e-9529-7f8c-101d1e888f9f@redhat.com>
Date: Tue, 15 Jun 2021 14:24:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210614100902.15860-2-laramglazier@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.095, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/06/21 12:09, Lara Lazier wrote:
> +#define SVM_VMRUN_INTERCEPT (1ULL << 32)
> +
>   struct QEMU_PACKED vmcb_control_area {
>   	uint16_t intercept_cr_read;
>   	uint16_t intercept_cr_write;

...

> +    if (!(env->intercept & SVM_VMRUN_INTERCEPT)) {
> +        cpu_vmexit(env, SVM_EXIT_ERR, 0, GETPC());
> +    }

Hi Lara,

as discussed in our weekly meeting, the only issue with these patch is a 
matter of aesthetics and maintainability more than functionality; 
namely, the duplication between SVM_VMRUN_INTERCEPT and SVM_EXIT_VMRUN, 
and likewise in patch 3 between INTERCEPT_SELECTIVE_CR0 and 
SVM_EXIT_CR0_SEL_WRITE.  Showing them side by side also makes it 
apparent that the names are not consistent, but it's even better to 
avoid the duplication altogether if possible.

In particular, one way to do so is to extract the intercept checks to a 
function that you can call like

     cpu_svm_has_intercept(env, SVM_EXIT_VMRUN)

so that the function computes the right bit of the bitmap based on the 
second argument.  Most of the code to do this is already in 
svm_helper.c's cpu_svm_check_intercept_param, which you're already 
familiar with.  cpu_svm_check_intercept_param can also be modified to 
call the new cpu_svm_has_intercept.

When your second version of the patches are ready, you can add the "-v2" 
argument to git format-patch and it will automatically start the 
subjects with "[PATCH v2 ...]" instead of just "[PATCH ...]".

Paolo


