Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 524B3406E07
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 17:16:57 +0200 (CEST)
Received: from localhost ([::1]:47068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOiGu-0001Yr-38
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 11:16:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mOiEL-0008C4-5v
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 11:14:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29228)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mOiEI-0006p4-AL
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 11:14:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631286852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Go4xsY7JYkj9AsD1ek9emZ5jXGurL1Yr5bW5peXnXZI=;
 b=VDAi/0vemF8qpGIwuuhgUj4boMVC4mXOFR1L4/El2dVagi/cBLZUPbJllb2M7nsQlVbU+m
 XGMOIBp+2WXEEvt2CBfiF1Q2ZdJnENGK/VuQYsNBUG22b3Kmm03tO6CepUpS3NWMA/1s2d
 w7OUm50q6gX1y1CiNlrSlM6R+jZkTE8=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13-wOBuTRprPVKQ7mE56edXpw-1; Fri, 10 Sep 2021 11:14:11 -0400
X-MC-Unique: wOBuTRprPVKQ7mE56edXpw-1
Received: by mail-ed1-f72.google.com with SMTP id
 n5-20020a05640206c500b003cf53f7cef2so1106832edy.12
 for <qemu-devel@nongnu.org>; Fri, 10 Sep 2021 08:14:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Go4xsY7JYkj9AsD1ek9emZ5jXGurL1Yr5bW5peXnXZI=;
 b=PPNcsNZYsLUr7zTXS6f1FAXx1ctUV0vnAmoyKuiIuc8iaOU4Iu6qxdP6cLofkh8x1l
 GJMeuuXGHEyxKkY5qu6F9Q8GMlhXc4PD5lnwMX+k+oETi19yqF7EqbjO1wD2FVolnye8
 wXXdtWNeeyCJFX7/m58WRdxzRUSB3T8nmVX7KMXgJTDXwjC1xOW630dogfA+gQGh78lD
 iYt7twZKASHmaORvkuof/BwDo0bgwbc3Famv3kuz6ZfrcoYi+uh67EY4NPQ1bNMooisE
 2/CNO8O53jsFUshGknQ92zq4OoEgCpEcJeI3ywZjelr44xW9F8Um7Vcwl7xeJAApXOIw
 eoWg==
X-Gm-Message-State: AOAM531Vw2WcmR3JU8ilUJYJiLpzhZ9lIi5wXD2G05wmZltCwCG4I/Z+
 rgE3PWnasB/tQy+oeUTF+9oo9NqpplBdEQHcdU/4UXGA+jZVwhFwWF6b/QWgTFJ5CdNCNak2DNh
 afA3bSreY7M8KrSs=
X-Received: by 2002:a17:906:32cf:: with SMTP id
 k15mr10065527ejk.68.1631286850523; 
 Fri, 10 Sep 2021 08:14:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyeR6lz3JExDyC4Cq083wisTopNjp2Vc+T3gcVoMxpnIvdRcOyv2FudbxhM4+l8m3rgkCUnQg==
X-Received: by 2002:a17:906:32cf:: with SMTP id
 k15mr10065514ejk.68.1631286850302; 
 Fri, 10 Sep 2021 08:14:10 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id se22sm2570575ejb.32.2021.09.10.08.13.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Sep 2021 08:13:57 -0700 (PDT)
Subject: Re: [PATCH v4 23/33] sgx-epc: Add the reset interface for sgx-epc
 virt device
To: Yang Zhong <yang.zhong@intel.com>, qemu-devel@nongnu.org
References: <20210719112136.57018-1-yang.zhong@intel.com>
 <20210719112136.57018-24-yang.zhong@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <104814ed-4239-98b2-2550-8cc6784b130b@redhat.com>
Date: Fri, 10 Sep 2021 17:13:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210719112136.57018-24-yang.zhong@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.349, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: seanjc@google.com, kai.huang@intel.com, eblake@redhat.com,
 jarkko@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/07/21 13:21, Yang Zhong wrote:
> +static void sgx_epc_del_subregion(DeviceState *dev)
> +{
> +    PCMachineState *pcms = PC_MACHINE(qdev_get_machine());
> +    SGXEPCState *sgx_epc = &pcms->sgx_epc;
> +    SGXEPCDevice *epc = SGX_EPC(dev);
> +
> +    /* del subregion and related operations */
> +    memory_region_del_subregion(&sgx_epc->mr,
> +                                host_memory_backend_get_memory(epc->hostmem));
> +    host_memory_backend_set_mapped(epc->hostmem, false);
> +    g_free(sgx_epc->sections);
> +    sgx_epc->sections = NULL;
> +
> +    /* multiple epc devices, only zero the first time */
> +    if (epc_num == sgx_epc->nr_sections) {
> +        sgx_epc->size = 0;
> +        sgx_epc->nr_sections = 0;
> +    }
> +}

Can it just invoke a method on the memory devices, without reusing the 
code in sgx_epc_realize?  In particular why is it necessary to update 
sgx_epc->size and sgx_epc->nr_sections?

Paolo


