Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 836E63FBE3F
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 23:27:55 +0200 (CEST)
Received: from localhost ([::1]:45074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKoos-0001O6-DU
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 17:27:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mKonj-0000I6-1x
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 17:26:43 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:44707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mKonh-0002Jg-7K
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 17:26:42 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 l7-20020a1c2507000000b002e6be5d86b3so929373wml.3
 for <qemu-devel@nongnu.org>; Mon, 30 Aug 2021 14:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8iPHPmbCn/vL4lxwhb7ynW+FPiC2ukyOaXzsaj01O0c=;
 b=DI4pL2xORhcoQJQfan+2sUCU+7wCVFcfqR4B3LehregYWTn3cK8Dw/cWLYoTpRtqfl
 A1zX8T+I3HQy/cIwZhaZpDJnP0plwIVXi8FYaCpL3rdRYkSyhLpQbasiXiuE8cXXgohw
 88aBQ9SEs67pyyya1KvRexiEp/8QyqHSdWlOyOPXG7QwyoyIj9Vty9mPh+wWa/jKwiwI
 z0i/dZFT9LVVWZxek/A4fFweVr7DSxXOpcLiwWWNl3jjBypnusVFpYoPvZQDV1+RSPyn
 hau4gSzIiAaaXWhSn/Q0wumAG6RPShl85Mje6+4Paw2mO9VcmAwQQfFjrqH9/6Q0K+r2
 ISYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8iPHPmbCn/vL4lxwhb7ynW+FPiC2ukyOaXzsaj01O0c=;
 b=THvl5q01fX7H/LKFv6o92O8rBTWHzcqvz16zqR7ka/nB3DZaCpip6favm6bw6ktUG0
 7y0mh5ELQ1oyXY9PcH72y7GHKp4Y1cOUxp/3hp6PTJj7o3jLl2J6sxMJNK0YLd6zBhTc
 OdkuLnNNsm02a1x8RgNx9C4mmncHOVQZmN6rVB4jCASw3F9UfFgCx2fcCuvnDy4zCpw7
 6lok8sAIg+doXwcXbwETjF7hF0O4p3kh35FCp6hpOYgTjC2qhGSe47/69N1Pqm1C2od9
 r5QSY0YO7jQMVqI15lyl4GoyXJZMcmErPR5DIUQnEI38drAHwqqSLm1gJ7OKv4nqXEPc
 keaQ==
X-Gm-Message-State: AOAM5302oKqe3FvIKpHrPo6+KyuhEqm7A7R7UojIugd1WK1T6h4jBqhe
 ovTQ+ZbEHEVuBs8q7qJ/azb9pt1glPA=
X-Google-Smtp-Source: ABdhPJwPKFpuWdReTye5Kke132LP2SvfcbRa7HBphaj0BDq/upTJPcwuEPB5up6kxW70mmkImyKZHg==
X-Received: by 2002:a05:600c:35cd:: with SMTP id
 r13mr996154wmq.24.1630358799361; 
 Mon, 30 Aug 2021 14:26:39 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id w9sm585655wmc.19.2021.08.30.14.26.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Aug 2021 14:26:38 -0700 (PDT)
Subject: Re: [PATCH for-6.2 25/43] plugins: Reorg arguments to
 qemu_plugin_vcpu_mem_cb
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210729004647.282017-1-richard.henderson@linaro.org>
 <20210729004647.282017-26-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <53cb510c-aca6-e360-c582-5bee5d3490e3@amsat.org>
Date: Mon, 30 Aug 2021 23:26:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729004647.282017-26-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.932,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

On 7/29/21 2:46 AM, Richard Henderson wrote:
> Use the MemOpIdx directly, rather than the rearrangement
> of the same bits currently done by the trace infrastructure.
> Pass in enum qemu_plugin_mem_rw so that we are able to treat
> read-modify-write operations as a single operation.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/qemu/plugin.h         | 26 ++++++++++++++++++++++++--
>  accel/tcg/cputlb.c            |  4 ++--
>  accel/tcg/plugin-gen.c        |  5 ++---
>  accel/tcg/user-exec.c         | 28 ++++++++++++++--------------
>  plugins/api.c                 | 19 +++++++++++--------
>  plugins/core.c                | 10 +++++-----
>  tcg/tcg-op.c                  | 30 +++++++++++++++++++++---------
>  accel/tcg/atomic_common.c.inc | 13 +++----------
>  8 files changed, 82 insertions(+), 53 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

