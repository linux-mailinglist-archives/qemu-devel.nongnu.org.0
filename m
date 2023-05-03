Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A28C26F5C88
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 19:06:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puFvA-0005Rq-BF; Wed, 03 May 2023 13:05:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1puFv8-0005RV-1j
 for qemu-devel@nongnu.org; Wed, 03 May 2023 13:05:38 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1puFv6-0002fP-DM
 for qemu-devel@nongnu.org; Wed, 03 May 2023 13:05:37 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-306281edf15so4729616f8f.1
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 10:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683133533; x=1685725533;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OIN0572oxzIabjAxlkcYqWFCtuJDRoxBxILkeJgvpuU=;
 b=s6hKSyGPv0lazFMkBwE/nTTisHPaA45Z2XrFYH+Td3ui70O5Hv1R6SC04nvbbYE241
 owW6OlnnnVV61loa8sjmJ3hJPzj9Rs8qEISmZK8L1ZUfEgwgQjYpuwjnX8IDlXg7jEzP
 gZcAnUYV2i0K6glStWU/3T305PERxXGtSggq7y1eZbTHP+jNqyVTY5s/OVb94VFt49q1
 smymOTO9PFocMi/5YIMsFoTueGQ/YcjvI4L1OjAzPrZSICgAfvYv2dZVe21Q2MwKSJVQ
 0vYH/dQN8AXaZt9Q2Ka4kRtyNWWV6MWZDCtiJwxRc+pUWScHsXEFq5d9CiBZeZ4dtsLK
 LR3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683133533; x=1685725533;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=OIN0572oxzIabjAxlkcYqWFCtuJDRoxBxILkeJgvpuU=;
 b=Z/vXAAiLWKJYnSjSRjHkIdObWaGiVhgX6lm46m3G9m0WF1l72mFB3VOqT/zsSgWyjv
 PqbrQ1HTi0wMiaw1PIjEd/nokCzZBeH/6Aw93l2YX0lFdKsKc8sb4by3Ud3OAPrV+Y94
 ktjQilmTlISKb3ww4q1txn22HD/iVIjZ45ypM5svkqjajcuuEBNbckMhfnUvd6b2bSK1
 Dn9uNx87lSAICLKoyP1M/4iesufdNggYaLv5IRji/Z9j9Y04tHYP/hPWZuUNkDY0FicS
 0z0rSO0HNHMnZhM8UJfWRC1fmkCOUp3ey59b6cISuzJ+prwKji3qTxlzUpkRzEl+qRqH
 vbbA==
X-Gm-Message-State: AC+VfDwNItjw9aJ5CaFPqG4iQT63mVttn7L3PwbSJBvTI3ozDGLOqG31
 7CaOp+ev/Xb12a4bxm2ObX+Y1Q==
X-Google-Smtp-Source: ACHHUZ6AuSfzIez5XKA3OvFimw3I0mVV5cx+NXPgJo94BRrAOB7TVBP/T0QQHmGoJvvuYK+rZBLapg==
X-Received: by 2002:a5d:6544:0:b0:2fb:600e:55bd with SMTP id
 z4-20020a5d6544000000b002fb600e55bdmr572395wrv.39.1683133533514; 
 Wed, 03 May 2023 10:05:33 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 p10-20020a5d48ca000000b003047dc162f7sm25001144wrs.67.2023.05.03.10.05.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 10:05:33 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A882E1FFBA;
 Wed,  3 May 2023 18:05:32 +0100 (BST)
References: <CAP5Nno6wrz4qEMK70KFwxoZWeo89+SAyXDXFW8A30mJ-WeFi4A@mail.gmail.com>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Jun Sun <jsun@junsun.net>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH risu] use time() as random seed and introduce --randseed
 option
Date: Wed, 03 May 2023 18:03:52 +0100
In-reply-to: <CAP5Nno6wrz4qEMK70KFwxoZWeo89+SAyXDXFW8A30mJ-WeFi4A@mail.gmail.com>
Message-ID: <87ttwts5ur.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


Jun Sun <jsun@junsun.net> writes:

> By default, risu currently does not generate random instruction sequences=
 because it uses 0 as the random seed.=20
> This patch uses time() as random seed and also introduces --randomseed op=
tion for deterministic sequence
> generation.

I can see the benefit for being able to change the seed but I think
using time() by default means any given sequence won't be reproducible.
This is useful behaviour if you want to regenerate the same test
sequence on another machine without copying stuff about.

>
> [4. text/x-diff; 0008-add-randseed-option-and-use-time-as-default-seed.pa=
tch]...


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

