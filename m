Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0A83F62AE
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 18:29:38 +0200 (CEST)
Received: from localhost ([::1]:45864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIZIv-0004FR-5s
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 12:29:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIZHm-0003ZZ-2y
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 12:28:26 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:35688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIZHh-0006cJ-Db
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 12:28:25 -0400
Received: by mail-ej1-x634.google.com with SMTP id i21so4281611ejd.2
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 09:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aSEv9WveLS67JlFaEncIQMlc1qJGfVEw1t5rMM6HpAE=;
 b=xOfVogQHquy6XprZeVrXpiu0m0/neuyXsEYnNXtPYqsEkWn1T0PtIU7WA7PRvlh3gl
 MvpeG7yTS77MKcyzX7uEynemJPpsRTyY6cHJnDn57RLUDKBeTY9AtZBDKPwq4hbPAMK+
 rjGrwMpD9ylgc3hyKDt5EOUqACnHQjrFuD7U51Ba6vtcUoa6XTWK+DfMERKHPQoFelvH
 4j1c0U8ZTVQn0n52xcxdswZVmOA7Q/m7cT7RB6ULN5zJwrJTyvmrht7+VJNoB1VQx1UY
 P0U4yjqyPrhGzChuWErSeSOOJ22R5IftMXzjo/s1XOPdpu0m1+qxBzTlWssgs1b0pZZr
 vONQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aSEv9WveLS67JlFaEncIQMlc1qJGfVEw1t5rMM6HpAE=;
 b=JwKKxd3l4ibjOGy+EcGSU6mrQcUwG/CTzsgMWzQJUhTadMBLBO1m3pEe5WeS+rzndk
 JJrRyGGy9eDu77qOST2LgVLSihsj8ed1Zo9NVGdhOQ4s9jehQgT5LOs2WqmafymgB9WP
 w1Ao4uWbskO4dVNx2vreJbkiJ+FYilQYNQWfO/Kx94Nt31MNxGgwJlMcvaAnMjCoZKAs
 ktA3nbBP7gRBPrhaQMD2zM/lqTaEBTgBoY+6kJRTZGPDl6L769WHnBYNqbOvynCz4X4w
 tGtJgwL1EjKJoxmGaFX2mEnXQeoD6vTFFHVeuQl8VRy2ZZbIJWI8Oa2EFGmHnefqaM8P
 X/Eg==
X-Gm-Message-State: AOAM530q3u4VSBVEhKXTNIse/oo/8WT+oaJAHzpqqYkkh0OF+mCydsOm
 Xwx5NXbi1W0uUUJPfCb2lQZsjHd6QXf1ctKeXsV/1Q==
X-Google-Smtp-Source: ABdhPJyPOetXZv2IPB77lzDnlcLZ7zhcsmFtd82dGIMuWMsWn9r8dfDH82dqmZ4AWQOHVTRKLV3OFbFDFME2H0ZKvwE=
X-Received: by 2002:a17:906:3bc3:: with SMTP id
 v3mr41678415ejf.482.1629822499374; 
 Tue, 24 Aug 2021 09:28:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210822035537.283193-1-richard.henderson@linaro.org>
 <20210822035537.283193-13-richard.henderson@linaro.org>
In-Reply-To: <20210822035537.283193-13-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Aug 2021 17:27:32 +0100
Message-ID: <CAFEAcA9-L7BmzFcSZiv-LVrSihRe4QH+5FZBDQ3Z4687XZUkpw@mail.gmail.com>
Subject: Re: [PATCH v2 12/30] linux-user/cris: Use force_sig_fault,
 force_sigsegv_code
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 22 Aug 2021 at 04:55, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use the new functions instead of setting up a target_siginfo_t
> and calling queue_signal.

You should mention in the commit message that this fixes two bugs:
 * SIGSEGV not distinguishing MAPERR from ACCERR
 * SIGTRAP on breakpoint not setting the address

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

