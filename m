Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6352D675AC5
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 18:07:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIuqj-0001gN-G1; Fri, 20 Jan 2023 12:06:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pIuqd-0001fP-WA
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 12:06:40 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pIuqb-0002RX-TD
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 12:06:39 -0500
Received: by mail-wr1-x433.google.com with SMTP id d14so1736384wrr.9
 for <qemu-devel@nongnu.org>; Fri, 20 Jan 2023 09:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q7nqh2SxvZC0Mw0CPy3uoSF3S3WZxvO8ey9Cu1u1soI=;
 b=FJTjhnphpQEu7ZlzNEZOwKpQMcH+0QEkn81aAfMrcO1pIzKEhUXMduORwBDCRKVel8
 UGyZCr8UKxTw+UO/f3OZecagk0Pi3miMYAAK0+Wl9z1nFxYY7Gk0ssfkuwaVNVLocRmD
 LOcIdB8dcJSrzSjId4nQGezPeFvq6Kq8HxVZLa0S61QXHbdmrZPMXpvk6Cs99XhHX63x
 3RroI3CSw7uDlzLkdDljCHxQHJVx8DQGTm89suakgQAlMgI61LOT81vQFm38bYj8BU4h
 Sw25pMCIczGY5OeVR8ZV4jwMh/N1rPjUFp5Jo/npe+a+iEZEAOU+bFV5A5WO1eaEesTi
 LPcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=q7nqh2SxvZC0Mw0CPy3uoSF3S3WZxvO8ey9Cu1u1soI=;
 b=hoGxmJlefZsmdHWbTMM7DUzEEFsySuZ/gPVp8lNITOIZaYQmHik75Sqyc51j5wnj+t
 B3oCmctDp7Dx8MA3n5Y2A6iYAeSa/3KEwP2cPhVQKFCgXL6S5XaVw0kZivAHbHpYOByM
 41Iz0deC4Kf8SJ24/xXMEgqZtXIdBneIJeozMTXKMuvt414PKKFUJFamozyNVNGTgPKK
 0A2PIyJcm0qE0xb8xU7Q9bpkovd6GTCPUW0KmLi763iVsKjVoPRY9dLtRFK1GVK4fjwB
 OvHgY9OVBSehv5pJLIEPdygmgUuKd0XQ5wULmRaDhm+x5Jlztz/ouKaKgKbedc+V3W+e
 Q5pg==
X-Gm-Message-State: AFqh2kqUfs1KhlnTEJCE1UGOZbptgDMKXJYgIJb9PK8J1kwFJkIErVzF
 JWF+kF44m16pmn9wPfzRRSYGeg==
X-Google-Smtp-Source: AMrXdXsdlD+Zkc1B1RO1evkoSavgFlBIXcBZ4NNVEOtLGPU64oYlYdco+bAQkL7LsRjz0PVaVGlEpg==
X-Received: by 2002:a5d:4350:0:b0:2be:5366:8cdf with SMTP id
 u16-20020a5d4350000000b002be53668cdfmr3560370wrr.20.1674234395038; 
 Fri, 20 Jan 2023 09:06:35 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 i10-20020a05600011ca00b002bf94527b9esm1017238wrx.85.2023.01.20.09.06.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 09:06:34 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3E11C1FFB7;
 Fri, 20 Jan 2023 17:06:34 +0000 (GMT)
References: <20230113133923.1642627-1-alex.bennee@linaro.org>
 <20230113133923.1642627-4-alex.bennee@linaro.org>
 <CAFEAcA9tWzJgzKWQr9TOXi1NGc7Fat2xcdgJhj9Su6Hju0o7LA@mail.gmail.com>
User-agent: mu4e 1.9.15; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Alexandre Iooss <erdnaxe@crans.org>, Markus
 Armbruster <armbru@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, John G Johnson
 <john.g.johnson@oracle.com>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jagannathan Raman
 <jag.raman@oracle.com>
Subject: Re: [PATCH 3/4] semihosting: add semihosting section to the docs
Date: Fri, 20 Jan 2023 17:06:06 +0000
In-reply-to: <CAFEAcA9tWzJgzKWQr9TOXi1NGc7Fat2xcdgJhj9Su6Hju0o7LA@mail.gmail.com>
Message-ID: <87tu0lw2xx.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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


Peter Maydell <peter.maydell@linaro.org> writes:

> On Fri, 13 Jan 2023 at 13:39, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
<snip>
>> diff --git a/qemu-options.hx b/qemu-options.hx
>> index 3aa3a2f5a3..de3a368f58 100644
>> --- a/qemu-options.hx
>> +++ b/qemu-options.hx
>> @@ -4633,10 +4633,13 @@ DEF("semihosting", 0, QEMU_OPTION_semihosting,
>>      QEMU_ARCH_MIPS | QEMU_ARCH_NIOS2 | QEMU_ARCH_RISCV)
>>  SRST
>>  ``-semihosting``
>> -    Enable semihosting mode (ARM, M68K, Xtensa, MIPS, Nios II, RISC-V o=
nly).
>> +    Enable :ref:`Semihosting` mode (ARM, M68K, Xtensa, MIPS, Nios II, R=
ISC-V only).
>>
>> -    Note that this allows guest direct access to the host filesystem, so
>> -    should only be used with a trusted guest OS.
>> +    .. warning::
>> +      Note that this allows guest direct access to the host filesystem,=
 so
>> +      should only be used with a trusted guest OS.
>> +
>> +    .. _Semihosting Options:
>
> Does this render OK in the manpage version of this text ?

Seems to yes.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

