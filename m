Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 821C12CA58F
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 15:28:18 +0100 (CET)
Received: from localhost ([::1]:43790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk6dd-0007Mw-0I
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 09:28:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kk6cm-0006oY-MG
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 09:27:24 -0500
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544]:32788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kk6ck-000241-Ru
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 09:27:24 -0500
Received: by mail-ed1-x544.google.com with SMTP id k4so3541658edl.0
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 06:27:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ddtKXTohIZxj7TGzGY77nRr+I1wv/ffqfGAyhdo35/Y=;
 b=ZgmpCTC6Qw+Mc3HvgsQ3+cKelGTUjMexkw9cFnPbbVVQVozWK6RerAuGQ7+z8fazh0
 UScZanzr1Yi8XMw8CgIw2ye4MfSa11XNQU2rkIUpr4qby51j32Ut8ZYNhF5r3rb/1JlX
 ZTGZQsf6F0QVSaE0W6Z0SAMdfJJVnPJuiwAemEy531Ey9pYq3XQJ3GwRRptw9uEgkseE
 58oJC/TcXioMjrP4LkODgNT28QIpAfZPJblfQcMTSo0fffNy95ZoQYIYR9WqNSkZxmuk
 860OYYqI//gb9A5/78etxfNFl44FgxIVPV8YSLFijFeXTtaprM/4goure2ZYoPTFsWQS
 fklA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ddtKXTohIZxj7TGzGY77nRr+I1wv/ffqfGAyhdo35/Y=;
 b=gED4WjDHZvQIMR48TqYxVLIWUmOiLG+1VRwFZfzLTCHK6lBax7KFGO7HxUUdveiI3P
 UlPLtBrYqDCs404r3U0rebpA1/vtbjt75548+xzq4JX4+K53GPjsbHb9Bk5Q8wL6mKiO
 6rkcLsW+GBFlUxa8tN2Ej5k0gZA9KL5lrxXipVKYH3eek7euwXMUL5dqJStFbFY6Q7Em
 LdInOMXrytIKIJyjOXGhWktwUy45CYmEJeiKzfUVxjXkPmdj/xKvdZPCaRuH/V9QYnk8
 IqObkRU/CaCSEgy53xBWTGlT1lSoy2xfQ0jr6WpNkv31DCNybcBD9U2CWnswyYNGDc9j
 V6Ow==
X-Gm-Message-State: AOAM532gVoobegE3xcNTRLX8DLJj0CjsNp1AzkxhHeCFGfbFIS7OKkQx
 KVRUSxJs5O756lF/toulMKWI9Hxoo/ZAxRIRa5tcqw==
X-Google-Smtp-Source: ABdhPJyBzR6MIsod5aYnXnxafJ+QNN8sqPDLm+Lj+ttDCG0yKNBLTW+oHHXnNriUxilAtIwBMdqQgpA5fj6A1NSUsu0=
X-Received: by 2002:a50:fd18:: with SMTP id i24mr2848901eds.146.1606832840820; 
 Tue, 01 Dec 2020 06:27:20 -0800 (PST)
MIME-Version: 1.0
References: <20201125040642.2339476-1-richard.henderson@linaro.org>
In-Reply-To: <20201125040642.2339476-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Dec 2020 14:27:08 +0000
Message-ID: <CAFEAcA_0=iTLma9KgmW3jDhP=JYDaT9rVHZO5h3yaFDm8KUAnw@mail.gmail.com>
Subject: Re: [PATCH for-6.0 00/11] target/arm: enforce alignment
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::544;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x544.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 25 Nov 2020 at 04:06, Richard Henderson
<richard.henderson@linaro.org> wrote:
> As reported in https://bugs.launchpad.net/bugs/1905356
>
> Not implementing SCTLR.A, but all of the other required
> alignment for SCTLR.A=0 in Table A3-1.

Any particular reason not to also support SCTLR.A ?

Also not implementing the old v5 unaligned access behaviour,
but we never have done that...

Whole series:
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

