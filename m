Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE6731B215
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 19:46:45 +0100 (CET)
Received: from localhost ([::1]:56434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBMPs-0003SX-P3
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 13:46:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLxV-0001xc-2X
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 13:17:25 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:38376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLxT-0006M4-PH
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 13:17:24 -0500
Received: by mail-wr1-x434.google.com with SMTP id b3so6158424wrj.5
 for <qemu-devel@nongnu.org>; Sun, 14 Feb 2021 10:17:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gAV9dhSmD8XPDhHarK0arlCMTLOuk2R9uOOKR4h5qX0=;
 b=rGuD63dNMc3jaYdxW50/bZFrSgko/sZ84bFOq1zkh8RmbE5QfwTJ+cXjzPFtl74wFd
 kglsc9yn9nu6KtPAjJ92WpQ3xAOWkRjFUW00Dvvoio/beVpC9L/XTuMWooFEV8Ek7ejz
 jD+AylNVUXiWPwfu3t5pLTLxDMX9Sv4iNhMGleeboHZj6D4lUJvk5iyg0CILfIRXsuOy
 Z2alT6ssZ6ttykCgdP9R9i3Uw9jyis2WWU1J7SpHRiXAzG6FupHl2wTXn27ci+9pxBXp
 2XQTxpXtFUNjJQpHqys4pprl7R7hQCrbL9QoasbPaLDMkecU+ph9WhJ0HU3X0hr8sGYY
 BU+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gAV9dhSmD8XPDhHarK0arlCMTLOuk2R9uOOKR4h5qX0=;
 b=kQCWLSqscrLfkqeT1tXmoUgRt9NWdT7UbNStV2AyIDCcVvPpuz0EcfXIOrz2F1talt
 Ag8AL2hLKDmwUrP19zr3xiDJIDi36gESFXQ7PErZxxkiw3E5wyBAzQSTnOux7THAV1WJ
 Z6Tv3wJ+CD7FzUZEzJS1+sWngOdX2kP3ulFIfVYutExRCAW50EqDt+3ze8+VozqhbkZk
 uJPspZeiZBYcJlats4aPF5WhDDteewRXbdIHbqtnF2Izs+WMrRVpYuEzKWv9wZfJ1qlI
 VqSiU6+v6EvvH6xVExdwS2obYBv8hBCUKTFPHRY9zdgEDQBtajrGGIuP6hidxjkX+tHW
 qGQA==
X-Gm-Message-State: AOAM531WdjM7pOXYfxLOyJGrm1hYn8G21v5abnZMniOGJbITySikzxJg
 LkVxn9OfutI32e3bUMILxDXh8MwCUDI=
X-Google-Smtp-Source: ABdhPJwwPF2hvSMyK8A2tOlcMA26ba4+zrPIqg7CtUf86xqGnd4gE0S9uccdKwZFOP4qpoA+CMkvvw==
X-Received: by 2002:a5d:6181:: with SMTP id j1mr14711356wru.11.1613326642419; 
 Sun, 14 Feb 2021 10:17:22 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id x18sm1583892wro.66.2021.02.14.10.17.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Feb 2021 10:17:21 -0800 (PST)
Subject: Re: [RFC PATCH 01/15] qemu/int128: Add int128_or
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20201021045149.1582203-1-richard.henderson@linaro.org>
 <20201021045149.1582203-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6353c5f1-6e08-ad2e-7c09-beb6203c53c7@amsat.org>
Date: Sun, 14 Feb 2021 19:17:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20201021045149.1582203-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/21/20 6:51 AM, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/qemu/int128.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)

Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

