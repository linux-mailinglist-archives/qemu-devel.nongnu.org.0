Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1991669D0B6
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 16:34:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU8BS-0005VZ-4d; Mon, 20 Feb 2023 10:34:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pU8BL-0005Na-LX
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 10:34:26 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pU8BJ-0006ep-Rr
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 10:34:23 -0500
Received: by mail-wr1-x431.google.com with SMTP id t15so1737123wrz.7
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 07:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6UOdn3iCEP/AucTZvcMzpdCzOxEbgd0rNuq5SN8ncSM=;
 b=BhGLVxT7CRG7GQr6gsmL9NWnP9mArf/O0sE654MpL9X6W1lilbbzoJT2z1Ax4LPP9L
 phSRyV1Dl9DQemsaB7HK3Vo/mkDk5/CQQFa7r2ZMF9+ng/yduCugxSH4oBLiSc8YpYEq
 cIgujCWI5MzjN2wROW1epELRn28txEpm+Yh8nNdLoeyA1MmJv3sA/Kqgy12luHUfChqw
 WfB7h58/dnqbXBhLtIvlkbVf6MskjOV7dIASP1HzGOUbGTVk99qaNUi8PxWTU45owsUm
 ePtJwCXk7oRKUMynTCYf+bNnbhyOX51ObCzadhqw29Ju5Jav1xN88cRIaM4LK7UYb4KT
 6+ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=6UOdn3iCEP/AucTZvcMzpdCzOxEbgd0rNuq5SN8ncSM=;
 b=2vdlGzkZkjSCaLl2PncIOYlmaT2ktlU0SfLSTAK/0Nvvvmrn3Wfw2gUtnVQbaPYGR2
 ArjVz3ldW+sI07+qv/201kYX498YZOH0J9eON1uB9gdc7l85/z81J+neuI8UNWBuRGF2
 GbZ1A6V0i4v0mHKH1xNNjk3BpjM/c26bXVcuFEVdkqughhdz5SU4VqqWWTr0uyLQndzL
 JQovNhnUOSRtVA2GJgJqEHNX1LEsw30pJ6zAzDgEYxek+tQzCi3gnF7wMr9z6SmS/wMq
 p2GhEa63rw40vypeGIXuMhLX+JwzpFYYUeYP07pMi0tWyu9p2RCCQIhqFa0zlWmTjczL
 nj1Q==
X-Gm-Message-State: AO0yUKU1jSog5BR6gstqhLxkNwN3w8cUpNQGUER/uUD+XVvSjyiO65j1
 /p98RmwR5asWHHb5z0QEf673Dw==
X-Google-Smtp-Source: AK7set8dGIPBO7a1LZNXsuO949bvE/8OwPMwr/aW4BAhTr9O2BflvwKNxhT/r4Nlyesh04mh6vR/8g==
X-Received: by 2002:a5d:4c82:0:b0:2c5:7c25:5e11 with SMTP id
 z2-20020a5d4c82000000b002c57c255e11mr118648wrs.45.1676907259223; 
 Mon, 20 Feb 2023 07:34:19 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 u7-20020a05600c19c700b003e21f20b646sm1759404wmq.21.2023.02.20.07.34.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 07:34:18 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9642C1FFB7;
 Mon, 20 Feb 2023 15:34:18 +0000 (GMT)
References: <20230220115114.25237-1-philmd@linaro.org>
 <20230220115114.25237-8-philmd@linaro.org>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Markus
 Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, =?utf-8?Q?Marc-Andr=C3=A9?=
 Lureau <marcandre.lureau@redhat.com>, "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH 7/8] hw/timer/cmsdk-apb-timer: Remove unused
 'qdev-properties.h' header
Date: Mon, 20 Feb 2023 15:34:15 +0000
In-reply-to: <20230220115114.25237-8-philmd@linaro.org>
Message-ID: <878rgss64l.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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

> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

