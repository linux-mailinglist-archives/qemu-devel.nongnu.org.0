Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5E439A073
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 13:59:50 +0200 (CEST)
Received: from localhost ([::1]:44986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lom0r-0006dG-Ax
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 07:59:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lolzV-0005wz-O6
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 07:58:25 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:36409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lolzT-0008QO-UT
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 07:58:25 -0400
Received: by mail-wr1-x42c.google.com with SMTP id n4so5576107wrw.3
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 04:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=YGpbtKgHBeVLvNfdNRpJ2CYc4rMZubYSRq6uxjgOhL8=;
 b=Ec7gvQmjGqOt+wh5oa0sgR41OWHpWe2ehaluVsH2EYfKU19sOYaaMuGYRvCJgLj/Bc
 DgjrkQ+Pf7r7SaqLfu9l1t658D4csk+mbqyM1jlwg3fS/mq/jXs/7uTn/0HiqncdyIwL
 JSfWhq2GPAXDMn5b6sZiU/WSFWtANMdoNf1lzVr+FVaBvv6Dabv0Kv8hi2gcUQwNP1gW
 ePB442XnE6Sj5V8Y7GrZe35N9u5/olHw8W7HI42B2V3Rmi2WdQjLaKpv71/C6LKRTMUK
 DA7PndVS5aTza5BdQpY0et5qQpT78OlkV9vYjjljgGTPBZ7lDRSZrTjfygO9V2OxiT+N
 chpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=YGpbtKgHBeVLvNfdNRpJ2CYc4rMZubYSRq6uxjgOhL8=;
 b=BBlawUNTpqzh8zqtCKjmlnWQsgPYhRKcc1k16gfOlbRxKhLz5cF5P7/ZHaJd3XwwiN
 LgHm09bPDEEbU9jxid66gYbFY4MoY1YBQZR7ZD/QBFrDyrh2uo6eWl8vF3xuUkCNHpy+
 dUIOMoohJOVciY5leAxhlvHVqz8CXlv7OOE1eQ7b1KcIHhixxSOGPhOiJu8TPteBDURJ
 17ls2uetk9ZPrkt8IJ1NLPD6L/GyY7IPFdK7BPVYMDuQUqigUFC8CkRe8keCMfpOavN/
 6eSte7G/j1H69Xm9iCmYFUitowt/ycmtQlm7vBhtF2NIUeHcmeevSTdUwtR42SgofiuR
 m+8Q==
X-Gm-Message-State: AOAM531ncS+ITDwHZTTRxKyVY/Ji+uLNKg0mAXR5ZyWj2JqMf0tAG5Lg
 SZhqv9/I9Aypadv+a8exiOJv/Q==
X-Google-Smtp-Source: ABdhPJxng1yUISt+gMn9gIcfrK0I1vBz0LaIeFvO1Yb/Sz2SiZdsxuOJ4VV0ZmUU9WoeOT04NXTqKw==
X-Received: by 2002:adf:e307:: with SMTP id b7mr39014185wrj.325.1622721501875; 
 Thu, 03 Jun 2021 04:58:21 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t14sm5402304wmq.16.2021.06.03.04.58.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 04:58:21 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 42A531FF7E;
 Thu,  3 Jun 2021 12:58:20 +0100 (BST)
References: <20210525150706.294968-1-richard.henderson@linaro.org>
 <20210525150706.294968-12-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 11/28] softfloat: Adjust parts_uncanon_normal for
 floatx80
Date: Thu, 03 Jun 2021 12:58:14 +0100
In-reply-to: <20210525150706.294968-12-richard.henderson@linaro.org>
Message-ID: <87czt39n37.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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
Cc: qemu-devel@nongnu.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> With floatx80_precision_x, the rounding happens across
> the break between words.  Notice this case with
>
>   frac_lsb =3D round_mask + 1 -> 0
>
> and check the bits in frac_hi as needed.
>
> In addition, since frac_shift =3D=3D 0, we won't implicitly clear
> round_mask via the right-shift, so explicitly clear those bits.
> This fixes rounding for floatx80_precision_[sd].
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

