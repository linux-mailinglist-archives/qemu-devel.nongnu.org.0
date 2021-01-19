Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D332FBDB5
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 18:32:32 +0100 (CET)
Received: from localhost ([::1]:38466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1urn-00014t-Hg
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 12:32:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1uYQ-0001UZ-EJ
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 12:12:31 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:35973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1uYN-0005TT-W4
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 12:12:30 -0500
Received: by mail-ed1-x52d.google.com with SMTP id b2so22425130edm.3
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 09:12:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EZ2ctHuCZRSSA0vDJeUus78PBx9ryMPOvf5VO8XqsQk=;
 b=cJVdhaJwbZcOAJtFjGXuTM2TQwrOhUmoha0l31CnXaoZVB3kK5BgZy2JtAZycnTRjr
 D7o/d+feVaO7ai1DgBCGq6QFl5JYXUqMs5Nxb2wXaCT42hV1GsChaJyMhVhdtBWulT1/
 4zvgyOdUIInYIWOCsROEvajKK5QEoKYBys71LAfHKUzOnajhFavgowr9nsWLB22gqEY2
 4bAjaJ1bsJHj7wZOBzR2euTjxHd5qGedUnJzbmx3TvL86oEJGiKjUvFLUaAB0V7MqQn+
 /uG/gEpSDY1c/IPYIgSWJPZ/iC+CvU2/QCk270Kc0o4ACcg+Cf5hQJACc/j/EOJSZNgt
 /jNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EZ2ctHuCZRSSA0vDJeUus78PBx9ryMPOvf5VO8XqsQk=;
 b=AZ1gquh6yn8mTsX4KeGkPGfb32iz6NPaFwZNT5MX5LDs4L9RTakYvm8v2zMRAOk8SZ
 YckUd8DW/uWa1Uvn83rU9/FhwTwDsonbILclTx4brgo4dXXRkDdX2+gsF++PtLlEUw4W
 wTRTOIxEQ/J+HbjAQBLtnQ/qmsu17UW17LHabf8r28a3gefo1SuWFcm9EYHTmxF39siG
 GlFZVKpnszTP5XOM+Hvhx0nn5nsPZ4JKslPolBRXhstcQKhxG5n566huOYeN+3e086ev
 djG/O+yCWa6lxSrA7bYKWznJ1XKIrT5+zDzkkOhrIbFbPzYMueva35X5LSCHLjTy8fQa
 5xLw==
X-Gm-Message-State: AOAM530Us33iTkxRzNK0PNmTMtYjg8Lg8hO+b4TNJgWdKxad2SM97elD
 FSJHcibKl4dPDZkEvzmjecJE9jk4RZPYf7AkKiVVgw==
X-Google-Smtp-Source: ABdhPJxu1AZTTq4NA2ZLr3dCAMEZjuH3wWSofLl7AkFi+ERUHZJS2N4Zq1OYDhKSJtddL1JxnPUZEq5mzW10uC9/l6E=
X-Received: by 2002:aa7:dd12:: with SMTP id i18mr3365933edv.36.1611076346256; 
 Tue, 19 Jan 2021 09:12:26 -0800 (PST)
MIME-Version: 1.0
References: <20210115224645.1196742-1-richard.henderson@linaro.org>
 <20210115224645.1196742-17-richard.henderson@linaro.org>
In-Reply-To: <20210115224645.1196742-17-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jan 2021 17:12:15 +0000
Message-ID: <CAFEAcA_qGZTgQ0HMSctMEv+veDwgzdgmHt0uZZSKj7=O6UdqtA@mail.gmail.com>
Subject: Re: [PATCH v3 16/21] linux-user/aarch64: Pass syndrome to EXC_*_ABORT
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 15 Jan 2021 at 22:47, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> A proper syndrome is required to fill in the proper si_code.
> Use page_get_flags to determine permission vs translation for user-only.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v3: Use syndrome.h, arm_deliver_fault.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

