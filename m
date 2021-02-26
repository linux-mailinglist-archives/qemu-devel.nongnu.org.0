Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1B1326728
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 19:58:23 +0100 (CET)
Received: from localhost ([::1]:54944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFiJi-0003b6-QF
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 13:58:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lFiIw-0003AW-HV
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 13:57:34 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:40235)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lFiIu-0004zT-Tt
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 13:57:34 -0500
Received: by mail-ej1-x62b.google.com with SMTP id u20so16560065ejb.7
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 10:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G+UhYcLHBOukE8OvsJD/XDFIIlD46niw26xKg8q77yU=;
 b=Uw7+Rye7GCUBWKjFECFwAZ/EKd1cCPldBLdn/sH6SSDVV/nehQtrDgGp8EYgdE9dcb
 lEzIsNSZrejKN+93UNdHhpMO7xQLnB+upDrISTq4mgYpzSgI5Kiq84fl5rNvK7kgjYMB
 RGHh1pgBQpmC42srNqTRoZPftQcgAox21lM9V0NedFxPHg8OHU3fBUydbc3VRdpadWjd
 wogVntyBxFMLaznvo+hV2f2nKFyn/OyCCtjx3+9ssWgtR7GpNCjiRI7z0I1bXoGUealv
 KQsVl9SwT2+xZ/zqn4MwPQaECnQVBRIMM3BCYG6ROavEE61X3zHzHGTBVusw4gt6jGWs
 S8Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G+UhYcLHBOukE8OvsJD/XDFIIlD46niw26xKg8q77yU=;
 b=UQWBLpU98b0A0fO/1fx6XdqtucV5I0sNB4txIdAEEkJfb/YfAPdvgKGjtVyb3WjcMk
 akl0D9H8co7VKCwD9iznnhpDKanyjScergsCc+MvJoGnAG8qTsf4SXFZxPt62jBzHBL9
 RwWoBysuusEOxwpTUcQIkAAG8Gl61+12qPzNYan5Hr2NRnnfhslFdUGz0vWdxoeQYbi+
 X8vZPxpP38ShTbRaozNDh/f9j6z0SZX/K+DLWdKkVMUKMY+O/cPYZYGF7tff4giOwJEO
 QK4aSJknAihKYF3hJFW7KBc9C56+IW6MhtAMt6sTvr94PR/h3AmEStvnYOsceNKZ6HG9
 9pvw==
X-Gm-Message-State: AOAM531KdcWXx0Ivnva0Z0c37eRb8hoqoauukd9nFBmbZrf13OxJaZjX
 uVnQGaJjRkeGbxRrbBzCTZAc95R4uarvNsil86KCRg==
X-Google-Smtp-Source: ABdhPJzjEeQPi0A2TkHLJgruhieAA/td88OJdRHxhczWc2KDExpSlQpFIOEH1f/V8uGCYtoHjjZ7f1RXD7qIlYPnkQM=
X-Received: by 2002:a17:906:1ecc:: with SMTP id
 m12mr4971042ejj.4.1614365850496; 
 Fri, 26 Feb 2021 10:57:30 -0800 (PST)
MIME-Version: 1.0
References: <1614333786-74258-1-git-send-email-bmeng.cn@gmail.com>
 <1614333786-74258-2-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1614333786-74258-2-git-send-email-bmeng.cn@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Feb 2021 18:57:19 +0000
Message-ID: <CAFEAcA_XV=xkZriO61zwb8OCDbKfUQ=oQFCoKyCJyPh0rt0dUQ@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] net: Pad short frames to minimum size (60 bytes)
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
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
Cc: Jason Wang <jasowang@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 26 Feb 2021 at 10:03, Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> The minimum Ethernet frame length is 60 bytes, and we should pad
> frames whose length is smaller to the minimum size.
>
> This commit fixes the issue as seen with various ethernet models,
> that ARP requests get dropped, preventing the guest from becoming
> visible on the network.
>
> The following 2 commits that attempted to workaround this issue
> in e1000 and vmxenet3 before, should be reverted.
>
>   commit 78aeb23eded2 ("e1000: Pad short frames to minimum size (60 bytes)")
>   commit 40a87c6c9b11 ("vmxnet3: Pad short frames to minimum size (60 bytes)")
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---

Is it better to do this here, or in the places which create
network packets? Doing it centrally has the advantage of
being just one place to change which then means senders
and receivers don't need to think about it. On the other
hand it means we don't have any equivalent of really actually
sending a short frame and having the modelled ethernet device
implement the handling of the short frame.

thanks
-- PMM

