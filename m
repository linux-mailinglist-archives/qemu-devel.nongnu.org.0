Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 190A864DC5C
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 14:39:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5oRH-0000pm-Oy; Thu, 15 Dec 2022 08:38:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1p5oR7-0000kn-Ir
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 08:38:10 -0500
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1p5oR5-0006Bz-TK
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 08:38:09 -0500
Received: by mail-yb1-xb36.google.com with SMTP id 186so3470541ybe.8
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 05:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=gSfufDhIySLfeGloKvOVKVcgyCcGdHygjw2/+Hmqhg0=;
 b=Jc+AgR1jvicACU2J3UGEWLhmQm4byIvQgkQ0coIjY2BJvTISG0r1kKOJlEEVgiJEUt
 Ja4CHDedbvvrg8JX/sHePbSJTAY4qRWc8qRVHUFgsvQ2dMon+fmiGMVcguAR99zAADKJ
 OOGWZVJtXQaF1+x2zNdiSkkZ+99nBUBd3/9XzUymxpckPkLeSK2oygUdMlF7yyFho0L5
 BSqFkZqJzY53EouQLE5lvvhKskaSyosYLAd/HDPvsCrvI0Kylf9v+HooSjHmSBVyTNjr
 hZjw/wXBZj1C0rkJ6BhRQ2x6cM8fBoqWtrOKfTbJwrulZnyRdDY1+jBu+X5ONFUjWWyN
 q5lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gSfufDhIySLfeGloKvOVKVcgyCcGdHygjw2/+Hmqhg0=;
 b=4VyJpA5es+X3BAV1o5dE2JD3dDPYiM+uPI5pGyTRdpSG9o4KR5qInu7+e8TWxZAS0u
 304vKvF2QfWaR7ipdncCtjk8aXemvsn1jV2JkKjgwQiA4Oig5HHhT3s5FmE7m4z10Y12
 7iW8hdigXgiLB7orCGt6mMCM1Jj4ZsErYoWUVJiCmTeI8NUz9R25dAdvTLV0mw4r7TZG
 FgHJD5pmAqr6RpLqXC0lkz8/irem4d8cHLY2Vn9XUtLrtuXqXNDlXrd3o4AahgM4t/Ep
 W72vQnzREIpH/wAz06FVV5gB/hHGqAd3MaIrmFX6ms1GVhMKnl2tqRt9EwdNfmu8ydAA
 KAsQ==
X-Gm-Message-State: ANoB5pmz9/XSAXwu4P6JjlMD3Dbf3GcFkaiFgF1OJ6sP63UtXBecI6/E
 gxdUeiZU80Lzk7+pNYnraP0vjEx8NLghIMHBt5c=
X-Google-Smtp-Source: AA0mqf61+tTs4KuHmAJoNDHFi4gDO7JwGrdv7UqUKj5uUGsp3iwajOQ0T/+YZ80qTBQhKJVqhP3yYdBIv9QTHAe+gkY=
X-Received: by 2002:a05:6902:4ca:b0:722:bbac:cbd with SMTP id
 v10-20020a05690204ca00b00722bbac0cbdmr1401632ybs.207.1671111486218; Thu, 15
 Dec 2022 05:38:06 -0800 (PST)
MIME-Version: 1.0
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Thu, 15 Dec 2022 08:37:54 -0500
Message-ID: <CAJSP0QVVQLueQDzOb-GAhORetK38EzgBhem=UjChJ3oaxRaFmg@mail.gmail.com>
Subject: QEMU PPC VLE support
To: Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Ralf-Philipp Weinmann <ralf@comsecuris.com>
Cc: qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Hi,
I came across this post where Ralf-Philipp is looking for a freelancer
to implement PPC VLE support in QEMU:
https://chaos.social/@rpw/109516326028642262

It mentions upstreaming the code and I've included QEMU PPC
maintainers in this email so they can discuss the project with
Ralf-Philipp. That way the chances of a mergable result will be
maximized.

The Rust aspect is interesting, but QEMU does not have any existing
targets implemented in Rust. It might be a major effort to create the
necessary C<->Rust interfacing, so I'm not sure whether that's
realistic given the timeframe for the project.

Does anyone have time to take on this freelancing project or know
someone who is available?

Thanks,
Stefan

