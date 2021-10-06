Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 010FA4242BF
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 18:33:54 +0200 (CEST)
Received: from localhost ([::1]:52240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY9rc-0008Rp-DB
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 12:33:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mY92y-00060x-04
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 11:41:33 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:38677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mY92w-0002Pl-5x
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 11:41:31 -0400
Received: by mail-wr1-x436.google.com with SMTP id u18so10170765wrg.5
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 08:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=h/Lqj065YfqKwbujctIvu5yd/z5N/fbVnCvI/nNpLQI=;
 b=g6HKbsEsRvnSb7PBEAOZrKyImXVWJVNuE9ikkQJE6BK2sJL+H/T5mmnerc3M4RV1TU
 b3mMOarx9yQEt8qvnPguNC8OPMuOhY2OXeeeeimxT8aueAw4SERlKQq8X+wL74eplCoA
 vcdxXXoyqWa2WGH4LBvGFLO8Ols4nWjcCUSNzLAOROjyvx4zZ9QgC7y8cGhMrw8eeOTz
 78OMOvH+CncEvLZCrpSea6KfBtvyz0TxQH3QxwEYjOgU3isIbdPof4+NkHRZI5vaCq2b
 o4D9wTf3PWJl32fvfVUiNOv9eYh4ewfP3Sx9JwC66qTk9p3LluNh2yI4v7nAb1/9Y1pO
 Y+CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=h/Lqj065YfqKwbujctIvu5yd/z5N/fbVnCvI/nNpLQI=;
 b=U7TS5xaN8EyaW0w6SAaAWOYbYiBZC0GeNxC86FdILsDRTxcKlzNr0NMW+tkdNPMI3B
 1CGKlaXvSq0HhzfaVsGa0NKRQmNqTlr1shegJuSgVoheTk3r/++wO0Ss/T6eqfTLRcZI
 G7xxzxHzLx063o6Mb5by5g5A2QMcKhebx1PazR5PbO7KruuAN5IsRBLXnBg2vMqdxOEw
 tskTTvdTNrvWtHNmlRKVz0cux2lgakjy2VsgEqdxmoEotdp2gsh9uH8BMFiq1Zpa7Dyq
 XyZqOM7wGWap6J/V5QyOqK1vgnCL3deE7tseR6uHTk33pznA2+Xw7fFxqZMdIflmDFRk
 ZdpA==
X-Gm-Message-State: AOAM530e/Nzm1tyZ4xmU8AzrRkjiD23vZphpNJLMv6cm7oisTykDLcOm
 GrCra13wnc5rGj65nH0RWSb7bw==
X-Google-Smtp-Source: ABdhPJxn6jy0KKB0D0uheFqhsU7QZXiZvmA1Qyr5VpcTvOKoi6B1l1YHC1kES5wXZbHj0+xYV1TXag==
X-Received: by 2002:a05:6000:1446:: with SMTP id
 v6mr30280811wrx.427.1633534888571; 
 Wed, 06 Oct 2021 08:41:28 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s186sm6550554wme.14.2021.10.06.08.41.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 08:41:27 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0352C1FF96;
 Wed,  6 Oct 2021 16:41:27 +0100 (BST)
References: <20211006113707.96907-1-damien.hedde@greensocs.com>
 <03e1e2d6-d974-272b-9d25-805914ec0026@redhat.com>
 <4fd0ab8a-7edb-a855-09ce-312ab2057325@greensocs.com>
User-agent: mu4e 1.7.0; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Damien Hedde <damien.hedde@greensocs.com>
Subject: Re: [PATCH] generic-loader: remove the ram_size limit when a
 loading binary file
Date: Wed, 06 Oct 2021 16:40:32 +0100
In-reply-to: <4fd0ab8a-7edb-a855-09ce-312ab2057325@greensocs.com>
Message-ID: <871r4yf9eh.fsf@linaro.org>
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
Cc: Alistair Francis <alistair@alistair23.me>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Damien Hedde <damien.hedde@greensocs.com> writes:

> On 10/6/21 13:49, Philippe Mathieu-Daud=C3=A9 wrote:
>> On 10/6/21 13:37, Damien Hedde wrote:
>>> Right now, we cannot load some binary file if it is bigger than the
>>> machine's ram size. This limitation only occurs when loading a
>>> binary file: we can load a corresponding elf file without this
>>> limitation.
>>>
>>> This is an issue for machines that have small ram or do not use the
>>> ram_size feature at all.
>>>
>>> Also get rid of "hw/boards.h" include, since we needed it only
>>> to access `current_machine`.
>>>
>>> Fixes: e481a1f63c9 ("generic-loader: Add a generic loader")
>>> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
>>> ---
>>>
>>> Hi Alistair,
>>>
>>> I found this while experimenting with a ram_size=3D0 machine.
>
>
>
>> Where are you loading your file?
>>=20
>
> In a rom.
>
> The loader does not check at all that we are loading to the machine's
> ram. It just check the size for the raw binary file format.

It does beg the question of why you don't just construct your ROM file
with the image in place there? Is this just a development convenience?

--=20
Alex Benn=C3=A9e

