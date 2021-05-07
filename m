Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA56376867
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 18:03:12 +0200 (CEST)
Received: from localhost ([::1]:34856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lf2wY-0007hW-N3
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 12:03:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lf2t5-0006En-V6
 for qemu-devel@nongnu.org; Fri, 07 May 2021 11:59:40 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:43586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lf2ss-00064V-J1
 for qemu-devel@nongnu.org; Fri, 07 May 2021 11:59:33 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 cl24-20020a17090af698b0290157efd14899so5580127pjb.2
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 08:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=d7jv4zOm3ReTIeRrS+13gTyx4T6znAQLdZT0jfWV9Mg=;
 b=BvksK0Ks0r5FKrZiEpT3wVjPf/32vZ6B2Odz7lMbkA2XTJN8E2ZBUuc2/fcZfc6fhD
 ujoO/tQI8k9XoeShNHq1E2ZWYbhrp1psPBsnuNy7WE6v/GHbATuMhFwX7tdH6yhUYN7d
 O6wXZ7ipk5/b2aOUqY9IVuT/LkYWieZtr3eAj6SdURLzQ3qccgO382dCX7br21z0hNlm
 n0zCqFKL0j+mTiLn4WxdeVbD3kAuAPORvbqDs7SR8rRWLwXsSe9c7obFnf2dwHCgG26M
 6ruxC+653+2tSXV/u1hfEiAX2HBDFhvdm2BC3ZoDRGsEv1lwkWZN7V/xLWZjy4ZBlsSk
 zaQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=d7jv4zOm3ReTIeRrS+13gTyx4T6znAQLdZT0jfWV9Mg=;
 b=Gzwad50xHzWTIcJFLMFWoutrn0Yg/sVeBFFBp6Km1vZu6ej2ifdbpW3pqnODUN4nfW
 UBbn3ZPcR1lpoFuZq0FWbG2YU+gwIAh8V0Tv3MHWnSFaIMawqgZtpNanyZiUGM96ciC/
 +QHnzVgyO9AcK9rHIgvq5PkAYOGJ4r7m6sM1cEGVOV/cx4wjmOJW7Anhky7cXmj8aiz4
 /1D1hqrPn+5Hl+HCMKT7KUHvBN5nfIafdJEWkfd9ZteClceONaxi+3YllX9wjsKayc80
 wsQhT1aQxcY9gfC4TSPoj1gVL/hu6L1986lIoA7UPfpAh0I4u+GkDAQtiJAux6oItbYc
 bp5Q==
X-Gm-Message-State: AOAM5318oa364xW1tJZmLTM2xqYrxvNp+n5W/ONaKVpfPlkLKgnuBpAo
 Dbs4lneEbHFe40ar8mlc1VeSug==
X-Google-Smtp-Source: ABdhPJwy3gQYbPBZlaz5S5bNPH4VouquSPnEbMp9T3ml1AGB5vbVtXY+gEMtUS8o2nKFdrJyXamn+g==
X-Received: by 2002:a17:902:e5cb:b029:ed:64d5:afee with SMTP id
 u11-20020a170902e5cbb02900ed64d5afeemr10517733plf.41.1620403160865; 
 Fri, 07 May 2021 08:59:20 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id a129sm5299173pfa.36.2021.05.07.08.59.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 May 2021 08:59:20 -0700 (PDT)
Subject: Re: [PATCH 07/23] hw/block/nvme: Use definition to avoid dynamic
 stack allocation
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210505211047.1496765-1-philmd@redhat.com>
 <20210505211047.1496765-8-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0161c3a7-c3e8-d69b-8c60-fc63927e34af@linaro.org>
Date: Fri, 7 May 2021 08:59:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210505211047.1496765-8-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/5/21 2:10 PM, Philippe Mathieu-Daudé wrote:
> The compiler isn't clever enough to figure 'SEG_CHUNK_SIZE' is
> a constant! Help it by using a definitions instead.

This isn't about being clever or not, it's semantics.

In C++, "const int" is a proper constant, but in C it is a variable with a 
constant value.  Thus the use of the symbol in the array bounds is, by 
definition, variable.


> -    const int SEG_CHUNK_SIZE = 256;
> +#define SEG_CHUNK_SIZE 256

enum { SEG_CHUNK_SIZE = 256 };

would retain the function scope for the symbol, if that's desirable.


r~

