Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC7464EE79
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 17:04:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6DBk-0007nm-Pq; Fri, 16 Dec 2022 11:03:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6DBb-0007iR-45
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 11:03:51 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6DBZ-0002tR-L0
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 11:03:46 -0500
Received: by mail-pg1-x52f.google.com with SMTP id s196so2068107pgs.3
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 08:03:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LTaGCV4pu6jCfbJ954D0asXLVHKQkspzG2yqXeV7Myo=;
 b=sJaWdqkkvGVM6wDY5uKd7iwUfKf1akA9lHW7qoN6xrDd+LVCAQ5U4T1fp2JS7yOJFD
 fgKDjrEx9UKP1E/QtII+FTfdwcC14SfWJUSLUg1x6ygaidbBfO+2ERa6ewLSDoWLLWhu
 /z5XU3Dy3AMS/5N42qm7X2lF4Yzj7O73dENeNH5IVZGkEpx2Io8y3LmDaMvYql6Zr7/O
 DpSL9MYknIsEzG1q+5dD2poaCKZFkGQnadygVp6GuFpqSkWoPokQGV5q4oDG1XACsI+0
 VZ8zXRrukuyn9jhDwNqhOq290LPihaaGGFvV216VLEdB6+NnxZ79Xk2mQuA1gbjrK37a
 /xzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LTaGCV4pu6jCfbJ954D0asXLVHKQkspzG2yqXeV7Myo=;
 b=wsGbWKbxWxuEGqYbC21SKiyA1W/iv30iE7+9+RW+N44t6cc+tCiLo5JO5MKd2+JTKk
 soZWyqIC+GqS+GKxpcjzSo1q8A7bINp2K5DIeA9tCO7OSmLyboWDcnUc9wI5ROb885py
 1RO4UZ2u2m6kzFsFQJpQHvG6WhqJ5bixeyiUcq08RWl72NpSl7+FXfZubDlOzrnnD76o
 jzSE7xC9I/fw6STCkHhzgXe1sq9/yajjTJ7sDcVD+tBeiHQuarAozWFq48bLoG1AfQH+
 yU0gpNyuKQ3L/L2RjAX3evwNBW+aqbjbYwwKom2en+zjlkWjZckARE7hm0YVVI/U4d9+
 tlyQ==
X-Gm-Message-State: ANoB5pkOGSdicyrgsZ5NPFk9+h6ooM6GG16N5pRSqU1xAkxikMqHqQiS
 c/CNjoBpFIA/zIC+CTst+5lfBVL+/QgRTBE5mmQISSvEEA/Or8f/
X-Google-Smtp-Source: AA0mqf6FdXN4rxZnVbUv1iyp5RuhU9aaZd6GVUb0Avx60B43trLWvpWl1HbqXmpS9zqv+I+3bjsQfsn5kkd0Em1Q9Os=
X-Received: by 2002:a65:45c5:0:b0:46b:2753:2a60 with SMTP id
 m5-20020a6545c5000000b0046b27532a60mr71587590pgr.192.1671206624061; Fri, 16
 Dec 2022 08:03:44 -0800 (PST)
MIME-Version: 1.0
References: <20221110143459.3833425-1-peter.maydell@linaro.org>
In-Reply-To: <20221110143459.3833425-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 16 Dec 2022 16:03:33 +0000
Message-ID: <CAFEAcA-tvoA1Sd7CQ=YHgVq0wWs5Nc+Z8awJjiyijqEYMBg_zA@mail.gmail.com>
Subject: Re: [PATCH for-8.0 0/2] hw/misc: Convert MOS6522 devices to 3-phase
 reset
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Laurent Vivier <laurent@vivier.eu>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Thu, 10 Nov 2022 at 14:35, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> This patchset converts the TYPE_MOS6522 class and its subclasses to
> use 3-phase reset. This is part of the work I'm doing to clean up some
> of the reset-related code by getting rid of the
> device_class_set_parent_reset() function, which is used by
> legacy-reset subclasses which want to chain to their parent's reset
> function. There aren't very many of these devices in total, and if we
> convert them all to 3-phase reset they can use the 3-phase-reset
> equivalent (resettable_class_set_parent_phases()).  Eventually this
> will then let us simplify the transitional code for handling old-style
> device reset.

I plan to pick these up and send them in a pullreq together
with various other reset-related patches of mine, unless
you'd prefer them to go in some other way.

thanks
-- PMM

