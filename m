Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8E53E3412
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Aug 2021 10:22:16 +0200 (CEST)
Received: from localhost ([::1]:41084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCHax-0006hJ-Nk
	for lists+qemu-devel@lfdr.de; Sat, 07 Aug 2021 04:22:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mCHZH-0004r1-2f
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 04:20:31 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:33480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mCHZF-0002zM-LN
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 04:20:30 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 m36-20020a05600c3b24b02902e67543e17aso376992wms.0
 for <qemu-devel@nongnu.org>; Sat, 07 Aug 2021 01:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RW/3LJFEeIOfcwsmeMcc3rKWdlqhfz6E2DdQl/R0NG0=;
 b=rVCks0/eedhDK0qAv6aEJMSG6lqr5tU65AapcJyK754oby9Qf613woNzk9O9llNF5M
 DmYPIcflvBXj8CLqjeIOxXgVj7azvnxe03cc6pxNqFoWlwKghWe4BDlqm+0e7llPC4+r
 cmCMXTLagQ/3B0c5xvONqOGZh05Pow9ZvveCam/PINkHN6KBO9K3/cEtGdQ8lQK1ZNCG
 EQI1rlBDYZvD40FEKBY20R51kpJ8AsWiUbuWNuJpPB3wtGt/gKJO/B8JfQRN0tONTl7a
 QFaehlNTPNkxLUzHJas5lrohlP9IAhzGn97WvHH/DXEPGNmBhNstAoDwY0MT4lPGiRQa
 Drkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RW/3LJFEeIOfcwsmeMcc3rKWdlqhfz6E2DdQl/R0NG0=;
 b=syWjHCWXzFEgom1x2/orcdi20L5Iw2/8Skv0xlkNtUJWsS3l8wdwSq9+MV3LADBY/n
 O+mM8cy3RnkrtjsZJfpqkQgUmddSuyaJuRmKG0tJpNl2i6ttB2N2kCSg5e0egUcAiqGM
 hNq4PW+doIV1EpF1Zu2R20ybdONaWSVXqqhYH1QA6K42T+/BdB+MpmJXhphVmj/Nak3M
 lvCsxr5ONrs+EmOLyN4FAVba7bSDn3u5ypSniAkIsBHF4kdpedwhUPsH6MUcnZMUuQEE
 zpFlR7gGSjuOadwYoQ8s8atAph+50+6tacxy/LEo6xEMsXgR8Ro3eeU/x4ydErSyRry+
 c/nw==
X-Gm-Message-State: AOAM533yzv/mxpWCWweOIQve0IcHzIYV3ttSzSkCoZ3/e/qQOBqnNjfg
 IjvauKB/NNGRDsLEXYRITeM=
X-Google-Smtp-Source: ABdhPJwHpCuA8RC3F3ZieTlhF1GYPE3J/hudKgy46B0eg+O7JGxqSKy3NnajDpAH8sL616SFy9IMig==
X-Received: by 2002:a05:600c:4784:: with SMTP id
 k4mr24655858wmo.166.1628324428251; 
 Sat, 07 Aug 2021 01:20:28 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id h16sm12069321wre.52.2021.08.07.01.20.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Aug 2021 01:20:27 -0700 (PDT)
Subject: Re: [PATCH-for-6.2 v2 3/5] target/mips: Convert Vr54xx MACC* opcodes
 to decodetree
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210806210548.8568-1-f4bug@amsat.org>
 <20210806210548.8568-4-f4bug@amsat.org>
 <b1a62cde-a944-d1be-2c12-8560f3c82756@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a3b020e6-3dd4-3a86-f3ca-bb1df1066f5d@amsat.org>
Date: Sat, 7 Aug 2021 10:20:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <b1a62cde-a944-d1be-2c12-8560f3c82756@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.619,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/6/21 11:42 PM, Richard Henderson wrote:
> On 8/6/21 11:05 AM, Philippe Mathieu-Daudé wrote:
>> +/*
>> + * Helpers for implementing sets of trans_* functions.
>> + * Defer the implementation of NAME to FUNC, with optional extra
>> arguments.
>> + */
>> +#define TRANS(NAME, FUNC, ...) \
>> +    static bool trans_##NAME(DisasContext *ctx, arg_##NAME *a) \
>> +    { return FUNC(ctx, a, __VA_ARGS__); }
>> +
> 
> I was thinking this could go in translate.h, for use with the other
> files at some point.

Of course... Thanks!

