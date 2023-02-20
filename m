Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0994069D142
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 17:21:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU8ue-00044i-DE; Mon, 20 Feb 2023 11:21:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pU8ub-000445-87
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 11:21:09 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pU8uW-00026i-VU
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 11:21:08 -0500
Received: by mail-pg1-x531.google.com with SMTP id s17so953005pgv.4
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 08:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=R0CigNqR+y6mQy6PcWAcwhXjOfblUxZgAnIovVi+BwQ=;
 b=XLl5G//nHtIB3B3Zjw99kr1he/EzwwOUlV/jY5SAx1TD1L8l/VKA9sC/tHLdltiHWP
 L/v3UUM/VYuOh7t7rWqj4cYNpfMmvq9dy6BZpheVQMycdvCGGiDehM7acs8/AmEKjn/z
 JQaoxbGcDfM4tyhiKZkuaDecnkvG7l+SAzrHCjPtRtXwZ/S0brz1CwwkKMQ77ylrhZlp
 qgtuWBosG3tS30yANqfYzjbSxUz78ZekxGWdRkSP2m2ExjFgia2LSUDbge33M8MSH8HT
 TOp+9hXhb6PrxDGgtzAXBemFq6gvBgr3ymIBNdhp9n2GqRawzk8lEJJCI2zENXKJJ+Gf
 jsHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=R0CigNqR+y6mQy6PcWAcwhXjOfblUxZgAnIovVi+BwQ=;
 b=HY5Kt/X4Q3+G37sghrGExTLNTmI31LYbU5P+szlgYjJdgV+cuLMi6PL6EXVJhqIDo5
 XCm+rZ1QMDx9nNOBN4Vsv1neQwp26Mqw8qepnIqRuMmIaDxDzwslXaRMuya+o/wivJAN
 8KtNwS3VZYHi4HveO0OhDt2+SaDqc45E4fngw4m4tHOw8UZBnKRJu7DuiUxIPRkx534a
 VZ4ru+bq+pEytkt99zc/N5ZhCdF6+9kaEA5vw0DeJN0dsq3hCtiD7CkABd/U+RSU9ASV
 fmdw22TAHkUwsm0lg6GPWyAb2d/Rw3F59Lp9VDXKW/UvTp2dx+Dzn+0n5DiY67Lh2c72
 pkNA==
X-Gm-Message-State: AO0yUKVx/UYGfjIf5nwp4+NwpA4EBrBF2XnLNRhq2VH/dorIDSj//7AJ
 887Uw5RSwDJp/j+ONjOl5fXjat7Ma1Z/BTCg7QbxUA==
X-Google-Smtp-Source: AK7set/ZESQcIkmAyM8dChjWZLKB+eTlzpkCIwiTjHgHVj01IuNu1JMDV+TlN3PKlbNHiHEJyFifEpBB7oZTHOhGHUU=
X-Received: by 2002:aa7:9396:0:b0:590:3182:933a with SMTP id
 t22-20020aa79396000000b005903182933amr265126pfe.1.1676910063336; Mon, 20 Feb
 2023 08:21:03 -0800 (PST)
MIME-Version: 1.0
References: <20230214163048.903964-1-richard.henderson@linaro.org>
 <20230214163048.903964-9-richard.henderson@linaro.org>
In-Reply-To: <20230214163048.903964-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Feb 2023 16:20:52 +0000
Message-ID: <CAFEAcA-tOWZq-ppwn__ct+qiRBHPRgPO6dy6QBUWmcHChZA-cA@mail.gmail.com>
Subject: Re: [PATCH 08/14] target/arm: Add name argument to
 output_vector_union_type
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
> This will make the function usable between SVE and SME.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

