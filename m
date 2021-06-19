Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB283AD92F
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 11:57:11 +0200 (CEST)
Received: from localhost ([::1]:59962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luXiw-0004A1-La
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 05:57:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1luXgJ-0002Fm-PF
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 05:54:27 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:56157)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1luXgI-0007z8-Cf
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 05:54:27 -0400
Received: by mail-wm1-x336.google.com with SMTP id c84so7095617wme.5
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 02:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=C45N+96Z1oUrMMe/iDuBZz35IeEA/OkG+q5+yGAzUuM=;
 b=mJ/cWtH7qMt/gTeHolxIyaBwmD2qBU3rULUClT/Fck8q0KmaOfh+8FFSrGiizwdX4q
 ymCy8nKZdf5V+kHi/de/2o3vO6xSbUWWW/4TheER99KH2fNRqXFmojrC2lad0RaiFnyC
 t2BbfOAIw81K+ZNNCG3SXsUu+Aycs7wdI3MdmeGtEJraQCl3GSUppbjukyqpXaygGLVw
 Mp5kH8dUWSFZlxXKK2plqSpQxrz385fz5fbUWS7VllACI8eSLMu1PBNQ2K2gtlTDfxy4
 iSuCnC5/xcruCpGW3sGcp/B+A84xxDVU4nwPpo9bWy9PDVelhTzEolrnFRGwXUpXWlpi
 KZug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=C45N+96Z1oUrMMe/iDuBZz35IeEA/OkG+q5+yGAzUuM=;
 b=P2C5LTQC6oABn37H3TNfSbr7BY/fn1Riv5Or3kvCLo09aktKq/hJIdRlpVmJGQ8Ikz
 z8+xwuvkEqYBB6gu2tEB4bZWi9YqtaZv5eFdnFApf3834rFJS+Gzn0cfUmOYlyD4EnQX
 cKJfPPa2TB+OIAkV+NFLXbuBTPpbCBNHw6Z0eNxFxBq9QfNYXXIWHGqwlRTtdSpRKzI/
 2fudOMuMbwoCdMhgDz8LsX646MjlabySRaN53Iv0dIU6y/B8EXBz1myoRE2RzFhxzYGW
 bQxMxgaPia7UGm5ygR0qsba9224q73ydB37352KTV44gzxqdlJqHch07n7O+Z2/EUMwD
 ZfUA==
X-Gm-Message-State: AOAM531jPRlfiQldCzCWz6eN76SmsbmtTYNpgH8drUURjzsHdiX8/M3t
 oi87Vqnef/gp+TLBNgY9YII=
X-Google-Smtp-Source: ABdhPJzHwqAVKLQum6rRirw7RqCYKgOcbpebL/iAuhEXzZG8WyTdYf71F0Zl2H9DKnbfjl1t3Aallg==
X-Received: by 2002:a1c:4955:: with SMTP id w82mr1502852wma.16.1624096464943; 
 Sat, 19 Jun 2021 02:54:24 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id c12sm11022301wrw.46.2021.06.19.02.54.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Jun 2021 02:54:24 -0700 (PDT)
Subject: Re: [PATCH 07/12] linux-user: Replace bprm->fd with bprm->src.fd
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210619034329.532318-1-richard.henderson@linaro.org>
 <20210619034329.532318-8-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <3007f703-abca-783f-17f6-020700255058@amsat.org>
Date: Sat, 19 Jun 2021 11:54:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210619034329.532318-8-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.202,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/19/21 5:43 AM, Richard Henderson wrote:
> There are only a couple of uses of bprm->fd remaining.
> Migrate to the other field.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/qemu.h      | 1 -
>  linux-user/flatload.c  | 8 ++++----
>  linux-user/linuxload.c | 5 ++---
>  3 files changed, 6 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

