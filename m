Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3BE40366D
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 10:56:42 +0200 (CEST)
Received: from localhost ([::1]:43946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNtNp-00051d-RM
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 04:56:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mNtLQ-0002Or-QL
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 04:54:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mNtLP-0002ed-7K
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 04:54:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631091250;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=soKqeoV9tDu7pLkh1tRGV9RUANS0gpPaTigb/8qMz7A=;
 b=CdncBc9DXThpwVp4zId1/a8VK9gBB5XFRE3rsQGdkNn1uv9VSc/17XHm0eC63Murq+4FB3
 zP/Eng5Mv4m7M1R4o8KVq9cL4RFeUDedoW2HefsduzjAcm0gBqNy3B/fJ849T2UbpObX5X
 2vVIBMAGqjjbv0WLLLihg0wbVHIeS38=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-187--m8AwSoVPK-GkE763DvhzA-1; Wed, 08 Sep 2021 04:54:09 -0400
X-MC-Unique: -m8AwSoVPK-GkE763DvhzA-1
Received: by mail-wr1-f69.google.com with SMTP id
 n1-20020a5d4c41000000b00159305d19baso298957wrt.11
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 01:54:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=soKqeoV9tDu7pLkh1tRGV9RUANS0gpPaTigb/8qMz7A=;
 b=G675tL+lTZWTgTiqLJ0wcI+qhHfMjmFJY1+ccjIkkW66R9FLxbAvMOl2akWDSlOKsi
 wrU4rTCnJ1A+6NYiC7bYNrzftD4LEJXZt5lwuP2SaJTHO+cyhyk+vUYoFpK/HQjuK+OR
 7AR0jhV4l0sfFn9imjfj7iIUBY/e8wri3kiG0AUrNnHrMx6GCd7Lp+INx85zMCwJSdQ7
 M2Fm5gGqTDr3M8VP+Ih484K9FD34I6QPRkqN2Mcl/FbWvXMonmR9RysYrzMKrzz5VkZV
 mGNCpgnPdqIXmyMPTcjdnYW3Qzl7nmT4olqjG6E/IrlNyW7fXzDLBmJJ7nyTxfN0zoHC
 7/Hg==
X-Gm-Message-State: AOAM532l42b9rVMfqh99FQQFyq1cJODG3o4vn5pusZvhOar3ujorYes2
 m56h+XFy9Jc2D/44us6Ww2jXvDPNbj0IC44SpXe9yDwaGc4aJI+sVK60wBvJA/BTnIMfd7WpiqU
 9CBmnocopAX01aJI=
X-Received: by 2002:a05:600c:295:: with SMTP id
 21mr2366772wmk.37.1631091248162; 
 Wed, 08 Sep 2021 01:54:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzM2NjhJCRNQdMp0M1vqxrl+cF3XHEu4XAWUutw6TWwbRa5EVzJ836sgMVZN8AzLkqs3vS0PQ==
X-Received: by 2002:a05:600c:295:: with SMTP id
 21mr2366755wmk.37.1631091247924; 
 Wed, 08 Sep 2021 01:54:07 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id w9sm1500759wrs.7.2021.09.08.01.54.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Sep 2021 01:54:07 -0700 (PDT)
Subject: Re: [PATCH 6/7] monitor: Fix coredump issue in non-x86 platform
To: Yang Zhong <yang.zhong@intel.com>, qemu-devel@nongnu.org
References: <20210908081937.77254-1-yang.zhong@intel.com>
 <20210908081937.77254-7-yang.zhong@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <17d61d04-4276-dd5b-b23f-9597c1fad1f1@redhat.com>
Date: Wed, 8 Sep 2021 10:54:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210908081937.77254-7-yang.zhong@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.332, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: seanjc@google.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/09/21 10:19, Yang Zhong wrote:
> +    if (sgx_enabled) {
> +        MachineState *ms = MACHINE(qdev_get_machine());
> +        X86MachineState *x86ms = X86_MACHINE(qdev_get_machine());
> +

You can use object_dynamic_cast(ms, TYPE_PC_MACHINE), something like:


PCMachineState *pcms =
     object_dynamic_cast(qdev_get_machine(), TYPE_PC_MACHINE);
X86MachineState *x86ms;

if (!pcms) {
     return NULL;
}
x86ms = X86_MACHINE(pcms);
if (!x86ms->sgx_epc_list) {
     return NULL;
}
info = g_new0(SGXInfo, 1);
...
return info;

Also please squash this patch directly into patch 3 that introduces 
sgx_get_info.

Paolo


