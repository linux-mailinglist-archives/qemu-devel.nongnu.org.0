Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 920986CAF09
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 21:44:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgsk7-0006YS-N3; Mon, 27 Mar 2023 15:42:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pgsk0-0006YF-76
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 15:42:52 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pgsjx-0006pu-Tn
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 15:42:51 -0400
Received: by mail-wr1-x42b.google.com with SMTP id r29so9918835wra.13
 for <qemu-devel@nongnu.org>; Mon, 27 Mar 2023 12:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679946168;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SsJrw1Ev8+Z+e7IfxGBZJXD4HdcHz0bC1RQZrHTmpRs=;
 b=y7g4Bw4/IJqvLa1oqmz4xKEEw9PE1Il/F4ZjyPBgycu0FqFF3raRmaSTOXq1//bdGy
 56KONGW9BBT2oE0725dyRKotLN2pi+xEqgdnoayicySW9vBJk/RBXg9t2dYrXLcAqxWR
 7PbLVbgrZPE32dwgL/DXyQEIeivgliUxJO8hF/B6+X6h+oGV1NPtSsdXNTvrfg0u1bA6
 c7kqDoDoXEK9YOAdBYakdVA6VJLOOCmXVUuo9Ad96IEe6ttS/BYy8BYZhV49dvCYSQro
 XDy3eTajNcRBo9UKtwDMuKIIm5P4OO2bm/iJoobtyFtraYi1dDNj7gwyeg4Zdzenlsos
 1hsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679946168;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=SsJrw1Ev8+Z+e7IfxGBZJXD4HdcHz0bC1RQZrHTmpRs=;
 b=S0H6wSCx5evpfqkE23DV7yM31fZXsLDmOV2yrZhTSJjvW98mhMm6Oxvf+O8sWgJTzh
 MiS0BY6o8rDZ2ay/o6fKb9sokkeLq5un6b6nv6klETLLfyqdu+Vz2quQP+Bkso7AHoAF
 t+EldjRPscGk9sTXnPbwkuT9vpR8f89AT4t+RGBfw3u6XDO5/URHYJ9xl7UksnhFEq/S
 tzAaSjcQW9VB/zMGE2Ea8VZYLhXTe2j8TEx5OQXLnFK4O4jR36uY/vClHmFjb+u1KDQC
 f9yp4Tb0FWi0pdM9KrM/ru93TR1VTJzJIq97V0RBb7SR+lJmPnDPtARoYz7Uz90ZZxlv
 angg==
X-Gm-Message-State: AAQBX9eTW5iBEMs96l3hp4cmpziiaHe9Qqv4Hd8SBFwPuLcXXjbBWJnE
 aPS1CWN20DUARzas2RDvqp43Mg==
X-Google-Smtp-Source: AKy350aT4MViDsJcAIKqoSotsbmBw8ubdYlsnw35p09MMKqrNgEeiLF5CwWmT7T19tTbnjq5oXb6lg==
X-Received: by 2002:adf:f947:0:b0:2db:9c64:f759 with SMTP id
 q7-20020adff947000000b002db9c64f759mr12340363wrr.1.1679946167973; 
 Mon, 27 Mar 2023 12:42:47 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 e13-20020a5d4e8d000000b002ceacff44c7sm25901247wru.83.2023.03.27.12.42.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 12:42:47 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 47F081FFB7;
 Mon, 27 Mar 2023 20:42:47 +0100 (BST)
References: <20230322150744.175010-1-richard.henderson@linaro.org>
 <20230322150744.175010-12-richard.henderson@linaro.org>
 <87zg7ysi4y.fsf@linaro.org>
 <fd714eec-2241-8c32-08d4-b2b346f611e7@linaro.org>
User-agent: mu4e 1.10.0; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: cota@braap.org, peter.maydell@linaro.org, qemu-devel@nongnu.org
Subject: Re: [PATCH for-8.0 11/11] linux-user/arm: Take more care allocating
 commpage
Date: Mon, 27 Mar 2023 20:42:26 +0100
In-reply-to: <fd714eec-2241-8c32-08d4-b2b346f611e7@linaro.org>
Message-ID: <87ilemrnew.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


Richard Henderson <richard.henderson@linaro.org> writes:

> On 3/27/23 01:38, Alex Benn=C3=A9e wrote:
>> Richard Henderson <richard.henderson@linaro.org> writes:
>>=20
>>> User setting of -R reserved_va can lead to an assertion
>>> failure in page_set_flags.  Sanity check the value of
>>> reserved_va and print an error message instead.  Do not
>>> allocate a commpage at all for m-profile cpus.
>> I see this:
>>    TEST    convd on i386
>> qemu-i386: Unable to reserve 0x100000000 bytes of virtual address space
>> at 0x8000 (File exists) for use as guest address space (check your
>> virtual memory ulimit setting, min_mmap_addr or reserve less using -R
>> option)
>> on the ubuntu aarch64 static build:
>>    https://gitlab.com/stsquad/qemu/-/jobs/4003523064
>
> Odd.  Works on aarch64.ci.qemu.org outside of the gitlab environment.

15:50:17 [alex@aarch64:~/l/q/b/ci.all.linux.static] review/tcg-queue-for-8.=
0=E2=86=931|=E2=80=A6 + head config.log
# QEMU configure log Mon 27 Mar 10:20:07 UTC 2023
# Configured with: '../../configure' '--enable-debug' '--static' '--disable=
-system' '--disable-pie' '--gdb=3D' '--skip-meson'

>
>
> r~


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

