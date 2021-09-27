Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 347B6418D3E
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 02:10:13 +0200 (CEST)
Received: from localhost ([::1]:37794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUeDk-0005Nf-8A
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 20:10:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mUe5u-0006YJ-Fw
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 20:02:06 -0400
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830]:36608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mUe5s-0005D9-TX
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 20:02:06 -0400
Received: by mail-qt1-x830.google.com with SMTP id l13so15205404qtv.3
 for <qemu-devel@nongnu.org>; Sun, 26 Sep 2021 17:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=G8dCWah1rrWRP91pFmuVoR7pmeOUKD1KApLUMoFhocg=;
 b=myqJLjBR7b45BmerjwkEZ+nRJ/cA/QOZxbd9vrwsZmjGw1d2VmIhYBuR9GVcN26wNm
 atMt+lp/R6p6WrltRahjjWjt/BlMPyLs+rIkTdG9jSR8oLnqKPfbwUsmaHqtqlwj9xrp
 I7CbeFBzHKI5tGGIS/ZEVGoDV/V8XpXGO4Msy1KNcMUpfgBj6GtHU+7xOHy1LyRNNfmZ
 5y8ivRFMubqvYF+t4fuP2plgdlg0KyuVLB2oWS0I8QkIyGjjJSyalAotfEPtw2ddquEc
 gJ/MrHuTSvs2wTz6HT9quKxXBQFVZ2tqEDPTR83D6aCbXsr+4kV3BgP9BoLI1N9CUGHa
 Emwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=G8dCWah1rrWRP91pFmuVoR7pmeOUKD1KApLUMoFhocg=;
 b=qbQUqqElYcBP/fMcZGSPNi7DnCvK9dUu4CHbbYkOB6aY2I2ygnJk8FHKWP727uTWhh
 NEBR1g00lYszX35otloRIcOobu7sMZxq93H+4bCgpsfXjdAHp6f/0Ii85u285VbzUm5n
 gM26sxIVDa1BelAVYAN2UqxqpZT1CnAv6hNYZIsii0jWsgzR+dyMyYPWtX98eTvY3UDX
 gU6MtLoCi917LWph4SRrj0rCXmW+TNfILWHNmFGxc5BbDRJJyV6Z1HQHrW5ETi1v87tg
 reF3w8mllrjtImmBS3bXugAKaYtvsE18sl90JDD2os9UW1Tntcu9Hjd4uMY775F2Fl9d
 C+2g==
X-Gm-Message-State: AOAM531LT7rErPgy4XA/XjgNi5Ynx1gqyqQgZPmEpXqWc+frjGa0qsIY
 8caWgBVLq5GpnZ08kGCHZrfSGO4tu8NPNg==
X-Google-Smtp-Source: ABdhPJyBQbzfTaibVzhGuLYGXtg92sJ/VI8WbfEKW3MnxJ6Jdx/ih46JX5g9QAObpP4uzp69yCppVA==
X-Received: by 2002:a05:622a:45:: with SMTP id
 y5mr15639727qtw.145.1632700924046; 
 Sun, 26 Sep 2021 17:02:04 -0700 (PDT)
Received: from [192.168.3.43] (cpe-24-31-215-130.sc.res.rr.com.
 [24.31.215.130])
 by smtp.gmail.com with ESMTPSA id x18sm11266737qkx.94.2021.09.26.17.02.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Sep 2021 17:02:03 -0700 (PDT)
Subject: Re: [PATCH v8 11/40] accel/nvmm: Implement AccelOpsClass::has_work()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210926222716.1732932-1-f4bug@amsat.org>
 <20210926222716.1732932-12-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d2351d9a-72c2-d5db-b031-a0234e4e67a5@linaro.org>
Date: Sun, 26 Sep 2021 20:02:01 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210926222716.1732932-12-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::830;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x830.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.478,
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

On 9/26/21 6:26 PM, Philippe Mathieu-Daudé wrote:
> Since there is no specific NVMM handling for cpu_has_work() in
> cpu_thread_is_idle(), implement NVMM has_work() handler as a
> simple 'return false' code.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/i386/nvmm/nvmm-accel-ops.c | 6 ++++++
>   1 file changed, 6 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

