Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D753295EB
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 05:42:24 +0100 (CET)
Received: from localhost ([::1]:34092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGwrX-0003Ra-AR
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 23:42:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGwqO-0002rs-2D
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 23:41:12 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:40126)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGwqJ-0006Nq-83
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 23:41:11 -0500
Received: by mail-pl1-x62e.google.com with SMTP id z7so11290304plk.7
 for <qemu-devel@nongnu.org>; Mon, 01 Mar 2021 20:41:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Zy9IXIGdA6SAb9v7Ro87otIeoRNEwcdpUr91xRcXN8M=;
 b=BT6dghgqXFqFtaYjkNdBzLxH/9ib+WkIWDAkNZjI8Hf571AfqLRD6F6W+jqq5HHSUq
 arXy14wN2nwOE2oiYrHfKz7xhBzsWV4vB3Q24CSu9o2c364zfzikc9g6oI4euRMMolvc
 WPhf53PZQ16HSOuFymi61cS35UHAWlOhjMW5h/nfM0UQVdN23xbLf+zHBY6ROEwjRBC7
 7d6u4o2CQqozNnvQPM1bU0ZwdP1p2127bxkR9wTdFU6clvzBPCkY4HOPKbaZ4z1feh0q
 a4bpBDJfqvFSm27dD4co4yiMwFBlCpljX/l23HD6b3FnbxLHzuEB0xMa3s/B7RwjzAvF
 hoTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Zy9IXIGdA6SAb9v7Ro87otIeoRNEwcdpUr91xRcXN8M=;
 b=fdf33g1vxzAdfL6kGvbc4xEEsFW/ZjdLBwcMWtf23WQoWdPMH6oSnk+8cckldiwllJ
 kGmw4etuRGrz/mPxA6dbJXpeKpLPUqkojsbESuMa4LZZnPZtsCmqK3U4A51XuPWc+SqV
 Sv1NNGl6q720iSM8Uel1h1bPwziMx42r/yPO0IzdPH4eQd8nVcaPrSs6hmpxMnuNwwLM
 kqw6YEDL7+QlCx5NMGdXuxubbPjqRseUjNdgT8W+2nKRd3bgHtYfhsgnIxP19qKvXYp5
 IPHFVHopbTvJStdP53wpupuaGRwDIOWMWA023BvZj3HnYrqvlR8vA+vVUs3kOZrNpKy+
 EAjg==
X-Gm-Message-State: AOAM531QDckayqeFg2U6J11y51REhjzUVJxku8NmUr7QBEK6ipQ2WHBb
 f3RH6evbx29oCa3U+9Pbz4EOESkSNmuUYw==
X-Google-Smtp-Source: ABdhPJzD2btNBfK3++9bBNOruNRuL3cVYT76YetVftJmes48PCnhvrbVGcsoX3LUKBH6VYQcacm30Q==
X-Received: by 2002:a17:902:70c5:b029:e4:4ce3:90f5 with SMTP id
 l5-20020a17090270c5b02900e44ce390f5mr1946401plt.58.1614660065544; 
 Mon, 01 Mar 2021 20:41:05 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id d16sm1150273pjd.25.2021.03.01.20.41.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Mar 2021 20:41:05 -0800 (PST)
Subject: Re: [RFC v2 16/24] target/arm: move sve_zcr_len_for_el to common_cpu
To: Claudio Fontana <cfontana@suse.de>
References: <20210301164936.19446-1-cfontana@suse.de>
 <20210301164936.19446-17-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <14167e60-3610-172f-b259-45a535625239@linaro.org>
Date: Mon, 1 Mar 2021 20:41:03 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210301164936.19446-17-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/1/21 8:49 AM, Claudio Fontana wrote:
> it is required by arch-dump.c and cpu.c, so apparently
> we need this for KVM too?
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> ---
>   target/arm/cpu-common.c | 33 +++++++++++++++++++++++++++++++++
>   target/arm/tcg/helper.c | 33 ---------------------------------
>   2 files changed, 33 insertions(+), 33 deletions(-)

Same about the choice of file as with cpsr in patch 12.  This is 64-bit 
specific at least.


r~

