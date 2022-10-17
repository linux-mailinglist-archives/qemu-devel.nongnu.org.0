Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 185B8600CC4
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 12:45:09 +0200 (CEST)
Received: from localhost ([::1]:34176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okNcJ-000352-4w
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 06:45:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1okNaG-0008MA-6S
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 06:43:00 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:40828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1okNaE-0006A0-Ee
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 06:42:59 -0400
Received: by mail-wr1-x42a.google.com with SMTP id w18so17805986wro.7
 for <qemu-devel@nongnu.org>; Mon, 17 Oct 2022 03:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LT8nTGwc8zUU3meQJOiLzzYVXzXetMNkWh++Zu52sRE=;
 b=LfN9nz008fRIToP5aSFA3HeWR0biyHRI063Z982oA/GEAzVr3WG4wtZIdP3K4inPv9
 BoHZrKFNGEQnbNgaa3ECNVrkqPaBGkHDzdSaNu5IxY74z6OyMnLEkig9LFbqOKtjNOX2
 cTAgcP2KkE522iOyqq5y3gsIGY5lkT6PirnJ5tXDAAOpLxt82rlmCwGu5wZIrDaL1zOa
 GhAgAk/n2FzMuFaU8A7iNlRyns6iM0TlqW3raCd76zGXQjBLYkfmwKONkhRcJq8CerIG
 YA2evjFsZWBqPeMl64l1IlEYRlKzLAVC62SP2kc5xhTi/unx7zfSh0tmaUL6QUBrMLeP
 MulQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=LT8nTGwc8zUU3meQJOiLzzYVXzXetMNkWh++Zu52sRE=;
 b=LRwc+nuJKL+8rguqFPCQvyFW3Wu3EBElE0CfgwdjqsVog9As7H53T4vdi4tLZ/+AeI
 WEETuWDaMtbDEkmoZ82Vje81UdLfCfoqt6h21RNyKLUC//79sA5FzoH1r3njdejPUG0a
 Snmc3W6h6zJmF8PEMaBpzX6WG2PZRL+F6OOSG2Bp15vMr28cUNydebUnY4O72nOQ3+kg
 dHptf9XAX2DgPCKtFOdYcEJGRnPbU6qhz14RKFyBz38JPJ7ptCiOHu7jmG4yFiMRA1/g
 KLSYNDpbRJEBI1xUttD8oTBAydYVOeFfjQMuyE7jV2IYOCU3/BTTWX6GNydstBDlSgaD
 /Vyg==
X-Gm-Message-State: ACrzQf2Olg0LBC77DmGGZVmV1dOhKXAPgsMV0oT+ht7Gv81VNjdT8ADS
 uO3Sdxxe7wI9NF9ZzSJzcctEfA==
X-Google-Smtp-Source: AMsMyM5E3iwUkethO3PdmDXlmwvpqiMTLvTzP3TeLP45L63R6xn8X17wno4RLwW/uRl8eQ6uEsMqkg==
X-Received: by 2002:a5d:52d0:0:b0:21e:4923:fa09 with SMTP id
 r16-20020a5d52d0000000b0021e4923fa09mr5986765wrv.244.1666003376826; 
 Mon, 17 Oct 2022 03:42:56 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 bg38-20020a05600c3ca600b003c6c182bef9sm19164321wmb.36.2022.10.17.03.42.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 03:42:56 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CC6E11FFB7;
 Mon, 17 Oct 2022 11:42:55 +0100 (BST)
References: <4672400c-0084-3bf3-a596-7a42115301f0@linux.alibaba.com>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, Richard Henderson
 <richard.henderson@linaro.org>, Alistair Francis
 <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org
Subject: Re: Question about TCG backend correctness
Date: Mon, 17 Oct 2022 11:30:51 +0100
In-reply-to: <4672400c-0084-3bf3-a596-7a42115301f0@linux.alibaba.com>
Message-ID: <87lepeeno0.fsf@linaro.org>
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


LIU Zhiwei <zhiwei_liu@linux.alibaba.com> writes:

> Hi folks,
>
> =C2=A0=C2=A0=C2=A0 For TCG front end, we can test it with tools, such as =
RISU. But I
> don't know if=C2=A0 there are some tools that can help
> to verify the correctness of a TCG backend.
>
> =C2=A0=C2=A0=C2=A0 Can someone share the tools or the experience to debug=
 RISC-V
> backend?=C2=A0 Thanks very much.

It's mostly down to inspection or debugging failures. Sometimes you can
attempt to shake out bugs by running a stacked QEMU. e.g.

   qemu-system-aarch64 on x86 host
   qemu-system-aarch64 on qemu-system-riscv64 on x86 host

and see if the two aarch64 guests run the same. This of course gets very
tricky running full OS kernels because as soon as time and async
interrupts get involved you will get divergence anyway. This would work
best with simple straight line test cases (e.g. check-tcg test cases).

I've long wanted to have the ability to have TCG unit tests where a
virtual processor could be defined for the purpose of directly
exercising TCG. This would be mainly to check tcg_optimize() works
correctly but no doubt could be extended to verify the eventual backend
output. The problem with implementing such an approach has been the
amount of boilerplate needed to define a simple frontend. Maybe this
will get simpler as we slowly move to a single binary build but there is
still quite of lot of things TCG needs to know about the guest it is
emulating.

If you would like to attempt improve the testing situation for TCG and its
backend I'm fully supportive.

--=20
Alex Benn=C3=A9e

