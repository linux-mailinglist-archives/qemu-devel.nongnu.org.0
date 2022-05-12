Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08365524D8F
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 14:53:34 +0200 (CEST)
Received: from localhost ([::1]:49276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1np8Jx-00025J-5T
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 08:53:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1np8Go-00071z-2V; Thu, 12 May 2022 08:50:20 -0400
Received: from mail-yw1-f178.google.com ([209.85.128.178]:45325)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1np8Gm-0000AB-8s; Thu, 12 May 2022 08:50:17 -0400
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-2f7bb893309so54763477b3.12; 
 Thu, 12 May 2022 05:50:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tNZaIfsZFQiUsoybA2P7UuRHj00q7OMkgFr2e8S75ZA=;
 b=O3pFwm89Lx395AwM2cgjuwLc1sKBLDp/w+wml46rPBTZdJAg/vVvL07lvitgk+rrfe
 T65Wl4/WUZsFVIOahq3HaTsH1FC4CGFCfG9LBipQkp52N9hyYUHcADlT+VUYDRUCz6q0
 FXL3plHByBFgviGRmRb4nyz1boiY01caXZf9RWb16dUz4Xc/Z2ndzkOU4iYtjjs/uEyu
 9HZ3tLM2Lcy1lCfJugxJrQirm9CbyUTeaBDhxSJ7mF/2e1UXeQtZQypo/m4uJqLbudTI
 yr5pZQnhtLdnifzMjiEu220GDrx8VP5UI08AMlB/POzWLlb+BkJivXMSUpoeKl2lnL/3
 x6Dw==
X-Gm-Message-State: AOAM530dIPxjaqucI4fCJaHa7i2EtoduTacjjLe60DXFpMIX/N/lE1is
 X9N+nbIu/S5CvbEoO1/6I1bcF1djbsShW+A7DrM=
X-Google-Smtp-Source: ABdhPJzcxASBr3U/MSYZuBClq8yFQFNjymakliJMtv4gw8olgOmdxVo0o5g6Ne2r8VgU7t4gcMOaok8qWOcNUT4NWgg=
X-Received: by 2002:a81:784a:0:b0:2f7:d9fd:396f with SMTP id
 t71-20020a81784a000000b002f7d9fd396fmr31804970ywc.124.1652359813450; Thu, 12
 May 2022 05:50:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220510151020.105528-1-kwolf@redhat.com>
 <20220510151020.105528-3-kwolf@redhat.com>
 <41c8f1d4-be27-4110-33c0-b53a701a9cb6@yahoo-corp.jp>
In-Reply-To: <41c8f1d4-be27-4110-33c0-b53a701a9cb6@yahoo-corp.jp>
Date: Thu, 12 May 2022 14:50:02 +0200
Message-ID: <CAAdtpL7+g7tLHt5zbq7LGogXA4Qv+75Big4QupTwe=fUzHa+NA@mail.gmail.com>
Subject: Re: [PATCH 2/2] coroutine: Revert to constant batch size
To: =?UTF-8?B?5oiQ5bedIOW8mOaouQ==?= <hnarukaw@yahoo-corp.jp>
Cc: Kevin Wolf <kwolf@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>, 
 Stefan Hajnoczi <stefanha@redhat.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-stable <qemu-stable@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.128.178;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-yw1-f178.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= via <qemu-devel@nongnu.org>

Hi Hiroki,

On Thu, May 12, 2022 at 8:57 AM =E6=88=90=E5=B7=9D =E5=BC=98=E6=A8=B9 <hnar=
ukaw@yahoo-corp.jp> wrote:
>
> Thank you for your fix.
>
> I confirmed that after applying this patch, my intended performance
> improvement by 4c41c69e is still kept in our environment.

Is that equivalent to a formal
Tested-by: Hiroki Narukawa <hnarukaw@yahoo-corp.jp>
tag?

> On 2022/05/11 0:10, Kevin Wolf wrote:
> > Commit 4c41c69e changed the way the coroutine pool is sized because for
> > virtio-blk devices with a large queue size and heavy I/O, it was just
> > too small and caused coroutines to be deleted and reallocated soon
> > afterwards. The change made the size dynamic based on the number of
> > queues and the queue size of virtio-blk devices.
> >
> > There are two important numbers here: Slightly simplified, when a
> > coroutine terminates, it is generally stored in the global release pool
> > up to a certain pool size, and if the pool is full, it is freed.
> > Conversely, when allocating a new coroutine, the coroutines in the
> > release pool are reused if the pool already has reached a certain
> > minimum size (the batch size), otherwise we allocate new coroutines.
> >
> > The problem after commit 4c41c69e is that it not only increases the
> > maximum pool size (which is the intended effect), but also the batch
> > size for reusing coroutines (which is a bug). It means that in cases
> > with many devices and/or a large queue size (which defaults to the
> > number of vcpus for virtio-blk-pci), many thousand coroutines could be
> > sitting in the release pool without being reused.
> >
> > This is not only a waste of memory and allocations, but it actually
> > makes the QEMU process likely to hit the vm.max_map_count limit on Linu=
x
> > because each coroutine requires two mappings (its stack and the guard
> > page for the stack), causing it to abort() in qemu_alloc_stack() becaus=
e
> > when the limit is hit, mprotect() starts to fail with ENOMEM.
> >
> > In order to fix the problem, change the batch size back to 64 to avoid
> > uselessly accumulating coroutines in the release pool, but keep the
> > dynamic maximum pool size so that coroutines aren't freed too early
> > in heavy I/O scenarios.
> >
> > Note that this fix doesn't strictly make it impossible to hit the limit=
,
> > but this would only happen if most of the coroutines are actually in us=
e
> > at the same time, not just sitting in a pool. This is the same behaviou=
r
> > as we already had before commit 4c41c69e. Fully preventing this would
> > require allowing qemu_coroutine_create() to return an error, but it
> > doesn't seem to be a scenario that people hit in practice.
> >
> > Cc: qemu-stable@nongnu.org
> > Resolves: https://bugzilla.redhat.com/show_bug.cgi?id=3D2079938
> > Fixes: 4c41c69e05fe28c0f95f8abd2ebf407e95a4f04b
> > Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> > ---

