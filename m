Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 777B869D1B5
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 17:52:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU9Mz-0003zG-61; Mon, 20 Feb 2023 11:50:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pU9Mx-0003yx-Cb
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 11:50:27 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pU9Mt-0007sG-TF
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 11:50:26 -0500
Received: by mail-pl1-x62b.google.com with SMTP id bh1so2148181plb.11
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 08:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9FWFgb/x2LH+v1tyjo0ceacshOWHKgvwOgsn0eycxtM=;
 b=p9zJs8LaJgX35JFYTtEl2HPe7ws5POARdfWlB/EOEfSxQjlnfqdlLEZ0Uap83Y/l/x
 Q2kPJnZwEchhqUa94TmLla2rS7RhwXchdMHm7yLLTnBzVdr9lEMUZqR+mUW+SwckU0U1
 3Gz/ifKX87LAeyDVeNwDQflA4amM7yqoo+wPuAwrW9366vMFGc945qFDHeu1LKgbkk37
 WX7DkzhYZpWkUr1/QVgGvl/hnBLUWoWu5r1BTJ8GqWqWf2inwj4xSIJd/2956mePgBUi
 SsdjWmq7Gl96C0H/ojI7DoPPU7XFLmVE7xuklVbDf7fvcNZijT8aUFGSCcGnG3V/Wu1i
 PVvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9FWFgb/x2LH+v1tyjo0ceacshOWHKgvwOgsn0eycxtM=;
 b=3OQ45RmjZkbeSFxOEi8e76FigHdhbLSrr0g/ilVeCCqGscUXzvjPdo4gb9Y+M1jfK6
 lzj+W/pcF204s7Fc0lCHqivHkSw/JZIjM6PV71Q1QpVXYGsPTLocUoo0qBmF5Goa+iqi
 +q12xlsVWcS3zYs/WkYzwq0AR19MlYV77tseIep9SMdeFUuSwJ/20oOrthC78zBjBbo2
 LkGg5ByXPdSt52jImNxFny/zSz5O9x/EEn9bSCDDPqst1KfD8QBgpE24+aiYh8JnFt6i
 1Px7ovdGfQNbghbGr6+NGyPkNeVqGUq1Ru6KrsQbvQJqnRZPReF5cu32pijleCpwF1PT
 cavA==
X-Gm-Message-State: AO0yUKU1pQJPOA+i5PP6Ekm9ZiDpmcYcPuk7WO/gjDIDIoMvFnJu9r4i
 d4nKb4Urr8Nj8+5tnwNKWfDE62noYVYBswaeyMxLfg==
X-Google-Smtp-Source: AK7set+8IbRY3XB2w0NLFqtoPh+1keOFs5Z/oK7MWvfvoLiYP/BFw5k1MKFZtYZ2ZKy+hNizf2usrQ8Ti31p4sotpg8=
X-Received: by 2002:a17:90b:5109:b0:233:dcb5:ee15 with SMTP id
 sc9-20020a17090b510900b00233dcb5ee15mr1021912pjb.92.1676911822107; Mon, 20
 Feb 2023 08:50:22 -0800 (PST)
MIME-Version: 1.0
References: <20230214163048.903964-1-richard.henderson@linaro.org>
 <20230214163048.903964-13-richard.henderson@linaro.org>
In-Reply-To: <20230214163048.903964-13-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Feb 2023 16:50:11 +0000
Message-ID: <CAFEAcA9Ba8Zw4u68g0qr03FAgy-Oe8yQvCymmKYFrF17MyPHGg@mail.gmail.com>
Subject: Re: [PATCH 12/14] target/arm: Export arm_v7m_mrs_control
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, David Reiss <dreiss@meta.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62b.google.com
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

On Tue, 14 Feb 2023 at 16:32, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> From: David Reiss <dreiss@meta.com>
>
> Allow the function to be used outside of m_helper.c.
> Rename with an "arm_" prefix.
>
> Signed-off-by: David Reiss <dreiss@meta.com>
> [rth: Split out of a larger patch]
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

