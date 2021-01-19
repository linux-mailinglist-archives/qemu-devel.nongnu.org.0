Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA1B2FB574
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 11:47:30 +0100 (CET)
Received: from localhost ([::1]:55062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1oXp-0005kV-8a
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 05:47:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1oOQ-0007Gv-Ll
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 05:37:46 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:44869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1oOO-00088C-Sz
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 05:37:46 -0500
Received: by mail-ed1-x52c.google.com with SMTP id p22so20869666edu.11
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 02:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8gG9Jn5dCRu1lhG22mrUIl619dTTmEhbS3v7B8ySK8Y=;
 b=achFVkaOm+RT9nlHX4tjQWgesiHUJWtUk5PaGBvVU80F1BC10VyOHahCfZNLiBb84r
 2LF5hRKmIKecXULxLC+Qg/5L/pYfd3Tu7zhcP1/VEu7PM98osOMszPCnoIUT+YgtdNx4
 k7MliaDR4MSJRg44Ta5xFawmfupf+GP2naqLABKACz4P4qcKzLiHcl2cOCPwB/RXnDRQ
 +aIYDD9XzzFgyIPurt31I7HzuZX0fjyvAHHHmoNMAChMSa0CeZakPulz2nAzyoUCD6kn
 oh8x4+dh48Ex5zUC11+CSuhtZ60+9RUMT7IfucgneadFASh5wJwXMqQSeyvoGzS14SPF
 Lz0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8gG9Jn5dCRu1lhG22mrUIl619dTTmEhbS3v7B8ySK8Y=;
 b=HWGVbL7NZ2WU0PJi3q2svzphy4bW6OfbW52EIkVpAVVEzajUYsfo9lcWzj1KKRkczT
 GjzmJnVIxUw904wR1TXuu/7CgHdFpHkY7CufJNYLxGeYUSzY11QhHUs4Z9ccDh/H/4gs
 aqWUnXEahvyrOz6iWX/FBYNcLQ6ucfRVq630Uc5CB20CADnqWZwo0tRR5UgiBW1fROve
 AKD9zXLsd93nEck1/ZsD7oi5Wxi3W27wOc5fpfMsqNGBJllHTChXUTLpGLkVxKXkgos2
 pbP3OmUCAowNoJMY/yHyGIXHVZhjTeDsegAh0Gm37C5HR8UuYkYmGYPj98cG9LKeQANN
 EDnw==
X-Gm-Message-State: AOAM533onXMmXR2fDjG3f4zuFKWc3VQgwMc9COBt0A4gtYR1jH7tsoAL
 RLK9YjnyW1M3L5xOQD7VyN9kNKPRxAoH9DNGsjXPQg==
X-Google-Smtp-Source: ABdhPJzfVXotLnmidM+wdY8RxG5aTMYq+0RO2MI5IPrB8VT2ILodHQ5QZcHhEJEgIb8RXLEg8JimzWo1G2d3VsK/NoY=
X-Received: by 2002:a05:6402:1a55:: with SMTP id
 bf21mr2963454edb.146.1611052663271; 
 Tue, 19 Jan 2021 02:37:43 -0800 (PST)
MIME-Version: 1.0
References: <20210111235740.462469-1-richard.henderson@linaro.org>
In-Reply-To: <20210111235740.462469-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jan 2021 10:37:32 +0000
Message-ID: <CAFEAcA87rH4dHnDmRtr-VRDh0A7j+8kuiP5wNwPmJnnGz5LHvg@mail.gmail.com>
Subject: Re: [PATCH v7 0/3] target/arm: Implement an IMPDEF pauth algorithm
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 11 Jan 2021 at 23:57, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The architected pauth algorithm is quite slow without
> hardware support, and boot times for kernels that enable
> use of the feature have been significantly impacted.
>
> Version 7 changes:
>   * Fix rebase error (drjones).
>
> Version 6 changes:
>   * Rearrange xxhash64 (pmm).
>   * Add documentation (pmm).

Applied to target-arm.next, thanks.
I fixed a typo in the docs text in patch 2 and adjusted
the text to say "impdef algorithm used by QEMU" to clarify
that this is something of our own devising.

-- PMM

