Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE7D6AB1D3
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Mar 2023 20:12:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYtlT-0003aF-7N; Sun, 05 Mar 2023 14:11:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYtlM-0003Zx-NU
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 14:11:17 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYtlL-00082B-5d
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 14:11:16 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 m20-20020a17090ab79400b00239d8e182efso11062732pjr.5
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 11:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678043473;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1H3PzSqUSs6DiBLRaPEq4X0P9jgyJQ/nWTC9BA47OVk=;
 b=Iu8HmQnCjvs0TjElmo1SMhx2xVnrdAojnTxYc125qSJ4mAv5OFdr9r5bBZ7ZABhojX
 Eu/Zi/SOphok8tGeSb/sSLeZbqt6xYem0DijWZODOndtvZyn+0rlrbsUjtxdNe+gfSzr
 iuuIJWB5n1ysg8YQ+xiSAdiFON6Zr4cX33opnPNS4MxEk2JvNLism1fB9PiqpMmihccB
 2hhUhpd/l2pq1+G7X+PX1ohADBk4/pajQA9UzqEglZ326fj/P5It11QRMxOrnbNNBt33
 T7CFn8dUOE50nuIGOHMGX/rhfIRf6mFb3rUNbIhyZbQ2E+a3PYdXzPaofXfi3LD7dudE
 4r5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678043473;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1H3PzSqUSs6DiBLRaPEq4X0P9jgyJQ/nWTC9BA47OVk=;
 b=KXvG6GyZYoo6mQI12YZ3Vw4cC2sSDXQ/20oALWZGciokALomJeMJqWwMScZheJzi2Y
 xY95FRwIgkNQe0wK9Hfz4FaX7xvKWjiwJuhUk6IRbZzEaBDyfZ+Uq1SHxGBm3E77U1YU
 8mh1v2lbw8TUu5LsO0KPFkOxicatjCNtQAYw00x2o4bZr0AoaF6zgYNJVOuA/ReaCW/E
 0kcnWrcATCtZHhQwXFEvE9MwES6tE3ftp+uf65iIAtLVcJJDwrrG+Tg2O/pr+iv0W1j5
 HCC+fdM9jZblUKZumNL8mZrSMtTbuN8bYNL0PgZlz6eDMLVQzoadJKKKjU11IeB088bv
 UEIA==
X-Gm-Message-State: AO0yUKUI7jOfcFSDU//JMeYE3MUmhFwQw2s40wpXpJBm+4QeUjEMkv+i
 lpYys1sLMI4uoJ4kQ/JN0WcVUA==
X-Google-Smtp-Source: AK7set+Fh1XJPcLWlGy7s6EfaTOxRwYbxgMhzzv8E6oKIL9HybnLLL/HzGaQQdtkSGFqh4QMIWee2Q==
X-Received: by 2002:a05:6a21:78a1:b0:cd:3069:28cd with SMTP id
 bf33-20020a056a2178a100b000cd306928cdmr9933376pzc.39.1678043473216; 
 Sun, 05 Mar 2023 11:11:13 -0800 (PST)
Received: from ?IPV6:2602:ae:154a:9f01:d15:390f:de71:e264?
 ([2602:ae:154a:9f01:d15:390f:de71:e264])
 by smtp.gmail.com with ESMTPSA id
 e5-20020a62ee05000000b00608dae58695sm4817000pfi.209.2023.03.05.11.11.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Mar 2023 11:11:12 -0800 (PST)
Message-ID: <80432864-ed30-36fd-55f9-a6b1362365a2@linaro.org>
Date: Sun, 5 Mar 2023 11:11:10 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/8] qemu-thread-posix: cleanup, fix, document QemuEvent
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: gshan@redhat.com, eesposit@redhat.com, david@redhat.com,
 stefanha@redhat.com, cohuck@redhat.com, eauger@redhat.com
References: <20230303171939.237819-1-pbonzini@redhat.com>
 <20230303171939.237819-3-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230303171939.237819-3-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
> reveals some unpaired memory barriers too.  Document more clearly what
> is going on, and remove optimizations that I couldn't quite prove to
> be correct.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   util/qemu-thread-posix.c | 64 ++++++++++++++++++++++++++++------------
>   1 file changed, 45 insertions(+), 19 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


