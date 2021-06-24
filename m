Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA32B3B373E
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 21:48:20 +0200 (CEST)
Received: from localhost ([::1]:35250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwVKl-00088b-Am
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 15:48:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lwVIP-0006nL-0X
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 15:45:53 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:39767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lwVIM-00038t-1L
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 15:45:52 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso6994299wmh.4
 for <qemu-devel@nongnu.org>; Thu, 24 Jun 2021 12:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=5qH7XFl49QrQVskZctb1dXUUlNvVRJyRAimPdOA1z0U=;
 b=dGgGM8xKaB3arnrWwqkewq7QFKDOGd1HKwL4J1e72wxy6dwN59cOMLeXQvKzjDtE5b
 mdYlow7eS1uYqi+fFaB9fFvzT7K0ERK3t3ticNnUg3HYugeElerE8cOEyHWyvV2pRYc7
 32hA/dohYXM7siIYidFOXmQ5FqU+at66LlObdtsY0//XW6kOUWCRzgMCz7Nu44Q/Y6/I
 aOK/Fut+al/r8BOcuN7bWAcSLCKRVzlvgp82Z/IG4nP9+fIizyVAyE3cWWzUQXrEvfdC
 AWw+a576ouy0w9JqV3otdZQ6fsASPFoFP7AUwSrBim3AmTrVJ9jGgDhgOEEBFmCJxNtx
 6wSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=5qH7XFl49QrQVskZctb1dXUUlNvVRJyRAimPdOA1z0U=;
 b=pxp4UJP+CjGhmiGF/RdzwEXAmkgR/dcb7YmCHidxFFJpsKliHceWWWjW91DeLH8DRO
 Zl/3Pi7fRglhOaAbKMwgeiwLosSSL6AoAksxNaldmuDhjs71t8WiPvuIAHdvWNAvirxr
 ZNRTy7aBKrkELaBEEWw75RW5hARK2UH7zquKBlu5uFL6H8W1quinrE93EtiLlAeHkV6S
 gjoZa/XfsWLLLhEkeFYK4CFNR1icmTthaB02+YxNHWHIaVWzSmH6o3lKxiJLeP+W+Drx
 bRZzv86le0St98YDs3ls56HxVFbZ1HP3xG86alhF1eqJu05leXQkNAbSjLI+UO8Refie
 SczA==
X-Gm-Message-State: AOAM5336GmdZNAGu+DXeeXNNFBwiep+80/j8+umKpbooP+gSn8+cFxpR
 c90lLMHW0C3+QDSfqrJFDxhzOQ==
X-Google-Smtp-Source: ABdhPJyC3FgqOuiuRGU2HMQ8LvjfX5Yg1DUsxOf9CKadnN9YpE4LfiUi/G5AoOrTRaedzynq3eAqJg==
X-Received: by 2002:a05:600c:28d:: with SMTP id
 13mr6308324wmk.79.1624563948118; 
 Thu, 24 Jun 2021 12:45:48 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q5sm4295339wmc.0.2021.06.24.12.45.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 12:45:46 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D7E6A1FF7E;
 Thu, 24 Jun 2021 20:45:45 +0100 (BST)
References: <o1Yk83q9b8fPEPYKowd-FS7TM3GAByNtQScLqBwokjniIxwBv-rLo3gQU5MAjLDZGJn9hOGiPudeSXvp3TS-QxouCtlVqHbsnGqXf8dKs_k=@protonmail.com>
 <6c51799c-6882-c459-0996-325c58de87fd@amsat.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: Difficulties to access guest memory in TCG plugins
Date: Thu, 24 Jun 2021 20:41:25 +0100
In-reply-to: <6c51799c-6882-c459-0996-325c58de87fd@amsat.org>
Message-ID: <87zgvfqc5y.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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
Cc: Kevin Mambu <kev.mambu@protonmail.com>, qemu-devel <qemu-devel@nongnu.org>,
 "qemu-discuss@nongnu.org" <qemu-discuss@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> Cc'ing the maintainer: Alex.
>
> On 6/23/21 5:08 PM, Kevin Mambu wrote:
>> Hi, everyone,
>> I need to put in place a plugin which is able to modify memory for a
>> specific project, and until now I managed to do so using
>> cpu_memory_rw_debug().

Out of interest what is your use-case for this? The project has very
deliberately avoided adding such an API for writing memory for plugins
to avoid people attempting to bypass the GPL by doing things in plugins.

>> However, the function happens to fail at times, and when looking at the
>> source code of cpu_memory_rw_debug() on elixir, the issue seems to be
>> either the memory being locked by another part of QEMU code or some kind
>> of page fault.
>> My prior researches tend to put the blame on the RCU lock mechanism, and
>> I was wondering if there was another, fail-safe, function I could use to
>> access guest memory from my plug-in ?

I'm not surprised. If you look at tlb_plugin_lookup you'll see the
existing introspection code has to jump through some hoops to avoid race
conditions that can cause updates to the internal TLB status. If we
wanted to support reading values from memory that's probably doable -
but for writing it would be hard to do in an idempotent way.

>>=20
>> Thank you in advance,
>>=20
>> *K=C3=A9vin Mambu*
>> Sent with ProtonMail <https://protonmail.com/> Secure Email.
>>=20


--=20
Alex Benn=C3=A9e

