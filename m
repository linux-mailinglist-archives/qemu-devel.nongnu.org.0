Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CAAC69F86B
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 16:56:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUrRq-0005FO-MY; Wed, 22 Feb 2023 10:54:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pUrRo-0005Er-GQ
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 10:54:24 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pUrRn-0007zS-04
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 10:54:24 -0500
Received: by mail-pl1-x62f.google.com with SMTP id bh1so9231630plb.11
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 07:54:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fNw59v5D97ShWX01chUaQiZTxCzNg+317r/ICoKXqv8=;
 b=gdn4VJyq/yX7iBxe0EZfXMWPRqkGLhDfSMzY1fkpNrCwNcDyiVMlr+bVXtznuWGJc9
 tLzTjN3S7DKVrwnTyGkzlYXniXCTjPyqiIw/BeTBOnATTIvmQfPQnNFzJ4tz83H8/3Xc
 JMJ7PufP3rud8VCR7X1QmUjhFKUxTmWf+48SNqssCGq/7PwUkpyVr++U8Uf7KJy8HZJ+
 D2C7HD/evBqj5v38oPZTpP5HctUVmrMnaLwSTQTcO5MC+UNr8BFlF5UeWgw9/EYnUvIe
 g+w/DCM5ReHxk2Y2HSNqA99nYQ55V9voSBkSrXOZXEjfb+ntrlP1SrGLZvaVOWUPgSnX
 +0tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fNw59v5D97ShWX01chUaQiZTxCzNg+317r/ICoKXqv8=;
 b=KM+bC+yoMlwtwdEbBHiMsd2zzDtFbT/quF0el3ocTCmpsn4kngdK5Rt4eNNsLsBmQm
 1IljsO4QKLQHI5vEuslaYlG25EkuDV1f78CdbBKLpvMzTbx8MQtQIyb+Qt8iR8m67Xve
 RCpB3vi3nt7swZexbuPrnbTGX6yciApWigMHcMtpdG2DE5dGo4D4wnOT3QtiHlLin8/n
 hNG4KmOFpzyKiZxGwWy8tyH0oaEvsKre6tFjVaPOAYPz9GXDcuj4zj3XW9zM8F7RGX9n
 FDhqpucZJ3ceV52ugFAyimvsDBDKCWYA8B6Exq+DkqkuQKnuz7uK7u0RpEY04PZt6fJj
 KX1g==
X-Gm-Message-State: AO0yUKXRdpmoh2NV0xgGpJMPjObdpo8qyeJV1sLz8donkL5ykWcOeWuW
 05QDprhTj4p905axa3hzZeVzA3fe15oXaaAF2Xa3rA==
X-Google-Smtp-Source: AK7set+LfOyum+BIB+taa/9pV9SebyybcgNGTXJHYG0btT9+gnMkHcnihmY/oz7tz/uv3ab/q+2s1OjZYc7TGBzP3t4=
X-Received: by 2002:a17:903:2684:b0:19a:9580:7130 with SMTP id
 jf4-20020a170903268400b0019a95807130mr1133679plb.13.1677081261054; Wed, 22
 Feb 2023 07:54:21 -0800 (PST)
MIME-Version: 1.0
References: <20230213003925.40158-1-gshan@redhat.com>
 <20230213003925.40158-6-gshan@redhat.com>
 <CAFEAcA_6pYvot1AGKfOQA89M9tdH-e6+9jkd3RtXJkGhSLdihA@mail.gmail.com>
 <0db2764b-7d27-ee6a-c7e4-7d7821986c16@redhat.com>
In-Reply-To: <0db2764b-7d27-ee6a-c7e4-7d7821986c16@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 22 Feb 2023 15:54:09 +0000
Message-ID: <CAFEAcA_WjugivvOWxH-bVSNakPWyhX=j5pWydQQpweDVDYd2jw@mail.gmail.com>
Subject: Re: [PATCH v1 5/6] hw/arm/virt: Enable backup bitmap for dirty ring
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, pbonzini@redhat.com, 
 peterx@redhat.com, david@redhat.com, philmd@linaro.org, mst@redhat.com, 
 cohuck@redhat.com, quintela@redhat.com, dgilbert@redhat.com, maz@kernel.org, 
 zhenyzha@redhat.com, shan.gavin@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62f.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 22 Feb 2023 at 04:36, Gavin Shan <gshan@redhat.com> wrote:
>
> On 2/22/23 3:27 AM, Peter Maydell wrote:
> > Why does this need to be board-specific code? Is there
> > some way we can just do the right thing automatically?
> > Why does the GIC/ITS matter?
> >
> > The kernel should already know whether we have asked it
> > to do something that needs this extra extension, so
> > I think we ought to be able in the generic "enable the
> > dirty ring" code say "if the kernel says we need this
> > extra thing, also enable this extra thing". Or if that's
> > too early, we can do the extra part in a generic hook a
> > bit later.
> >
> > In the future there might be other things, presumably,
> > that need the backup bitmap, so it would be more future
> > proof not to need to also change QEMU to add extra
> > logic checks that duplicate the logic the kernel already has.
> >
>
> When the dirty ring is enabled, a per-vcpu buffer is used to track the dirty pages.
> The prerequisite to use the per-vcpu buffer is existing running VCPU context. There
> are two cases where no running VCPU context exists and the backup bitmap extension
> is needed, as we know until now: (a) save/restore GICv3 tables; (b) save/restore ITS
> tables; These two cases are related to KVM device "kvm-arm-gicv3" and "arm-its-kvm",
> which are only needed by virt machine at present. So we needn't the backup bitmap
> extension for other boards.

But we might have to for other boards we add later. We shouldn't
put code in per-board if it's not really board specific.

Moreover, I think "we need the backup bitmap if the kernel is
using its GICv3 or ITS implementation" is a kernel implementation
detail. It seems to me that it would be cleaner if QEMU didn't
have to hardcode "we happen to know that these are the situations
when we need to do that". A better API would be "ask the kernel
'do we need this?' and enable it if it says 'yes'". The kernel
knows what its implementations of ITS and GICv3 (and perhaps
future in-kernel memory-using devices) require, after all.

thanks
-- PMM

