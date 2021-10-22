Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 055A9438003
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 23:48:12 +0200 (CEST)
Received: from localhost ([::1]:48810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1me2OZ-00018r-4Q
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 17:48:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1me2N5-0000S3-DI
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 17:46:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48169)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1me2N1-0007Ba-Vj
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 17:46:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634939195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lIZIQ3mYE62DqF45OP1btlXezubRtjgW2MB6oakfjBo=;
 b=h2YmUX/gopvVM8MfE1F4oDYY3Z7j9psV0PaNQ2o6dqkxaNmnhkO9FbpcIpsmrPQJ8Pulyh
 Da+bGhgRKBZu4n8/kzofHdG3kK3FzbjQgrd3yEqpI4Xj0ZqzQ6/zukevrLHT7ReIjQ+g5F
 CcmGnoFacEMcItvW0FbKNlmXAM2N2wc=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-zY2SS22nM6iaC-esqEQ3xA-1; Fri, 22 Oct 2021 17:46:33 -0400
X-MC-Unique: zY2SS22nM6iaC-esqEQ3xA-1
Received: by mail-ed1-f71.google.com with SMTP id
 u17-20020a50d511000000b003daa3828c13so4958457edi.12
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 14:46:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lIZIQ3mYE62DqF45OP1btlXezubRtjgW2MB6oakfjBo=;
 b=61LTqCX2LBLVvjoev0h4ansLgGx3VKEn+wL0idLIVwC3E+LYrHHhoVHbZcXWHOH+LW
 fC1CDZ9S1ggz1FpBwceQy23jY1wpwDszZW+joJoWgHiaoyQXi1y14zWsWvmmPBOMV5Vn
 Lv9i6pUszXAYscHNUi9DUcehKIR0fQ6hWy6D6GhuaErizFTPzcIJberB+oTmMccGMtRV
 ama7prAtqc3YpTv5x5iGeDCj5esMlKO7Dzj8/2vQjYfmSpEE1B0AvVYg9DhO4gExfkm8
 jzlEEAH4cjghZKFhh7ff8OkH3U/xwL64NKgwtNbtOyzsicbkqacQ9XD0LzHHwq1jPzld
 v7Mw==
X-Gm-Message-State: AOAM533i4kXYZulUTrnyM4ultYM4sNMyj7Uh/vrERtdZ3uaeCtpgKS16
 eMpQHPHJsk71h0YQ44xfeg4OnQSZ3YUZZjeab/Ebfy0TaU7+Z7P8WAt4cE3RejHxIrKCtN3W4JR
 0SBpv2osu6x9MqBk=
X-Received: by 2002:a17:907:7f01:: with SMTP id
 qf1mr2556019ejc.190.1634939192653; 
 Fri, 22 Oct 2021 14:46:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz+MwfwnORMBGjhzZVJgd4wKtLSWRRvTlJCNtDgs42WDaxFntVSBnIyBbybOrG0EANliRkJfA==
X-Received: by 2002:a17:907:7f01:: with SMTP id
 qf1mr2555998ejc.190.1634939192430; 
 Fri, 22 Oct 2021 14:46:32 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id s3sm4352493ejm.49.2021.10.22.14.46.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Oct 2021 14:46:31 -0700 (PDT)
Message-ID: <6e04392e-e52b-2011-0d62-4a6c24628e7b@redhat.com>
Date: Fri, 22 Oct 2021 23:46:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 5/5] sgx: Reset the vEPC regions during VM reboot
To: Yang Zhong <yang.zhong@intel.com>, qemu-devel@nongnu.org
References: <20211022192754.58196-1-yang.zhong@intel.com>
 <20211022192754.58196-6-yang.zhong@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211022192754.58196-6-yang.zhong@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.742, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: philmd@redhat.com, jarkko@kernel.org, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/10/21 21:27, Yang Zhong wrote:
> +
> +    for (j = 0; j < num; j++) {
> +        epc = pcms->sgx_epc.sections[j];
> +        hostmem = MEMORY_BACKEND(epc->hostmem);
> +        fd = memory_region_get_fd(host_memory_backend_get_memory(hostmem));
> +
> +        failures = ioctl(fd, SGX_IOC_VEPC_REMOVE_ALL);
> +        if (failures < 0) {
> +            return failures;
> +        } else if (failures > 0) {
> +            /* Remove SECS pages */
> +            sleep(1);
> +            failures_1 = ioctl(fd, SGX_IOC_VEPC_REMOVE_ALL);
> +        }
> +
> +        /*
> +         * The host or guest can support 8 EPC sections, use the
> +         * corresponding bit to show each section removal status.
> +         */
> +        if (failures_1) {
> +            set_bit(j, &ret);
> +        }
> +    }

This sleep is not necessary, just do two tries on all the regions.  So 
something like

     int failures;

     /*
      * The second pass is needed to remove SECS pages that could not
      * be removed during the first.
      */
     for (i = 0; i < 2; i++) {
         failures = 0;
         for (j = 0; j < pcms->sgx_epc.nr_sections; j++) {
             epc = pcms->sgx_epc.sections[j];
             hostmem = MEMORY_BACKEND(epc->hostmem);
             fd = 
memory_region_get_fd(host_memory_backend_get_memory(hostmem));

             r = ioctl(fd, SGX_IOC_VEPC_REMOVE_ALL);
             if (r < 0) {
                 return r;
             }
             if (r > 0) {
                 /* SECS pages remain */
                 failures++;
                 if (pass == 1) {
                     error_report("cannot reset vEPC section %d\n", j);
                 }
             }
         }
         if (!failures) {
             return 0;
         }
     }
     return failures;

is enough, without any need to do further retries.

Paolo


