Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBC660F3A9
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 11:26:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onz8a-00052i-GH; Thu, 27 Oct 2022 05:25:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1onz8X-0004d6-Mx
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 05:25:17 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1onz8J-0006dw-Vv
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 05:25:16 -0400
Received: by mail-wm1-x32e.google.com with SMTP id n14so515866wmq.3
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 02:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YY9Ng2PsN+r3bVqkwHdcUcMdh+l8M2oMBt/2Ia02hho=;
 b=GA+qQ24FT4EvcOPtmFCdCiZjSHbANz+QV/2WxEnIxQEvDN/U2+d09sVeyqnpNs+fOh
 JXo326bUoJlzM6h4W9wMcIsjpPVSRknVrvBKUj0MAMq5LbP/YXGy3ToATr/xkldgKcj9
 kNbe9TSooavGU5lYw288BHNCwFDE7+NAdIWpQBsKyj9SL1k5LN3ku5M3B+ecGFUqtVD4
 bd+tD4kdHtzNAOsofFJOtann6pT2MonzmYal+SHVoZH0NM9BL5kMk8xwp1WlLjrNCvmL
 Ru6tW/vEv5InwOUwqzERSI2rFX0es+YA8GkHIiFLllF26Uwfuql0dYmjzWjLadArfaMJ
 kFag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=YY9Ng2PsN+r3bVqkwHdcUcMdh+l8M2oMBt/2Ia02hho=;
 b=Db+nMDhL8Zrqv7P1FIufNqSNhlxkcGvPi7RZpy7asO5lguCwRhr6rhNMxMRr7+eDsO
 mAJKlo9SBmT2Rj3hYPJHL/dSxiCFeral6YHogUajW7uCmAs1T7Zr6IYLqJgssmAxwAu7
 M9sWq4oszGBeg6xManr+NEnTK4ban9N4qnrJePQrhiYmr4BVCg+YsYBqCNd7vQRhGXU7
 BOoUmD22PbsOYFOEOJbh5NEvJN0QfuPsIlhTKQfj4++rabtrs46xEX6GkdrranJGw7dc
 Aew9uB1/y6UJTmN7cXfTCb04Hi6PpabPClmAL0lwC9q5O53uYv031rOi/yMKMz1oCYsO
 21DA==
X-Gm-Message-State: ACrzQf1GgLNO3cIlwRXNfMeFixbvD3D18JmnrHYxhF3+Yk+qmUCadYQQ
 BO7QTAA0xAy9R6sS+1L/Dnk+lQ==
X-Google-Smtp-Source: AMsMyM577W5rG6gMdHWQA/3dkxQ4XpJiffHvZ/LsPiAwC5GAAgrZgvdrq+v+ka1vkBwEBHD+oqP8gA==
X-Received: by 2002:a7b:c303:0:b0:3b4:6e89:e5d5 with SMTP id
 k3-20020a7bc303000000b003b46e89e5d5mr5201846wmj.111.1666862702101; 
 Thu, 27 Oct 2022 02:25:02 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 t13-20020a5d42cd000000b0023622d65d4bsm798381wrr.81.2022.10.27.02.25.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 02:25:01 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 588551FFB7;
 Thu, 27 Oct 2022 10:25:01 +0100 (BST)
References: <20221015050750.4185-1-vikram.garhwal@amd.com>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Vikram Garhwal <vikram.garhwal@amd.com>
Cc: stefano.stabellini@amd.com, qemu-devel@nongnu.org
Subject: Re: [PATCH v1 00/12] Introduce xenpv machine for arm architecture
Date: Thu, 27 Oct 2022 10:24:32 +0100
In-reply-to: <20221015050750.4185-1-vikram.garhwal@amd.com>
Message-ID: <87lep11uvm.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Vikram Garhwal <vikram.garhwal@amd.com> writes:

> Hi,
> This series add xenpv machine for aarch64. Motivation behind creating xen=
pv
> machine with IOREQ and TPM was to enable each guest on Xen aarch64 to hav=
e it's
> own unique and emulated TPM.
>
> This series does following:
>     1. Moved common xen functionalities from hw/i386/xen to hw/xen/ so th=
ose can
>        be used for aarch64.
>     2. We added a minimal xenpv arm machine which creates an IOREQ server=
 and
>        support TPM.
>
> Please note that patch 05/12 breaks the build. Patch 06/12 fixes the build
> issue. If needed we can merge patch 05/12 and 06/12. For now we kept these
> separate to make changes easy to review.
>
> Also, checkpatch.pl fails for 03/12 and 06/12. These fails are due to
> moving old code to new place which was not QEMU code style compatible.
> No new add code was added.

I've finished my review pass. Please CC me on v2 when it's ready ;-)

--=20
Alex Benn=C3=A9e

