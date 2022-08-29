Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7DB5A55C8
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 22:51:12 +0200 (CEST)
Received: from localhost ([::1]:45206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSlix-00057P-Pv
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 16:51:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ricky.zhou@gmail.com>)
 id 1oSlf1-0002tO-3D
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 16:47:14 -0400
Received: from mail-wm1-f49.google.com ([209.85.128.49]:55910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ricky.zhou@gmail.com>)
 id 1oSlez-00039c-D7
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 16:47:06 -0400
Received: by mail-wm1-f49.google.com with SMTP id d5so4805138wms.5
 for <qemu-devel@nongnu.org>; Mon, 29 Aug 2022 13:47:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=pRM5l6sfPfHFA7U4qcxknsEEA52POP03UY/iRMXUa0M=;
 b=Efig4losHmY29HeK+nY035vPwRtv403JqoIAIAWvOEPvCBjZtMg3nUwT6ocwBINXmu
 ITXaEMMIeiWN3ebIe8cPG5WReAcdE4ffI9ygdhiY4FApPInHCMlawTn9qT6q5iUlpQTg
 eC20G+XmA5PkziQ0upcHlXvL3tbYJ+lT1g3V9/fZNpymdz7LDFlpktMjY1EM0OtXgc2x
 bANnbajuVRuHLi58dV3Rs+8/PguNd5bwt0FhfDAgQCAsb0in6sJ4A2WLGOBqYqDKZjx7
 UQEjZd0WQPULszRrixdMRrdGO5PYLVSz1g1yaDCIEdYK1xuqD5Yf53h7NfRNpxd5Yf5W
 JtUQ==
X-Gm-Message-State: ACgBeo3pChDOravSrgQJ2gT0NbHlEubS0el7LSTlQmkAyo/R0slUH4TE
 fLrYUmexOlIOir7ghch1BRqkVMFuytNjs+ZPSgo=
X-Google-Smtp-Source: AA6agR6RaTWXfbQtLINolIivN9Z1CTL5feKZRzke+tY7Yf1wDr/AEholtjbLNF34reiYUag7//Ll8UWLrlwAH64sgCQ=
X-Received: by 2002:a05:600c:28cd:b0:3a5:4f45:b927 with SMTP id
 h13-20020a05600c28cd00b003a54f45b927mr7819898wmd.90.1661806022008; Mon, 29
 Aug 2022 13:47:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220829142326.39562-1-ricky@rzhou.org>
 <20220829142326.39562-2-ricky@rzhou.org>
 <a0972b9f-7fbc-8403-6db6-cb30b741d247@linaro.org>
In-Reply-To: <a0972b9f-7fbc-8403-6db6-cb30b741d247@linaro.org>
From: Ricky Zhou <ricky@rzhou.org>
Date: Mon, 29 Aug 2022 13:46:50 -0700
Message-ID: <CAFoVXjgHBPs8XhOqLN9BpD1-GN7Amsor5o660WOmBdQ54dxW5w@mail.gmail.com>
Subject: Re: [PATCH 1/1] target/i386: Raise #GP on unaligned m128 accesses
 when required.
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.128.49; envelope-from=ricky.zhou@gmail.com;
 helo=mail-wm1-f49.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
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

On Mon, Aug 29, 2022 at 9:45 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 8/29/22 07:23, Ricky Zhou wrote:
> This trap should be raised via the memory operation:
> ...
> Only the first of the two loads/stores must be aligned, as the other is known to be +8.
> You then must fill in the x86_tcg_ops.do_unaligned_access hook to raise #GP.
Thanks for taking a look at this - did you see the bit in the cover
letter where I discuss doing this via alignment requirements on the
memory operation? My logic was that the memop alignment checks seem to
be more oriented towards triggering #AC exceptions (even though this is
not currently implemented), since qemu-user's unaligned access handlers
(helper_unaligned_{ld,st}) already trigger SIGBUS as opposed to SIGSEGV.
I was concerned that implementing this via MO_ALIGN_16 would get in the
way of a hypothetical future implementation of the AC flag, since
do_unaligned_access would need to raise #AC instead of #GP for that.

One slightly more involved way to use alignment on the MemOp could be to
arrange to pass the problematic MemOp to do_unaligned_access and
helper_unaligned_{ld,st}. Then we could allow CPUs to handle
misalignment of different MemOps differently (e.g. raise #GP/SIGSEGV for
certain ops and #AC/SIGBUS for others). For this change to x86, we could
maybe get away with making MO_ALIGN_16 and above trigger #GP/SIGSEGV and
everything else trigger #AC/SIGBUS. If that's a little hacky, we could
instead add some dedicated bits to MemOp that distinguish different
types of unaligned accesses.

What do you think? Happy to implement whichever approach is preferred!

Thanks,
Ricky

