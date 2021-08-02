Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED463DD6C5
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 15:17:50 +0200 (CEST)
Received: from localhost ([::1]:40034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAXpF-0006hc-2k
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 09:17:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAXmc-00059i-A0
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 09:15:06 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:42671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAXmX-0004N8-Iz
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 09:15:05 -0400
Received: by mail-ej1-x62c.google.com with SMTP id e19so30827809ejs.9
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 06:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4JPw84OJny5ObBJXeGbtmqYPc15i0n9FEHaX3aRFrLs=;
 b=zc3q98MFvljvGu6o5kbtLXATnM6vDYLA4utKy15H+5qGQNs0+WuylwaXTPSydeYhj7
 3Uy/zsDnLfR+ttPo0RIV4nydmK9u9BaxpL2kVii9XqZ2XGkb6mo+OJl3Nal0KD/hrl2h
 DBXzObF/EgneAUVCP5J6SwKX7k8Au3Q6/vAx7UFK6Y1+BpKu7xzBLMtDM3d2MFYCEu1q
 h6llD7hnMX3tpDZuyU/98VgEvsAAGcTKU6yueRkN1qcYUrRCg5pTVCCYbZt5AxUWcJWL
 SWjB/Wshd7sxXzD+4cNEP9PwBSYrXteGl9yLPAhfmZdoPXdQdX8YfXN08oMZ7ATdLcGz
 opdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4JPw84OJny5ObBJXeGbtmqYPc15i0n9FEHaX3aRFrLs=;
 b=g270j7M0sa+TEdJ5piGsnT7DNBs4XUll1JuD7GSv7lMA2KnqpMiKZL9xLh6PeE3SPh
 8czU2Ygje8Wo7VheLUW8/huCvieva4glEm3xMNhGZcTTdY4eSxTgR2WpF69HatYFtn+M
 hJ6OIo8bHu60+1CtbkytyUIITG1t0O/SgIWchaV2O5/oWlPBGVd68OL38EQF4pyT7Smg
 gLFHPV/yWTFuxijpQEeZZUjfS6OSvkmPET+AKumWgrueKqBnA80BdsddQiQ7Z4EP6n1O
 SDGBg34eQeIhCj0sgT6ltfi+UKHGly227vbH+mh+iysriRHGPPH/H7IJ1DhMtMYwfIxf
 gJrA==
X-Gm-Message-State: AOAM533SggHBYiXdngARMGAvC3Vu7CNKvHxN46jaW9631qUBiBRna0Q4
 7sllTMSD3Mh4Mcl1QWwwQfGduF5JR0ZvITpI68ssAw==
X-Google-Smtp-Source: ABdhPJyYErAx71+DffSWYoV3fV7i7xn7q3u4k1c4G2KFJHJDoF6zB12nkf8LFCi4seHLPQl0mwM3NjVugsPJet1zdv8=
X-Received: by 2002:a17:906:6cb:: with SMTP id
 v11mr15397977ejb.482.1627910099873; 
 Mon, 02 Aug 2021 06:14:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210729004647.282017-1-richard.henderson@linaro.org>
In-Reply-To: <20210729004647.282017-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Aug 2021 14:14:16 +0100
Message-ID: <CAFEAcA9cPYJ6xZL9hYePLLpSDLDzFjHV1EM253KR7GcYNFSufw@mail.gmail.com>
Subject: Re: [PATCH for-6.2 00/43] Unaligned accesses for user-only
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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

On Thu, 29 Jul 2021 at 01:50, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This began with Peter wanting a cpu_ldst.h interface that can handle
> alignment info for Arm M-profile system mode, which will also compile
> for user-only without ifdefs.  This is patch 32.
>
> Once I had that interface, I thought I might as well enforce the
> requested alignment in user-only.  There are plenty of cases where
> we ought to have been doing that for quite a while.  This took rather
> more work than I imagined to start.
>
> So far only x86 host has been fully converted to handle unaligned
> operations in user-only mode.  I'll get to the others later.  But
> the added testcase is fairly broad, and caught lots of bugs and/or
> missing code between target/ and linux-user/.
>
> Notes:
>   * For target/i386 we have no way to signal SIGBUS from user-only.
>     In theory we could go through do_unaligned_access in system mode,
>     via #AC.  But we don't even implement that control in tcg, probably
>     because no one ever sets it.  The cmpxchg16b insn requires alignment,
>     but raises #GP, which maps to SIGSEGV.
>
>   * For target/s390x we have no way to signal SIGBUS from user-only.
>     The atomic operations raise PGM_SPECIFICATION, which the linux
>     kernel maps to SIGILL.
>
>   * I think target/hexagon should be setting TARGET_ALIGNED_ONLY=y.
>     In the meantime, all memory accesses are allowed to be unaligned.

Could you include suitable updates to docs/devel/loads-stores.rst
as well, please?

thanks
-- PMM

