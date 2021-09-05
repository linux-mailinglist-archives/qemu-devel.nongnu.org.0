Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F4F4010F2
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 18:56:12 +0200 (CEST)
Received: from localhost ([::1]:57572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMvRD-000268-6D
	for lists+qemu-devel@lfdr.de; Sun, 05 Sep 2021 12:56:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mMvPs-0001Og-KF
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 12:54:48 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:45713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mMvPq-00010T-Qt
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 12:54:48 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 j17-20020a05600c1c1100b002e754875260so3110625wms.4
 for <qemu-devel@nongnu.org>; Sun, 05 Sep 2021 09:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xofhR5uET/8b060Kt3RhYHDT8iUcG66AwC75m2Km3zI=;
 b=EIDjwcbBjRL5Q8s6YpNU9HaxqGkeH3uTAExTy+vpN4MDKmxmNYm3HmXJbkzdFEDsIH
 1OOKA00rFHdhWvumH9tHRoojWgOPyBdx65O5iEDTkJkoMSis9VnkofaD+BySlNae0sqE
 MiyV7CvzQHv6clF+AkSY21TTtBuUKwK1S17u3csiIOFOAGcA1sD/P3ieHKfcK48oWZRH
 oslv+6ITWItzWJsuXfCBwUP0/daLuAWMMjwtA6TFPW9geBY/L3u7qKlP8gqxSFOPjlXl
 5liPAJ0fWuwS7IHswXCOQhp/OqIW0uJ+L95FX/kAwp5Ndprpl9BrMqlL/8MDBB/RoVcE
 7BCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xofhR5uET/8b060Kt3RhYHDT8iUcG66AwC75m2Km3zI=;
 b=ctjCXFUloGUxb53EXAa88cYTTQ470/rC8eOCHnaJVMQEsofGYeYODu5nZhkkryKaGn
 xT1IMWY4P92udxmhaif+MvXyvFbaOMnZReceAIuHgvDx8Ts+lWh85ec99wsJ3acDI0Ih
 V8kGMBRYmhj3gG0W+j9YI5L0ZiiuLECODpgAzvFwAMT6Lwm/ArLH6xUUM2uCYPAt1cp4
 FwuTh4riKSNSJD4YulUJgRBpHI6bV/zEOzO+RwbQQbtC/4hOy+Q/7mxRSqmJ9OI/bD+i
 VKF6HXMQLx0bApcbcHQvW/fhGVJnVpJGH1QcF0j/GnLoEQ3Rup2D0eOATluuG8fTsRUF
 vl5w==
X-Gm-Message-State: AOAM531JEYHI0RM7zJmyrO5rI/4pzqnkvh7xaD5kM0ITw0gCNYQPQTfw
 gtt6+PIuymTrZu6k1kgiU7/1awe8i2tluNqqz4a23Q==
X-Google-Smtp-Source: ABdhPJyEsQOtbxLMyj98DyZo5YbvzeclsTGl/zPyl5jfTiayogRVXbr59z73Cpq81iWAKgb9c1CuG9sGTDRAvm+Ecas=
X-Received: by 2002:a05:600c:19d0:: with SMTP id
 u16mr2653103wmq.21.1630860885135; 
 Sun, 05 Sep 2021 09:54:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210905154049.7992-1-bmeng.cn@gmail.com>
 <CAFEAcA8frUy2wmQjj=Bk_GGT9O=qHzb5pjSFupc7SaEyDUvYZg@mail.gmail.com>
 <CAEUhbmVjuYhk=Ebh6VeaPtC816Dssys3g8+dwMo5rv4yHMeHSg@mail.gmail.com>
In-Reply-To: <CAEUhbmVjuYhk=Ebh6VeaPtC816Dssys3g8+dwMo5rv4yHMeHSg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 5 Sep 2021 17:53:56 +0100
Message-ID: <CAFEAcA9JDN-bGSyjqauKsjJH43TUwk7YTSN0mSvPg9obd9yCUw@mail.gmail.com>
Subject: Re: [PATCH] softmmu/memory: Validate {read,
 write}_with_attrs before calling
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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

On Sun, 5 Sept 2021 at 17:49, Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Mon, Sep 6, 2021 at 12:29 AM Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > On Sun, 5 Sept 2021 at 16:40, Bin Meng <bmeng.cn@gmail.com> wrote:
> > >
> > > {read,write}_with_attrs might be missing, and the codes currently do
> > > not validate them before calling, which will cause segment fault.
> > >
> > > Fixes: 62a0db942dec ("memory: Remove old_mmio accessors")
> > > Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> >
> > This 'fixes' tag doesn't seem quite right. Before that
> > commit 62a0db942dec, we still required that a MemoryRegionOps
> > provided some form of both read and write.
>
> Did you mean before commit 62a0db942dec leaving MemoryRegionOps NULL
> was not allowed, but things changed so that now it's possible to have
> NULL MemoryRegionOps? If yes, then the commit id of "Fixes" should
> probably go to the changes that allowed NULL memory ops. If not, I
> don't think "Fixes" tag is wrong.

I mean that before commit 62a0db942dec leaving the pointers all
NULL was not allowed, and after that commit leaving the pointers all
NULL was still not allowed. It's been a requirement that you
provide at least one function pointer for read and one for
write ever since the MemoryRegion APIs were introduced in 2012.
You're proposing an API change; it might be a good one, but it
isn't a 'Fixes' to anything.

-- PMM

