Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C467F6A0E3C
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 17:52:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVEpN-00067k-Nz; Thu, 23 Feb 2023 11:52:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVEpL-00067b-Ol
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 11:52:15 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVEpJ-00069A-SV
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 11:52:15 -0500
Received: by mail-pj1-x102c.google.com with SMTP id x34so10266963pjj.0
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 08:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=uduUJ9Xg+fHgUI8EndMpC6OBXlKbv8agZkGh81uIWq8=;
 b=bHzQSmcZxaA8B4SymVDq1N7EmfEvshkqv0Nscyp1mX/G99EMAXW2pgjunNGyduJyx1
 Av3VCqjLVaKVKnJgfUC0E0SNoU8bglA79PIuhczPp+umT28NpX4LXxIgGX1tgOMBSArc
 5ei5310ebHS1g2/lv0f8mpQ1QS+UFtVclZZonatEyF8MyVlg8YeYpclC79BzMYWpXVqf
 0EAHQ1iT+yNI0oPoMpDC7NBOlXBrllE4B0jE1QJEhIcff7KVdHn9lAHibdsf1LZIJBCT
 wLQuAza55bqDkLOAS/73MdtN5mBPPLVplDx0J7SRu6OWn51vIqyaiz+/K67dNpEDNTuz
 Tycg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uduUJ9Xg+fHgUI8EndMpC6OBXlKbv8agZkGh81uIWq8=;
 b=l8lxvF4Etp0qJK/5LXE9471+7zW97/1992hhZK8SCVewKI4iVkDhKkHzb7UgsWjJ53
 fC9u/jiJRCoq6VLlHhqlhqlS7bpNKr+e3h7yHvJnOoUXJiZ9qywR/5XmBa/7FbohTIeH
 gPhlqozJ2wqHhNxsSXw9OcuwRi7Xpei77ym5VALXFAb9mRYrUgqlpEa1mwQUV6nYYQdq
 7KwTB1zBVHqni0C9o1HK2w3+BidnLeNPbR41wNIEBO3LrwBqmvra8/tdhoAGEPqOCgNc
 SwwhHjw7stnBaE8Y7fe75EdFezwmpIOBMBnfDhqPVkXWADGJKAHCWBUBKvTpbVTQXE+d
 13ng==
X-Gm-Message-State: AO0yUKXKthoDnGd5i5wieLqIJMxhR/s7IsncebnyTQ2RqvBRK1TT5DLd
 kE02eEVcnczKROnRW7MIfY+015QAtNq+ubyXs3MnvQ==
X-Google-Smtp-Source: AK7set8lJFaK/0QjjQPdKsH2pwA4N0a0BfwPCG70yaM/lyp2Td7NLbGt/fp6pL67xPSPmPaPu03Pgs8ekdMuIzs/1No=
X-Received: by 2002:a17:90a:fe0e:b0:234:c035:7749 with SMTP id
 ck14-20020a17090afe0e00b00234c0357749mr572867pjb.0.1677171129556; Thu, 23 Feb
 2023 08:52:09 -0800 (PST)
MIME-Version: 1.0
References: <20230216030854.1212208-1-richard.henderson@linaro.org>
 <20230216030854.1212208-2-richard.henderson@linaro.org>
 <CAFEAcA8LQPEAQ34otcgNeqOFbi1PVVs-d3M41ar2jycjJYQF1w@mail.gmail.com>
 <8e759fa2-674f-184c-1ddc-35638a18bda5@linaro.org>
In-Reply-To: <8e759fa2-674f-184c-1ddc-35638a18bda5@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Feb 2023 16:51:58 +0000
Message-ID: <CAFEAcA-6vYGvnxE9ZiQ_WYoD8jg1kiQCvj4A-DjncW=TUiM8Vw@mail.gmail.com>
Subject: Re: [PATCH v1 01/19] target/arm: Make cpu_exclusive_high hold the
 high bits
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 23 Feb 2023 at 16:12, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 2/23/23 05:14, Peter Maydell wrote:
> > On Thu, 16 Feb 2023 at 03:09, Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >>
> >> We currently treat cpu_exclusive_high as containing the
> >> second word of LDXP, even though that word is not "high"
> >> in big-endian mode.  Swap things around so that it is.
> >>
> >> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> >> ---
> >>   target/arm/translate-a64.c | 54 ++++++++++++++++++++------------------
> >>   1 file changed, 29 insertions(+), 25 deletions(-)
> >
> > This code change looks OK as far as it goes, but the bad
> > news is that we migrate the env.exclusive_val and
> > env.exclusive_high values in the machine state. So a
> > migration from a QEMU before this change to a QEMU with
> > this change on a BE host will get confused...
>
> Oof.  Ok, I didn't *really* need this, it just seemed to make sense.  I'll add some
> commentary about "high" only meaning "high" for little-endian...

The current state of affairs is arguably broken, because it
means you can't migrate a guest from a BE host to an LE host,
because the migration stream contains host-endian-dependent
data. But if it's easy to leave this sleeping dog alone
then it will save us figuring out what we would need to do
in a post-load function :-)

-- PMM

