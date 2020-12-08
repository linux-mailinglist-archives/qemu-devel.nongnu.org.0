Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9352D3572
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 22:38:54 +0100 (CET)
Received: from localhost ([::1]:47776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmkhB-0006il-P7
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 16:38:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmjPG-0008MO-Oz
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 15:16:18 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:36524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmjPE-0001Yi-Nq
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 15:16:18 -0500
Received: by mail-oi1-x244.google.com with SMTP id x16so20816826oic.3
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 12:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VUkss2AzXUCy20pt/XmW9ju7JMBclBdEZ9JmLxAhrig=;
 b=DiEPiInFxWMG9iINFDx1KThne0nch459KkTwoPR/l8untQfwHt8tJR287RvWFCyv+c
 cMgPtCP75n8eKro/pmdJt/6qq9/1qbFIQhlVTz2KcqgtVAStJKgnyk0EqtrGVKpE3WrP
 p3+dzZFzIzCNePH2KVoMaIIoMiKjNLjWQpMS2l7+DdAwliabM2c6ye1VW4BxLbrykY/7
 nrCNGLwejHwWh8RfjPPcTSHuUTNg+0L9wEcz+GceBLGm7J2XH8DeXDtdfB2HkseWWceE
 nNBLko5UN+mV5tUIzJnnrLQ1cuODW1RNMAjos02IvShsEwg5fifIn4tPzXY64ECk5o2U
 1g4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VUkss2AzXUCy20pt/XmW9ju7JMBclBdEZ9JmLxAhrig=;
 b=ciTvMvQdanzNbYt2xvxn1fDB3um6UrkmzrplxWdT73H19oF/zJHIaSDuIs53yVXGCJ
 Pyf83i0ZaPLGStgVj47jjtF52UVQj9GaQRPk0/W5LuFQNvSvSu8pcXBkNvGGpTiRBohs
 D+ABNdcQrE6h4ABbGU7de86eiz4va6zYkur6Ten/8gpIq2OLX5Nlhz8bCGym3VWdOaw7
 yuTfIEX4+Woo83Ugn7pztYI/9Bv6ieGT+yaoHRvwbd4i/oL5P39BTwGIlvIfiPm40xr/
 umIHbHIYOYmY+M2b6TaLPXZukAPNjx2HoAibxyTCn6iaHAzjd0OR1YJMkv7tkPc/ShKD
 Sz3g==
X-Gm-Message-State: AOAM531LDvrDaPbVkLS77bHnIZOPQuc+1F3yGoe6XwenilTgr4K5wfqI
 ib4i9iL+2pzorCnEbOZFDvGwOA==
X-Google-Smtp-Source: ABdhPJyDekc3PjQgiP9/EzwiYjjGNyWY62W7wqhUQeE7UAglF56/20YZOAxOw/0WMcmJMQUjnWFwLQ==
X-Received: by 2002:aca:5c08:: with SMTP id q8mr4165752oib.54.1607458575615;
 Tue, 08 Dec 2020 12:16:15 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id v4sm2048532otk.50.2020.12.08.12.16.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Dec 2020 12:16:15 -0800 (PST)
Subject: Re: [PATCH 2/4] target/arm: Fixup contiguous first-fault and no-fault
 loads
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org
References: <20201207044655.2312-1-zhiwei_liu@c-sky.com>
 <20201207044655.2312-3-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7c6ad308-a2ae-c90b-cac5-19c486b441b3@linaro.org>
Date: Tue, 8 Dec 2020 14:16:11 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201207044655.2312-3-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::244;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x244.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/6/20 10:46 PM, LIU Zhiwei wrote:
> First-fault or no-fault doesn't mean only access one page.

But the implementation is *allowed* to access only one page.
Thus the comment:

> -    /*
> -     * MemSingleNF is allowed to fail for any reason.  We have special
> -     * code above to handle the first element crossing a page boundary.
> -     * As an implementation choice, decline to handle a cross-page element
> -     * in any other position.
> -     */


r~

