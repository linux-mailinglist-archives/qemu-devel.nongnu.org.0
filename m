Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3E96F0270
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 10:20:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prwrG-0007QL-Fb; Thu, 27 Apr 2023 04:20:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1prwr9-0007PN-TQ
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 04:20:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1prwqu-0008F7-Sr
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 04:19:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682583576;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sFtUvoE0eHDC2HpV4oGHkxfd7astdfA8slZEKZeEvQY=;
 b=fp69Xc4aEaD2XlSg984a8Q7HZ5wnWO4zt7mf8VM2+jmQEbNw9pDIF8Q/gJjcmO461iBo8l
 TOeW5Vz4tTd3p/KGdRO+8D/WF7ikwBuSrhv2qKF9qJewHFii8VgUARKTDHsT4fQi4F6MEz
 JUCE0KiZJHFNff4q+5lT9xQB8YFwgyU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-538-DjJ4WARuMH6lzuduK05AbQ-1; Thu, 27 Apr 2023 04:19:31 -0400
X-MC-Unique: DjJ4WARuMH6lzuduK05AbQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f16ef3bf06so28295345e9.3
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 01:19:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682583570; x=1685175570;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sFtUvoE0eHDC2HpV4oGHkxfd7astdfA8slZEKZeEvQY=;
 b=YeIKmKMa1IQkFsEXrPg34VWnq+mE+bNl1R+X2cjHpTjQZ10J4nqDIkUf6Rz8Ywt6tx
 QSNyA0hE/PcypbMQ/851JJ+mRd4f2N/ZJRC+pxt5Bba8J0nxcshWb5jd+rNCB0btZukH
 sJW9T/9yThCCTgWM/xMomwNC1R63k3HVtZzy6Xh6H+pfVVDRYQPJ/6LqtbzOZC4gFeUF
 zyQLcVXIhBkU5sPPpNgp/52EpcQJ/T40qhm4XosKvrMj7EWvQbh3naQj8ZmhUg0FgbxP
 u2bMLTRdyzHy8b0hP6GjgFdg0WUgtF2zXEgAOawBYhInIggstTX4YJWe3prwSX4pebbP
 79Zg==
X-Gm-Message-State: AC+VfDxSHFYA87Nd3osVsmHvTV5SMoadrMpO9iOBHMdxk6J8gpjTBfoV
 yS+FDhATpAYnEkhOH3EBIWS7dV1AZxx+7nZWegVzKOdajb4cAeipmTAmU85CQmjf4B46fvAhJ71
 hviodm2/KVqzTD/c=
X-Received: by 2002:a05:600c:ac8:b0:3f1:819d:d050 with SMTP id
 c8-20020a05600c0ac800b003f1819dd050mr654836wmr.37.1682583570420; 
 Thu, 27 Apr 2023 01:19:30 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7s1dyYBiL4t7WLkYL0KdM9a3BiugKy82vPxe9SB0twLnukRNmRRuphfAFZFYFXRaoQtWsS2A==
X-Received: by 2002:a05:600c:ac8:b0:3f1:819d:d050 with SMTP id
 c8-20020a05600c0ac800b003f1819dd050mr654824wmr.37.1682583570047; 
 Thu, 27 Apr 2023 01:19:30 -0700 (PDT)
Received: from [10.32.181.74] (nat-pool-mxp-t.redhat.com. [149.6.153.186])
 by smtp.googlemail.com with ESMTPSA id
 11-20020a05600c228b00b003f1736fdfedsm20469219wmf.10.2023.04.27.01.19.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Apr 2023 01:19:29 -0700 (PDT)
Message-ID: <e50334ea-9ae6-13d1-ac41-035f07ce7980@redhat.com>
Date: Thu, 27 Apr 2023 10:19:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v5 2/2] migration: Make dirty_bytes_last_sync atomic
Content-Language: en-US
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>, Leonardo Bras <leobras@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20230426201002.15414-1-quintela@redhat.com>
 <20230426201002.15414-3-quintela@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230426201002.15414-3-quintela@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.422, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 4/26/23 22:10, Juan Quintela wrote:
> Don't use __nocheck() functions.

Doesn't this break on 32-bit platforms?

#if defined(__x86_64__) || defined(__sparc__) || defined(__mips64)
# define ATOMIC_REG_SIZE  8
#else
# define ATOMIC_REG_SIZE  sizeof(void *)
#endif

#define qatomic_set(ptr, i)  do {                      \
     qemu_build_assert(sizeof(*ptr) <= ATOMIC_REG_SIZE); \
     qatomic_set__nocheck(ptr, i);                      \
} while(0)

So if sizeof(void*) == 4 it would trigger a compile-time assertion.

Paolo


