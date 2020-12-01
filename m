Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 518082CA81E
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 17:22:43 +0100 (CET)
Received: from localhost ([::1]:60428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk8QM-0004pv-Al
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 11:22:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kk8Os-0003zx-3e
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 11:21:10 -0500
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:43139)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kk8Op-0000OF-OK
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 11:21:09 -0500
Received: by mail-ed1-x541.google.com with SMTP id q16so4059888edv.10
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 08:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O3vA27sudkgPcN97EbJUDmhwt+gdwznlchC5LiJP9Vw=;
 b=XVQKtrkDg8MVWGZJPtiMPJB2B9eXVg4T+4i9atZjZ714k0J03CZoRws4Mo1WaHIgf0
 vefyMvCoZd5dIahR58voh4dOpqCZfGN5mTis8Wn4NNTOLa/ULueeRQPzLlcXdDNEmWaI
 GzNdRN0wc9RfyLxPaedYed+tOTjRzZ5rhFJWK2Ebwy5IV6lupbSlo449iqvj7BoWTbqC
 FdC7WUIzygjhPeCrXO4U4k/ncl7TdsQ1XgnTKcXPDlxuNWRMLapxp62e+XQHvj1RFMwH
 K5GmQ8dmmJdEYXwke/c0cA0aPyRARX9T7IRQFu1KGEe+SoCbQQm1aYutSSnhu8YZxwt+
 TfsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O3vA27sudkgPcN97EbJUDmhwt+gdwznlchC5LiJP9Vw=;
 b=fQUtNbi2bD4/mvn+pg7LdlYcYUfJIvd8pc2+nR3uM1PSROUmEGilXBaKgBRTC/QBfq
 DfKIN1OplBMRNHhevkkZD1ymA20/5OxpXgiU2K4YGbEbXbzqdiF7y7wruATfxjF4vnrw
 bJNGzJ+F2hlQLrcP5trCbAwyKykD6yScO34aouLMoNfZxnQv6EmsJ7NPclniansA01l+
 i+D7L6h4zLoM2M54QPvJ8+lB1u11i7pLG1aFnX1TpL6VyUoC/cIwzA3wapq9IG98L3kw
 bGmUKplzQgKbHaFOXPfYL3LOOz/NDOl8tEDPy66fE0O5IZHD0KzVDrtmEWn6ucaBywVP
 5YEw==
X-Gm-Message-State: AOAM531DXqYE/OjNJA5i5egDGwH8vtxsMCphzzGAjBa6yVvSAgfzEnwI
 jZg4A0gzhwu2ivjrQSJxex0iSqq5nGrpRECWvaVzUQ==
X-Google-Smtp-Source: ABdhPJy57qC8ciY1qDVhsMZ4fLTYVVQEbHqnKrDhrui20l6vkjC1M/+Z4iedQ4ckDrsOtdQgpRbRUUyyssKGNJmNvJg=
X-Received: by 2002:a05:6402:3089:: with SMTP id
 de9mr3822205edb.100.1606839665974; 
 Tue, 01 Dec 2020 08:21:05 -0800 (PST)
MIME-Version: 1.0
References: <20201201120926.56559-1-pbonzini@redhat.com>
 <20201201151729.GA6264@merkur.fritz.box>
In-Reply-To: <20201201151729.GA6264@merkur.fritz.box>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Dec 2020 16:20:54 +0000
Message-ID: <CAFEAcA9qAOWGWn-RFhGgdQWtty571PshuKxmQ-2x56V4K-26bQ@mail.gmail.com>
Subject: Re: [RFC PATCH] ide: atapi: assert that the buffer pointer is in range
To: Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::541;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x541.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 1 Dec 2020 at 15:17, Kevin Wolf <kwolf@redhat.com> wrote:
>
> Am 01.12.2020 um 13:09 hat Paolo Bonzini geschrieben:
> > A case was reported where s->io_buffer_index can be out of range.
> > The report skimped on the details but it seems to be triggered
> > by s->lba == -1 on the READ/READ CD paths (e.g. by sending an
> > ATAPI command with LBA = 0xFFFFFFFF).  For now paper over it
> > with assertions.  The first one ensures that there is no overflow
> > when incrementing s->io_buffer_index, the second checks for the
> > buffer overrun.
> >
> > Note that the buffer overrun is only a read, so I am not sure
> > if the assertion failure is actually less harmful than the overrun.
> >
> > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>
> I don't think reading LBA 0xFFFFFFFF from a CD image would ever be
> valid (or at least I have never seen an 8 TB CD...), so it's probably a
> malicious guest. Assertion failure seems okay to me, guests have already
> enough ways to kill themselves, so it feels slightly preferable to an
> information leak.
>
> Reviewed-by: Kevin Wolf <kwolf@redhat.com>

Thanks; applied to master for 5.2.

-- PMM

