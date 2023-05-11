Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B03D6FF837
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 19:16:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px9to-0000Gk-Qd; Thu, 11 May 2023 13:16:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px9tj-0000CN-Vr
 for qemu-devel@nongnu.org; Thu, 11 May 2023 13:16:12 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px9th-0005ps-RR
 for qemu-devel@nongnu.org; Thu, 11 May 2023 13:16:11 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f315735514so293993955e9.1
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 10:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683825367; x=1686417367;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CDMN3sKVm1jD2bYZ9vikjhKGKoi9EocGE1LXwyV455U=;
 b=le+jpYqC1q4bMKUmm4qvf8wwZO912R99qHuw4fvnWx27wP6k3yU+JbXGDpE8azHGt8
 Z97fZVF/l0NAm/g7Ihsiv0A0nWXnnEpRWuJ9vToee5XiYEeXS2FCmIz7y5zG4np4Y2Ro
 gQt1m1lYoRvoR++8EppeMrZNZErt/AkiC37LqZUFd/9wV9q1P5Qv4XlNBjqCS6aeXQjD
 31MMl/mlvac1NWm3B1sQJfD6zcEBArdxMS+B/Se0B6cESdJLF1gX8dIEKNlIcwl8yLSj
 TPlVTBm0Npz4s7LF8DafmZ0x5UwzN/nlkckQqMvn7Yv4jVckuUwmLjecgIC943AUQkSw
 18cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683825367; x=1686417367;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CDMN3sKVm1jD2bYZ9vikjhKGKoi9EocGE1LXwyV455U=;
 b=ldRWuEYaHiYFixqsTE6wCdmtb3D4bTBOs6DIpjEqfk2jZChpzi1y9mDaF1zLBZRmLn
 xtoDNryeWSqRyo3AdwyCYFX7IL5gqpNr82mCDH4FEJBcZ6U/8bxe7vZGRqZkqm3zWDBU
 44MhF55r28V6xnzZuiTjruZOeEh3A3Yod3XjFH7GQIB/+7b6z8m2h3XzSWlGjCpC66GX
 w+KmTNqPpGq8G5g5UE8ix2rhOPqKw66tvcsdTMN2t3DLu+ICYaTVc3x5a85a02bwPs7B
 NXHWD6g+9UZmfwo9HgF1blLbtT+k5YKeU61giY+NgkKigcqhl7jc7+a/HGNF97/XJZN5
 iegw==
X-Gm-Message-State: AC+VfDy+bOgx88lSBZwbrOZG6GLRogsE6B+0niGK47xKMbK7BNGP/fIQ
 nL9+w1uOjHtWvgHYnzETiUS2MXdJmnV3b7s2rBafoA==
X-Google-Smtp-Source: ACHHUZ7//B5CQe+2iwnssLHkf4ADzaveAlZyioTfsDqMN1ByDsqzCi2ZJyELy1EwRw9HJDmsI/SGaQ==
X-Received: by 2002:a1c:7915:0:b0:3f4:2174:b28c with SMTP id
 l21-20020a1c7915000000b003f42174b28cmr11060904wme.14.1683825367406; 
 Thu, 11 May 2023 10:16:07 -0700 (PDT)
Received: from [192.168.1.177] ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 f5-20020a1c6a05000000b003f4266965fbsm11906628wmc.5.2023.05.11.10.16.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 May 2023 10:16:07 -0700 (PDT)
Message-ID: <91e23741-61d1-cd72-6c80-6114c5d57c1f@linaro.org>
Date: Thu, 11 May 2023 18:16:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 0/5] migration: Make dirtyrate.c target independent
Content-Language: en-US
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, Leonardo Bras <leobras@redhat.com>, 
 Peter Xu <peterx@redhat.com>, Andrei Gudkov <gudkov.andrei@huawei.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Zhenzhong Duan <zhenzhong.duan@intel.com>,
 Hyman Huang <huangy81@chinatelecom.cn>
References: <20230511141208.17779-1-quintela@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230511141208.17779-1-quintela@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.124,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 5/11/23 15:12, Juan Quintela wrote:
> Juan Quintela (5):
>    softmmu: Create qemu_target_pages_to_MiB()
>    Use new created qemu_target_pages_to_MiB()
>    migration: Teach dirtyrate about qemu_target_page_size()
>    migration: Teach dirtyrate about qemu_target_page_bits()
>    migration: Make dirtyrate.c target independent

Series:
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

