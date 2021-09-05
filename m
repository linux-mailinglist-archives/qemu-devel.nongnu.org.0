Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA804010E5
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 18:31:02 +0200 (CEST)
Received: from localhost ([::1]:35374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMv2r-000393-3g
	for lists+qemu-devel@lfdr.de; Sun, 05 Sep 2021 12:31:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mMv1q-0002NK-UF
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 12:29:58 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:52061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mMv1n-0005GX-8Z
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 12:29:58 -0400
Received: by mail-wm1-x32b.google.com with SMTP id n39so1156728wms.1
 for <qemu-devel@nongnu.org>; Sun, 05 Sep 2021 09:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ffO5cqkdn1S25PaGabDPyVZmSTKtt5MRfQGynGf4bZQ=;
 b=pn1CVCdDYy26Lp5m90eA1EROC/1f2iax0815ARk1ANWVTBSpj/2tPRv5D67zuPVIm0
 mD+l0lnj89x7NJgS5UkdLh3bjA/2OMHk4IOPbrLf67tQVnXiFPfHro7e6QxosIpkMvgF
 ay9TgmH6JeXt7wUGlWHcaFc00ZMw0gdn7+AOs9c9UM8ayyU3zPqWNHnvO6kfbPHNRsVK
 y8wdEunBJH9rg0w2PZtfKkbabxqSfCvJBe5De8jyP7X6Gaf7YG+BOLDKGTd3wSb3w0GM
 2RPBKjIPcGcVM/C7EOSLZr7kDwuNMBmmAysGw4yVVNVN6+bMLv25mGr8Ox9Qp3Qz0UKj
 FrGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ffO5cqkdn1S25PaGabDPyVZmSTKtt5MRfQGynGf4bZQ=;
 b=aV+YSQuWnU7TqiI0e+z+ckbPt2XMtTeJLeNIJqK7teD1FWJOY/bDsvTSpVTaP7f9eM
 wgwDRBFxA1QZQUJ2n8y5a9UZHONW3ToHgFC3ZtNq7pRNl4dDVgICVLuufUmN17RfHhRL
 HsWJyj1+Pbdzu+NdTo2ZAsXOFpnviiZp5w2d4q3fZhMp3wbSNJ21QU60bFR8NyiBTmgF
 3FkCw+odsozXz6DowrMVujzx1Y4NByZX0o7IHD/U84BjFBQpZMsW9ZbBFbt2TKMVJ0Tl
 uaIMkynE81nWrDYfGaMjZ+3L0RFStODx7OX3tuXscQL7fg0jW/xPSsiXxRlFSDVON89g
 cJUg==
X-Gm-Message-State: AOAM530KICnNKHjxqA1eWCMeag44+XL9IUbEb5vimgyPhWpkwUxxqxsD
 nIr+CEm79aJYIXQdr8OjvHwkcGuKtQfC6aT9607gBQ==
X-Google-Smtp-Source: ABdhPJz5sBewh00As7vERJnTmQZZSdk/oDHqLrx6DJvjPASMZo+dZRwQAo01Bs7ti1KmwMNWKXqLUBc5j4Red4lqsY0=
X-Received: by 2002:a05:600c:19d0:: with SMTP id
 u16mr2581249wmq.21.1630859393581; 
 Sun, 05 Sep 2021 09:29:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210905154049.7992-1-bmeng.cn@gmail.com>
In-Reply-To: <20210905154049.7992-1-bmeng.cn@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 5 Sep 2021 17:29:04 +0100
Message-ID: <CAFEAcA8frUy2wmQjj=Bk_GGT9O=qHzb5pjSFupc7SaEyDUvYZg@mail.gmail.com>
Subject: Re: [PATCH] softmmu/memory: Validate {read,
 write}_with_attrs before calling
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 5 Sept 2021 at 16:40, Bin Meng <bmeng.cn@gmail.com> wrote:
>
> {read,write}_with_attrs might be missing, and the codes currently do
> not validate them before calling, which will cause segment fault.
>
> Fixes: 62a0db942dec ("memory: Remove old_mmio accessors")
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

This 'fixes' tag doesn't seem quite right. Before that
commit 62a0db942dec, we still required that a MemoryRegionOps
provided some form of both read and write. It was never
valid to leave all of the possible read function pointers NULL.

What are the examples of devices which are deliberately leaving
these pointers set to NULL?

Last time this came up, we discussed the other option, which
is to have memory_region_init assert that the MemoryRegionOps
defines at least one valid read and one valid write pointer,
so that these bugs get caught quickly rather than only if the
guest accesses the device in the wrong way. I tend to think
that that is better, because for any particular device
it's not necessarily the right thing to return MEMTX_ERROR
(maybe the right behaviour is "return 0 for reads, ignore
writes" -- the point is that there is no single default
behaviour that works for every device and architecture).
Forcing the device model author to explicitly write the
code means they have to think about what the behaviour
they want is.

If we do choose to support allowing MemoryRegionOps structs
to leave all the pointers NULL, we should document that,
including what the default behaviour is.

thanks
-- PMM

