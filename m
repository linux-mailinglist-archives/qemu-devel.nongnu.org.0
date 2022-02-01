Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A974A681C
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 23:39:56 +0100 (CET)
Received: from localhost ([::1]:55154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF1oZ-0003s1-CM
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 17:39:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nExt7-0002Bf-WE
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 13:28:22 -0500
Received: from [2a00:1450:4864:20::531] (port=43590
 helo=mail-ed1-x531.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nExt5-0001cY-OJ
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 13:28:21 -0500
Received: by mail-ed1-x531.google.com with SMTP id w14so36286434edd.10
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 10:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=r14SxrV+UihwQ7OTgqeRlVFuNAPONqm+Am8RHXQWA9c=;
 b=uMXefrsf/a5t6Y4IfttRg9rLAsDebQyK13151YXGimE05hLrNeNmvHl5aNr3khuMLs
 ysNB5ni+U+tM11ZiqcVEbwMw3pZbtng0F4npJlbH6W19wxep/i35buudE91FOVUdEYBJ
 N4zflvb+6i3eBH4vWneq9E8yq/Od6/RyQPLk27daImQukw53FQs89tOZfDPqI0VPFHM2
 lzuyS340qHhglJpRG09IfcJaeNLswDtyplA2OzyTYiTFxEIwL332MHcPgSvZkjbsM7K4
 hV+JpjczzXJQCuWLwg6OYRzJF04kbjstGdTW1bKyx9Wlxe5wUeP+v3/AduKkUraoa6mt
 la5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=r14SxrV+UihwQ7OTgqeRlVFuNAPONqm+Am8RHXQWA9c=;
 b=QvaOIeTIt2b6bdH4VsOEaMp6ZPU2QMIhVu6CDmC98fxjgzPfHFpUHoWUgVvjpbRzVU
 w+XzPeTymZl/GLNqInnQ3yCc6svHCuQoAayvD9jEuA8PV4vDkDqZjRWtdhvY0cB0qtT6
 kX9jC1vjs6kvX/lbRgyBDObc9UxRSfDdD/QMt8tTwgFNh/rruGQm/cHEkvUhvADGSLr3
 mCr4nDN56ii6tTZuC7qy77az+vwTokaj02+eTjjEOjR544KrpiZDTGy1AgIxlrxQxJ8X
 v20i5pgHlaxOCr5ypdJolKZk+9UBrp/DIk+kcropBFR5spwaRW/tAF0GvWEcGxqk8akg
 iTcg==
X-Gm-Message-State: AOAM531m11YP3kQHFehWA+lvkWKjpOlkBHFqS/VUO9MvZ41R0MF7NcMx
 94QfdEAxedEM95oM5oKuvvuKx6YSw/h6MA==
X-Google-Smtp-Source: ABdhPJzcpHAN/K5NJUuFjISFAy1OLvb+295XG04/WAh05YAf5pxKE4RMyn29WeiFjHZ85sF4aqslhg==
X-Received: by 2002:a05:6402:1ac5:: with SMTP id
 ba5mr26880499edb.337.1643740098404; 
 Tue, 01 Feb 2022 10:28:18 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id lt12sm14745375ejb.166.2022.02.01.10.28.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 10:28:17 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C6AD71FFBD;
 Tue,  1 Feb 2022 18:28:16 +0000 (GMT)
References: <20211218194250.247633-1-richard.henderson@linaro.org>
 <20211218194250.247633-3-richard.henderson@linaro.org>
User-agent: mu4e 1.7.6; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 02/20] tcg: Add opcodes for vector nand, nor, eqv
Date: Tue, 01 Feb 2022 18:28:12 +0000
In-reply-to: <20211218194250.247633-3-richard.henderson@linaro.org>
Message-ID: <87bkzqxwzj.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::531
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> We've had placeholders for these opcodes for a while,
> and should have support on ppc, s390x and avx512 hosts.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

