Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7744F4D76FD
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Mar 2022 17:55:48 +0100 (CET)
Received: from localhost ([::1]:46562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTRVT-0004cP-5w
	for lists+qemu-devel@lfdr.de; Sun, 13 Mar 2022 12:55:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nTRTV-0003w4-1H
 for qemu-devel@nongnu.org; Sun, 13 Mar 2022 12:53:45 -0400
Received: from [2607:f8b0:4864:20::102f] (port=53951
 helo=mail-pj1-x102f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nTRTT-00071z-8R
 for qemu-devel@nongnu.org; Sun, 13 Mar 2022 12:53:44 -0400
Received: by mail-pj1-x102f.google.com with SMTP id bx5so12411099pjb.3
 for <qemu-devel@nongnu.org>; Sun, 13 Mar 2022 09:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=1Cjjf9SoWMvRO3aE4aQcP2K0+iv0SKlHdL37Bz1vm0g=;
 b=J9blsIS32WDlUqw8uLocrHBksDDjvHHkTLW2zWwvRWbSRatIMUG1IT9tZEEK82LbsY
 tSD0/Rju+dhT0/sYYlBNH0vh3Qi/Dm8T5FN9ivsfk1ijemUn+0udeusivIWUCmKQBNDC
 9riBocPfoKmGfa3C6+HdL9w60KYJl1Islx4IPyhvu7fCwUBQb+diES+dQNxN0igajgPQ
 uqpVeZoeQgTA7N4UmqD6zuGhcDZuOxFOAgLjYheJzkYDlvIqf3OVuiG678eBCmXiHlVJ
 /5v6D5S7elYD5OkA8H/gI8QylLYBY6CmMjJHdnMALLHZSqeS8wTybVpm5yADOajynspC
 pcBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1Cjjf9SoWMvRO3aE4aQcP2K0+iv0SKlHdL37Bz1vm0g=;
 b=mEighIa0npo1y29LyQPI4QdMtd+vjKYO6uVMSMD6Knp+SXJsiyS3GoS+xLiMv4s0O8
 44UGTtItIWP5WfIeWDiKCnC3scij6QpjW/3Y/5NG2ZsjHsvDXHu/TBftC/CZ9grZfrv6
 j0GTi7X4dFeCknyWmdX738L/K/MpRWSHOQIGLCmHuBYH6knJ/e/3YA0tuYusyWcUO+zp
 V/QYvPImr2m8bXHr7GiXgoJSl+c84IeX6D5m0DXjfc8ppOvXzfgZCpJZIrtqKgQkBU5/
 IZxHXVT/R26p72nvPsxfZaPCfZwJ8fNAiZbYpoOed3c0cs4RQ+Qdp1BFBNIKhFoHvuKV
 mg/w==
X-Gm-Message-State: AOAM530N+5zdU8Tqb6bDuV2CQgGgb/p5kNvm45FmIj9zu0mfwhahNui4
 8m5xlcuk1FX9PdBrViGa7OUE4w==
X-Google-Smtp-Source: ABdhPJx9mQUCOUFZJdysMxHEcLDdMMG1lqN3v6uTQKGHkHwoKW+ekOuRj/6qGafDtnOlw695lsXykA==
X-Received: by 2002:a17:902:e2d3:b0:151:f36c:c456 with SMTP id
 l19-20020a170902e2d300b00151f36cc456mr20128659plc.7.1647190413814; 
 Sun, 13 Mar 2022 09:53:33 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 e6-20020a056a001a8600b004f78e446ff5sm9100717pfv.15.2022.03.13.09.53.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Mar 2022 09:53:33 -0700 (PDT)
Message-ID: <7230a61c-e962-00ea-3e51-f2396a758a65@linaro.org>
Date: Sun, 13 Mar 2022 09:53:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 41/48] target/nios2: Introduce shadow register sets
Content-Language: en-US
To: Amir Gonnen <amir.gonnen@neuroblade.ai>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20220310112725.570053-1-richard.henderson@linaro.org>
 <20220310112725.570053-42-richard.henderson@linaro.org>
 <PA4PR09MB4880000D11F64087C24E795DEB0E9@PA4PR09MB4880.eurprd09.prod.outlook.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <PA4PR09MB4880000D11F64087C24E795DEB0E9@PA4PR09MB4880.eurprd09.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: "marex@denx.de" <marex@denx.de>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/13/22 04:55, Amir Gonnen wrote:
> (Continue discussion from Re: [PATCH v4 24/33] target/nios2: Introduce shadow register sets)
> 
>>> How does "cpu_crs_R" work?
>>> ... Otherwise, each gpr access would be indirect. I'm probably missing something here.
> 
>> They are indirect, but with some optimization.
> 
> Why not always access directly?
> With an EIC each interrupt handler is associated with a specific shadow register set, so we can expect that (on a sane use case) each block always executes on the same register set.
> If we update cpu_get_tb_cpu_state to translate differently based on STATUS.CRS we would still end up with a single translation for each block.
> This way the translator could emit direct registers access for shadow registers, and we won't need to rely on optimizations to lower indirect access.

We could do that if we support fewer than 64 shadow register sets:

#define TCG_MAX_TEMPS 512

Global temps (e.g. cpu_R[]) count against that limit, and 64 * 32 == 2048.
The maximum number of shadow reg sets you could support like this would be about 8.


r~

