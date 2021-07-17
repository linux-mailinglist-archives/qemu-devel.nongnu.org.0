Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 584AE3CC510
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 19:51:37 +0200 (CEST)
Received: from localhost ([::1]:42396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4oTO-0005pY-HZ
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 13:51:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m4oSJ-0004zP-Ch
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 13:50:27 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:50789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m4oSG-0007UC-7e
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 13:50:26 -0400
Received: by mail-wm1-x32e.google.com with SMTP id l6so7731480wmq.0
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 10:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=VUdAUc0tz6jxS14zwzrL8oMchso3MfmwT7AIiZx6BG0=;
 b=ArJQOTaekmPkIiFUk8D6RSinh+uAXvx2BFFY+L2wJU3zPKyZSStXqB7OgdIXBlecGY
 QZF4uP2WOL58tNyfVddpA0hhFBd8ie5Obc/s8OMKWeSxhD9T3D2kyhxMzDXp9wRGW2Rn
 kOa/cU2ATopR3A4bjYkuLkhZyOhsmyU/16sQMQKwgq5ASBsMg9iJKMw0xk/QPWlRNxq+
 PT2fyxpW1hwebpDLqnX/X+OoNFX4Qhhgr6WnyabpA+C7sepIDflm5vRBZ/aGwz74NTyU
 zPKEYiJpjn65qlTn2ZL6jYmwF/Uvrjhk/3cVJq6M79sIHgIFke6+ScNKnBLL1JjYczst
 NKnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=VUdAUc0tz6jxS14zwzrL8oMchso3MfmwT7AIiZx6BG0=;
 b=MZc7aTec4wL8tpYvE8kvhB6YWk1PH7EcpP39DVSfu+Jbdg3+JFXW+m9X9oikP3xlnr
 kg8TOWAQGcIpnLHwkA7I/Urgj6bVvWR+C2YL3tMtCN0viz292xWsWWYentl2Rd3Jh26a
 ZywFZhYE+sau4bgJLzguEQsRqC/xJzcgTaf0bV4paN7oE8UeZhWbTkYitTCXYNBrEZhv
 kjfHuji4vtKnYfScztTCRbYC0niHPDuNJq2woMaXgW55KK4sQUJYdAkCUtrwc5Q7eqSY
 sYnunz9t0pEWoNXRzqpFC593YjUfHnSZl9nHV+0UpFIvTHx4ahhO6yONQJZcs3gV5XsI
 fe7w==
X-Gm-Message-State: AOAM5328gDz/JLD34DEpeqWZjnmirpc7VFhJttthiIW+qKfxUzmoJhCp
 8ed74fxrEc9LFrRUc8hJnRHkFg==
X-Google-Smtp-Source: ABdhPJzP1uTjtcDhMdOOR4xoLXvOv9Cz282q85rzsqR7pJdop1A6eZucD/ofieoVWp/veI6XUY8hug==
X-Received: by 2002:a05:600c:214a:: with SMTP id
 v10mr22399595wml.17.1626544222795; 
 Sat, 17 Jul 2021 10:50:22 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m6sm18601872wrw.9.2021.07.17.10.50.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jul 2021 10:50:22 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 778451FF7E;
 Sat, 17 Jul 2021 18:50:21 +0100 (BST)
References: <20210712154004.1410832-1-richard.henderson@linaro.org>
 <20210712154004.1410832-10-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 09/10] accel/tcg: Hoist tb_cflags to a local in
 translator_loop
Date: Sat, 17 Jul 2021 18:50:16 +0100
In-reply-to: <20210712154004.1410832-10-richard.henderson@linaro.org>
Message-ID: <874kcs3k4i.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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
Cc: mark.cave-ayland@ilande.co.uk, qemu-devel@nongnu.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> The access internal to tb_cflags() is atomic.
> Avoid re-reading it as such for the multiple uses.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

