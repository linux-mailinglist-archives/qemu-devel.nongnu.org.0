Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C35F6AF743
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 22:11:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZeZu-0008F8-Fr; Tue, 07 Mar 2023 16:10:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZeZh-0008AL-Vj
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 16:10:22 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZeZc-0004bD-Iw
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 16:10:17 -0500
Received: by mail-wr1-x433.google.com with SMTP id bw19so13457235wrb.13
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 13:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678223415;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EkkB333YZvUy2IaSBtkIRn45qlW7wK0pjNEcMzwLsXg=;
 b=uYWsK4QZJruFoZGaGFHiRXIbaRnEsjtyjC0penxgTYXfKDbicy5DMzo9LTtSQWqJlZ
 Qoc7bmoLJsQhFkLJTtIznleomkbmcC7a0KVdaf3XueeyvvJcJvUb9aiBIT9OWRhe5pv0
 VZv9gDivYbQJi/awkYup9fYc1dLUCyVgv0SKSiJlkq40QsoFtYoPNspzydTW3D+6+0b6
 gvb8FhLPPd9Pf9H8zSUp267rwGglxKrx7+Qx33pnXGHKtGmEld3kV7HmWH3aWUplgSRo
 Jkx3iDwlV1zqjrs1w/7egsCMGKdGf6nwYHTOdP/14RTjfXAE7ssNwfGy6tbscK7Idb1o
 fjeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678223415;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EkkB333YZvUy2IaSBtkIRn45qlW7wK0pjNEcMzwLsXg=;
 b=2LAIkC6i1hhoK7ImoJOXULqpNdmQ+XCS6YBoh3U4yhieAwQXIp4Cfip7SxqkHnpjGP
 STKMDWkBWi4/iErseJIolowTrALHBFa7ZvPWgqp3Yys24SBLmWUzylv0fsuOF7LEpz8t
 mE5YxGd/3s3u4gLtShTbqrwoCHW9bSjZS/FyXid/nMmo/zLpXMPauR7I7AkGoP0BBLzI
 f8BEfgZwLsgT69xX4TeTYmEN4pnKhfNh4Ei0g5ig0CfLaoOgRxeZDoo5OcnmR/Ng/YRx
 IoiaEb8vkiM/x/XhgZ75/ba9fgaLVl++3pfq2UB+ZQ4r2K4Rbg+LLTVDTQsjDoofeZOk
 zhVg==
X-Gm-Message-State: AO0yUKUd7+Oy0awA216Q7PSDOGrqG8ecW+GjO43oyF/GCe2NDmN6zS1N
 J1ux3x28ktP1DtRe5mogkj1qVg==
X-Google-Smtp-Source: AK7set/dphL/hzhwZO6TlzD72Y+pDSHtUPlm+rpp3hTOFuRXqoy0jkCI2x32Nj3PAdYn1geIBZSW4w==
X-Received: by 2002:adf:eec2:0:b0:2c5:9c7a:866 with SMTP id
 a2-20020adfeec2000000b002c59c7a0866mr11229574wrp.51.1678223415004; 
 Tue, 07 Mar 2023 13:10:15 -0800 (PST)
Received: from [192.168.1.115] (126.red-88-28-13.dynamicip.rima-tde.net.
 [88.28.13.126]) by smtp.gmail.com with ESMTPSA id
 c16-20020a5d4cd0000000b002be0b1e556esm13331947wrt.59.2023.03.07.13.10.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 13:10:14 -0800 (PST)
Message-ID: <384fa57d-9bb8-f045-e019-563dffa75b59@linaro.org>
Date: Tue, 7 Mar 2023 22:10:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 1/3] block: make BlockBackend->quiesce_counter atomic
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20230307210427.269214-1-stefanha@redhat.com>
 <20230307210427.269214-2-stefanha@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230307210427.269214-2-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 7/3/23 22:04, Stefan Hajnoczi wrote:
> The main loop thread increments/decrements BlockBackend->quiesce_counter
> when drained sections begin/end. The counter is read in the I/O code
> path. Therefore this field is used to communicate between threads
> without a lock.
> 
> Acquire/release are not necessary because the BlockBackend->in_flight
> counter already uses sequentially consistent accesses and running I/O
> requests hold that counter when blk_wait_while_drained() is called.
> qatomic_read() can be used.
> 
> Use qatomic_fetch_inc()/qatomic_fetch_dec() for modifications even
> though sequentially consistent atomic accesses are not strictly required
> here. They are, however, nicer to read than multiple calls to
> qatomic_read() and qatomic_set(). Since beginning and ending drain is
> not a hot path the extra cost doesn't matter.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   block/block-backend.c | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


