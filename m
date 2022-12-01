Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9ADD63F59D
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 17:47:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0mhi-0006O6-0W; Thu, 01 Dec 2022 11:46:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p0mhg-0006Na-2F
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 11:46:28 -0500
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p0mhd-0008T5-Jb
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 11:46:27 -0500
Received: by mail-pg1-x533.google.com with SMTP id q1so2127643pgl.11
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 08:46:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KDgaa1VEMSKG1UJpI9DS8/truk/+NTWchC1ocE6yBHE=;
 b=UFaBLdT22520XsGhaET5G/cQR55i/jN0byQTAl4+QhUz51K6Ide+wetINaQfF/6Q1p
 4CFjpgv3CupWzpURwgUKAiGJha7ahCxuD62ySwnnpaTwEaKX/LcaqsYY+i90HomYPC71
 iXYei93GLMqsbRbUPmlqVVxy2fbX4Eo2vTc4Be/+7WxAeuxhKCm4bsUE5iBkUlENGBEe
 9gorS4U1DBSi82ogpxX421ZyQ5AHh5faJVjedi48X/FfW4ehQ/SdpMvSPtHFfdYnaAc0
 VXrIlfpmvBfRliFZxC3FKBO9/WIK4dy97VwrKiDeMYs8gCIB2PKlZYKhy7jatQ5XnfA7
 fXfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KDgaa1VEMSKG1UJpI9DS8/truk/+NTWchC1ocE6yBHE=;
 b=O5cs/opPtTx3648IT+geZlY0b9DUt/Lsqq6vMQldulE7z3i4o14hhnKcqSejGfgi/A
 rw7z3I9umMfScqlL38/r/iHCbBrS2qAwItRJsbTvI3I42UknZQPaF07gF/P5fzKeTmQE
 cwSAPRqvNDaL/0sa9wKmhXH6khJPBE9pUG/jEEXi26m1OHEqsZcw9SE+x160dzh4tRKY
 M1zI5Dax8Vdf7/rc4Q2cFOOROdZVMASLvbaMSKau3J/gnIR7e6cFrI9bRvZ4iyr/Pxzi
 DyQyH3EfTO0YqxiF9v9AxAVkhSl8+0uaj7JBlqcWRI0Sz/Ma1X55RSgvJa+qeHD37RRO
 MiBg==
X-Gm-Message-State: ANoB5pl2ZyY+MzpDDXNWzRVLp+C672M2N+qL7QDZ2jKuM8rVowQk1hS0
 bQiCc66lHwjjdxljx7gmUhON4848emyL0kwGiuJxXQ==
X-Google-Smtp-Source: AA0mqf6DaSKlaCUWTgVE81GZAor2BT2tAaO6pX1U0OFyBBW00kpSso/FOexCVGDZTMIwfCdaZLA+CGvhXYEj5cLMTm0=
X-Received: by 2002:a63:5146:0:b0:477:86c1:640f with SMTP id
 r6-20020a635146000000b0047786c1640fmr42163913pgl.231.1669913174818; Thu, 01
 Dec 2022 08:46:14 -0800 (PST)
MIME-Version: 1.0
References: <DS7PR12MB6309BC9133877BCC6FC419FEAC0D9@DS7PR12MB6309.namprd12.prod.outlook.com>
In-Reply-To: <DS7PR12MB6309BC9133877BCC6FC419FEAC0D9@DS7PR12MB6309.namprd12.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 1 Dec 2022 16:46:03 +0000
Message-ID: <CAFEAcA_A45cj8RA03U0jOfawZihSp6WgSoaQ7XbGzxs0hAtkOg@mail.gmail.com>
Subject: Re: [PATCH v2] target/arm: align exposed ID registers with Linux
To: Zhuojia Shen <chaosdefinition@hotmail.com>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x533.google.com
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

On Tue, 22 Nov 2022 at 23:25, Zhuojia Shen <chaosdefinition@hotmail.com> wrote:
>
> In CPUID registers exposed to userspace, some registers were missing
> and some fields were not exposed.  This patch aligns exposed ID
> registers and their fields with what the upstream kernel currently
> exposes.

Thanks; I've applied this to the target-arm-for-8.0 branch that
will become target-arm.next when 7.2 is out.

-- PMM

