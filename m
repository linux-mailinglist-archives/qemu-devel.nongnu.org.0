Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5173D60CC43
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 14:44:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onJHW-0002q0-Ah; Tue, 25 Oct 2022 08:43:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1onJHN-0002In-GM
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 08:43:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1onJHL-0002tC-Vh
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 08:43:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666701815;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XuPgnqH5797G/5yrah2QxarckjUjL7Hg0qCfvQ3D3+E=;
 b=c2xDA56NoFz3qB8+UkXx3P8OSnFGvsnF/xmDr2YP1bK2anz7+3VSVqutPxzauNNeDKSW5u
 sVy4zldT6xBP3wU7pNnLSvw//2l1RmFwI5wFUozl74r5BxtpgFMv9ZLqlRDhE+8vTYHCuC
 j5tUWp+1SND/cTLrYsmtExfmtmWq1f4=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-379-aFqUxGacPVSJwWzd3_ULhA-1; Tue, 25 Oct 2022 08:43:33 -0400
X-MC-Unique: aFqUxGacPVSJwWzd3_ULhA-1
Received: by mail-qk1-f198.google.com with SMTP id
 o13-20020a05620a2a0d00b006cf9085682dso11253296qkp.7
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 05:43:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XuPgnqH5797G/5yrah2QxarckjUjL7Hg0qCfvQ3D3+E=;
 b=eNmLlYmkMH6ZtbIPcLF+mIu4Olao+znd3B67i04dCjtOFX737EV1DYI5b4nd19NOEN
 ceV+Qcr+rxitX4tUawU6Va9gFK916gr1t1h8ntK5bIxvF9VYP0S4AEP68vp4Vjwy5wze
 SMbL0uwghILXx2t2Fd9KKzAuBOz4eUPy7TcooBj5jjxq9DdK0dY23Xl5e0G+owN4IcrD
 MdM2xcKdwsIad7DbUeDT9IJOwjHnUYIwFuhVh+ql+/u0En4gUIHdUh8Ii21AqGPhNs84
 wlxQXFQBjnV2JRur/Wd/lzD1wqshVcn8NtqOg5XU1jbaCamtRzbfiuV5285c6qpNWtZW
 VUCg==
X-Gm-Message-State: ACrzQf3O1S3gqmHeQXvVEqxQ8dk0wdksDVvbdG3YgHySBYkFAHSjFfZ4
 uhKtP3ZvUdj8V3HVA402V1K67hAFlQYuE6y6BC5I0hE3cmR83Eix/5RXnAioC3gwCbBIB0Ih3Zn
 af4Ne60S3Y7yjFd0=
X-Received: by 2002:ae9:eb85:0:b0:6ec:54e4:707d with SMTP id
 b127-20020ae9eb85000000b006ec54e4707dmr26805573qkg.336.1666701812338; 
 Tue, 25 Oct 2022 05:43:32 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7gZFRMtRKBbSjSyDcvOkLCg/i1/gtWWnH0lRLg9LsSVaZiS0y/B8wNNvEdcH+atV5QLwLB4A==
X-Received: by 2002:ae9:eb85:0:b0:6ec:54e4:707d with SMTP id
 b127-20020ae9eb85000000b006ec54e4707dmr26805562qkg.336.1666701812080; 
 Tue, 25 Oct 2022 05:43:32 -0700 (PDT)
Received: from [10.201.49.36] (nat-pool-mxp-u.redhat.com. [149.6.153.187])
 by smtp.googlemail.com with ESMTPSA id
 f14-20020a05620a280e00b006eec09eed39sm2022082qkp.40.2022.10.25.05.43.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Oct 2022 05:43:31 -0700 (PDT)
Message-ID: <2485e808-6115-1d18-0a4a-131c08cb4bed@redhat.com>
Date: Tue, 25 Oct 2022 14:43:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 0/4] atomic: Friendlier assertions, avoidance of __sync
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221024232435.3334600-1-richard.henderson@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20221024232435.3334600-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.517,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/25/22 01:24, Richard Henderson wrote:
> The current use of _Static_assert, via QEMU_BUILD_BUG_ON, requires
> the user have #if conditionals to avoid the statement from appearing
> in the preprocessed file at all.  Introduce a new primitive that
> allows normal C conditionals and dead-code elimination.
> 
> Remove all use of __sync* builtins in favor of __atomic*.
> We have required them since 47345e71247, last year, and
> should have removed these at that point.  My bad.
> 
> 
> r~
> 
> 
> Richard Henderson (4):
>    include/qemu/osdep: Add qemu_build_assert
>    include/qemu/atomic: Use qemu_build_assert
>    include/qemu/thread: Use qatomic_* functions
>    include/qemu/atomic128: Avoid __sync_val_compare_and_swap_16
> 
>   include/qemu/atomic.h    | 16 ++++++++--------
>   include/qemu/atomic128.h |  8 +-------
>   include/qemu/osdep.h     |  8 ++++++++
>   include/qemu/thread.h    |  8 ++++----
>   meson.build              |  3 ++-
>   5 files changed, 23 insertions(+), 20 deletions(-)
> 

For patches 1-3,

Acked-by: Paolo Bonzini <pbonzini@redhat.com>

Paolo


