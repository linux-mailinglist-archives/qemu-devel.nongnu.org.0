Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BB7301909
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Jan 2021 01:17:35 +0100 (CET)
Received: from localhost ([::1]:49964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3T5y-0004I4-Ox
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 19:17:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l3T4S-0003lj-Ms
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 19:16:00 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:37637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l3T4Q-0001DM-FL
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 19:16:00 -0500
Received: by mail-wm1-x32f.google.com with SMTP id c128so7584670wme.2
 for <qemu-devel@nongnu.org>; Sat, 23 Jan 2021 16:15:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MrziVC6RgBpiIAjVzx9o976IUsur+MRtH+ugW0c6+F0=;
 b=saoaB5G8TbiXJ3ZODP/YmkBRBciNvZTl59hNkD0sJRUmYuD4TRFJn15vy9Sd1YobWO
 T/ibLN4ApuVjjHueJDYSV0siAuhh6FoX9WavUWogauIRDrRdT+OuAyy+wo2tZVqJM/BU
 pgFaYH2Yt7PAsTM5gTlONaAKSJ6f7xGhyzaYLi5xKtBPe+4MsBVClfeEqcIVaZZRpaVg
 mm908pTJ7NkbcUOqbHiJck9LiUgpWYYaQihZlNe059DkDkmD+MpuJ0MgMZzYZmnRy86i
 BmaSUghrGt8K+P+PeV8tz9FxxMpMjUubliOZhRUVzM1myZwgjoaH3/v6/v6mJbdlqbyR
 w5Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MrziVC6RgBpiIAjVzx9o976IUsur+MRtH+ugW0c6+F0=;
 b=Ni2LYPQIvJcEpUbFjYD+98GDkYgaYD9DFtTcjH4ZZdSMOEPM9d6aTb49Ajy3hjxH4E
 ZnFjkBzXJrdHII4+fKE9YpLLbxABux4lINJO3e+N1BHNyXimPIQFeTlbPFxBTpi8lym+
 QvePtYZ2KKEUBwfju1TFBrUCf1w8rm7mBrASsM6rMJ9Uzi2hE7bIzOI1108bUSxctBHr
 mnv29JBIcLMsCCRpBS/j5cUf+R6c+NsSC9L+5QyVzpWCosnsmik3tfcFVWK4FQA0t+Z9
 dpAEHwTEKWWMf4Rr4NMuGiZm6iiDJoYLgxW67l5clJUhfBCCKmf9GFieGfm6LHj55pVN
 Gv+A==
X-Gm-Message-State: AOAM532T+y6Y7ruIdHjrsT8weFxFX3k6Zlww6bS7rGw8P4iJ6d1Pk3kd
 IFBLpeXqmu56jmTcjKULMLo=
X-Google-Smtp-Source: ABdhPJw8+mWyis5JUYHu1iR3fTfM1bA7+dbntzLEN8c9BgvyAPzkZ4ZeFbrMAwB4v2yjeVz5vhzhNg==
X-Received: by 2002:a7b:c45a:: with SMTP id l26mr435157wmi.164.1611447356751; 
 Sat, 23 Jan 2021 16:15:56 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id r15sm17862391wrq.1.2021.01.23.16.15.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jan 2021 16:15:55 -0800 (PST)
Subject: Re: [PATCH v2 6/7] goldfish_rtc: re-arm the alarm after migration
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20201220112615.933036-1-laurent@vivier.eu>
 <20201220112615.933036-7-laurent@vivier.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <675be367-27b3-6fd3-c707-f1938d7b6f24@amsat.org>
Date: Sun, 24 Jan 2021 01:15:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201220112615.933036-7-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/20/20 12:26 PM, Laurent Vivier wrote:
> After a migration the clock offset is updated, but we also
> need to re-arm the alarm if needed.
> 
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  hw/rtc/goldfish_rtc.c | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

