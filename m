Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B59069E11F
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 14:16:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUSTh-0002mL-Ur; Tue, 21 Feb 2023 08:14:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pUSTg-0002lk-6m
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 08:14:40 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pUSTe-0004fT-4q
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 08:14:39 -0500
Received: by mail-pl1-x636.google.com with SMTP id bh1so4968680plb.11
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 05:14:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fjIjXVfS5Igdnh3b2Oq96jbm6GxZ1Nil7EOxHWIDAZY=;
 b=fSs9LkbU3a2WdrCqk/bZ4MDE7mhnNyKslCFrKsvqCzH8UO4WcwksVogKVy5URDppF7
 o/gFlpfeoeuau6kNyjxww3oM12glPNvDobz5CpSvHxMSV1bWnQ/fwSeHrN9Foqe2SaXp
 r07BVOb+YUB0+9xPgnM6QXTevAuVHXYa0unAAcp5IpxhaWJTec6z4OWipFCxNTlRNSFO
 J6tHdW06ASHP01UkQE8GP/vEPSg/7H3/ykYf9FsD/rEGmAvur5tKvppImw52kuvlijqz
 rjI7nft80belnHZcNt1kWiKQiAlIHM0nH1UMSWEOzs9x/frBSLwKAILv/aIwnzJmWCJL
 MT1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fjIjXVfS5Igdnh3b2Oq96jbm6GxZ1Nil7EOxHWIDAZY=;
 b=QgxZUu+P5mch8Zi3eXmdYS3JblI7jnh7bdn6S7tTFdqtSSBqJKcM75WNlppXxA1SOd
 zHScBkoP6vrezciztEQbZXd5bk8p5HrSUAIPHSTVOI1vnFI+6aQL+liDT/unhuAjyVOV
 ogVnU5s71/7d1WAwbk4VCBgcD8gqzOPDuNTxEQ8KpOJYLyeCLQtlEC6BVCUQ5Xp4eqSs
 MKf6SU1vFg1gLfhVgwV6IPcT9TVm86sj8HSqll1lRofwa30zaVKE8PzXRGCUUduLDzm/
 TBKMSY4ebhS7J6MZbVhlokbqvfcji3yWQXPxAADtN9LRtGKXBwb7Y80jF6/TerUiIUta
 YZLA==
X-Gm-Message-State: AO0yUKVu71F6z8XW4SNiWzloOau1n5awxRz76yay0aSc/PXFDrqim71M
 0o0cIHolrWiuFDes7X4lkPo8jvpbA+bNki/GFMVbag==
X-Google-Smtp-Source: AK7set+RtZKjCtK/qvP07K4IOeSI/w3iIpxev5BjMpN1PzO5IoXVvZ3Nf36wTzembg5qF7SLVGFioZjbrw0FrxcyxM0=
X-Received: by 2002:a17:90b:5109:b0:233:dcb5:ee15 with SMTP id
 sc9-20020a17090b510900b00233dcb5ee15mr1730387pjb.92.1676985276320; Tue, 21
 Feb 2023 05:14:36 -0800 (PST)
MIME-Version: 1.0
References: <20230217040855.16873-1-alxndr@bu.edu>
In-Reply-To: <20230217040855.16873-1-alxndr@bu.edu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Feb 2023 13:14:24 +0000
Message-ID: <CAFEAcA95TbfDPfncBqsoKTwJRFt+jryDL7qfaqt7f3PVcDgp6A@mail.gmail.com>
Subject: Re: [PULL 00/10] Replace fork-based fuzzing with reboots
To: Alexander Bulekov <alxndr@bu.edu>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x636.google.com
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

On Fri, 17 Feb 2023 at 04:09, Alexander Bulekov <alxndr@bu.edu> wrote:
>
> Hi Peter,
> The following changes since commit 6dffbe36af79e26a4d23f94a9a1c1201de99c261:
>
>   Merge tag 'migration-20230215-pull-request' of https://gitlab.com/juan.quintela/qemu into staging (2023-02-16 13:09:51 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/a1xndr/qemu/ tags/pr-2023-02-16
>
> for you to fetch changes up to 7d9e5f18a94792ed875a1caed2bfcd1e68a49481:
>
>   docs/fuzz: remove mentions of fork-based fuzzing (2023-02-16 23:02:46 -0500)
>
> ----------------------------------------------------------------
> Replace fork-based fuzzing with reboots.
> Now the fuzzers will reboot the guest between inputs.
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

