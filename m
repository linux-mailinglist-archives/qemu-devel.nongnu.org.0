Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E13F640C669
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 15:28:52 +0200 (CEST)
Received: from localhost ([::1]:42934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQUy4-0003UD-1I
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 09:28:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mQUsJ-0007al-3e
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 09:22:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mQUsE-0006EI-By
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 09:22:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631712165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7seXGDE90rXvlNurvu70SLjUf5F/z3EBZfCk2CJ9GVk=;
 b=LxIZ0OG5pXMio+OwK1gSfjYsflftfUib4Ucs46efkCYzxH1S26sf1SjAnojQ7OCH8dBiBl
 SzQzDox2sfBc0xMiFoH66VtKkl6MP0qHiD2GQH9o+FAypWHnW7yLyhH75/nuSuG+Y/Ywpz
 bfUW7omIiPwQJQanLvunOHmkndo0qPg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-580-Imp59UJjNuGR3cI_UTTSVw-1; Wed, 15 Sep 2021 09:22:44 -0400
X-MC-Unique: Imp59UJjNuGR3cI_UTTSVw-1
Received: by mail-wm1-f70.google.com with SMTP id
 a144-20020a1c7f96000000b002fee1aceb6dso1481919wmd.0
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 06:22:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=7seXGDE90rXvlNurvu70SLjUf5F/z3EBZfCk2CJ9GVk=;
 b=B1GJIIkxzR91L/PvNwFrxjY0lUvxTh6421KJM4aXiIjn+QEPD5v7X9CFgp07BoOMdQ
 +kIBYLD3QMX7Vpg+NQkFAYlc+p6vP6GGJERbbRqNGIUGeKE2V3N7r+5UjBNVT+YBvcSI
 9hm53LcmyBSQkbeoZOGzbCojJXrPdLB1mSDpWQaEQrjF3k4cOjtu9qg+TJ3+eoDyAhpz
 jGWfmZ/9MzR/XDTiF8JVOf6fK5eeXiILm4MSIIMKFY8uDapxdG5GLqTronJqjD12Mbw2
 3YjUOXIL/4TMaoW2rqyXslu2vFALPv25GImEe0WvxLSssGqT+xHdVkdWkWGPelqRgFhz
 Pymw==
X-Gm-Message-State: AOAM533lB3q0vBD0DbqLOS+7W5AdRxrfIH810fAzFoigse6L5dx6lMzW
 EdaNjuQFm+CkQOAVuIQ+Zj21cPVgnAwhqGzZ9Fo0yK8BWLSYkfRKdj2e01WSwgbAPV6o06nO1v4
 RYN95Xv+jWo/6a9RcfZ+oKAq12thUOLghLDM1z57lnqnuLWSQ691R7aWDNMSgkNY=
X-Received: by 2002:adf:9ccc:: with SMTP id h12mr4847810wre.385.1631712163719; 
 Wed, 15 Sep 2021 06:22:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJybG+GSXvTyKk1heRRcTDegbawWdgfMqHe9WF5x0qhCJbHj2KsthKO09LqOHIISPXQ0B88rbQ==
X-Received: by 2002:adf:9ccc:: with SMTP id h12mr4847777wre.385.1631712163300; 
 Wed, 15 Sep 2021 06:22:43 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6426.dip0.t-ipconnect.de. [91.12.100.38])
 by smtp.gmail.com with ESMTPSA id
 n26sm4035304wmi.43.2021.09.15.06.22.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Sep 2021 06:22:42 -0700 (PDT)
Subject: Re: [PATCH v4 05/16] tcg/s390x: Implement tcg_out_ld/st for vector
 types
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210626050307.2408505-1-richard.henderson@linaro.org>
 <20210626050307.2408505-6-richard.henderson@linaro.org>
 <7bd6c9a6-6b0f-5a0c-f9a2-be8a37102196@redhat.com>
 <166e6957-57a9-ea87-60d1-628fb44dfbea@linaro.org>
 <f8937442-09dd-bea2-1f03-935f2f4283ed@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <981b48d3-b064-ac1d-74dd-e252c849eb5a@redhat.com>
Date: Wed, 15 Sep 2021 15:22:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <f8937442-09dd-bea2-1f03-935f2f4283ed@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.698, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15.09.21 00:14, Richard Henderson wrote:
> On 9/14/21 3:03 PM, Richard Henderson wrote:
>> On 9/14/21 9:46 AM, David Hildenbrand wrote:
>>>> +        if (likely(data < 16)) {
>>>
>>> This actually maps to "if (likely(data <= TCG_REG_R15))", correct?
>>
>> Sure.
> 
> I'm going to add is_general_reg and is_vector_reg predicates.

That will make it easier to grasp, thanks!


-- 
Thanks,

David / dhildenb


