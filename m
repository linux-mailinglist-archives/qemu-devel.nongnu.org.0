Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1373AA382
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 20:49:30 +0200 (CEST)
Received: from localhost ([::1]:45712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltabR-0007SD-3g
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 14:49:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltaZL-00040U-8o
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 14:47:19 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:41576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltaZG-0007BB-Bx
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 14:47:18 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 mj8-20020a17090b3688b029016ee34fc1b3so2336747pjb.0
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 11:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=12unMz1nSL+roBv/0C6qq1b88xHII3v1Zwso1zOiM/o=;
 b=ipfJFBXgRRZ/gIfjh0JFU5T3rRWbLJ7jWynNN+/1eAVbnw11Q1FCnN/CEOhuEX5gqD
 EiBoLFs0/zk1ARd5xBaPZG7JUsqOfPNh6W8lXiX2brW9XRHzDp/m2PqzscrfeZBC5WBH
 qNnIVynCIiJ46MdUhSd0jOSScCbCWfPwG7uUMWVmDKkLvKGYBOmKxWnFVPvhRLCTZrrA
 ywrWHMgRpePWAbKDx/mgRL0R99jTsKdX8P2C6XSbiWRlVma8062joMS3rNvL4nVwCC6q
 Hl6bBaWJTTeiIrNFgEwwX5OSpczTtRafe7mNShjwpWGcDmNEDdZ3ak1gB0j+RHIHFebo
 B/2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=12unMz1nSL+roBv/0C6qq1b88xHII3v1Zwso1zOiM/o=;
 b=lAQ9Ynmgq6TQ+U7dPVxysaCS9fszDqvChacTu/sD7JDjyQBcWSxDS+Z5jhZkpTvE6/
 4H2F4p8/hPw3SmtSPpchyNay0IxITVgB9CUGEatTbzSGW//wbRn1vNQyS97p/fZn0CYu
 SRRbbMJ3cOp3LpGhTw6zPkpTZIEIuyIfroqilqlULHUuT3dPBaj93ASX5nc5M2vlIO7/
 kx48swHSAH7Vossn5bh2L9U72rzxv3quqOxcfs0FNPkdzBDEjhOxXZ/SbwagpjEnA86a
 CRcSRkSNqNvLTzb9KnPRlNBRfgDU/e81fbDbJT9+hqRfezkHqROMpcCAKHShwLAQ3jMT
 xADg==
X-Gm-Message-State: AOAM530NmSo++J4nvdT1iaz75Vz9+oYiSMc7FD00J7v3CWlJwwVxOuwy
 yI9/QBZk6RYfevvwiSBBLbZErg==
X-Google-Smtp-Source: ABdhPJydJutSsJNrYjI8fI9GjZbvDW9dybG89/bAJNz4fjARfqzunwWrVOEO0vbH8nYB7bmLVJyBgQ==
X-Received: by 2002:a17:902:f54d:b029:107:b14c:423d with SMTP id
 h13-20020a170902f54db0290107b14c423dmr904262plf.77.1623869232873; 
 Wed, 16 Jun 2021 11:47:12 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 p9sm2791172pfo.106.2021.06.16.11.47.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 11:47:12 -0700 (PDT)
Subject: Re: [PATCH v3 11/13] hw/i2c: Remove confusing i2c_send_recv()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210616161418.2514095-1-f4bug@amsat.org>
 <20210616161418.2514095-12-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <98c39afe-ad4f-4146-ea51-f59d4799135f@linaro.org>
Date: Wed, 16 Jun 2021 11:47:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210616161418.2514095-12-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.17,
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
Cc: Corey Minyard <cminyard@mvista.com>,
 "Signed-off-by : Frederic Konrad" <frederic.konrad@adacore.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/16/21 9:14 AM, Philippe Mathieu-Daudé wrote:
> We replaced all the i2c_send_recv() calls by the clearer i2c_recv()
> and i2c_send(), so we can remove this confuse API.

confusing.

> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   include/hw/i2c/i2c.h |  1 -
>   hw/i2c/core.c        | 50 +++++++++++++++++++-------------------------
>   2 files changed, 21 insertions(+), 30 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

