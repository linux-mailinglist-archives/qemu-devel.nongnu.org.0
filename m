Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85ECD59055B
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 19:05:31 +0200 (CEST)
Received: from localhost ([::1]:50490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMBcf-0002l8-Ci
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 13:05:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMBWl-0004nE-ED
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 12:59:23 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:45913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMBWj-0006dF-Lb
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 12:59:22 -0400
Received: by mail-pl1-x636.google.com with SMTP id 13so15985881plo.12
 for <qemu-devel@nongnu.org>; Thu, 11 Aug 2022 09:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=23uyJM2IBqm6cOwM6U6cZnoa+nNoxdUerjBAVGF/rL4=;
 b=gavaouZbRJt6T8OFQxajjzFPXVa+JjWQEMsPnUqzLdgQVCwZiciaDP+DuceOjEF84G
 mlebPoBNnBSde5Hx/9cZkpIWh38DbtJMSouqvj3RVvxIJdOaYAkOdznGouQs+IEvlSEk
 kHyNFSPE5E5jzDpeO7dW/YwRzZDJ1ER/ZLQUkFxnMiJ0KZDSO9riDluAL0C/q2UB1De2
 El2kxhPZyN4BifJC4gkUqs61X6hpZYdtHC9jSJY5vvQ7Uh99Z0TvjmhM2/6KsiWr6b52
 MyD1tr/1MmKWHB5SOncbJf0phVTuehlx234hwbySruWWamtlvX99aesBTUgznYccyFmZ
 mLhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=23uyJM2IBqm6cOwM6U6cZnoa+nNoxdUerjBAVGF/rL4=;
 b=jSJ5anrveo70wdYQ4q8wNfpDrKd45M0aewPmGBFCiFbxLDaz3IH5dWA+EQQKC6XAIP
 IHNhps7QrdedZEOd2yTfEhwrJ7yXMoXJO4f9Ca/Fb7QpwYOGvUx16MTD7tuW5cu6TB7Q
 0DMypSO4mJJRHEdJ7NTJ3uitKE39G1FQnVefslj4Xj4z1BJ4EhCxgVR6VpVf1upvRUbS
 Up2nT6NPyvbAu60buIUm5vvpX8D9yZoA0xg1+tMv1uCe46iHZV7twUtW/qKDM82ZTAOC
 dNl+4qiopL+j3q2ul8Ufs3hxBCz/rPz4sjnpgBELZkkn53RY1VOn5DUwf42xim3/FGNw
 nqog==
X-Gm-Message-State: ACgBeo18tT+5dCcN5eWppCAHPenh/ZE3fDuhZw/E3PrSakkF2ZD8r2DT
 FyxwJQdIdRdrNvfKGZMerMPD9Q==
X-Google-Smtp-Source: AA6agR6rOOFP5m6ZyaE42zu1K3jclXn+n+0rU+qrsvks3ol5wKDCX5PXj+HU/6ftYym8xpX+1QH1xQ==
X-Received: by 2002:a17:90b:1b45:b0:1f5:753d:82bc with SMTP id
 nv5-20020a17090b1b4500b001f5753d82bcmr9581150pjb.68.1660237160221; 
 Thu, 11 Aug 2022 09:59:20 -0700 (PDT)
Received: from ?IPV6:2602:ae:154e:e201:72e2:2d06:c2b1:b106?
 ([2602:ae:154e:e201:72e2:2d06:c2b1:b106])
 by smtp.gmail.com with ESMTPSA id
 a10-20020a1709027e4a00b0016cd74e5f87sm8451481pln.240.2022.08.11.09.59.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Aug 2022 09:59:19 -0700 (PDT)
Message-ID: <3a443bf9-948d-391d-c04b-3b18f37e97ca@linaro.org>
Date: Thu, 11 Aug 2022 09:59:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v4 2/5] accel/tcg: Introduce is_same_page()
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, Laurent Vivier <laurent@vivier.eu>, 
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>
References: <20220811095534.241224-1-iii@linux.ibm.com>
 <20220811095534.241224-3-iii@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220811095534.241224-3-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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

On 8/11/22 02:55, Ilya Leoshkevich wrote:
> Introduce a function that checks whether a given address is on the same
> page as where disassembly started. Having it improves readability of
> the following patches.
> 
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


