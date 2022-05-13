Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA6E5266E9
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 18:20:58 +0200 (CEST)
Received: from localhost ([::1]:39102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npY2D-0002Gw-Mw
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 12:20:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1npXxx-0004Kt-Jy
 for qemu-devel@nongnu.org; Fri, 13 May 2022 12:16:34 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:42784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1npXxv-0005kS-Hu
 for qemu-devel@nongnu.org; Fri, 13 May 2022 12:16:32 -0400
Received: by mail-pf1-x42e.google.com with SMTP id x23so8078957pff.9
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 09:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=VUX4z5JP9JFb7BBHbEjVcuc1OlAnU2bHyEquKRs2d3s=;
 b=Kppmor4I85fiAPIQqKOj0dhfC+mRMMFyMmBcdu+NT0OOi/+VKHpacZDGEMkY1AxodN
 CMKkkiKpMdKHD2K6St2PsX0kdZ+lVPpsS0Bgz7huh0IYydUE3uXLt9U78Qyau8JBcqyW
 RfRg/+O72UuMLYy2WMcCQVd/THl2GxXR9fn5IK0tZpuPlHKuqCEuCFd5S1lDuWJPS1aH
 u9cgPjDw8i3rK4H/aXd46XgyIyf+L7sGmrsnwZtQcTryfqdh10tolkIdhebJ9mKtFO4t
 bl3jy9FVyssGdDgAvFKg6oROmU0CVvnRj0ce+zVEQoXeYJFCig1qGF3B5iKs1MW7256G
 v8dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VUX4z5JP9JFb7BBHbEjVcuc1OlAnU2bHyEquKRs2d3s=;
 b=FE1+7+Ag5HjK2ST0te8dlGcwqhxNOzAJGjtkCeTSxOIIMbu+o2MA3p1GUTAkBWK7n9
 FhLrmhZTdqkqCYzi//unsvouhQeJCk+LKAoTE/TQZNCBlnbGeeJJITu8ulDdk695wZ2q
 WyaDkZJurwWXlRV51lvXkN/rbEiQRrg9sAziQqrN73wb4LLyOxoUlqdAvDw65BTNlbLo
 vSoXZwCnjX6SJfQg2YeMj4VnHsPHMJxUtx6FN6ewmxFtonaBATxhmI7Nc47pNAFKD9jE
 AruYxy+J+t9jWHKSZWyA0cdQjGKJ+ejAaFs9RYTinAV3vYSSxrntQi1b7QMAsFX8fEge
 YU7g==
X-Gm-Message-State: AOAM530QJSYAsDUVJi1gqCgiVaAR7UH/dXZaZptCaZw7Mc6jZPZBFQG9
 9dyeBMtTFTQY6PgXFenjFAZKgQ==
X-Google-Smtp-Source: ABdhPJzQTx4fhDj5JimpggrBGT8MN9G7BPIFfhxBOCcsNZztoEJObjKVOvuVnjQ3D875SLUMv4/oNQ==
X-Received: by 2002:a05:6a00:15c2:b0:510:6d56:730 with SMTP id
 o2-20020a056a0015c200b005106d560730mr5387667pfu.62.1652458589526; 
 Fri, 13 May 2022 09:16:29 -0700 (PDT)
Received: from ?IPV6:2607:fb90:46a:1099:e682:8d73:3200:dae5?
 ([2607:fb90:46a:1099:e682:8d73:3200:dae5])
 by smtp.gmail.com with ESMTPSA id
 w2-20020a62c702000000b0050dc762815fsm1996422pfg.57.2022.05.13.09.16.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 09:16:29 -0700 (PDT)
Message-ID: <faa22312-d676-cd28-ccd9-438acd57cd6c@linaro.org>
Date: Fri, 13 May 2022 09:16:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PULL 06/15] target/s390x: vxeh2: vector string search
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
 David Miller <dmiller423@gmail.com>, David Hildenbrand <david@redhat.com>
References: <20220504110521.343519-1-thuth@redhat.com>
 <20220504110521.343519-7-thuth@redhat.com>
 <CAFEAcA-smunqB+Q9NfD=1=QJT2pAZ+OqZTe==ZYbZkx9Rp=pMA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA-smunqB+Q9NfD=1=QJT2pAZ+OqZTe==ZYbZkx9Rp=pMA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 5/13/22 08:54, Peter Maydell wrote:
>> +    s390_vec_write_element64(v1, 0, k << es);
> 
> Specifically here, because k is 32 bit but s390_vec_write_element64()
> takes a uint64_t argument, we will do the shift as a signed 32 bit
> value before widening to 64 bits, so if the values of 'k' and 'es'
> are such that we might shift beyond bit 32 we'll get the wrong
> value. It looks like 'es' is one of the MO_* values, so generally
> small, but the upper bound on 'k' is a bit less obvious to me.
> Is the overflow-of-32-bits case impossible?

No, the upper bound of (k << es) is 16.

We perform the operation with k in units of element size, so that indexing works nicely, 
then convert back to units of bytes at the end to report results.  It's a byte index into 
the vector register, with 16 as an indicator of match not found + eos not found.


r~

