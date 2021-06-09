Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B68803A102C
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 12:37:46 +0200 (CEST)
Received: from localhost ([::1]:37466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqvaj-00085S-Qp
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 06:37:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqvXh-0004p5-1p
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 06:34:37 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:55156)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqvXf-0008Ux-I8
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 06:34:36 -0400
Received: by mail-wm1-x32f.google.com with SMTP id o127so3682202wmo.4
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 03:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=k2ApNm7J8CSy0tn91OsEnv2+MJ8lUIdSMq7Sz9t75Cs=;
 b=JIJe3LY2P9ebHkFvgVXRX7qTeYg8aknjbWEtg/KZvzXkFo9f9zAhViCJwXjpuxWxCn
 aO7XYYVaZtOss/QXvzf4uBlkC8bCmyfUztlDk1B62LTgjPW826jhqfp5Zx5cCDLtBNAc
 D99fNcoXD+Nn3/Kbzr+iVO50Tx6lwz8C5owCnRzceGH8vtrEGl2v0s5r/xMRw1+L/pjt
 AJP3dZoO2dvOEJhQDUTr0JCQxKXCMyrPS0FYxL5RSz9TtcDrJHjzaVJeh3XGgB0yMINT
 jAquK+3UxLy+K9MvUE5NUdy6auOTujHGO2QTYi8Uc21vs+3xomWp8rHtJQiR/wvMgmIZ
 6ZCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=k2ApNm7J8CSy0tn91OsEnv2+MJ8lUIdSMq7Sz9t75Cs=;
 b=HB9g64XQBz3N5a+nbLUZCdZqsG8+MzF8tDIjATM3wO37EHHRlP1arypOiaEckQIy0f
 AQD+a367rZaw9Exr6Fjerlsr0coP3GLSWJ5eJFl8ebsgB3dT/yxm7jjQL54717TgSQp1
 Xh8R06y3xPgOAJC9Wn6JxRx8GdNlJbB7mxY/24WPkZZSjU9t21gl8drRiKMYqjk81td5
 L4AEVTyVMVIlhz/cgPApQe2j9U+Tqpx+Y/HiTC5SrUOf28tnhob7+k3JWKjx36BZc8L8
 8heS80zgVE3N0O6QFLKZ+YbFPm4mNs/T23KKv00Pj2//xYoE2Jha6n2XIP5/vU1meGIk
 hyuQ==
X-Gm-Message-State: AOAM532aNSoECbULTVVejFwh3sxQq3kD2SglKF+tdkGvwKVZIrPG+Sr5
 MBlHVt94j9DRST0SGoZYMsFVTg==
X-Google-Smtp-Source: ABdhPJw/kgVEn7FRmuCYa5U/H0cAxB1IDlfHbSwHK6veZmjMCdjv7zdKmWAvsO74x3AmJu/CialfLg==
X-Received: by 2002:a7b:c19a:: with SMTP id y26mr8991038wmi.132.1623234874058; 
 Wed, 09 Jun 2021 03:34:34 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h9sm20085658wmb.35.2021.06.09.03.34.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 03:34:32 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 693431FF7E;
 Wed,  9 Jun 2021 11:34:32 +0100 (BST)
References: <20210502231844.1977630-1-richard.henderson@linaro.org>
 <20210502231844.1977630-25-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 24/28] util/osdep: Add qemu_mprotect_rw
Date: Wed, 09 Jun 2021 11:34:27 +0100
In-reply-to: <20210502231844.1977630-25-richard.henderson@linaro.org>
Message-ID: <87eedbjphj.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> For --enable-tcg-interpreter on Windows, we will need this.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

