Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA508559E9F
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 18:35:38 +0200 (CEST)
Received: from localhost ([::1]:58476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4mHR-0007i8-UA
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 12:35:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4mFA-0005uZ-To
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 12:33:16 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a]:35800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4mF8-0000YU-O8
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 12:33:16 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-317741c86fdso30128927b3.2
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 09:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VCz+mrOA1QxEy1SLHzgHEqsfbnXpZ4o3pzny4FMWhKc=;
 b=V5k/KV4unUYM+MgCNoKIUOK8OhdanWwM6epc52WOCyaUPe7uPrEtYhrEC3TSjh1/WL
 NeLwt8ZXGTYJAsnRoWYbG9RfIQTZVIJ2h8No5dKp3HPBslbcSiYD9mUmiOWvm+XgHTqs
 CISH4EqeLAr3l/MKc1gXiU1T03qsnggh8O+ty3DRxop+Y+16b0ykU0id/iSN6LhVF418
 4TsX2YfVFqmRuY1ZdYpyeEzUb1+XbquXjIf5TVOisOOoVJNP9l9d6bH5GVfltjjfiAA3
 ukvPqjLsv7OL897IidTbKeaHiqy52eejg6w1odQked93DMGfk+Oh1WxjlRTBoYEGPxBq
 Kzyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VCz+mrOA1QxEy1SLHzgHEqsfbnXpZ4o3pzny4FMWhKc=;
 b=XimyMzGzT7/lNChRSlL4uBzup11C/E/3HbKw9SwSqP0p8Rm2+qQ8oPz648alH48e7O
 dWLoUzKhWgfyyvr6hL01ZYOAL6p4LHrfUiLpReuhsRqeg8IOQ0zqNZoggVOuMyqr3xUj
 hTfSL2mjfQs1Bk/6P+4eYMTWwFeScVZcCS01z3KgWYbZfJT2xAW8wS4/FoGBsP7Hikph
 BmRcfIhuZ0KP1YZj7FO2NBDTG306KUg5fXVxQ4F8/iioM9UOCf5x7I7hH0yGmvS5ZC7y
 ZHprtrQ3qfTYWZPOnvKM8UWpBVKOUt+irT5PPOTYtpizwyunG+EG6trATjUpHWN/gwvk
 dq4g==
X-Gm-Message-State: AJIora+gJj4X0fbSpqGvLziRdvzUs1YmKiavrdqnrZqOIJZf5HL2gAU3
 BROZoE+CoNsPIYPs/koCBtO0taPurQwINjacFLG9dg==
X-Google-Smtp-Source: AGRyM1t6A3ODdrqOsDMndD3KJoCrvPzdL4foidVhXsg2JzBf46/aQiSttyTN7CK3crIuYvPghTZquj5eGwN/t6l5GNo=
X-Received: by 2002:a0d:d712:0:b0:317:a108:9778 with SMTP id
 z18-20020a0dd712000000b00317a1089778mr17923074ywd.64.1656088393320; Fri, 24
 Jun 2022 09:33:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220619001541.131672-1-richard.henderson@linaro.org>
In-Reply-To: <20220619001541.131672-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Jun 2022 17:32:36 +0100
Message-ID: <CAFEAcA9OekbvO1tH-SU16sgXTDmc8gNuDMH3+OkEJoDD36TxoQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] target/arm: Fix issue 1078
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, He Zhe <zhe.he@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 19 Jun 2022 at 01:16, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Nicely summarized by the reporter, but I thought it would be
> nicer to pull all of the logic into arm_pamax, rather than
> leave it separated.

Applied to target-arm.next, thanks.

I think the hang He Zhe reports as still present is an
unrelated issue (I should check the v7 LPAE spec about
block descriptors I guess).

-- PMM

