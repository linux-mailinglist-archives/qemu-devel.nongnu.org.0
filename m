Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A8C62F151
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 10:37:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovxnK-0001qq-W5; Fri, 18 Nov 2022 04:36:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ovxnJ-0001qL-4U
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 04:36:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ovxnH-0000LR-Ag
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 04:36:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668764178;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NKHbSdny9/cvQEKqC+6QCB4xG1318C8JoZ6yMY1rtTI=;
 b=ijovr79J6smDsuIyQVniIlq3mu5jxus1/oSz0IcQlRNH4oiAkt5hph0FyAa+4I1Dm04Ydy
 ySY91I5IWsNw21Nr5faxkJSCvxOaJRggNcE7fBTliO3lHOZXQDJd0HD6zm0fORyVlKfzxo
 ciJbob4poHaEvH4bOg1rbfJaQEt73n8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-600-u74vKm1PMCu7Q_dmAU5QTw-1; Fri, 18 Nov 2022 04:36:16 -0500
X-MC-Unique: u74vKm1PMCu7Q_dmAU5QTw-1
Received: by mail-wm1-f70.google.com with SMTP id
 l42-20020a05600c1d2a00b003cf8e70c1ecso4206417wms.4
 for <qemu-devel@nongnu.org>; Fri, 18 Nov 2022 01:36:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NKHbSdny9/cvQEKqC+6QCB4xG1318C8JoZ6yMY1rtTI=;
 b=ykdSZOFo+mcU1Nb2a8qnWa2Ai0eniy9HK2/DCdFYoV+phFJ0YRnp9bZ6NMZg1VZiZr
 FLj+nOoVD/Vsa4UQnRa4I2PP8O7IEij9GUS64g2y5SAwoCO1QYAA/M/w+vlUMWb7Kncp
 9v/xoVNX4iLXmkXbhqmjAwibH2dLeBSh0yG84d18+7VUIL6pUxV15KWS1hnm4aifnd75
 17mmdedcIfdGQAP6fY/3KOd368+XAfDLnXVskmOh6wGoyW3iV4hD0n8IwyjxmkGvtfdj
 iDWZ/+Fd4kK52ulyxt2Tn2Js1DfJLvGqdxoqNP44oXRAV/rPjQAQrnIRXbOha01/yCeP
 GCaQ==
X-Gm-Message-State: ANoB5pnrxuUaKZDbHLOo/1OrGdxsmEXq02uaQqmrzWXVKEkCfYN2BKW1
 NZYX55VAh+QfVNWkRZUjhCO/wloIn9jpz3fbh501fv1CnrM1r7URicFJyWfs4XU/kM+z0psQqWs
 QisoAmUnNPyi5cR8=
X-Received: by 2002:a1c:6a01:0:b0:3cf:a895:a9cb with SMTP id
 f1-20020a1c6a01000000b003cfa895a9cbmr7816194wmc.96.1668764175399; 
 Fri, 18 Nov 2022 01:36:15 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4UCZlCvqSPqxooSUvWk9BdOJTC98jc1GMgWNmypSXHsAzz2sIczkMYEkhvoYLagMDJe4frhQ==
X-Received: by 2002:a1c:6a01:0:b0:3cf:a895:a9cb with SMTP id
 f1-20020a1c6a01000000b003cfa895a9cbmr7816188wmc.96.1668764175178; 
 Fri, 18 Nov 2022 01:36:15 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 z5-20020a056000110500b0022cc3e67fc5sm3075409wrw.65.2022.11.18.01.36.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Nov 2022 01:36:14 -0800 (PST)
Message-ID: <cde5ea15-037b-1762-d011-37f5ee284e6c@redhat.com>
Date: Fri, 18 Nov 2022 10:36:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH for-8.0 0/7] main-loop: Introduce QEMU_IOTHREAD_LOCK_GUARD
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221118091858.242569-1-richard.henderson@linaro.org>
Content-Language: en-US
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20221118091858.242569-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

On 11/18/22 10:18, Richard Henderson wrote:
> Simplify the usage of qemu_mutex_lock_iothread.
> Split out for ease of review.
> 
> Doesn't actually depend on anything, but patchew only handles a single
> dependency, so I need to thread the dependency through the patch sets.
> 
> Based-on: 20221111074101.2069454-1-richard.henderson@linaro.org
> ("tcg: Support for Int128 with helpers")

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

> 
> r~
> 
> 
> Richard Henderson (7):
>    qemu/main-loop: Introduce QEMU_IOTHREAD_LOCK_GUARD
>    hw/mips: Use QEMU_IOTHREAD_LOCK_GUARD in cpu_mips_irq_request
>    target/ppc: Use QEMU_IOTHREAD_LOCK_GUARD in ppc_maybe_interrupt
>    target/ppc: Use QEMU_IOTHREAD_LOCK_GUARD in cpu_interrupt_exittb
>    target/riscv: Use QEMU_IOTHREAD_LOCK_GUARD in riscv_cpu_update_mip
>    hw/ppc: Use QEMU_IOTHREAD_LOCK_GUARD in ppc_set_irq
>    accel/tcg: Use QEMU_IOTHREAD_LOCK_GUARD in io_readx/io_writex
> 
>   include/qemu/main-loop.h  | 29 +++++++++++++++++++++++++++++
>   accel/tcg/cputlb.c        | 25 ++++++++-----------------
>   hw/mips/mips_int.c        | 11 +----------
>   hw/ppc/ppc.c              | 10 +---------
>   target/ppc/excp_helper.c  | 11 +----------
>   target/ppc/helper_regs.c  | 14 ++++----------
>   target/riscv/cpu_helper.c | 10 +---------
>   7 files changed, 45 insertions(+), 65 deletions(-)
> 


