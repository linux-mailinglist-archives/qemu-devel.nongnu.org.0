Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A6065F1AE
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 18:02:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDTSH-0006TI-AT; Thu, 05 Jan 2023 11:51:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDTS6-0006QX-R8
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:50:51 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDTS5-0000iy-A5
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:50:50 -0500
Received: by mail-pg1-x531.google.com with SMTP id 79so24864187pgf.11
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 08:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rGtRxuXL9poxRWlNrH5xQKN+RfdxdevozKxSbPlo2EI=;
 b=s105/w9C5UPSfNSZIYZWJLYonE6u1QM1UlIjrKHNgjlRcKRooyoF6PWClkDIto8MM2
 /faO2vWCZv1LYjcWjVBNrum7iY77GbHXKCJLwuFCru9IUs263A8IBGHfKwN7bL72ChQG
 yxQRJ3Vfs/oSbAQe0ufSRO7uDkONy6JbMVITfK6kfSQZ1QN7OvB/nYx8LJTBjRlWdOgL
 xY+w0Rha1EAtYeotkJF+Q5WJyFHJ7wc8CsVnVOjDfU6CJMjQQEPos1c4VJWIeo/v6TFm
 cy6H+A+oH6WnFEZczUEyUovJfDmPBDw5V8D+tXLeFm4YvUTESmltb1f790GJNteiKojw
 j+gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rGtRxuXL9poxRWlNrH5xQKN+RfdxdevozKxSbPlo2EI=;
 b=00r6BhNPRukgXUSlVTMqaTws4mViy4TCIDeiYYZd3mchJL7wXFCBuJPFcT1Lrx7Dzr
 VPHzEuuw/whkp2Wl/aG2ag24FYKz1rgll7A1jgpvpLk3TOXKzPtrEHmA/87Tftnpb2Vq
 WHZj3PyU8wANbzGlqkhfw8rOEet36rYcyAgb4eU/md5KNFTIMUpGXuZXKYP5E7w7BGgy
 lJVZALl8GqjgX4szf3UmqYTrS4vsAOQW/Z5a0aJUCB5kVAKdCRPwyTOh0CHOWXrdo2JN
 9q8O4aGlyiFZEM3KfyOrpK2/iq8x4x3FGofxrUcZ6Rtlw+JMR130OZ4LxOVXMEjGS6UC
 bZIg==
X-Gm-Message-State: AFqh2kopi9qu6VkovvBQJlB/UUam+6woBIUQj2semQ3laVTRwcmjxzY8
 pYK8fHvbGj5UsTjdlTBnKBnJKXT4oQPYM9AAsB4w/A==
X-Google-Smtp-Source: AMrXdXs4O+iOYvGHoKfO015AeyZp5XEKS/8AqbXLT0xIDufd9RhduiKIjXgejnBamcwAl1C3lMxm2eOfXLTzDLjaek8=
X-Received: by 2002:aa7:999c:0:b0:582:74a2:1e4e with SMTP id
 k28-20020aa7999c000000b0058274a21e4emr1125257pfh.26.1672937446491; Thu, 05
 Jan 2023 08:50:46 -0800 (PST)
MIME-Version: 1.0
References: <20221221183202.3788132-1-slongfield@google.com>
 <CAFEAcA-zv_ny28MJGf4s9T1+3PwK8WRurVgiQnA+8UWbkRawkQ@mail.gmail.com>
 <88f5cc21-69bb-18a3-718d-90d2c43e787f@kaod.org>
In-Reply-To: <88f5cc21-69bb-18a3-718d-90d2c43e787f@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Jan 2023 16:50:35 +0000
Message-ID: <CAFEAcA_ez-_WHW25HCW36Vewa0rKDvUjvGCHCkX_Z0M2igW9tw@mail.gmail.com>
Subject: Re: [PATCH] hw/net: Fix read of uninitialized memory in imx_fec.
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Stephen Longfield <slongfield@google.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, venture@google.com, wuhaotsh@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x531.google.com
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

On Thu, 5 Jan 2023 at 16:46, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> On 1/5/23 16:33, Peter Maydell wrote:
> > On Wed, 21 Dec 2022 at 18:32, Stephen Longfield <slongfield@google.com>=
 wrote:
> >>
> >> Size is used at lines 1088/1188 for the loop, which reads the last 4
> >> bytes from the crc_ptr so it does need to get increased, however it
> >> shouldn't be increased before the buffer is passed to CRC computation,
> >> or the crc32 function will access uninitialized memory.
> >>
> >> This was pointed out to me by clg@kaod.org during the code review of
> >> a similar patch to hw/net/ftgmac100.c
> >>
> >> Change-Id: Ib0464303b191af1e28abeb2f5105eb25aadb5e9b
> >> Signed-off-by: Stephen Longfield <slongfield@google.com>
> >> Reviewed-by: Patrick Venture <venture@google.com>
> >
> > Applied to target-arm.next, thanks.
>
> Did you take the ftgmac100 also ?

No, I missed that one (patches arriving over a holiday
period are more likely to get lost). ftgmac100 is aspeed,
can you remind me, are you handling those patches at the moment
or would you rather I took it through target-arm.next ?

thanks
-- PMM

