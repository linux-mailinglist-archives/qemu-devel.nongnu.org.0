Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D49B2CA37E
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 14:13:05 +0100 (CET)
Received: from localhost ([::1]:39164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk5Sp-0003dF-Nh
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 08:13:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kk5RE-0002LJ-5a
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 08:11:25 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:45144)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kk5RB-0000Uh-IL
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 08:11:23 -0500
Received: by mail-oi1-x241.google.com with SMTP id l206so1639839oif.12
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 05:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=xTdvkhQT594WTZnzp9Y8oLp1uFxM9ohAEqda1xatoaA=;
 b=X2KA0iTTDcGKjw3yCu1XOgJi36AYg29oRZUI51AwEEX/Fc50Nf1tfqea55Bdwp1HWR
 hfbd96J0UpcJJbjdW2z4XU97JHOdLeC8PKjdvpQZ0gcN0uf1cDYH1GUPpUoW92pBqdd0
 KyRxNDpZC5GZEJi4Rd56a0EFnefdJcTYmgbcVr5ndZzZUSdHgpMGWiVItzvKEdah6ghz
 WR5o+YLDeZjOAAax/I6+zgUxKiPEdHKn0pdVuEp2nM3fSmf2EbjGM51bWi9dGA5u25Lc
 nrmuxnHgXjS7wKe4nvNu9Yk6SPQ5ypQlgp13R5AMLcPn5X7sORx3wZ/JNO517XNh6g+x
 u56g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xTdvkhQT594WTZnzp9Y8oLp1uFxM9ohAEqda1xatoaA=;
 b=fJxrhaQr2zkEvBvqOvTe3eMu1+Z+nsCaH+s7NCio4YFcT1ubkCELwDaFRJzyBvCjzc
 djFwEeoAGT2uwq6s+PJVbT03RQwEL6jzJLv2qnWi0+EFMSKis8wdEuLYwRfQon0bw8w8
 UbftfQY6SUQsTa933CHbuV0EMZ2+FT1BDWNuyOGSZIFQeEqiXGwqT9AB0LddPLCfKNie
 YT4Vc/h9bsaOzVNNgi8PfaryWVGVxsSckKHP7DF9g8W01Uyi2aN63MwlxinOxNi4UqmG
 /lb5ieTFo2f7sgAR3N0Aen4PAtgcqlbokXdbPag7L4f1EZkp3BROuwD8WZ7svboDwo/H
 UOLw==
X-Gm-Message-State: AOAM532rPUczAB1IW5CKfMOpYYl7zsubjn9vyBctlWDmRL19nwVyZC4K
 psSnppU9QmhaYslzHfkBXBOwqMR4LljT6k3R
X-Google-Smtp-Source: ABdhPJyWweuRo3kv4zO5wZylHMibofjYwNa+RhqSo7+IKOyaNQ/GgwbYpnHdDhkQJSpCtfDPOa9FnQ==
X-Received: by 2002:aca:5114:: with SMTP id f20mr1522542oib.107.1606828279731; 
 Tue, 01 Dec 2020 05:11:19 -0800 (PST)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id k63sm384788oia.14.2020.12.01.05.11.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Dec 2020 05:11:18 -0800 (PST)
Subject: Re: [PATCH v2 09/28] target/arm: Implement VLDR/VSTR system register
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20201119215617.29887-1-peter.maydell@linaro.org>
 <20201119215617.29887-10-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <74666363-8965-279c-8b00-bf6d61d22be4@linaro.org>
Date: Tue, 1 Dec 2020 07:11:15 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201119215617.29887-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::241;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x241.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/19/20 3:55 PM, Peter Maydell wrote:
> +    gen_aa32_st32(s, value, addr, get_mem_index(s));

This is MemA, so should use

  gen_aa32_st_i32(s, value, addr, get_mem_index(s),
                  MO_UL | MO_ALIGN);

a-la my patch set from last week fixing other instances.

> +    gen_aa32_ld32u(s, value, addr, get_mem_index(s));

Similarly.

Otherwise,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

