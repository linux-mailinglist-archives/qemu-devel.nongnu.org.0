Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 370196F557D
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 11:59:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu9GB-00080T-LE; Wed, 03 May 2023 05:58:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu9Fz-0007y2-Gd
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:58:46 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu9Fs-0005BF-Gt
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:58:39 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3f315735514so16477285e9.1
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 02:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683107915; x=1685699915;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=io+Bso6iA1LdqqwRT7T6N45jLirsJCur4KgPF6vH1Pg=;
 b=w0ZCRqNZf0EcF9LJ67mwKVc8XXTk9sGBB5g8zpGEzn+BUZsmM++WvrmnhRRR7HJqFk
 KZq/6D5pVhfRZwT/aKTqR4nFW4Q55nDr0u2JLcGC5JZehO8oJn6hahxn+3/cmSRmYhR1
 XmYFj/vylRfRoOrp/wZoEYvcE0Y3mDZ4G5UvySgWn+MatC0hZG2l9e0+hE99RfOiBMZI
 P/PuVqPeR5fYmoZZy3Vk009wbfCOXHTYlgL8vSsJz3c4gWUau2NrUTYhMo5rF7OzoZ1h
 dpRzXhzypiH+SRDhZlGYgBghdyCNVNQnGhnPPhmGFmMfWcLq0A+ujGuiXpc0PJh9vdaQ
 upbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683107915; x=1685699915;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=io+Bso6iA1LdqqwRT7T6N45jLirsJCur4KgPF6vH1Pg=;
 b=OFmEzDKocjp7afXcxOIcDDSxTuE4dX1a6+IenCJRwZgO2BSp3m5B0U3fKgprxl1Vqj
 guud9oijUomzzQ4qGF5H7THlL7C90B7xGyzBsR2AT8cYoXYhR72ogNmW5LomSnSlYs0K
 MYUVeN5h5n1hppIrVuf8ov8EfnAwQCtzllzkT03p61cxfrBQUhirCZTqQTOKONRNT+Tq
 VXgPjLyebesQeE0BjKkN6/+SDAtlNH6XpfQgKslIZ8s4GLOJ8O2wTAYsn1AbV1G4+uI/
 S7iI1gj2Xi8vfig/ZqBblm2HhRLfhFLlpE7HSBGxEYelRhD5QQ8HSnrWu0XWclLZDfB4
 IYHw==
X-Gm-Message-State: AC+VfDwgoY1HDuuJNRppc6iCl3zUXZqYrGi1ZxNhE0iXuPfXHk9lP77r
 6RC8+uQL5yZnMMXzbx/pHoWnuw==
X-Google-Smtp-Source: ACHHUZ4ybEw0hebARMidL4HgQEtsXK/pygpi80gdPDZ5PQPNzsU/R3pMOtq0Fiwkj0RFR87c3ivSbw==
X-Received: by 2002:a05:600c:3542:b0:3f3:284d:8cec with SMTP id
 i2-20020a05600c354200b003f3284d8cecmr1082926wmq.2.1683107914776; 
 Wed, 03 May 2023 02:58:34 -0700 (PDT)
Received: from ?IPV6:2a02:c7c:74db:8d00:c01d:9d74:b630:9087?
 ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 bl13-20020adfe24d000000b003062d3daf79sm7855519wrb.107.2023.05.03.02.58.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 May 2023 02:58:34 -0700 (PDT)
Message-ID: <56b4382e-a917-2ead-23ce-4c2a3c16ed53@linaro.org>
Date: Wed, 3 May 2023 10:58:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 06/10] trace: remove code that depends on setting vcpu
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20230503091756.1453057-1-alex.bennee@linaro.org>
 <20230503091756.1453057-7-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230503091756.1453057-7-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
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

On 5/3/23 10:17, Alex Bennée wrote:
> Now we no longer have any events that are for vcpus we can start
> excising the code from the trace control. As the vcpu parameter is
> encoded as part of QMP we just stub out the has_vcpu/vcpu parameters
> rather than alter the API.
> 
> Message-Id: <20230420150009.1675181-7-alex.bennee@linaro.org>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   trace/control-internal.h |  10 ----
>   trace/control-vcpu.h     |  16 ------
>   trace/control.h          |  48 -----------------
>   hw/core/cpu-common.c     |   2 -
>   stubs/trace-control.c    |  13 -----
>   trace/control-target.c   | 110 ++++-----------------------------------
>   trace/control.c          |  16 ------
>   trace/qmp.c              |  74 +++-----------------------
>   trace/trace-hmp-cmds.c   |  17 +-----
>   9 files changed, 19 insertions(+), 287 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

