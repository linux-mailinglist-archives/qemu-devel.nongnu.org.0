Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C82A6315807
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 21:52:38 +0100 (CET)
Received: from localhost ([::1]:34674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Zzx-0001sg-SZ
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 15:52:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9Zwy-0000H4-1h
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 15:49:35 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:33792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9Zwr-0001SL-Rl
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 15:49:29 -0500
Received: by mail-wr1-x42b.google.com with SMTP id g10so23757873wrx.1
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 12:49:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=C8V1I+9L7vEv2Tps2EOF9y4VG+73pNSCbbVcEIPmE38=;
 b=BXATaGZ9Z8MUqbH3959KhBQcYauy0e9sfI2Vi7I5fxagTA+ErUqp9GZqGuHzOUq2IR
 3I2Cw73SfJyd6eOhoOggj4DXL7MPUOai+Gkly/uchepOOHjPp6wHNBU4iUcWk6EmNOig
 WGH/zn1vfpwbuOCh1vKjyzF1ensGmJScGNWEnRc8ODP1QdMAnD64Q40oLHydRBfpHWuC
 TjMJmJrc/l672x759kRtfOIXcjtmdrXLl0orhZTGZFaIyHpPsgz5pWiyD8OusuIyFhDN
 vYNilTLhy8MwGncH9Uwv5jqtWce2XCze92slHM/jz9t56pT/zUkl+AkZZYbF9IJv3kCD
 1JLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=C8V1I+9L7vEv2Tps2EOF9y4VG+73pNSCbbVcEIPmE38=;
 b=Qvef6CuxCvk43SEid7z7fRJnUNSNbZ/O0aobAsbaTsf9LZPX6hMYN5XZ7/cY9G6SO6
 BdV5/Ld0Tl7hLpiByCEiW71w6E9yJiqjesqdQglbj7PZRJp5e7LAZx2zY/sXwgeXcAsM
 QnIhjYhsDdmo8aZNC0uYvDiqgdTrJHPxLj7AxunEhCOr+FeTBUZRHKGYRUuHpRPrRJyR
 XCM2TvFQ1b00vsQyI84TlfnsKa+flHKhWtje+4E6spT01eWUy5D6MZzBvbmwACKsl6ey
 aMKLCDwWxqIeL1zl80Qzld7iPjADFpl3oRxHSL6tfppK0KR7bGq/oSup9M6q5YPGejIn
 0tPw==
X-Gm-Message-State: AOAM5321YipRT9sDMhpHzeSA3PaAaFIWMj0PFAaNoHJ3MBMg5CYOnNTN
 KX3j13TaCLi6XLT49UZJVpTE4g==
X-Google-Smtp-Source: ABdhPJyTxoQA/4XhP5vBR5+qZlQq+ZSdVIRX4f6/ld696CTspiPRWB9dSdk/JfPEg5J2DfL65CntOg==
X-Received: by 2002:adf:e4c3:: with SMTP id v3mr26082629wrm.210.1612903763801; 
 Tue, 09 Feb 2021 12:49:23 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l11sm36068133wrt.23.2021.02.09.12.49.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 12:49:22 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 881D31FF7E;
 Tue,  9 Feb 2021 20:49:21 +0000 (GMT)
References: <20210209182749.31323-1-alex.bennee@linaro.org>
 <20210209182749.31323-6-alex.bennee@linaro.org>
 <68de96f4-b3ff-d975-5055-2ba60cd8576d@linaro.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v1 05/12] tests/plugin: expand insn test to detect
 duplicate instructions
Date: Tue, 09 Feb 2021 20:48:42 +0000
In-reply-to: <68de96f4-b3ff-d975-5055-2ba60cd8576d@linaro.org>
Message-ID: <87zh0d7yr2.fsf@linaro.org>
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
Cc: kuhn.chenqun@huawei.com, aaron@os.amperecomputing.com, cota@braap.org,
 qemu-devel@nongnu.org, robhenry@microsoft.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> On 2/9/21 10:27 AM, Alex Benn=C3=A9e wrote:
>> A duplicate insn is one that is appears to be executed twice in a row.
>> This is currently possible due to -icount and cpu_io_recompile()
>> causing a re-translation of a block. On it's own this won't trigger
>> any tests though.
>>=20
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>=20
>> ---
>> [AJB: well not quite, the x86_64 test trips over this due to some
>> weirdness in the way we handle rep insns, e.g. rep movsb (%esi),
>> %es:(%edi) in the x86 bios code]
>
> Ah, but that's not tcg weirdness, that's architectural weirdness.  Multip=
le
> executions is how "rep" is supposed to work.

As the plugin can know the arch I can just disable the test for x86. At
the moment it doesn't matter because there is only a test for aarch64.

--=20
Alex Benn=C3=A9e

