Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D056130BC36
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 11:40:51 +0100 (CET)
Received: from localhost ([::1]:54646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6t74-0000B8-V8
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 05:40:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6t5s-000867-Q6
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 05:39:36 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:45574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6t5r-000899-6t
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 05:39:36 -0500
Received: by mail-ej1-x633.google.com with SMTP id b9so9565725ejy.12
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 02:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4+RkjWW8jkMS4qVVsrgqauWLA57gigTXQ55afsDtELQ=;
 b=EkXX7ll4yCQRCfSL59yXwm7EQM+1so8XZL8O6OcmQAthSnQYFQzomlgzHuV/ByyuZM
 Y1XteH0Ng7rl4MUobRLc4IqTJjgc/4liDExd5CuPEiFZmCtfYZ4MK3MpiOUZwNHEpSpi
 zTBdKRjYtn0FWV8YJFkymoIeTPzEfSFsCFImcD8ToFQHDwZHVipO+JTfY5wcaYfwCnS+
 0ocvwoTFDPWjjvfcxXcagDM0ub0ATiSc2vkLMv2VdtmA4/arF4jRYQdqkJHmrO+kisgn
 E64W50uiTDtJVz6zCRUqx/tFoh96CEcrMICQhJKmRWWTDy2xkChBVWcTuip844TeU5cZ
 kpog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4+RkjWW8jkMS4qVVsrgqauWLA57gigTXQ55afsDtELQ=;
 b=a6Lw5BI4uA4sQ6zvQFWnLrC8CGigvMYrt62sM8cPq2qzgDyid8KKioLJLRtEf193D/
 zvGnOFUFkWbZEDrEU88uiL0ZVoBe5bzCVRl5KvY8hC7Q1OqRa3UCggoTQBHI5PVKScUA
 GnYn7J91nN8rHshiEf3WT9DfjlVHCJl3QAj4r7XCaxb22VJPZkH9qodnsPzN2yBqgeDa
 9vveKq9h4erRKV2UyQnsaf4+k4ii5h5GGUtzhexxmZ8LuF3nX0Re2aD/ed/U3Rs4Yuma
 z9z7u1xvql327TutlCsBhFvxQR4PFxqfeJC8N6zCpUy6ksTL5u7LUtd71AQCugdX+BQs
 D+kw==
X-Gm-Message-State: AOAM533EAXHJkDGDAPMqcE3DYOx1A5Ok06Snfoeo0J5bQuageSOZ06iA
 kuOPxoa5fW/T3bCRHwoNV1D7PTc7kuDdWOh0yAFhUQ==
X-Google-Smtp-Source: ABdhPJzfi6+yD+yXTL7t3+uJGLyhrrMOYLbmTC8s8LsqAPyKUrRWFiFWzSoelnuf+cr7Oy8LDp8CGYIJSKK44meNMSo=
X-Received: by 2002:a17:906:3603:: with SMTP id
 q3mr21159350ejb.382.1612262373697; 
 Tue, 02 Feb 2021 02:39:33 -0800 (PST)
MIME-Version: 1.0
References: <20210124025306.3949-1-leif@nuviainc.com>
In-Reply-To: <20210124025306.3949-1-leif@nuviainc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Feb 2021 10:39:22 +0000
Message-ID: <CAFEAcA8M2TcRoAyXph1CvX5gOiMqWusV35ygkxOxZy_H_P5upg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/4] hw/intc: enable GICv4 memory layout for GICv3
 driver
To: Leif Lindholm <leif@nuviainc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 24 Jan 2021 at 02:53, Leif Lindholm <leif@nuviainc.com> wrote:
>
> GICv4 sets aside 256K per redistributor configuration block, whereas GICv3
> only uses 128K. However, some codebases (like TF-A, EDK2) will happily use
> the GICv3 functionality only.
>
> This set aims at enabling these codebases to run, without actually enabling
> full support for GICv4.
>
> This creates a ... problematic ... system, which will misbehave if you try
> to use the virtual LPIs. But it does help with letting me use QEMU for
> modelling a platform containing a GICv4, and share firmware images with
> other prototyping platforms.

So, what's your aim for this series? I think we could reasonably
take patches 2 and 4 upstream (they are changes we'll want for eventual
v4 emulation support), but I don't really want 1 and 3.
That would reduce the delta you're carrying locally, at least.

I suppose we should look at what changes QEMU needs for KVM in-kernel GICv4
support at some point...

thanks
-- PMM

