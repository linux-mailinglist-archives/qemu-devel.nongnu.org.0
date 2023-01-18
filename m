Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40954672087
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 16:05:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI9zJ-0003ee-Nx; Wed, 18 Jan 2023 10:04:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pI9zF-0003bv-UI
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 10:04:26 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pI9zC-0007is-JZ
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 10:04:25 -0500
Received: by mail-pj1-x1032.google.com with SMTP id q64so36048709pjq.4
 for <qemu-devel@nongnu.org>; Wed, 18 Jan 2023 07:04:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kd9+V7ZRlXGnYXskOGGGSl8CVPf2TRZzoIuwIZRzvPg=;
 b=ClQqpGilsu8jFE9JkyDsMo7NEJuEGxD60Y+phlWeRVvIeG6Oy/4Kf9GQiOg6rqPBrF
 WHOdg9/2YxgVBk33qX5inpJyhgnDIr7//tuXPrwadpgxZk5VIQv29hopzCtP3LctXeN5
 QF7GR/Z7SVP1n0s6kC+v79+4Ntrq4yEpgZGuYo1g7WkurzhR8HxUz6qA7Pi63RYTSrHL
 WmFJOb9689CA5AKwhX5n62qZnoDIWLMun1HmTJDANZ4Th8qZyOXgcAExa5o8GQAzz50a
 9r2jb1xMcvzJik9YdUnsYyOxvW+71S8nQcTP7DCzqhIhNNojQScXYWaD+LVPw5B47r1f
 8kIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kd9+V7ZRlXGnYXskOGGGSl8CVPf2TRZzoIuwIZRzvPg=;
 b=0UPddtMq6r6hmPCApPVsIOFNKK/yB/cXBlAfR1ZdebK8thBeJY5QucPhEYDXUXwztW
 WApbiWoRiJkQbeTQirOWOFWiUJEspfit6mbkYOI9uCzNpIvxT73nG//MkGQ5/axYuIQW
 /GAXj9ebI0N4hQeB6KPYMMyJ0HQiKj8AVUD7TMf1Y5ZJbKkbw35zLChXZ1LxJPJDxB9p
 Pl93my3EwNzUB+2NX7UBo/ANI13a3HchPnEmg/ipmk/K4XVrrqoxEJ/aA301Eu2HAjkY
 o2UhsyG+5bCrVjJffPDk9rj/SpjDsY3kJaAxq1L0f6DrPmziMCNkGwOn3bdWfAq+s+P1
 yGgg==
X-Gm-Message-State: AFqh2kpEF5KPAQoLpOqLOF9dzCt9BmLxA/4xsL5Yq76e85UQW/GquydC
 7gX/MPn3PMmxE2IqsCLRRFlaGLwTzt/6VBPgpCN1Hg==
X-Google-Smtp-Source: AMrXdXtmzOopxMEci5Lyj8vQDPwKXtgtHDIJ6gIXNg2ZPsBwOzdyQqOz4SPpKvq7UFwLMfl90byIi6/eeYbSuMp5F7I=
X-Received: by 2002:a17:90a:ea92:b0:229:189b:6fee with SMTP id
 h18-20020a17090aea9200b00229189b6feemr708619pjz.221.1674054258223; Wed, 18
 Jan 2023 07:04:18 -0800 (PST)
MIME-Version: 1.0
References: <Y8AG21o/9/3eUMIg@cormorant.local>
 <Y8W+H6T9DOZ08SoF@cormorant.local>
 <Y8Yq5faCjAKzMa9O@kbusch-mbp> <20230117160933.GB3091262@roeck-us.net>
 <CAFEAcA9pS7P=SvKsOtRHPtkrNAD8LF2ZpFJ870G3B-rhWYap4g@mail.gmail.com>
 <20230117192115.GA2958104@roeck-us.net>
In-Reply-To: <20230117192115.GA2958104@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 18 Jan 2023 15:04:06 +0000
Message-ID: <CAFEAcA_T8QqSg4SzszP+wR3pR1P1WTZg4f7mHHBGRw4UrTw+DQ@mail.gmail.com>
Subject: Re: completion timeouts with pin-based interrupts in QEMU hw/nvme
To: Guenter Roeck <linux@roeck-us.net>
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Jens Axboe <axboe@fb.com>, 
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 linux-nvme@lists.infradead.org, 
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1032.google.com
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

On Tue, 17 Jan 2023 at 19:21, Guenter Roeck <linux@roeck-us.net> wrote:
> Anyway - any idea what to do to help figuring out what is happening ?
> Add tracing support to pci interrupt handling, maybe ?

For intermittent bugs, I like recording the QEMU session under
rr (using its chaos mode to provoke the failure if necessary) to
get a recording that I can debug and re-debug at leisure. Usually
you want to turn on/add tracing to help with this, and if the
failure doesn't hit early in bootup then you might need to
do a QEMU snapshot just before point-of-failure so you can
run rr only on the short snapshot-to-failure segment.

https://translatedcode.wordpress.com/2015/05/30/tricks-for-debugging-qemu-rr/
https://translatedcode.wordpress.com/2015/07/06/tricks-for-debugging-qemu-savevm-snapshots/

This gives you a debugging session from the QEMU side's perspective,
of course -- assuming you know what the hardware is supposed to do
you hopefully wind up with either "the guest software did X,Y,Z
and we incorrectly did A" or else "the guest software did X,Y,Z,
the spec says A is the right/a permitted thing but the guest got confused".
If it's the latter then you have to look at the guest as a separate
code analysis/debug problem.

thanks
-- PMM

