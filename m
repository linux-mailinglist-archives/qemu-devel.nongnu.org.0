Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 460DF35A1E7
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 17:22:56 +0200 (CEST)
Received: from localhost ([::1]:48214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUsyE-0008Tx-Ss
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 11:22:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lUsxO-0007Z6-2P
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 11:22:02 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:35400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lUsxL-0003tU-PL
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 11:22:01 -0400
Received: by mail-pg1-x52b.google.com with SMTP id q10so4155293pgj.2
 for <qemu-devel@nongnu.org>; Fri, 09 Apr 2021 08:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=sXQRsfTQxWHp93vfbYY7KUgBSSsTXGRrbJLA0wnJmtA=;
 b=XHQidgDyC9Q2K2zCrilVlYQG2eh7WW3/d0ehKECNgn5KlEXondSq+zMMPSv15np2OS
 0MNDK5DOYcyZqUF4OEEYWSaWoluumUkCpcjCpIqPogaP6LjBlB+gCWkxPBr79HN6B4Ae
 ThaBh0hgJnMp3q8QAcQxSLtLXYvVCUgfCtio+htdf+QVz9uEU35AP27mtpu5ETQVhO+m
 NHyNROdw4IwO5Qo0dKaMDHDxZkSS+dYlnty7pFaINgIOznLqzmkbED9p7remq7BDmxYc
 Uu/RexUXxVMJK7WvdR+1Wg30auSlv3MjNUNfVuHH9X3FMa2gmsT3WzGVjCxOSTel22Rd
 2MyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sXQRsfTQxWHp93vfbYY7KUgBSSsTXGRrbJLA0wnJmtA=;
 b=REvRq6J+4QnbzHASy2dGnOPfAyvM4dPynV2H3L0uhkcWHRF6GT+MSJsCI52iDF8u9T
 CQXLuFWz4zKdN4RWsUdHnj/b9CejojWf1LXamxGDL+fTBlHZo5FJ7jcuxtRRKu0YgRLY
 qdm/wJR4tmZPVXFM2eYWU2PJPuyXMfcOy2qJQVCEXlwtTaTT3+OAWhugRDntgfjIzO7u
 AC1J0oACva04w4LMTU/N/SrYXScTtqKcas4TDuHF4beUdB0UL30VXz9vW6KduoNEOq5A
 QEX59MSnWrf1aJ9q7i2UGmrfSEUrwhvI062DcJD08fmtCeF8L//x9kmqszq3dxSWYVDR
 XmWA==
X-Gm-Message-State: AOAM531QUjzl7sa+mM4GFUqWTRrUS2YvSJz2SYlSuDTn8S4yJ7r7J4Gf
 ERHR9RRUpO1aqxDzNKESIgsWSGlA5X87iA==
X-Google-Smtp-Source: ABdhPJyqLAf73Hgocc96PjGJk9WWopotO0qtdLQaE8+wOD++ISg/AfSchz3+cyCG2yryQLMl36+NSA==
X-Received: by 2002:a63:1303:: with SMTP id i3mr13540344pgl.32.1617981718392; 
 Fri, 09 Apr 2021 08:21:58 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id h68sm2831482pfe.111.2021.04.09.08.21.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Apr 2021 08:21:57 -0700 (PDT)
Subject: Re: [PATCH for-6.0 0/2] mps3-an524: Fix MPC setting for SRAM block
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210409150527.15053-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4b82524a-2482-b651-d575-ccdf3fbe1f5a@linaro.org>
Date: Fri, 9 Apr 2021 08:21:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210409150527.15053-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/9/21 8:05 AM, Peter Maydell wrote:
> Peter Maydell (2):
>    hw/arm/mps2-tz: Fix MPC setting for AN524 SRAM block
>    hw/arm/mps2-tz: Assert if more than one RAM is attached to an MPC

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

