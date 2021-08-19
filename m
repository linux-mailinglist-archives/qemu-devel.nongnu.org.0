Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 302373F1D70
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 18:05:53 +0200 (CEST)
Received: from localhost ([::1]:38772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGkYB-00034r-OL
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 12:05:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGkWB-0000DX-Ev
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 12:03:47 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:33289)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGkW9-0001NH-Ju
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 12:03:46 -0400
Received: by mail-ej1-x62f.google.com with SMTP id x11so14086066ejv.0
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 09:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PwZohkxOEkXxR0Ql+j9TWPNP+YsLVeysDP0tbUl+mag=;
 b=xcbfnMvITBaW7zkme4KSh0gnYZfM3SllH7AJ4shWm4sLvEVd1ZshqH/4Ma2o/tqTFV
 it+7tePwPIO7Hf1OPfEdP9FxQHefzmVXFFNFgmjeZ0qEkdGZkj0vG9LCF2iUh8gTsQUP
 qmHMQh/juPARmDSRp5iaQSGrvTFD+qHsrZ0ZLSSL6zSww5thaEkYviClOpnAEck9kDto
 e42C+lC9Xih+9OIF7km+zFugyZXY5Sx1TMTwxOLsHGRG9seWGXNu4djipVka2sjcbnYW
 BGax4Ac6w+hbSRjC7fMxH/49LeeTQ4EJtvnnHn81YQOMYWH4YF63aGe/+vnqzV5jTPIp
 7Nwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PwZohkxOEkXxR0Ql+j9TWPNP+YsLVeysDP0tbUl+mag=;
 b=qTsJQWLGGBc6eTF1C+kqxVMsp4658r4P2pe+pfGIOpzLK75G+epWRGBVGwQg0t++CS
 Ryj2t9jTK4jW463M2kn7PNrQtgw0Ob1UsPbC2fnZyV2RMgq0sstQ2xrvWO9EN8TM8mj0
 O9JS6N03OYs83N8+yLKy2pmF+ZKpJHf7sWTWEsGl/snoTXr+spNUwCz5vZGT9nBO93lG
 7XBMT1tEdwBPpbk4XatJOIGpNNcDBnUQAXjmiodtibgixvsAQvuR43A1S18VVPc1H1/z
 ZA1WqqnU6/XCXluv7virlGh7dq3kQ8oWxGGRD4tMSfcmZhHWVRgeQhWR3NAitaAy0uby
 r+vA==
X-Gm-Message-State: AOAM5314Gr4QHMGJ46VIzuHs/YDO6EFMiR4YTOJBcsixFwOYAXQklx7w
 Awr/9jUMs86uGMeEScEba1YYJGpxsUTgWL3cm0D9sw==
X-Google-Smtp-Source: ABdhPJzYXmWQa1wrtDReSWJkJgLGxpxQJZeG/ncBh7YaPLIkeM0YW/pKtw1cs+Jytav3DKI3egPrPsQbg3Yl4METZsA=
X-Received: by 2002:a17:906:c085:: with SMTP id
 f5mr16751489ejz.250.1629389023948; 
 Thu, 19 Aug 2021 09:03:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210818191920.390759-1-richard.henderson@linaro.org>
 <20210818191920.390759-45-richard.henderson@linaro.org>
In-Reply-To: <20210818191920.390759-45-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Aug 2021 17:02:57 +0100
Message-ID: <CAFEAcA9qGExH0Vur9SVcfu3hsfcaRPhi4qDOjdQ+XS31G3u3yw@mail.gmail.com>
Subject: Re: [PATCH v3 44/66] tcg/i386: Support raising sigbus for user-only
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 18 Aug 2021 at 21:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/i386/tcg-target.h     |   2 -
>  tcg/i386/tcg-target.c.inc | 107 ++++++++++++++++++++++++++++++++++++--
>  2 files changed, 102 insertions(+), 7 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

