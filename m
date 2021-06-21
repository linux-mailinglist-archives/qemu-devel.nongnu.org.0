Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E51AA3AF975
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 01:35:02 +0200 (CEST)
Received: from localhost ([::1]:52910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvTRV-00038a-RN
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 19:35:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvTNB-0002UE-Rm
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 19:30:33 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:42532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvTN9-0004UD-6h
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 19:30:33 -0400
Received: by mail-pf1-x42c.google.com with SMTP id y4so7889618pfi.9
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 16:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=rFMNq3ssNQmpvbPfFhXJm6tuO4FlhGowcXEFVD/16Ng=;
 b=n5U7VzNgxnRWoe+UOrjVsZaAzTxioY+7RkNNhp1Uq7aUDQilhFocVHggO8QXhfNJIH
 a9lai+4rjvXu8i1HU3CS6c7OCQoycC7MjPk7+tJ1c5Ll1mKN83WrlpmWBa/WH06YcfCK
 JMX+7bNjhkVfLgVLLCbBfVoe0+AT7O8Et9pEbR/1KQiLm1yYr42BonZRGJq9j9lkhvZ7
 o7uiO4TmIjc8G1q3X4aQGRYWFX4PpKkg/kHLlhHYkpCExsdNBjBjE+lHXTKQntWY5UjE
 xdbu9+qNR3+vqnGdXGWO0ddTei0Ra9eH8keGhaGxJRybavZa8GbCC2WkwE2d++AJWPaG
 VbTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rFMNq3ssNQmpvbPfFhXJm6tuO4FlhGowcXEFVD/16Ng=;
 b=AAO5jh4f4c8CGa+tTm3OOssNg8E97EsBqlUNiAuY+BJWxstmtyVHE8q+6vaZmJ5fne
 XfeLLpNUL/zUShuHogo4Kq5CKCoam2C00Pc3XuciNjs2NOh6ZJbxVjoBUyyOMpNFLpY1
 JnkEyq8tPWUeTy29lI8WdfUjXr3Tj/NhRivR8vvaQt5CHVD8J2PC5wgucv/n0huvXqP9
 6IxyPIOuhzVPDZNGYIWs1wkJqn40kEzTs2R96mNUPpVIAGjTrs4ZUqTRZwriFqs06Ce0
 c55/8koxJ0XyLstmBG5of5AUl5oVPb1kNkMvd/9JZM/bUiAdiH1hcKT/EN7vxkkwPuJm
 pe7w==
X-Gm-Message-State: AOAM532DnKRoKHWoBT9mKBj3DsFWvHm4zznQa+1qlpsLvLELGaeJ00xv
 4JrnT6Susfo+XdddYVtjacaGXYx4Z1ginw==
X-Google-Smtp-Source: ABdhPJyjVuQD788WOxP/v/ELTrWhwnnFkqsxm67n/nr4emJ702kxvlBSJ2nQqH1oaDeggLKVGvubow==
X-Received: by 2002:a63:2f05:: with SMTP id v5mr836872pgv.449.1624318228858;
 Mon, 21 Jun 2021 16:30:28 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id b10sm16386263pfi.122.2021.06.21.16.30.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 16:30:28 -0700 (PDT)
Subject: Re: Denormal input handling
To: Michael Morrell <mmorrell@tachyum.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <30eafc8be31446f9aecbc40f487467e1@tachyum.com>
 <c021f386dcfb49aca2ab0c01f66bccc2@tachyum.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <08ba29ee-d5c0-8c61-0efc-4c03fe9da944@linaro.org>
Date: Mon, 21 Jun 2021 16:30:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <c021f386dcfb49aca2ab0c01f66bccc2@tachyum.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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

On 6/21/21 4:13 PM, Michael Morrell wrote:
> I have another couple of thoughts around input denormal handling.
> 
> The first is straightforward.  I noticed that the Aarch64 port doesn't report input 
> denormals (I could not find any code which sets the IDC bit in the FPSR).  I found code in 
> the arm (not aarch64) port that sets other bits like IXC, but nothing for IDC.   Is that 
> simply because no one has bothered to add this support?

It's because we failed to use symbolic constants.  See vfp_exceptbits_from_host.  Which 
*is* used for both aarch64 and arm.


> The second concerns support for cases where multiple exception conditions occur.   I had 
> originally thought that denormal input handling would be orthogonal to everything else and 
> so a case like "sNaN  + denorm" would set both the invalid and input denormal flags or 
> "denorm / 0" would set both idivde by zero and input denormal, but I don't think that is 
> true for at least some architectures.  Perhaps some specialization is needed here?

If you've got a specific example, we can look at it.  There's no point adding 
specialization that isn't going to be used.


r~

