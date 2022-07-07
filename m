Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B6556A30B
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 15:00:35 +0200 (CEST)
Received: from localhost ([::1]:50512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9R7K-0007le-HK
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 09:00:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o9R53-0005f7-Nm
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 08:58:06 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d]:37449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o9R50-0006XO-NA
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 08:58:04 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-31cf1adbf92so42119887b3.4
 for <qemu-devel@nongnu.org>; Thu, 07 Jul 2022 05:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E/egEhPUycr7uwAggdOFxypLTb877uZjjSw6IAc6nBs=;
 b=rGMcT3Hvgzlw26MNU6BXgNFuNJ/vG+Rc7rWzik4MLwufgDDloY0XIdnCXqgGZsPHvs
 7dw0xnw87f0b/2JwLVVDPNGDwQqSc0MdxZFUfccEcNLoKE3cD75qpceaQDwaX9vMRbCA
 1sOPxHSZcfGa/Ei+V5ESd1QFEB0Hpbak20pUPnlscU4mbJLYSPwGYZu2kd01JELxafPT
 k4f7PwiSew4siBQ/c2B499zsx4YaP6YwomSS5zEARB0hIb6GHbP9KGmL0koJj2VPzkV4
 iGhRJnPRP6lJTCRyxFgc3zgtMAOvY4/Ee9R/F4jQKDaHAmDBxtUivNm+8yPtQBT+6ZiW
 fuGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E/egEhPUycr7uwAggdOFxypLTb877uZjjSw6IAc6nBs=;
 b=qdhv+R1zdfdv+HPGVKlXaVGCK5UthcK5t14WO4jiXe53YPRvIDLRDXb4/MUWHKU9F6
 wdlJ+XREqOAs+Cmgp2htiz6cifKwoSrVWdge2q5MHINYv3t8mtweoJLP5aSYFETIsU+1
 sj606o1pH4JHeX3vKYpb57CLoBe3SD8wwjyM3hHRSuS5x2kow+msDIQZo4JNouSrFEem
 MjZzPjBNtSn8+9Huzhw3YwLX+iELuPlgUQG2ra8pGHUYvJKS+5uvBiC9qV6ta4qmdLOB
 2Utz5FNXcw9kIgd39tSzNFlO5eg3YRSeqk9Rr02aQ39CbZ1VQwBIuTlFDpgYZaCSrtS0
 eSjA==
X-Gm-Message-State: AJIora+xoJ8ArJNXR03DwWNEKseo22cXFoLtHtiU4fnw8yhdvb7+nYy0
 xXiFGngG6oRDpMwzyb7ptz5HlZ+BfRIYtLJjRVxzwA==
X-Google-Smtp-Source: AGRyM1urAXHVXOLK19tl0s2YdIkFoCVZ74qrYfrarXGThWpwtXS83Z44fb2SV1NQristIMKEDRDUF0quZW5OlLzrNnI=
X-Received: by 2002:a81:1cc:0:b0:317:a0fa:7a61 with SMTP id
 195-20020a8101cc000000b00317a0fa7a61mr51344354ywb.10.1657198681297; Thu, 07
 Jul 2022 05:58:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220705095421.2455041-1-armbru@redhat.com>
In-Reply-To: <20220705095421.2455041-1-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jul 2022 13:57:22 +0100
Message-ID: <CAFEAcA-xaQSOGWixtnq0XosSsdt2VKACxgCK5KpdkNscBPD-wA@mail.gmail.com>
Subject: Re: [RFC PATCH] qobject: Rewrite implementation of QDict for in-order
 traversal
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, 5 Jul 2022 at 10:54, Markus Armbruster <armbru@redhat.com> wrote:
>
> QDict is implemented as a simple hash table of fixed size.  Observe:
>
> * Slow for large n.  Not sure this matters.
>
> * A QDict with n entries takes 4120 + n * 32 bytes on my box.  Wastes
>   space for small n, which is a common case.
>
> * Order of traversal depends on the hash function and on insertion
>   order, because it iterates first over buckets, then collision
>   chains.
>
> * Special code ensures qdict_size() takes constant time.
>
> Replace the hash table by a linked list.  Observe:
>
> * Even slower for large n.  Might be bad enough to matter.
>
> * A QDict with n entries takes 32 + n * 24 bytes.
>
> * Traversal is in insertion order.
>
> * qdict_size() is linear in the number of entries.
>
> This is an experiment.  Do not commit to master as is.
>
> The change of traversal order affects expected test output.  I updated
> only the tests covered by "make check" so far.  I expect some more to
> hide under tests/qemu-iotests/.

Seems to fix the 'rocker' device regression, at least in that
it no longer gives an error message on startup.

The amount of patching you had to do to expected-output files
in 'tests' suggests we have quite a lot of test cases that
are currently implicitly reliant on the hash table traversal
order, which is not guaranteed to remain stable. Regardless of
what we do with this patch it would probably be a good idea
for whatever is outputting the text these tests are comparing
against to be made to use a stable output order (alphabetical??).

-- PMM

