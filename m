Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F99C357000
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 17:18:04 +0200 (CEST)
Received: from localhost ([::1]:59802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lU9wR-0002sg-M9
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 11:18:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lU9vZ-0002TO-8i
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 11:17:09 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:45663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lU9vW-0006I3-RC
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 11:17:08 -0400
Received: by mail-ed1-x52a.google.com with SMTP id dd20so14123252edb.12
 for <qemu-devel@nongnu.org>; Wed, 07 Apr 2021 08:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=LKy4cmZVxOnNt9Cg++3FQnC7gixm6rbCQUbSodM5tX0=;
 b=WtjGH0M478PjEUSfqriOFChhmtVT5u+cvrOPL5TdIxr2SKr7tuDXx/i+c8w/+GoSQZ
 1oMAyMF2s5Zbu5oxLxtHWiiu1ODV4/C+hajhLYhiMrft9UOabkZH7FTykai+8NuPTeN2
 bU3Cn07q68aA8ept17IMRWDls5Y1Urae/XcklMGR5URDTqXBnn28wlb2fT0MwHqBs8se
 qFkYhvZpdoJQscLXXpyuEdYbthYtCa9e/pl/3B3b2qluu7piupqVcxeMOTpq3jWXpMC2
 eKJTg0NkJ5K2qVg78YRMl+0dNm/O8ctTERm0ideln5v2KG9V/2nr+wztTAQDhUOdOvPU
 rxPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LKy4cmZVxOnNt9Cg++3FQnC7gixm6rbCQUbSodM5tX0=;
 b=DGoHBqfhXDavxNghcGnuv1gKFQwppkH9tSJPlwdMS75s6aAZGJoQ0UvQdYt6MjeO3Q
 W0B3kr5/bKCIC6LjThpjXY6aa/MrIAPQf5IX3NmuZqO4ldYTJfVYo0ANqb97KGBVRI2h
 WCHVxM6cLQ33ynig/AtVay2JAL+jm3wkRNjKe4pvKmaiTjn9beRjsYPnbkPTvPnOWk2k
 A4nJB/XKhkRvQxKGYFn4lSXRnnHURtSwZd33jHg5TJTTCna17gChW2Zf6gafO7tYtS7+
 qSw8LTqE+fGfEcC8uXk578tMfymv+8T4LVV4J2IUwBUlVWJ+c56Yqg88woT38DNa1A1I
 Dndw==
X-Gm-Message-State: AOAM532KwSX3qw2EqsSO7Ra57CNnQr/+Q6SWsNHk7ZNBbG6slw2PK+Eq
 lPpglChgkXyV+9cPDoz4Ic3QtAyI+wh832sS4J8puA==
X-Google-Smtp-Source: ABdhPJxmgXzJeqVR23mK2pCI9YB06RzUHCPBr5w6d5hrn7cRwfJSqsig128iMUKUFCNALhwgGkp1HfMa9pLp288IBpc=
X-Received: by 2002:a05:6402:c:: with SMTP id
 d12mr5033096edu.100.1617808625157; 
 Wed, 07 Apr 2021 08:17:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210315204004.2025219-1-richard.henderson@linaro.org>
 <c8a434a8-9f88-99cf-a136-6099626b2477@vivier.eu>
In-Reply-To: <c8a434a8-9f88-99cf-a136-6099626b2477@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 7 Apr 2021 15:16:25 +0000
Message-ID: <CAFEAcA8L6asqjxrnEXBv9W8G95dXHrYzOeqbxxXP6nm7EkzXMg@mail.gmail.com>
Subject: Re: [PATCH] linux-user: Use signed lengths in uaccess.c
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 15 Mar 2021 at 21:07, Laurent Vivier <laurent@vivier.eu> wrote:
>
> Le 15/03/2021 =C3=A0 21:40, Richard Henderson a =C3=A9crit :
> > Partially revert 09f679b62dff, but only for the length arguments.
> > Instead of reverting to long, use ssize_t.  Reinstate the > 0 check
> > in unlock_user.
> >
> > Fixes: 09f679b62dff
> > Reported-by: Coverity (CID 1446711)
> > Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

> Reviewed-by: Laurent Vivier <laurent@vivier.eu>

Hi -- did this patch get lost? I think we should put it into 6.0.

thanks
-- PMM

