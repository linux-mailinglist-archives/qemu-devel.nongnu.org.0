Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 095735F6779
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 15:13:44 +0200 (CEST)
Received: from localhost ([::1]:57080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogQh4-0004kE-6J
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 09:13:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogQSk-0000oR-C0
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 08:58:54 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:42611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogQSi-00070V-Ig
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 08:58:54 -0400
Received: by mail-pg1-x52d.google.com with SMTP id e129so1811277pgc.9
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 05:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=X6ChZlVUOmmtoUCfM1DDjMELIKwMSRGWtmOBzY9QgOM=;
 b=Gy3dZx78Wu6jpPAHZIOurpib9VC8rupPrEAt71cN9e3s7ioq4S1zngHGD4kQSmiu+B
 IKV5Dah0/1wwYSPTyZjgx/5mbt9L87ABEpHTVjfgS6vDysxHJdTvqK2ZR/qn1xQLFnCl
 t/IGxQVLwGahAhIg3bK+3kesKkS3cbn/IAFwTBX4uHEHYfaNllC1L7oSWSO27jv5mwkZ
 JJH1ForhlgnpQgjqh59nyvRJ3U30Zz5/mTAcgb91nyiOhu0B70UGAxQNogSbdRgojQ0M
 brJFJy2ETSPcxlIGnkNAeAV1Sb2J21fKaiZL1BzdBZSgdUjUQLVh9LNGeXgwMZqhmD1u
 chAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=X6ChZlVUOmmtoUCfM1DDjMELIKwMSRGWtmOBzY9QgOM=;
 b=Y1Hwe3pfjeDht0npF3ktZhIeRsmWRn88RohzbAJ7fKYSsP55gQ/cGjhG+nZhTA35uh
 /szzuPmRiZJ84IIo1XCFgZ0ocIIw1d1wdywNxd9tvJk97M2T1hI+Hvm2K0VrRnJQi5Y8
 tyujAlM/yqR5FrnYk+hSokMUBAAmTKgEkeELrAF9+9/8ZAuFxFW9GeQvx8fTazcH7wXZ
 jqAZ3njWc0UzbFgrAjr8j6sJEM31lZtJ9H9nUUjb0Saxq6R7XpgzJwy393hUfwyoHRCx
 N8QV4I9BMcUPbQCICezh9YeFWNhq+yoDVLk9AlomuxvNK7ziQVekQhuzxXxccMLwSM6x
 x+cQ==
X-Gm-Message-State: ACrzQf1L3lqdaxNA07CDLCbBspqjjZrY2D11DRvU94yZPiP2gWkjQUsd
 SEuE9TphrAMv3Ak/GjPBlIPaMTLC3Ch9Hf7ZfhZrqg==
X-Google-Smtp-Source: AMsMyM5cN+NsTTpyZmvQIeF3jZoO83adNcvjqGXqc/ztvaFXMy2KqY9sbNkAGYYMxOcNjcAKQcaCGu0VP8nircoEFtQ=
X-Received: by 2002:a63:2212:0:b0:43b:f03d:856a with SMTP id
 i18-20020a632212000000b0043bf03d856amr4497887pgi.192.1665061130631; Thu, 06
 Oct 2022 05:58:50 -0700 (PDT)
MIME-Version: 1.0
References: <54930451-d85f-4ce0-9a45-b3478c5a6468@www.fastmail.com>
 <CAFEAcA_bip7nifW-Zq8qrSmZTCUQA1VMpMR8HSHsKVBAeQxy0A@mail.gmail.com>
 <CAMVc7JXPi3kbFyrN9757uKt-cUprKUBLM9nuDMRjawtVePVVAw@mail.gmail.com>
In-Reply-To: <CAMVc7JXPi3kbFyrN9757uKt-cUprKUBLM9nuDMRjawtVePVVAw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Oct 2022 13:58:39 +0100
Message-ID: <CAFEAcA96Qmj0HeTyt8Ng+JZ8ZJiWBsoN0aavA_PUs+hOyfay2w@mail.gmail.com>
Subject: Re: [PATCH] ui/cocoa: Support hardware cursor interface
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: Elliot Nunn <elliot@nunn.io>, qemu-devel@nongnu.org, f4bug@amsat.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52d.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 6 Oct 2022 at 13:16, Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
>
> Thanks Peter and Elliot,
>
> Unfortunately Patchew seems to have failed to apply the patch to the
> current master. It would be nice if you rebase it to the current
> master.

I think this is probably mostly because the patch got sent in
quoted-printable or something similar. I found that grabbing the
mbox from lore.kernel.org gave me something I could apply. But
it would probably be helpful if Elliot could rebase and resend making
sure it's in plain text without linewraps or quoted-printable or other
encoding.

> Actually I have a patch to add hardware support to ui/cocoa, but I
> have not submitted to the mailing list because it depends on a number
> of other patches:
> https://github.com/akihikodaki/qemu/commit/34199fcd4080ce8c705b46df26fdf02966b1610c
>
> My patch avoided using CGWarpMouseCursorPosition because of its
> quirks. I'd like to test your patch by myself to see if it avoids them
> properly for my own workloads.
>
> I have also added some comments to the patch. Please see the below.

Thanks for taking a look at the patch.

-- PMM

