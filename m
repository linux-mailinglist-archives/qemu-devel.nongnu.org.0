Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C73656AB1D5
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Mar 2023 20:14:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYtoF-0004k5-95; Sun, 05 Mar 2023 14:14:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYtoC-0004jW-Ko
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 14:14:12 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYto6-0008MR-Np
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 14:14:12 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 x20-20020a17090a8a9400b00233ba727724so9325700pjn.1
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 11:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678043645;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eSHr+307xaZj7sz5cE/uail1FSfmFwvVt/TAXoHacsQ=;
 b=qdyiPl4dRMQXlA7EgcLj5gD2YZyDV2eRvIjLcCY9YxAWJvCaVmvSvQa0/2ukl9X7xN
 JI0Ih4qS4Gi119M/2835nIaZZUAknab8AnAp3qFUAdqHA/KiRfe//gFA4VRWg7M7b/Nq
 YpaZXjhbyAtZhI5XsDMHvOzV4g0fcfbgXTFfHgj4XQ3Zp6kK2nqWllW6Tm4ureOGHs00
 iomBQyvYA4dp6Wa4YuJs9TueHcmu4TbsLYqwLg7fTUzAKzRL2Ro2dWs2kjAYv07iukeM
 fE9chBA0AzrnMHcTDePe1G9Nf0qzELz3UDkkhqG0cp3GeFn0R/MFf3OrdZXZk8JDQqFG
 ULdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678043645;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eSHr+307xaZj7sz5cE/uail1FSfmFwvVt/TAXoHacsQ=;
 b=EV8Rnju/oOzn7/3zx25GgG7+zVdyfH8V67OvPFXM5WNukk9Odm/MDN+yvFznG/6kDl
 q3diX4xFdJCdkQ+CnUzJzXxA0FjVlQjJnWr31C4C1fRKA4RdERFEs+P5U7SnrzDTsBy4
 VYOiWgPc+x7ZvWoIfpTtXAC1NDuxNOWopWWIUsK0qM/sDyiN509WQQ13acygEdK3OOz2
 nhXYDqzH2fb5ioXYPQkOa8t78uovEz3D2sjQiaHUR2gOfx3d4U/D4uklc52K9Ov123R2
 9Sxy3UpBGm447xP1H0fkjMc9olLwzTUIvx/dLhB0B6lEtZ4wJv89phlecFvT3npFUvSD
 6arg==
X-Gm-Message-State: AO0yUKVFILPuhIt91uGYMOeVXZNWM6Q36QqaYHcgGp9n/0R1UdI1rcPS
 MKvv/XYUCUvDV9P82dcn9fCmbg==
X-Google-Smtp-Source: AK7set9+o17rzQ8OyphB/D9E04Ct3lkHaLQoqKxc1wXcxQJO7grwPlLKRGO3+sLwQHLa4xE/XbcdFA==
X-Received: by 2002:a17:90b:4c50:b0:236:73e8:f53 with SMTP id
 np16-20020a17090b4c5000b0023673e80f53mr12975745pjb.19.1678043645063; 
 Sun, 05 Mar 2023 11:14:05 -0800 (PST)
Received: from ?IPV6:2602:ae:154a:9f01:d15:390f:de71:e264?
 ([2602:ae:154a:9f01:d15:390f:de71:e264])
 by smtp.gmail.com with ESMTPSA id
 h9-20020a17090acf0900b00219752c8ea5sm4592433pju.37.2023.03.05.11.14.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Mar 2023 11:14:04 -0800 (PST)
Message-ID: <41a00ea3-4a49-22b6-b925-55c30b5adeff@linaro.org>
Date: Sun, 5 Mar 2023 11:14:02 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 3/8] qemu-thread-win32: cleanup, fix, document QemuEvent
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: gshan@redhat.com, eesposit@redhat.com, david@redhat.com,
 stefanha@redhat.com, cohuck@redhat.com, eauger@redhat.com
References: <20230303171939.237819-1-pbonzini@redhat.com>
 <20230303171939.237819-4-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230303171939.237819-4-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 3/3/23 09:19, Paolo Bonzini wrote:
> QemuEvent is currently broken on ARM due to missing memory barriers
> after qatomic_*().  Apart from adding the memory barrier, a closer look
> reveals some unpaired memory barriers that are not really needed and
> complicated the functions unnecessarily, as well as some optimizations
> that I couldn't quite prove to be correct.
> 
> Finally, the code is relying on a memory barrier in ResetEvent(); the
> barrier_ought_  to be there but there is really no documentation about
> it; it only affects the slow path, so make it explicit.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   util/qemu-thread-win32.c | 78 +++++++++++++++++++++++++++-------------
>   1 file changed, 53 insertions(+), 25 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

