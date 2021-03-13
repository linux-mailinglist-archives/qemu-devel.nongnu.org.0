Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9694433A198
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 23:22:17 +0100 (CET)
Received: from localhost ([::1]:59992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLCeG-0005n5-Ln
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 17:22:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLCcw-0005Ix-1i
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 17:20:54 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:35775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLCct-0001FB-RV
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 17:20:53 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 c76-20020a1c9a4f0000b029010c94499aedso17947439wme.0
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 14:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vCXYRLX7cCslhQlgX0JgksbuZNo5RWTZ9s3duxNVcKI=;
 b=fYyeM0urQcOytxHSk10Jt44UFwhdoGbOigRNfcMIiduOvT3BiLVW8bAGD0Wlaj7IE8
 XZioQVqyJxXvnhYJaiABgB8R1tpcVpXaIZcSBkHXcFFftElbIIHxQictbCEGH8lyn8/W
 r1NltJobYbpTXX9d+JhGaNu33rlML60LOHZaF8O+OiyQvZ8mY8ZeQOEZAzqqPb0FdADH
 uePSChPM1reYof+MC6yZIh+kHsFkMR5zetj6QsyT38gp7GKRwZRRTCNTbe5d+WUQEN43
 pDuv9rOgP6gpOIb669FiGb4gEsyLKXrii4qDC3sa0SVdCVuPmHeWBGwmSu4s/lIpz2Xz
 cybw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vCXYRLX7cCslhQlgX0JgksbuZNo5RWTZ9s3duxNVcKI=;
 b=QhfOPaNY+4ig7pRBn4VSwwcwtFywPIY9dkJ1ydhPhV9pRMJtHUILfxAGzTCXVvG4+t
 3GiEeT1FSH1IZLofBdqjeXfumCZKLW1JFGA9M+7ScI9Y66BM8hF2gSPMVvRisfGLdHLi
 AMvpCgum83WQbbkL6c43YozDC022KuTCEv7KZfG3ZILKBabwDTFejaErsLa0RjSOKuvD
 CyH/aIx09HcKm9/zoT37fU36wXvvafh0uboFxC82bTwcrMIFvyEZ7oNQX5iycM34h0uW
 WIazN18QQjAii7+QNz3Qij7PtFVOOSzfZWy6HPAvz6PpMvwWYFFM7XDYiaM6sagKyzWE
 Ni6A==
X-Gm-Message-State: AOAM530/BA7IwEGbiIYf2Ka34jYOfMvARQsxNrcpFkqYcXc52j7yHJBV
 zY8h5sdJ0tAtHVnAz2NzAig=
X-Google-Smtp-Source: ABdhPJzrPtaryscX528mYslDZBdjSLp8HYvlC8AAx0SlkXidR7BZXmAgNunAErno4yy1XLlVOiY73g==
X-Received: by 2002:a05:600c:2247:: with SMTP id
 a7mr19460859wmm.131.1615674049952; 
 Sat, 13 Mar 2021 14:20:49 -0800 (PST)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id a5sm13564818wrs.35.2021.03.13.14.20.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Mar 2021 14:20:49 -0800 (PST)
Subject: Re: [PATCH 09/11] hw/avr/arduino: Replace magic number by
 gpio_port_index() call
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210313165445.2113938-1-f4bug@amsat.org>
 <20210313165445.2113938-10-f4bug@amsat.org>
 <630340c6-05ab-5d31-78e9-21231714a986@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <dfc38944-18d9-0b59-6096-53f709579834@amsat.org>
Date: Sat, 13 Mar 2021 23:20:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <630340c6-05ab-5d31-78e9-21231714a986@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <huth@tuxfamily.org>, Sarah Harris <S.E.Harris@kent.ac.uk>,
 Michael Rolnik <mrolnik@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/13/21 9:02 PM, Richard Henderson wrote:
> On 3/13/21 10:54 AM, Philippe Mathieu-Daudé wrote:
>> +static unsigned gpio_port_index(char c)
>> +{
>> +    assert(c >= 'A' && c < 'A' + GPIO_MAX);
>> +    return c - 'A';
>> +}
> 
> If you're not going to use this for anything else, isn't
> 
> #define PORT_B 1
> 
> enough?

Surely :) I'll squash that in previous patch.

