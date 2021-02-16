Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 839C131CC2A
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 15:39:37 +0100 (CET)
Received: from localhost ([::1]:47402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC1Vo-0005u8-KN
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 09:39:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC1Ts-0005Dp-1c
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 09:37:36 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:41171)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC1Tq-0003F9-Fw
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 09:37:35 -0500
Received: by mail-ed1-x52a.google.com with SMTP id v9so8052307edw.8
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 06:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=n5Nx5J2EeeDhrUwEVC+p9XsfTS1a53NMSNwrryztp8I=;
 b=w+JzhmOf+TQcNhVOimUBFbgqACkOxHR9CTUhhDPEjvSOA5ppX95oe91I4QxyHOoQBY
 Pyw+UlBLpdR1MLfmP9DJ309SslrVO2iSpmqnJHYuKF2qgQTRUziKkq8/DVKHoLS81qLT
 Ia/Mi9X6pbCSq+VBhMq0CzlWnMfw5hfKSYLFdqtcdPnMIZhE33+iZhtA5r5Rzg3K/kPB
 F9RKOiQCovesS1RmKKo83pAbGfdI6QqU33bGoTQYwKb+t+ritqyRL0K/0/i0b1VFGwyM
 4jGd+qShiq6DMB9zOXj2W92izjc9QJ8nhnYnL3j0YUgWJ4G4N3pPa43tzYlv46uTBTBb
 6krA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n5Nx5J2EeeDhrUwEVC+p9XsfTS1a53NMSNwrryztp8I=;
 b=DUJHMZYckC4E5yxXwIxSsWycOno5RlnlNW2iCTXfjmFlezOLlau2Op+ThU3dzvAWnK
 hkBu6Z89Hryp+8g/d1pgKWwWno79I0HBvVQemFIsnd9oXUMvpjELCf6vgWaqAeql4uoC
 irujdRMWxS5moUse89d6jEpE8EIHJtA7RjGRtkCPkwyTIV9rAxy5zlTKQFHwo+ePIQDr
 HvNFyayG2LNjF3mPTmCiOeyDz2N18HtjKV9tsdBjB2Qfc/U5SdGmWRLo0v5F6urj1t1y
 EjeRGqQUSMlZcX+mRam4OihctIaMORUC+d0bdhqm7zfCffM0BmsBV/axhXTPIvbyKrwq
 INJA==
X-Gm-Message-State: AOAM531cbd93zcobzWqyDpChtX3GpzfUT6yqxwvqDPTDRxn9os0wypDq
 nPU5iZcOq11tMbXpBGm88f8MA7YtSWGRB6t5wP8UzE4ebMY=
X-Google-Smtp-Source: ABdhPJyfJoiYnNhT8k91yd+0PoHuxbmPi50v9UiSWoDD2U0Er3HeBpZc+9+zGKbU+bkmaEL9KE6Z30MQSjczieUGPqM=
X-Received: by 2002:a50:9e01:: with SMTP id z1mr21064613ede.44.1613486252996; 
 Tue, 16 Feb 2021 06:37:32 -0800 (PST)
MIME-Version: 1.0
References: <20210216110056.1228582-1-thuth@redhat.com>
 <20210216124757.4eb664e9.cohuck@redhat.com>
 <a561530e-d800-67e0-ee2b-fea6efb4638c@redhat.com>
 <20210216153003.16b05725.cohuck@redhat.com>
 <CAFEAcA-B1pXNs8X+mha3x9Ynt83dkmC9sL_XGtextCD3qDXeAQ@mail.gmail.com>
 <5765bde0-f222-4b07-25d4-430b101ef8ff@redhat.com>
In-Reply-To: <5765bde0-f222-4b07-25d4-430b101ef8ff@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Feb 2021 14:37:22 +0000
Message-ID: <CAFEAcA8H=ixwj6PtGSDtEuiADY775o68gk8DZ5PrwOjftqtWtg@mail.gmail.com>
Subject: Re: [PATCH] pc-bios/s390-ccw: Use memory barriers in virtio code
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>,
 qemu-s390x <qemu-s390x@nongnu.org>, Cornelia Huck <cohuck@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 16 Feb 2021 at 14:35, Thomas Huth <thuth@redhat.com> wrote:
>
> On 16/02/2021 15.32, Peter Maydell wrote:
> > On Tue, 16 Feb 2021 at 14:30, Cornelia Huck <cohuck@redhat.com> wrote:
> >> Step 4 in "2.7.13 Supplying Buffers to The Device":
> >>
> >> "The driver performs a suitable memory barrier to ensure the device
> >> sees the updated descriptor table and available ring before the next
> >> step."
> >
> > I thought that my first time through the spec as well, but
> > I think the whole of section 2.7 is dealing with "packed virtqueues",
> > which have to be explicitly negotiated and which I don't think
> > the s390-ccw code is doing.
>
> Right. I think the s390-ccw code is still based on virtio v1.0, that's why I
> also only looked at that version of the spec.

I think the ideal would be to find somebody who's really well
acquainted with the virtio spec (MST?) and ask them to have
a quick look-over the s390-ccw code to say where it needs
changes... The fact that this patch doesn't completely fix
the bug leaves me suspicious that we're missing something in
our readings of the spec.

-- PMM

