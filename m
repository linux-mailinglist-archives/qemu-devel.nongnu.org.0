Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B72F43AD914
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 11:40:13 +0200 (CEST)
Received: from localhost ([::1]:44590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luXSW-000858-Ps
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 05:40:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1luXMQ-0007JV-Or
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 05:33:54 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:40858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1luXMP-00010T-EE
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 05:33:54 -0400
Received: by mail-wr1-x42d.google.com with SMTP id y7so13506404wrh.7
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 02:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=M/TVWr2ImCKwGqs+AYaaXlJVJa7F0Jz9vnH9cX2shs4=;
 b=oiIo6tUHkywGrI73DfQYoepXTBpNZKN8ne11FO280N/LMUoEarpJD9fUP3XLrRyeW7
 Fv4x5SZmHlLCwkw9JuO6kda2ikIJvlsI+Xt8Vr1i+4yVE8yiF/YssCtFV2oAe8z/tvZv
 gvDee7Uo6QY2GniK1rlzkPLOe4CyHe+bepG03xsUWPnAQ2caet6ehe/4y0Lme/4xDfg2
 ZsopkvZEhpGyE6c6Owjd8slt4E2jp5RiMvgSdYjYHRUvFBMs98tnyixPBeGaBqsP3nWE
 SD+Ntldd5RzRkNGVHndtE37vfZsdlJuUm+QE9Ccl69D7bg7YyuCR7kvKLgnIqI3xUbKV
 GVsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=M/TVWr2ImCKwGqs+AYaaXlJVJa7F0Jz9vnH9cX2shs4=;
 b=RtO6f9OPM6jcCw4MWFbHGHEkd1074FRk8cmUPxOWZm06PQ/tP1rwoj0L1ncwTdt67o
 01JPZPLpcdFSfEx3j4YaLXQlg9ZCLJCSyVD/RMP0pBAHHvtxININ9jUT6jNytkVC+YQk
 FFvzjfeWP+uX7CB86397f+o65wWYpYby/XZVruOxZbGGDsRQfWI9Ywyw6M4qGguxMd1A
 OHcW1wdpTAehbMflwEwx6FwkFZc0PS7EqpzHz2g+HcfUZngCfDbfqFe22/j+30+3r2r7
 TLfihR7rnEa620wv86UjqUyqQ8+auR3SKlfZkG7cWCHzZeeWGG+3hMgKZkiI2CzKCJEs
 +Rdg==
X-Gm-Message-State: AOAM531JmUs4klDDyiCs3/5skqMgHJ3ir3DbBd0NW5sPIS0X/BRrEdAh
 ez+E4YQbV7Ayvm44Il0pPmc=
X-Google-Smtp-Source: ABdhPJwcfdaTs5c05XjDP48sFh7x2FQfoGhGvb5XKEGZHizt5QfTCi9aCDV++RhT+R2j1d/SATyakw==
X-Received: by 2002:a05:6000:1089:: with SMTP id
 y9mr16789526wrw.412.1624095232073; 
 Sat, 19 Jun 2021 02:33:52 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id z10sm10330298wmb.26.2021.06.19.02.33.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Jun 2021 02:33:51 -0700 (PDT)
Subject: Re: [PATCH v2 01/23] linux-user: Add infrastructure for a signal
 trampoline page
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210618192951.125651-1-richard.henderson@linaro.org>
 <20210618192951.125651-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <4b8d2565-59e4-4474-673c-9c7e0e548743@amsat.org>
Date: Sat, 19 Jun 2021 11:33:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210618192951.125651-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
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
Cc: Max Filippov <jcmvbkbc@gmail.com>, alex.bennee@linaro.org,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/18/21 9:29 PM, Richard Henderson wrote:
> Allocate a page to hold the signal trampoline(s).
> Invoke a guest-specific hook to fill in the contents
> of the page before marking it read-execute again.
> 
> Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/qemu.h    |  7 +++++++
>  linux-user/elfload.c | 17 +++++++++++++++++
>  linux-user/signal.c  |  3 +++
>  3 files changed, 27 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

