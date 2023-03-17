Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 474486BE245
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 08:54:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pd4tb-0005Ki-Dl; Fri, 17 Mar 2023 03:53:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pd4tY-0005KK-PR
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 03:53:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pd4tW-0006GX-H9
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 03:53:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679039577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F6Osy1gqWC2KahI1Kf3rJ33h1L/xNzGQiW8WHrLeDXo=;
 b=TmDNBsrycad+PEuZLVMGxWMHscE6ayPAINQfgxwOkVvOIceCZXp4EK+l5SG5pBtTMt2GQ+
 UlijSQ7Zr8zzC/EcDDeLVruWGu39fZXLfS1uIsFwsa+ehrnePrT0oC7LwaTB8lekaqE3EA
 zRpULVWjh8of+adzoUY8nW4ocGAY3uM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-562-bTZTJsX6M_iF2pfOKtRy4Q-1; Fri, 17 Mar 2023 03:52:55 -0400
X-MC-Unique: bTZTJsX6M_iF2pfOKtRy4Q-1
Received: by mail-ed1-f71.google.com with SMTP id
 t26-20020a50d71a000000b005003c5087caso5315967edi.1
 for <qemu-devel@nongnu.org>; Fri, 17 Mar 2023 00:52:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679039574;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=F6Osy1gqWC2KahI1Kf3rJ33h1L/xNzGQiW8WHrLeDXo=;
 b=KPoJSV0et2Ahu7LwXBRphHo1qV22hExL9+YVREXDGQVXUYY0HrTwhmM7obs571CS2i
 sGu2du/xZ7FrV3l95/iibG9d/xHem3f0OHzlRXvjHLMEADnbbkqsDCURXpUVV+ziwVoQ
 cOCtHHK9HQNldX/sEgGA27+Wz9OFqzZLpL3EY5sRx4GDM7dCupa8xpZhmg4VVLNCUMSe
 qT87rneyaxNZrO95ZyiYe8+JQIYEpZVOzP+2duDqEo2DxYpcrOeg7EMhvfSl+Gsl37Cq
 zpDe9IuBWZb+txyoIXe0tXa6tkpBiWH18iZLZYYu+3MeHB1NIdp7PMFz6sKpwe+89z3v
 4ZVQ==
X-Gm-Message-State: AO0yUKWtPNwk0wh76sI9HRMSd5e9gH3lYpTJnOT6N1YvWB7yxiTEUAI5
 N1cREddqWjTCgM341v+agtVjxA9nkaOw5GPhttEqe3VUfVCX24UZ44T8I1D/7fIEa6ApuqEfqz8
 PjswKKIw3DFyicPQ=
X-Received: by 2002:a17:907:a649:b0:879:ab3:93d1 with SMTP id
 vu9-20020a170907a64900b008790ab393d1mr16019333ejc.4.1679039574759; 
 Fri, 17 Mar 2023 00:52:54 -0700 (PDT)
X-Google-Smtp-Source: AK7set9V9jYOkzdOzw9GIy5/Tw4T7SnCDiObTtkTQNpih6puX2a6lfu+wt5oeA1AdA5foibQzBk/xQ==
X-Received: by 2002:a17:907:a649:b0:879:ab3:93d1 with SMTP id
 vu9-20020a170907a64900b008790ab393d1mr16019316ejc.4.1679039574473; 
 Fri, 17 Mar 2023 00:52:54 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-176-33.web.vodafone.de.
 [109.43.176.33]) by smtp.gmail.com with ESMTPSA id
 g10-20020a1709061c8a00b0092bd1a7f5fdsm653328ejh.57.2023.03.17.00.52.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Mar 2023 00:52:53 -0700 (PDT)
Message-ID: <dbc75a8f-5c56-4eb7-fd74-30856a31bb9c@redhat.com>
Date: Fri, 17 Mar 2023 08:52:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 2/2] tests/tcg/s390x: Add rxsbg.c
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org
References: <20230316172205.281369-1-iii@linux.ibm.com>
 <20230316172205.281369-3-iii@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230316172205.281369-3-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 16/03/2023 18.22, Ilya Leoshkevich wrote:
> Add a small test for RXSBG with T=1 to prevent regressions.
> 
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>   tests/tcg/s390x/Makefile.target |  3 +++
>   tests/tcg/s390x/rxsbg.c         | 46 +++++++++++++++++++++++++++++++++
>   2 files changed, 49 insertions(+)
>   create mode 100644 tests/tcg/s390x/rxsbg.c

Reviewed-by: Thomas Huth <thuth@redhat.com>


