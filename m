Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 367993F6302
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 18:46:16 +0200 (CEST)
Received: from localhost ([::1]:52086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIZZ1-0004lW-8A
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 12:46:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIZV7-0004JC-DT
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 12:42:14 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:35777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIZV5-0007DU-Fy
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 12:42:13 -0400
Received: by mail-ed1-x52a.google.com with SMTP id q17so10751405edv.2
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 09:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cnrb1Javml6m6Yxsj1BdmYKT7BdnlMPBrcsKNKieUXc=;
 b=mE60VwZa3SeFxreH7LJtbhJLHqR/ef4RhJON5zr5Frloq9bWxtn9kcSQVVvrnauziy
 +l5Z0eV1676jluq9amhQIbT3rFoWAmiQQcbifaL426bh0cWX/+KTF9ZEKvPeVc75HoEI
 YPqOimQwpzFd7zaPOHOMv+XSCcLi+kFixOXKbD04Flcd/XJMZAlp67TDDLx9nXph9LU3
 UJ3QNSo7BzNKaoHIfU4bSHIfkvkpnDo4o20NerwTuI3XHMJ01bBQh7ye84SLhOhwNyfl
 KZRKFmD2PQ25zA1y9FvezemMc1fM5kG9Luyt+Lpw0WX3k/gAHfvyyhnT9fNcH1tXcpFF
 x8jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cnrb1Javml6m6Yxsj1BdmYKT7BdnlMPBrcsKNKieUXc=;
 b=TufUHDd0wmZPZSQ0VqESthX7c1RjraN0XLDVgx7c5zneu6h+eOaHbkJn2JEEN3AMTw
 uHX1Q+emqCVD5pixtluos3zZvh6mto5DIp6CF2yYWD7vkOgsoHhe/tIoyoPNojbSVy+C
 c9WRZzSWcKMfipCwzF6a9x09eTA1ftlvITXHNkVfnrt3GWCdu8jolHf+Ro4bROikvEoR
 j1uGBM0f48BurNRa8LVis/MFv0On9S9OI/wMnb1hEyTp7/B4dPHQ6pbYeP+1+7rqhxqs
 pG9UIw/W2khqzH67lQ0VVgHM4l0X4BUtirfLEeMxcAtyKVnqauoDgPLuEFhvycTUDUWB
 EeTA==
X-Gm-Message-State: AOAM530BJ3GvM2ONlkqSJQIjqn4lKPd51A9rOvoSmno+m2y3jY7M4sLB
 be4OBRSLkKBc0I6K0QkKvsEApqD5/4+99ozcKL1J3A==
X-Google-Smtp-Source: ABdhPJxjakkcdpleg/Gq8LsyxCuiz8BT0ZnkREOMe+w/LTNq235oXRjL1S2q6l8SVskzF2KdHG9z9YRfc+KsbEck0q4=
X-Received: by 2002:a05:6402:220e:: with SMTP id
 cq14mr43723499edb.52.1629823328765; 
 Tue, 24 Aug 2021 09:42:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210822035537.283193-1-richard.henderson@linaro.org>
 <20210822035537.283193-20-richard.henderson@linaro.org>
In-Reply-To: <20210822035537.283193-20-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Aug 2021 17:41:20 +0100
Message-ID: <CAFEAcA_fCw1d8H+N_fHETZFoB1_b36vgZu4STELwid7JvXfDxQ@mail.gmail.com>
Subject: Re: [PATCH v2 19/30] linux-user/m68k: Use force_sig_fault,
 force_sigsegv_for_addr
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Commit message should mention behaviour changes.
Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

