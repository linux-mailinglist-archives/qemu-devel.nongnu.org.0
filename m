Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C39962967E
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 11:57:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1outbb-0000Kd-U1; Tue, 15 Nov 2022 05:55:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1outbX-0000KN-AK
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 05:55:48 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1outbV-0007FP-TL
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 05:55:47 -0500
Received: by mail-pj1-x102c.google.com with SMTP id b11so12993343pjp.2
 for <qemu-devel@nongnu.org>; Tue, 15 Nov 2022 02:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ilae6EJHd0JOvbCn47mo6j+e1JeeTiYhirJZLywve7s=;
 b=ibOjyYOf/6Z6YiAHLqrACa/hnd+kBMNsqJdLzTPPqvio4IYtXr/QCpxkUEhcpkZLnB
 qKzVR4nVuY7b06J6jU6S5sK0knEFEkaqNCm/+VLhDeGYZw8wDiyj4gsVxZ7vyMLcxG1P
 BpvPVCjmQKk+oOhw9ki90IFafCImh/uU6CtdYSRyWGvaCmS7Yx0mR9kQeUtnyBz25xsE
 isg6rWO4WbgIY4Bejzk8Mjw8Hd3CA43aKuRDgzbd0/gAbcaTWIzmXJUcfZzWaMqa6VAD
 OSiyv27mIQORLVCfL/CBCcmQj/1OJjll5bSDtWIWKEoKI/A6L0sTtJS3/cRpDxFMl/uE
 Mb5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ilae6EJHd0JOvbCn47mo6j+e1JeeTiYhirJZLywve7s=;
 b=fpEkOKnHU5QjYlgS8Rxkev1iSt+iK7XWioDYZ8dpvamen+filYi3KdQAI8O27Kd/7P
 Gdlj1jo03Pzo9MbiPuve5uTv7xDI8KHHVh3DvLbXO0XI5OBYKeDhBPVbwCAigYqlWY/x
 yXF5UzbRA5mRrYlhacqYpRyZAXFKnR/UiiyuZ2By3SvTGJy3DzeYkvyfq/z5O5oIScbw
 znT3K/WSV2c3Ohx9WiMVXHQKxu4CBZBijKdWBqV+YMtlK/bky5bh3rS3ud54eCROnhJ9
 WIiK+2Rpm0fplFA1CV42C+u2Jx7o/F7LuMbzsJ/pwWB2tuZcBi+yRDUSnuaswPEALByy
 +1IA==
X-Gm-Message-State: ANoB5pnY7h/OGogfjMdCSsz804HQKYs8E4kq0RWRyFtHISvhOJVZxkr/
 t2jHtKdwRvOpiiGJcYjt7sH/ppApySr/jfwmjxTcAA==
X-Google-Smtp-Source: AA0mqf6Q0rwE93N3Re+laxjhnoDhaVF1soYKMz5Sl6WF6DYBtDLiGp9wDUO8mBz2ZPOYLtBQks11lXGUNo90bIZWVZY=
X-Received: by 2002:a17:90a:bd0a:b0:212:f169:140e with SMTP id
 y10-20020a17090abd0a00b00212f169140emr1552924pjr.215.1668509742804; Tue, 15
 Nov 2022 02:55:42 -0800 (PST)
MIME-Version: 1.0
References: <20221115071935.1020799-1-sw@weilnetz.de>
In-Reply-To: <20221115071935.1020799-1-sw@weilnetz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Nov 2022 10:55:30 +0000
Message-ID: <CAFEAcA_SHaP-pPLEA_RKaF9L-9gdyG-XZ+hDuzDEKVqPQ1fbaA@mail.gmail.com>
Subject: Re: [PATCH for-7.2] Add G_GNUC_PRINTF to function qemu_set_info_str
 and fix related issues
To: Stefan Weil <sw@weilnetz.de>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102c.google.com
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

On Tue, 15 Nov 2022 at 07:20, Stefan Weil via <qemu-devel@nongnu.org> wrote:
>
> With the G_GNUC_PRINTF function attribute the compiler detects
> two potential insecure format strings:
>
> ../../../net/stream.c:248:31: warning: format string is not a string literal (potentially insecure) [-Wformat-security]
>     qemu_set_info_str(&s->nc, uri);
>                               ^~~
> ../../../net/stream.c:322:31: warning: format string is not a string literal (potentially insecure) [-Wformat-security]
>     qemu_set_info_str(&s->nc, uri);
>                               ^~~
>
> There are also two other warnings:
>
> ../../../net/socket.c:182:35: warning: zero-length gnu_printf format string [-Wformat-zero-length]
>   182 |         qemu_set_info_str(&s->nc, "");
>       |                                   ^~
> ../../../net/stream.c:170:35: warning: zero-length gnu_printf format string [-Wformat-zero-length]
>   170 |         qemu_set_info_str(&s->nc, "");
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

