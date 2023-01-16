Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDEED66C9BF
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 17:56:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHSlg-0000Ca-8c; Mon, 16 Jan 2023 11:55:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pHSld-0000AB-IT
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 11:55:29 -0500
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pHSlb-0006LN-Su
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 11:55:29 -0500
Received: by mail-pg1-x52d.google.com with SMTP id s67so20064184pgs.3
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 08:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=EQfTqp7jI34sM5Y6u0e8OGKxJPzYVj4NAgnH7qLSyzc=;
 b=oxAtIe2bBQjEmO843Sj0JxUa092pLb4M0w8Ms+okU492NPF1ItYM2dErS0g/JaIbfl
 sQZaY5A8jfdBz6vqEdvsZ3RKDFThj9D7jAZOT+Heg6b0/gczBwQc2AkiPpbILEo8d6N5
 CG4Jfkkgoy4/g5f3YLfd+wqtwf/1nKhIeU3QgZ8qFVaxcgBzs+6fOKIS7d+Gc5ApH3XW
 AhCT3kjQD3i6SDae8z/iKGrNHAi6M3jMyR2OG0oY4hV1nU7772AqJUNdv9FLCYHiJtO7
 VQkCWNHKxIKjbwRyzcvC2MBJeNaqdU+58fp8PVOAABOsn458l/EmJGyGmuBY1FP0Ct7Z
 mXHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EQfTqp7jI34sM5Y6u0e8OGKxJPzYVj4NAgnH7qLSyzc=;
 b=nHCh+uOAUTf80Y6Q1XtFD9NQPAlUNPTEUY5IbCcS91sWm5L6huJLBNNL3XZaaM2qQJ
 CcvGUmdPgahL3BZNOqyhDWc3h14gcNKDtVJiYrQIa/o5wY5HQfgzosQF+R5i7Hdqraul
 9jwxEg5X4a1Tc+knhKcaI0r5VZPk/aEUTgOUXN3xS/7hOhPZPNsOuIE+wBBTt4X5Ch7p
 syofpfIlRWsMYf5t0WEybASqw9oooxj8OPWp3fNYahDnxnTMYFXjrl9sQbQQWQA6lJZZ
 sWCInFoQhh74jEBnQV1Y+UNv7TOTE1Jwia8cP62GGV8QokloRwmMwJVdSR6U6L5tE0TU
 9gtw==
X-Gm-Message-State: AFqh2kr4wlnsf6bLGjB82+U80y3nGsxaKUkkmXkK5zF0axo9rjMhE1Ti
 IoPi9wUCfLMgZkfRPD5beU/gs83nWdF+Cpm3ZKvd3w==
X-Google-Smtp-Source: AMrXdXuCIoctBB04bO6GKHO68GVDS5YVAIt7AlbvQmhn+tApOS38SWlCqFGQ09WY22kEqanU/OddY7YtciXdOGWgCxY=
X-Received: by 2002:a62:61c4:0:b0:58b:e9af:948b with SMTP id
 v187-20020a6261c4000000b0058be9af948bmr18196pfb.26.1673888126027; Mon, 16 Jan
 2023 08:55:26 -0800 (PST)
MIME-Version: 1.0
References: <20221215153036.422362-1-thuth@redhat.com>
In-Reply-To: <20221215153036.422362-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Jan 2023 16:55:14 +0000
Message-ID: <CAFEAcA_EUNGFzLh8d9631WZR+-bR8oVynBs6=FV_kmLWNx2bSg@mail.gmail.com>
Subject: Re: [PATCH v2] tests/qtest/qom-test: Do not print tested properties
 by default
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52d.google.com
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

On Thu, 15 Dec 2022 at 15:30, Thomas Huth <thuth@redhat.com> wrote:
>
> We're still running into the problem that some logs are cut in the
> gitlab-CI since they got too big. The biggest part of the log is
> still the output of the qom-test. Let's stop printing the properties
> by default to get to a saner size here. The full output can still
> be enabled by setting V=2 (or higher) in the environment.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  v2: Use atoi() to do proper checking of the verbosity level

Applied to master in the hope of improving the CI logs; thanks.

-- PMM

