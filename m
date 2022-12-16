Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E3964ED2A
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 15:56:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6C7w-0000hv-Vi; Fri, 16 Dec 2022 09:55:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6C7d-0000dj-EH
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 09:55:44 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6C7a-0001Re-D2
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 09:55:37 -0500
Received: by mail-pl1-x629.google.com with SMTP id w23so2515166ply.12
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 06:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=d6iTxs+wfVG1naIptjerDTT64/ZnsSW2BRSw0JotrPw=;
 b=YiKzhhNlkan4XcJ58B6RTLHY/BX4DZvAiZ1M0R/+M4il8rstertWlAIpJwnjCjkGR7
 hM2yflRoXthC3wpmfoifccjkvjvhzFHC9CAC/WnUDmv/BnFltj3bUw+BGlEu8+0sJVyD
 oQyH13aV06VyDEZIyvG/ow18nRvmKK8vLkcxJzO7Wf96mrSrCOiXcyrhdTZrCetoJlDq
 xCwhDkmFrF9NzT/gsdd7DSC4xAzeY5I0oPPfWbX96xowBfKPdKJsSqxfWK0hvfwUIQt5
 rxu840YltS3SMiipNWGBpHxEfD3BX3Ng9fytO5vVgaqqfnJeeo7+VIHrU9ObGod2b9j4
 Bh8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=d6iTxs+wfVG1naIptjerDTT64/ZnsSW2BRSw0JotrPw=;
 b=0c6zn/Y/WoInvRVelkKfxZIRObTSyHZPlhw4ElWYBzubDrW4H0+YC1BZ2hG1e4msF1
 3bMC5pOha4pE7FSBYcHIEVQ3u+FDpBpeNnfPWzJ2xDwWa8Yy2fZ/4DgfdZ64cVVWqgou
 jehqz3/fyMR6gU8z+6v4MJxF9DW6w8bEB5f80ML+SKe84/pYb3617V/5wxZpyhZ73Oib
 3SItsWRuUj4y8GCLctClql9iGICsYBAaoHUXRNVS6KtB/dxmlwjdhndR1W0rEPWtB3Ie
 IapoUAZgPnvR3xuAxISV58YDNzPqaiRVY93hsoZngpccyr1izkK+JMMErJgcBj6s06/M
 95Gg==
X-Gm-Message-State: AFqh2krLl7UM9zJmrAS216B7Y4c/RGrckNqFq2G2Im6Wo9OAb8aYAQ/y
 zETXkp4RbS5PKK4ZcjRDVYn9GwCLus95CumRji3JboXKDXOjYrS1
X-Google-Smtp-Source: AMrXdXt0IOecoObM+YY4fzAzNA83Wdan4Gd1nqghkk6WQzlqAiSPjn7hFceqSh106JNeig78hxIYHbC4wThJ6i4iqZ8=
X-Received: by 2002:a17:90b:354c:b0:219:e2f1:81ad with SMTP id
 lt12-20020a17090b354c00b00219e2f181admr1113606pjb.19.1671202532043; Fri, 16
 Dec 2022 06:55:32 -0800 (PST)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 16 Dec 2022 14:55:21 +0000
Message-ID: <CAFEAcA_FuURPMDso7+ws0fe33mm+9aAHGByc65YbbN6dEuZWMA@mail.gmail.com>
Subject: can we reduce the time taken for the msys2 jobs?
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?Q?Phil_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x629.google.com
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

The msys2-32bit job currently seems to run into the 70 minute CI timeout
quite frequently. This successful pass took 61 minutes:
https://gitlab.com/qemu-project/qemu/-/jobs/3479763757
so I don't think it's a "time limit is fine but job has intermittent
hang" situation.

msys2-64bit also is quite close to the timeout, eg this job
https://gitlab.com/qemu-project/qemu/-/jobs/3482192864
took 61 minutes.

Can we cut down or split up these CI jobs?

thanks
-- PMM

