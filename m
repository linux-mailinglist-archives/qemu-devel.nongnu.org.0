Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8A341DEAF
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 18:17:36 +0200 (CEST)
Received: from localhost ([::1]:56402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVykZ-0007Ou-8s
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 12:17:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mVyeQ-0001pw-B8
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 12:11:14 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:39785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mVyeO-0001N2-HZ
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 12:11:14 -0400
Received: by mail-wr1-x42c.google.com with SMTP id d26so10981490wrb.6
 for <qemu-devel@nongnu.org>; Thu, 30 Sep 2021 09:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BRnOL7ucs759wcqmGyHAs6aA9h8e9jW9itNOqyt+mnw=;
 b=NleCS+A7Ogx9iJsHf4DQvYZ35x9E4AqHLokVvoLr53RxKwtVzzS2CvUn/MAOEGRosf
 PjKmZwTCNF5tpM4vfYGEdcs9W9N1XKywukS4hODfY4lX60j2KCPFZaJ3m45tJ0DneZRU
 V7Q5vqS43/RlScI6GV3cZ9AKnfLREfbR6vFHur1CTSTrdknsvZ73FLWqs0Ul9K2o+uW5
 +8EdgQ1DsVtypfrQuYqDw8kamkc//z48N+XuHSRR96okGgfQUez55dKcQgoL1n9PuiTB
 1GB4kuy/lEXsrD8MyBtM6LFoDSf1OO+GmqgScHZKE1qcvsAsU75YaG8lw9ke6rWy7rfb
 Ip+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BRnOL7ucs759wcqmGyHAs6aA9h8e9jW9itNOqyt+mnw=;
 b=MFyi2eaUewR0eBXRetK1LlVkHW4MoK+YOl29epBnVPuDek/Vdt55+bh6ZoWX29KSbY
 qV63NSJT2VSSQwErfoqy56Rpzvz/lqgFPF5jAhID/gOYSphwQWcQj+6r2veJlQV7o8eb
 HmlMrFklrCmNxefILqTWYivS6mk8NEljuIIaD89FfbULrznxLz4kUz0e7YrRX06Zjfye
 mFYsxAZ3mOSquadz6VR3KBgArjWplby8wlFjq/a9iBBxQNC1ti6hhSh+5GuYkCkYCSE/
 55iqb5vFcfzVxT1CbR9KqH2f/jktorDZ94ebwOfOD+zCuv2mzE8vr4wlep+5xQzWYBpc
 VMqA==
X-Gm-Message-State: AOAM530w4Wv7uXzyoITE2nHmddAmcbDYpsCePE8tpLYRFLf4SsvQGThe
 aMdoaMIGLPSM6U6ltO775jROIfFud9vpOC3M9jAN7g==
X-Google-Smtp-Source: ABdhPJw9MziDmnmedzCoM3pCZBZJnSOJWpz5JoLcYML4nLGzI91s0BYaS5V1n9SQ4xYxyuiOKXnW2VpIjOyfSe6EtSM=
X-Received: by 2002:adf:f185:: with SMTP id h5mr7364315wro.302.1633018270647; 
 Thu, 30 Sep 2021 09:11:10 -0700 (PDT)
MIME-Version: 1.0
References: <SA1PR15MB4484B78AA300C0D419BA70DFABAA9@SA1PR15MB4484.namprd15.prod.outlook.com>
In-Reply-To: <SA1PR15MB4484B78AA300C0D419BA70DFABAA9@SA1PR15MB4484.namprd15.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Sep 2021 17:10:16 +0100
Message-ID: <CAFEAcA-=mAVSotX524ewvdxR2SQkZAhx=SwHq61Zqnf8H6LgHQ@mail.gmail.com>
Subject: Re: [PATCH v1] Use CLOCK_MONOTONIC_RAW if available for get_clock().
To: Joe Tanen <jtanen@fb.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "dirty@apple.com" <dirty@apple.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 30 Sept 2021 at 17:04, Joe Tanen <jtanen@fb.com> wrote:
>
> CLOCK_MONOTONIC_RAW provides an unadjusted system clock on some platforms,
> which is closer in spirit to providing a guest with a raw hardware clock than
> CLOCK_MONOTONIC.
>
> Using CLOCK_MONOTONIC_RAW also works around a current issue in OSX where
> CLOCK_MONOTONIC has been observed to go backwards.
>
> Since CLOCK_MONOTONIC_RAW might not be available on all platforms, revert to
> using CLOCK_MONOTONIC if it is not present.
>
> Signed-off-by: Joe Tanen <jtanen@fb.com>

I'm not sure we want to change behaviour everywhere to work
around an OSX bug, though...

Has this bug been reported to Apple ? Is there some kind of bug
report ID or URL we can quote in the commit message ?

-- PMM

