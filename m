Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BF469D14C
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 17:25:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU8yI-0005j6-EH; Mon, 20 Feb 2023 11:24:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pU8yG-0005iJ-0M
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 11:24:56 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pU8yE-0002gx-Cu
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 11:24:55 -0500
Received: by mail-pl1-x62b.google.com with SMTP id p1so5221plg.7
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 08:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PYh7G+D483x1tYP0+UMRghHl8TF9iW8kkbMyPbusM5E=;
 b=n/H0wcGF3rBsItilr9QrPwe/ZYxhnsMZqQFZwSMkcpeajmno8bnIg6ivWG63RCs2N4
 hCK1jmUltDnJu0LkmarkNoTvnP0tlGIgR9qxftxtG56xdonWxg9UN30/wdr3LwLlqGau
 ebsPD1zI/bH+IWDtBSdudm3VHcNKMrrLwBew74Gt/9ovtTBBqkNCrS/T0cySMavIDuPK
 jlxeaCKDssiWR8/aFParXXLXEdrsumtvhWZsYbRXu0DQ0ktp6KVWHrp/B5msP0Z/N6a8
 pflWHafGEwzLG/gfWYFbwcOCs2bkJ0k7f2x2i8lJOR8SDPsjSTMsHl9uoSYbptbmoj/t
 Ee8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PYh7G+D483x1tYP0+UMRghHl8TF9iW8kkbMyPbusM5E=;
 b=eDT4p8pMyvcLGKb2WaeKkgO+qSLhxtqmTocORp30xDqh4dxugCJ2wMm8Q9avBBdkB9
 sMF/h+i7WTlFM7e3ieuT2NtQ9J2EsT01m/QOi8ip44fOmqqRnr0YSvn/TX96S7lVR+na
 nDxMyfzAy0ix6tWNcTu0VJrJdYjlXUy8EbnVjMEym31cXvibvqHLS+/TRvVSyHLfBzO2
 lyqqqPFVFkAmc9hyoBLeV1JCDbdrLLoTA5v3QpdhKPbAnh0t7ikOL/w9ccBeK7pSxWco
 5HUJVfJqN0s630kXm3iybKbdg77McvFq1/hHedm+eKg8LgAzXk9fHmY3SkwZsGh7xaFF
 PamA==
X-Gm-Message-State: AO0yUKXP4aZIUuZcB+rxkUhtVXuPfrppJ3s3qvxL0pogbEFj34oViRrs
 s7nKB2ZoCdePnVYr09uSBVHE8x+xAuCDIT/Z8M0toA==
X-Google-Smtp-Source: AK7set/+4I690yeqOGdyP8pK+2+fHQI55A66nekJN+fw0cYtK2IYqpV6oAoT7fzOo1IYasguaNWXU70k/zC5GXKEPZs=
X-Received: by 2002:a17:90b:5109:b0:233:dcb5:ee15 with SMTP id
 sc9-20020a17090b510900b00233dcb5ee15mr1004858pjb.92.1676910292952; Mon, 20
 Feb 2023 08:24:52 -0800 (PST)
MIME-Version: 1.0
References: <20230214163048.903964-1-richard.henderson@linaro.org>
 <20230214163048.903964-10-richard.henderson@linaro.org>
In-Reply-To: <20230214163048.903964-10-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Feb 2023 16:24:41 +0000
Message-ID: <CAFEAcA-w8-9w4WTGDeEJB_YdpvAyhOch=8P6hoEHKqEXA4-uhw@mail.gmail.com>
Subject: Re: [PATCH 09/14] target/arm: Simplify iteration over bit widths
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62b.google.com
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
> Order suf[] by the log8 of the width.
> Use ARRAY_SIZE instead of hard-coding 128.
>
> This changes the order of the union definitions,
> but retains the order of the union-of-union members.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

