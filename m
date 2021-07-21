Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 137893D0C83
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 12:44:05 +0200 (CEST)
Received: from localhost ([::1]:41358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m69hs-0000t0-43
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 06:44:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m69YA-0005xt-GI
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 06:34:02 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:46718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m69Y8-0003Gf-6Y
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 06:34:01 -0400
Received: by mail-wr1-x42f.google.com with SMTP id d12so1591532wre.13
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 03:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=SqvKsJwN2HWXkSVMCMqD1vbf1E4ob7g5jitppwCoxcI=;
 b=idB/E2vS80Ml8q1FVz4y3buJlKhVGNlNwSD4YlAIisZE52glqghhD55cx2QOR7arnV
 EiRAcY1rkh2weXnSz1dTWYsd2U7mt9dddziCpWAa9rcwMdsHeMX8RFKygEO5ejlAZK79
 uhpuIX1p/Z7GrBhCUgnfcWeU1lyEO74a7s/70VVrunURRwIMH3QWDO9aKiqG/w24kX/c
 b+bRlG4HH47+KwmyUMHcJ3RJr08IAsqHGrduApNv9SPH0p+jlqE8/xJKYE7Ii4Pe1s6r
 9wGUpMytcvt0elkIm9ozdr1GiX7KwjI6m3Y7c1+ucgDjXY+XyWjjJ6t19sTx9Yb9vvTx
 hKKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=SqvKsJwN2HWXkSVMCMqD1vbf1E4ob7g5jitppwCoxcI=;
 b=D1fTpEqFjmMqdWBqmHxllFSYhi4CYMa9wmn6+ui5S7Qo2t+Wo+SAMjlEXvKhqpI/OM
 mxrtiuuzlbksXOjKpfC0b60zihSYS8m90RPL89lhce+l0tYTBOhZUG3vAkPOisJUVYsq
 DsfujGBIVCkMZlF85J/jw5tpqGLdpWzeiQqd02Lo5Xm29z5splslGKd7kK7AsQ6Rkdci
 ilX/aEZkhJIY1QebG/nObZAPJIX7GiXFYM51iyTzuK1Gj3Z5t6u0O+uGmRz7gHtXAXpB
 6a9LWYUFNs1M8PK0ftRkJ/qfhW7ZPFnEuXkxJEjzMIlCKiI05n8rkRQzSFZ2mPTJlkT7
 GUxQ==
X-Gm-Message-State: AOAM530CYHaxurtE2UPa2YdNvZy/DSiZDLOI8l7BeBTcjFgq4uaYRcIZ
 RpxwuJzkYCR9oUxcIjtkmam+KQ==
X-Google-Smtp-Source: ABdhPJw5JRRoaVzPvjTZJD8sCa8dw7+emsUo9upoBANgYKcTIs9x6dWUlBUj+WtPTcZA74+fay9Jbw==
X-Received: by 2002:a05:6000:1248:: with SMTP id
 j8mr41811062wrx.391.1626863638894; 
 Wed, 21 Jul 2021 03:33:58 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k22sm21146622wms.47.2021.07.21.03.33.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 03:33:57 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 247481FF7E;
 Wed, 21 Jul 2021 11:33:57 +0100 (BST)
References: <20210720195439.626594-1-richard.henderson@linaro.org>
 <20210720195439.626594-9-richard.henderson@linaro.org>
User-agent: mu4e 1.5.14; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH for-6.1 v6 08/17] hw/core: Introduce
 TCGCPUOps.debug_check_breakpoint
Date: Wed, 21 Jul 2021 11:33:51 +0100
In-reply-to: <20210720195439.626594-9-richard.henderson@linaro.org>
Message-ID: <87eebsklbe.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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
Cc: peter.maydell@linaro.org, mark.cave-ayland@ilande.co.uk,
 qemu-devel@nongnu.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> New hook to return true when an architectural breakpoint is
> to be recognized and false when it should be suppressed.
>
> First use must wait until other pieces are in place.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

