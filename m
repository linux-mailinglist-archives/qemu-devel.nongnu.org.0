Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F118573C23
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 19:44:45 +0200 (CEST)
Received: from localhost ([::1]:40202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBgPk-00059w-Nf
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 13:44:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=yVRI=XS=zx2c4.com=Jason@kernel.org>)
 id 1oBgKK-0001nM-Jz; Wed, 13 Jul 2022 13:39:12 -0400
Received: from ams.source.kernel.org ([145.40.68.75]:41230)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=yVRI=XS=zx2c4.com=Jason@kernel.org>)
 id 1oBgKI-00045z-Gk; Wed, 13 Jul 2022 13:39:08 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 037AAB820DB;
 Wed, 13 Jul 2022 17:39:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85D88C34114;
 Wed, 13 Jul 2022 17:39:01 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="dKe9XANM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1657733940;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Iv4mUu7Fe71/7Rycwt3aV/FC19HtoFe6GytN8WdCfNI=;
 b=dKe9XANMMonsz2IAp399Nm9z14GMcFZ/AKqu8ar5LqNFk6/GKF0MIiWzl1DoCe0pixPFOB
 61KSB4DEFW76056htCGbn9xCrG4YaHXWM2qYT1yuu48IFI4yCxvXjCxey8BPvsTjwLltVK
 47+vW5lWrfizJP4WYT7C+rvAIlvWyrI=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 80c41e2d
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Wed, 13 Jul 2022 17:38:59 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id n7so11550520ioo.7;
 Wed, 13 Jul 2022 10:38:59 -0700 (PDT)
X-Gm-Message-State: AJIora/f4Jgpj6RQQsVP1iSKvIDjZedWiAdujrwq3Q2IDvjopBjUG5Cc
 Ebld+cQiVSKmxADXV2zzovrbSpQ5uZFf0SdyJ7s=
X-Google-Smtp-Source: AGRyM1tvxQrCbphV7nc8UW1qbjUPX35RgiIoagFAY3tLt5M3CdkBtuMXhw5Mq4G0cziTV9UCp2nb/y3FvoZa98N4yWY=
X-Received: by 2002:a05:6638:40a5:b0:33f:3756:dd7d with SMTP id
 m37-20020a05663840a500b0033f3756dd7dmr2510179jam.9.1657733938778; Wed, 13 Jul
 2022 10:38:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220712135114.289855-1-Jason@zx2c4.com>
 <7310087f-443e-ebdb-f345-a18358a874e4@gmail.com>
 <af9db769-ad98-9dc4-ebd7-fc792a1c5e82@gmail.com> <Ys8BMbBPrKYq6S1e@zx2c4.com>
 <4712b9e2-9ab1-b50b-0cf2-61df6d477a69@gmail.com>
In-Reply-To: <4712b9e2-9ab1-b50b-0cf2-61df6d477a69@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 13 Jul 2022 19:38:47 +0200
X-Gmail-Original-Message-ID: <CAHmME9qD4E0fSq1vr68b4sWc+-O85G+whMkgrfWDqNoXGTrbfg@mail.gmail.com>
Message-ID: <CAHmME9qD4E0fSq1vr68b4sWc+-O85G+whMkgrfWDqNoXGTrbfg@mail.gmail.com>
Subject: Re: [PATCH] hw/ppc: pass random seed to fdt
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>, 
 Cedric Le Goater <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=145.40.68.75;
 envelope-from=SRS0=yVRI=XS=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Hi Daniel,

On Wed, Jul 13, 2022 at 7:37 PM Daniel Henrique Barboza
<danielhb413@gmail.com> wrote:
>
>
>
> On 7/13/22 14:30, Jason A. Donenfeld wrote:
> > Hi Daniel,
> >
> > On Tue, Jul 12, 2022 at 05:31:27PM -0300, Daniel Henrique Barboza wrote=
:
> >> CCing qemu-ppc and Cedric for awareness since I forgot to do so in
> >> my reply (=E2=8C=92_=E2=8C=92;)
> >>> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> >
> > Thanks for the review and for forwarding this to qemu-ppc. What's the
> > route this patch needs to take in order to make it into some tree
> > somewhere? Can somebody queue it up?
>
>
> I'll queue it up shortly in my ppc-next tree in Gitlab at
>
> gitlab.com/danielhb/qemu/tree/ppc-next
>
>
> After that I'll send a pull request get it merged with upstream. Probably
> end of this week/next Monday.

Excellent, thanks!

Jason

