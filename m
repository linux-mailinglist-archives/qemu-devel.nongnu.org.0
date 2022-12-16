Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B69AF64EB34
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 13:08:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p69VO-0000Av-DS; Fri, 16 Dec 2022 07:08:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p69VK-000093-Kb
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 07:07:54 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p69VJ-00034S-3a
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 07:07:54 -0500
Received: by mail-wr1-x42f.google.com with SMTP id co23so2290689wrb.4
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 04:07:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fVh1RUgigRyFvF/rOp87GFV/wxuAAIchBYeET9gaIPk=;
 b=yqAlgSoJTPP+ungZby7Evef2Tw5Dmsw2zux5UqpYElglCniVT758/z4VXPNYTb8vl+
 eAU4wh1UuYzynG6U09edR2mSKNVDAB27dRzieiKpupI4C7fdJG6TBAZv8rNX5cb4nFTc
 boEJs2cdcp+8ElZZAT6zMFY8TW+PE6DpT4PJYidejebvriIN88U2pzTc0B+S5y9ennsp
 ogOb/jRlnYP68w1olh1m/dw/fC5jMjSN25QGLKmMVFTKCoFfmZ0SBHPM2Xvx5534sP02
 DvATIzitNxGi9k7vb44+8owZxFX+srasN1JM6NDgpdORCO+0fL7a8I++OoCcJDYSdkFs
 bjNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=fVh1RUgigRyFvF/rOp87GFV/wxuAAIchBYeET9gaIPk=;
 b=aMiVADimdQAavFck0EI11q42OZ0YW+mvOb9d7//Ob04/FrvwUqZHoM+yxqT3r6QgQ0
 xKraBgYPCnR77xV/MUCJCO5rl/rcNts/zYglNzrmPCSdOfHlA+l1z9UccSkeTz5jAznf
 nRUVoWWQDHDpWGYy9gipNIzVszYIyeGcS0CnV0aSUXw7viQC7TXdPV6um0Oxu86vMXIu
 7tXQ4VSxf6E8eO9tdK5pWP9iWJLdVs0u9Fm5rmz/J5WYmY6pET2cqj0PSY7zOVqs/ubF
 5F4TIUNUjSeu9b2ikh9EHdDmm24N1FDCFdLpF5IAIPJ5dKyaDGG1Gy7pb6rDQNODlDdX
 TeBA==
X-Gm-Message-State: ANoB5pkKJ9R5WIFYE7YZm0ifpqJMD7drzBDWc+9958amL+Gio9Jw891f
 2rlMCxI5BiREOrFMlIuWR/UeYA==
X-Google-Smtp-Source: AA0mqf6xvS6UFgM+Jm5/+E1ZxWriC8Z1JzIwscZ+DRTWYsE+cNbaD71bsWR4Mirt+fkSNyblZiA3cQ==
X-Received: by 2002:a05:6000:170f:b0:253:62af:8025 with SMTP id
 n15-20020a056000170f00b0025362af8025mr11748231wrc.61.1671192471576; 
 Fri, 16 Dec 2022 04:07:51 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 c3-20020a5d5283000000b0024206ed539fsm2128912wrv.66.2022.12.16.04.07.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 04:07:51 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CA70B1FFB7;
 Fri, 16 Dec 2022 12:07:50 +0000 (GMT)
References: <20221209093649.43738-1-philmd@linaro.org>
 <20221209093649.43738-2-philmd@linaro.org>
User-agent: mu4e 1.9.6; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH-for-8.0 1/5] accel/tcg: Restrict cpu_io_recompile() to
 system emulation
Date: Fri, 16 Dec 2022 12:07:46 +0000
In-reply-to: <20221209093649.43738-2-philmd@linaro.org>
Message-ID: <87wn6rh7qh.fsf@linaro.org>
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


Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> Missed in commit 6526919224 ("accel/tcg: Restrict cpu_io_recompile()
> from other accelerators").
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

