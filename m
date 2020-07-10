Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23BCF21BD0A
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jul 2020 20:32:23 +0200 (CEST)
Received: from localhost ([::1]:50494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jtxos-0004Fd-86
	for lists+qemu-devel@lfdr.de; Fri, 10 Jul 2020 14:32:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jtxmz-0002q5-Gi
 for qemu-devel@nongnu.org; Fri, 10 Jul 2020 14:30:25 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:42348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jtxmx-0005vo-Um
 for qemu-devel@nongnu.org; Fri, 10 Jul 2020 14:30:25 -0400
Received: by mail-pl1-x643.google.com with SMTP id q17so2583319pls.9
 for <qemu-devel@nongnu.org>; Fri, 10 Jul 2020 11:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=55fervx1vglqX/eRq5XewgkmlGkG0e3dJxxsm7oIer8=;
 b=JKdSa4CzV1Vb/PY2RQfhpsUtCPP7WuaAkU00Pqjc5yGzB1rbzPelFZlnfxhJcvB4fr
 ukru2lR2Tk9VUjf09sDURScBv9wvIWHzQoHZBtet90DoNxKvJJq+6MdWqCHQq5tDNgwN
 Wrf22W+L895/9j9VIyHPu5znbOj8e9wELjZRKEBdzOI/BZmEO8ZtTnh/URQ0pj9ERg9Q
 6F6Ch5Esdl7qJKJGuu2BvXX9WXjEGkhJ/t8pV5UoDXh6M0vTCFlgQmOHXq3l8aDNUXC+
 TSPjHFzYzMjRuzddk3TYBP6hZRQpoC2xD/TbDE97LKiiOoKwbGzprs866h2ZoPL3Ww+N
 UubA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=55fervx1vglqX/eRq5XewgkmlGkG0e3dJxxsm7oIer8=;
 b=bCziiDJfrNAPtXBuFChDmfCv4yOi4OYjlgmWY1W/MVGydvXt/OhTNkZQPVrPuCtRA/
 NLlsfUgg37d75kQJvbFhA8tTgDjSjZ5uv2xVVxGMAToDINhrzgyDJi3HdE1LgW0UH2Fa
 5G3/J+iAo/MvD6nRUTiyOElDT99jOwevjwT/PEyw+Uzmb5EYhelNf1OLBXlUDA+qhHLs
 eAfPPu97SldSHrO5ZcKYFK+uUfl7IelDh39MHByGR48O3bkAxf8aAcqboi6HJDB2tuB1
 CCZQ28/FLkMvyTHPry8dtJCxOtuBNAbttz4tCjH+z4O6DSoNLJjosBQXAv0gr3zvX5Tf
 VucQ==
X-Gm-Message-State: AOAM530yLent7wYau2cDrKQOKi0Fd13d+ZKmOTP1ETtjDtOPVtwgCNuX
 4d2l0L+bDkbtobt27Yi+TlmmPw==
X-Google-Smtp-Source: ABdhPJzRsps83aoPEgdB7Yg3OpXKRpgdLJe7HkIGVSEbI7E10B6pJ0z0xoxgBXu1s6FG9665SUTYbg==
X-Received: by 2002:a17:902:8d89:: with SMTP id
 v9mr59012074plo.191.1594405822531; 
 Fri, 10 Jul 2020 11:30:22 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id a11sm6250784pjw.35.2020.07.10.11.30.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jul 2020 11:30:21 -0700 (PDT)
Subject: Re: [PATCH] disas/riscv: Fix incorrect disassembly for `imm20`
 operand.
To: Wei Wu <lazyparser@gmail.com>, qemu-devel@nongnu.org
References: <20200707154336.4963-1-lazyparser@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <42554d7a-4c7b-af82-14cd-d448aab98bb3@linaro.org>
Date: Fri, 10 Jul 2020 11:30:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200707154336.4963-1-lazyparser@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: palmer@dabbelt.com, Alistair.Francis@wdc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/7/20 8:43 AM, Wei Wu wrote:
>  static int32_t operand_imm20(rv_inst inst)
>  {
> -    return (((int64_t)inst << 32) >> 44) << 12;
> +    return ((int64_t)inst << 32) >> 44;
>  }

There's no point in casting to int64_t, for one.  But it would be better to use
sextract32(inst, 12, 20).


r~

