Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2477A700BD8
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 17:32:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxUjy-0002DW-Mi; Fri, 12 May 2023 11:31:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxUjw-0002DC-Fj
 for qemu-devel@nongnu.org; Fri, 12 May 2023 11:31:28 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxUjt-0005et-JL
 for qemu-devel@nongnu.org; Fri, 12 May 2023 11:31:28 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-50bd37ca954so90731897a12.0
 for <qemu-devel@nongnu.org>; Fri, 12 May 2023 08:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683905481; x=1686497481;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/u6VagTFVKoRfzDa+3go7lulQIlZnGitD4jwUwfGtX0=;
 b=wdQC9sDXfrse3/lkU3LnkDJnzpjZ9iQX4sD6v08ozXm8VfMpndMJGqHrZQa8fcYkB4
 50cw5YbsT+9rRXaJt6Zia3epYqDksCMx3NI6ZvITm1G1jAvYTMoGdptAuDwdv0Cb8FTg
 issxCpmrB54v59nVtcKOQGLdL8yt9QMiRwFIelPOJiWst8vwJprBsFl03Kgmf8DAijxG
 ggu0QtweI+/mWBIQol+167f860VOtw/pRmIrtKU6DKBxwJnOY/PDklCTqXQmNtGRykit
 qw3DcKolUvRzBNHY+pwiyOff4+m1uDPKcaGNW+aVtMwzqxflutspcpt8iO9YThxcz7dt
 GwPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683905481; x=1686497481;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/u6VagTFVKoRfzDa+3go7lulQIlZnGitD4jwUwfGtX0=;
 b=iDBNfaXUr/fDMevJC2k4CQbgkn/J5PDNTnbSJ93INFbC0ZsrpwqpVLXZqpt7GC/cWm
 x2OJXEIbfmhXv5xJ/zatyOlMkC0YpoPrKTtMTNvo8r4eGIgZS4RErsMqoGw+7mWDLSu8
 lAgtDA2UybZamIju+aI/jSDejAZtS3zD0Oyf4KBe1G4d/yRVSiq99x+cUucz+SWVksjC
 bVQrR0aVaCMzHTl+46HUYzSFgLOO4Po4pqVjJ6aRHFptCCQn491cZ2Bn2aWziahJ/7td
 1A5hfQyTTNI3EQS5tjrLk/jFEOqrmM864WNOMY/n+Izz9BnF8j0NyOfZxt56yfC219bd
 7O/Q==
X-Gm-Message-State: AC+VfDyjNYW3fTfBI02EBIYXda2wcp7v7EAj/vkOvnf0Oc2dRgdC9MxS
 TX9Sbf8SJtby0hGBhIOWcEO25bGqo1Ee4nExFOUxBQ==
X-Google-Smtp-Source: ACHHUZ6NmMRD9SzKGtiPAOhHYs45may5YoWjBt9Yq1iPc/tkE8rYVgOrAx+Q4VFfO97E47ZG/nHj0Bf+N27P7A+dlSY=
X-Received: by 2002:a05:6402:2812:b0:4fc:97d9:18ec with SMTP id
 h18-20020a056402281200b004fc97d918ecmr20981504ede.21.1683905481655; Fri, 12
 May 2023 08:31:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230510203601.418015-1-kwolf@redhat.com>
 <20230510203601.418015-3-kwolf@redhat.com>
In-Reply-To: <20230510203601.418015-3-kwolf@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 May 2023 16:31:10 +0100
Message-ID: <CAFEAcA9MuT=N3L2XY2D4c-oMhyyPyKu+8=VxuDCXuc+zaDjMpg@mail.gmail.com>
Subject: Re: [PATCH 2/8] block/export: Fix null pointer dereference in error
 path
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, hreitz@redhat.com, stefanha@redhat.com, 
 f.ebner@proxmox.com, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 10 May 2023 at 21:38, Kevin Wolf <kwolf@redhat.com> wrote:
>
> There are some error paths in blk_exp_add() that jump to 'fail:' before
> 'exp' is even created. So we can't just unconditionally access exp->blk.
>
> Add a NULL check, and switch from exp->blk to blk, which is available
> earlier, just to be extra sure that we really cover all cases where
> BlockDevOps could have been set for it (in practice, this only happens
> in drv->create() today, so this part of the change isn't strictly
> necessary).
>
> Fixes: de79b52604e43fdeba6cee4f5af600b62169f2d2
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---

Coverity noticed this bug, incidentally: CID 1509238.

-- PMM

