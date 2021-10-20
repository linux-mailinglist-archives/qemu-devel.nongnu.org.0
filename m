Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C36D434FFA
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 18:17:38 +0200 (CEST)
Received: from localhost ([::1]:55306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdEHZ-0001nV-8K
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 12:17:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mdEFn-0000tC-KD
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 12:15:47 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:41750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mdEFm-0004tJ-0B
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 12:15:47 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 d198-20020a1c1dcf000000b00322f53b9b89so11491038wmd.0
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 09:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=uvtm8InIbOpdk2V8MU3lr+K93mD5xCbJmgOI4CSsZ7Q=;
 b=ojLAXhE0i5WrxYmoHsiWInfHTmIj2Y0XmaTwBYfVQf0ghYsPrklzlrfxZauCOm4hYK
 zSz4WPveFb9iTw59MrLPTm7BAQR0q6uHnLOdkdvgesrUgv/Nk5P9pMVttBD15iR7DKpQ
 Wp03xqFaQu4TcLB6WzA1XW0x6JoFkYTvOfyph3KyGdewmUpHWw6bYzcf61WJhx3l4Ok/
 Di4ZKsFl4uJ+O4iWVpawFf5e6bzGvZ3bDcVRyv0bLhbG3KnP/QycIWkYib9RN2ToiQFb
 co6NW/y6zz3CZ7HnUYb5hs2ZmuSC8CJv1DotmWcRJyn3uEfMDXOFOuyk4J409LnqHnqa
 //rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=uvtm8InIbOpdk2V8MU3lr+K93mD5xCbJmgOI4CSsZ7Q=;
 b=ga1akCsFVhXbhvtYLUbBkwld9+KmudknUAu/gos5FU622oN5MtX27ktEMaqHetsMY1
 8sbTviySxoNgkMW+E3PyBl37TfMJaukJBqWQpNkgprdk4vnOz03Ai37YCXCQjdpUTrOx
 G++i1ME0dFhui42B/HEyBdz2GJLQkAO2oy4Y5hAOKJN0MaZzZiwmjfkarS0q27wm9N4O
 pllZVW6uArnNkP7KKZl0z59NNwWYng6lfW4fmB3lp9sUacUyw77GrWiuspR+kyesX2xy
 6A13yx9i+1Ht2BmWD86iW62xrDpS0aBgJhZWHCKQ3U2UkR64piCa49JC0ET1bOcNE6Kh
 Sctg==
X-Gm-Message-State: AOAM531Et/KJHi911nxXLLpmxVnszR7/HD8dwfsmOtopQ3UMNAhw81Bq
 8JzSy0on8xjCeGJiGzcdqsAaVDlXhATFlw==
X-Google-Smtp-Source: ABdhPJxhqFnTOTXmatqXE5FoPuUp98H8SOOmhjx2CBYg22v+2CNZxOecYIz6/vbIhrnY3Ba9djErfQ==
X-Received: by 2002:a05:600c:22c3:: with SMTP id
 3mr201554wmg.170.1634746543977; 
 Wed, 20 Oct 2021 09:15:43 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k17sm6349800wmj.0.2021.10.20.09.15.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 09:15:42 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 31DDA1FF96;
 Wed, 20 Oct 2021 17:15:42 +0100 (BST)
References: <20211007195456.1168070-1-richard.henderson@linaro.org>
User-agent: mu4e 1.7.0; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 00/48] tcg: optimize redundant sign extensions
Date: Wed, 20 Oct 2021 17:13:24 +0100
In-reply-to: <20211007195456.1168070-1-richard.henderson@linaro.org>
Message-ID: <87lf2nvfip.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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
Cc: qemu-devel@nongnu.org, Matt Borgerson <contact@mborgerson.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Currently, we have support for optimizing redundant zero extensions,
> which I think was done with x86 and aarch64 in mind, which zero-extend
> all 32-bit operations into the 64-bit register.
>
> But targets like Alpha, MIPS, and RISC-V do sign-extensions instead.
> The last 5 patches address this.
>
> But before that, split the quite massive tcg_optimize function.

BTW this reminded me of a discussion I was having on another thread:

  Subject: Re: TCG Floating Point Support (Work in Progress)
  Date: Fri, 01 Oct 2021 09:03:41 +0100
  In-reply-to: <CADc=3D-s5wJ0cBv9r0rXaOk0Ys77Far7mgXq5B+y4KoNr937cC7A@mail.=
gmail.com>
  Message-ID: <87y27d5ezt.fsf@linaro.org>

about a test harness of TCG. With the changes over the years are we any
closer to being able to lift the TCG code into a unit test so we can add
test cases that exercise and validate the optimiser decisions?

--=20
Alex Benn=C3=A9e

