Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A72E61F805
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 16:55:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1os4Rg-0007dV-Uq; Mon, 07 Nov 2022 10:53:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1os4Rf-0007dD-O2
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 10:53:55 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1os4Re-0003tx-1S
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 10:53:55 -0500
Received: by mail-wr1-x42d.google.com with SMTP id a14so16883029wru.5
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 07:53:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=II7c2jrqx7KbWlYzrn+fLbqohcEO5c3Z24Bf5+33nyE=;
 b=x8VmXu38wF/xlUMbmDEU+k+MYjB4HauU3SOVdA5R1IZgXCcYmTjaw7VNVv8/6dLIEa
 yiTzT4IY96TDYLLTQ1rl49oR4pFaHzHEwrj54bCJA05412ubsBopIwGjFCwRQGaI5HH1
 rK1IEHxhzcug0V92oBRALXKv6VtQsHLuKZpsrQRac24mt+CEWugx9iWRzgxV9ZeJDZAd
 UluGIje1x856B8Jq8AgAjv06ae79r5CVa8ew8UTR+3wECalny+fxdx+JVM32ekR7eVz8
 Hbapz3w2dxLsSzUUHmmkKuAmV0vBUHhmB2bkPv1peBxuq4FQeIlf+z6qruPKe50q8EJi
 xqZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=II7c2jrqx7KbWlYzrn+fLbqohcEO5c3Z24Bf5+33nyE=;
 b=1Pdud0A5KFoep46el9PPnaYIYCV9YOMpZRflB5J3k9NwYz2W746i0TM5A1wrZYKCvE
 IFvvhApWI9u5Ao/U+HSsNDm7QJ50rtm9yXrAn0XUK/RkgD+2BkQFr5jdojbaUagqNilg
 SqKm25UN+onxLYWO2mrTEKprCt1RI2B7FAT1D4aHelrI85+iufwCJjjemSZSRsKuTYMa
 6mo0E/rDxJnUA2mex3+f8l4KQBWMhqkz9VMF8sz4MYV2Gf9vkZsPNmkvV78p2vi+FHQz
 0Q9dTYCEbMBrubq0kJstp7p7bkcF2X63oB6MeUEgHm8U5eILRwreYQoB3JtcdNiFnrI8
 7vhQ==
X-Gm-Message-State: ACrzQf0KDYez9DWdrWtXU7FX3A7jKs6f9MWTXNv4cT2BQZL+z3i4KP3y
 MsjlV3/+kc/+7xNLAf6owU1U4g==
X-Google-Smtp-Source: AMsMyM7Vf0fVjGb9wyzTsVd7ZLx3s48WS2jtyTA0IW/ksAZ2UpcKGAagpAWa2d3VUnSiinelU8/rCw==
X-Received: by 2002:adf:ff90:0:b0:236:cb5d:4824 with SMTP id
 j16-20020adfff90000000b00236cb5d4824mr27484252wrr.718.1667836432596; 
 Mon, 07 Nov 2022 07:53:52 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 bx11-20020a5d5b0b000000b0023677e1157fsm7726125wrb.56.2022.11.07.07.53.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 07:53:52 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 73EC61FFB7;
 Mon,  7 Nov 2022 15:53:51 +0000 (GMT)
References: <20221107130217.2243815-1-sunilvl@ventanamicro.com>
 <CAFEAcA8X3Q7s6qZ=ojE9fTLG464rrZw+FX=4hmMOhwR-Q4n2sA@mail.gmail.com>
 <Y2kRWNnk7wDxPnBK@sunil-laptop>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Alistair Francis <alistair.francis@wdc.com>, Bin
 Meng <bin.meng@windriver.com>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH V2] hw/riscv: virt: Remove size restriction for pflash
Date: Mon, 07 Nov 2022 15:50:44 +0000
In-reply-to: <Y2kRWNnk7wDxPnBK@sunil-laptop>
Message-ID: <871qqehib4.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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


Sunil V L <sunilvl@ventanamicro.com> writes:

> On Mon, Nov 07, 2022 at 01:06:38PM +0000, Peter Maydell wrote:
>> On Mon, 7 Nov 2022 at 13:03, Sunil V L <sunilvl@ventanamicro.com> wrote:
>> >
>> > The pflash implementation currently assumes fixed size of the
>> > backend storage. Due to this, the backend storage file needs to be
>> > exactly of size 32M. Otherwise, there will be an error like below.
>> >
>> > "device requires 33554432 bytes, block backend provides 4194304 bytes"
>> >
>> > Fix this issue by using the actual size of the backing store.
>> >
>> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
>> > ---
>>=20
>> Do you really want the flash device size presented to the guest
>> to be variable depending on what the user passed as a block backend?
>> I don't think this is how we handle flash devices on other boards...
>>=20
>
> Hi Peter,
>
> x86 appears to support variable flash but arm doesn't. What is
> the reason for not supporting variable size flash in arm?

If I recall from the last time we went around this is was the question
of what you should pad it with.

  https://patchew.org/QEMU/20190307093723.655-1-armbru@redhat.com/201903070=
93723.655-3-armbru@redhat.com/

>
> Thanks
> Sunil


--=20
Alex Benn=C3=A9e

