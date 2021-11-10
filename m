Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8E844BDC8
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 10:29:18 +0100 (CET)
Received: from localhost ([::1]:46884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkjuv-00034a-65
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 04:29:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mkjtY-0001ye-NU
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 04:27:52 -0500
Received: from [2a00:1450:4864:20::429] (port=35644
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mkjtV-0003xC-OF
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 04:27:52 -0500
Received: by mail-wr1-x429.google.com with SMTP id i5so2856609wrb.2
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 01:27:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+rAK/5C6Ul0fmvGRVCiX17P6+L+EE1k/R26N+WmYX1M=;
 b=sSDNIu2gxvB4zdTQ774P4UenT7Z/eEW/xoRUCf7FQaX9oNFEQO0kxM9JsaEBbcs7EM
 P7l60yVHp6BpGVhVhEyEkfbdM7cTS+T+awtZWk8+Bcqy4vdF/x1QkltBIfbYpHQ/qz5u
 yR8tLa7UcibC4Ocwg440s4ahyeFT3Zq+v8KyGBztqITYYcCLcPSm7IOx7Wh+RPQ2r3Al
 fEesok2iRNNOHTTTM1hqDuOBoQ+aNkNq1SsBwysXmWex21rfdq39tR9AcZv0xY7gl0mY
 LSHqiZEUo/l3JQaNsvQ7s4bSBZywLILnpyVxJCEwHVesMFcBwtqBV0GXelfJIewlwc6S
 Iqew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+rAK/5C6Ul0fmvGRVCiX17P6+L+EE1k/R26N+WmYX1M=;
 b=VHyqw6cVCb5v55QWiE9eEbpC1Efq1GRtWnsnynhbXnru2DsGW47vc62rtjF1oLCuGL
 swH53cnWDENwO+Kau40uydWeJ2vgenD2Dh2DGcaNGbVUdAaIfJ+Dv5gHwm7+xKN6xj8+
 meAqI4tNVP6+fJMTHV/DRiFnzDbDBqUt96LTQhz4BADUEDtYGqZId6lIMC5SXrdgXnVD
 bVos5OXkqNoUKupqOkSknmsRlD7y239kjIUZSqe2JI2H2M/H3D+iMKSXUaWHdvRR3A5+
 FzJbyxgU2Fh5gmvwmVJLi8T5Zpz5ZA3Uom2FZ7jSavaHlOsXgay+rND3WxawUMg4k9Uf
 eXcg==
X-Gm-Message-State: AOAM532HwJkrVRpp87gC999aa55q3H8OJt/wy2inPpY6VJQBJUNJtmq5
 Ac+xfnvyGz3OoBJVffUT74SUlFvk8IpnDpQ0
X-Google-Smtp-Source: ABdhPJwmpEvNl1UO71M3nYjlMuqYxx1rVWUQ4Sjif1sMpRGr/3XGkNfCH74l9JaLgk1BGBQxXA8NQA==
X-Received: by 2002:adf:f551:: with SMTP id j17mr18109558wrp.392.1636536468230; 
 Wed, 10 Nov 2021 01:27:48 -0800 (PST)
Received: from [192.168.8.106] (104.red-2-142-241.dynamicip.rima-tde.net.
 [2.142.241.104])
 by smtp.gmail.com with ESMTPSA id e3sm22042586wrp.8.2021.11.10.01.27.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Nov 2021 01:27:47 -0800 (PST)
Subject: Re: [PATCH 0/4] linux-user: Fix getdents alignment issues (#704)
To: Warner Losh <imp@bsdimp.com>
References: <20211107124845.1174791-1-richard.henderson@linaro.org>
 <766F517B-509D-45C7-94B1-51BCE5D4FE36@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1e9c0dc0-d068-1b91-b346-07290aeb28a2@linaro.org>
Date: Wed, 10 Nov 2021 10:27:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <766F517B-509D-45C7-94B1-51BCE5D4FE36@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.678,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: laurent@vivier.eu, qemu-devel@nongnu.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/9/21 5:46 PM, Warner Losh wrote:
> 
> 
>> On Nov 7, 2021, at 5:48 AM, Richard Henderson <richard.henderson@linaro.org> wrote:
>>
>> There are a number of alignement issues flagged up by clang,
>> this attempts to fix only one of them: getdents.
> 
> Does it make sense to have size asserts for these types? That would catch the alignment issues and are cheap to maintain since ABI sizes should never change…

Well, the size of getdents64 doesn't change; it merely lands at a different memory offset. 
  But we've now told the compiler about it.


r~

