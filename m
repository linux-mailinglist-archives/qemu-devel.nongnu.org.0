Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CD157BCE9
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 19:40:47 +0200 (CEST)
Received: from localhost ([::1]:44372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEDgi-0000V4-HS
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 13:40:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oEDdj-0005mK-0K
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 13:37:39 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29]:46779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oEDdf-0001u6-Qi
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 13:37:38 -0400
Received: by mail-yb1-xb29.google.com with SMTP id l11so33269458ybu.13
 for <qemu-devel@nongnu.org>; Wed, 20 Jul 2022 10:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fJvIbGyxXRDu6uexIcLk/3HvJsWTGuFrbEhqzbsA1EI=;
 b=EYqxjUoxQXfPfokkAicwXdw359Zw0/Akn+kp3Nq9uVvbkf3uRHv+akagI0F/Ng5Bps
 +JU7usTGHz9ZMhe0qQWENmOj0b9yFE9zhIlSPi8VZgWXUwziXHH40SJE3MY8QgpD+DWr
 BjU0/vuCMYFNrF8FLM08iYB6a0QsclppwWeSNZ4+y/Zwgo6HvqASocKfXdjEqUcqQsUA
 1qDapBo6DhUN0zilIJVtMKArLZ48pM4KWZz6IcM99wMpWCdDRqJZY1q0IH/Z/pJjFIrO
 nnnGc5zchBCXhLZJ6pgabtMBz5vCQJetA8hJRkwX4JQGaBxbS+GdrOuhA1iYF4OFBuo2
 sy9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fJvIbGyxXRDu6uexIcLk/3HvJsWTGuFrbEhqzbsA1EI=;
 b=QW/VywRbnTc+0RUOhtOyR+4Sva2ixOMN1w2hgXY3ietAQavJYar3xHMpG9heDqJ63j
 RKUHtQIuxgLZhDO7Gf6nLIGepNHbhrbNPBdXmrLw51V4fR4LUDOo21PcGSSRcQsH23mO
 8VxUGuYCmci6AJ90AOoeXHqWz1xRnTELGTtNPxsibVmWdjwSPBXHaAHfND4L40iyNvwM
 WYuGjXt14EIubyMTrLwSaAXjutOuBYOYPkDCB8E/fZ17QysI9Fhkd0Ucagp7oOfDoNh4
 A+3eLHzZdieWwCUXlQijOac/eu8jCC1Rw0+dpHQFjpF6ti8HGp9fQgvbZd/204v/TXM9
 sbAQ==
X-Gm-Message-State: AJIora9Scj6W1e7YohM6CNCQLvyeS353Km+kpUVD1hrXvrE7bVOO7BPt
 vIaeXYegta8k/wLkrocQvYe9g3RPSxe+PFnglQO12w==
X-Google-Smtp-Source: AGRyM1voMby1qyX2h/gmZlaIBnRLkAO9rMBDovwdb44ShsftXjxBmz/sWCX9tHzizk3D516ba/BRmSubMt8oPaIu4pk=
X-Received: by 2002:a25:281:0:b0:670:9755:7067 with SMTP id
 123-20020a250281000000b0067097557067mr3846150ybc.85.1658338654460; Wed, 20
 Jul 2022 10:37:34 -0700 (PDT)
MIME-Version: 1.0
References: <CAK7rcp-qoQrEo2D_H=39AeJVtZJfmNUuFRfTdQr6LqUpjp+FEQ@mail.gmail.com>
 <87y1woyxvo.fsf@linaro.org>
 <CAK7rcp-Ts=3JNoYRak-Zddb0NDjdgSqbGD32xFEguw0yLqydyw@mail.gmail.com>
In-Reply-To: <CAK7rcp-Ts=3JNoYRak-Zddb0NDjdgSqbGD32xFEguw0yLqydyw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 20 Jul 2022 18:37:23 +0100
Message-ID: <CAFEAcA8sWMD1eZCZyiMPz_SNKRn6J--Gm53aQuTo-KO5bWyFrQ@mail.gmail.com>
Subject: Re: Access target TranslatorOps
To: Kenneth Adam Miller <kennethadammiller@gmail.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, 20 Jul 2022 at 17:39, Kenneth Adam Miller
<kennethadammiller@gmail.com> wrote:
> That I know of, the TCG plugins do not allow me to feed the
> QEMU instance dynamically changing opcodes. I wouldn't use
> TranslatorOps if I don't have to. I want to facilitate a
> use case in which the contents of the target being emulated
> are changing, but it is not a self modifying target. I have
> to query and interact with the TCG to find out what opcodes
> are supported or not.

I agree that feeding opcodes into the translator isn't what
TCG plugins are intended for.

I'm definitely not clear on what you're trying to do here,
so it's hard to suggest some other approach, but linux-user
code shouldn't be messing with the internals of the translator
by grabbing the TranslatorOps struct. Among other things,
linux-user code is runtime and TranslatorOps is for
translate-time.

Sometimes code in linux-user needs to be a bit over-familiar
with the CPU state, but we try to keep that to a minimum.
Generally that involves code in target/foo/ providing some
set of interface functions that code in linux-user/foo/
can work with, typically passing it the CPU state struct.

thanks
-- PMM

