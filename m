Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE61D37F5D8
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 12:48:54 +0200 (CEST)
Received: from localhost ([::1]:44774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh8th-0001It-SU
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 06:48:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lh8mv-0001tm-OP
 for qemu-devel@nongnu.org; Thu, 13 May 2021 06:41:53 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:44894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lh8mu-00089h-0O
 for qemu-devel@nongnu.org; Thu, 13 May 2021 06:41:53 -0400
Received: by mail-ed1-x535.google.com with SMTP id t15so2764676edr.11
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 03:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YRgz+940QUUeHZ6Dx+I5CLIBiAjIfalu1aRivEnE7nM=;
 b=KqEQBD7x4v1Jt3g8oYx3Nli13s73PX4OsPBswxzDWTCMxs7rXpUUAPAkDf5noY/dAY
 bhVFUfADmH29Yaa+JAAqTBWBTz9GiRzHVPLSUBE49KdLim6P+xEaYuVoEX9Ju/xmbt0s
 QKkvX0+d/X0V0aW4LEtvIQleK+22U8tlsWq6JrA8JKKXyapCa/tUtwpTIfeRVcjE7NDo
 9/QQ0Hh5dEYKtL4s3vxl9CXzh0/e9+y3A15M9sU9+MHOG/5PYD+CTJNcf3PVGHRuqi0/
 pLHJPkzaxzSSX37LmHinn0N8W6asNbHP+lxz8PdFIGWMVXRTWSvIjNnx6I3CeWhDU4ev
 gD8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YRgz+940QUUeHZ6Dx+I5CLIBiAjIfalu1aRivEnE7nM=;
 b=aD8tILk6rQ51/pSiyImHpifD5E+11+QCyhZFwqFFCwNDS43K1jKG7vh1DBu5IgtM1f
 +HX+X6wmm54juD85XMOQL8eMXPJUYMoOS0xrGggxkx+OwN9uWVDKwjMdOTHAeaKAiu8E
 qGf2IdKbrbdDHkMoC1BE4gZ4JH02+SmqnbWGafDG85p2GfPLjGutWgV9SMYM21AZ1OR+
 OX3q8OrL2YE6XqkfPV8JmGcjfgH/kmY9xd9Q37RIJgWbB7pXmDZpJxeUgRlBtv+6WUc4
 Rp5nSu4w2gTWJ/NwwFUoaajpqJSSiYnutG2i/BS8bg5vASe7XynV+HwEWnm+1Q0Hxhyl
 OYbw==
X-Gm-Message-State: AOAM533cnhJHVBJIcggzTmDsmpqy4eIS16JZVCyRTLjIRMmIGDJArh+G
 0smR78vsiXnCJ78ZSl0dxZNQX/VEnV096V4wvpRxCQ==
X-Google-Smtp-Source: ABdhPJwJr6LRjGZ2f3gXx0yDcAfAAJPq86q+1Q/IZl0YykXggfHPTUErUy+60rAO7dHVi23YSoVArHVBRZR68QYmyqg=
X-Received: by 2002:a05:6402:12d3:: with SMTP id
 k19mr48932399edx.52.1620902510414; 
 Thu, 13 May 2021 03:41:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-48-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-48-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 May 2021 11:41:39 +0100
Message-ID: <CAFEAcA_8NxjLN78kMUNGa2VvqxixX2NNWcUB2nZD8eiO16dniA@mail.gmail.com>
Subject: Re: [PATCH v6 47/82] target/arm: Implement SVE2 SPLICE, EXT
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 30 Apr 2021 at 22:13, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> From: Stephen Long <steplong@quicinc.com>
>
> Signed-off-by: Stephen Long <steplong@quicinc.com>
> Message-Id: <20200423180347.9403-1-steplong@quicinc.com>
> [rth: Rename the trans_* functions to *_sve2.]
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/sve.decode      | 11 +++++++++--
>  target/arm/translate-sve.c | 35 ++++++++++++++++++++++++++++++-----
>  2 files changed, 39 insertions(+), 7 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

