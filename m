Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD98415008
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 20:40:43 +0200 (CEST)
Received: from localhost ([::1]:44556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT7Ag-0007O0-VY
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 14:40:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mT6Dd-0007U3-Ir
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 13:39:45 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:43794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mT6Db-0006Yz-TX
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 13:39:41 -0400
Received: by mail-wr1-x42b.google.com with SMTP id w17so9146245wrv.10
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 10:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=SiVCWFbjAZnm+HVY9wtCo1osYgGZbEUYn3kUbaMGj8U=;
 b=osI9mOjlZR5dO7jZJrZkBNGDPdwbPv/G2NeFyLL9gYuc9iGf1tFLGaWj1vd2nLeCc1
 pte0xRUks1nhmXaymWklmJdqCIogh5vIrDjmZ5EsThD/I/lIvtQHcfvub+F7VPzK8HtK
 1HNqCwgbUS/aET5VSKKm8D4om2Jl00JYhbgFqk9poU+ro7edXiR/o79hP1UTI3HAnk5/
 b7ZjL/kUBOdBHHlKzzMzEh/mwuuJhUCcqQa9S/WoGnpNTagcwAWfoIoNQ7YU7uOGLow5
 zJww8Tbfzg0mEFz2cTPQaLls37sUMEStJlHxO2m/sNfN9oaQwclvI3UYfyjvvQlt/jgt
 yxkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=SiVCWFbjAZnm+HVY9wtCo1osYgGZbEUYn3kUbaMGj8U=;
 b=p84vjEYGv68hKYv6EvYW7TPS9OmuBJCtkZRidqfwWoLO3hjbH/4KEFxF2eYLhgSz9h
 21RfZJhXBxsnOZj3/h+iA2Ogk1fijXpnTuuXiG/txupkQA5HIxItrqNfHy5N3tsNlRWg
 dENEtttHms5zPoI8FM1N983aLM2OfpyfpdC4orX1d4kqvFgi0nJpROoWBuXtnI7xosUa
 UqMBJEl2HYoEZKFPmugFg2B+Hr7it/vM8k87Rs9/4G7QS6E12Szl29F1j8sQqO+nvk20
 OQR4EUuedtlmhDwbtjAcv6B0iomB95D9XNGLAU2jndX88tQ8hiT0nTxXYmwHFPPpZ0kY
 6y8A==
X-Gm-Message-State: AOAM5313zAMAfczL6ArnReNEuFQjbpNIaARRma6TCu9gdPHkaoUImBp9
 KHJhu4fQBAAVN0ARw6bqdzvDdg==
X-Google-Smtp-Source: ABdhPJyWPMfUrd8uaPkyjm2WKq7esq2L9EYpL+2jGPqvqOVmDnDtcbqNyMI1SJmRj4M2WI5UkhvgPQ==
X-Received: by 2002:adf:f084:: with SMTP id n4mr210560wro.362.1632332378307;
 Wed, 22 Sep 2021 10:39:38 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 10sm6231116wmi.1.2021.09.22.10.39.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Sep 2021 10:39:37 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E4CBC1FF96;
 Wed, 22 Sep 2021 18:39:36 +0100 (BST)
References: <CAK7rcp9HjoCVbFmT9rwAteAVdCCMgobt1jvCLuhL3CCBKJZSsA@mail.gmail.com>
 <87a6k4op6n.fsf@linaro.org>
 <CAK7rcp_gSO+eCWOPBSbEEB3GMhj7aXrkK166eYxrUr1Yj8HKkg@mail.gmail.com>
User-agent: mu4e 1.7.0; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Kenneth Adam Miller <kennethadammiller@gmail.com>
Subject: Re: Change TCG cache size?
Date: Wed, 22 Sep 2021 18:32:12 +0100
In-reply-to: <CAK7rcp_gSO+eCWOPBSbEEB3GMhj7aXrkK166eYxrUr1Yj8HKkg@mail.gmail.com>
Message-ID: <875yuso6g7.fsf@linaro.org>
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Kenneth Adam Miller <kennethadammiller@gmail.com> writes:

> Well, maybe I'm understanding that wrong. I am talking the cache that the=
 tcg keeps of translated code. If I got that variable wrong then
> please let me know.

TB_JMP_CACHE_SIZE is used to keep a lookup of address to  translated
blocks (TBs). This is used to find the next TB on a computed jump
without doing a full lookup in the QHT hash.

The total size of the translation cache is tb-size in MBs (as in -accel
tcg,tb-size=3D1024). We have some heuristics to guess at a size (see
DEFAULT_CODE_GEN_BUFFER_SIZE in tcg/region.c) but you are free to
specify your own.

> But I want to make sure that that is large enough to keep from having
> to run TCG again. How can I do that?

Specifying a large tb-size will reduce the churn caused by running out
of translation cache but you will never be able to eliminate it
entirely. There are a number of places where tb_flush() has to get
called and that will require stuff to get re-translated. Also the
translator partitions the regions up per-CPU (for softmmu) so if one
vCPU is responsible for all code generation it will run out sooner.

You can observe the total number of flushes via the HMP and "info jit".
What is the behaviour your seeing? What workload is it?

>
> On Wed, Sep 22, 2021, 6:54 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>
>  Kenneth Adam Miller <kennethadammiller@gmail.com> writes:
>
>  > Hello all,
>  >
>  > I just want to ask this one question: if I change the qemu tcg cache
>  > size (TB_JMP_CACHE_SIZE), will that force any errors at run time?
>
>  Hopefully not - for both user-mode and softmmu we take some care to
>  ensure tb_jmp_cache_hash_func and tb_jmp_cache_hash_page return
>  appropriately masked values for the table lookup.
>
>  What has not been done since Emilio's work in 6f1653180f (tb-hash:
>  improve tb_jmp_cache hash function in user mode) is a deeper look at the
>  hit rate and bounce rate of the softmmu jump table hashing. Any
>  suggested changes will need some benchmarking to show what difference it
>  makes.
>
>  --=20
>  Alex Benn=C3=A9e


--=20
Alex Benn=C3=A9e

