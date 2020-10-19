Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A67292AD8
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Oct 2020 17:50:54 +0200 (CEST)
Received: from localhost ([::1]:46636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUXQz-0008VY-FE
	for lists+qemu-devel@lfdr.de; Mon, 19 Oct 2020 11:50:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kUXOI-0006y7-KV
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 11:48:06 -0400
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:41105)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kUXOG-0007aU-Rv
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 11:48:06 -0400
Received: by mail-ed1-x542.google.com with SMTP id l24so10753993edj.8
 for <qemu-devel@nongnu.org>; Mon, 19 Oct 2020 08:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8wkdMrxW++g/lqmlcAF149KksYnaPdBXB5LvS1Fjgug=;
 b=x1NA8XZLkrry33UMmksusrrDg4IqNffCgX106rkB0wqWxgAuCrmXV8qMnPkKg94AeO
 GdIlabzqIMyEUS1MmwZ1btcRCSvuA8kB9CpDWblODxpU8ZsD1XPd2CjJcLFAw2U98eln
 u49LAInJPa5hlk4OB6gI47Wr/FuZ1LkoMmbuFaS00H9yXA4Djolv018R2+P6VoSaL+m7
 CIALpHsnrUTX5arQolOdPtZI0dpYMh+zhpr69muD6DsE064yvGIWXGTEal2tM6nzbRoY
 SdUcHoImTaUbIewcBoJzAWW9y6uV/uvMucFNvDuURhDC0AqorRBArS+bbvwb1lvirrup
 PaUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8wkdMrxW++g/lqmlcAF149KksYnaPdBXB5LvS1Fjgug=;
 b=dpgdjdHE/Mgsom8stMgymw7FZwiPWhvu33iJJ/bM9/38Trmquo1TsD3vYTtK/TsnKB
 sKH29d/ItX41weN66/r7+iwgr3BoVqTs1O5F8e2jrrs2hUSJEXLbY0Mfqu7D/sVHlu/F
 NpuJ5i6rNmc4JWhtYexfRO71LaEht+buS3BbA1X7ksHejhVIVCRr8Z8hFYAo3QJNeuXE
 FAN5WI9p1nvbDjKOpouigBWlVW4vA5BQT7H9kdkl88cR9bXII3lVM4T9OVo4heQ1FqO8
 O4kY8CZ5qMy/+d7+2PBB4lDNLe9mLqB4Xb5J7SXPAF0xWi9Lk5HPdn6AZ3iwLLE2w6Nb
 cTPg==
X-Gm-Message-State: AOAM530M8wQA5HMJ90R8rIFrlon1leXNxKUApJPh2aSd68V4tKxEuNk6
 EEqAJ2A68ZBBoFqB7nkSnt7yXliK2xC7b0jqPyJkyw==
X-Google-Smtp-Source: ABdhPJyr2DasMtoAR744maKN/5HKDgGQBwcFC9+hDMsIKgCuYc/N5FMD6VQvzyep8wlF0C35MioewXAWIik5KpiiUUY=
X-Received: by 2002:a50:9ea6:: with SMTP id a35mr494172edf.52.1603122483571;
 Mon, 19 Oct 2020 08:48:03 -0700 (PDT)
MIME-Version: 1.0
References: <20201016210754.818257-1-richard.henderson@linaro.org>
In-Reply-To: <20201016210754.818257-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Oct 2020 16:47:52 +0100
Message-ID: <CAFEAcA-jKTDMym8kagUEvOnKUSvK+6abmOuS_wer=vbuLdG6xA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] target/arm: Fix tlb flush page vs tbi
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::542;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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

On Fri, 16 Oct 2020 at 22:07, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Since the FAR_ELx fix at 38d931687fa1, it is reported that
> page granularity flushing is broken.
>
> This makes sense, since TCG will record the entire virtual
> address in its TLB, not simply the 56 significant bits.
> With no other TCG support, the ARM backend should require
> 256 different page flushes to clear the virtual address of
> any possible tag.
>
> So I added a new tcg interface that allows passing the size
> of the virtual address.  I thought a simple bit-count was a
> cleaner interface than passing in a mask, since it means that
> we couldn't be passed nonsensical masks like 0xdeadbeef.  It
> also makes it easy to re-direct special cases.
>
> Changes for v2:
>   * Add encode_pbm_to_runon/+decode_runon_to_pbm helpers (pmm).



Applied to target-arm.next, thanks.

-- PMM

