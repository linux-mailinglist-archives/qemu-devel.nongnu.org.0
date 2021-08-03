Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E67E93DF1D4
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 17:53:12 +0200 (CEST)
Received: from localhost ([::1]:59732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAwjA-0008Cs-0T
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 11:53:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mAwi2-0006hg-IV
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 11:52:02 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:52071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mAwi1-0003Ri-2E
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 11:52:02 -0400
Received: by mail-wm1-x334.google.com with SMTP id u15so12762078wmj.1
 for <qemu-devel@nongnu.org>; Tue, 03 Aug 2021 08:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=ewzGgIz0O8XkceZpAnwkNTQPBVnhDTpTXSTap27uQLQ=;
 b=q/lnC9uSkJZxgsQ5IEq/omXBeQB5Sgy97Mqqmj2WTYeRKP79HK1W1JD+jzqkOIH7LX
 Lla1yXkbhFLuRO2bG++VGJ6vcQJpFt1psrqv5YIfPEgz/6dzTIvk8oND9gIkpWBFcavu
 IbL2/ov7BlYMe7O1g+bTgokR5YXeyt8egYBK7XJj6Hxai3AdvA+IG0drZk5Skb1TpOT3
 l4xWh2CRlv2l4zahJmgAUl9U3hOgPru9k5oOtg0r/a78RoVbcg+++lo+XVLcBtY74fHv
 ZMx2BXuwbmMF9WQFnH0r5yXfrE8cmwE3YPu/4r/FxEpI3OzF4eDkQK3Py+MDr3wnfuqi
 SQtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=ewzGgIz0O8XkceZpAnwkNTQPBVnhDTpTXSTap27uQLQ=;
 b=HKUjG9S8CN/m9wrnW4RsQyYX+IzQlr7Y+w3H8EGvOh5B+adWSAJW8HFJQWHdvsVJj4
 vB0CKMtLIy2YJ23drIRDXlNlvP6c/5l96EFY+4TnsrvbE9S75KroD9s740oZYLYoQQ12
 qQ3SQ8njuzYsDIf79MuJjbGcixnBsnywvhFMwt8MLK58l+XI+pPYfRnBE/bkJnE9pcBa
 +SEocQxTf9+j8fN4kQNytnyfww1T3K76hhH0VUdbP68UzSN3wwmF5AwKD8Ud1UvxYh0q
 C9mJRz1ATmSqbSLHISltje33EAhN5yuf2ej6aLPLENK8RKoe9loZ4xQfKPaxrvTqWazH
 cVcA==
X-Gm-Message-State: AOAM532ngN4mIWYer++rs2kk+qY5UagW4ZJ4GWfvupKZLknI4bxJgzbc
 oZtOgXpu8ruAljyZHVXLSFTcvg==
X-Google-Smtp-Source: ABdhPJxV2YNbwiuE3B1BH9OZhQ7PE9/PWr7J3ilROqkP1XrKekJJElIVmBWsXG80Yb4ICtMCY4tDng==
X-Received: by 2002:a7b:c84d:: with SMTP id c13mr1220609wml.18.1628005919586; 
 Tue, 03 Aug 2021 08:51:59 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p2sm15060994wrr.21.2021.08.03.08.51.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 08:51:58 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D658B1FF96;
 Tue,  3 Aug 2021 16:51:57 +0100 (BST)
References: <20210803041443.55452-1-richard.henderson@linaro.org>
 <20210803041443.55452-3-richard.henderson@linaro.org>
User-agent: mu4e 1.6.1; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 02/55] hw/core: Make do_unaligned_access available to
 user-only
Date: Tue, 03 Aug 2021 16:51:52 +0100
In-reply-to: <20210803041443.55452-3-richard.henderson@linaro.org>
Message-ID: <87o8aefrvm.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> We shouldn't be ignoring SIGBUS for user-only.
>
> Move our existing TCGCPUOps hook out from CONFIG_SOFTMMU.
> Move the wrapper, cpu_unaligned_access, to cpu-exec-common.c.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

