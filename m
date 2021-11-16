Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8297545341B
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 15:25:20 +0100 (CET)
Received: from localhost ([::1]:37000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmzOh-0003WO-L5
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 09:25:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mmzMX-0007em-Dc
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 09:23:05 -0500
Received: from [2a00:1450:4864:20::435] (port=36646
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mmzMP-0003cN-CB
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 09:23:04 -0500
Received: by mail-wr1-x435.google.com with SMTP id s13so37987258wrb.3
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 06:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PrgG+NAE011F02KcbMASwDRvuBWgpALJ8MkUSEuTA5w=;
 b=mWb9XOZb7LDNlDmU0xfkRit33U0rTDeo8LBZ52wm5yvIDlIwCJ9f5cXl5g8r2rYOAe
 Mc2AbY3JNaRAwDKGV2xPjWLYIGKQywRbnrFKvaRMAWDWDHdpXsWCU5pytFCPBOVrAFnZ
 8o4VQus0Man0oUdxATG0cc/F4HJ93kmg9sL/z0yeULQon7PvaN7jpjHJXduJoXmZVJ/k
 ThFvmmlQP8kOoCe5s27xO3/Mpy5s5Az91fZbHpkt8/w6L+/HVcMKXjtkEYJgQIiS+Qoz
 4kczfUsjKyA4t3nvLRHyiSuHc3Kq1+nMEpvKX7xlyPsioHTKplO4f0zKF5NBVEOCPOIf
 YKkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PrgG+NAE011F02KcbMASwDRvuBWgpALJ8MkUSEuTA5w=;
 b=l/vghqVAVuHeb0aG4eXO3xs0kAiPgvSjbgEXi9PUnVYQ0Z+M8BnRPNXzhTE9Cnac/Q
 zIwzFN7/7WcImCegELjrBfDd3nFcSQPTG40HiMlyuv/gBZ6EAPYRdiMCE5De5vMjbwXm
 LdY9RfFTgwQSg3tKDuKVsB7SSk/38ziH5bBz2hu8TwNiHljW5eAUqu+LdSvC+YPslgj8
 r/NvMHA9gM2qKuyFtvJGMwwniO3lA/AmOIEn9iUOJYC3ZDxi2ej03Jk/j6uP27b0EbtT
 K3G+IPkJz1sarnqVcBKNNyKNDZO5vQOnMugyYRKNwCWqjBsA0FJylgL0bkAPpUERjWSs
 3Krg==
X-Gm-Message-State: AOAM531LdpWX2CYeon3DCuUbfPiRZMcuAK9rlyNDR+BTgrZVVzM8KUzn
 Jg4gv5HtWKlSeWbsEiunrRomNQ==
X-Google-Smtp-Source: ABdhPJzG1KM0UOG9KiWS1axgEyrGgvinLZwtwJHhpE8Es5ytLA/oAUG2n/XMsDoDE+1QGyPWoakCZg==
X-Received: by 2002:adf:f60e:: with SMTP id t14mr9838774wrp.112.1637072575617; 
 Tue, 16 Nov 2021 06:22:55 -0800 (PST)
Received: from [192.168.8.105] (145.red-37-158-173.dynamicip.rima-tde.net.
 [37.158.173.145])
 by smtp.gmail.com with ESMTPSA id e18sm17763888wrs.48.2021.11.16.06.22.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Nov 2021 06:22:55 -0800 (PST)
Subject: Re: [PATCH-for-7.0 v4 05/11] tests/unit/test-smp-parse: Split the
 'generic' test in valid / invalid
To: "wangyanan (Y)" <wangyanan55@huawei.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211115145900.2531865-1-philmd@redhat.com>
 <20211115145900.2531865-6-philmd@redhat.com>
 <0d3fa53c-ae1f-abfe-1418-46f96ca75015@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a1cfcb19-d493-719f-3e34-01b7e41dc2dd@linaro.org>
Date: Tue, 16 Nov 2021 15:22:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <0d3fa53c-ae1f-abfe-1418-46f96ca75015@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.446,
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
Cc: Thomas Huth <thuth@redhat.com>, Andrew Jones <drjones@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/16/21 3:07 PM, wangyanan (Y) wrote:
>> +    int i;
>> +
>> +
> Ah, there is an extra empty line which should be deleted.

I noticed that too, but it gets deleted in patch 7, so I let it be.  ;-)


r~

