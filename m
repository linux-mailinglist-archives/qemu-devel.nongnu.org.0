Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADF84E814F
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Mar 2022 15:04:50 +0100 (CET)
Received: from localhost ([::1]:54636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nY729-00017W-Ds
	for lists+qemu-devel@lfdr.de; Sat, 26 Mar 2022 10:04:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6ai-00084f-Mh
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:36:28 -0400
Received: from [2001:4860:4864:20::35] (port=42251
 helo=mail-oa1-x35.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6ah-00072G-2T
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:36:28 -0400
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-de3ca1efbaso10733920fac.9
 for <qemu-devel@nongnu.org>; Sat, 26 Mar 2022 06:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=IErtRAJ+KVJzc/Fi1pPHrRhKRVkGMh+JzilYF99JQ0A=;
 b=yAg7Ic1c4e8heebtZ1gdnLFG/WakPETuUumY/iic7UWM0hTZvn3Wx/94pDlC41SPYp
 PG11lw5CMNE2Q68Kljx6WRXIwzB2xwTBzWz6pnjaNzgd6haQV1wWY+r4Eo9OmYg5nfrK
 tQ/MSgApzqGfVx1W16td+5432w3emWO77PQ89KsDf+gU/C2Xj0oCyZoMowDfTExItBd4
 dqrZLnseyc6Cz5HCZMzVTAvcd3fjPm4HvchT+QGoUlLVKrVM+MpLhcc9bz2w4XNtn9G1
 XV2MX6B3OxlMt5j6B0H7wpS/5rMM3Xaod+mBpI2YDKpBYH7VQScNHOW/aNAocIsaE/rp
 Dt+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=IErtRAJ+KVJzc/Fi1pPHrRhKRVkGMh+JzilYF99JQ0A=;
 b=D+8j56yWLbBAlPk31q0tZw0clRtIkbLC1Aqr9HEPs/i+1OjwU4OiN7ZXSNoUx3lIS9
 Ard3clh28U8EpUga6lHM3Lc2LeekLDfA7uAFUB3dftuCDExL22SwOKDSYtNSvfA1Nn+8
 +snJYglwdUrp3k+HcNBVfsllRDO7Zim9sO/jt06VVPQvz0s0uT+ycDY9L5zaQzZZ9szH
 +OM46LVRwDodVx5fnnfKTA1H9QPVlqfwC2/kUJBYU5vlw7BAS+B4tiOxqNlQFX/YGVsm
 BKdKTEiWSe1F8c80LxSlzzrPjZAl5zVnqp2tC4XSU/lnNsnQMTWSMIbEVcW0Vhpyu1Y+
 DLZA==
X-Gm-Message-State: AOAM533zoRhO9fffMHfTQZB+TXt7MmKl5c1yn6TkzTq5GG85tOzC8DYj
 S6zb2pJjjZN6yvDiQt0o8JhzraNXhwfB5CKS
X-Google-Smtp-Source: ABdhPJy8nE5OutFaMxJNrHADig4BpPLEKia/Azhmpd8YqIs2FuAZCpA6u2EGEtgWdbskr6jhL53jZA==
X-Received: by 2002:a05:6870:5702:b0:dd:e87b:f82a with SMTP id
 k2-20020a056870570200b000dde87bf82amr7093450oap.125.1648301785871; 
 Sat, 26 Mar 2022 06:36:25 -0700 (PDT)
Received: from [172.24.8.129] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 s10-20020a4a3b0a000000b0032486bc11d0sm4090571oos.39.2022.03.26.06.36.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Mar 2022 06:36:25 -0700 (PDT)
Message-ID: <ff27ffa1-6006-4400-7015-bf63c1dcb123@linaro.org>
Date: Sat, 26 Mar 2022 07:36:23 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 1/8] linux-user/nios2: Hoist pc advance to the top of
 EXCP_TRAP
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20220326132534.543738-1-richard.henderson@linaro.org>
 <20220326132534.543738-2-richard.henderson@linaro.org>
In-Reply-To: <20220326132534.543738-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:4860:4864:20::35
 (failed)
Received-SPF: pass client-ip=2001:4860:4864:20::35;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x35.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/26/22 07:24, Richard Henderson wrote:
> Note that this advance *should* be done by the translator, as
> that's the pc value that's supposed to be generated by hardware.
> However, that's a much larger change across sysemu as well.
> 
> In the meantime, produce the correct PC for any signals raised
> by the trap instruction.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Gah, sorry for the extra noise with the repeat of the nios2 patch set.
I failed to clean out a temp directory properly.


r~

