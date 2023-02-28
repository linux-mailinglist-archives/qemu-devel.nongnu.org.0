Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD0A6A5E6B
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 18:51:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX46O-0002xE-Kq; Tue, 28 Feb 2023 12:49:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pX468-0002ux-GD
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 12:49:10 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pX465-0003Ba-TA
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 12:49:08 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 r19-20020a05600c459300b003eb3e2a5e7bso4744856wmo.0
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 09:49:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RyEex2E9ykEwAlmfrLz3IQ7ozOV+CYM8LCRwylGuTKs=;
 b=bNB9LPU59hrLYiEIVeOXSw7YjFRPK2vHxiLGI5hHxyU+lRLVTNXqkoPtv7GDq25Czy
 8ObwegsAubGHUM1MhIOfREwMRBThk99dVZtR2RX+PPqeJQC9Gsarq8FBw6Ko9zgLfDsm
 xk6YbQGdvtcfkP3Jjr8W+R7ZB3H8auUzl4WtvfDbN6JVBPTRMu70BRFjcCeFTg7S8L8Y
 lcTp7tTkZHYI0+vKtG69pGuptq4aUjwoD/anzuWdagn444zru0CeMeQkeGzByuMjfb1a
 cA4U56XcesegpfjbFe3f3ewuoe+Ln6yaL+eBoyMNYZHNdOWD8O9BqwdyfvCdCcvaXx1o
 FnQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=RyEex2E9ykEwAlmfrLz3IQ7ozOV+CYM8LCRwylGuTKs=;
 b=u/5Ck2hcPlNstsDtji4Dsk61ryFi6LjNGdhWIStgbt33yQ5q7DwgEiTf9VyTfR9VqO
 InKnAL7Ftl+ISRoDtPJ5k8L/0zQvN/tNMkgY4Svkk2vr6GFG8r7UFph+cYHGDaqo53WQ
 2bgo5MsSJPnoMZovW7F8qqZFwTN+35QnI1/8Bcq8tH1AxtQD3v0TfnwxMaBIRVZwj8qZ
 nhIOljUyTqLkKTXOAZoja+sjoAQjo0oUPA4Yes65in6RfP3D7HmjwgjgQiBQjnA/SHVj
 yWdvwnpE4aSWCuYysn4l8mDJqHj3mLuVMM+yoQxs/5gYXqlLLwqsBK/hYz86ZsQMV+K4
 h78Q==
X-Gm-Message-State: AO0yUKWM3khpxOAkbcBGHTc6kkdh7kdqE3gthmmrtzlBvQ3I0dG4DQd8
 g7EXI0tIXJRytQVKYcc1Deyn5Q==
X-Google-Smtp-Source: AK7set9oFQVtxamAy9B0ii5JKs1rwpymJFdELEIbXGZQQTOOppGtaFES43+vzdp4hN5wtljnOduBuw==
X-Received: by 2002:a05:600c:4f92:b0:3eb:246d:7efd with SMTP id
 n18-20020a05600c4f9200b003eb246d7efdmr10164329wmq.2.1677606541035; 
 Tue, 28 Feb 2023 09:49:01 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 m4-20020a05600c4f4400b003e209b45f6bsm18020644wmq.29.2023.02.28.09.49.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 09:49:00 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4ABD31FFB7;
 Tue, 28 Feb 2023 17:49:00 +0000 (GMT)
References: <20230227053701.368744-1-richard.henderson@linaro.org>
 <20230227053701.368744-18-richard.henderson@linaro.org>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com, qemu-arm@nongnu.org
Subject: Re: [PATCH v4 17/31] tcg: Don't re-use TEMP_TB temporaries
Date: Tue, 28 Feb 2023 17:48:52 +0000
In-reply-to: <20230227053701.368744-18-richard.henderson@linaro.org>
Message-ID: <87zg8xel4j.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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


Richard Henderson <richard.henderson@linaro.org> writes:

> Reusing TEMP_TB interferes with detecting whether the
> temp can be adjusted to TEMP_EBB.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

