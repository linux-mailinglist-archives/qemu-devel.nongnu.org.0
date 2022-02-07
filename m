Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 484C14AC6F2
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 18:14:54 +0100 (CET)
Received: from localhost ([::1]:34114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH7bJ-0001XO-8r
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 12:14:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nH7Wj-0006wg-Uy
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 12:10:10 -0500
Received: from [2a00:1450:4864:20::42a] (port=41685
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nH7Wg-0003So-3A
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 12:10:09 -0500
Received: by mail-wr1-x42a.google.com with SMTP id k1so9513371wrd.8
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 09:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gyVIV96EqQNurTylgvcNFf0jRp3eNl0xIRV0KoqwsWc=;
 b=AqHxjlbKMFhZA37tpHhFx7Akv6f6ZKt/1tQI+RzGKY877Xx7em9/Y7FSnoa+vPpcwy
 nHn3qs1x+vpvvOuFtrqtO6U+8mE9EfUqOuSst6HDUR7LAKgLJWtRWCVzLY4fd5sGjM+K
 WIgDj21+ZzzFS8RBAB6LAYGe7nDzizs6v201N2GIaDg3XJDQPsZ570/pQO97cmq6kA17
 DagwFzLeBf71gayLvL6AR51d8p1zxAhCzgpgNSAjpacn/LWW8Dt/dyePUsZdg6fNndZv
 P2eJtkOuRE7Pp7fuYsaH8nr0ukMWeGgUQUQQVEYitzFV/Qi8sBW9jzsaeJXtkNx/W/wV
 AGJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gyVIV96EqQNurTylgvcNFf0jRp3eNl0xIRV0KoqwsWc=;
 b=tP5jlCsPIL81nWX3M8+HX0RTna+OmwMzpea2JHvuej79MNo2KOnSu7QgD5NacAf1dL
 S6WZAJd3Nrfk1bZs1s8zaLWrJJrgVjCJBseFbneJlfGlMpcngIyIKakLXmxb5+JVvj8R
 CwO7fMzMcz6GHfKGolXwEsF23LHZnvfpc+3rJfJW10V7bT2D2Fp1NYGJzYp3/gweLb55
 Xb32R6VajcQChuVnkqqnjua8gmtWXIuPL27G67lwl8qjzGSNXOblM2Z8rlVl3gQs+ESy
 3DoIGqfShyXG93tHMdsCUnuXDeAKroyYyHLtFaJfaGT6KVU1HT/axHya8hTqPBJTc4le
 fLKw==
X-Gm-Message-State: AOAM533e8QecJIFuuer+NwPrTFwkfBs/yiHu/MUXhrdF4+8+r7V3qEc0
 1ic5yIjJ+mwjeW2011FOevYfZDhXOCCynDq5QDJCSg==
X-Google-Smtp-Source: ABdhPJyslydg6nUNJyc9bsrycAhvbtXfrc7jRqhwXZBxOb9Njes8qDNFKWcyjhzBfUV6KFpqnFa3tiQIDzSwkqXkvgM=
X-Received: by 2002:a05:6000:258:: with SMTP id m24mr377144wrz.2.1644253803871; 
 Mon, 07 Feb 2022 09:10:03 -0800 (PST)
MIME-Version: 1.0
References: <20220130110313.4045351-1-edgar.iglesias@gmail.com>
In-Reply-To: <20220130110313.4045351-1-edgar.iglesias@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Feb 2022 17:09:53 +0000
Message-ID: <CAFEAcA-8gTFU=We=9-hXkQ6pYbYVi7RUuOaZdBxg1cOGJYCH_Q@mail.gmail.com>
Subject: Re: [PATCH v1 0/1] hw/arm: versal-virt: Always call arm_load_kernel()
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: edgar.iglesias@xilinx.com, sstabellini@kernel.org, luc@lmichel.fr,
 sai.pavan.boddu@xilinx.com, frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, qemu-devel@nongnu.org,
 francisco.iglesias@xilinx.com, frederic.konrad@adacore.com,
 qemu-arm@nongnu.org, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 30 Jan 2022 at 11:03, Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
>
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> This should be applied on top of Peter Maydell's
> "arm: Fix handling of unrecognized functions in PSCI emulation"
> patch series.
>
> This fixes an issue reported by Peter Maydell. We should
> always call arm_load_kernel() regardless of kernel_filename being
> set. This is needed because arm_load_kernel() sets up reset for
> the CPUs.



Applied to target-arm.next, thanks.

-- PMM

