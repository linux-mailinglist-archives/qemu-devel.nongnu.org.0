Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8175673D8
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 18:08:41 +0200 (CEST)
Received: from localhost ([::1]:52034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8l6O-0003Uq-AR
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 12:08:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8kzc-0004u7-SE
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 12:01:40 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:33384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8kzU-0003Mk-LZ
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 12:01:40 -0400
Received: by mail-yb1-xb30.google.com with SMTP id 76so7007634ybd.0
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 09:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nrV/MUZDy7YuZEW5ylExhV5G+kfxPE7pBHeSxonl4G4=;
 b=IfBxt25o43OzgnTYTsCIMvnwgujx8ZRYPUynYWj8vSapBS+51yWBR+Ns0T+0DFitTK
 +n4FH9Qr6abq9ExdFhv/rl9Tv8jsskAfbAjX1LSlGyhWVD0jYSR7s2msA/e6HbJmGTFP
 9fE3gaXcmzw1zsTiE6e2Z8JbzJM0te7q5P5z7izRkct+OFIcECWtvOFNWz4zzzNwSj5P
 m6oMbO2ZV0xOcmDiIU3zbeUkZo97Q6Vl7kvV+ZVmKazjd8P3VK5MMFQiSZqZdXDlFFU0
 pq6vZ+krBBTLacc8TlgcWrSh0pdOs8G4dYgbfj8RVdX7PlRvriZiuls6AeNTo0scPpjD
 097Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nrV/MUZDy7YuZEW5ylExhV5G+kfxPE7pBHeSxonl4G4=;
 b=g49K/hB9Orb6ZYO0dBM8rKb4kiLb0xuQ5m2yvwuZIb/Qp/A7S7whTF0VmJ/Zg3nD6p
 e8CkkNzn3YQL0G9QuJzchKwsQTM351AGOn/SJsdJR53bybkeyKcefOyJuwD7ZR+DrGDD
 4IYXsU97+WuucBpdCaPyexS7hSHD5Dg6oCKq6i+cxnKabA9rGXPNrLwRoUgH+hF9XzLl
 F8S5b74fizpyJ7fyrER0oVaTLQ1wxt6FwIv+liXXHncdG+dYyTBbItsPtkcVZ07Zy5qJ
 zjJ0+F6mkGiTafeGUrsUmZGhN0UbcUYlHgf0qywU2fKxRS+B3SeGrZD8Rq4/rVEXXkbS
 0DUw==
X-Gm-Message-State: AJIora8g4lXoEq2lAGlheGc2ZviVQQqYCh5AzBWnm5J19eDoqPVnO1qx
 JlNAO2EWpFttObsBdurScPG7iTbBz3OlY7j48gnf2g==
X-Google-Smtp-Source: AGRyM1vqdK0JawHiEVtgLMV832FCxN7wMTY21Y4YeTY5f2+6TKKhBW7bvUChcB62VwAgYcCdP9WXbxCgIR9PHeAkC8c=
X-Received: by 2002:a25:d381:0:b0:66e:2943:1c9d with SMTP id
 e123-20020a25d381000000b0066e29431c9dmr19194000ybf.67.1657036891464; Tue, 05
 Jul 2022 09:01:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220704164112.2890137-1-iii@linux.ibm.com>
In-Reply-To: <20220704164112.2890137-1-iii@linux.ibm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 5 Jul 2022 17:00:53 +0100
Message-ID: <CAFEAcA-PU-iXKRKd_0rYzyq3o4DZEbzU4OqJ=8qq+cxNA64O+w@mail.gmail.com>
Subject: Re: [PATCH] multifd: Copy pages before compressing them with zlib
To: Ilya Leoshkevich <iii@linux.ibm.com>
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org, 
 Christian Borntraeger <borntraeger@de.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Mon, 4 Jul 2022 at 17:43, Ilya Leoshkevich <iii@linux.ibm.com> wrote:
>
> zlib_send_prepare() compresses pages of a running VM. zlib does not
> make any thread-safety guarantees with respect to changing deflate()
> input concurrently with deflate() [1].
>
> One can observe problems due to this with the IBM zEnterprise Data
> Compression accelerator capable zlib [2]. When the hardware
> acceleration is enabled, migration/multifd/tcp/plain/zlib test fails
> intermittently [3] due to sliding window corruption. The accelerator's
> architecture explicitly discourages concurrent accesses [4]:
>
>     Page 26-57, "Other Conditions":
>
>     As observed by this CPU, other CPUs, and channel
>     programs, references to the parameter block, first,
>     second, and third operands may be multiple-access
>     references, accesses to these storage locations are
>     not necessarily block-concurrent, and the sequence
>     of these accesses or references is undefined.
>
> Mark Adler pointed out that vanilla zlib performs double fetches under
> certain circumstances as well [5], therefore we need to copy data
> before passing it to deflate().
>
> [1] https://zlib.net/manual.html
> [2] https://github.com/madler/zlib/pull/410
> [3] https://lists.nongnu.org/archive/html/qemu-devel/2022-03/msg03988.html
> [4] http://publibfp.dhe.ibm.com/epubs/pdf/a227832c.pdf
> [5] https://gitlab.com/qemu-project/qemu/-/issues/1099

Is this [5] the wrong link? It's to our issue tracker, not zlib's
or a zlib mailing list thread, and it doesn't contain any messages
from Mark Adler.

thanks
-- PMM

