Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D633341258C
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 20:45:01 +0200 (CEST)
Received: from localhost ([::1]:35054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSOHk-0000NJ-AC
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 14:45:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSOG3-000832-Mr
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 14:43:16 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:55058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSOG2-0002sK-7E
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 14:43:15 -0400
Received: by mail-pj1-x1034.google.com with SMTP id me1so4005195pjb.4
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 11:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:references:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=fSo+DtTHgSf5viZ+pURPbIggvwhSNGl9nQmCZWqKW1E=;
 b=qHg+umX7nh8ItpE8CqaFayCUDeUm1B++/pmupDOYg67vMayrItijaQxwr0zajzwMIm
 zZDsmaOkKPtbqJecu5XN0lV38Iqh7R334YyeDKYCognrp8lIFNmTdTljBbh0P4jApFxT
 N9jWspK+zRvlkU30LpKtoM1kfR8VDEqFXYy0M9V1AcuClw4GHVc+E6zZfeedKgNZkGef
 p2C3E6Lg0nVnzmFVMLOJW5lcG3nT4LiLL3+m7psp84hCDe9pypKrs2O59WkC4SFF98QD
 MYPkmto3qrNhDzO14KEQINfrU9h3FAuFBoSHe6OJAJX2IpKaPA8lgDbVZ2YRWdLb5Lvh
 +yxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fSo+DtTHgSf5viZ+pURPbIggvwhSNGl9nQmCZWqKW1E=;
 b=5bd0SIwxIXchCtk8UOdYrQzRsfkRl2QNjAbVLrAVZxNohrc6N43+d3nVHDBSGXne3h
 /CNj1oq9EjoYca4LZpTNVt8fS4/GPSIIWSGCVJWPFTKKRRdebqVGk9okWnWoKhe6IiiN
 GFkCG+iPSNJSB93oY2MlxTOBUxUlAZ8KGiBUzswQCnHZIBuJ5POqyYDwQrizY4IwQyvd
 YkYAIdzmxqRHNLEkQf/lNfW1lqiKnYrNLNa/XXSodiJJM/ox4Pt756llascy0twap1UZ
 DBiBZmlmrD+ErGkdMVPGqPIygO7wLAqv6pv2T4ark2o3dxd/wCQJ0H6DsIPXcyZZ6uuM
 ogcg==
X-Gm-Message-State: AOAM531NDbUu+fRLKyT8DFiq+K+mHixJhY5zOU4N0g0x+Y3TjB0T9hOH
 qn9xGXmlvDqPpWssME57tknb0rr81+dLlA==
X-Google-Smtp-Source: ABdhPJycN2gfyHvHak+CWhdO86q2KjBjy3yh00stHcrjcnjECv6AIhf/K5f61ppWi1Ys072RGsvbog==
X-Received: by 2002:a17:90a:192:: with SMTP id 18mr485510pjc.119.1632163391687; 
 Mon, 20 Sep 2021 11:43:11 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id bx2sm166581pjb.35.2021.09.20.11.43.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 11:43:11 -0700 (PDT)
Subject: Re: tcg: pointer size warning on x32 arch
From: Richard Henderson <richard.henderson@linaro.org>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
References: <f5bd1db5-1bf1-e32f-3eff-aa8f0c7e8a1e@msgid.tls.msk.ru>
 <6b1c1c7f-0e0b-fd49-2ef8-1ab7c8b7a3e5@amsat.org>
 <fd38f80c-bd36-8399-33b0-bbd3ec566813@amsat.org>
 <c8258e0d-5c87-3953-6355-16d3c1604d43@linaro.org>
Message-ID: <bd21e7a8-a121-9f8a-454d-9b77d16c1f89@linaro.org>
Date: Mon, 20 Sep 2021 11:43:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <c8258e0d-5c87-3953-6355-16d3c1604d43@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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

On 9/12/21 6:10 AM, Richard Henderson wrote:
> We may need something like
> 
>      if (sizeof(void *) == 8) {
>          diff = tcg_pcrel_diff(s, (const void *)(uintptr_t)arg) - 7;
>          ...
>      }
> 
> I wonder if I still have an x32 vmm hanging about.

I do not have an x32 vmm anymore, and I don't see a distro ships one either.  So: Michael, 
are you able to test and submit a patch?

Otherwise, because of the lack of distro thing, I'm tempted to drop x32 support entirely.


r~

