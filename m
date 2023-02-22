Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF4A69F5CB
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 14:38:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUpJc-0001D1-Gb; Wed, 22 Feb 2023 08:37:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pUpJW-0001CU-9h
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 08:37:42 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pUpJU-0005ww-HR
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 08:37:42 -0500
Received: by mail-wr1-x42a.google.com with SMTP id bt28so1086914wrb.8
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 05:37:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7M5SNYFC/rg/ubCrcAqmRRXXQUQtFaJdRRBW62gvGfY=;
 b=Bk/O7lBsE/P79xjmH6fwKsPHmMmpM/XgLg5QL+X9G7+Y+GJ1a1aC2BywFaIIFY3zph
 XVxyTzj4xyvVxU2U/b/q6ken6Mvg48MYwXkRLmP8xyBfABRNtbrV6RqqNeT9fDKGaZgM
 oz4Ta7nBMDUD9nCnAj9ridB1QkyyitQs1iHvOwas8eY9RqTte9toFXyfwlNCl8dhv8Ys
 x0kKJPj+g36g5WoBOhl5BXRqz/+bt7/S5H6BrTnd6jrDIaIMrruNhudK+CDtoMh8Px+0
 YkaacnXZo5t8ijN/1VDDFUDr9b1W03rjUGU0wJ5DapGSe20J+1tg6MoxAo7CTZzL5oTx
 sH+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=7M5SNYFC/rg/ubCrcAqmRRXXQUQtFaJdRRBW62gvGfY=;
 b=K7Vb/7k/RPcdGZqSFvsdvcjnfbV2AU/+bQsn1R/HjOPtrOyUuQ3kl8rxtfroh6NB7K
 wYIaDTRT/EW+aSavQiA+XlEx5IrxHmrjQ9CmWwTMHXCUpgep+1q+1VHQ3mrgM9dyZuqj
 sGUHQKCfKCxSdopF5GNRtHiQ4YIGVaHWcOc353b0/ZzkJmylmHa9cG6htN9ahvec1slP
 ZtVSJ/JK/J81NqPmZl8CPd30H2YFHRKXIi4+s054J1Mkao8OCFcLhf11myo1iaeyJoXL
 eOS1DhlY1RzTd2KksB9/o18fu6Mmpn+vCb+VQxV8XitlVuE3+IJNwaIOJ93nqjvKtk4O
 d5WA==
X-Gm-Message-State: AO0yUKXsZjFluksT2DWlgLn24DQad8mS/SVS6/e0QzjBUHhxfRyqAqdw
 GbX6czdMMlO2VWBeiMipKBqFvg==
X-Google-Smtp-Source: AK7set+0Z1ywU4WOer3OHTzjEv1U6jK6ihTDGgFu+9kUt+Gs7q3vUTPiGvufawK5q4or3DHB0XszLw==
X-Received: by 2002:adf:f883:0:b0:2c7:3f9:7053 with SMTP id
 u3-20020adff883000000b002c703f97053mr5399755wrp.52.1677073058027; 
 Wed, 22 Feb 2023 05:37:38 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 i8-20020a5d5228000000b002c70851bfcasm2792218wra.28.2023.02.22.05.37.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 05:37:37 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4902B1FFB7;
 Wed, 22 Feb 2023 13:37:37 +0000 (GMT)
References: <20230222110104.3996971-1-alex.bennee@linaro.org>
 <df642e1c-3c74-5cfc-b1bb-091dfe147fc2@linaro.org>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Peter Maydell
 <peter.maydell@linaro.org>
Subject: Re: [RFC PATCH] target/arm: properly document FEAT_CRC32
Date: Wed, 22 Feb 2023 13:37:09 +0000
In-reply-to: <df642e1c-3c74-5cfc-b1bb-091dfe147fc2@linaro.org>
Message-ID: <871qmhrfby.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> On 22/2/23 12:01, Alex Benn=C3=A9e wrote:
>> This is a mandatory feature for Armv8.1 architectures but we don't
>> state the feature clearly in our emulation list.
>
> Split in 2 patches?

Its all pretty much a NOP aside from the comments. I split the isar code
just to check my working.

>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>
>> While checking verify
>> our cortex-a76 model matches up with the current TRM by breaking out
>> the long form isar into a more modern readable FIELD_DP code.
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>   docs/system/arm/emulation.rst |  1 +
>>   target/arm/cpu64.c            | 29 ++++++++++++++++++++++++++---
>>   target/arm/cpu_tcg.c          |  2 +-
>>   3 files changed, 28 insertions(+), 4 deletions(-)


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

