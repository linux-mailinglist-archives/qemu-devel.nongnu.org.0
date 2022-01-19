Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C70AF4940C2
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 20:22:49 +0100 (CET)
Received: from localhost ([::1]:50760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAGXg-0000va-Cq
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 14:22:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nAGIN-0003S9-72
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 14:06:59 -0500
Received: from [2a00:1450:4864:20::32c] (port=35456
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nAGIL-00017Y-Ja
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 14:06:58 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 q9-20020a7bce89000000b00349e697f2fbso16547441wmj.0
 for <qemu-devel@nongnu.org>; Wed, 19 Jan 2022 11:06:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=ugEFxxdh3MSog9B7abFfH9v2hqajMEktwnAcwrmcdSM=;
 b=LwScZ3XjYgJqwALQ4iMSJprsuFJ5R/Q5nCQxqNBVqSO4Pn2/akssSO59QhPjeUTV3o
 I0qmeEE6A1Rtc27kPxr64DgxO42OUmXuRNvIGKvSIR1vRyhVB51v/MLo76I+u5MpWx2p
 QUyRZHfOAO6J4c0kedokDhe488uEBLWRxPn8m2Z6MPPvCdBxpC5iHWftkBunykWrt00M
 tcBgC+LVJ/8mzYNnrRHvNBflu7fvXDbm8H3JL+NF/bFYaPuEKH7pAsG3saNl/EoLxwwH
 7bDqb8w4ZagokM/FqTXJPYBRd5mro4jyo9PyKuMeMv4AVOyKnJWImGCb0xV/748pdQP7
 YvRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=ugEFxxdh3MSog9B7abFfH9v2hqajMEktwnAcwrmcdSM=;
 b=A6NcYrdpp2kM4dma4dyEKdYxF3OGMk5lWP1x7B3UdcKpgo+DDLV/ktJIsYRGEqtQ2g
 Pl/iD5PodKXbg2H30ZbNLhBA/2TszSsdUg0jVs/PanivCcqTtkIxWzhK6Me7RrV3AUaa
 PWlBrJFCbarSw6vY0TexiJqd+0Mm3G5bsMC9QUmmFnZ920Atv4kQXnEgmZXJ6iG7WsLc
 KyrJwB2229O6EkyifLD7zTfAhLTuFdoUZ1L2xVai/k8TOeuCsKLMCiQqmnCZYv5Sg0Y5
 NfF46f1KnrdSn9QJxuNB3V8kGUsco2EW03KC5dGNmweemlVQgfMq4pMGuLciUr/GVyE7
 IFqA==
X-Gm-Message-State: AOAM531UUEG11VyOnXaTsFbeqNJeSAnCGCM89+SSNDLQ4BsMu8FmDKtT
 OddkJuf8ReCwgGJ3wigBGrKmbA==
X-Google-Smtp-Source: ABdhPJxeA+5LPlqkKBTrt5HDGpoCJ1pvGmKmvwio6a4c7HShR/gG7V6N9HFvlKZEf3WIOH757mHomg==
X-Received: by 2002:a5d:6da6:: with SMTP id u6mr15201920wrs.563.1642619213344; 
 Wed, 19 Jan 2022 11:06:53 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m19sm455433wmq.6.2022.01.19.11.06.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 11:06:51 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 76F4B1FFB7;
 Wed, 19 Jan 2022 19:06:50 +0000 (GMT)
References: <CAK7rcp9rnggAvaDxRV4m_KcR1afmquJsR+=khKw4B1UG1+V7yw@mail.gmail.com>
User-agent: mu4e 1.7.5; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Kenneth Adam Miller <kennethadammiller@gmail.com>
Subject: Re: Cross Architecture Kernel Modules?
Date: Wed, 19 Jan 2022 19:04:26 +0000
In-reply-to: <CAK7rcp9rnggAvaDxRV4m_KcR1afmquJsR+=khKw4B1UG1+V7yw@mail.gmail.com>
Message-ID: <87czkn8rzp.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Kenneth Adam Miller <kennethadammiller@gmail.com> writes:

> Hello all,
>
> I just want to pose the following problem:=20
>
> There is a kernel module for a non-native architecture, say, arch 1. For =
performance reasons, the rest of all of the software needs to run
> natively on a different arch, arch 2. Is there any way to perhaps run mul=
tiple QEMU instances for the different architectures in such a way
> to minimize the cross architecture performance penalty? For example, I wo=
uld like the kernel module in one (non-native) QEMU instance to
> be made available, literally equivalently, in the second (native) QEMU in=
stance. Would there be any API or way to map across the QEMU
> instances so that the non native arch kernel module could be mapped to
> the native QEMU instance?

What you are describing sounds like heterogeneous system modelling which
QEMU only supports in a very limited way (all vCPUs must be the same
base architecture). You can link QEMU's together by way of shared memory
but there is no other wiring together done in that case although some
3rd party forks take this approach.

The kernel module sounds confusing - why would you have a kernel module
that wasn't the same architecture as the kernel you are running?

--=20
Alex Benn=C3=A9e

