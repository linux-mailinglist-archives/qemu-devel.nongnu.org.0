Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBB92FF4B6
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 20:38:13 +0100 (CET)
Received: from localhost ([::1]:44484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2fmW-0000CJ-5L
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 14:38:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2fRf-0003hr-RQ
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 14:16:42 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:36730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2fRd-0001Pc-GB
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 14:16:39 -0500
Received: by mail-ej1-x632.google.com with SMTP id l9so4234123ejx.3
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 11:16:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QdHA/MJxcv+v+3hhMD5u6K6M0wpqbeLEJULk+f1Futw=;
 b=tNSdOOa30w0VrZnJTp/tVsM37pAn/N19ENnONVNVSyzjhZBiU062vbstQ658GnENoC
 D+pTn9963jSvJHZ6ZTtvNNnyEx8r98LcxGdlYKnz9HERvVWgf1FE20sy0UKbQaP0UYni
 RRpzgpZMLlCXEcVvvtZFnynVQ06Uscq74tWP4m9ZCxI8V6bHZ1qY6MkPHmozTNWNRuvL
 kSv693Ne61m4dBHBi4JbYU6ArU8PTLstknfunDpCqtSjQb2OxqUfhqC20A3EPxgRHzu6
 n1YFP4JkL9zzJwL2B9371Kvs14Fmo9kuLJWSQkZyI9miIqClnp2Xst7ilxT2fW4Iv+K1
 15GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QdHA/MJxcv+v+3hhMD5u6K6M0wpqbeLEJULk+f1Futw=;
 b=oBxpeyRTIMxxfVRYOO4jC8fTUU+tDx59t+sduRCSI3gbMqpA8a0n1YruHPLPBhb3vG
 r/1CjzsFO9NdaJnhUdSJ2Ea6cisju/TTIGOoVWNCaKVqEFMo30bcJxxHk6I05/So9gbA
 PDr2bM9FqlJls4+kh5/RYENGcctFX+JG1CokgZwTGR1BGo6SRy0ftBPCB422LuzIQN8C
 47hXICccgtZfcYv7r27oFTyZCgidQ6iW8O2u6X7Qe8FOZqQde4U6qUF58ug0aHHMIZFI
 OsnKU7AurzrdNk7dKlGQa1Okyeug3Xn0/9Wn5Cu7goANTq/vTIqJJ33h6Iq1WprA+X1h
 KydQ==
X-Gm-Message-State: AOAM533CbsrB4uE2Ueyo+6y3Z3B4xzKq+c1OSYYhlGsNCEz8hcn33pqy
 1FiLs/eNOMSNKil4YTj8jnow8H8+bvYnEDjYX76OYQ==
X-Google-Smtp-Source: ABdhPJwGIw0Lr6FX7j7Rme2tPy1A5ekrwfhYyjXq5LNPTbRVWKenKlOfn8LISgqQWlG3Gc8tWjv6ShM/na1waW75CRg=
X-Received: by 2002:a17:907:1b10:: with SMTP id
 mp16mr651341ejc.482.1611256595863; 
 Thu, 21 Jan 2021 11:16:35 -0800 (PST)
MIME-Version: 1.0
References: <20210120204400.1056582-1-richard.henderson@linaro.org>
In-Reply-To: <20210120204400.1056582-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Jan 2021 19:16:24 +0000
Message-ID: <CAFEAcA-1QeBgfyuaxohshwif7jD3WMFTsRxd4NSbE9B5JtLaRw@mail.gmail.com>
Subject: Re: [PATCH v3] target/arm: Implement ID_PFR2
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
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

On Wed, 20 Jan 2021 at 20:44, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This was defined at some point before ARMv8.4, and will
> shortly be used by new processor descriptions.
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---



Applied to target-arm.next, thanks.

-- PMM

