Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9682E3EDC94
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 19:49:19 +0200 (CEST)
Received: from localhost ([::1]:37582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFgje-0000pk-NE
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 13:49:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mFgih-00086s-FJ
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 13:48:19 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:53979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mFgie-0002ep-Kq
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 13:48:19 -0400
Received: by mail-pj1-x1032.google.com with SMTP id j1so27750595pjv.3
 for <qemu-devel@nongnu.org>; Mon, 16 Aug 2021 10:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=da5b6EAzCg1VuPVtZq3IevHtf3cSK+b+kn0mFeEIPn0=;
 b=C+UUIjflW3Om2HumaBbiyG8rXNYBZaHwVGH/xqiuSUvHbpCT+zeMJ4ZbnHbOIQRRpN
 s38gFefFYMmapS0i4NkDjQVDBciH6anGT55Xt2xtxh1wL6BkXuaj00p9T05iyFSMCsCU
 PpAe9lsSoPPQpbXyMp9pOakAiWkbqpT+Kap5ygQQsV4QqVXQAo4l2Z5ncBM4ntYcZWk6
 Z4b/cg4DNsA+L5TSmtfDA9BzbZO/7OCXDIqDJELuOEsjEnV0qlJrp+zxjS9Yn3aqzHXo
 bJrIcdbA+tBcCpJOVDKGDj/sTOtcqGFwjGPc4K1X780nPAh69VYxGhE6K21WxGIA3JiW
 +Fjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=da5b6EAzCg1VuPVtZq3IevHtf3cSK+b+kn0mFeEIPn0=;
 b=rd/0m7Yz4TKsi9PdhfChaoniL5nCnQb1yxSlymmZo00cIx8+ej+4IDjchFcPvBkSdX
 Bnd9xP5C1aR96GbgE29pTCbOT23Q3h0lEBcdTuQ8L2ReSPPzpvwfChk0+cha5Nu5cba0
 N3P1mdf9zC/vG4C7N2ZTYmdRAHtI3/OZCFMV8jobC52U22Ha5lWmkuzJkNbAnmsSTz6N
 DMoaA1gC/KaM2DRcGVUc9k0vwarO0pyKbWNGqrBrt++jG0d6AWizo2mUgTYnwHwS4aFk
 XIfPU2uswIr9z8cU5BzqydKtUQvgHUjOZGQ89TQummM0H7mLbSpEgA2nOnsiJgswF1Kd
 X6ug==
X-Gm-Message-State: AOAM530+QxVdxxIX3wBFGUDNJcHmYeKVx9+0laLjynoFK2gnfd5BUwPU
 737/9ufsi90ljl0uaAJMq7OTMw==
X-Google-Smtp-Source: ABdhPJx6KiO6+ZZ3R0Ru00cYaAjn88dm1ka2krGuE7HoVoL8JkNCcbwZvsk2UyiSa4XX6Ukj19iVrg==
X-Received: by 2002:a17:902:e786:b029:12d:2a7:365f with SMTP id
 cp6-20020a170902e786b029012d02a7365fmr10926plb.21.1629136095086; 
 Mon, 16 Aug 2021 10:48:15 -0700 (PDT)
Received: from [192.168.3.43] ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id k130sm18245pfd.219.2021.08.16.10.48.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Aug 2021 10:48:14 -0700 (PDT)
Subject: Re: [PATCH] accel/tcg: remove redundant TCG_KICK_PERIOD define
To: Luc Michel <lmichel@kalray.eu>, qemu-devel@nongnu.org
References: <20210811141229.12470-1-lmichel@kalray.eu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <04c9f979-fbf5-bdec-711b-595436e9b6f3@linaro.org>
Date: Mon, 16 Aug 2021 07:48:11 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210811141229.12470-1-lmichel@kalray.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -57
X-Spam_score: -5.8
X-Spam_bar: -----
X-Spam_report: (-5.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.71,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/11/21 4:12 AM, Luc Michel wrote:
> The TCG_KICK_PERIOD macro is already defined in tcg-accel-ops-rr.h.
> Remove it from tcg-accel-ops-rr.c.
> 
> Signed-off-by: Luc Michel<lmichel@kalray.eu>
> ---
>   accel/tcg/tcg-accel-ops-rr.c | 2 --
>   1 file changed, 2 deletions(-)

Queued.

r~

