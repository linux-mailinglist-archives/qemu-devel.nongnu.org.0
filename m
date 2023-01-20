Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9AA6752CE
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 11:53:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIp0i-0007HG-Pl; Fri, 20 Jan 2023 05:52:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pIp0g-0007H3-LI
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 05:52:38 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pIp0e-0005gO-Su
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 05:52:38 -0500
Received: by mail-wr1-x436.google.com with SMTP id h16so4455049wrz.12
 for <qemu-devel@nongnu.org>; Fri, 20 Jan 2023 02:52:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T7ev5gQNxaBMHR64ExWJ0wyAeFm/sn1Z0OvG9w5tTBg=;
 b=xAybjWPat31CyumUC3F7nQuOh3imwaDUBkRFjAjVtBboQQfcI+DsXHsLgm6UMq/to5
 JfJ99w8JhZOyc9yIKfCEjPya5aSZe7WHoMjmirmFXGnYXwOeVdWXQT9ofEACzuR4XILR
 wwLcGIZ1UL5OxKJoVweUOwJAGN8KnWbwK5rCMneyXnfd/I9IlHx4YShl7eOvKYuIQN4L
 q0X0xwr73Iep3QmMPCGcK3c8S8Lf5yAgwQVaWrxnaxjFOau1mucunzCvEQJpgsA7//uo
 lGJ8ffK5cCKFO8et+MsRRPjilx6TWoMAGdTfZnnJHg9q5qiF362357bQ50zTPEsP6oLC
 dMww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=T7ev5gQNxaBMHR64ExWJ0wyAeFm/sn1Z0OvG9w5tTBg=;
 b=RhmNvxL9/1NbhUowE1AfQB4UKXZlQHxkMJx5KQiBEK9x4s2CKpCTnqEZoICwJOObjj
 1XkKecK9K9vKl0SCNEJBa299t9mDdF0ky7zaNbP01mI8hf10QaW6mL/TSqShlZaQqZjO
 K/AsCeDpeHJG9NV4IebF7w8uicFBWowLx1qDlVvtqnKSLK4cDIMNUQQcsxwaDSykgT3k
 YAe9cWpOU8GtOon1zXjDlP0nn/EwIzO6PlNUDCCMQB7XYC4PvP1T/J1cfGXHqq70D3sH
 BCq00nfxA8IDIlBmBkMW44WCrUguy0fSyWZCSM1lwce5N6/mFdqRyQWKGQP2ppXyJbo8
 QB0g==
X-Gm-Message-State: AFqh2kr9jo9Kembel6+r8KkQ9dFy/RIzKjXQ0Gh/621F/ZYYG2cHY/jk
 7w9CLJcBJkmlp8k1xIwMhH7dwg==
X-Google-Smtp-Source: AMrXdXvKEFB/Gl1EB4qCRxaMHJeiFwCKXC45xyEZ87+8EN/ddcZcOekBABNqRv/ZB6XWGsDPEIGhNw==
X-Received: by 2002:adf:d082:0:b0:2bc:46e7:6f10 with SMTP id
 y2-20020adfd082000000b002bc46e76f10mr7254288wrh.17.1674211954647; 
 Fri, 20 Jan 2023 02:52:34 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 w4-20020adfee44000000b0029100e8dedasm35550114wro.28.2023.01.20.02.52.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 02:52:34 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8A67D1FFB7;
 Fri, 20 Jan 2023 10:52:32 +0000 (GMT)
References: <20230116223637.3512814-1-richard.henderson@linaro.org>
 <2c1eb92b-91f8-34d5-c5f7-a56a41ec807b@redhat.com>
User-agent: mu4e 1.9.15; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Ilya Leoshkevich
 <iii@linux.ibm.com>, peter.maydell@linaro.org, qemu-devel@nongnu.org
Subject: Re: [PULL 0/5] tcg patch queue
Date: Fri, 20 Jan 2023 10:50:42 +0000
In-reply-to: <2c1eb92b-91f8-34d5-c5f7-a56a41ec807b@redhat.com>
Message-ID: <873585xytr.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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


Thomas Huth <thuth@redhat.com> writes:

> On 16/01/2023 23.36, Richard Henderson wrote:
>> The following changes since commit fb7e7990342e59cf67dbd895c1a1e3fb1741d=
f7a:
>>    tests/qtest/qom-test: Do not print tested properties by default
>> (2023-01-16 15:00:57 +0000)
>> are available in the Git repository at:
>>    https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20230116
>> for you to fetch changes up to
>> 61710a7e23a63546da0071ea32adb96476fa5d07:
>>    accel/tcg: Split out cpu_exec_{setjmp,loop} (2023-01-16 10:14:12
>> -1000)
>> ----------------------------------------------------------------
>> - Reorg cpu_tb_exec around setjmp.
>> - Use __attribute__((target)) for buffer_is_zero.
>> - Add perfmap and jitdump for perf support.
>> ----------------------------------------------------------------
>> Ilya Leoshkevich (3):
>>        linux-user: Clean up when exiting due to a signal
>>        accel/tcg: Add debuginfo support
>>        tcg: add perfmap and jitdump
>> Richard Henderson (2):
>>        util/bufferiszero: Use __attribute__((target)) for avx2/avx512
>>        accel/tcg: Split out cpu_exec_{setjmp,loop}
>
>  Hi Richard, hi Ilya,
>
> with the recent QEMU master branch (commit 701ed34), I'm now seeing
> failures in Travis:
>
>  https://app.travis-ci.com/github/huth/qemu/jobs/593786529#L14411
>
> Everything was still fine a couple of days ago (commit fb7e799):
>
>  https://app.travis-ci.com/github/huth/qemu/builds/259755664
>
> ... so it seems this is likely related to this pull request. Could you
> please have a look?

Hmm maybe the code motion has revealed another form of the compiler bug.
I guess these bugs don't die, they just refract.

>
>  Thanks,
>   Thomas


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

